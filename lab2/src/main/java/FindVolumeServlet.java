import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

@WebServlet("/findVolume")
public class FindVolumeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int LINE_LENGTH = 80;

    public FindVolumeServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type = Integer.parseInt(request.getParameter("type"));
        int t = Integer.parseInt(request.getParameter("t"));
        double result = 0;
        switch (type) {
            case 1:
                result = getParalelVolume(request);
                break;
            case 2:
                result = getCubVolume(request);
                break;
            case 3:
                result = getSferaVolume(request);
                break;
            case 4:
                result = getTetrVolume(request);
                break;
            case 5:
                result = getTorVolume(request);
                break;
            case 6:
                result = getElipsVolume(request);
                break;
            default:
                throw new ServletException();
        }
        request.setAttribute("result", result);
        request.setAttribute("t", t);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private double getParalelVolume(HttpServletRequest request) {
        double s = Double.parseDouble(request.getParameter("Sosn"));
        double h = Double.parseDouble(request.getParameter("h"));
        return s * h;
    }

    private double getCubVolume(HttpServletRequest request) {
        double a = Double.parseDouble(request.getParameter("a"));
        return pow(a, 3);
    }

    private double getSferaVolume(HttpServletRequest request) {
        double R = Double.parseDouble(request.getParameter("R"));
        return 3. / 4 * 3.14 * pow(R, 3);
    }

    private double getTetrVolume(HttpServletRequest request) {
        double a = Double.parseDouble(request.getParameter("a"));
        return pow(a, 3) * sqrt(2) / 12;
    }

    private double getTorVolume(HttpServletRequest request) {
        double R = Double.parseDouble(request.getParameter("R"));
        double rr = Double.parseDouble(request.getParameter("rr"));
        return 2 * pow(3.14, 2) * R * pow(rr, 2);
    }

    private double getElipsVolume(HttpServletRequest request) {
        double a = Double.parseDouble(request.getParameter("a"));
        double b = Double.parseDouble(request.getParameter("b"));
        return 4. / 3 * 3.14 * b * pow(a, 2);
    }
}
