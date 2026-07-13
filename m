Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA38C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 15:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3B110EA27;
	Mon, 13 Jul 2026 15:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOCC5f0U";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AuA9hfUv";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4710EA25
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DF8AOn1701795
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=; b=BOCC5f0UeMABLuQp
 /DeFIlYIp1dkCmGgfkTYCYsNLEXzLx+6TaIqcIl515s8AIhWOFmrK9qi5YidC9/X
 J+Mx6zXNaWuvsy2Bn2EHvCBTcZIpE02rGregTh/MoZCdrCvM8pyWnHjD783DGi7E
 cWhX2PYM657cnGCMBOgo8ib2BjV+PYoA7fWe0Fll+9vg+5IqqxbdqOv6WSyoCS6q
 IIn+jNGjhhGYHZSJBU3pmPDyhVWdDlWW0lXDnYYdY/RlALFZHPlMksAG38ypUR5Q
 Sh+B4eCOI5LK9plwzUpJzI8p23QZPidPEXC01VfV8MfImK8kp6kidUu642NJHS9R
 wq9bpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3ha0x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 15:12:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso67642841cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783955543; x=1784560343;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
 b=AuA9hfUv5m+yZ+LBKXETtXDN8eNIEG3cd4FHz8YgdPPzxSpy/1/EGtCnSQMUKlqzaH
 gSRPMAcESkAV1LxIZk0Y3j7MEfoJSeeY/zqa/wV1sN0OvnBismrMiP8DAMunEktZtHkb
 ckX+3RLUV5YHZCbM6nMcKGFi65OwI48swQS2NAAh+Nggh8im+RZ70bhXRW+sMls3gVt+
 s65a8MMqgsPLar4UEGBQlc+kjdSC5zuY4NgZACmlddSz+XY2qQ8V3823f7gDpWb+GwFh
 IPB0m3bC88rIV12wNyZ/cIld0NCnKj7DnZj3SR5/WQCZXLhs0AP6PIMf7IiVz/e4uerM
 AIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783955543; x=1784560343;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
 b=EkFH/xHKGNaFm5iQQF607k+7iNUgA/23bJbTJEh96IcN8Y9Achke0rjbMTKAuQkInj
 g0XFic1qWJ2NQSDx84/Z7S10KGw42G6QVv04B2NQIXyddAXhQlponymqTNKm+epi3tHB
 FrdEl37mmdVhlY6SA8PtIK1O/ACS6YTJ7VhqkV3Z/ymvLMHPz8KojdK8ZJ2VuIT5o0Ci
 3qF8d0ersWWy2+VYoV9KiJaFA/Obw4k5NiNdgdnACLVY9gEYZDptwHQRzi54IMhI4u16
 a9/loEqWtJ78Ti8T/A0LXDi5cf2V//NWAlmfTGnw+L8yrrtWWDtCXC8dR3KXeURHQa/0
 0YFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RruD09f01RBpSBm4IsBpVB5qurEr9lA3y5Ht5gNGSzuObFH0Mi3bWKt/MuzGObFqaTLQSpDaRjRtg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEsspYsGeKoPS8d7gJRkz7D/MMU4kYhwdpvo//Y3SleBglXkXT
 GiCSUrVShXnXbUOljbzeIaMIUa4m8uuDekhsxbKtvqCPVS1DUIOPmqhtSlF25khIB9IabKZ/7Uc
 k7jkDQNoYX3wpbJr7zaLxsc66pd0dz66nVoGZsOhM/xdmsTRwKTWuYBBMzHtx2IftGZcicw==
X-Gm-Gg: AfdE7ckaNHMCRK8/kW65KpwOcmx9+Rl70+ax9dzdkZZlIPbOZSxky6mAEPexZlNnQX2
 y1bdckZobPxkLtPJ8lNpAlTlqkK9NdEQF0nW4OkWAxz/7NRGN68XIXSvr2Jxv5m2x5wnTXwvxID
 O9aYGkdgjGRlNKRkQhLxlxqmOIPLVzWirItIlHa167K6CjAdeASbnWOlDG+ELd01gCBvL4XfFMp
 AVsNioRsykwgI1sdBM7GQgK+3vlPqAZjksc5QGnz/00m7KH97dBsgMx+LQK0aHnYNvVroDdQp1o
 eYlCTM0GSX5peUSZZqocIEYY224Zc8kTJobn/fJvLxzh7TupArKMujWBFTOzWmg0okZVlXojLQA
 /hRba11SLOfW5Ma9M12ZvXyGeiR9bfZdxS1pD2v9Q
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-51cbf162a37mr95302261cf.34.1783955542500; 
 Mon, 13 Jul 2026 08:12:22 -0700 (PDT)
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id
 d75a77b69052e-51cbf162a37mr95301891cf.34.1783955541957; 
 Mon, 13 Jul 2026 08:12:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:58 +0200
