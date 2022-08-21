//
//  AnimationSwift.swift
//
//  Created by t15k on 21/08/2022.
//

import Foundation
import SwiftUI

struct AnimationSwitchViewA: View {
    @State var choice = 0
    
    var body: some View {
        VStack {
            Text( choice == 1 ? "One" : "Two")
                .transition(.asymmetric(
                    insertion: choice == 1 ?
                        .move(edge: .trailing) : .move(edge: .top),
                    removal: choice == 1 ?
                        .move(edge: .leading) : .move(edge: .bottom)))
                .frame(width: 200.0, height: 100.0)
                .id(choice)
                .onTapGesture {
                 //   withAnimation {
                    choice = choice == 1 ? 2 : 1
                }
        }
        .animation(.easeIn, value: choice)
        .onAppear {
                choice = 1
        }
    }
}

struct AnimationSwitchViewB: View {
    @State var choice = 0
    
    var body: some View {
        VStack {
            Text( choice == 1 ? "One" : "Two")
                .transition(.asymmetric(
                    insertion: choice == 1 ?
                        .move(edge: .trailing) : .scale(scale: 4.0, anchor: .center),
                    removal: choice == 1 ?
                        .move(edge: .leading) : .scale(scale: 0.2, anchor: .center)))
                .frame(width: 200.0, height: 100.0)
                .id(choice)
                .onTapGesture {
                 //   withAnimation {
                    choice = choice == 1 ? 2 : 1
                }
        }
        .animation(.easeIn, value: choice)
        .onAppear {
                choice = 1
        }
    }
}

/// The example here show changing behavior depending what kind of transition if defined
/// for a given view.
///
/// It shows two Text views (upper - ViewA and lower ViewB)
///
/// In View A (upper).
/// When the text view 'One' is tapped, 'One' will slide down to the bottom, and 'Two' will enter from the top.
/// When text view 'Two' is tapped 'Two' will slide out left and 'One' will enter from the right.
/// Then
///
/// That means when 'One' i entering the insertion animation as defined when the choice value is 1. The removal animation is also what is when choice is 1. Like wise when choice is two entry and removal are the
/// strategies selected when the value is two
///
/// In other words. The view entering the screen both the insertion and removal strategies for both the new text view and the existing text view.
///
///
/// In view B (lower) on the other hand
///
/// We now have a mix of transition strategies. ViewA used move only, while ViewB uses a mix of move
/// and scale.
///
/// When text view 'One' is tapped, 'One' slide left and Two enter by scaling from quadrople size to normal size.
/// When 'Two' is tapped 'Two'' exits by scaling down to 20 pct. and 'One' enters from the right.
///
/// That mean that unlike ViewA, where the entering view defined entry and removal strategies. The
/// insertion strategi is here defined by the text view entering the screen . The removal strategy is however
/// taken from the text view already the screen.
///
/// Why this behaviour? If animation is of the same kind all insertion and removal behavoiour is as defined
/// in the view entering. If the animation definitions are of different kinds insertion is defined by the view
/// being inserted and removal is as defined on the view already on screen.
/// Is this intentional? If yes, where can I read about the rules for when defintions are taken from the entering
/// view vs. when are definition taken from the view already on screen?
///
///
struct AnimationSwitchView: View {
    var body: some View {
        VStack {
            Spacer()
            AnimationSwitchViewA()
            Spacer()
            AnimationSwitchViewB()
            Spacer()
            
        }
    }
}





struct AniExpView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationSwitchView()
    }
}

