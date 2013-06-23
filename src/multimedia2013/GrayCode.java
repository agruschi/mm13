package multimedia2013;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;

public class GrayCode {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try
		{
			if (args.length < 1)
			{
				throw new IllegalArgumentException();
			}
			String inputFileName = args[0];
			String outputFileName = inputFileName + ".gray";
			if (args.length >= 2) {
				outputFileName = args[1];
			}
			File inputFile = new File(inputFileName);
			File outputFile = new File(outputFileName);

			BufferedImage image = ImageIO.read(inputFile);
			
			for(int x = 0; x < image.getWidth(); x++)
			{
				for(int y = 0; y < image.getHeight(); y++)
				{
					int cByte = image.getRGB(x, y);
					int b = (cByte >> 1) ^ cByte;
					image.setRGB(x, y, b);
				}
			}
			ImageIO.write(image, "png", outputFile);
			System.exit(0);
		}
		catch (IllegalArgumentException e)
		{
			System.out.println("Usage: graycode <input file> [<output file>]");
			System.exit(1);
		}
		catch (FileNotFoundException e)
		{
			System.err.println("File not found");
			System.exit(1);
		}
		catch (IOException e)
		{
			System.err.println("Failed to read/write");
			System.exit(1);
		}
		
	}

}
