# Bookhaven — Online Bookstore

A full-stack bookstore built with HTML5, CSS3, Vanilla JS, Node.js 20, Express, MySQL 8 and mysql2.

## Requirements
- Node.js 20 LTS and npm
- MySQL 8.0

## Quick start
1. Create the database and tables: `mysql -u root -p < database/schema.sql`
2. Seed sample categories/books: `mysql -u root -p bookstore_db < database/seed.sql`
3. Install backend dependencies: `cd backend && npm install`
4. Copy `.env.example` to `.env` and set your MySQL credentials and a long session secret.
5. Create an administrator: `npm run create-admin` (follow the prompts).
6. Start the app: `npm run dev`
7. Open `http://localhost:3000`.

The frontend is served by Express, so API requests use the same origin. Admin: `/admin/login.html`.

## Important configuration
- Set `SESSION_SECRET` to a random secret of at least 32 characters.
- Set `NODE_ENV=production` behind HTTPS in production. Configure `TRUST_PROXY=1` when deployed behind a trusted reverse proxy.
- Use a production-grade session store (Redis or a MySQL-backed store) before deploying. The default MemoryStore is for local development only.
- Configure backups, HTTPS, rate limiting, monitoring, and an image upload/CDN provider before production use.

## Project structure
```
bookstore-website/
├── database/                 # schema and sample data
├── frontend/                 # customer and admin pages
│   ├── admin/
│   ├── css/
│   ├── js/
│   └── images/
└── backend/
    ├── config/ routes/ controllers/ models/ middleware/ utils/
    ├── scripts/ server.js
    └── package.json
```

## API overview
Public: `GET /api/books`, `GET /api/books/:id`, `GET /api/categories`, `POST /api/orders`, `POST /api/orders/track`.
Admin: `POST /api/admin/login`, `POST /api/admin/logout`, `GET /api/admin/me`, CRUD `/api/books`, CRUD `/api/categories`, `GET /api/admin/orders`, `GET /api/admin/orders/:id`, `PATCH /api/admin/orders/:id/status`, `GET /api/admin/stats`.

All API responses use `{ "success": boolean, "message": string, "data": ... }`. Book list accepts `q`, `category`, `sort`, `page`, and `limit` query parameters.

## Security notes
Passwords are bcrypt-hashed. Admin routes require a session and role check. SQL uses parameterized queries. Checkout recalculates prices from MySQL and locks inventory rows inside a transaction. Order tracking requires both order ID and email or phone. Session cookies are HTTP-only and same-site; production cookies are secure. Request bodies and user input are validated server-side.

This is a university project starter, not a security-certified commerce platform. Add payment-provider integration, email notifications, CSRF protection tailored to your deployment, and a persistent session store before accepting real customer orders.


## Starter book collection

The `database/seed.sql` file inserts 20 sample books across the bookstore categories. It skips titles already present, so it can be run again safely. The catalog page requests 20 books per page so the starter collection is visible together.
# bookstore-online
