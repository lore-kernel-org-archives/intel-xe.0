Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5BDCD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2C10F29B;
	Thu, 21 May 2026 08:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp3UWx69";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdlsxWAz";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07CD10F298
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L6hXCi118974
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=; b=dp3UWx69oG0Izzqc
 yeVxoq5UdBu7a2A5JsdE3LpwUghGj6zyXyNXxJfVkoK2mT6E0w7BUtcRNvDKJPPM
 TN483t10j4dVSOUPBeYIPB4OEWaWYKpPHDxLi9/U3Cu6Dv5xHACGMEMS/O3C+7pg
 ENnjbDeEoonWTgWTDsEHEF4VPpLACWr8LMfn9DGXinYJqT+0rcYYnGN2vr5rqGlQ
 vKYV2wGiM46rQucyBmu94NmsS80Q4h8NFk6PeJWUG+EEWF+skNymwcjQrsWkEcgG
 47q0scBNIs0YVcoJe9EK27ewNLcZmI2/hO3oXU0N7wi+I5HvNEYxli6o0M5m3zzU
 L3c9Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1he-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51009190feeso182894701cf.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352690; x=1779957490;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
 b=EdlsxWAzt8XpnOFiqbZasQ4PM3a0obUs08o1gHISKisdnwyiK2PQ4RaZ7R/poDSB3w
 zVoU3QgsaG4EztTd+k4srf7cL5koBsTNBoath/HjOtETIBSfyzUT4ZDgl+Lh64IPawD2
 LCnp3GT4kHQjjrQogheWdZtd4LNfd+OnXw7S0VP/u1YYzYjogbBEdkZi/E/XoJbe045b
 0EurnpNAj2yTE2o62XIiKL5bY9F/KIGt9WCxSEUjjova5sxukG1z9xTfzJ7RybdKHwPN
 cjhAHFOuxqlpMpWBc6BVygaIAv9RZlc0+cDbZuI7cmCEmGghvHaAw3dalMtPJMX0O9Qj
 NL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352690; x=1779957490;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
 b=BSeard7khWpBRZInrYIMuFBSNlnSzRdzfQC+KPloWS2j7pAA/1lZgHhyJcTHJ3C3xa
 urnLcwNuPABSQqJMy8QVEsmzvYOOAl8SITfDz15Tt8UZX520gEvHGT18kovydLNieOuR
 cqITB2C1vZT+AW3LoygqgOkpnKcqzN/QMSMNWUQTfSg9E8LdC2oslxgFC5+Ha9YFVVeX
 JRuwyNSNicWKUcd8d2J9KulVw51/skchsTuMbw5vh2Lgdkz77E1CeQ6ctcmuyJX0ZH6e
 8UlLugplQ1VF4xVxTTEjNbXqceGvSbDrGfszSvfEniwBbOxyQMjYmhQUP3IYlnuqbZGD
 JfoQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+v7dbdMAuGJJhjmjF5OAlQzeckRHnuLOpGIuz1m3wTxC/RjAtu/C3X40aLq2rzWhSR2UBOW5FBGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPeuhHmW/yuZZU9JlsUo1W9xCDfPUSDXHQuzl2XGOTEaOZ8qL6
 PdnyEPgs2EwoEmMkbkdOHC/p9kbg2XcayTLADoe+UyU00or2gJpZXFxKDS56a8g9BbFyw7o71hH
 gV3S9bly+twGGSadhX6pW1sXJcokSB5jkcEwMD0pG0odnpGgFP9rj/Mm40Rl4a0kFqcOAfw==
