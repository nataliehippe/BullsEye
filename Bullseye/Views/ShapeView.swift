//
//  ShapeView.swift
//  Bullseye
//
//  Created by Natalie on 27.05.22.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
        }.background(Color.green)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
