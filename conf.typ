// Setting the document parameters
#set text(
  font: "New Computer Modern",
)
  
#let custom_line() = line(length: 100%, stroke: 0.5pt + black)

// Defining the elements
#let main_title(title, subtitle) = align(center)[
  #v(1cm)
  = #title
  == #subtitle
  #v(1cm)
]

#let comment(content) = box([
  #v(0.25cm)
  #par(first-line-indent: (amount: 1cm, all: true), justify: true, spacing: 0.25cm, content)
  #h(1fr)
])

#let section(title, points, max_points) = box([
  #v(0.5cm)
  #set text(weight: "bold", size: 16pt)
  #smallcaps[
    #title
    #h(1fr) #points/#max_points
  ]
])

#let alt_section(title) = box([
  #v(0.5cm)
  #set text(weight: "bold", size: 16pt)
  #smallcaps[
    #title
  ]
  #v(0.2cm)
])

#let sub_section(title, points, max_points) = box([
  #v(0.4cm)
  #set text(weight: "bold", size: 12pt)
  #title
  #h(1fr) #points/#max_points
])

#let alt_sub_section(title) = box([
  #v(0.4cm)
  #set text(weight: "bold", size: 12pt)
  #title
  #h(1fr)
])

#let feedback_intro(
  course: none, 
  lab_name: none, 
  lab_nb: none, 
  student1: none,
  student2: none, 
  group: none,
  points: none,
  points_max: none,
  grade: none,
  doc) = {
  set page(
    paper: "a4",
    margin: (x: 2.5cm, top: 4cm, bottom: 2cm),

    header: box([
      #grid(
        align: horizon,
        columns: (1fr,1fr),
        align(left)[
          #smallcaps[PRG1-A]
        ],
        align(right)[
          #image("img/heig_vd-logo.png", width: 3cm)
        ]
      )
      #v(0.25cm)
      #custom_line()
    ]),

    footer: align(left)[
      #smallcaps[Prof. Guy-Michel Breguet, Ylli Fazlija]
      #h(1fr) #context([#here().page()/#counter(page).final().at(0)])
    ],
  )
  

  // Start of document
  main_title(course, "Laboratoire " + lab_nb + " : " + lab_name)
  
  // Student names
  grid(
    columns: (1fr, 1fr),
    align(left)[
      Noms : #student1, #student2 
    ],
    align(right)[
      Groupe : #group  
    ]
  )
  
  v(0.5cm)
  
  // Points total and grade
  grid(align: horizon,
    columns: (1fr, 1fr),
    align(left)[
      #set text(weight: "bold", size: 16pt)
      #smallcaps[Points : #points/#points_max]   
    ],  
    align(right)[
      #set text(weight: "bold", size: 16pt)
      #smallcaps[Note :]
      #h(0.2cm) #box([
        #set text(size: 32pt)
        #grade
      ])
    ]  
  )
  
  v(0.5cm)
  custom_line()
  doc
}