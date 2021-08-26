//
//  ViewExtension.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

@available(iOSApplicationExtension, unavailable)
public extension View {
    /**
     A modifer to add a EcrBottomSheet to your view.
     
     - Parameter bottomSheetPosition: A binding that saves the current state of the EcrBottomSheet. This can be any `enum` that conforms to `CGFloat` and `CaseIterable`. For more information about custom enums see `EcrBottomSheetPosition`.
     - Parameter options: An array that contains the settings / options for the EcrBottomSheet. Can be `nil`. For more information about the possible options see `EcrBottomSheet.Options`.
     - Parameter headerContent: A view that is used as header content for the EcrBottomSheet. You can use a string that is used as the title for the EcrBottomSheet instead.
     - Parameter mainContent: A view that is used as main content for the EcrBottomSheet.
    */
    func bottomSheet<hContent: View, mContent: View, bottomSheetPositionEnum: RawRepresentable>(bottomSheetPosition: Binding<bottomSheetPositionEnum>, options: [EcrBottomSheet.Options] =  [], @ViewBuilder headerContent: () -> hContent? = { return nil }, @ViewBuilder mainContent: () -> mContent) -> some View where bottomSheetPositionEnum.RawValue == CGFloat, bottomSheetPositionEnum: CaseIterable {
        ZStack {
            self
            EcrBottomSheetView(bottomSheetPosition: bottomSheetPosition, options: options, headerContent: headerContent, mainContent: mainContent)
        }
    }
    
    /**
     A modifer to add a EcrBottomSheet to your view.
     
     - Parameter bottomSheetPosition: A binding that saves the current state of the EcrBottomSheet. This can be any `enum` that conforms to `CGFloat` and `CaseIterable`. For more information about custom enums see `EcrBottomSheetPosition`.
     - Parameter options: An array that contains the settings / options for the EcrBottomSheet. For more information about the possible options see `EcrBottomSheet.Options`.
     - Parameter title: A string that is used as the title for the EcrBottomSheet. Can be `nil`. You can use a view that is used as header content for the EcrBottomSheet instead.
     - Parameter content: A view that is used as content for the EcrBottomSheet.
    */
    func bottomSheet<mContent: View, bottomSheetPositionEnum: RawRepresentable>(bottomSheetPosition: Binding<bottomSheetPositionEnum>, options: [EcrBottomSheet.Options] = [], title: String? = nil, @ViewBuilder content: () -> mContent) -> some View where bottomSheetPositionEnum.RawValue == CGFloat, bottomSheetPositionEnum: CaseIterable {
        ZStack {
            self
            EcrBottomSheetView(bottomSheetPosition: bottomSheetPosition, options: options, title: title, content: content)
        }
    }
}
