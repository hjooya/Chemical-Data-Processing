from rdkit import Chem
from rdkit.Chem import AllChem

mol = Chem.MolFromSmiles(x)
mh = Chem.AddHs(mol)
AllChem.EmbedMolecule(mh)
pdbblock = Chem.MolToPDBBlock(mh)
open("C:/.../pdbformat.pdb",'w').write(Chem.MolToPDBBlock(mh, flavor=4));
molpdb = "pdbformat.pdb"


















