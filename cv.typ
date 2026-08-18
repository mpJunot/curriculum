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
// Une seule couleur d'accent, posée sur le nom, les titres de section et le
// filet. Tout le reste est noir ou gris.
#let accent = rgb("#1c4b63")
#let encre = rgb("#1a1a1a")
#let muted = rgb("#5f6b73")
#let filet = rgb("#d4dade")
#let puce = rgb("#eaf0f4")

#set page(
  paper: "a4",
  margin: (x: 1.5cm, top: 0.95cm, bottom: 0.7cm),
)

// Helvetica en local, Liberation Sans (métriques Arial) sur la CI : la mise en
// page ne bouge pas entre les deux.
#set text(
  font: ("Helvetica Neue", "Arial", "Liberation Sans", "New Computer Modern Sans"),
  size: 8.3pt,
  lang: "fr",
  fill: encre,
)

#set par(justify: false, leading: 0.58em)

#show link: it => text(fill: accent, it)

// ---------- Composants ----------

#let section(titre) = {
  v(0.1em)
  text(size: 8.6pt, weight: "bold", fill: accent, tracking: 0.16em, upper(titre))
  v(0.22em)
  line(length: 100%, stroke: 0.7pt + filet)
  v(0.3em)
}

// Pastille de techno
#let chip(t) = box(
  fill: puce,
  radius: 2.5pt,
  inset: (x: 4.2pt, y: 2.1pt),
  outset: (y: 1.5pt),
  text(size: 8.1pt, fill: accent, weight: "medium", t),
)

// Une expérience / formation / projet
#let entree(poste, structure, periode, lieu: none, puces: (), techs: none) = {
  block(breakable: false, width: 100%, {
    grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      text(size: 10.2pt, weight: "bold", poste),
      text(size: 9pt, fill: muted, periode),
    )
    v(-0.42em)
    grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      text(size: 9.5pt, fill: muted, structure),
      if lieu != none { text(size: 9pt, fill: muted, lieu) } else { [] },
    )
    if puces.len() > 0 {
      v(0.42em)
      for p in puces {
        grid(
          columns: (0.85em, 1fr),
          text(fill: accent, [•]),
          p,
        )
        v(0.18em)
      }
      v(-0.18em)
    }
    if techs != none {
      v(0.22em)
      techs.map(chip).join(h(0.3em))
    }
  })
  v(0.12em)
}

// Ligne de compétences
#let skill(categorie, valeurs) = {
  grid(
    columns: (6em, 1fr),
    column-gutter: 0.8em,
    text(weight: "bold", size: 9.5pt, categorie),
    valeurs,
  )
  v(0.15em)
}

// ============================================================
//  EN-TÊTE
// ============================================================

#text(size: 23pt, weight: "bold", fill: accent, tracking: -0.01em, nom)
#v(-0.4em)
#text(size: 11pt, fill: encre, titre)
#v(0.3em)
#text(size: 8.9pt, fill: muted, {
  link("mailto:" + email)[#email]
  [  #sym.dot.c  ]
  link("https://" + linkedin)[#linkedin]
  [  #sym.dot.c  ]
  link("https://" + github)[#github]
  [  #sym.dot.c  ]
  ville
})

#v(0.75em)

Développeur React côté interface, Go et Node.js côté API, diplômé d'Epitech Paris. Je construis
des applications de bout en bout — écran, API GraphQL, PostgreSQL, déploiement conteneurisé — et
je les livre en production.

// ============================================================
//  EXPÉRIENCE
// ============================================================

#section("Expérience")

#entree(
  "Développeur React & Go",
  "ZBO Media — Groupe Figaro",
  "Mai 2026 — aujourd'hui",
  lieu: "Paris",
  puces: (
    [Conception et développement de #strong[Growth Hub], plateforme SaaS de
     prospection B2B multicanale (LinkedIn + email).],
    [Moteur de séquences sur workers Go et file de jobs PostgreSQL : quotas par canal, reprise après reconnexion, arrêt sur réponse.],
    [Messagerie unifiée, classification IA des réponses en temps réel et #strong[une dizaine de connecteurs externes].],
  ),
  techs: ([Go], [GraphQL], [PostgreSQL], [Next.js], [React], [TypeScript], [Docker], [AWS]),
)

#entree(
  "Développeur React & Node.js",
  "Peinture Soleil",
  "Févr. 2024 — Juin 2024",
  lieu: "Saint-Benoît, La Réunion",
  puces: (
    [Application web de gestion de projets développée de bout en bout : modélisation, API REST, interface, mise en production.],
  ),
  techs: ([React], [TypeScript], [Node.js], [PostgreSQL], [Docker]),
)

// ============================================================
//  PROJETS
// ============================================================

#section("Projets")

#entree(
  "Élite — entraînement et nutrition",
  "Projet personnel",
  "2026",
  puces: (
    [Application mobile de périodisation de force et de suivi nutritionnel : calcul de la charge
     maximale estimée, cycles Volume / Force / Explosivité. Backend Go en architecture hexagonale
     (ports \& adapters), API GraphQL, déploiement sur Cloud Run.],
  ),
  techs: ([React Native], [Go], [GraphQL], [PostgreSQL], [Cloud Run]),
)

#entree(
  "Epitrello — gestion de projet collaborative",
  "Projet Epitech",
  "2025",
  puces: (
    [Boards, listes, cartes et assignations partagées ; API GraphQL avec
     authentification et souscriptions temps réel.],
  ),
  techs: ([Next.js], [NestJS], [PostgreSQL], [Prisma]),
)

#entree(
  "CopyMe — analyse de mouvements sportifs par IA",
  "Projet Epitech",
  "2024",
  puces: (
    [Analyse du geste au basketball à partir d'une vidéo, via un modèle de vision
     YOLO exposé par une API FastAPI.],
  ),
  techs: ([React Native], [Python], [FastAPI], [YOLO]),
)

// ============================================================
//  COMPÉTENCES
// ============================================================

#section("Compétences")

#skill("Langages", [Go, TypeScript, JavaScript, Python])
#skill("Stack", [React, Next.js, React Native, Node.js, NestJS, GraphQL, REST])
#skill("Infra", [PostgreSQL, sqlc, Docker, GitHub Actions, AWS, Cloud Run, Claude Code, archi. hexagonale])
#skill("Langues", [Français (langue maternelle), Anglais (avancé), Espagnol (intermédiaire)])
#skill("Sport", [Musculation et street lifting])

// ============================================================
//  FORMATION
// ============================================================

#section("Formation")

#entree(
  "Expert en Technologies de l'Information — titre RNCP niveau 7",
  "Epitech Paris — Programme Grande École",
  "2022 — 2026",
  lieu: "Paris",
  puces: (
    [Échange universitaire Computer Science & Intelligence Artificielle —
     Beijing Jiaotong University, Pékin (sept. 2024 — juil. 2025).],
  ),
)
