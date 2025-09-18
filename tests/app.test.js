const request = require('supertest');
const app = require('../src/app');

describe('Basic app endpoints', () => {
  it('GET / should return JSON with message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('message');
  });

  it('GET /health should return 200', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
  });
});
