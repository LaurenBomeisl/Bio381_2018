

Homework #2																	Lauren Bomeisl



Research Objectives

- What is the current range of characteristics representative of land management of subsistence agriculture and in-stream water quality at the headwaters in the Ambato river watershed?
- How do hydrologic and nutrient transport processes respond to changes in land use specific to management practices in the Ecuadorian Andes for permanent grass, crop cultivation, and cattle grazing over annual time scales?
- How do hydrologic and nutrient transport processes differ between operations on steep hill slopes (30%) and mild valley slopes (5%) provided land use, precipitation, and soils that are representative of the Ecuadorian Andes.
- Which resources could most effectively inform land management to reduce nutrient losses for the climatic, cultural, and topographic conditions that currently exist in the Ecuadorian Andes?

```mermaid
graph LR
A(Slope)-->|APEX|D[Beneficial]
B(PPT)-->|APEX|D
C(Land Use)-->|APEX|D
D-->E{Effective </br> Potential Resources}
F(Socio-Economic </br> Opportunity)-->G[Accessible]
G-->E
H(Cultural Values)-->I[Feasibile]
I-->E
style A fill: #7fffd4
style B fill: #7fffd4
style C fill: #7fffd4
style D fill: #7fffd4



```

This study only explores potential resources based on agronomic benefits, such that the mitigation of nutrient loss from field to stream enhances nutrient use efficiency. Additional conditions to consider regarding effective resources, including accessibility and feasibility, are not addressed in this study, but are acknowledged as equivocally valuable and an opportunity for future research in this region. 

```mermaid


graph TD
%%TD: top down, LR: left right
A[<b>Andean</br> Agricultural</br> Operations] -->B1(Valley)
    A --> B2(Hillslope)
    B1 --> C1[Dry]
    B1 --> C2[Wet]
    B2 --> C3[Dry]
    B2 --> C4[Wet]
    C1 --> D1[Livestock]
    C1 --> D2[Crop]
    C2 --> D3[Livestock]
    C2 --> D4[Crop]
    C3 --> D5[Livestock]
    C3 --> D6[Crop]
    C4 --> D7[Livestock]
    C4 --> D8[Crop]
    
    
    
    
    %%		 C -->|One| D[Result <br/> <b>one</b>]
    %%<br/> line break
    %%<b> bold and end </b> for one word
    %%		C -->|Two| E[<b>Result</b> two]
    %%		style A fill: #7fffd4
    %%style to fill in background color, see color-hex.com for codes
    %%fill is the color, stroke is the outline, stroke-width is the width of the outline and ==> for thicker arrows ... see https://mermaidjs.github.io/ for more coding tricks
    
    
```

This flow chart can be used to consider potential resources for informed land management based on topographic, hydrologic, and agronomic characteristics. The potential resources suggested for each outcome are based on biogeochemical and hydrologic conditions which determine nutrient transport processes as illustrated in the following path diagram. 

```mermaid
graph TD
%%TD: top down, LR: left right
    A[Soil Erosion] -->B(<b>Particulate <br/> Nutrient Loss)
    B --> C{Bioavailability}
    D[PPT] --> E[SW]
    O-->B
    E --> C
    D --> A
    H[Land Use]-->G[Fert Type]
    G-->Q
    G-->B
    I(OM)--> J(BD)
    J-->P
    E-->I
    H-->J
    J-->A
    F[Slope]-->A
    F-->E
    G-->I
    L(pH)--> C
    I--> N(CEC)
    E-->N
    N-->O[ANION RETENTION]
    O-->P
    D-->P
    I-->L
    L --> N
    E-->P
    P(<b>Soluble <br/> Nutrient Loss)-->C
    M[Fe, Al]-->O
    Q[Mg, Ca]-->N
    
    
```

```MERMAID
graph TD

%%TD: top down, LR: left right

A[Hard edge] -->B(<b>Round edge)

    B --> C{Decision}

    C -->|One| D[Result <br/> <b>one</b>]

    %%<br/> line break

    %%<b> bold and end </b> for one word

    C -.->|Two| E[<b>Result</b> two]

   D ==> A

   D -.->B

```



Increasing OM: Residue, Manure, NOT slash and burn, planting pits (for arid regions)

​	enhancing soil aggregation

​	reducing anion retention

Reducing Erosion: Residue, Cover Crops, NOT bare fallow, NOT overgraze, NOT slash and burn
