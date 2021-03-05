//
//  StudentListScreen.swift
//  LocalStorage
//
//  Created by Boburmirzo on 3/5/21.
//

import SwiftUI

struct StudentListScreen: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var studentData: FetchedResults<Student>
    @State var isOpen = false
    var body: some View {
        NavigationView{
            List{
                ForEach(studentData, id: \.self){ student in
                    StudentListCell(student: student)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing: Button(action: {
                    isOpen = true
                }, label: {
                    HStack(spacing: 5){
                        Text("Add")
                        Image(systemName: "plus")
                    }
                }).sheet(isPresented: $isOpen, content: {
                    AddStudentDataScreen()
                }))
                .navigationBarTitle("Student List")
        }
    }
}

struct StudentListScreen_Previews: PreviewProvider {
    static var previews: some View {
        StudentListScreen()
    }
}
