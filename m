Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED17ACD4F39
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFAE10EF34;
	Wed, 13 May 2026 15:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE37I/Ho";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUh6Oeq/";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9F610E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64CB3mhV2186310
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=; b=nE37I/HofdSHCsev
 jOF859YTErogyCaMLEGhAoXMKmFjUf6CR1xMWI9X6hdsRxbdQ0USkEK42xDkpjxh
 YKT+3Wne8BxEI/LOz/1YQu/4/yi+QChNBgIIWU0bxa80ig/P3yuYNow8h+sprdfj
 arEplIdAw+T96EQFOzpEE5jhPEN2MdhcVv1wPgj7swEDVs/dhmpMK/MtxZ913MhB
 XEtXBhTOZF6MTwIxvtKmtTmCo3JYEOVUvc1oTCGKSHRD0QNksXEJUTPc3YwpMgRC
 uRmy0lLSF2H27PqGBLl3yJq/vhlzXTwmiAKSw99CplmKL4GhYFEoezbrcoyMGaKE
 wWLfPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b934-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50d890580e1so91519911cf.3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778587198; x=1779191998;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=;
 b=QUh6Oeq/4gP73olmHd5ydAQD3IycEb0tTI0smAqAqGE2Uk/zg4ytau89hxgBqGmh4p
 fumd1L2LxZImLKoaQLqQOTpBrRXYtL/woWKuphG7kmY4ya96XroPAvk3M7tKFH2/Nc7v
 s5yhF5YQSRB0VkNyf3DjMPWpLBYqDIBnZw7FP7t/MVnEKF3mTo/DozI8UEqeLUaBf9uM
 AehYWKELPF8fKT4mmkOg8LAYjpK0ra4YialXPb8qJwnDZe0tWQdj0sQH0vIbzSkzC69H
 Bv+u4GNkXC/RAPkQXehW8AnL1w5d3zTUyWLKlbO5BZzG8lO7reuWR2sfIWzfWCHBL6Vp
 HCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778587198; x=1779191998;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=;
 b=hHNKzBjZ2jPYgbS+p5U+qtLF7c+lBuING8SuE7CZT/WfIMyN3XPYFO2CgSYqnErveZ
 88QrCBZ85vM1nOT7CiJHyBWplvQPt3zSiQW+mT/fgS4Fpc4NIQoMejCqzJMJOhLGu/6r
 5htpLQlKKsVmYccRpnBakt0VBncGnsjnSlXJbxvkZ2rgS27avqDKj+Ur+BO3a3n0LcnW
 /dC7LvcUAoRj5UT1Wf9BEawu0lKEk5jvXMHlM5EeWwIPdoc2a959XatiKpWm0IYm1gTR
 jcgy0SNKDo6FCCQTt6NBmeWClne83g0O1fJVh35Dx1/iBOU9ASlx4WpFlj3TJLRUdpuM
 Z0Ag==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XAyn1RTciODVWyi8QSdKADs5mgIK847owIb61hhMtgoX5pSEnUBR/M1qHLPLPjMS/PPJzQ7w4gQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygeSmestKWlAioDx+ciriCZ7DzO/nqcDW3SVwphGXWJYyymFNu
 EtFXxX97cvZE2F3hLo5KHbFETrfRptSkvppPUyi5uEKnDkZk9bGlMZ9/hlUxqTNmfDN9fpdRq3y
 wj+EKK1OAtCW2p9m6SwnYpEsVPMXaAXpcd8yAH4BZlBBGesUMc6XARuES/FUr2+1QXZFkDQ==
X-Gm-Gg: Acq92OF+jngv+mBXvpCKQKk+IP+IYMyEMEYKIiZRIp/yG4u8CjTJmVKko/cWx94RFPH
 MCyPJVQjSpwPoEIk11KDi2Lh6Sj/V9RgtQJz1mH/LoHKTlLy46DOFPzasI7p0GJNQ4k59J9ktXE
 NQqs8k8RIBcbXRUuBhsqUVFlvIcQQX3JXsV6xj6FRjtxpQ6AqPK7qhpZF0N4zjbNKlJBC1NTsB2
 PdluX3aPXJQWCEjWQF6Hh50VR7nhTAr6oU7NQeZH1soIAn+pv1rIsa6Gx3ldhZXiYscr3an1j9h
 sH416kASCOFOT5rWKnyVe9cDxLOjm3WK7YTzQQdBCwSms90RYeQL2+TlUCYId/0c7A+6PEJPoKy
 JTXx6MQFyxkkuBXwLL19ZPYGt2kFUasnSlfVGVlr4h9ae8en6YeE=
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id
 d75a77b69052e-514a0baf33dmr202421431cf.53.1778587198300; 
 Tue, 12 May 2026 04:59:58 -0700 (PDT)
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id
 d75a77b69052e-514a0baf33dmr202420971cf.53.1778587197795; 
 Tue, 12 May 2026 04:59:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 04:59:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:25 +0200
