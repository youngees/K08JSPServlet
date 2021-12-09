package el;

public class MyELClass {
	
	//주민등록번호를 통해 성별을 판단
	public String getGender(String jumin) {
		String returnStr = "";
		//123456-1234567 형태의 주민번호에서 -(하이픈) 다음 문자의 인덱스를 찾는다.
		int beginIdx = jumin.indexOf("-") + 1;
		//성별에 해당하는 문자를 잘라낸다.
		String genderStr = jumin.substring(beginIdx , beginIdx+1);
		//정수로 변경 
		int genderInt = Integer.parseInt(genderStr);
		//성별 판단 
		if(genderInt == 1 || genderInt == 3) 
			returnStr = "남자";
		else if(genderInt == 2 || genderInt == 4)
			returnStr ="여자";
		else 
			returnStr = "주민번호 오류입니다.";
		
		return returnStr;
	}
	
	//문자열이 숫자로만 이루어져 있는지 판단 
	public static boolean isNumber(String value) {
		//String을 char형 배열로 변환한다.
		char[] chArr = value.toCharArray();
		for(int i=0 ; i<chArr.length ; i++) {
			if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
				return false;//특정 문자가 숫자가 아니면 false 반환
			}
		}
		return true;
	}
	
	//매개변수로 전달한 '단' 만큼의 구구단을 table형태로 반환
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		try {
			sb.append("<table border = '1'>");
			for(int i=2 ; i<=limitDan; i++) {
				sb.append("<tr>");
				for(int j=1 ; j<=9 ; j++) {
					sb.append("<td>" + i + "*" + j + "=" + (i * j) + "</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
