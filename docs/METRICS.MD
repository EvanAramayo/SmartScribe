[Heart Framework](https://docs.google.com/presentation/d/1o-S2jwbj1Vr_2ft_1GInzSYxrX1e2UeC4x1d4qHyIRk/edit?usp=sharing)

# Backend Data Metrics

## **Note**: The writing below is placeholder. Each member will need to write what they did for each PB cart.

### PB1. Net Promoter Score (NPS)
- **Collection Method:** A custom in-app survey screen/pop-up is displayed immediately after a user's first login.  
- A 0–5 rating is recorded as a custom Event with the score as a custom parameter.  
- Data is stored in a Firestore document.

### PB2. Daily Active Users (DAU)
- **Collection Method**: 
- This metric is automatically collected through Firebase Analytics, which is integrated into our FlutterFlow app.
- Firebase logs the app_open and user_engagement events whenever a user launches the app or interacts with it for a session.
- We can view DAU data in the Firebase Analytics dashboard by filtering users by date and engagement activity. 
- DAU is derived from the count of unique User IDs that log the automatic `session_start` event each day.
- to get the backend source we will go to Firebase Analytics → user_engagement, app_open
- no extra code is needed
Metric visible in Analytics → Active Users → Daily

### PB3. Adoption Rate
As a product owner,
I want to collect metrics on user engagement and functionality for the signup/sign in process and the Golden Path,
So that I can assess the effectiveness of these features and make informed decisions for future iterations.
- **Collection Method:**  
  - Denominator (New Signups) is logged automatically by FlutterFlow/Firebase Auth (`sign_up` event).  
  - Numerator (First Recording Processed) requires a Custom Event (`first_note_processed`).  
  - This can be triggered by pressing “choose audio file” or “press record,” which can be a dummy counter for testing.

### PB4. Retention Rate
- **Collection Method:**  
  - Check if the user returns to the app using auto-tracking.  
  - Use the `session_start` event that Firebase logs every time a user opens the app.

### PB5. CTR (Golden Path)
- Collecting: Custom Firebase Analytics events for user actions in the golden path (start_upload, start_recording, transcription_generated, notes_viewed).
- What’s collected: User/session IDs and event timestamps to calculate CTR = % of users moving from upload/record start → viewing structured notes.
- Calculation: CTR = (Unique users triggering notes_viewed ÷ Unique users triggering start_upload OR start_recording) × 100

