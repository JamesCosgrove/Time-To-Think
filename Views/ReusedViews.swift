//
//  ReusedViews.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct Handle : View {
    private let handleThickness = CGFloat(5.0)
	
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}
