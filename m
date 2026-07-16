Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA53C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911810F2D3;
	Thu, 16 Jul 2026 12:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzcA/YnU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9znkodI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EEB10E357
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiqmQ2730762
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=; b=NzcA/YnUIFTOOyx7
 6f90moPDulXAs6HdrfRjnL8ufIMakApXtUwSx6wEybdv18wjncn1AKp7xMoe/dXB
 FDlhFvPFLeDp4J4p8u7rfIAwTG1MScJHwOOwnFgmysl/FDfYZ5SrSNE3juIQ/7pp
 MaMGUEzghiXsUDnT4MGKzBIIB1p1NovjRen1C/gMPEbBiUSRYUEe/58875T/RWcp
 GXX4l/6MJrWTNzVSiirqEJh7j+WFr7CFT4qgBZQsHvF8hqHhOwQXK7IAJXBMW/I3
 jQjiUgyJnZtF26R6zwungofLPQ5Zicsu5MBNc3Ueb7GpytHRdpuMP4/nH+14RG/w
 BsmlXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wadd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:32:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso61043701cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205122; x=1784809922;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
 b=T9znkodIM27OXb20Sx/CQRGyhiKy0xS857xYiBxy4JPFzNiUNyzk0EOu04rbfsOkjw
 5FhLhbUKjL1MsLfSitDw6byJTTKwhPmcd0r+APDHCA1HukS1mUaD9RONITfo9ZeEF4DZ
 KgfdxjugFZEa50ts16FmlI5tgjytviFdprUjmp4dPilBfKr1EPGSNXwmfXr8WsvkxnBG
 rY9JDiEm199e8l1Tj4E79cekq7UFlhxzuxSG3JWaSFtb1/kp2b4n27yWHEXbJRGkVZ7z
 bCCnL+Jqt9ehIwCZXeJCXGUMMoVp1YeBjyvCT+ZWGBn8GSlDhmQq1Jsq9rxNKK/YBG90
 dVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205122; x=1784809922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
 b=DcCisr9miuX2XneOrBYRgM+GHDRfc0joEfzBfwMCkCWy+ZM4li1ZzlxMYQ8FiKcegD
 EBU16OeRVXytv/AVAMzrEQxXoigHj+GI3TJR68WXmj2rcV+M/iy3kz9be+VO6C0vRDIe
 r2uW0eKtr7Rk49wD1YmwK4RhyH0Jdb3TsuI4scRCS1e0cv2RzAAzVCwj6/RBKqnRrokJ
 3/XhmgZpQGNIsMKbwFfuSol957KMME2nkPuJcZihV6ShnxdfcVhDvMzIKsxEzuqZcxda
 56LJwC6oaA+4m67T4TBBLvEgdQydGHCuY8O8vCClHuwdG+qVhrQXlxTbLdn9yzQMe6iN
 TuQg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr7xf6RU5fcv9votnMUND4HgF0vXcF2hSHAsIokZHPwgU3fK1STOZ7ywZJKQJvFM2pGe2a3NERc2Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOdOUIeteLsvxA60xwVp3tmEJdXl49gxhfXcTYai3f2t3DYPe3
 aXbuBKNtah2AxUvY7jaGUwmWRu1LJnLRvaU2VpSH5xGjUPSFhxi4/XYL93elCnj0YN5MGSE369z
 ve4n7ue+7kI216x5xVTVepIU/P0IplWB8mZlxKB10aft5U5HJiAG2n1IPrR7UyGyleQaA/A==
X-Gm-Gg: AfdE7clT/wmM4Ar43JFR6Sod2lQpJRx1OJf1p+ylhqQsWq5W/ZHIEawgNMEWP6/8LkM
 J8J+eSoBMzRxyQ01NIieQNVnbl2ofWGC7Fup8MwIW/96NUfN/zXkuyXFLYCrnq7Z0oj6A3/Pbe/
 eIqNsknQmVdEu3Qi9mxi7ZDq32O5FcD8avRKXPdpaGXHpGcrXGHx5HXCit1Ezs7+XQ67BvjNeOE
 OMeLdKNhkU2x3rJ6oz/uFmnglLGatyuEI5ITyS6piBiAOGAukd2bgaK+w6r9smqtvUWTSb1uS++
 8kSfUNAagrLpqnd9fhIOSDb449H/wpxBFubrx1nnKuIpoRqOyxEbHOp9QdRhFFZ2arrtzr0EHE5
 ngGzvisrcHGIvAH5qFA2JhOZ7NXI=
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id
 d75a77b69052e-51cbf1601a5mr221551861cf.31.1784205122370; 
 Thu, 16 Jul 2026 05:32:02 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id
 d75a77b69052e-51cbf1601a5mr221551271cf.31.1784205121589; 
 Thu, 16 Jul 2026 05:32:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:32:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:37 +0200
