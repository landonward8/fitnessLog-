import SwiftUI

struct HomeView: View {
    @State private var latestUserData: (height: Double, weight: Double, sex: String)?

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("FitnessLog+")
                        .font(.title)
                        .foregroundColor(.blue)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.blue)
                }
                .padding()
                
                Text("Welcome!")
                    .font(.headline)
                    .padding()
                
                if let userData = latestUserData {
                    VStack {
                            Text("Log In")
                    }
                    .padding()
                } else {
                    Text("")
                        .padding()
                }
                
                NavigationLink(destination: UserDetailsView()) {
                    Text("Next")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("")
        }
    }
    
    private func fetchLatestUserData() {
        let allUsers = DatabaseManager.shared.getAllUsers()
        latestUserData = allUsers.last
    }
}

struct UserDetailsView: View {
    @State private var weight = ""
    @State private var height = ""
    @State private var selectedSex = 0
    @State private var shouldNavigate = false
    @State private var latestUserData: (height: Double, weight: Double, sex: String)?
    let sexes = ["Male", "Female", "Other"]

    var body: some View {
        Form {
            Section(header: Text("User Information")) {
                TextField("Enter Weight (lbs)", text: $weight)
                    .keyboardType(.numberPad)
                TextField("Enter Height (in)", text: $height)
                    .keyboardType(.numberPad)

                Picker("Select Sex", selection: $selectedSex) {
                    ForEach(0..<sexes.count, id: \.self) {
                        Text(self.sexes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Button("Save Details") {
                saveUserDetails()
            }

            if let userData = latestUserData {
                Section(header: Text("Latest Details")) {
                    Text("Height: \(userData.height, specifier: "%.2f") inches")
                    Text("Weight: \(userData.weight, specifier: "%.2f") lbs")
                    Text("Sex: \(userData.sex)")
                }
            }
        }
        .navigationBarTitle("User Information")
        .onAppear {
            fetchLatestUserData()
        }
        NavigationLink(destination: TrackOptionsView()) {
            Text("Next")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    private func saveUserDetails() {
        guard let userWeight = Double(weight), let userHeight = Double(height) else { return }

        DatabaseManager.shared.addUser(height: userHeight, weight: userWeight, sex: sexes[selectedSex])
        fetchLatestUserData()
    }

    private func fetchLatestUserData() {
        let allUsers = DatabaseManager.shared.getAllUsers()
        latestUserData = allUsers.last
    }
}

   

struct TrackOptionsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: CalorieTrackingView()) {
                    Image(systemName: "flame.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                    Text("Calorie Tracking")
                }

                NavigationLink(destination: SleepTrackingView()) {
                    Image(systemName: "moon.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Text("Sleep Tracking")
                }

                NavigationLink(destination: MoodTrackingView()) {
                    Image(systemName: "face.smiling.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                    Text("Mood Tracking")
                }

                NavigationLink(destination: NotificationsView()) {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.purple)
                    Text("Notifications")
                }

                NavigationLink(destination: HomeView()) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Text("Home")
                }
            }
        }
    }
}

struct CalorieTrackingView: View {
    var body: some View {
        Text("Calorie Tracking View")
    }
}

struct SleepTrackingView: View {
    var body: some View {
        Text("Sleep Tracking View")
    }
}

struct MoodTrackingView: View {
    var body: some View {
        Text("Mood Tracking View")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications View")
    }
}


