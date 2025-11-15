//
//  Series.swift
//  TV Time Recreation
//
//  Created by Rosario d'Antonio on 07/11/25.
//

import Foundation
import Combine

struct Series: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var name: String = ""
    var description: String = ""
    var dayOfRelease: Int
    var seasons: Int = 1
    var episodes: [Int] = [24]
    var watchedEpisodes: Int = 13
    
    func isFinished() -> Bool {
        let totalEps = episodes.prefix(seasons).reduce(0, +)
        
        return watchedEpisodes == totalEps
    }
    
}


class SeriesList: Codable {
    
    var series: [Series] = [
        Series(name: "SPYxFAMILY", description: "Twilight, una delle migliori spie al mondo, ha trascorso la vita ad affrontare missioni sotto copertura per rendere il mondo un posto migliore. Un giorno però riceve un compito particolarmente difficile, per riuscire nella sua nuova missione dovrà formare una famiglia temporanea e iniziare una nuova vita! Si uniranno a lui, infatti, la bella e misteriosa Yor e Anya, una bambina molto speciale...", dayOfRelease: 1, watchedEpisodes: 2),
        Series(name: "InuYasha", description: "Kagome, una normale studentessa che frequenta la terza media, cade nel pozzo di casa sua e viene riportata indietro di 500 anni, nell'epoca Sengoku. In quest'epoca Kagome scopre di essere la reincarnazione di Kikyo, una sacerdotessa vissuta cinquant'anni prima incaricata di custodire la preziosa sfera dei quattro spiriti, gioiello in grado di accrescere il potere di demoni e altre creature maligne. È l'inizio di un lungo viaggio per Kagome che, insieme al mezzodemone Inuyasha, dovrà viaggiare per evitare che demoni e malvagi entrino in possesso del potere della sfera.", dayOfRelease: 2),
        Series(name: "Helluva-Boss", description: "Ambientata nello stesso universo di 'Hazbin Hotel' seguiremo le avventure dei dipendenti della I.M.P, una compagnia di assissini. Il gruppo è formato dal capo Blitzø, dall'esperto di armi Moxxie, dall'energica assassina Millie e dalla segretaria Loona. Con l'aiuto dell'antico libro ricevuto in prestito da un demone del goetia chiamato Stolas potranno entrare nel mondo dei vivi per svolgere le loro missioni.", dayOfRelease: 3, watchedEpisodes: 4),
        Series(name: "Gachiakuta", description: "Rudo è un ragazzo che vive nei bassifondi di una città che galleggia nel cielo, dove i poveri sono costretti a vivere nell'ombra mentre i ricchi vivono una vita sontuosa gettando la loro spazzatura nell'abisso. Un giorno, quando viene falsamente accusato di un grave crimine, riceve una punizione inimmaginabile: l'esilio nell'abisso. Sulla superficie i rifiuti dell'umanità si sono tramutati in pericolosi mostri e Rudo, se vuole scoprire la verità e vendicarsi di coloro che l'hanno gettato in questo inferno, dovrà padroneggiare un misterioso potere e diventare un guerriero...", dayOfRelease: 1),
        Series(name: "Fruits-Basket", description: "Dopo la morte della madre, la dolce Toru Honda va a vivere nella casa del nonno. A causa di alcuni problemi si trova però costretta a lasciare l'abitazione, e decisa ad andare avanti con le sue forze, inizia a vivere in una tenda in un bosco. La positività della ragazza non basta però a fermare le sciagure e un tifone spazza via la sua 'casa'. Nel momento di maggior sconforto è Yuki Soma ad aiutarla, un compagno di scuola detto 'principe' per via del suo bell'aspetto e i modi raffinati. Yuki le propone di trovare sistemazione nella casa in cui vive con dei parenti: Shigure, romanziere brillante, e Kyo, un ragazzo introverso con il quale ha un pessimo rapporto. Toru accetta la gentilezza del compagno ma scopre ben presto il segreto di casa Soma: se i membri della famiglia vengono abbracciati da una persona di sesso opposto, si trasformano nei dodici animali dello zodiaco cinese! Anche se a prima vista la cosa potrebbe apparire divertente, si tratta in realtà di un'oscura maledizione a cui sembra impossibile sottrarsi.", dayOfRelease: 6),
        Series(name: "Cardcaptor-Sakura", description: "Sakura Kinomoto è una studentessa del quarto anno alla scuola elementare privata Tomoeda. Un giorno, aprendo per caso un volume della biblioteca paterna, provoca accidentalmente lo scioglimento del sigillo delle Clow Cards, carte magiche create dal potente stregone anglo-cinese Clow Reed. All'apertura del tomo, da esso fuoriesce la Bestia del Sigillo (Kero-chan/Cerberus), custode del sigillo stesso, il quale si premura di spiegare a Sakura quanto avvenuto alle carte, sparpagliatesi nei dintorni sotto altra forma allo scopo di far danni o semplicemente confusione in ragione delle loro caratteristiche di personalità. Sakura riceve da Kero-chan la Chiave del Sigillo, trasformabile in un bastone/scettro pronunciando l'appropriata formula magica. Comincia così la missione di Sakura, volta a rintracciare le carte disperse e a riportarle al loro vero aspetto. Qualora il compito non venisse svolto, una non meglio precisata catastrofe si abbatterebbe su questo mondo.", dayOfRelease: 4, watchedEpisodes: 6),
        Series(name: "One-Piece", description: "In un mondo quasi interamente coperto dall'acqua e con poche e piccole isole abitate si è fortemente diffusa la pirateria, pratica che riceve un'ulteriore spinta il giorno in cui Gol D. Roger, il re dei pirati, annuncia al mondo intero che ha nascosto un incredibile tesoro, il One Piece. Tra i tanti giovani sognatori che si mettono in viaggio alla ricerca dello One Piece vi è Monkey D. Luffy, giovane allegro e spensierato in possesso di un corpo di gomma, dal momento che da piccolo mangiò uno dei frutti del diavolo, misteriosi frutti in grado di donare incredibili poteri privando tuttavia della capacità di nuotare. La storia inizia con Luffy che, alla deriva in una botte di legno, s'imbatte nella nave della terribile piratessa Alvida, e segue le avventure di Luffy, seriamente intenzionato a diventare il nuovo re dei pirati.", dayOfRelease: 7, seasons: 11, episodes: [90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90], watchedEpisodes: 852),
        Series(name: "BEASTARS", description: "In un mondo popolato da animali antropomorfi, erbivori e carnivori coesistono gli uni con gli altri. Per gli studenti della scuola di Cherryton la vita scolastica è piena di speranze e amori come, tuttavia, di disagio e timore. Il protagonista, il lupo Legoshi, è un membro del club di teatro. Nonostante l'aspetto minaccioso, il giovane ha in realtà una rara gentilezza; per tutta la sua vita è però stato temuto e odiato dagli altri animali a causa dei pregiudizi, a tal punto da esserci ormai abituato. In seguito all'omicidio di uno studente, però, gli erbivori iniziano ad allontanarsi sempre di più dai loro compagni carnivori e questo porterà a un lento cambiamento nella vita scolastica di Legoshi, che inizierà a cercare il suo posto nel mondo.", dayOfRelease: 5,  seasons: 2, episodes: [12, 12], watchedEpisodes: 24),
        Series(name: "Hunter-x-Hunter", description: "Nuovo adattamento dell'omonimo manga di Yoshihiro Togashi, Hunter x Hunter racconta la storia di Gon, un ragazzo dalle mille risorse deciso a diventare Cacciatore per seguire le orme paterne e poter, allo stesso tempo, comprendere meglio il genitore che lo ha abbandonato ancora in fasce. Partito per la prova d'esame da cacciatore, a bordo di una nave Gon fa subito la conoscenza di altri due aspiranti Cacciatori, Leorio e Kurapika, mentre incontra il gioviale Killua e lo spietato Hisoka nelle primissime prove di un esame apparentemente infinito...", dayOfRelease: 6, watchedEpisodes: 8),
        Series(name: "That-Time-I-Got-Reincarnated-as-a-Slime", description: "Un uomo di 37 anni, salaryman e scapolo, dopo essere stato ucciso da un rapinatore in fuga, si ritrova in un nuovo mondo, reincarnato in uno slime cieco, ma con abilità uniche. Con il nuovo nome di 'Rimuru Tempest' inizia così la sua nuova vita in un altro mondo dove dovrà affrontare molte sfide ma avrà anche l'opportunità di incontrare un sempre più crescente numero di seguaci.", dayOfRelease: 5, watchedEpisodes: 16),
        Series(name: "Santo-Vive", dayOfRelease: 1, watchedEpisodes: 24)
    ]
    
    func checkForFinshed() -> Bool {
        for show in series {
            if(show.isFinished()) {
                return true
            }
        }
        return false
    }
    
}

var sharedData = SeriesList()
