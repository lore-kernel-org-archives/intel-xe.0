Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFBACD5BB0
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25D410F297;
	Thu, 21 May 2026 08:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWGFOeBT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5NChmAa";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586FC10F27F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L4xVNw3085238
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=; b=SWGFOeBToZLVCsfU
 AclGf01G3MMPajCTFPa2NbUKgtwHkcfo05wNMqK4mTngoJ19FiVJSJIsdmlsLRnF
 UTS5hflujNJKf+GLZUpXTmOIOODszeTUyzkDYH5lRyVCjrv8biyMBvDqKnyA6cUR
 B1MwZVtqtJ6ZQ5C8cKyWqtOFfriRbCIjY8sk/YdMjRplzi0eIV02XDAf9o+Mk7wt
 ypK1ptckarndPVVFRuQSzrpXfrh5JQ33mIO7EOBPTfQ409d6ZU+TxnRun3zbhUrI
 SbkBDVuhVva/nx4/w3KeLBtmaXLN1johEvs4uv4afYTH0Umf4ApQvWJmlzn0q0gL
 Clt9eQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4f2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8cc616cd846so32666576d6.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352680; x=1779957480;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
 b=N5NChmAahUnOzrqP9fVV96pGDiQf/eLTLTLumOLmtn6Qh7jfYKeu3P64W4Ttlacn2d
 3p3Sm/um004LzMoURUdYlUbnD7AyUcjklxpt5ATOq2vc7ZYOgW0dqgC7+4CYNgXtbYyu
 acdPo2M6P1o/fXQo7l8wSBw7c7tyjFf6aseDCAPQ3zADh008WhZ/iMXcP/FBVJ0RKTBN
 GxV1t7LkLbAPXJbpVOJzBc29gv/dwQg9Mviftch0NSVE4+6ubgkX1OMPe6CjB2s+Hj2o
 ek110kJLBvIvE+FP+R7PvjKwOJtXA82xa14dn5UKCBwg1RmKXFiHdyHXQyAdsYBb1oWK
 XOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352680; x=1779957480;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
 b=Le76Sdwv16n2HHx0lgTOBeaW+/S67zwyh0A5izX5s+qKakA1noLuXEi7mx47TmcPgz
 nF1+jqf5/lQyun5ubthfleimCPJg+itEvqOSWHVJrCyvfW07w0r4Kza+yaJiK0AeOVFy
 npOsRJSxfx/Onkwf/ml7U+yxmh52phRnUv02GuWPCHJiLh+rS8P2XGe1IwBrQQyJgFpd
 adRZWbJQzATkNKW/L8HLTycRSQiT8xh+CSUGn51K0xXknVEP3RqCKY1vpgJy6jKyZBa2
 U6RivAgoKAuFQvgdG0xHRpSo20FTilULXwNPnPltQbE93ZLgVeUL5YHUlZRb50W7MGcD
 FZ3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4bsx5nkd3lPfUwPjoQF25GANhn5eWO55NHq5VWw7/vhlQf/ffVY5ahU1zBZEz+Ej9WYflcBj+CQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzACPCgtphub3KqiUVutg63T+shxNa+LTCwGp863t5cMaLI2IMw
 jEoDHRnsSZ56i91y8knKF5TbNTK4FSl64VXwh4Xw2UIwVDbBRUDIQEhHkEmNgRFDRjWObyGOIYq
 cW4rkUa2dYWlGZO031LN/v84L269tp3FkXs8J9nJeCcJLoOerSystngbpbeRaoCJZPlplJQ==
X-Gm-Gg: Acq92OGKMNAlZw16n8JcI9en9LA5iTTsvhLayaZuRYiSmg1UIVM/XQL0Hs/4hSdsr2l
 974Wh0ShfYLCQ2ia5kL6Oo/4k3pNg2MqadUYmptLEbkPWtNHviKeu7BjbZwLwG/FwhghGpdjjp4
 kIruwjTvpsCOjvAYtTzI3e9r+teFtr8HUXxAERQ6yLiGg1vVsJtnWf5WqYX/3EKznk6GKAW5UXa
 yPSW+98kvj40rhCrdFJXeghbgkoRuPYuCWC2fthavIQJHEcScmi1WQd/UK+y+E5s7d+EOY85o7Y
 fkvlXFfNt/j7XoBwSY275CH2y9adtA4P4r+zDsSQ5XX/8vS+ZSpvkaqljU53LIPHWG0NzbnIz75
 2rJflMcIdDclKE9Wz53JEifpaoq7+9thUFmycx685GCndT3WVQOA=
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id
 d75a77b69052e-516c545476dmr26297251cf.22.1779352677908; 
 Thu, 21 May 2026 01:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id
 d75a77b69052e-516c545476dmr26296871cf.22.1779352677380; 
 Thu, 21 May 2026 01:37:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:37:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:40 +0200
