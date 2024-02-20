//
// Contact.swift
// SQL Sample
//


import Foundation

class Contact {
var name: String? = ""
var email: String = ""
var id: Int64 = 0

init(id:Int64, name:String?, email:String) {
self.name = name
self.email = email
self.id = id
}
}
