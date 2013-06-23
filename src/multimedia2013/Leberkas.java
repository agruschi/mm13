package multimedia2013;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream.GetField;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;

public class Leberkas {

	static int[] getLine(BufferedImage image, int lineNumber)
	{
		int width = image.getWidth();
		int[] returnArray = new int[width];
		
		for(int x = 0; x < width; x++)
		{
			returnArray[x] = image.getRGB(x, lineNumber);
		}
		return returnArray;
	}
	
	static List<BufferedImage> sliceFrames(List<BufferedImage> inputList) {
		List<BufferedImage> returnList = new LinkedList<BufferedImage>();
		int width = inputList.get(0).getWidth();
		int height = inputList.get(0).getHeight();
		int count = inputList.size();
		
		for(int slicedNumber = 0; slicedNumber < height; slicedNumber++)
		{
			BufferedImage slicedImage = new BufferedImage(width, count, BufferedImage.TYPE_INT_RGB);
			for(int y = 0; y < inputList.size(); y++)
			{
				int[] line = getLine(inputList.get(y), slicedNumber);
				for(int i = 0; i < line.length; i++)
				{
					slicedImage.setRGB(i, y, line[i]);
				}
			}
			returnList.add(slicedImage);
		}
		
		return returnList;
	}
	
	static void writeToDirectory(List<BufferedImage> imageList, String targetDirectory) {
		int i = 0;
		
		for(BufferedImage image : imageList) {
			File outputFile = new File(String.format("%sout%05d.png",targetDirectory, i));
			try {
			ImageIO.write(image, "png", outputFile);
			}
			catch(IOException e) {
				System.out.println("Error writing image #"+1);
			}
			i++;
		}
	}
	
	static List<BufferedImage> getImageList(String directoryName) throws IOException {
		List<BufferedImage> imageList = new LinkedList<BufferedImage>();
		File folder = new File(directoryName);
		
		File[] files = folder.listFiles();
		Arrays.sort(files);
		for (final File fileEntry : files) {
	        if (!fileEntry.isDirectory()) {
	        	String path = fileEntry.getAbsolutePath();
	        	if(path.endsWith("png")) {
		            BufferedImage img = ImageIO.read(new File(path));
		            imageList.add(img);
	        	}
	        }
		}
		
		return imageList;
	}
	
	public static void main(String [] args) throws IOException {
		System.out.println("Start");
		List<BufferedImage> imageList = getImageList("out/");
		List<BufferedImage> slicedList = sliceFrames(imageList);
		writeToDirectory(slicedList, "sliced/");
		System.out.println("done");
	}
}
