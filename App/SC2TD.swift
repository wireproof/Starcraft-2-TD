import SwiftUI

struct Enemy: Identifiable {
    let id = UUID()
    var progress: Double = 0
    var hp: Double
    var maxHP: Double
    var slow: Double = 1
}
struct Tower: Identifiable {
    let id = UUID()
    let point: CGPoint
    let kind: Int
    var level = 0
    var cooldown: Double = 0
}
final class Game: ObservableObject {
    let names = ["SNIPER", "LASER", "MISSILE", "FREEZE", "GATLING"]
    let costs = [200,300,250,150,90]
    let colors: [Color] = [.orange,.green,.red,.cyan,.yellow]
    @Published var money = 350
    @Published var loss = 0
    @Published var wave = 0
    @Published var towers: [Tower] = []
    @Published var enemies: [Enemy] = []
    @Published var selection = 4
    @Published var selectedTower: UUID?
    @Published var running = false
    @Published var message = "Experimental prototype • Select a tower, tap the field, then start a wave"
    private var remaining = 0
    private var spawnTimer = 0.0
    private var last = Date()
    private let path = originalPath
    func location(_ progress: Double) -> CGPoint {
        let v = max(0, min(progress, Double(path.count - 1)))
        let a = min(Int(v), path.count - 2), f = v - Double(a)
        return CGPoint(x: path[a].x + (path[a+1].x-path[a].x)*f, y: path[a].y + (path[a+1].y-path[a].y)*f)
    }
    func place(_ p: CGPoint) {
        if let t = towers.first(where: { hypot($0.point.x-p.x,$0.point.y-p.y) < 35 }) { selectedTower = t.id; return }
        guard !running || loss < 40 else { return }
        guard money >= costs[selection] else { message = "Not enough credits"; return }
        guard !path.contains(where: { hypot($0.x-p.x,$0.y-p.y) < 35 }) else { message = "Place towers away from the road"; return }
        money -= costs[selection]; towers.append(Tower(point:p,kind:selection)); selectedTower = towers.last?.id
        message = "Tower placed. Select it to upgrade or sell."
    }
    func upgrade() {
        guard let i = towers.firstIndex(where: {$0.id == selectedTower}) else { return }
        let price = costs[towers[i].kind] * (towers[i].level+1) / 2
        guard towers[i].level < 4, money >= price else { message = "Upgrade unavailable"; return }
        money -= price; towers[i].level += 1
    }
    func sell() {
        guard let i = towers.firstIndex(where: {$0.id == selectedTower}) else { return }
        money += costs[towers[i].kind] * 3 / 4; towers.remove(at:i); selectedTower = nil
    }
    func nextWave() {
        guard !running, loss < 40 else { return }
        wave += 1; remaining = 5 + wave * 3; spawnTimer = 0; running = true; last = Date()
        message = "Wave \(wave): prototype wave composition"
    }
    func reset() { money=350; loss=0; wave=0; towers=[]; enemies=[]; running=false; remaining=0; selectedTower=nil; message="Experimental prototype • Start a wave when ready" }
    func tick() {
        let now=Date(), dt=min(now.timeIntervalSince(last),0.08); last=now
        guard running else { return }
        spawnTimer -= dt
        if remaining > 0 && spawnTimer <= 0 { let hp=200.0 * pow(1.25,Double(wave-1)); enemies.append(Enemy(hp:hp,maxHP:hp)); remaining -= 1; spawnTimer=0.8 }
        for i in enemies.indices { enemies[i].progress += dt * 4 * enemies[i].slow; enemies[i].slow=1 }
        for t in towers.indices {
            towers[t].cooldown -= dt
            guard towers[t].cooldown <= 0 else { continue }
            let kind=towers[t].kind, position=towers[t].point
            let radius: [CGFloat] = [160,115,125,110,100]
            if let e = enemies.indices.filter({ hypot(location(enemies[$0].progress).x-position.x,location(enemies[$0].progress).y-position.y) < radius[kind] }).max(by:{ enemies[$0].progress < enemies[$1].progress }) {
                let damage: [Double] = [800,24,230,8,65]
                if kind == 3 { enemies[e].slow = 0.55 }
                enemies[e].hp -= damage[kind] * pow(1.6,Double(towers[t].level))
                towers[t].cooldown = [4.0,0.25,0.75,0.3,0.33][kind]
            }
        }
        let killed = enemies.filter { $0.hp <= 0 }.count
        let escaped = enemies.filter { $0.hp > 0 && $0.progress >= Double(path.count-1) }.count
        money += killed * 4; loss += escaped
        enemies.removeAll { $0.hp <= 0 || $0.progress >= Double(path.count-1) }
        if loss >= 40 { running=false; message="Base lost • Reset to play again" }
        else if remaining == 0 && enemies.isEmpty { running=false; message="Wave cleared • Start the next wave" }
    }
}
@main struct SC2TDApp: App { var body: some Scene { WindowGroup { GameView().preferredColorScheme(.dark) } } }
struct GameView: View {
    @StateObject var game=Game()
    let timer=Timer.publish(every: 1.0/30, on:.main, in:.common).autoconnect()
    var body: some View {
        GeometryReader { g in
            HStack(spacing:8) {
                VStack(spacing:4) {
                    HStack { Text("SC2 TD  •  PROTOTYPE").bold(); Spacer(); Text("CREDITS \(game.money)   WAVE \(game.wave)   LOST \(game.loss)/40") }.font(.system(size:13,weight:.semibold,design:.monospaced))
                    GeometryReader { field in
                        let sx=field.size.width/1000, sy=field.size.height/600
                        Canvas { context, size in
                            context.fill(Path(CGRect(origin:.zero,size:size)),with:.color(Color(red:0.16,green:0.12,blue:0.09)))
                            var road=Path(); for (i,p) in originalPath.enumerated() { let pt=CGPoint(x:p.x*sx,y:p.y*sy); if i==0 { road.move(to:pt) } else { road.addLine(to:pt) } }
                            context.stroke(road,with:.color(.black.opacity(0.5)),style:StrokeStyle(lineWidth:60*min(sx,sy),lineCap:.round,lineJoin:.round))
                            context.stroke(road,with:.color(.brown.opacity(0.9)),style:StrokeStyle(lineWidth:43*min(sx,sy),lineCap:.round,lineJoin:.round))
                            for t in game.towers { let x=t.point.x*sx,y=t.point.y*sy,r=20*min(sx,sy); let rect=CGRect(x:x-r,y:y-r,width:r*2,height:r*2); context.fill(Path(ellipseIn:rect),with:.color(game.colors[t.kind])); if game.selectedTower==t.id {context.stroke(Path(ellipseIn:rect.insetBy(dx:-3,dy:-3)),with:.color(.white),lineWidth:2)} }
                            for e in game.enemies { let p=game.location(e.progress), x=p.x*sx,y=p.y*sy,r=9*min(sx,sy); context.fill(Path(ellipseIn:CGRect(x:x-r,y:y-r,width:r*2,height:r*2)),with:.color(.red)); context.fill(Path(CGRect(x:x-r,y:y-r-5,width:r*2*max(0,e.hp/e.maxHP),height:3)),with:.color(.green)) }
                        }.contentShape(Rectangle()).gesture(SpatialTapGesture().onEnded { game.place(CGPoint(x:$0.location.x/sx,y:$0.location.y/sy)) })
                    }.clipShape(RoundedRectangle(cornerRadius:8))
                    Text(game.message).font(.caption).lineLimit(1).frame(maxWidth:.infinity,alignment:.leading)
                }
                VStack(spacing:5) {
                    ForEach(0..<5,id:\.self) { i in Button { game.selection=i; game.selectedTower=nil } label: { HStack { Circle().fill(game.colors[i]).frame(width:11,height:11); Text(game.names[i]); Spacer(); Text("$\(game.costs[i])") }.font(.system(size:11,weight:.bold,design:.monospaced)).padding(6).background(game.selection==i ? Color.green.opacity(0.35) : Color.white.opacity(0.08)).cornerRadius(5) } }
                    HStack { Button("UPGRADE") {game.upgrade()}; Button("SELL") {game.sell()} }.font(.caption2)
                    Button(game.running ? "WAVE ACTIVE" : "START WAVE") {game.nextWave()}.buttonStyle(.borderedProminent).tint(.green).disabled(game.running)
                    HStack { Button("+$1000") {game.money += 1000}; Button("RESET") {game.reset()} }.font(.caption2)
                    Text("Experimental balance and waves").font(.caption2).foregroundStyle(.secondary)
                }.frame(width:min(190,g.size.width*0.3))
            }.padding(8).background(Color(red:0.025,green:0.06,blue:0.045))
        }.onReceive(timer) { _ in game.tick() }
    }
}
