exports.handler = async () => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Code Insight AI Lambda is running",
    }),
  };
};