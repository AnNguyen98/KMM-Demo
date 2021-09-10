import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusState: FocusStateField?
    
//    var result = Validator().validateEmailAddress(email: "theannguyen98@gmail.com")
    enum FocusStateField {
        case email
        case password
    }

	var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome back!")
                    .font(.system(size: 41))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.bottom, 30)
                    
                
                TextFieldRounded(placeholder: "Email", iconName: "envelope.fill", text: $email)
                    .submitLabel(.next)
                    .focused($focusState, equals: .email)
                TextValidate(content: "Validate email address!", isValidate: .constant(false))
                
                TextFieldRounded(placeholder: "Password", iconName: "lock.fill", text: $password, isScureField: true)
                    .submitLabel(.done)
                    .focused($focusState, equals: .password)
                    .padding(.top, 10)
                TextValidate(content: "The string must contain at least 1 numeric character!", isValidate: .constant(true))
                TextValidate(content: "The string must contain at least 1 lowercase alphabetical character!", isValidate: .constant(false))
                TextValidate(content: "The string must contain at least 1 uppercase alphabetical character!", isValidate: .constant(false))
                TextValidate(content: "The string must contain at least one special character, but we are escaping reserved RegEx characters to avoid conflict!", isValidate: .constant(false))
                TextValidate(content: "The string must be eight characters or longer", isValidate: .constant(false))
                
                Button(action: {
                    dismissKeyboard()
                }, label: {
                    Text("Login")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                })
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                )
                .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                .disabled(false)
            }
//            .padding(EdgeInsets(top: 40, leading: 13, bottom: 40, trailing: 13))
//            .overlay(
//                RoundedRectangle(cornerRadius: 15)
//                    .stroke(lineWidth: 1)
//            )
            .shadow(color: .gray, radius: 5, x: 1, y: 3)
            
        }
        .padding()
        .onTapGesture {
            dismissKeyboard()
        }
        .onSubmit {
            switch focusState {
            case .email:
                focusState = .password
            case .password:
                focusState = nil
            case .none:
                print("Focus state equal nil.")
            }
            
            print("Focus state \(focusState ?? .none)")
        }
    }
    
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
