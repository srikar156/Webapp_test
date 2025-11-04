function formatDate(date) {
  return date.toISOString().split('T')[0]; // YYYY-MM-DD
}

module.exports = {
  formatDate,
};
