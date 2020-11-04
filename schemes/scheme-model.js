// scheme-model
const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes as sc")
    .join("steps as st", "sc.id", "st.scheme_id")
    .select(
      "st.step_number",
      "sc.scheme_name as scheme",
      "st.instructions",
      "st.id as id"
    )
    .where({ "sc.id": id })
    .orderBy("st.step_number", "asc");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(id => {
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id })
    .then(count => {
      if (count) {
        return findById(id);
      } else {
        return Promise.resolve(null);
      }
    });
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
