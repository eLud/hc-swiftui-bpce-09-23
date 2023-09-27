//
//  ContentView.swift
//  Gestures
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI
import DeckUI

struct ContentView: View {
    var body: some View {
        Presenter(deck: deck)
    }

    var deck: Deck {
        Deck(title: "SwiftUI Gestures") {
            Slide(alignment: .leading) {
                Title("SwiftUI Gestures")
            }
            Slide {
                Title("Summary")
                Bullets {
                    Words("DragGesture")
                    Words("MagnificationGesture")
                    Words("RotationGesture")
                }
            }
            Slide {
                Title("DragGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            DragGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                DragGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("DragGesture.Value")
                Code(.swift) {
                    DragGestureExample.gestureValueDoc
                }
            }
            Slide {
                Title("MagnificationGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            MagnificationGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                MagnificationGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("MagnificationGesture.Value")
                Code(.swift) {
                    "public typealias Value = CGFloat"
                }
            }
            Slide {
                Title("RotationGesture")
                Columns {
                    Column {
                        Code(.swift) {
                            RotationGestureExample.code
                        }
                    }
                    Column {
                        RawView {
                            CenteringView {
                                RotationGestureExample()
                            }
                        }
                    }
                }
            }
            Slide {
                Title("RotationGesture.Value")
                Code(.swift) {
                    "public typealias Value = Angle"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
