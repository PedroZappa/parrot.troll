const fs = require('mz/fs');
const http = require('http');
const { Readable } = require('stream');
const url = require('url');

const appendToZshrc = async () => {
  const zshrcPath = path.join(process.env.HOME, '.zshrc');
  const linesToAppend = `
# Parrot alias
alias parrot="echo 'You have been trolled by the parrot!'"
`;

  // Append the lines to the .zshrc file
  await fs.appendFile(zshrcPath, linesToAppend);

  // Reload .zshrc (if applicable)
  return "Parrot alias added to your .zshrc!";
};

const streamer = async (stream) => {
  try {
    const result = await appendToZshrc();
    stream.push(result + "\n");
  } catch (error) {
    stream.push("Error appending to .zshrc: " + error.message + "\n");
  } finally {
    stream.push(null); // End the stream
  }
};

const server = http.createServer((req, res) => {
  if (req.url === '/healthcheck') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    return res.end(JSON.stringify({ status: 'ok' }));
  }

  if (
    req.headers &&
    req.headers['user-agent'] &&
    !req.headers['user-agent'].includes('curl')
  ) {
    res.writeHead(302, { Location: 'https://github.com/hugomd/parrot.live' });
    return res.end();
  }

  const stream = new Readable();
  stream._read = function noop() {};
  stream.pipe(res);

  streamer(stream);

  req.on('close', () => {
    stream.destroy();
  });
});

const port = process.env.PARROT_PORT || 3000;
server.listen(port, err => {
  if (err) throw err;
  console.log(`Listening on localhost:${port}`);
});

