if (!process.env.ADMIN_PASSWORD) {
  throw new Error("ADMIN_PASSWORD environment variable not provided.");
}

var bcrypt = require("bcryptjs");
var adminPasswordHash = bcrypt.hashSync(process.env.ADMIN_PASSWORD, 8);

module.exports = {
  userDir: "/data",
  flowFile: "flows.json",
  flowFilePretty: true,
  uiPort: process.env.PORT || 1880,
  adminAuth: {
    type: "credentials",
    users: function (username) {
      return new Promise(function (resolve) {
        if (username === "admin") {
          resolve({
            username: "admin",
            password: process.env.ADMIN_PASSWORD,
            permissions: "*",
          });
        } else {
          resolve(null);
        }
      });
    },
    authenticate: function (username, password) {
      return new Promise(function (resolve) {
        if (username === "admin") {
          bcrypt.compare(password, adminPasswordHash, function (err, result) {
            if (result) {
              resolve({ username: "admin", permissions: "*" });
            } else {
              resolve(null);
            }
          });
        } else {
          resolve(null);
        }
      });
    },
  },
  diagnostics: {
    enabled: true,
    ui: true,
  },
  runtimeState: {
    enabled: false,
    ui: false,
  },
  logging: {
    console: {
      level: "info",
      metrics: false,
      audit: false,
    },
  },
  exportGlobalContextKeys: false,
  externalModules: {},
  editorTheme: {
    palette: {},
    projects: {
      enabled: false,
      workflow: {
        mode: "manual",
      },
    },
    codeEditor: {
      lib: "monaco",
    },
    markdownEditor: {
      mermaid: {
        enabled: true,
      },
    },
    multiplayer: {
      enabled: false,
    },
  },
  functionExternalModules: true,
  functionTimeout: 0,
  debugMaxLength: 1000,
  mqttReconnectTime: 15000,
  serialReconnectTime: 15000,
  httpNodeAuth: process.env.USER_PASSWORD
    ? {
        user: "user",
        pass: process.env.USER_PASSWORD,
      }
    : undefined,
};
