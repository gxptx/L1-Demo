import SwiftUI

// Data Model
struct Review: Identifiable {
    var id: UUID
    var image: String
    var title: String
    var reviewText: String
    var rating: Int
    var reviewCount: Int
}

// Sample Reviews Array
let sampleReviews = [
    Review(id: UUID(), image: "bg", title: "My time at Bali", reviewText: "It left me speechless...", rating: 8, reviewCount: 592),
    Review(id: UUID(), image: "bg2", title: "Exploring Paris", reviewText: "A wonderful experience!", rating: 9, reviewCount: 480),
    Review(id: UUID(), image: "bg3", title: "Skiing in Switzerland", reviewText: "Breathtaking views and slopes!", rating: 7, reviewCount: 340),
    Review(id: UUID(), image: "bg4", title: "Beach days in Maldives", reviewText: "Paradise on Earth!", rating: 5, reviewCount: 890),
    Review(id: UUID(), image: "bg5", title: "Cultural immersion in Kyoto", reviewText: "Rich history and traditions.", rating: 5, reviewCount: 720),
    Review(id: UUID(), image: "bg6", title: "Road trip across Australia", reviewText: "Unforgettable landscapes.", rating: 9, reviewCount: 410),
    Review(id: UUID(), image: "bg7", title: "New York City adventures", reviewText: "City that never sleeps!", rating: 10, reviewCount: 600),
    Review(id: UUID(), image: "bg8", title: "Hiking in the Rockies", reviewText: "Majestic mountains and wildlife.", rating: 8, reviewCount: 550),
    Review(id: UUID(), image: "bg9", title: "Exploring Tokyo", reviewText: "Fascinating blend of modern and tradition.", rating: 7, reviewCount: 490),
    Review(id: UUID(), image: "bg10", title: "Cruise in the Caribbean", reviewText: "Relaxing and luxurious experience.", rating: 10, reviewCount: 380),
]

// ContentView
struct ContentView: View {
    var reviews = sampleReviews
    
    var body: some View {
        NavigationView {
            List(reviews) { review in
                NavigationLink(destination: ReviewDetailView(review: review)) {
                    ReviewRow(review: review)
                }
            }
            .navigationTitle("Reviews")
        }
    }
}

// ReviewRow View
struct ReviewRow: View {
    var review: Review
    
    var body: some View {
        HStack {
            Image(review.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(review.title)
                    .font(.headline)
                Text(review.reviewText)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}

// ReviewDetailView
struct ReviewDetailView: View {
    var review: Review
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image(review.image)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 5, opaque: true)
                .overlay(Color.black.opacity(0.2))
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack {
                        Image(review.image)
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 30.0)
                            .overlay(
                                VStack(spacing: 10) {
                                    Spacer()
                                    VStack(spacing: 10) {
                                        Text(review.title)
                                            .font(.largeTitle)
                                            .fontWeight(.black)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                        
                                        Text(review.reviewText)
                                            .font(.headline)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                        
                                        HStack {
                                            ForEach(1...5, id: \.self) { index in
                                                Image(systemName: Double(index) <= Double(review.rating) / 2.0 ? "star.fill" : (Double(index) - 0.5 <= Double(review.rating) / 2.0 ? "star.leadinghalf.fill" : "star"))
                                                    .foregroundColor(.orange)
                                            }
                                        }
                                        
                                        Text("Reviews: \(review.reviewCount)")
                                            .font(.footnote)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color.white)
                                            .padding(.top, 5.0)
                                    }
                                    .padding()
                                    .background(Color.black.opacity(0.5)) // Semi-opaque background
                                    .cornerRadius(15) // Rounded corners for the container
                                    .frame(width: geometry.size.width * 0.8) // Adjusted frame width
                                    .padding(.bottom, geometry.safeAreaInsets.bottom + 20) // Align to bottom of image
                                }
                            )
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide default back button
        .modifier(CustomBackButton()) // Apply custom back button modifier
    }
}

// Shared view modifier for custom back button
struct CustomBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // Navigate back
                }) {
                    Image(systemName: "arrow.left.circle")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.leading, 25.0)
                }
            )
    }
}

#Preview {
    ContentView()
}
