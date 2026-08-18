// ============================================================
//  CV — source unique. Compile avec :  typst compile cv.typ
// ============================================================

#let nom = "Junot MONTPRE"
#let titre = "Développeur React · Go · Node.js"
#let email = "junot-hery-nantenaina.montpre@epitech.eu"
#let github = "github.com/mpJunot"
#let linkedin = "linkedin.com/in/junot-montpre"
#let ville = "Paris, France"
// Repo public : pas de téléphone ni d'adresse ici. Pour une variante envoyée en
// direct, décommente et ajoute #tel dans l'en-tête.
// #let tel = "06 52 07 02 08"

// ---------- Thème ----------
#let encre = rgb("#1f1f1f")
#let bleu = rgb("#2b7fa6")
#let muted = rgb("#6b6b6b")

#set page(
  paper: "a4",
  margin: (x: 1.35cm, top: 0.95cm, bottom: 0.85cm),
)

#set text(
  font: ("Courier Prime", "DejaVu Sans Mono"),
  size: 7.45pt,
  lang: "fr",
  fill: encre,
)

#set par(justify: false, leading: 0.52em)

#show link: it => text(fill: bleu, it)

// ---------- Composants ----------

#let section(titre) = {
  v(0.45em)
  block(
    width: 100%,
    stroke: (bottom: 1pt + bleu),
    inset: (bottom: 0.3em),
    text(size: 9pt, weight: "bold", fill: bleu, tracking: 0.08em, upper(titre)),
  )
  v(0.4em)
}

// Une expérience / formation
#let entree(poste, structure, periode, lieu: none, puces: (), techs: none) = {
  block(breakable: false, width: 100%, {
    grid(
      columns: (1fr, auto),
      align: (left, right),
      text(weight: "bold", poste),
      text(size: 8pt, fill: bleu, periode),
    )
    v(-0.35em)
    grid(
      columns: (1fr, auto),
      align: (left, right),
      text(size: 8.2pt, fill: muted, structure),
      if lieu != none { text(size: 8pt, fill: muted, lieu) } else { [] },
    )
    if puces.len() > 0 {
      v(0.3em)
      for p in puces {
        block(inset: (left: 0.8em), {
          text(fill: bleu, sym.dash.en)
          h(0.5em)
          p
        })
        v(-0.45em)
      }
      v(0.45em)
    }
    if techs != none {
      v(-0.1em)
      block(inset: (left: 0.8em), text(size: 8pt, fill: muted, [Stack : #techs]))
    }
  })
  v(0.38em)
}

// Ligne de compétences
#let skill(categorie, valeurs) = {
  grid(
    columns: (5em, 1fr),
    column-gutter: 0.6em,
    text(weight: "bold", fill: bleu, categorie),
    valeurs,
  )
  v(0.28em)
}

// ============================================================
//  EN-TÊTE
// ============================================================

#text(size: 19pt, weight: "bold", fill: bleu, nom)
#v(-0.55em)
#text(size: 10.5pt, fill: bleu, titre)
#v(0.05em)
#text(size: 8pt, fill: muted, {
  link("mailto:" + email)[#email]
  [ #sym.dot.c ]
  ville
  [ #sym.dot.c ]
  [Permis B]
  linebreak()
  link("https://" + linkedin)[#linkedin]
  [ #sym.dot.c ]
  link("https://" + github)[#github]
})

// ============================================================
//  PROFIL
// ============================================================

#v(0.5em)

Développeur React côté interface, Go et Node.js côté API, dernière année à Epitech Paris.
Je construis des applications de bout en bout — écran, API GraphQL, PostgreSQL, déploiement
conteneurisé — et je les livre en production, en entreprise comme sur mes projets personnels.

// ============================================================
//  EXPÉRIENCE
// ============================================================

#section("Expérience professionnelle")

#entree(
  "Développeur React & Go",
  "ZBO Media — Groupe Figaro",
  "Mai 2026 — aujourd'hui",
  lieu: "Paris",
  puces: (
    [Growth Hub — plateforme SaaS de prospection B2B multicanale (LinkedIn + email), conçue et développée de bout en bout.],
    [Moteur de séquences sur workers Go et file de jobs PostgreSQL : fenêtres d'envoi, quotas par canal, reprise après reconnexion, arrêt sur réponse.],
    [Messagerie unifiée avec classification IA des réponses en temps réel, suivi de délivrabilité et une dizaine de connecteurs externes (email, enrichissement, CRM).],
  ),
  techs: [Go, GraphQL (gqlgen), sqlc, PostgreSQL, Next.js, React, TypeScript, Docker, AWS],
)

#entree(
  "Développeur React & Node.js",
  "Peinture Soleil",
  "Févr. 2024 — Juin 2024",
  lieu: "Saint-Benoît, La Réunion",
  puces: (
    [Conception et développement d'une application web de gestion de projets,
     de la modélisation des données à la mise en production.],
    [Architecture back-end : API REST, schéma PostgreSQL, conteneurisation Docker.],
  ),
  techs: [React, MUI, TypeScript, Node.js, Docker],
)

#entree(
  "Développeur JavaScript",
  "Tiktak Production",
  "Nov. — Déc. 2022",
  lieu: "Saint-Denis, La Réunion",
  puces: (
    [Maintenance et évolution de 4 sites web clients en production.],
    [Nouvelles fonctionnalités, correction de bugs, optimisation des performances.],
  ),
  techs: [HTML5, CSS3, JavaScript, PHP],
)

// ============================================================
//  PROJETS
// ============================================================

#section("Projets")

#entree(
  "Epitrello — outil de gestion de projet collaboratif",
  "Projet Epitech",
  "20XX",
  puces: (
    [Boards, listes, cartes et assignations collaboratives ; API GraphQL avec
     authentification et souscriptions temps réel.],
  ),
  techs: [Next.js, NestJS, PostgreSQL, Prisma],
)

#entree(
  "CopyMe — analyse de mouvements au basketball par IA",
  "Projet Epitech",
  "20XX",
  puces: (
    [Analyse des mouvements de basketball à partir d'une vidéo, via un modèle
     de vision YOLO exposé par une API FastAPI.],
  ),
  techs: [React Native, Python, FastAPI, YOLO],
)

// ============================================================
//  COMPÉTENCES · FORMATION
// ============================================================

#section("Compétences techniques")

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4em,
  {
    skill("Langages", [TypeScript, JavaScript, Go, Python])
    skill("Front", [React, Next.js, React Native, Tailwind, Apollo])
    skill("Back", [Go, Node.js, NestJS, GraphQL (gqlgen), FastAPI])
  },
  {
    skill("Données", [PostgreSQL, sqlc, Prisma])
    skill("Infra", [Docker, GitHub Actions, AWS, Cloud Run])
    skill("Méthodes", [Architecture hexagonale, CI/CD, Git])
  },
)

// ============================================================
//  FORMATION · DIVERS
// ============================================================

#grid(
  columns: (1.55fr, 1fr),
  column-gutter: 1.4em,
  {
    section("Formation")
    entree(
      "Expert en Technologies de l'Information (RNCP 7)",
      "Epitech Paris — Programme Grande École",
      "2022 — 2026",
      lieu: "Paris",
      puces: (
        [Échange Computer Science \& IA, Beijing Jiaotong University, Pékin (sept. 2024 — juil. 2025).],
      ),
    )
  },
  {
    section("Divers")
    skill("Langues", [Français (natif), Anglais (avancé), Espagnol (intermédiaire)])
    skill("Sport", [Musculation et street lifting.])
  },
)
