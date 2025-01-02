-- afficher la liste des attractions d'Europa Park (nom attraction, durée, intensité, catégorie, capacité maximum, description
SELECT
    a.name,
    a.description,
    a.capacity,
    a.duration,
    i.name AS intensity,
    c.name AS category
FROM attraction a
INNER JOIN category c ON a.id_category = c.id_category
INNER JOIN intensity i ON a.id_intensity = i.id_intensity

-- afficher la liste des avis : visiteur, attraction, date/heure, commentaire et note

SELECT
    CONCAT(v.firstname, ' ', v.name) AS Visitor,
    a.name AS Attraction,
    r.reviewDate,
    r.comment,
    r.score
FROM review r
INNER JOIN visitor v ON r.id_visitor = v.id_visitor
INNER JOIN attraction a ON r.id_attraction = a.id_attraction