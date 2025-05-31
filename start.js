const { spawn } = require('child_process');

// Start your main application using spawn
const appProcess = spawn('node', ['server.js']);

// Event handlers for the spawned process
appProcess.on('error', (error) => {
    console.error('Error starting main application:', error);
});

appProcess.on('exit', (code) => {
    console.log(`Server exited with code ${code}`);
});

appProcess.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
});

appProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
});
