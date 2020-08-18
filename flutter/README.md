## 计算 `Gradle` 目录

```java
import java.math.BigInteger;
import java.security.MessageDigest;

public class Main {

    public static void main(String[] args) {
        System.out.println(getHash("https://services.gradle.org/distributions/gradle-5.6.4-all.zip"));
    }

    private static String getHash(String string) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] bytes = string.getBytes();
            messageDigest.update(bytes);
            return new BigInteger(1, messageDigest.digest()).toString(36);
        } catch (Exception e) {
            throw new RuntimeException("Could not hash input string.", e);
        }
    }

}
```
