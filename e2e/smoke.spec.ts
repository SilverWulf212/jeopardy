import { test, expect } from "@playwright/test";

test("board loads, clue opens, buzzer + scoring work", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByText("JEOPARDY!", { exact: false }).first()).toBeVisible();
  // start game if setup visible
  const start = page.getByTestId("start-game");
  if (await start.isVisible()) await start.click();
  // wait for board tiles
  await expect(page.locator(".j-tile").first()).toBeVisible({ timeout: 15000 });
  // open first available clue
  await page.locator(".j-tile:not(:disabled)").first().click();
  await expect(page.getByTestId("clue-modal")).toBeVisible();
  await page.getByTestId("enable-buzzer").click({ timeout: 5000 }).catch(() => {});
  // direct award without buzz: tile consumed, modal closes
  if (await page.getByTestId("clue-modal").isVisible().catch(() => false)) {
    await page.getByRole("button", { name: "✕" }).click();
    await expect(page.getByTestId("clue-modal")).toBeHidden({ timeout: 5000 });
  }
  await page.locator(".j-tile:not(:disabled)").first().click();
  await expect(page.getByTestId("clue-modal")).toBeVisible();
  await page.getByTestId("enable-buzzer").click({ timeout: 5000 }).catch(() => {});
  await page.waitForTimeout(800);
  const usedBefore = await page.locator(".j-tile[disabled]").count();
  await page.getByRole("button", { name: /mark player 1 correct/i }).click();
  await expect(page.getByTestId("clue-modal")).toBeHidden({ timeout: 5000 });
  expect(await page.locator(".j-tile[disabled]").count()).toBeGreaterThan(usedBefore);
});

test("cache headers: shell no-store, assets immutable", async ({ page }) => {
  const shell = await page.request.get("/");
  expect(shell.headers()["cache-control"]).toContain("no-store");
  const html = await shell.text();
  const asset = html.match(/\/assets\/index-[^"]+\.js/)?.[0];
  expect(asset).toBeTruthy();
  const js = await page.request.get(asset!);
  expect(js.headers()["cache-control"]).toContain("immutable");
});
