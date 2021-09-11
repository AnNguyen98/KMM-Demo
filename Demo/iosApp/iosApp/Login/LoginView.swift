import SwiftUI
import shared

struct LoginView: View {
    @StateObject private var viewModel = ContentViewModel()
    @FocusState private var focusState: FocusStateField?
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    enum FocusStateField {
        case email
        case password
    }

	var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome back!")
                        .font(.system(size: 41))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.bottom, 30)
                        
                    
                    TextFieldRounded(placeholder: "Email", iconName: "envelope.fill", text: $viewModel.email)
                        .submitLabel(.next)
                        .focused($focusState, equals: .email)
                    TextValidate(
                        content: "Validate email address!", isValidate: viewModel.isValidEmail
                    )
                    
                    TextFieldRounded(placeholder: "Password", iconName: "lock.fill", text: $viewModel.password, isScureField: true)
                        .submitLabel(.done)
                        .focused($focusState, equals: .password)
                        .padding(.top, 10)
                    TextValidate(
                        content: "The string must contain at least 1 numeric character!",
                        isValidate: viewModel.validsStatePassword.contains(.onenumeric)
                    )
                    TextValidate(
                        content: "The string must contain at least 1 lowercase alphabetical character!",
                        isValidate: viewModel.validsStatePassword.contains(.onelowercase)
                    )
                    TextValidate(
                        content: "The string must contain at least 1 uppercase alphabetical character!",
                        isValidate: viewModel.validsStatePassword.contains(.oneuppercase)
                    )
                    TextValidate(
                        content: "The string must contain at least one special character",
                        isValidate: viewModel.validsStatePassword.contains(.onespecial)
                    )
                    TextValidate(
                        content: "The string must be eight characters or longer",
                        isValidate: viewModel.validsStatePassword.contains(.eightcharactersnospace)
                    )
                    
                    Button(action: {
                        handleLoggedIn()
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
    //                .disabled(!viewModel.isValidInfo)
    //                .opacity(viewModel.isValidInfo ? 1: 0.6)
                }
    //            .padding(EdgeInsets(top: 40, leading: 13, bottom: 40, trailing: 13))
    //            .overlay(
    //                RoundedRectangle(cornerRadius: 15)
    //                    .stroke(lineWidth: 1)
    //
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
                
    //            print("Focus state \(focusState ?? .none)")
            }
            .handleLoadingView($viewModel.isLoading)
            
            .navigationBarHidden(true)
        }
    }
    
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func handleLoggedIn() {
        dismissKeyboard()
        viewModel.isLoading = true
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            viewModel.isLoading = false
            isLoggedIn.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
