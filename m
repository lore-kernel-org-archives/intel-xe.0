Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25447CD4F45
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753810EF37;
	Wed, 13 May 2026 15:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdA75/vY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oz5RY0EC";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6E310EF11
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 15:05:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64D9jhb03007619
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 15:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=; b=XdA75/vYSLr0ny4t
 D/cAbWk4mVwIy/MtIQX84WsUeEc38OGKLPj47uaDIBsnR/h2Q5rFsUV3ohblqEHX
 foF7wK4gBXCfhheE9y4J+OhTVPoDamAxix0YpkvlqKJ9DtAbZIEr3HjGeAeX4IXW
 DM45+prkTXzN1zjm+luvhym2R/HWy+drkwuD9NDl+f+TtAseMHQ00X3TMXSdiX/+
 wYnOegSXB2C/57hOb/oK3R8NqvIqm57nyiB9zAU9IQJ2h7XnNOBMUvWF5/kySGoq
 9WrCK2p6Qi+F4P3ZzIoi/3DgOSd5ekKSkXFAvOz//yNQips24SJysH8R30RDYTzt
 nK0Lqw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0h6rj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 15:05:36 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-6967fe3eeb1so2302265eaf.0
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778684735; x=1779289535;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=;
 b=Oz5RY0ECl/AiXvivqtWxQK4VbRs0ocPEuCzSGhlP/kFNn53T+YcpLSGhbtZ0gkmLzY
 QSTVYqqaxUkNRuO3/8EGyxATP+NNLlM3JGbAwNvZHjxSnQfJ1XKsdLgoya17suGGPaRi
 Mzvd2o2qqhv2zRB+PUJXPIFxQpoRigOY2Q+kAZSuxp+Pi3nMToZa2J5+GsmCmjltdpyP
 8sY6x22JOcrnNoYNiKztg96kg61eD7mfQZVhw25gsTurXY3JdmZZB6uTt/UhNubYZGf+
 mJMpSLOL83H7l/m+iTHFyLl1fDVBTPxuW9hyIO66MJFSpHpsYsbEup1UQu2eZqcJV7uq
 jQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778684735; x=1779289535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bsywl/vy/bO0mvycRo0hQ76HoXFsjSNG8kLAp5bR0FQ=;
 b=rEegYC0ANWUSg0LpE0anoUSL/PvjOJLSudMWshIkLovKR4MvI6JysqHtzIZ/dnKXPd
 w8JrZruKRk/otFheNLvoeEnVCG0OPxvhoaOy2A6e7t3bc4uzLW66FN0QUW7TKRHtXDzq
 Zvgb8iP+0x0xwc3Ik1NaE9ITU7TU5y+CzAak0L3QUElA+HMBdzBeYsXK7tXkdrkwev1z
 Mx1yx3H3bQ837HGLfmK8gInhCSYBU+gYmljs+AWsLQUKISkpofUzAF0UoIQ2V9n3o5Af
 9OWfysU1vX0eoeNNiFwlZVJ8tUMJLOgv5btCGkTJuRgnmBKdAwUAkjSxcSoSJmVRZOdw
 BiSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Puqs7hKbz4rStF8VHyZwFksxOvEuLsVqIq9mHUNI9M9YU6Ikkqz/MFbzTnyUlM4bwqrNSh1KxSQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjpp/8tgD7k20apF9w6rQgWiQRo/YBEfQ/QadVGsgjLKXqIKXx
 F14HKvuJS/269R9jYdTX9teKKHznDb2BySWdJ7RA+cSHKvl/RZvdp9KbQZKWolJ3X1BbEGI6mni
 qpuHf583B1640hBjzBWjqu8TImMKuqa1HQxFIHD0kSmVD90Id+8tRr5NOmdNjeUZOJNNL4g==
X-Gm-Gg: Acq92OFHkdtE9CHlxsEFn4/jbOHNM/sVsGRoZMoJehnbgp4xg5PSl3zYPM+Nmqh3LF4
 YqBuf0ojcNR3ul6MF7XFT3kEn5t0hGXaJ+8Yuaw84O5hI5dUyFfIJntGpxiXsLWilUNYEm7gDWD
 TwVXVCJtJQ10nqTSUAr5Mi3U5gBtft6EmuNiYA9u5OLuSrxvOjlKRfxhVTeMpApY8yqQ/9hXs9n
 zXLoDd8kWgXEltV/vFW4MDKQ2hdaDG5kPWAZ8DwDfpOn5uOX+HuSYRk2cQ3ie+fwe2l/pqMfYOT
 yHKQPTOiODi8eVhORoFG0mObJ4/Yp0eP4tSyulN3ur2ypJdVLhcjjTDEVWfO6hVLCpJ4NGSjebG
 49OjQRyuRr8dLW6+Ib/SyNdSa/CyMj9YM7RpLh0e3XiAfz/mCpA==
X-Received: by 2002:a05:6820:81c8:b0:694:8fb2:2c35 with SMTP id
 006d021491bc7-69b78d11428mr2055208eaf.2.1778684735326; 
 Wed, 13 May 2026 08:05:35 -0700 (PDT)
X-Received: by 2002:a05:6820:81c8:b0:694:8fb2:2c35 with SMTP id
 006d021491bc7-69b78d11428mr2055135eaf.2.1778684734742; 
 Wed, 13 May 2026 08:05:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:05:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:53 +0200
