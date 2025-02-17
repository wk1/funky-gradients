import SwiftUI

public struct FunkyGradients: View {
  @State private var funkyGradient: Bool = false

  public init() {}
  
  public var body: some View {
    ZStack {
      TabView {
        LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
          .frame(width: 300, height: 200)
          .mask(
            VStack {
              Text("Swift")
                .font(.system(size: 72, weight: .bold))
              Text("Funky Gradients")
                .font(.custom("Snell Roundhand", size: 32))
            }
          )
        
        LinearGradient(colors: [.blue, .green], startPoint:
            .topLeading, endPoint: .bottomTrailing)
        .hueRotation(.degrees(funkyGradient ? 45 : 0))
        .onAppear {
          withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            funkyGradient.toggle()
          }
        }
        .ignoresSafeArea()
      }
      .tabViewStyle(PageTabViewStyle())
    }
    .ignoresSafeArea()
  }
}

#Preview("Funky Gradients") {
  FunkyGradients()
    .previewDisplayName("Funky Gradients")
    .previewLayout(.sizeThatFits)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(
      Color(red: 0x22 / 255, green: 0x21 / 255, blue: 0x2c / 255)
    )
}
