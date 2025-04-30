//
//  leaderboardview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct Players: Decodable {
    var id:         String
    var name:       String
    var score:    Int64
    var city:       String
    var state:      String
    var zip:        String
}

struct LeaderboardView: View {
    @State private var players = [Players]()
    
    var body: some View {
        NavigationView {
            List(players, id: \.id) { t in
                VStack (alignment: .leading) {
                    Text(String(t.id))
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text(t.name)
                        .font(.body)
                        .foregroundColor(.indigo)
                    
                    Text(String(t.city))
                        .font(.body)
                        .foregroundColor(.purple)
                    Text(String(t.state))
                        .font(.body)
                        .foregroundColor(.blue)
                    Text(String(t.zip))
                        .font(.body)
                        .foregroundColor(.pink)
                }
            }
            .navigationTitle("All Customers")
            .task {
                await fetchAllPlayers()
            }
        }
    }
    
    func fetchAllPlayers() async {
        // create the URL
        guard let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/getAllCustomers.cgi") else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Players].self, from: data) {
                players = decodedResponse
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
        
        // ecode the data
    }
}

//Combining the insertHighScore and the Leaderboard for the time being

struct InsertView: View {
            @State var companyName: String = ""
            @State var address: String = ""
            @State var city: String = ""
            @State var state: String = ""
            @State var zipCode: String = ""
            @State var phone: String = ""
            @State var email: String = ""
            @State var mPhone: String = ""
            @State var mCarrier: String = ""
            @State var username: String = ""
            @State var password1: String = ""
            @State var password2: String = ""
            
            @State private var resultMessage: String = ""
            
            
            var body: some View {
                VStack {
                    Group {
                        Text("New Customer Registration Form")
                            .padding()

                        TextField("Enter Company Name", text: $companyName)
                            .textFieldStyle(.roundedBorder)
                    
                        TextField("Enter Address", text: $address)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter City", text: $city)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter State", text: $state)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Zip Code", text: $zipCode)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Phone", text: $phone)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Email", text: $email)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Mobile Phone", text: $mPhone)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Mobile Carrier", text: $mCarrier)
                            .textFieldStyle(.roundedBorder)
                    } // end group #1
                    
                    
                    Group {
                        TextField("Enter Username", text: $username)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Enter Password", text: $password1)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Re-Enter Password", text: $password2)
                            .textFieldStyle(.roundedBorder)
                        
                        // Clear button
                        Button(action : {
                            Task {
                                
                                await sendNewCustomerData()
                                
                            }
                        }, label: {
                            Text("SUBMIT")
                                .font(.title3)
                                .padding()
                        })
                        
                        HStack {
                            Text("Status : ")
                            
                            Text(resultMessage)
                                .frame(width: 275, height: 70, alignment: .leading)
                                .background(Color.cyan)
                                .foregroundColor(Color.black)
                            
                        } // end HStack
                        
                    } // end group #2
                    
                } // end vstack
                
            } // end body
    
            func sendNewCustomerData() async {
                
                resultMessage = "Processing, one moment..."
                
                companyName = companyName.trimmingCharacters(in: .whitespacesAndNewlines)
                if (companyName == "")
                {
                    resultMessage = "ERROR : Company name is blank!"
                    return
                }
                
                address = address.trimmingCharacters(in: .whitespacesAndNewlines)
                if (address == "")
                {
                    resultMessage = "ERROR : Address field is blank!"
                    return
                }
                
                city = city.trimmingCharacters(in: .whitespacesAndNewlines)
                if (city == "")
                {
                    resultMessage = "ERROR : City field is blank!"
                    return
                }
                
                state = state.trimmingCharacters(in: .whitespacesAndNewlines)
                if (state == "")
                {
                    resultMessage = "ERROR : State field is blank!"
                    return
                }
                
                zipCode = zipCode.trimmingCharacters(in: .whitespacesAndNewlines)
                if (zipCode == "")
                {
                    resultMessage = "ERROR : Zip Code field is blank!"
                    return
                }
                
                phone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
                if (phone == "")
                {
                    resultMessage = "ERROR : Phone field is blank!"
                    return
                }
                
                email = email.trimmingCharacters(in: .whitespacesAndNewlines)
                if (email == "")
                {
                    resultMessage = "ERROR : Email field is blank!"
                    return
                }
                
                mPhone = mPhone.trimmingCharacters(in: .whitespacesAndNewlines)
                if (mPhone == "")
                {
                    resultMessage = "ERROR : Mobile Phone field is blank!"
                    return
                }
                
                mCarrier = mCarrier.trimmingCharacters(in: .whitespacesAndNewlines)
                if (mCarrier == "")
                {
                    resultMessage = "ERROR : Mobile Carrier field is blank!"
                    return
                }
                
                username = username.trimmingCharacters(in: .whitespacesAndNewlines)
                if (username == "")
                {
                    resultMessage = "ERROR : User Name field is blank!"
                    return
                }
                
                password1 = password1.trimmingCharacters(in: .whitespacesAndNewlines)
                if (password1 == "")
                {
                    resultMessage = "ERROR : Password One field is blank!"
                    return
                }
                
                password2 = password2.trimmingCharacters(in: .whitespacesAndNewlines)
                if (password2 == "")
                {
                    resultMessage = "ERROR : Password Two field is blank!"
                    return
                }
                
                //
                // create some substrings
                //
                let nameStr =  "name=" + companyName
                let addrStr =  "&address=" + address
                let cityStr =  "&city=" + city
                let statStr =  "&state=" + state
                let zipcStr =  "&zip=" + zipCode
                let phonStr =  "&phone=" + phone
                let emailStr = "&email="  + email
                let mphoStr =  "&mphone=" + mPhone
                let mcarStr =  "&mcarrier=" + mCarrier
                let userStr =  "&username=" + username
                let passStr =  "&password=" + password1
            
                //
                // Prepare URL
                //
                let url = URL(string: "https://storm.cis.fordham.edu/~kounavelis/cgi-bin/insertCustomers.cgi")
                            

                guard let requestUrl = url else { fatalError() }

                // Prepare URL Request Object
                var request = URLRequest(url: requestUrl)
                request.httpMethod = "POST"
                
                // HTTP Request Parameters which will be sent in HTTP Request Body
                let postString = nameStr + addrStr + cityStr + statStr + zipcStr + phonStr + emailStr +
                                 mphoStr + mcarStr + userStr + passStr
                            
                
                // Set HTTP Request Body
                request.httpBody = postString.data(using: String.Encoding.utf8);

                // Perform HTTP Request
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        
                        // Check for Error
                        if let error = error {
                            resultMessage = "Error took place \(error)"
                            return
                        }
                 
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            resultMessage = "Resp:\(dataString)"
                        }
                    
                } // end task
                
                task.resume()
                
            } //end function sendNewCustomerData
            
} // end struct


struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
