Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2610CD4F39
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 15:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801410EF20;
	Wed, 13 May 2026 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2s8KL6W";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhraWOCt";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872E210E5A0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64CBeUAQ868141
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=; b=H2s8KL6WZl+HFXeA
 XKXCPqgcchtf+ePN5Z7AkIi2zb3bRBytaZ3m10tT4k0iSaxH9O9jgTWcGyu5wRBz
 1VK35Oe4bAPHYnk80bV5mzBRUlRffJLtnnh0zZ8pdVAUymFaz26JyJBakoq0QXMU
 QlWccZTAc8gImxNaQ4XyiQUveLe9qo3mxARjlpDUxeOv6d44DbwlJ8fSM3SuZX1a
 Z9VeD1/2BVLJDKgbekMlbbZGFXMH7TK3UvAaoOrqSMrUDFmOhijobRauKUF5ezXE
 oWIcZTB94JtX9bJvmg6qOl2kmZs2+xOdVdCWibyYcL1uTHBfbs6ZJGjEAbN7bWHt
 OaAOcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2ar5j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:59:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-514b5d6bb45so16168051cf.2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778587194; x=1779191994;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
 b=EhraWOCtlQnKasXCCZadcUBdr35cwKXW8uZDUjRPUMqHVedSssC74fYuxiRzy2nseo
 o6DudaVp8PexlLoa1pqIdz0Ma+xTS374MSwejgd1J1/6yKml7Pd5n02gFMuP0ZVYGRFb
 RcjxMe5mNJJniVkJQg6nIvcqbJxKexUtBEZspFrXeLkf5FXpL+u8zlhrLzJpG/Co1ABf
 RML4VTNHjCmOJ9rPeYCpLkJt7WdVnLNU+cCKQarI8unrk/1n+ZX9ESnsUx9mOpMiahDd
 OLFc+841LBiY4rvmpmkYZeN97hGu5L1j5PgjIwaTuSCsr8mPk3YH8DqXWxoS4y292DJl
 tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778587194; x=1779191994;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
 b=ZWx3QiwVksJP77k6XlUatMNDEh7rlgdST1qvW9CLrYz1/ToWxPetOofEBgdUvXOqKw
 5WHxerBWB/gPzSAxq2NHdc4JlQEuYqzDsAFra+B6ouOd4NqRjvIf2y0IpjV1b+z/JdQZ
 yOoyNPA3fvwVoM/ZeVwEpuaKUV67JW49OYzFzq4WDCr2OQrA2l/KFt/QZUErfgVfinFZ
 bwclLN3vHTmrOdZ7b3S36pPA+tufxrIEXaLT5y54TySv8T/6lO1ruOYdtIf2+DbXGuSY
 0BBYoVuiL63rnxs3vLiYbrjSbQKDO1C4FxbrBahzw4dAcWK3oaslYoZOBD0F62GOolgD
 tlcg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/c0gAzHj6QtfXftLAIGfcz6v1RGewYgzZ735mFmiBMHoUvt4U0N7Cc1HnWL0o6P+ApEq03D8gpGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAx6lQPuyuenmMLIGefxTvqUkPmVujtOb1sfeJSf1QeZtamUxd
 2t5Zvhi5H7DXBZcUp9C+yexf+NUQfNNLeF4bz//Fs3pFmxGuX2QWdJhPugTblaTb5FpNiFryWRL
 nlD8RB5mqq9szhpuOD1Dmcs8DBGEBCH66mQr1Mc1bcEt0DsKrALfag76IIKFTzBz2nKz/2g==
X-Gm-Gg: Acq92OFPZqpi9ZChrlJHmA06tsYisPdXS1JWId3gwtPoMr2ixe9b29YOwZQvkdXC5L8
 BU7FKo5b42E5sKJAGrGY3CMnrt5eoWksqr0+dTz2/UuJ01SoLCmVp6SYT7rekmqPs4hCz4vPWtc
 H4c6SbUeYSpp5iFMysxFUFytj1nOgKb6xaTm5VGbE9f9x4q121p6jSAFDGTuZlRSwoWe9ggdQgN
 ibrLBStEQg2TGQ2Gewaw6DHhoFwuhdg2yQNyCxr+VVC9CjXaSbjAM1S19JMmAR2NQUpPtcAtoo1
 583P12JwLLSTCojRSYithLd5tosbhuhSGm0Bsf0EVZU7t7r9bhPEncbTWYGp8hpnMrFN2nt8tUu
 2EV0IXbj76K+85O11Zy387uk2oScPY51u/nA95F0EOM9a7/ah4Ss=
