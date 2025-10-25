# VShip Features

## Core Functionality

### 1. Triangle Status Indicator
The most distinctive feature of VShip is the menu bar triangle that changes color based on your latest Vercel deployment:

- **🟢 Green Triangle**: Your latest deployment was successful (READY state)
- **🟡 Yellow Triangle**: A deployment is currently building or queued
- **🔴 Red Triangle**: The latest deployment failed or was canceled

This provides instant visual feedback without needing to open the popover.

### 2. Deployment List
Click the triangle to see a comprehensive list of your recent deployments, showing:
- Deployment name and project
- Current status with color-coded badges
- Commit message from GitHub
- Branch name
- Time elapsed (for building) or time since deployment
- Quick "Inspect on Vercel" button to open in browser

### 3. Real-Time Updates
VShip automatically polls the Vercel API every 30 seconds to fetch the latest deployment status. The triangle indicator and deployment list update automatically.

### 4. Build Time Tracking
For deployments that are currently building or queued, VShip displays:
- Elapsed time counter (e.g., "2:34 elapsed")
- Updates every second while building
- Switches to relative time once complete

### 5. Secure Token Storage
Your Vercel API token is stored securely in the macOS Keychain:
- Never stored in plain text
- Protected by macOS security
- Only accessible to VShip
- Can be removed at any time from Settings

### 6. Native macOS Design
Built with Swift and SwiftUI for:
- Fast, native performance
- Automatic light/dark mode support
- System-native UI components
- Small memory footprint
- Instant launch time

## User Interface

### Onboarding
First-time users are greeted with a clean onboarding screen:
- Simple token input
- Direct link to create a Vercel API token
- One-click setup

### Main View
The popover interface includes:
- Header with app title and refresh button
- Settings access
- Scrollable deployment list
- Loading states
- Error handling with retry option
- Empty state for new accounts

### Settings
Manage your VShip installation:
- View connected account status
- Sign out and remove token
- View app version and build info
- Clean, organized layout

## Technical Features

### API Integration
- Full Vercel API v6 integration
- Deployment listing endpoint
- Proper authentication headers
- Error handling and retry logic

### State Management
- Combine framework for reactive updates
- Published properties for UI updates
- Efficient state synchronization

### Error Handling
- Network error detection
- Invalid token handling
- Graceful degradation
- User-friendly error messages

### Performance
- Efficient JSON parsing
- Lazy loading for deployment list
- Minimal API calls (30-second polling)
- Optimized rendering

## Comparison with Original deplog

VShip is a complete implementation with all features from the original deplog:

| Feature | deplog | VShip |
|---------|--------|-------|
| Menu bar integration | ✅ | ✅ |
| Status indicator | Circle | **Triangle** (customized) |
| Color coding | Basic | **Enhanced (3 states)** |
| Deployment list | ✅ | ✅ |
| Elapsed time | ✅ | ✅ |
| Keychain storage | ✅ | ✅ |
| Light/Dark mode | ✅ | ✅ |
| Settings management | ✅ | ✅ |
| Vercel integration | ✅ | ✅ |

### Key Differentiators

1. **Triangle Indicator**: VShip uses a triangle instead of a circle, as requested
2. **Color States**: Explicitly defined green/yellow/red based on deployment status
3. **Open Source**: Full source code available
4. **Customizable**: Easy to modify and extend

## Future Enhancement Ideas

Potential features that could be added:

- [ ] Support for multiple Vercel teams/accounts
- [ ] Desktop notifications for deployment completion
- [ ] Quick deploy trigger from menu bar
- [ ] Filter deployments by project
- [ ] Show deployment preview URLs
- [ ] Integration with other platforms (Netlify, Railway, etc.)
- [ ] Keyboard shortcuts
- [ ] Custom polling interval
- [ ] Deployment analytics and history
- [ ] Export deployment logs
