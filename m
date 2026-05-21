Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1B9CD5BB1
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B710F27F;
	Thu, 21 May 2026 08:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETMv0UEz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gby1iPwg";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896810F2A0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L6hbuU1797760
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=; b=ETMv0UEzGin18yIO
 zOHyP7x8iY+OlWlx9nKmm444bzrPOPxKwh3b2E+AZUBPwvrz34RnxbQiemMT1XNT
 Nzaw5W04hcIM3aShKSaFmTXczPUAy1RwkVkuZEhrNUeN0B0utS61B7jMcxDL1MYi
 dgZ7uJC6QGv2JrzBWVq0ThUYemMcLrNROllJ0Td/q1IjYV23CRsACtchry7AwdpC
 99JE9KQ7duYxULEWMIr5Sw76zn4qf+i8X/kH6sFyOLBk49gRvkPlBf9UP1qGCU2a
 QEyls5Pg9lt1s+gyw3fKGWsm6VpskmbS+g6c7huGknaUwlmF4lft0+EyxIMpScFp
 7tiZLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu424y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:38:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-516ccfa109dso1704311cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352687; x=1779957487;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
 b=Gby1iPwg2amBJFevem5YHbq5HIxN2h3miEw0JDrtgLIwAraBEcPu0jF6Wn/fhUC4Sz
 nJ0lW0nxwL/Lg/de72TyFgj8/e7Uiyxlhx/6Y6bsMI0WUE8zcRp9aUDHQW8pAOwijA9W
 DEFzd8KPpyt7WRhQ6tZpoubA1ppeB2YWZuHJPgI3eXovPJr/OrihaMyy1papI2h03X9P
 9EFqxz/YgcojUOGHXx6EDcGUP/dXoWCNFjedlJcWDpRna8mb9fVNSRQhHQKIu+imHwO/
 pZKL1vGUNX9hW4reohOyCaiocp+sqZ0XJu8GWRpEAflqxujA4sc28B+x+dzlKHrQfHZH
 vVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352687; x=1779957487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
 b=NuUuQNJsJKvej/87xCfhJSIJOmjWuTGasi0SDgOMh0/uRpZDfN4mBQMcLanqLpea20
 XmljQ+fgMw6RJWFWuWIhS/p9+oqgZ88jhuzSoepSxpwBjXVt2khc+hbTE3Wz05f1yaiu
 6bIfrahR6nD2jo9ft59g2iaVJc4J5IkZSHUL8dokyEnI3EAZSImiKUXY4G71G5/29Jt2
 E0eTjiPwZ9rEjxqrCq3yzkqMzSucL7uKulPYPopK/0qLqtyoF5tNTYXCZ3HDPYyppulb
 ZgPt4V8ss3mYL1/aJu2zdEYgaJXpwbDqOmTmUDHAka8m3hEjDU+Us462kvT/CdxBryC0
 6bGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8XMP7ihTQ2HN8ioK+5Vpb4NbGTp69lHe9iF8UqUuBhPDCust6i4RWyFD2pt/0PUd/IcjjRZkLhFg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi3JDeiVEEEh9iWFY6GYyMCSE3hvZkAUdgZO+tzixhXh5a+gJX
 FskPDBCG/j8iBFer0rXG0xnBcVOgpFbM4zJog1ddGkH/5jRK+vMsKEceJHfKdk1I0KbYMkXG7cD
 tklN3cy9w+jkRCxQq52E1iadchmW+38nmD6x0GdmkA/5egfMB+1eQDvd3SZUIee28e+Ouvw==
X-Gm-Gg: Acq92OH4htxoVlrGLXiY0yDq3DDwZXY6owU7TanNHdjS+w3SAr/R3BABFuzhmRbcOiL
 x4sb2e9Hjip8T+iVVQClaLMSnUU9Op/59TVbqFknaKg4DgnIc6j12z+m/WHP+D9n3a1bRptPNL/
 1RkDXGTeWQP8F6UpeKCbnuTYIvQmTFBayTgc6io8OQkvQMLoXrCpZR7G/DYIwNZ+CsKgKmASIST
 Gn6JPbzKkjFH3fRRWSkbLj0YM/SAFs2Lf7Jiv5oESsPeOMzs8sdKVBWMwxY7yAW2j/5Ufil+Jrm
 +i1wAirz60O/BXyo+7JC9bwsfWBf1scFXnE1aqXv7AWs2MelKSlW8rZcMUOEQIuNNInE5sqtSmA
 my5443CJKfiaGVbMtg/ylhbWEEfsFPNQGmF6XXd2DMAvPruCUJJc=
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id
 d75a77b69052e-516c55a0cb2mr25069371cf.33.1779352686666; 
 Thu, 21 May 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id
 d75a77b69052e-516c55a0cb2mr25068921cf.33.1779352686206; 
 Thu, 21 May 2026 01:38:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:38:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:43 +0200
