import SwiftUI


struct HomeView: View {
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
                
                NavigationLink(destination: UserInfoView()) {
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
}

struct UserInfoView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        Form {
            Section(header: Text("Login Information")) {
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
            }
            
            NavigationLink(destination: UserDetailsView()) {
                Text("Log In")
            }
        }
        .navigationBarTitle("Welcome!")
    }
}

struct UserDetailsView: View {
    @State private var weight = ""
    @State private var height = ""
    @State private var selectedSex = 0
    let sexes = ["Male", "Female", "Other"]

    var body: some View {
        Form {
            Section(header: Text("User Information")) {
                TextField("Enter Weight (lbs)", text: $weight)
                    .keyboardType(.numberPad)
                TextField("Enter Height (in)", text: $height)
                    .keyboardType(.numberPad)

                Picker("Select Sex", selection: $selectedSex) {
                    ForEach(0..<sexes.count) {
                        Text(self.sexes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            NavigationLink(destination: TrackOptionsView()) {
                Text("Continue")
            }
        }
        .navigationBarTitle("User Information")
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


