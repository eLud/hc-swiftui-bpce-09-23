//
//  ContentProvider.swift
//  FouDeFoodTopShelf
//
//  Created by Ludovic Ollagnier on 28/06/2023.
//

import TVServices

class ContentProvider: TVTopShelfContentProvider {

    override func loadTopShelfContent() async -> TVTopShelfContent? {

        let test = TVTopShelfSectionedItem(identifier: "test")
        test.imageShape = .square
        test.setImageURL(URL(string: "http://127.0.0.1:8080/6EE20249-1E7C-48C8-984C-440DBA8A6A3E.png"), for: .screenScale2x)

        let test1 = TVTopShelfSectionedItem(identifier: "test1")
        test1.imageShape = .square
        test1.setImageURL(URL(string: "http://127.0.0.1:8080/6EE20249-1E7C-48C8-984C-440DBA8A6A3E.png"), for: .screenScale2x)
        test1.displayAction = TVTopShelfAction(url: URL(string: "foudefood://resto/6EE20249-1E7C-48C8-984C-440DBA8A6A3E")!)


        let section = TVTopShelfItemCollection(items: [test, test1])
        section.title = "Now playing"

        let section2 = TVTopShelfItemCollection(items: [test, test1])
        section2.title = "Future releases"
        

        let sectionContent = TVTopShelfSectionedContent(sections: [section, section2])
        return sectionContent
    }

}

