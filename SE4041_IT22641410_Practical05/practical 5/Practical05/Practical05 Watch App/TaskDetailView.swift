import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .font(.largeTitle)
                .foregroundStyle(task.completed ? .green : .gray)
            
            Text(task.title)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(task.completed ? "Completed" : "Pending")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .navigationTitle("Details")
    }
}
