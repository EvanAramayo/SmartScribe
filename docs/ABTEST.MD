A/B Test Name: Adjustable Font Size For Readability

User Story Number: All user stories 

Metrics (HEART Framework): 
Happiness: User satisfaction based on post-interaction surveys (ease of reading and visual comfort).
Engagement: Time spent on page, scroll depth, and number of articles or sections viewed per session.
Adoption: Percentage of new users who continue exploring additional content after their first vi
Retention: Returning user rate within 7 days, after going into the settings in order to adjust the font
Task Success: Completion rate of key actions after changing the font size

Hypothesis: I hyptohesize that through increasing font size on key content areas will improve readability and reduce visual fatigue, leading to higher engagement and retention, amongst all users.

Problem We’re Trying to Solve: We're trying to solve the potential issue of a user's engagement being hindered by their ability to read our font in certain areas, or even be bothered by the font size. Through offering a customizable and sizeable font size, it will allow the user to feel as though the app is more personalized and catered to their needs. Hopefully, this will entice the user to continously return and choose our app over other note taking apps.

Experiment Setup (Using Firebase):

Platform: Firebase A/B Testing integrated with Remote Config.
Audience: 50% of total active users segmented randomly into two groups (Control and Variant).

Variations:

Control (A): Default font size (current design).
Variant (B): Adjustable font size feature within the settings part of the application.
Duration: 1 week, given the short 
Tracking in Firebase Analytics:

Event: `page_view` – track total page views.
Event: `scroll_depth` – measure how far users scroll down each page.
Event: `time_on_page` – capture average time spent per session.
Event: `cta_click` – track engagement with main call-to-action buttons.
User Property: `font_test_group` – identifies whether user belongs to Control or Variant.


-----------------------

## A/B Test Name: Add Placeholder Text in Empty Notes  

**User Story Number:** US4  

### Metrics (HEART Framework)

- **Happiness:** User satisfaction after creating their first note, measured via an in-app 1–5 star rating or micro survey (“How easy was it to start writing your first note?”).  
- **Engagement:** Percentage of users who start typing after opening the note editor.  
- **Adoption:** Number of first-time users who successfully save a note during their initial session.  
- **Retention:** Percentage of users who return and edit or create another note within 3 days of first session.  
- **Task Success:** Average time between opening the note editor and the first keystroke (lower time indicates reduced hesitation).  

### Hypothesis

If we display a short, friendly placeholder message like _“Start typing your thoughts…”_ in an empty note, users will begin writing faster and feel less intimidated by the blank screen.  

### Problem We’re Trying to Solve & Its Impact

**Problem:** When users open the note editor for the first time, some hesitate or close the app without typing because the blank screen feels uninviting and directionless.  

**Impact:** This leads to higher abandonment and lower engagement during a key moment — first note creation — which directly affects early user adoption and retention. Encouraging users to start typing faster may help establish a stronger habit of using the app regularly.  

### Experiment Setup (Using Firebase)

**Platform:** Firebase A/B Testing integrated with Firebase Remote Config and Firebase Analytics.  

**Audience:** All new users who open the note editor for the first time.  

**Allocation:**  
- 50% → **Control Group (Variant A):** Empty note editor with no text.  
- 50% → **Test Group (Variant B):** Editor pre-filled with a grey italic placeholder message:  
  > “Start typing your thoughts…”  
  The text disappears once the user begins typing.  

**Duration:** 1 week, or until each group reaches at least 100 unique users.  

### Tracking in Firebase Analytics

- **Event:** `editor_opened`  
  - **Description:** Logged when the note editor is opened.  
  - **Parameter:** `variant: "control"` or `"test"`  

- **Event:** `typing_started`  
  - **Description:** Logged on first keystroke.  
  - **Usage:** Used to calculate time from open → first keystroke.  

- **Event:** `note_saved`  
  - **Description:** Logged when the user saves their first note.  
  - **Usage:** Used to measure adoption.  

- **Event:** `user_feedback_submitted`  
  - **Description:** Logged when user completes the satisfaction survey.  
  - **Parameter:** `rating: 1–5`  

**User Property:**  
- `placeholder_test_group` → identifies whether the user belongs to Control (A) or Variant (B).  

### Analysis Plan

- Compare average **time-to-first-keystroke** between Control and Variant.  
- Measure **% of users who start typing** after opening the editor.  
- Analyze **note save rates** and **3-day retention**.  
- Review **user satisfaction ratings** to determine whether the placeholder improves perceived usability.  

### Success Criteria

The experiment will be considered a success if:  
- The average time-to-first-keystroke decreases by at least **10%**, and  
- The percentage of users who start typing increases by **≥5%** in the variant group, without reducing satisfaction scores.  


------------------------------------------------------

A/B Test Name: Loading Screen Feedback (Spinner vs Progress Skeleton)

User Story Number: US3 (Loading Experience in Upload Flow)

Metrics (HEART Framework):
Happiness: Post-loading micro-survey rating (1–5) on clarity of the process.
Engagement: % of users who remain on the loading screen until transition; dwell time before abandoning.
Adoption: % of new signups who proceed past the loading screen into the in-progress page.
Retention: % of users who return the next day after having reached the loading screen.
Task Success: CTR proxy = in_progress_screen_view / loading_screen_view