Subject: [PATCH v7 2/4] drm/xe/i2c: use device_create_managed_software_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-2-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K59bsZsPg0oBc3El4NBYgpsIGFNwewCJ8H6R3I7pL30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBLHe90K6lVmtYl/c5igcZli7qp/jrWQWKZt
 nDmast6tViJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASwAKCRAFnS7L/zaE
 w9u+D/4rljpC3ahmszRx6QX+sN3PBN42YyT4ut7PwFuo5riz9VlF1xvazJvVY3hozqhuIWxlOtz
 Md9ESdszzAvd9ry6gerI0QURYd5Pu5ZufD/2fJZ9Yh1Q2OjnICBZwmsXuGHtPoyVIPA62doZmCH
 gYMnwWXUrh2G2HXZeszXq7/yrbuOnVW4FiHd4InX54iZ93wcck8ACxvX/WpPc72TFr1kCt19TEi
 ld3BMRR3Cl97tXhUGsYr+KbkCpELBTJHGZ28dquEd5M2BZDM0fGeWCQB3xSjOs8zwHfX4FX0U22
 XQfGMhYnOW75lAO3QEXIhEIPwivnWn7kh11TxvdB9iCVaV0d74Zs3GSk+4yWHQhfsxveaH04iGA
 Qgc6B43zyL5o5/J0FsRTf75X7Jv8YZdJ7W9Oe3uIBSEvEfp8eFOg3CoU5Wr4D5MlElEfXWRL1ai
 jv3K3ciVTZavQ0G8xTkbynioZLTaCO4zzExp2fpoXB3d/z57DwM9OL0pKQkcdeoumhu0QmU5t/h
 e9o30diob7Dq12Bt00bW4YM2eV2iJXSDVDfwTT7HOXfQG7J52fmMQA5lgIkrc8XxCIGW6q0Z1n/
 gL6qtyzAXt5Mfpu0NyYdZSunKhyhX3z6Q4PLn76W3B0Gy3XZV1LObT4A65zPrhge4y9XbO8uOG0
 wNfJxiV0NV2rJiw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: WH8pZM-pESnPfyXyrLAOpmLvu1iJzF3j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX9wDCWxxJ/QkI
 cYL1qkxrm+NOKgRJ/pOvtrczC/6K5RP5GfJREqZEd+pFLU9m8HBO+NQBmHSSeRgbqp6rkJTkqma
 fCaW60Vkt6dtsGMGfdXr27HvtyrmPhg=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a550057 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXxRfN/mhyvJ44
 2ZEuPUmTLAXoLxnDr2XIrqYr6o4xUxUX6OgS9V4ZGYNoSJCSqqna3IWVPCsktstn3hbv/F7vn31
 tMouHHeExKimJYMT+lhWIsoEN9NlwfDm5Wh4FACeD7PvJUkdzac4b4YZomIozu/d0FO9J001KDB
 +OMyvpmCgnarsJEjjBdc6WyVTrs/NGb1JIJDHCqaFB159YD3Bz9SqY6+dgu7529+ESMEy3Rr2wX
 bHeAM4/wyqRuMP0DxuS2AA7j/tc971/I4ztVtNROVTyVn2qAzZakxR5OrXzbfLAmIttCMTy7hjH
 Rv7396VD4vjYxm4xwTBPfQZoTaIVnSVtrcXtONvBJE2KeOx9FN0FpC90qwNgHklG6/DvnqDEvBf
 Y5/zZzbHFDmpx1U23RPqtyGzYGVeZJtdccl+XtqNFiAQYizNzxjGVyNqZRJ8eOvJMO1g07BBst8
 u7paYqIWeA4azstyWhQ==
X-Proofpoint-GUID: WH8pZM-pESnPfyXyrLAOpmLvu1iJzF3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158
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

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_i2c.h |  1 -
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 3d80eafb9a1318996d10db11e14af4cfde07ba55..af6e973e5e68125a9c006bb646447ca6e377a6e6 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int ret;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
@@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_create_managed_software_node(&pdev->dev,
+						  xe_i2c_adapter_properties,
+						  NULL);
+	if (ret)
+		goto err_pdev_put;
 
 	if (i2c->adapter_irq) {
 		struct resource res;
@@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	platform_device_set_fwnode(pdev, fwnode);
-	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
 	ret = platform_device_add(pdev);
@@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }
@@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 {
 	platform_device_unregister(i2c->pdev);
-	fwnode_remove_software_node(i2c->adapter_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
 };
 
 struct xe_i2c {
-	struct fwnode_handle *adapter_node;
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];

-- 
2.47.3

