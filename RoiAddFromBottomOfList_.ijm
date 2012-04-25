macro "Move items from bottom of list in the ROI manager" {
	Dialog.create("Move items in the ROI manager");
	Dialog.addNumber("Move the last 'n' items up the ROI list: ",1);
	Dialog.addMessage("Select the ROI where you want them inserted after");
	Dialog.show();
	
	noOfGoodRois=Dialog.getNumber();
	inputROI=roiManager("index");
	totalNoOfRois=roiManager("count");
	noOfRoisToMove=totalNoOfRois-(inputROI+1)-noOfGoodRois;
	currentROI=inputROI+1;
	
	if (inputROI==(-1)) exit("Error: Please select the ROI where you want your new n ROIs to be placed under");
	if (currentROI==totalNoOfRois) exit("Error: select the ROI where you want the new ROIs to be placed under");
	
	for (j=0;j<noOfRoisToMove;j++) {
		roiManager("Select",currentROI);
		origLabel=getInfo("roi.name");
		roiManager("Add");//creates the same selection at bottom of list
		roiManager("Delete");//deletes the old selection
		roiManager("Select",totalNoOfRois-1);//selects the new entry at bottom of list
		roiManager("Rename",origLabel);
	}
}