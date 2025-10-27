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
  - Data Source: Firebase Authentication + Firestore
  - Track each user's login timestamp using Firebase Authentication’s onAuthStateChanged listener.
  - On each login, write a timestamp to collection keyed by user UID
  - Use the `session_start` event that Firebase logs every time a user opens the app.
  - For each cohort of users who signed up on a given day, check how many returned in the defined window.

### PB5. CTR (Golden Path)
- Collecting: Custom Firebase Analytics events for user actions in the golden path (start_upload, start_recording, transcription_generated, notes_viewed).
- What’s collected: User/session IDs and event timestamps to calculate CTR = % of users moving from upload/record start → viewing structured notes.
- Calculation: CTR = (Unique users triggering notes_viewed ÷ Unique users triggering start_upload OR start_recording) × 100

### PB6. Average 

## PB6. Average Number of Audio Notes Transcribed per Active User per Day

**User Story:**  
As a product owner, I want to measure how many audio notes are transcribed on average per active user per day, so that I can assess whether users are engaging deeply with the app’s core functionality and identify trends in note-taking behavior.

**Collection Method:**  
- **Custom Event:** Log an event (`note_transcribed`) every time an audio file is successfully processed into text.  
- **Active Users:** Use Firebase’s built-in `session_start` or `user_engagement` events to determine the pool of daily active users.  
- **Calculation:**  
   - For each day, count the total number of `note_transcribed` events.  
   - Count the number of unique active users for that day.  
   - Divide total `note_transcribed` events by unique active users.  

**Data Source:**  
- Firebase Analytics → Custom Event (`note_transcribed`)  
- Firebase Analytics → Active Users (`session_start`, `user_engagement`)  

**Reporting Frequency:**  
- Daily aggregation with rolling 30-day view for trend analysis in Firebase dashboard or via BigQuery export.  