Subject: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1hMeu1gCq3SSoVTeNvEzPugi/vqYRk+rwkD702lzSJ0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYv3GAv2eZuGcQuN3eqfuoVY689gc9gsWBu+
 YITubifYASJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLwAKCRAFnS7L/zaE
 w6BGD/0RRzcGDUT1rhONtHIRmNB6WOnJ3706An57VS2M4of4c5Goyy6PGimVshH/GIISNiMllA5
 A+KR/P1hnT+piwAECznIeztfxsH9b6O2KgxpEv7Pe2DBZkwpFQLRJ1eOAypZ3P6SoN27BKK1xi2
 JiKCS8W993kMveLuhFRw0eZtKXXtlBdtWl5zKw2IcwQkdqtkZ0CHevEFq2+hKn1Nt7jRIW/u8bd
 GJkjJuE7a0+fGAXiN4nyYGqdjTn8cjIwO1hsA/S2Z/qbw9wjk0dVMzNz4w+m9aiXOlXtLsxHE4a
 6bhj6GH2Pw0ojuHYB6Qv6dHYkKpsvav/uRy6k8qNZkbv44fUhGT5ytZe9sWG/Vl8JEY8BEMUf7s
 Qq9S9pnAYLL0tvdETWPI0t8R1K093TbTAUYCy3ECON9EMH/uzZWKRLzfxpbSRiVVesCyJdti987
 4IHGaQ90OygyC7CvDSknVUTFbyHQM8IFyJOXMNwFRx/cKE44lebECUFc8Q32dDMV2VSJesUIaru
 ZUHnNIO9Kf7aLso1DRWYryI6+qHoLh0gJETcCkvSjpzo/++uxEzX4Xs300MzzDHsox+mBiiNSDs
 BBqtytrbSkbBWad/CBk1DHnwywe3Bsrv2nM58wVgEIWsW1ml7A+ZuTMkMVe5YYGeTLBBxCaHzNZ
 yrT5web3qDg+Zdw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: m6iAMweYfCQ27KJcjOUCOhRPYsfPS0jp
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a03163e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=9foaQtFGGNcyJ0tOL8QA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX7jGnf5NB8z81
 Czh7mwZuGQZftpzadVxa7J0bcqwZlT9asF+SBhHX90JwnNegFi8i3q9k2wlBWXBm4DSQaTOmXt1
 vwYl/stI//YAEM/AINJg+4es3nd0hWjGfvQAAffUd+RpDZX86edWhMx/5izpBDtgtImHi8n10SM
 9ZOM7NKeXTZPRYvBVsXtnZB+CIuY+r3WhxrLH3kvjCo/5tgLN7xPNBtN3XnB0mCiAOGoH0/hVxN
 Cn1rflLOUFL9YOodFre58sE9skHT1XDuu6n2C+nitZ+4z/1CwbzKC5AoToZmmRjlbgmsM3NJ9w5
 Iz3H4ms6uQ94mMwK5VzH+aMG1R67q1HiHzdAmoXmznn9KzoSYspKabNk5K62a0yEr5oTWnYUMzI
 dfmY+kXD/x5r9caAKOY92p3DvOyMN25jlpftYVZx6MkTrhlln0e2SxeAugIo5g7MGCISNMK6/Mg
 uMjN0Cz5sS3ZX8k4YZQ==
X-Proofpoint-GUID: m6iAMweYfCQ27KJcjOUCOhRPYsfPS0jp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124
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

The software node added to the platform device in
platform_device_register_full() is currently not removed on device
release. In order to fix this, we need to first convert all drivers that
use platform_device_alloc() and then assign a software node as the
primary firmware node to using device_add_software_node() for correct
reference counting.

To that end: provide platform_device_add_software_node() in line with
other existing helpers like platform_device_add_data().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 25 ++++++++++++++++++++++++-
 include/linux/platform_device.h |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 18f33bec36726490255bc7ca3c4ab07d9b7606b0..f617e02b171f6e59a3c40504a71f8915a41e8514 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -613,6 +613,10 @@ static void platform_device_release(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * Note: devices allocated with this function must not have the following
+ * members assigned manually: swnode, resources and dev->platform_data.
+ * Please use the provided helper interfaces.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {
@@ -687,6 +691,25 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);
 
+/**
+ * platform_device_add_software_node - add a software node to a platform device
+ * @pdev: platform device allocated with platform_device_alloc()
+ * @swnode: software node to assign to this device, does not need to be registered
+ *
+ * If this device is already associated with a primary firmware node, add the
+ * software node as the secondary firmware node. Otherwise, make it the primary
+ * firmware node. Register the software node if needed.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int platform_device_add_software_node(struct platform_device *pdev,
+				      const struct software_node *swnode)
+{
+	return device_add_software_node(&pdev->dev, swnode);
+}
+EXPORT_SYMBOL_GPL(platform_device_add_software_node);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
@@ -881,7 +904,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		goto err;
 
 	if (pdevinfo->swnode) {
-		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
+		ret = platform_device_add_software_node(pdev, pdevinfo->swnode);
 		if (ret)
 			goto err;
 	} else if (pdevinfo->properties) {
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e30e2f98cc8f13bc36a63129bd4fcf..bd421506e98fc293c97121693e4bd18b703e41fa 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -19,6 +19,7 @@ struct irq_affinity;
 struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
+struct software_node;
 
 struct platform_device {
 	const char	*name;
@@ -262,6 +263,8 @@ extern int platform_device_add_resources(struct platform_device *pdev,
 					 unsigned int num);
 extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
+int platform_device_add_software_node(struct platform_device *pdev,
+				      const struct software_node *swnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

