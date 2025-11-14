//
//  main.swift
//  rpg
//
//  Created by DANIEL DOS ANJOS NOGUEIRA on 14/11/25.
//

import Foundation
var hpJogador = 50
var hpMax = 50
var defJogador = 12
var lvl = 1
var lvlInimigo = 0
var xp = 0
var xpGanho = 0
var moedas = 20
var moedasGanhas = 0
var nomeInimigo = ""
print("=== Bem-vindo(a) à 2135 🔮 ===")
print("Batalhe contra linguagens de programação, suba de nível e adquira itens para fortalecer sua jornada!")
var firstTime = true
while true {
    if dado(d: 5) == 1 {
        nomeInimigo = "Swift"
    } else if dado(d: 5) == 2 {
        nomeInimigo = "Java"
    } else if dado(d: 5) == 3 {
        nomeInimigo = "C#"
    } else if dado(d: 5) == 4 {
        nomeInimigo = "JavaScript"
    } else {
        nomeInimigo = "Python"
    }
    
    hpMax = lvl * 10
    
    if xp >= 100 {
        lvl += 1
        xp -= 100
        hpJogador = hpMax
    }
    if lvl >= 5 {
        lvlInimigo = Int.random(in: -2...2) + lvl
    } else {
        lvlInimigo = lvl
    }
    
    if lvlInimigo - lvl > 0 {
        xpGanho = 50
    } else if lvlInimigo == lvl {
        xpGanho = 30
    } else {
        xpGanho = 10
    }
    
    moedasGanhas = Int.random(in: 20...35)

    if !firstTime {
        print("=== Bem-vindo(a) de volta! ===")
    }
    firstTime = false
    print("❤️ Pontos de vida: \(hpJogador) | 📊 Nível: \(lvl) (XP: \(xp)/100) | 💵 Suas moedas: \(moedas)")
    
    print("1 - ⚔️ Batalhar contra \(nomeInimigo) (Nível \(lvlInimigo) || Recompensas: +\(xpGanho) XP e +\(moedasGanhas) moedas")
    print("2 - 🛒 Comprar itens")
    print("3 - 🛑 Sair (Seu progresso será perdido)")
    var opc: Int = Int(readLine() ?? "") ?? 0
    while (opc < 1 || opc > 3) {
        print("Opção inválida! Tente novamente")
        print("1 - ⚔️ Batalhar contra \(nomeInimigo) || Recompensas: +\(xpGanho) XP e +\(moedasGanhas) moedas")
        print("2 - 🛒 Comprar itens")
        print("3 - 🛑 Sair (Seu progresso será perdido)")
        opc = Int(readLine() ?? "") ?? 0
    }
    switch opc{
    case 1:
        let results = batalha(hpJogador: hpJogador, hpMax: hpMax defJogador: defJogador, hpInimigo: 100, defInimigo: 8, nomeInimigo: nomeInimigo, moedasGanhas: moedasGanhas, xp: xpGanho)
        xp += results.xp
        moedas += results.moedasGanhas
    case 2:
        print("Loja")
    case 3:
        print("Saindo do programa...")
        exit(0)
    default:
        print("Inválido")
    }
}

func batalha(hpJogador: Int, hpMax: Int, defJogador: Int, hpInimigo: Int, defInimigo: Int, nomeInimigo: String, moedasGanhas: Int, xp: Int) -> (hpJogador: Int, moedasGanhas: Int, xp: Int){
    var hpJogador = hpJogador
    var hpInimigo = hpInimigo
    let moedasGanhas = moedasGanhas
    let xp = xp
    var danoRecebido = 0
    var atk = 0
    var dmg = 0
    var qtdCura = 3
    
    print("=== 💥 Início da Batalha 💥 ===")
    print("Você enfrentará \(nomeInimigo)")
    
    while hpJogador > 0 && hpInimigo > 0 {
        print("=== 🫵 Seu turno 🫵 ===")
        print("❤️ Pontos de vida: \(hpJogador)")
        print("1 - ⚔️ Atacar")
        print("2 - 🧪 Curar (\(qtdCura) restantes)")
        print("3 - ⏳ Aguardar")
        print("Digite uma opção: ")
        var opc: Int = Int(readLine() ?? "") ?? 0
        while (opc < 1 || opc > 3) {
            print("Opção inválida! Tente novamente")
            print("1 - ⚔️ Atacar")
            print("2 - 🧪 Curar")
            print("3 - ⏳ Aguardar")
            print("Digite uma opção: ")
            opc = Int(readLine() ?? "") ?? 0
        }
        switch opc {
        case 1:
            print("~~~ ⚔️ Você escolhe atacar \(nomeInimigo)...")
            atk = dado(d: 20)
            dmg = 0
            if atk > defInimigo {
                if atk == 20 {
                    dmg = 2*dado(d: 8)
                    hpInimigo -= dmg
                    print("⚔️💥 Você acertou críticamente, resultando em \(dmg) de dano!")
                } else {
                    dmg = dado(d: 8)
                    hpInimigo -= dmg
                    print("⚔️✅ Você acertou e causou \(dmg) de dano!")
                }
            } else {
                if atk == 1 {
                    danoRecebido = dado(d: 4)
                    hpJogador -= danoRecebido
                    print("⚔️🤦‍♂️ Você errou catastroficamente e caiu tentando atacar! Você recebe \(danoRecebido)")
                } else {
                    print("⚔️❌ Você errou o ataque!")
                }
            }
        case 2:
            qtdCura -= 1
            let cura = dado(d: 10)
            
            hpJogador += cura
            print("Você curou \(cura) pontos de vida")
        case 3:
            print("Você decide esperar...")
        default:
            print("Opção inválida")
        }
        
        if hpInimigo > 0 {
            print("=== ⚔️ Vez de \(nomeInimigo) ⚔️ ===")
            atk = dado(d: 20)
            dmg = 0
            if atk > defJogador {
                if atk == 20 {
                    dmg = 2*dado(d: 8)
                    hpJogador -= dmg
                    print("\(nomeInimigo) acertou críticamente, você recebe \(dmg) de dano!")
                } else {
                    dmg = dado(d: 8)
                    hpJogador -= dmg
                    print("\(nomeInimigo) acertou e causou \(dmg) de dano em você!")
                }
            } else {
                print("\(nomeInimigo) errou o ataque!")
            }
        }
        hpInimigo = 0
    }
    
    if hpJogador <= 0 {
        print("🪦 Você foi derrotado! Seu caminho acaba aqui...")
        exit(0)
    } else {
        print("🎆 Você derrotou \(nomeInimigo) 🎆")
        print("+\(xp) XP")
        print("+\(moedasGanhas) moedas")
    }
    
    return(hpJogador: hpJogador, moedasGanhas: moedasGanhas, xp:xp)
}

func dado(d: Int) -> Int {
    return Int.random(in: 1...d)
}
