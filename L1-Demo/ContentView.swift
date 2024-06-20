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
    Review(id: UUID(), image: "bg", title: "My time at Bali", reviewText: "It left me speechless...", rating: 5, reviewCount: 592),
    Review(id: UUID(), image: "bg2", title: "Exploring Paris", reviewText: "A wonderful experience!", rating: 4, reviewCount: 480)
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
    
    var body: some View {
        ZStack {
            Image(review.image)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 5, opaque: true)
                .overlay(Color.black.opacity(0.2))
            
            VStack {
                Spacer()
                GeometryReader { geometry in
                    VStack {
                        Image(review.image)
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 30.0)
                            .overlay(
                                VStack {
                                    Spacer()
                                    HStack {
                                        VStack(alignment: .leading) {
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
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            HStack {
                                                ForEach(0..<review.rating, id: \.self) { _ in
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                }
                                            }
                                            Text("Reviews: \(review.reviewCount)")
                                                .font(.footnote)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color.white)
                                                .padding(.top, 5.0)
                                        }
                                    }
                                    .padding([.leading, .trailing, .bottom], 20)
                                }
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9)
                            )
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
