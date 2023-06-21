import SwiftUI

/// An abstract representation of the `Table` type in SwiftUI, with any style.
///
/// ```swift
/// struct ContentView: View {
///     struct Purchase: Identifiable {
///         let id = UUID()
///         let price: Decimal
///     }
///
///     var body: some View {
///         Table(of: Purchase.self) {
///             TableColumn("Base price") { purchase in
///                 Text(purchase.price, format: .currency(code: "USD"))
///             }
///             TableColumn("With 15% tip") { purchase in
///                 Text(purchase.price * 1.15, format: .currency(code: "USD"))
///             }
///             TableColumn("With 20% tip") { purchase in
///                 Text(purchase.price * 1.2, format: .currency(code: "USD"))
///             }
///             TableColumn("With 25% tip") { purchase in
///                 Text(purchase.price * 1.25, format: .currency(code: "USD"))
///             }
///         } rows: {
///             TableRow(Purchase(price: 20))
///             TableRow(Purchase(price: 50))
///             TableRow(Purchase(price: 75))
///         }
///         #if os(iOS)
///         .introspect(.table, on: .iOS(.v16, .v17)) {
///             print(type(of: $0)) // UICollectionView
///         }
///         #elseif os(macOS)
///         .introspect(.table, on: .macOS(.v12, .v13, .v14)) {
///             print(type(of: $0)) // NSTableView
///         }
///         #endif
///     }
/// }
/// ```
public struct TableType: IntrospectableViewType {}

#if os(iOS) || os(macOS)
extension IntrospectableViewType where Self == TableType {
    public static var table: Self { .init() }
}

#if canImport(UIKit)
extension iOSViewVersion<TableType, UICollectionView> {
    @available(*, unavailable, message: "Table isn't available on iOS 13")
    public static let v13 = Self(for: .v13)
    @available(*, unavailable, message: "Table isn't available on iOS 14")
    public static let v14 = Self(for: .v14)
    @available(*, unavailable, message: "Table isn't available on iOS 15")
    public static let v15 = Self(for: .v15)
    public static let v16 = Self(for: .v16)
    public static let v17 = Self(for: .v17)
}
#elseif canImport(AppKit) && !targetEnvironment(macCatalyst)
extension macOSViewVersion<TableType, NSTableView> {
    @available(*, unavailable, message: "Table isn't available on macOS 10.15")
    public static let v10_15 = Self(for: .v10_15)
    @available(*, unavailable, message: "Table isn't available on macOS 11")
    public static let v11 = Self(for: .v11)
    public static let v12 = Self(for: .v12)
    public static let v13 = Self(for: .v13)
    public static let v14 = Self(for: .v14)
}
#endif
#endif
