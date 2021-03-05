//
//  AddStudentDataScreen.swift
//  LocalStorage
//
//  Created by Boburmirzo on 3/5/21.
//

import SwiftUI

struct AddStudentDataScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    @State var firstname = ""
    @State var lastname = ""
    @State var gender = ""
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    let gender_type = ["Male", "Female"]
    
    func AddUserData(f_name:String, l_name:String, gender:String, tel:String, email:String, address:String){
        let student = Student(context: self.moc)
        student.firstname = f_name
        student.lastname = l_name
        student.gender = gender
        student.phone = tel
        student.email = email
        student.address = address
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Firstname", text: $firstname)
                    TextField("Laststname", text: $lastname)
                    Picker("Gender", selection: $gender){
                        ForEach(gender_type, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                    HStack{
                        Spacer()
                        Button(action: {
                            AddUserData(f_name: firstname, l_name: lastname, gender: gender, tel: phone, email: email, address: address)
                            presentation.wrappedValue.dismiss()
                        }, label: {
                            Text("Submit")
                                .fontWeight(.bold)
                        })
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Add User Data", displayMode: .inline)
        }
    }
}

struct AddStudentDataScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddStudentDataScreen()
    }
}
