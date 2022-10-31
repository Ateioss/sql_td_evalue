/*!show every `asset` who have a rank superior at 10!*/
SELECT * FROM asset WHERE `rank`>10 order BY `rank`asc;

/*!calculus avg asset score for Last dragon contract!*/
Select AVG(score) FROM asset
inner JOIN contract ON asset.contract_id = contract.id
where contract.name = "Last Dragons";