import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Blurred background image with a color overlay
            Image("bg")
                .resizable() // Ensure the image fills the entire background
                .ignoresSafeArea()
                .blur(radius: 5, opaque: true)
                .overlay(Color.black.opacity(0.2)) // Add a color overlay to reduce whiteness
            
            VStack {
                Spacer() // Pushes content to the bottom

                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        Image("bg")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 30.0)
                            .overlay(
                                VStack {
                                    Spacer() // Pushes content to the bottom
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("My time at Bali")
                                                .font(.largeTitle)
                                                .fontWeight(.black)
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            HStack {
                                                Image(systemName: "star.fill")
                                                Image(systemName: "star.fill")
                                                Image(systemName: "star.fill")
                                                Image(systemName: "star.fill")
                                                Image(systemName: "star.fill")
                                            }
                                            .foregroundColor(.orange)
                                            Text("Reviews: 592")
                                                .font(.footnote)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color.white)
                                                .padding(.top, 5.0)
                                        }
                                    }
                                    HStack {
                                        Text("It left me speechless...")
                                            .font(.headline)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.top, 20)
                                        Spacer()
                                    }
                                }
                                .padding([.leading, .trailing], 30)
                                .padding(.bottom, 70)
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9) // Ensures content is within the image bounds
                            )
                        Spacer()
                    }
                }

                Spacer() // Ensures the image is centered vertically
            }
        }
    }
}

#Preview {
    ContentView()
}
