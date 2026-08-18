// ============================================================
//  CV — source unique. Compile avec :  typst compile cv.typ
// ============================================================

#let nom = "Junot NOM"
#let titre = "Développeur Mobile & Backend"
#let email = "prenom.nom@example.com"
#let github = "github.com/tonpseudo"
#let linkedin = "linkedin.com/in/tonpseudo"
#let ville = "Île-de-France, France"

// ---------- Thème ----------
#let accent = rgb("#1a1a1a")
#let muted = rgb("#6b6b6b")
#let rule = rgb("#d8d8d8")

#set page(
  paper: "a4",
  margin: (x: 1.7cm, top: 1.4cm, bottom: 1.4cm),
)

#set text(
  font: ("Inter", "New Computer Modern Sans"),
  size: 9.7pt,
  lang: "fr",
  fill: accent,
)

#set par(justify: false, leading: 0.62em)

#show link: it => text(fill: accent, underline(offset: 2pt, stroke: 0.4pt + muted, it))

// ---------- Composants ----------

#let section(titre) = {
  v(0.9em)
  block(
    width: 100%,
    stroke: (bottom: 0.6pt + rule),
    inset: (bottom: 0.35em),
    text(size: 9pt, weight: "bold", tracking: 0.12em, upper(titre)),
  )
  v(0.5em)
}

// Une expérience / formation
#let entree(poste, structure, periode, lieu: none, puces: ()) = {
  block(breakable: false, width: 100%, {
    grid(
      columns: (1fr, auto),
      align: (left, right),
      text(weight: "bold", poste),
      text(size: 8.8pt, fill: muted, periode),
    )
    v(-0.35em)
    grid(
      columns: (1fr, auto),
      align: (left, right),
      text(size: 9.2pt, fill: muted, structure),
      if lieu != none { text(size: 8.8pt, fill: muted, lieu) } else { [] },
    )
    if puces.len() > 0 {
      v(0.25em)
      for p in puces {
        block(inset: (left: 0.9em), {
          text(fill: muted, sym.dot.c)
          h(0.5em)
          p
        })
        v(-0.45em)
      }
      v(0.45em)
    }
  })
  v(0.55em)
}

// Ligne de compétences
#let skill(categorie, valeurs) = {
  grid(
    columns: (5.5em, 1fr),
    column-gutter: 0.6em,
    text(weight: "bold", size: 9.2pt, categorie),
    valeurs,
  )
  v(0.3em)
}

// ============================================================
//  EN-TÊTE
// ============================================================

#align(center, {
  text(size: 21pt, weight: "bold", tracking: 0.02em, nom)
  v(-0.45em)
  text(size: 10.5pt, fill: muted, titre)
  v(0.15em)
  text(size: 8.8pt, fill: muted, {
    link("mailto:" + email)[#email]
    [ #sym.dot.c ]
    link("https://" + github)[#github]
    [ #sym.dot.c ]
    link("https://" + linkedin)[#linkedin]
    [ #sym.dot.c ]
    ville
  })
})

// ============================================================
//  PROFIL
// ============================================================

#section("Profil")

Développeur mobile et backend spécialisé React Native (TypeScript) et Go.
Je conçois des applications de bout en bout : interface, API GraphQL, base de
données et chaîne de déploiement. Actuellement chez ZBO Media (Groupe Figaro),
où je travaille sur des produits mobiles à forte audience.

// ============================================================
//  EXPÉRIENCE
// ============================================================

#section("Expérience professionnelle")

#entree(
  "Développeur Mobile & Backend",
  "ZBO Media — Groupe Figaro",
  "20XX — aujourd'hui",
  lieu: "Paris",
  puces: (
    [Développement d'applications mobiles React Native / TypeScript.],
    [Conception et maintenance d'APIs GraphQL en Go, adossées à PostgreSQL.],
    [Mise en place et maintien de pipelines CI/CD sur GitHub Actions.],
    [#emph[À compléter :] une réalisation avec un chiffre — audience, temps de build, latence, taux de crash.],
  ),
)

#entree(
  "Intitulé du poste",
  "Entreprise",
  "20XX — 20XX",
  lieu: "Ville",
  puces: (
    [Supprime ce bloc s'il n'est pas utile, ou duplique-le pour une expérience de plus.],
  ),
)

// ============================================================
//  PROJETS
// ============================================================

#section("Projets")

#entree(
  "Élite — application d'entraînement et de nutrition",
  "Projet personnel · React Native, Go, GraphQL, PostgreSQL",
  "20XX — aujourd'hui",
  puces: (
    [Application mobile combinant périodisation de force et suivi nutritionnel.],
    [Backend Go en architecture hexagonale (ports \& adapters), API GraphQL,
     PostgreSQL managé, déploiement sur Cloud Run.],
    [Moteur de calcul d'e1RM en charge additionnelle, cycles Volume / Force /
     Explosivité, et système de flexibilité glucidique à protéines et lipides fixes.],
  ),
)

// ============================================================
//  COMPÉTENCES
// ============================================================

#section("Compétences techniques")

#skill("Mobile", [React Native, TypeScript, React])
#skill("Backend", [Go, GraphQL, REST, architecture hexagonale])
#skill("Données", [PostgreSQL, Neon])
#skill("Infra", [GitHub Actions, Google Cloud Run, Docker])
#skill("Outils", [Git, Typst, \u{2026}])

// ============================================================
//  FORMATION
// ============================================================

#section("Formation")

#entree(
  "Intitulé du diplôme",
  "Établissement",
  "20XX — 20XX",
  lieu: "Ville",
)

// ============================================================
//  DIVERS
// ============================================================

#section("Divers")

#skill("Langues", [Français (langue maternelle), Anglais (professionnel)])
#skill("Sport", [Street lifting — traction et dips lestés — et course à pied.])