Subject: [PATCH v8 2/5] platform/surface: gpe: use
 platform_device_register_full()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-2-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/KoRkaS+83usWGN912iUHUZ0L9VCW5/9FGQG/93XDA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM83p9RhBwshF4v+CF7UXRSRfhDVORsXqTwJU
 8v1VZYWbjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNwAKCRAFnS7L/zaE
 w6bLEACeQ+4V/bJNhB1WQ2H6dfrwOUnKDGZwjMD2bpdwuqfEUzAcCRev4jXklTgd3KmKQmjvjJ5
 V3bviQgXPe1vcVXP7uUFN79OgQBkLMfH5mKJ62AcgOSKTLmBFYF60GRZ1XMuQkUpRP/Ambd4vzE
 TaTvXhASUgCDA32nnOTZgkLMvUPoGv5kLBBdOBsUBXGin7coEH2npQP3i8dsVUByeNzfnmmzVys
 isOEE3p8B4BKITgqM3lZ3dOSqEjGBHyoXvQouFqUgJuoEou30Dk/QYEmb79qDfFl7hbdrITIOgG
 S+bLySv/eAgRKWYiy20yFKIxiJPzWIFLXt1FhfL0TNnmH6AnV7XNaUH93hbP2OGsngqLePWyVhC
 KA/Zvzt22eJFPxOgiwvvyFlHxVcqqQ5Ss3OvTXhhBcQa1TKI5nKm/QKZOaBwSm/ADdeVso2VXJO
 kyI6h1udNzdLEk2RY8ueGxWZXQDO93MXaJDTajfwCcL00Ndx3wlylUSeX30NeIEkZ3wVEBT15ep
 A8epEbSZnjjNd2P7VgEy0e8Qp+qVu6zAuF4GIwwtOZOshdSxyM6rpOvY3N71NS7IS2ZpLH2kJ7L
 dIPr9hKSDR5eA9cYQNyAlbPDR05FixCknh3x1NSyMUCBws7Xd7DO0JhORd/gGknYTDtwuKgN9tp
 c/13CIP8A7ARwlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58cf43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=vKDqCkOE6BQjc6v61vgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1u3fdGx9tdOdXuBRbTZ4kaO8qxFQMU7h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6yZNSkdRU2mI
 0lam64stNgi0gwHCv4mrx9mV6R1t8TPJpr3T0PFbuDOOBS3Z6liKM3SrK61pOAgK1VBauxsbKYo
 wvkGA4sS91B3MyNwi0DbMZ5S7qncPGw=
X-Proofpoint-ORIG-GUID: 1u3fdGx9tdOdXuBRbTZ4kaO8qxFQMU7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX9CxT1Z2cTwWK
 tRx0tfim0kIlLySDmfxhXUsrH6w1/jXCYsMkzyy0b+1DxFKNcTZ00AmE5JjgExGtjuM1o+KnUrN
 XydtpUOaC0BMWRHuBBtRfYmCOCWN8siTwCBHd4Av6Bg+w0XwOcUWBh6vsfD54McmgjnMxhkAqzN
 wQMtNPd/DtNSs2Tm/VszNp3xTj63YExMKWynDVvmsup6FCrbldLy/Ll/7ENzJ4xYpvXiody63Uq
 5w031K1DKkJCr+bnKSWpcuCo7mR7gc9Dbmtn3QLu1HZwR6V5JTNCMzfdlsSQ/R9e2gZH1C8ArY7
 fD7FE/YHJ2U82pDaNIUuWr2GeTX21lTRSgiqfWNTYkXFN5IEWfxjEHeRLdgKkysV1lx2hb26x9t
 XavhcFkt9KYHuoAtOIVyVWkDwbPTffPx8D/8wgveya+ugaaXclG6RNX0S2bCCZGl95yJxfcrQ6A
 bIXHQi62JLD+d+G/BSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
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

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

