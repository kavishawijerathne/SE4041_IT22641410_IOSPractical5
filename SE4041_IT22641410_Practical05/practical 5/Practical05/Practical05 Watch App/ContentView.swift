import SwiftUI

struct ContentView: View {
    // Part B: Initial Tasks
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]
    
    // Part E: Completion Count
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Top Progress Indicator
                Text("\(completedCount) / \(tasks.count) Completed")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 4)
                
                // Part C & D: Main Screen List & Toggling
                List(tasks.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // Interaction 1: Toggle Button
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            HStack {
                                Image(systemName: tasks[index].completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(tasks[index].completed ? .green : .white)
                                Text(tasks[index].title)
                                    .font(.headline)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        // Interaction 2: Navigation Link
                        NavigationLink {
                            TaskDetailView(task: tasks[index])
                        } label: {
                            Text("View Details")
                                .font(.caption2)
                                .foregroundStyle(.blue)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Quick Tasks")
            
            // Part G (Option A): Reset Tasks Feature
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Reset") {
                        for i in tasks.indices {
                            tasks[i].completed = false
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
