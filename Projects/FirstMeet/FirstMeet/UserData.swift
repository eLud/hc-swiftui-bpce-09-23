//
//  UserData.swift
//  FirstMeet
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import Foundation

class UserData: ObservableObject {

    @Published var userReview: String = ""
    private(set) var isDownloaded: Bool = false

    func download() {
        objectWillChange.send()
        isDownloaded.toggle()
    }
}
