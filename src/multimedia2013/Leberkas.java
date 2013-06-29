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

	static int[] getColumn(BufferedImage image, int columnNumber)
	{
		int height = image.getHeight();
		int[] returnArray = new int[height];
		
		for(int y = 0; y < height; y++)
		{
			returnArray[y] = image.getRGB(columnNumber, y);
		}
		return returnArray;
	}
	
	static List<BufferedImage> sliceFrames(List<BufferedImage> inputList, boolean isHorizontal) {
		List<BufferedImage> returnList = new LinkedList<BufferedImage>();
		int width = inputList.get(0).getWidth();
		int height = inputList.get(0).getHeight();
		int count = inputList.size();
		
		if(isHorizontal)
		{
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
		}
		else
		{
			for(int slicedNumber = 0; slicedNumber < width; slicedNumber++)
			{
				BufferedImage slicedImage = new BufferedImage(count, height, BufferedImage.TYPE_INT_RGB);
				for(int x = 0; x < inputList.size(); x++)
				{
					int[] column = getColumn(inputList.get(x), slicedNumber);
					for(int i = 0; i < column.length; i++)
					{
						//try
						//{
							slicedImage.setRGB(x, i, column[i]);
						//}
						//catch(Exception e)
						//{
						//	System.out.println(String.format("slicedNumber:%d x:%d i:%d", slicedNumber, x, i));
						//}
					}
				}
				returnList.add(slicedImage);
			}
		}
		
		return returnList;
	}
	
	static void writeToDirectory(List<BufferedImage> imageList, String targetDirectory) {
		int i = 0;
		
		for(BufferedImage image : imageList) {
			File outputFile = new File(String.format("%simages%05d.png",targetDirectory, i+1));
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
		boolean isHorizontal = (args[0].equals("h"));

		if(isHorizontal) System.out.println("Slicing horizontally");
		else System.out.println("Slicing vertically");

		List<BufferedImage> imageList = getImageList("split/");
		List<BufferedImage> slicedList = sliceFrames(imageList, isHorizontal);

		writeToDirectory(slicedList, "sliced/");
		System.out.println("done");
	}
}
