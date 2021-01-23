//
//  ContentView.swift
//  Isometric Test
//
//  Created by Sai Kambampati on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var bouncing = false

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Group {
                    Group {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color("Shadow").opacity(0.2))
                                .frame(width: 300, height: 300, alignment: .center)

                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color("Isometric Card"))
                                .frame(width: 280, height: 280, alignment: .center)
                                .offset(x: -10.0, y: -10.0)
                                .blur(radius: 20.0)
                        }
                    }
                    .rotationEffect(Angle.init(degrees: 45))
                    .scaleEffect(y: 0.5)
                }
                .shadow(color: Color("Shadow").opacity(0.1), radius: 15, x: 0, y: 100)
                .offset(y: bouncing ? 15 : -15)
                .animation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever(autoreverses: true)
                )
                Spacer()
            }
            Spacer()
        }
        .background(Color("Background").edgesIgnoringSafeArea(.all))
        .onAppear {
            self.bouncing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
