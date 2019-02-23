## Pitch Manuscript

### Experience Jury
- We've learnt through research papers that the major reason of digital outsidership for seniors is due to lacking human connections in their life. Which explains that half of the people between age 65 and 85 say they never use the internet.
- To help meet new people, in contrast to social networks who let you meet people you already know, we've built a SMS based event creation service for seniors.
- We choose SMS due to the low technical barrier to entry.
- Most people have a phone.
- In the future we plan to also support voice recognition.
- We have yet to validate that our target group would be comfortable with getting a blind date setup over SMS.
- Once a blind date is spawned the staff will book the restaurant and invites will be sent to participants.
- To kickstart the development we plan to seek funding through EU Regional Development fund.
- The service is free for the end user.
- We plan to become economically sustainable through partnerships with restaurants who will revshare with us to get people to their business.
- We plan to market through mobile phone providers invoices and the seniors organization(PRO).
- Our main competitors are other digital services and physical natural meeting points.
- We aim to make PRO our partner rather than a competitor.

### Tech Jury
- We've created a service that will cluster people based on interest and location through SMS.
- We choose SMS due to the low technical barrier to entry.
- We plan in the future to also support voice recognition.
- We have a rails app running message handling workers that currently funnel the conversation through two state machines for onboarding and event orchestration.
- All message handling is temporarily persisted and synchronized through RabbitMQ.
- A separate python service is used for interest and geo-based K-means clustering with a Jaccard-similarity measure based on normalized entity-distance values.

### 60s pitch
- Now, more than ever we lead a predominantly digital life in a digitized society.
- But still, half of all seniors aged 65 to 84 claim to never use the internet.
- A lot of seniors grow increasingly lonely as their friends and family pass away.
- To cure this loneliness we think that they will want to meet new people.
- Our service will bring people together based on interests and locations through low-tech SMS and Voice calls.
- The service is free and we will seek public funding and partner with restaurants through revshare.
- Our largest competitor is PRO which we will seek to make a partner instead.
- In our future, no senior will feel lonely.
