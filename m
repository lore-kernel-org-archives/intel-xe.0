Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78586C44507
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3642A10EA23;
	Mon, 13 Jul 2026 15:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVhFl7OE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUesjQBq";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C1A10EA25
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DF8A4u1900451
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=; b=kVhFl7OEgk96yjT0
 mVa7TQ1oKGQVR5q7Z5d4fj/0gvy90stsr5AfLefa0T/l7KlaefyYpWa0WmBtfu+E
 zqF7CklezR/HLnVyafxC/A5ziJlbtdPJhYPHDYJcOcl2skPAPWU0+e3Uv9BtI8p1
 QwOVi88Eg+VNAyoujSh63u86B1jd6OSNCluOen+U2twkPTsJ0tw7HHkGCcTDSI75
 tafXva+tO9SgZkl0XanV/Es/3IlVulUIlB7U3uY2BSGAXlLjfKGYPJtYHnSNeamk
 JwQBpf8mItV1BETpKA5mSrSXTdTCGOtk5AOWg4kw0Qz8Fer+LwC5Nx6QlNdHkuXh
 FaW4aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm37dq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so45721591cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783955540; x=1784560340;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
 b=gUesjQBqaAgTYmT4oZ5iGR3zOieVjJu6BJFcR5BYDCJKzxXsMWaVj+AWGezsfLuFJ8
 TphSqmyrao1urYEycA6dO0lch3Bk/3Y1pKOKE7d4O4L/AhQSst3uhk/XkyqlvY3Z+vPb
 haM4Z2pYnOOQcgxnGwb+XJk1Cp9vgyOpWqg6oDES1q5GSYCPF9mLxL/4Iv2gZDVi56qU
 AlJ5bN4hqINJhGaVEXZV/Cnjy3JwmzRie7ix2ln0zMSoq2CwlhgpCzek2ANhDh1XMqxA
 JCtVsqHfCsZBxGiDFzK3AvobP5yiFP80klZBBL4kvfBjBeZMupv+DQdzQP/pgy0nWIn0
 xgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783955540; x=1784560340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
 b=h/AAws2EVdm47cdM1ccOTQ2r/OCvymPCnlNzbu1Go0xBJbMfdTCvegBFMmNLJKbkjA
 Oxmizd3bzNFGaY7gXaHzgdb43q4ghjUpxIkZF3pCsJu4t0JTjYLg5hz4hg+GABH4xBKj
 0IakH0QWsCL10XCjioViAvUwBtWuPaE5HV6TabYrk5ru2VN1TETNLrUL2bgPQyAPe5xD
 UzGN/+G0fVcyEi53dpYj3Y2IoFviEuqsh+XXrc6Qr7aRZBBnP4BJmROSSpIlZudvhP7q
 7hceRtWdxjuG8eJ6PaMbNMrEPfBXKbsFJn1kT8POPIv/Axti0sS7x1S4CPpHKDQlTGHZ
 ocKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqycEOkUMjvusTSLdBgMV7syhYjbhxQCJ6olf6Tohcq2Q6SgKEhIEdWnTyjmWbTa+HNtCzIdWZY8A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+ozsJiQtJ8pu724JTu4cD37gxG9cRMSIPlWictiBKFdC4jBF2
 GubIkIIArgfkyGm9AKKN9jE+R7JDJ8t809CLk9b/3gjoj6rfsQq7WWEroNqmLAfHWRV65X7oJVW
 HOdAjKpsASeqBO+3VzPKcXsMNmK8haERO8JVPpSdziTxyxilymTPKYzqJ7AsiV6aDTO8Pxg==
X-Gm-Gg: AfdE7cmSEB6oearMDBDZwITxj4uB5sftdk848JjViPvJrZY3Iifljv2khhOWMEz7rk1
 Vy4M3g3XbeGVrUGVrVHIu02jv1MpyX+Lwk42d+G3W8IrCLFIcebBOJL2XTZAO6bHltilt1XQ2mv
 6mFF/J92jG+BoFlRKOmshskfZM0oNsQLY0Fjaspp6HfvEIb4Iu6kk8KSJP5ibH7iFZEXZY2OYMJ
 D1mFGm+UcvlOctq+XiL3reR9oHzXb8lqXqXzSsAZfbLlkQH/vxm8pwv1cdhEDjzhGaSLIqwdsYx
 qxeBJLhlXR+ZfFXV/gXE0c0+Y3SKvNioNd/jdS12llN98K4Pab9w8X/deRAcvCHQ4KKYqtQpmxs
 vNn0/Fm/a5uyMv7hgIlpeAag6XEgx+JsmGqKlLPot
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id
 d75a77b69052e-51cbf3fe1femr91662351cf.83.1783955540019; 
 Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id
 d75a77b69052e-51cbf3fe1femr91661821cf.83.1783955539511; 
 Mon, 13 Jul 2026 08:12:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 08:12:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:57 +0200
