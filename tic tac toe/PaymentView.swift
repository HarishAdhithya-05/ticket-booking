import SwiftUI

struct PaymentView: View {
    @Binding var isPresented: Bool
    @State private var paymentStatus = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Payment Page")
                .font(.largeTitle)
                .padding()

            TextField("Enter card number", text: .constant(""))
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            TextField("Enter expiration date", text: .constant(""))
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            TextField("Enter CVV", text: .constant(""))
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: processPayment) {
                Text("Process Payment")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Text(paymentStatus)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    func processPayment() {
        // Simulate payment processing
        // In a real app, this would interact with a payment gateway
        paymentStatus = "Payment successful!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isPresented = false
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(isPresented: .constant(true))
    }
}
