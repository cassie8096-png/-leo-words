# Validation

Tested in the in-app browser on 20 October 2026:

- Home renders its three large entries; a narrow layout stacks them vertically.
- Adventure initially shows only the large Year 6 tree, with its year label inside.
- Starting the first tree automatically grows a bare tree from the ground; no learning reward is issued. Reloading and re-entering does not replay it.
- Meaning precedes understanding. A wrong meaning choice stays on that step and shows retry feedback.
- Only a correct meaning answer reaches spelling study. Recall removes the target and its example sentence from the displayed page.
- The game-owned letter keyboard works without a predictive input field. An incorrect spelling shows retry feedback. Study-and-hide clears the attempt.
- Correct spelling completes the whole challenge and awards exactly one leaf. Reload preserves 1/50 leaves and does not award another.
- Forest lists Cherry Blossom → Golden Wishing → Crystal → Rainbow, with later seeds beneath the soil. Stamp Book opens separately.

`node --test tests/engine.test.mjs`: four tests pass. Checks cover leaf/flower/tree boundaries, Year 7 at 300 and Year 8 at 600 challenges, independent Maths progress, and review scheduling after two intervening challenges. Later-year lessons are deliberately outside the MVP. Progression boundary testing is programmatic; 300 browser challenges were not manually completed.
