//
//  ContentView.swift
//  FirstMeet
//
//  Created by Ludovic Ollagnier on 25/09/2023.
//

import SwiftUI

struct ContentView: View {

    let commercialImageName: String?
    
    @State private var buttonTitle = "Obtenir"
    @State private var review = "Bla"

    private let headerHeight = 126.0

    var body: some View {
        VStack {
            commercialHeader
                .frame(height: 150)
            appHeader
            Divider()
                .padding(.horizontal)
            infoZone
            Spacer()
        }.ignoresSafeArea(.container, edges: .top)
    }

    @ViewBuilder
    private var commercialHeader: some View {
        if let commercialImageName {
            Image(systemName: commercialImageName)
        } else {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.green.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .overlay {
                    Text("App Name")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
        }
    }

    private var appHeader: some View {
        HStack(spacing: 10.0) {
            appIcon
            VStack(alignment: .leading) {
                Text("Duolingo")
                    .font(.title)
                    .bold()
                Text("Apprend l'anglais")
                    .font(.footnote)
                Spacer()
                HStack {
                    Button(buttonTitle) {
                        buttonTitle = "Téléchargement"
                    }
                    .buttonStyle(ColoredCapsuleButtonStyle())
                    .clipShape(Capsule())
                    Text("Achats intégrés")
                        .foregroundStyle(.secondary)
                        .font(.caption2)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    .buttonStyle(ColoredCapsuleButtonStyle(capsuleColor: .red, textColor: .yellow))
                }
            }
        }
        .padding(.horizontal)
        .frame(height: headerHeight)
    }
    private var appIcon: some View {
        Image(systemName: "leaf")
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .frame(height: headerHeight - 18 * 2)
            .padding(18)
            .background {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(.green)
            }
    }

    private var infoZone: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<10) { _ in
                        Color.gray
                            .frame(width: 80, height: 80)
                    }
                }
            }
            .scrollIndicators(.hidden, axes: .horizontal)
            UserReviewView(review: $review)
            Text(review)
        }
    }
}

struct ColoredCapsuleButtonStyle: ButtonStyle {

    let capsuleColor: Color
    let textColor: Color

    init(capsuleColor: Color = .blue, textColor: Color = .white) {
        self.capsuleColor = capsuleColor
        self.textColor = textColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundStyle(textColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background {
                Capsule()
                    .foregroundStyle(capsuleColor)
            }
    }
}

#Preview {
    ContentView(commercialImageName: nil)
}

#Preview {
    ContentView(commercialImageName: "sun.horizon.fill")
}
