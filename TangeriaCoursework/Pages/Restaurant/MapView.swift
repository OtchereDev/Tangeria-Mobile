import SwiftUI
import MapKit

struct ContentViews: View {
    @State private var selectedCategory = "Burgers"
    private let categories = ["Burgers", "Brunch", "Breakfast"]
    
    var body: some View {
        VStack {
            // Map View
            MapView()
                .frame(height: 300)
            
            // Segmented Control
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Restaurant List
            ScrollView {
                VStack {
                    ForEach(restaurants) { restaurant in
                        RestaurantRow(restaurant: restaurant)
                            .padding(.bottom, 10)
                    }
                }
                .padding()
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: -31.9505, longitude: 115.8605)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct RestaurantRow: View {
    let restaurant: RestaurantModel
    
    var body: some View {
        HStack {
            if let imageName = restaurant.imageName {
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text("\(restaurant.cuisine) • \(restaurant.type)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Text("25min")
                    Spacer()
                    Text("Free")
                }
                .font(.caption)
                .foregroundColor(.gray)
                HStack {
                    Spacer()
                    Text(String(format: "%.1f", restaurant.rating))
                        .font(.caption)
                        .padding(6)
                        .background(Color.yellow)
                        .cornerRadius(4)
                }
            }
            .padding(.leading, 8)
        }
    }
}

struct RestaurantModel: Identifiable {
    let id = UUID()
    let name: String
    let cuisine: String
    let type: String
    let imageName: String?
    let rating: Double
}

let restaurants = [
    RestaurantModel(name: "Nethai Kitchen", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5),
    RestaurantModel(name: "Lazy Bear", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5),
    RestaurantModel(name: "State Bird", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5),
    RestaurantModel(name: "Petit Creen", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5),
    RestaurantModel(name: "Rich Table", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5),
    RestaurantModel(name: "Cotogna", cuisine: "Chinese", type: "American", imageName: "food", rating: 4.5)
]

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentViews()
    }
}
