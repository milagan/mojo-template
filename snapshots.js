const PercyScript = require('@percy/script');

// A script to navigate our app and take snapshots with Percy.
PercyScript.run(async (page, percySnapshot) => {
  await page.goto('http://localhost:8080');
  await percySnapshot('mojo_template home page');

  await page.goto('http://localhost:8080/welcome');
  await percySnapshot('mojo_template welcome page');

  await page.goto('http://localhost:8080/hello');
  await percySnapshot('mojo_template hello page');

  await page.goto('http://localhost:8080/index.html');
  await percySnapshot('mojo_template index.html page');
});