Subject: [PATCH v6 6/6] driver core: platform: tests: add test cases for
 correct swnode removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-6-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6353;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d24dFtlvfMuawvdaUyIJH818bPfYa2BlcPpS/IedBHc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMq1jvlIrjR+1YjAHxLTODuz/d6Jvy9zNVaq
 VH0oioMXqKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTKgAKCRAFnS7L/zaE
 w/kVD/9g7s3fsgMqRqQDYlvSLGPgfIEBS/V02e792MpgIbfqbt3OrJE3pCAhbXHDtUj1TSm/Hn+
 sCgRxmmGSjSKA1yyYG6q6ssgJF/wbHBeanRYyo8X1UUx3jKw3aGBNNMJok+6dOszuJH1+TQzCmm
 IkC1Su945CkDf9qGvq/zEeW3y43q559qBKDFTIFuRrPOpd1HjOKnwz40ejS+6tJmNVs6WcQXBw/
 fMaE5sesCr/Hk2xuw/PiPjNiNkIDM81dnmY7H+CYXY/REWh4wmMu5z8IlWNGMVRn53eXAKow650
 4lYR5frk0zW+b2bXKX0ZBI6I0y2lU03MHRzJiD7XnVxHexSXC8e39AvgKJ0KfSzxJaSS5pZLFLM
 uIVYWedC4YBdY7zNd3QAb7MSPyHy6jBdlIArcYW02SrFmHp/3u/gdeEcPOA01qZmvwp9xWBBug4
 AiAiXIPtjeHqbEUvgLso3T8JU/xD81qjWqtSRpHsT1Fv/wM4SOCN1jJ/LwDkctyhGA2jt8Cxr9U
 1y5oTIuBfxY1YueWcahkTJerriXbrZhefQ6u+j2+EAVLzHaVGaocjgULZRJhJs4FQ0lU/dULB5t
 KRRdXoFLhLSaCn1wuBGoboof4TVxdMErbJ62u4tH4JuGngxfXuYYVjKPVyrapCL0S5AsEK+czxG
 8JCBEswJPqdyd1Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX3q/6o+dNUGtZ
 +qvOj1KrE5c+ry7I42VeJB9jc1/sz4B+MxOYJdlHsBygdGh4fjPcWiyBDQ6PcCYUQe2FgPYGTiC
 68W2Lzv/iWQZ/8QInpJbfKRX0hfrgNfLRXy6tdTKurzsCFjinNxHZU0JxMKWWe/PE0n4SppLl8y
 nKAb+LH8UjW7Tiwsl2c7qI1Q9jyOUF2zC7X19HTj0SohWiN8efB4al8QoKPY85kP717Pzavmk+p
 T/9LNxQbpht7q/X8+zdmMYDwMUBJgXN/IWGEepX6GkrmPIE7CQTZJiPnmTUrG3OpxdYeGE0y1wI
 7r/cEIe+nqHcSe+59Qfm54Er1QRli+zvSZYDW8VnGEg7LTFSxcQFumSuWPGwwSf1DPGpMwdgXXM
 eq6AlaajXeDho6YSfmWhKufpCx1ghjXKNKFkcmCMowes9Q58mxgcbSBaBAkASO7V5XJXmJ/oO/S
 LQC0d5At4E0YTskYyYg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a049340 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zydxXWD-JFuk5BhJ14wA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: FxgJ-4K0V0a3Alm2Ns0qI24tPW6DD4_5
X-Proofpoint-GUID: FxgJ-4K0V0a3Alm2Ns0qI24tPW6DD4_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154
X-Mailman-Approved-At: Wed, 13 May 2026 15:13:19 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 166 +++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..69551f01eb82caba58fb79cbc230c3c74d0fb3e5 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/resource.h>
 
 #include <linux/device.h>
 #include <linux/device/bus.h>
+#include <linux/fwnode.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEVICE_NAME "test"
 
@@ -253,9 +256,172 @@ static struct kunit_suite platform_device_match_test_suite = {
 	.test_cases = platform_device_match_tests,
 };
 
+static int platform_device_swnode_test_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver platform_swnode_test_driver = {
+	.probe = platform_device_swnode_test_probe,
+	.driver = {
+		.name = DEVICE_NAME,
+	},
+};
+
+static const struct software_node platform_device_test_swnode = { };
+
+/*
+ * Check that reusing a software node works correctly. If the call to
+ * platform_device_register_full() fails after adding the secondary firmware
+ * node, the software node must be unregistered in the device's release()
+ * callback or the subsequent call to platform_device_register_full() will fail
+ * with -EBUSY due to the software node already having been registered.
+ */
+static void platform_device_swnode_add_twice(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(&fwnode, NULL);
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = &fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+}
+
+/*
+ * Check that passing a software node as the primary firmware node of the
+ * platform device does not result in it being unregistered by the call to
+ * device_remove_software_node() in its release path.
+ */
+static void platform_device_swnode_as_primary(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, software_node_fwnode(&platform_device_test_swnode));
+}
+
+/*
+ * Check that passing two software nodes to platform_device_register_full()
+ * fails.
+ */
+static void platform_device_two_swnodes(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_U32("foo", 42),
+		{ }
+	};
+
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &platform_device_test_swnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_two_swnodes),
+	{}
+};
+
+static struct kunit_suite platform_device_swnode_test_suite = {
+	.name = "platform-device-swnode",
+	.test_cases = platform_device_swnode_tests,
+};
+
 kunit_test_suites(
 	&platform_device_devm_test_suite,
 	&platform_device_match_test_suite,
+	&platform_device_swnode_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for platform devices");

-- 
2.47.3