Subject: [PATCH v7 1/4] platform/surface: gpe: use
 platform_device_register_full()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQm6Ev5CsTQhlRz56Fas/rrihp1CyWWC4kaoHOMynUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBKTlNOxz9cwYCiWhHNVnX+m3dvLDS8Snmnt
 ETAtF4KuRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASgAKCRAFnS7L/zaE
 w9NMD/wPsPGJwatR1rnJxCsUwV8L2KnB0IOZCNjGmdn84DwM3P/LtTWySo2BWVUdFlYN2CT4C/4
 qrALrOWSlxzHLkMEPGkh0MoMgPmKjiYBkP0oQv/KxaLYSHUPHlWe4bq2Bvr2eO+JhDlCp9QHCaI
 LbqLglT5jrB6MurGhsFyEG8JkvB2pQRRi6qeipTPCFKhb0xQDx9xYbr/YRo4d1rU6t6duVDPj2S
 5IikQmv2kkx18DfbXcTAajxBl/vwwaUtxgL5S96fjKPnDsS8oj18iqwl+dcsOYDuei69Q9G99Nt
 d9aleGx1WW9Cs1vkgJbYYNx/224EdKSPh53xAPSBJQFeDN8Nb+JwkJrTbkc5HdeOOrELH0A5sBR
 hZ/Gh79aWzuh7wVaprBxLAZ8qaRlCm/sUwO53O1gqYOzGoiOGEi1SKNvcVer1jxB2L4EAx3RiOY
 K5kUWFHarCHNYYLbDfTYx/ih07WFJ7Er1LBkD0Ad/GwsxZXwZaAETTRq/7gSxhw812Wmy24UZwa
 AaFmkkAIOahLpJv8+0rvCXfvdLMS9OY6nF53BBnivWQSeAPRAT68B2A2GDcG+0U+WPuxXDTgv/d
 GfqrTmQ6PQo+Mo+NQhZAzHVOCqFpZRuiS3MWrfByGlLAl/Y4mUe+YUw3LtSRR65BUC/NVXeiOAC
 SXu9YrBLHre1Veg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: HphEYffbq6txVPXm0BDoYw_-L8m6MklQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXyVdl5w7U30dz
 rdpDoBYUt8QCFvjPGtkU5rpn7ZVMb2xAt7DoGrJ1BRXiz/3uAECLjqPIJ0zohDjAJhNqIVhbjGY
 6u4x+cOFtP8sFuMoofvIcBMl7JhYoB0gwUseBpjA4ShTbmeqEQiF0vdD7q4L0sumSxnB3dkH+14
 AO2RH6MCWfFIKyjtLzce/VJmYFUZXRHyhy9KFKj7E0eRVGC8B1j0WwhTMh95qOns8XDkVUFd2Bo
 sZjJM+VZLfYJeH8SKdI7Atv+ytJ9gI9OJqaLsvqeThHkprmm1h4lBRXbQ7F43vdO+GBkoljqU3G
 fYoDpGN9wccWZhvKNO6+mTuTR7q2vf4ATgIYfKeBJA7sBMNzF1qwyVZxDDzUN0PX7rJkK7Asywd
 VfL7JYiYHgKabznwsAONYYNr1XDIlQ8EJja5xYijPk9Esq9EfOJVKdDbzHvphDaZLyg3ElJLqML
 /V08sr9NJaHVeMIbMYg==
X-Proofpoint-GUID: HphEYffbq6txVPXm0BDoYw_-L8m6MklQ
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a550055 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX70pAEi8Bi7TW
 OqMTqEOVkPNq83LMdpym6gpU5g0ETlqBM06zS6L93JJGp6YJV2ba/nKA1Z7NECBcQOzOPfqxbo5
 1k1bpzusUbyHpAVGzonas68tzUnr/kM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130158
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

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 39 ++++++++++------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5b37f23a85eb69c69 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
 
 static int __init surface_gpe_init(void)
 {
+	struct platform_device_info pdevinfo;
 	const struct dmi_system_id *match;
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int status;
 
 	match = dmi_first_match(dmi_lid_device_table);
@@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
 	if (status)
 		return status;
 
-	fwnode = fwnode_create_software_node(match->driver_data, NULL);
-	if (IS_ERR(fwnode)) {
-		status = PTR_ERR(fwnode);
-		goto err_node;
-	}
-
-	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
-	if (!pdev) {
-		status = -ENOMEM;
-		goto err_alloc;
+	pdevinfo = (struct platform_device_info){
+		.name = "surface_gpe",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = match->driver_data,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&surface_gpe_driver);
+		return PTR_ERR(pdev);
 	}
 
-	platform_device_set_fwnode(pdev, fwnode);
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto err_add;
-
 	surface_gpe_device = pdev;
 	return 0;
-
-err_add:
-	platform_device_put(pdev);
-err_alloc:
-	fwnode_remove_software_node(fwnode);
-err_node:
-	platform_driver_unregister(&surface_gpe_driver);
-	return status;
 }
 module_init(surface_gpe_init);
 
 static void __exit surface_gpe_exit(void)
 {
-	struct fwnode_handle *fwnode = surface_gpe_device->dev.fwnode;
-
 	platform_device_unregister(surface_gpe_device);
 	platform_driver_unregister(&surface_gpe_driver);
-	fwnode_remove_software_node(fwnode);
 }
 module_exit(surface_gpe_exit);
 

-- 
2.47.3