X-Received: by 2002:a05:622a:388:b0:50f:135d:9508 with SMTP id
 d75a77b69052e-514d225c22amr37873171cf.55.1778587193932; 
 Tue, 12 May 2026 04:59:53 -0700 (PDT)
X-Received: by 2002:a05:622a:388:b0:50f:135d:9508 with SMTP id
 d75a77b69052e-514d225c22amr37872951cf.55.1778587193505; 
 Tue, 12 May 2026 04:59:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 04:59:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:23 +0200
Subject: [PATCH v5 1/7] platform/surface: gpe: use
 platform_device_register_full()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-1-0035eff63812@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8YXXx+c7Bfn1zIL1XiDsFM7WtZrjadc3NSaS7UHHFkI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYtcXF6G/xuyy8RtzElKbdbTBCAfD+hSfb4t
 0KxvO28gjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLQAKCRAFnS7L/zaE
 w9yxD/wIWDQ8zdf046svG3gh5zyszGE0IvUtkRLErbl5T1mDwUk27Xj+Cl1PJQGfe1dUeM0Mr2F
 TAzUuFEXRTFbQTH6Z8ryvlpOlwsLgeNzJFf4ocozKHuVN+QAf5JziOPwC+6HhyXRjYY59LVgAvq
 JDckPBkta6Qm/k5cuLcwCj2/4bGhlcmPjITx+N7al6zVeAchlVBYhBZrx0+XQOPnphz+yg8iKnK
 dwcPzEyOPIq09ktmVw8p1IFzBWj2tgZe9X/vWzBfW2UBVQy/HAVRPx0vwhzH2RZx6Nk9a4kpWCT
 /UNAPFfzf/ELEOyQ84wHrpgeKlnmMtvblYksAqCfJZb+5uLd7vYo1+w8XtgQbAIcOk/iIz3EM3R
 fPUrE5EZxgd0thEWW4pSjLu53reA55ZDY/zccIRLrS4EY+gti8vXbMx6AD07BS41s71F+wYXmbh
 CDs7uLHF74wBANoKRTqqJWMPjsVtWBWHj8RpzmlnCVNCmfqySgdO3upQYbzYAjQOqE7W4DQqD2r
 7upy1d70M96ahVCNlnIzh7LrKi7avXRM4nrYFAZuf7IfnNeNi5IESLkvCKnPOIzs4R/YhpTTsgH
 1NMawU77ISaubzBsHHMTzsOFrdJA9B9KPlq4LkiR/YZ0XRixU+fftXYa84Jcgdtolkkv056cYgL
 UJa4iUJAnqGU4NQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Br1qqe4l79O0BkvV-lCl5Go1OhgNb5-C
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a03163a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Br1qqe4l79O0BkvV-lCl5Go1OhgNb5-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX7cVeNuvhavCR
 YV9Upu3qT4zJ69wEg2lGDzDsNkzX0xfg0XSOWHl8iG4qxBbdw6tgRvGwJZbyK0sRokDOLL6Dygt
 gDvKQ4ObtLZrzr10+0ydLHbC402aCQPr+zVJNp+P/kLN4yrCmRQsCQrZTOjbVaXfPGbHr2cUHyF
 4fxZPaxZHGVP54fLhD/q+zRZt0wlbXmcaydDxXUdLVQZYBbemkgQd0v6HAgw+UKNPifRJ3m39Kq
 oIABWPQQBvVA3EQJyTj24XCHuy9g5sX4HPt+Kskpfg+JjSNoGyqJ3/ji75IK4D9WRzSPTWEael/
 BcN9jTqEEMpw1ESDGK9ZEbnV/Wu/KYWKDUVEbL9Kf6cfGmSI0JGWtMb9WAgMBXDLS1KJrq4Ijwb
 dITscUunijXsC80fSNUAFHP2q1Im8Kk/c28fidF38DtMf5nKSeDEPR4g9HO1G2HQ4aAc2zNOQEA
 3waHl4H7f+rGwZid3FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
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

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 36 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..b8bb47b0d91f036ee5073d21534f8f26a4d5ed15 100644
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
@@ -305,34 +305,20 @@ static int __init surface_gpe_init(void)
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
 
-	pdev->dev.fwnode = fwnode;
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
 

-- 
2.47.3

