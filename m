Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B0FC43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2A510E7CA;
	Mon, 29 Jun 2026 09:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBiLrL/h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIt9fGl5";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BADD10E7C8
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:53 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T8xgpK2431950
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=; b=pBiLrL/hYuKQO+rU
 ePrxQHLapFiYpVVJMeqqlJrCUakgS5j3y6au7ou9qpQAXazZMU6J9Up//h0r6mQP
 1351AZAcaFoIu0eoYC3KHExgEMiQ5kpzn7EAR0/LhZoAKFkZySvHRZMMBybkaEs9
 MidW3MKMX47N92sSvR80tS322/UVX4E13iabdO19NYxBhkXtPraCSbEnJSNVsklQ
 Ya4TR3ZKNEviFJi/w08TeHKgefV2q8CJk65DJdADQ+UewHHqye8koX6ffg93U2Mg
 Jm6NgNFPuCDsF5+1UYyvOtipjmo79mlydHqwd4L4/WiketDb+f+2o3JhCYYERY/F
 /gy4Vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper28t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e45453c94so341485085a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724431; x=1783329231;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
 b=JIt9fGl5gofDI18OJL5UZTM3QQ87/LCvgLxi/2fXHiABZWcudtjxLefyoSaR54OsD4
 QK7daN6rgfP3A7MABOO1BQC4O35Pw3yNZwqZbWPJG2fQL3aT8sQXXDJHe3Ss5EHqhzaT
 A89Hm0rauDWK/ssnNDh5qmti67TTzUft5XLnLCqDMeWkJL1QoYCK4e6OPiG8IDQZCM+2
 O4B+6SUxNOfNruZYDWQeZAymv/7sOEuMuDb7HeL/3qhrh3X+ZJ0fPqs9u8aYXAHFfMBV
 +sBfrN9LbgFTu0tsGGiUK7ElNR6Dm9gZMjF8cWfhjgjiUAzcsqeBrhzjLBEJVhumRp6o
 EAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724431; x=1783329231;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
 b=gI7MHiPRGMbBqDqzpoBMcmNlTAVqGTxmS2BCB8T19mit1X4DXO7Zx8Jkk+KgS0V+hP
 Nkk2b/Wd7mLGPZn0uXWmhNabAZ82Z/DgXro0yD50K+8cNyV/NJCG6UDMD/0bcvkXONPf
 wK8HOyWtoGqJsvhOzWHxdN3VBOGTb6ejYL0ylc6UyWBSW0vCuO4oe83jm0Ea/5XSsIMs
 /RK1n3kD2+JIqm15GI7302tOR/WSkmsnBUKf+/3DfUxQBv8vOlB5bJTSyi3bLlmMM3lk
 CgPa139MsO2Khfa8ByN/Ymu9OS4Y36g5CW50v0JFgG1SiEZBMCVNmmwzAEPhk8s+1VQI
 iB1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ++9rW8s66nO29loFG0NzHI34AFSMLMkLPDQSrRVi1oRSaiXz4aHz/+s8Om8PudHlK7nRGCpZvXMQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4hdJ9Ap3u8ZeWeqTEjS518HNgznA6TJ2s47QyHec65yD2cW0L
 mlwSK0HoWj9g0kU6i7VOVgkrpoWh+qxYPxpgKW5gQm7Hqxi0kQnAqLLSKyG9OHMnXZbfF7TqeXq
 DZjQ9ouIB+q36uaa/QtpUp0ONvUEnLCBr6RN30rTGKw5aNZC8REcWr8h3oQ/rBhg1uA+Ixw==
X-Gm-Gg: AfdE7cmwUksLmJU3VDMbEyWSsozSCFaSyQAqSGea/l3RV/48fZ7q9GCBxCJkGfeImig
 QWAYhvBlUD39q9vGC5i0qXcChdQDCmJrln1yC3bv63A0XmZWqhyOA7SJPjhijeNf92CN20rBVAi
 inw4N37ofvBgRihDSmzkdL8M5NIhLb2WNUe68SAUFUDrdRC8LUFSIruPV+GC/Fm4e/7ZIxDbv5H
 yJKoJresC35p96+IBiiBhP/rqhk3UaKM9nM7QBOzLzM04m8OXyaeKNS+0q4fjmXcPcLbf8a/T7R
 gpBuGCOJJYuxaqeczvZXnfsDVwb3dQzYjQBgAizoA8ct4SMpSsY/W75DffKV5/of1dSZGazHyqu
 zQ1NAbwvG/80x/+Z0ebvEFHE4gmOPVrWsMiusOFe0
