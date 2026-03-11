onRecordAfterCreateSuccess((e) => {
  triggerHugoBuild();
  e.next();
});

onRecordAfterUpdateSuccess((e) => {
  triggerHugoBuild();
  e.next();
});

onRecordAfterDeleteSuccess((e) => {
  triggerHugoBuild();
  e.next();
});

function triggerHugoBuild() {
  const res = $http.send({
    method: "POST",
    url: "https://api.github.com/repos/hectorsector/oya-test/actions/workflows/hugo.yml/dispatches",
    headers: {
      Authorization: "Bearer " + $app.settings().meta.appName, // use a secret instead
      Accept: "application/vnd.github+json",
    },
    body: JSON.stringify({ ref: "main" }),
  });
}