Subject: [PATCH 17/23] net: mv643xx: use platform_device_set_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQr7v0D29hL0tmocOaZkm4AyCQrEw14ql7mO
 8tYfriVLeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w366D/4v5c+pUzv6avtkL6q+xKqdBL9umLghKhBQ5kt5mjMgzYly3eyiiCgjeCEwSWWdfTYN6t8
 MDk5oxdf4dZTDqe/p0EFtWy4qVPnsfckF5Mgtv2EfrFY/JmTxCrEMhvKl6MDM4OJriNxylX3tbW
 pqSlkS5Mjcx2c79ZfHLJ4QNgy63fKtrYEP8jXkM/bO+zd0VvWHV6OJgGTp1uNfEKKD7Zv6W9jXs
 I7NhKYZRcZud8P5CCUTX8ofTjAVM6BslN8K1m+1TLzAyAQoFdnTaP33aW6oTG8rsJsFtPqJ3QUy
 wl7xZWHSGDbNFObyxHawwwedXKh8ziJ5AlEss80+ejJ7Cuj4qI5W8oSo8Wwb4/vbNVIzFAn+uyH
 zmH7uZ29ujLcnvmBxqZIGFKjQiaMTKwjmXQIqwL9bFwKLahbDsLpo0+FNGfYHYmkqwz6KIUrLh/
 4dRzbuYGCsoGuw0Oql6O23EQLf/YjisobOJzrHLLyRC6qvueCdjZm4rjiIfBL/l3WA9rNztpXgA
 591GvrhcF2BWHdz40g9Fm376D5h1+nFi/hxT753Yk4qZ5tHoInYYJt67skgbVjixR21R4P3G1VO
 BNHf9MuUxDhXR8xWiil5e2yLVNEpIh/547GqRXAJOq2vGoV9XerYZFXgnsgia4YoruDBFHM9Hcc
 iFPMjG1LS8Y1p9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ec468 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=deS-VIKRvcGxR6069T0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: eaGPBhsMEzEDJQCSzJni-vOZipgviycJ
X-Proofpoint-ORIG-GUID: eaGPBhsMEzEDJQCSzJni-vOZipgviycJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX8u2xyBT0kp0z
 TI/OQDXBqnfgwNKYXdviqbC9w/7Sm777WGHTcc2VnyCirxJi0RdSyU0jp9BqUAB+yf/TSIgMr4t
 rT/KtWKeDijQTtM9AqNg1sInVMfm+IKCJs69VT+jTA0QQxxBdXGx14ZEyhuUiek1oewHrpO637S
 mSFPw9gFCbTkpoDyCTY1vYn8cOEoIKtEKlcQjDEvLoxn/WJNwm1XSWxITyZJBhkgnlxsnxaD8b1
 yqsWpWzxq67j2GBSrTHbJeBZpSUSMXK4u/grimlLXhi2NSOm2jEjpieZkVXsEteEhWpFcPvzdwG
 0alAFtlce1dMgwzy3dUp74yZSQeRaVgOc1dYBN4vYDrGHwzrM0eNkScY4UfVnxiSyvxJWzxpqyo
 Y52valfRPm+BXvuSbrMJzokSMJs7uTHDtTVx97MD+HkS4tGFu0s/pMb6XJ2DhXot1r9/Ua3m7e1
 AiczaCKVoC0qr2D0u9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
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
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 1881583be5ce2e972fceb14c2b8348280c49ad1d..9caa1e47c174c9d7a161b7f2e2ee12a829b813d4 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = of_node_get(pnp);
+	platform_device_set_of_node(ppdev, pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

