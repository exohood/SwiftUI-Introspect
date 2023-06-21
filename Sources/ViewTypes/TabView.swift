import SwiftUI

/// An abstract representation of the `TabView` type in SwiftUI.
///
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         TabView {
///             Text("Tab 1").tabItem { Text("Tab 1") }
///             Text("Tab 2").tabItem { Text("Tab 2") }
///         }
///         #if os(iOS) || os(tvOS)
///         .introspect(.tabView, on: .iOS(.v13, .v14, .v15, .v16, .v17), .tvOS(.v13, .v14, .v15, .v16, .v17)) {
///             print(type(of: $0)) // UITabBarController
///         }
///         #elseif os(macOS)
///         .introspect(.tabView, on: .macOS(.v10_15, .v11, .v12, .v13, .v14)) {
///             print(type(of: $0)) // NSTabView
///         }
///         #endif
///     }
/// }
/// ```
public struct TabViewType: IntrospectableViewType {}

extension IntrospectableViewType where Self == TabViewType {
    public static var tabView: Self { .init() }
}

#if canImport(UIKit)
extension iOSViewVersion<TabViewType, UITabBarController> {
    public static let v13 = Self(for: .v13, selector: selector)
    public static let v14 = Self(for: .v14, selector: selector)
    public static let v15 = Self(for: .v15, selector: selector)
    public static let v16 = Self(for: .v16, selector: selector)
    public static let v17 = Self(for: .v17, selector: selector)

    private static var selector: IntrospectionSelector<UITabBarController> {
        .default.withAncestorSelector(\.tabBarController)
    }
}

extension tvOSViewVersion<TabViewType, UITabBarController> {
    public static let v13 = Self(for: .v13, selector: selector)
    public static let v14 = Self(for: .v14, selector: selector)
    public static let v15 = Self(for: .v15, selector: selector)
    public static let v16 = Self(for: .v16, selector: selector)
    public static let v17 = Self(for: .v17, selector: selector)

    private static var selector: IntrospectionSelector<UITabBarController> {
        .default.withAncestorSelector(\.tabBarController)
    }
}
#elseif canImport(AppKit)
extension macOSViewVersion<TabViewType, NSTabView> {
    public static let v10_15 = Self(for: .v10_15)
    public static let v11 = Self(for: .v11)
    public static let v12 = Self(for: .v12)
    public static let v13 = Self(for: .v13)
    public static let v14 = Self(for: .v14)
}
#endif
