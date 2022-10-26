import UIKit
import PlaygroundSupport
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var joke: String = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Text("This is a SwiftUI View from Kiszewski")
            Text(isLoading ? "Carregando" : joke).lineLimit(100).frame(height: 500)
            Button {
                Task {
                    isLoading = true
                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
                    let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data)
                    joke = decodedResponse?.value ?? ""
                    isLoading = false
                }
            } label: {
                Text("Fetch Joke")
            }
        }.padding(12)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Joke: Codable {
    let value: String
}

let viewController = UIHostingController(rootView: ContentView())

PlaygroundPage.current.liveView = viewController