Hypothesis:
If we present a skeleton preview of note-like placeholders instead of a blank spinner, users will perceive progress as faster and clearer, leading to fewer drop-offs, higher task success, and greater engagement with the in-progress page.

Problem: Currently, the loading step after file upload shows only a neutral spinner. This creates uncertainty and can feel like the app is stalled, especially since the actual transcription backend isn’t built yet. Users may abandon the flow at this stage.

This is a critical bottleneck in the funnel: if users leave here, they never reach the in-progress page or any future transcription output. Improving perceived progress with skeleton previews is expected to:
 -Reduce abandonment on the loading screen.
- Increase conversion from upload → in-progress.
- Improve user trust and perception of app responsiveness.

Experiment Setup (Using Firebase):
Platform: Firebase A/B Testing with Remote Config.
Audience: 50% control, 50% variant, random assignment, sticky per user.
Duration: 7 days minimum to smooth weekday/weekend behavior.

Tracking (Firebase Analytics):
loading_screen_view (fires on entering loading state)
loading_complete (fires when timer ends and user proceeds)
back_nav (user leaves before completion)
in_progress_screen_view (user reaches next page)

Optional: cancel_click if a cancel button is present.

Metrics Tied to HEART:
Adoption Rate = % who reach in_progress_screen_view
Task Success proxy = in_progress_screen_view / loading_screen_view
Drop-off rate = back_nav / loading_screen_view
Happiness = survey rating collected on the in-progress page

Variations:

Control (A): Spinner
Show neutral spinner and “Processing your file…” text.
Fixed delay (e.g., 3.5 seconds) → navigates to in-progress page.

Variant (B): Skeleton Preview
Show skeleton layout with gray placeholder blocks (imitating note structure).
Same fixed delay (3.5 seconds) → navigates to in-progress page.
Copy: “Preparing your preview…”

------------------------------------------------------
A/B Test Name: Separate Screens for Signup and Login
User Story Number: 1 & 2

Metrics (HEART Framework):

Happiness: User satisfaction based on post-interaction surveys (ease of use and clarity).

Engagement: Time spent on the signup/login screen, conversion rate, and the number of users who complete the signup/login process.

Adoption: Percentage of new users who successfully sign up or log in on their first attempt.

Retention: Returning user rate within 7 days after first signup/login.

Task Success: Completion rate of successful signups and logins.

Hypothesis:
I believe providing separate screens for signup and login, users will be able to find the process clearer and less confusing, leading to higher completion rates for both actions and improved overall user satisfaction.

Problem We’re Trying to Solve:
We aim to address the potential confusion users may experience when both signup and login options are presented on a single screen. By separating these functions, we hope to enhance user experience and streamline the onboarding process, ultimately increasing user retention and encouraging new users to choose our application over competitors.

Experiment Setup (Using Firebase):

Platform: Firebase A/B Testing integrated with Remote Config.

Audience: 50% of total active users segmented randomly into two groups (Control and Variant).

Variations:
Variation (A): Combined screen for signup and login with tabs.
Variation (B): Separate screens for signup and login.

Duration:
Around a week, to allow for sufficient data collection.

Tracking in Firebase:

Event: page_view – track total views of the signup/login screens.
Event: signup_success – measure successful completions of the signup process.
Event: login_success – measure successful logins.
Event: cta_click – track engagement with the signup and login buttons.
User Property: auth_test_group – identifies whether the user belongs to variation A or B.

------------------------------------------------------
A/B Test Name: Logo 

User Story Number
All User Stories

Metrics (HEART Framework)
Happiness: User-reported trust and brand perception via post-session surveys
Engagement: Time spent on homepage, scroll depth
Adoption: Click-through rate on primary CTA (e.g., “Get Started”)
Retention: Return visits within 7 days
Task Success: Completion of signup flow from homepage

Hypothesis
Changing the logo to a more modern, visually distinctive design will increase user trust and engagement, leading to higher click-through rates and improved conversion from homepage to signup.

What Problem Are We Trying to Solve?
Our current homepage has a high bounce rate (~62%) and low CTA click-through (~8%). Heatmaps show users often pause near the top of the page but don’t proceed further. We suspect the current logo lacks visual impact and brand clarity, failing to establish trust or recognition. This bottleneck may be causing users to disengage before exploring our value proposition.

By testing a logo redesign, we aim to determine whether a stronger brand identity can improve first impressions and encourage deeper interaction with the homepage.

Experiment
We will use Firebase Remote Config to serve two logo variants:
Control Group (50%): Sees the current logo
Test Group (50%): Sees the redesigned logo

Firebase Analytics will track:
homepage_view_time
cta_click
scroll_depth
signup_completion
logo_variant (custom parameter to tag which logo was shown)

We’ll run the experiment for 2 weeks to ensure statistical significance, and all users will be eligible.

Variations
Variant A (Control): Current logo — flat, monochrome, minimalistic
Variant B (Test): Redesigned logo — bold typography, color gradient, subtle animation on hover

