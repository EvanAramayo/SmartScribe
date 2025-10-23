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



