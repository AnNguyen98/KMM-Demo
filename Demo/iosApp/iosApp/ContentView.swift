import SwiftUI
import shared
import Combine

struct ContentView: View {
	let greet = Greeting().greeting()
    
    @State var text: String = ""
    
    init() {
        
    }
    
    var valids: String {
        print(Validators().validatePassword(password: text))
        return Validators().validatePassword(password: text).map({ "\($0)" }).joined(separator: " - ")
    }

	var body: some View {
        VStack {
            Text("\(Validators().validateEmailAddress(email: text).description)")
                
            TextField("Text", text: $text)
        }
        .padding()
        
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
