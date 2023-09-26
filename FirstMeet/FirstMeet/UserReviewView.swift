//
//  UserReviewView.swift
//  FirstMeet
//
//  Created by Ludovic Ollagnier on 25/09/2023.
//

import SwiftUI

struct UserReviewView: View {

    @Binding var review: String

    var body: some View {
        VStack {
            TextField("Type your review", text: $review)
            Text(review)
            Button("Clean") {
                review = ""
            }
        }
    }
}

#Preview {
    UserReviewView(review: .constant(""))
}
