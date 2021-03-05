//
//  StudentListCell.swift
//  LocalStorage
//
//  Created by Boburmirzo on 3/5/21.
//

import SwiftUI

struct StudentListCell: View {
    @Environment(\.managedObjectContext) var moc
    var student: Student
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(student.firstname!) \(student.lastname!)").bold()
                Text("\(student.phone!) | \(student.email!)")
                Text("\(student.address!)")
            }
            Spacer()
            Text("\(student.gender!)").foregroundColor(.red)
            Button(action: {
                moc.delete(student)
            }, label: {
                Text("Delete")
            })
        }.padding(.leading,10).padding(.trailing, 10)
    }
}

struct StudentListCell_Previews: PreviewProvider {
    static var previews: some View {
        StudentListCell(student: Student())
    }
}
