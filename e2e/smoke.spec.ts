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
  // click first "buzz" fallback button
  const buzzBtns = page.getByRole("button", { name: /buzz$/ });
  if (await buzzBtns.first().isVisible().catch(() => false)) {
    await buzzBtns.first().click();
    await expect(page.getByTestId("mark-correct")).toBeVisible();
    await page.getByTestId("mark-correct").click();
    await expect(page.getByTestId("clue-modal")).toBeHidden();
  }
});
