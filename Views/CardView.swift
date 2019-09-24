//
//  CardView.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let index: Double
    let color : Color

    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 20)
				.foregroundColor(color)
                .shadow(color: Color.black.opacity(0.25), radius: 20)
				.frame(width: 290, height: 400, alignment: .center)
			if index == 0 {
				TextContent()
			}
			
        }.zIndex(index)
    }
}
