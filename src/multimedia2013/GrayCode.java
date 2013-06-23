package multimedia2013;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.nio.ByteBuffer;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;

public class GrayCode {

	public static BufferedImage copy(BufferedImage bi)
	{
	    BufferedImage biCopy = new BufferedImage(bi.getWidth(), bi.getHeight(), BufferedImage.TYPE_INT_RGB);
 
	    for (int x = 0; x < bi.getWidth(); x++) {
	        for (int y = 0; y < bi.getHeight(); y++) {               
	            int gray = bi.getRaster().getPixel(x, y, (int[]) null)[0];
	            int rgbVal = (gray << 16) + (gray << 8) + (gray); 
	            biCopy.setRGB(x, y, rgbVal);
	        }
	    }
	    return biCopy;
	}

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
			image = copy(image);

			for(int x = 0; x < image.getWidth(); x++)
			{
				for(int y = 0; y < image.getHeight(); y++)
				{
					int cByte = (image.getRGB(x, y) & 255);
					byte[] byteArr = ByteBuffer.allocate(4).array();
					byteArr[0] = (byte)255;
					byteArr[1] = byteArr[2] = byteArr[3] = (byte)((cByte >> 1) ^ cByte);
					int b = ByteBuffer.wrap(byteArr).getInt(); 
					image.setRGB(x, y, b);
				}
			}
			ImageIO.write(image, "png", outputFile);
			System.exit(0);
		}
		catch (IllegalArgumentException e)
		{
			System.out.println("Usage: graycode <input file> [<output file>]");
			System.exit(-1);
		}
		catch (FileNotFoundException e)
		{
			System.err.println("File not found");
			System.exit(-1);
		}
		catch (IOException e)
		{
			System.err.println("Failed to read/write");
			System.exit(-1);
		}
		
	}

}