X-Received: by 2002:a05:620a:a0c4:20b0:92b:32d4:4ae8 with SMTP id
 af79cd13be357-92b32d464a9mr987660685a.8.1782724431300; 
 Mon, 29 Jun 2026 02:13:51 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c4:20b0:92b:32d4:4ae8 with SMTP id
 af79cd13be357-92b32d464a9mr987651185a.8.1782724430435; 
 Mon, 29 Jun 2026 02:13:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:40 +0200
Subject: [PATCH v2 17/19] usb: musb: use platform_device_set_of_node_from_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-17-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Thierry Reding <thierry.reding@avionic-design.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Peter Chen <peter.chen@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcUaoEAQ+rGtNym4mdXn6H+wSR5jovuUo4Xe
 W9yGwBaFkuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FAAKCRAFnS7L/zaE
 w+6hD/9LyiWIfVxtqm4ndMyDneBYNN60hwgm4cXHCq1XpEjqnjcyEIHTyKq0I49Mp8FU9xpXN5k
 gQnaVVJJIxMCT3XeyUAxsXAhXnTNImA1TC2sZ/cTz3ryUteIURQPE8qc3VgF4KyMNH7LrlhVvH6
 mVXhZnUgvbwb1393J/lNIVJlB7A4PPUCoILoaFbJEZ3I2Lu2fKgtFcT5kmyU3LLpAsDbK0GCz/s
 xsHPglMoY9iIOvWGke5+knNUDHTadqb62yylQ7xFD9LCHeYhM+7ccdwrZBa/9p25vgwxULJN2n3
 zqM1MgrGYYkih87L7JCf3nBpW4gWnMnL1NfURb0Zlto5Vz62R/8UTrhMuS/w84x0/t31HCBVErk
 oHJibHcDBVb0IbGbPfGpf2qJITOS1rRiLSn40TuksrjJG1QAVul8rE7AD66q/ZlTmSP1QW9yMBF
 yGMvvd6BlGHB2wWyuiUWSffSIMvy0pvl9TXEfin18wKuOG2OFVpCk6HA1Lci6A6MQH+RmAavl5D
 tlxWgLoIWF9Zwwo5YAQpX5pEacDY2k7YkNdg87Msyp6ati7upxnfA16Kau8oVAKHJOmxITIxXIN
 2qvAYYTH1oq1ReTzfFHxdVibxbCpDOG1ddeqkDEwFV3rHpCaT95BOfXx8yhP1afAGlDp6fXzGx2
 pD/9VIfSZmKjbFA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX4UxHKF2ikPMB
 WgNM5/UZZG6+2k1FoR+uTHTY+zdmRbcxPrnIqjKepQwN+kgCHcP2zykTYgAcelqzDwJGxu/vr2r
 3Ne4L8SgD93/jaoAyAEZMHtckDEv5xyZbP/Sf3bJIuWhkpiYDm+ZuMelXqhwXSnTrDlMj6+JVTg
 D8jvQPDSQZEQ5DroA01XoDOVEBPuQTw6BzrApSYhm7zvzsTAuc+j3BV5yfs160hpdudCbjUUy5r
 OpueLQ4pcJWLw9uOYq+MDzZndD0zptd0KQhVKST+eALKAOFcBu35gt+SHMu6BPOAqlATE+6N/pQ
 nVaw1j+jIAYVapFSWT5Ypx7G4DTkJHz/RscTj5YuwuhzFEQSPlwB4Yf1YmhLQjZvcHHEPUQ5BuL
 hh6yEgg6g7EZ16IjouqoSCzqOV1ml+RTk9Jd4CmSL30kDe4ybKB6nkHprVsOmM3mfYdEOvIuehD
 RMUPX2pJDpv8dvxvw8Q==
X-Proofpoint-ORIG-GUID: iD3AQ-Rg_xKbb0ZGqlvERL2XzPGGIS2S
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a423750 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-E7rG7sKBpYtUKygALQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX7Rm/dDKScpyH
 Dz30+8uvrvouAyW7PUME7cDGijklSxR0UC9uzayoRgxm4KLqd3H7K8Lb7O1oIBWMiqGWlCqfNsz
 Vit7X7qzreBErZliDhtSWc65Q76T1Kk=
X-Proofpoint-GUID: iD3AQ-Rg_xKbb0ZGqlvERL2XzPGGIS2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
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

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

