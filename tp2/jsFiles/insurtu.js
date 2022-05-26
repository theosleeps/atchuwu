//js pour insérer un utilisateur

function ins_user() {

  const urlget = "http://127.0.0.1:8080/ords/hr2/users/";

    let idGrand = 0; //prochain id a assigner

    fetch(urlget)
        .then((resp) => resp.json())
        .then(function (data) {
         let users = data.items; //.results;
         return users.map(function (user) {
          if (user.id_utilisateur > idGrand) {
            idGrand = user.id_utilisateur;
          }
        });
    })
  .catch(function (error) {
    console.log(JSON.stringify(error));
  });
  
  
    let email = document.getElementById("email").value;
    let mdpasse = document.getElementById("password").value;
    let code_civique = document.getElementById("codeCivique").value;
    let rue = document.getElementById("rue").value;
    let ville_etc = document.getElementById("ville").value;
    let province = document.getElementById("province").value;
    let apt_suite = document.getElementById("aptsuite").value;
    let date_banni = null;

    const user = {
        id_utilisateur: idGrand + 1,
        date_banni: date_banni,
        mdpasse: mdpasse,
        email: email,
        rue: rue,
        code_civique: code_civique,
        apt_suite: apt_suite,
        ville_etc: ville_etc,
        province: province,
        code_postal: ""
      };
  
      const urlput = "http://127.0.0.1:8080/ords/hr2/users/" + id_utilisateur;
      
    fetch(urlput, {
      method: "PUT",
      headers: { "content-type": "application/json" },
      body: JSON.stringify(user),
    })
      .then((response) => response.json())
      .then((data) => console.log(data))
      .catch(function (error) {
        console.log(JSON.stringify(error));
      });
  }
  