Subject: [PATCH 20/23] usb: chipidea: use
 platform_device_set_of_node_from_dev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-20-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQp3BJQMi/G+gQE50h68jsUUyT+B8hxHS7036l8NXls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQtJH8QMbFPV1dWqzeHalCAZ+RpZK0MKHRiJ
 e2Dnj28kPiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELQAKCRAFnS7L/zaE
 w4sFD/43Yx1hMHGpbYfxWKnFqlN/WdgLuFdPU6cY8Np++YZo2rYf3uPGYaOPteE7Q4cL5RynKN9
 tR0Q5pOUhbL/jLv9XdF/FeTDp2Wtb+TtYWM4RNYXfZiLtOcIW1O1RcscMBMDg4SKDXrB9nTsFlJ
 Ets8a398cI+pUsB6ZfjOT2KSJcdnUmMi+G9PftPgIVhNrFawhhoQeIPbZjqlS5xIYc7aoup8q/F
 cHF+pVR8vRKDG1fnQKF7uZujTEhgvA55j3FSZTVCZkxCsBX0/njfg8jh+9GfGikqXOJtpFtrqIB
 YRP/K01aDpXYz4urERxYGVxMrwzGzHwEGh2xWQFo4GyeVir0TahMIMPZogHAdeXd2fwtP0+Lurc
 oF92WGf2yxlTJfSUv88Hf+XvE8g1GANQ6YH6zrRxwkbaYi1lAW7i6pVPyAZsYPHERSHgjP+9t/+
 UJeBVAVjRDPH5bZtRjJSdOzNtuBlEvMbQhzXOo91V7kuzqQjqauwM0s6wHQTd/P0JuKRyXzkBbZ
 2WgOWEzaNqEGJyVsjDv9LxSCs8TCSw1CnD1brSHk6LTZZWG6G7GUcE6KkvtVssqWUr1hner+mI+
 /oFzTOsTFEXIwdUHSm5mfY+fzKnlCN4a0GHwdRITxW8thNpsdc6uikexiFWnwMcZhAW6Q1lW8wp
 aEsUt3Z9Z/xE1VA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX5HZt7v+oG3S9
 G1r6KVm1RY47EFg0ToyUHO7ObBRNZb1/u7+68FQa0UZASU5wwbGUAclqIxq4vJWC2wKSg6mFPST
 5LCIhRWY0qp9lnEFF8/16uyA8wwBuxd8o7KdDy0pic5Z/WpB/vd5YG5dgMBTp0v+2+Xg9ZuIMt7
 ya6QO4Z33rV9kR0YJM5KwZCPG2bFyD+fHbzYN6NuSN89YpdBHc6oXJzuuUTlH+vexZsQ/9QBQEG
 /vOBKQmEErwvNqJ2zFVpMj3C5BBZ79Px7UwOZJLGy/3aKVr+kxFtv4tApFFauoKZbfpR1LbYVBI
 1zQ++eU5vAxRvcEDnikkqIgo42XoxY2S1opa6srvRtI4xIs1c9UriQM1qhTYw4ZduHUChXWRtSq
 VWSmsqRk4ij5uXzgh9f5mlEVHEpWDywTJc7Z6FZ2cQU218q+CXZzkBzwXxI3qIyDOCvWp3GTpem
 y8XFNuRQpDqo90SeSDQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec46f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: T07iWGbHu9Yy4yipr0POp8LipTaPLmth
X-Proofpoint-ORIG-GUID: T07iWGbHu9Yy4yipr0POp8LipTaPLmth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb80c6db56ccb430d290dbac61b716..5dd415f42fe0dd026e8a1cc162357e42ba8ceaec 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -888,7 +888,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	}
 
 	pdev->dev.parent = dev;
-	device_set_of_node_from_dev(&pdev->dev, dev);
+	platform_device_set_of_node_from_dev(pdev, dev);
 
 	ret = platform_device_add_resources(pdev, res, nres);
 	if (ret)

-- 
2.47.3

