import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var numberOfTickets: Int = 1
    @State private var bookingStatus: String = ""
    @State private var isPaymentPresented = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Online Ticket Booking")
                    .font(.largeTitle)
                    .padding()

                TextField("Enter your name", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Stepper(value: $numberOfTickets, in: 1...10) {
                    Text("Number of tickets: \(numberOfTickets)")
                }
                .padding(.horizontal)

                Button(action: {
                    bookTickets()
                    isPaymentPresented = true
                }) {
                    Text("Book Tickets")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Text(bookingStatus)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationTitle("Ticket Booking")
            .sheet(isPresented: $isPaymentPresented) {
                PaymentView(isPresented: $isPaymentPresented)
            }
        }
    }

    func bookTickets() {
        guard !name.isEmpty else {
            bookingStatus = "Please enter your name."
            return
        }

        bookingStatus = "Tickets booked for \(name) - \(numberOfTickets) ticket(s)."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
