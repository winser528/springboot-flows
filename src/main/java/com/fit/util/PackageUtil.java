package com.fit.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

@SuppressWarnings("unused")
public class PackageUtil {

	public static void main(String[] args) throws Exception {
		String packageName = "org";
		// getClassNameByJar1(packageName);
		List<String> classNames = getClassName(packageName);
		// List<String> classNames = getClassNameByJar1(packageName);
		if (classNames != null) {
			for (String className : classNames) {
				System.out.println(className);
			}
		}
		System.out.println(classNames.size());
	}

	/**
	 * 获取某包下（包括该包的所有子包）所有类
	 * 
	 * @param packageName
	 *            包名
	 * @return 类的完整名称
	 * @throws IOException
	 */
	public static List<String> getClassName(String packageName) throws IOException {
		return getClassName(packageName, true);
	}

	/**
	 * 获取某包下所有类
	 * 
	 * @param packageName
	 *            包名
	 * @param childPackage
	 *            是否遍历子包
	 * @return 类的完整名称
	 * @throws IOException
	 */

	public static List<String> getClassName(String packageName, boolean childPackage) throws IOException {
		List<String> fileNames = null;
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		String packagePath = packageName.replace(".", "/");
		Enumeration<URL> urls = loader.getResources(packagePath);
		while (urls != null && urls.hasMoreElements()) {
			URL url = urls.nextElement();
			String urlPath = url.getPath();
			String type = url.getProtocol();
			if ("file".equals(type)) {
				fileNames = getClassNameByFile(url.getPath(), null, childPackage);
			} else if ("jar".equals(type)) {
				fileNames = getClassNameByJar(url.getPath(), childPackage);
			}
		}
		return fileNames;
	}

	/**
	 * 从项目文件获取某包下所有类
	 * 
	 * @param filePath
	 *            文件路径
	 * @param className
	 *            类名集合
	 * @param childPackage
	 *            是否遍历子包
	 * @return 类的完整名称
	 */
	private static List<String> getClassNameByFile(String filePath, List<String> className, boolean childPackage) {
		List<String> myClassName = new ArrayList<String>();
		File file = new File(filePath);
		File[] childFiles = file.listFiles();
		for (File childFile : childFiles) {
			if (childFile.isDirectory()) {
				if (childPackage) {
					myClassName.addAll(getClassNameByFile(childFile.getPath(), myClassName, childPackage));
				}
			} else {
				String childFilePath = childFile.getPath();
				if (childFilePath.endsWith(".class")) {
					childFilePath = childFilePath.substring(childFilePath.indexOf("\\classes") + 9, childFilePath.lastIndexOf("."));
					childFilePath = childFilePath.replace("\\", ".");
					myClassName.add(childFilePath);
				}
			}
		}

		return myClassName;
	}

	/**
	 * 从jar获取某包下所有类
	 * 
	 * @param jarPath
	 *            jar文件路径
	 * @param childPackage
	 *            是否遍历子包
	 * @return 类的完整名称
	 */
	private static List<String> getClassNameByJar(String jarPath, boolean childPackage) {
		List<String> myClassName = new ArrayList<String>();
		String[] jarInfo = jarPath.split("!");
		String jarFilePath = jarInfo[0].substring(jarInfo[0].indexOf("/"));
		String packagePath = jarInfo[1].substring(1);
		try {
			JarFile jarFile = new JarFile(jarFilePath);
			Enumeration<JarEntry> entrys = jarFile.entries();
			while (entrys.hasMoreElements()) {
				JarEntry jarEntry = entrys.nextElement();
				String entryName = jarEntry.getName();
				if (entryName.endsWith(".class")) {
					if (childPackage) {
						if (entryName.startsWith(packagePath)) {
							entryName = entryName.replace("/", ".").substring(0, entryName.lastIndexOf("."));
							myClassName.add(entryName);
						}
					} else {
						int index = entryName.lastIndexOf("/");
						String myPackagePath;
						if (index != -1) {
							myPackagePath = entryName.substring(0, index);
						} else {
							myPackagePath = entryName;
						}
						if (myPackagePath.equals(packagePath)) {
							entryName = entryName.replace("/", ".").substring(0, entryName.lastIndexOf("."));
							myClassName.add(entryName);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myClassName;
	}

	// TODO:
	private static List<String> getClassNameByJar1(String packageName) throws IOException {
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		String packagePath = packageName.replace(".", "/");
		Enumeration<URL> urls = loader.getResources(packagePath);

		List<String> myClassName = new ArrayList<String>();
		/*
		 * if (urls != null) { for (int i = 0; i < urls.length; i++) { URL url =
		 * urls[i]; String urlPath = url.getPath(); // 不必搜索classes文件夹 if
		 * (urlPath.endsWith("classes/")) { continue; } String jarPath = urlPath
		 * + "!/" + packagePath; myClassName.addAll(getClassNameByJar(jarPath,
		 * childPackage)); } }
		 */
		if (urls != null) {
			while (urls.hasMoreElements()) {
				URL url = urls.nextElement();
				String urlPath = url.getPath();
				System.out.println(urlPath);
				// 不必搜索classes文件夹
				if (urlPath.endsWith("classes/")) {
					continue;
				}
				String jarPath = urlPath + "!/" + packagePath;
				myClassName.addAll(getClassNameByJar(urlPath, true));
			}
		}
		return myClassName;
	}

	/**
	 * 从所有jar中搜索该包，并获取该包下所有类
	 * 
	 * @param urls
	 *            URL集合
	 * @param packagePath
	 *            包路径
	 * @param childPackage
	 *            是否遍历子包
	 * @return 类的完整名称
	 */
	private static List<String> getClassNameByJars(URL[] urls, String packagePath, boolean childPackage) {
		List<String> myClassName = new ArrayList<String>();
		if (urls != null) {
			for (int i = 0; i < urls.length; i++) {
				URL url = urls[i];
				String urlPath = url.getPath();
				// 不必搜索classes文件夹
				if (urlPath.endsWith("classes/")) {
					continue;
				}
				String jarPath = urlPath + "!/" + packagePath;
				myClassName.addAll(getClassNameByJar(jarPath, childPackage));
			}
		}
		return myClassName;
	}
}