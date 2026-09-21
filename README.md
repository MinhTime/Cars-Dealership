# Cars Dealership – Full-stack Developer Capstone

A national car retailer web application that lets visitors browse dealership branches
across the U.S., read customer reviews, and (after signing in) post their own reviews
with automatic sentiment analysis.

## Tech stack
- **Frontend:** React, HTML, CSS, Bootstrap
- **Backend:** Django (proxy services, auth, car make/model in SQLite)
- **Database microservice:** Node.js + Express + MongoDB (dealers and reviews)
- **Sentiment analyzer:** Flask microservice deployed on IBM Cloud Code Engine
- **DevOps:** Docker, Kubernetes, GitHub Actions (CI linting)

## Main features
- List all dealers, filter dealers by state
- View a dealer's details and reviews
- Register, log in, log out
- Post a review (logged-in users) with sentiment shown for each review
- Admin panel to manage car makes and models