X-Gm-Gg: Acq92OFOCktNhIerWUgOMxkeNVj/YRCBgRDlOXMMwi9YTXX+gD/jQVb+4a/R4aIvXcz
 EovNODQ7dbj+jo1e0iUfjhRwv3HC7DHtzbGXsFu/zyNVKmYuvGM4oq6X9r6deg3tmvkR6Scu+6o
 HXTEU7bbj+nPD8Kk/kl4bnSNm4erwyvveptEb6MvGPbxNggDUfpegCD4eLLV/UaRUqQ32gfhVUu
 d2q4nowmkB9EpShvUn1J7gFmOSvmmxjeM7S7feO+talzGByQ08oerLq7th90r0hMteVD09KZPaG
 a2igIqPjaSRwsgZeLTV1dF1hrD9cClLqiWKPrP7nzoLCPNQaABi6Ds5SWEbpG0qWzyJ4mT/sCMl
 1AFPhJTiEtGRABj9xeGRuJGUbezkLtgAqFE5d+mZX9CZyQkVTkxc=
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id
 d75a77b69052e-516c55aa333mr23589561cf.50.1779352689850; 
 Thu, 21 May 2026 01:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:50f:bd51:f1d2 with SMTP id
 d75a77b69052e-516c55aa333mr23588731cf.50.1779352689012; 
 Thu, 21 May 2026 01:38:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:44 +0200
Subject: [PATCH 21/23] usb: musb: use
 platform_device_set_of_node_from_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-21-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoOxC6iyQxs/Rjohg22JgwSDvEJ4Zjh10SaAJTOCBC7F8EF9
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqDsQuAAoJEAWdLsv/NoTDzugP/i9A
 ryldFb9FSAmLemEO0qiGBJZcIslmI4+zSHLUyf3mJErewenQEkrJ67YaF+/3EQ5MKNyh9GGap4N
 HtGBX+rVKJiaLObdha+gBxpyS6ODT5vek1/ttYbafQUROxyO4O/xUTmjpefynxigMDNr0fgL1I/
 MWZCvQgTDxHHhtsDCDBN1+NUaRZxPWR+JJL1w8kNd4dDzckYCA58SP9ww5I7ra7aru1xMOrrwGl
 gs7ae1gcBWZ8xKrE27WxLDTib5j2LSaEH/HzjVB2moA+g+rRDXavYwEeiK5D8TWPW9yL8zD258S
 zCxRfgNNv1zSpQWkB8N8I+VinrR92PjRSlXon9wPiLEzKpKNC0nINH13V5/sg/3aHqKNLCCgyKI
 b8aSrCdHIpqpUTfORHm9i5ite+y9BjPMj+rIMrXi2RUGIsI994PQUL7w5QFe6P8YPwzHLJh/NGx
 /buuLbTuDArWEIxlY7UzZiJjOApMS4cf4UOi0dqDtt7b2z3XxceszldqYh+NVfxhtU98dhFizvw
 esErqQwHHDTfVZUB0S9c76YGbrNCfYAx2dsfizUx6MiEPZhYlZzigAfT3rvXR37GSjkWEUP9YMG
 2ZTKMdi/8fO5AG36zxqYmmFE69pEP1X1dEk6R0yl6Zg7ycYddoesnbfoQSrg+iX/XgrEqUYYUz6
 XAXwV
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 06Ly-W_4aryZ1jwc1qtSvbVK6sdpusLu
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec473 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-E7rG7sKBpYtUKygALQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX2IR0gHmSoum/
 CWYoNdjqIbrCIS6Ux8SDxysE01+212rbH9lOj19lkvyMPdze36i9aLm0kfRAluuR6hLwbLmyP9v
 ZbUmU9+A1fFvk2xruKSJ2+eAAaiRZhRZjC1HExk9dshzgI6WsXQwMkjaUFDJ5xYkNKViic/LKsA
 zmDgCqnFzn0uy+rJEOUA+CiA53sEfxJxkuRSd3tSXXgyFOmeI0q8EumfmNyh067KZAsW1X6WZrb
 ZBbAqASoI1XjqI5ZbO5M+P6cNApInmt1OgPjWFhgRbocwudjEoh776p/o+dexsBRSKwO6M4AXAf
 cPR5Os90SZGY7f2h/n2ACI9cZmtpowZjWSpKrigENtquH44Fe6FOOzQsrN3MI00xhLblMUCt1RY
 eJWvGWO4HvkFUI1hfkN5uLYq5T06W2UFfTDMfIxZlThFmU0cX5VST4j/4+z56RQ9XJ/kXbJzyUQ
 BzvALxQ1BpdXDFO/5Qw==
X-Proofpoint-GUID: 06Ly-W_4aryZ1jwc1qtSvbVK6sdpusLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
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

