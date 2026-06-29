Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F82C43638
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56010E7BA;
	Mon, 29 Jun 2026 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRkU2/i6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByvI6cdt";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FFA10E7A5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T91OU32400921
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=; b=ZRkU2/i6fztwnJdk
 7IO5FhpTQ9uELV5xMf2kx5yhTQ4SiES76kt6TMus91P7INzavkTPnFtvNcYr9F+y
 hXChLcOUvW6s3m2DDZjW9UWjvy3K+ead5t9C6gutcbXfnTfI7W6oq7FVO2oBcLnr
 5gipdQMoxdrM8rezokLUep+IfzqoHQJQNG30X00ezlWzwZOCNKm0GIG1r6aas3GM
 tSG8pTBpPdKC4xp5euE1xjvwFwb9gx8rHOjds53y575heHceSydkD9S4WKEmji13
 vkYcHHPGXB215VYUTPnnFMxkxMRf6vqfGRZ1NyWvISeRKF3ehf7Ne+UvH9l8D82/
 Aq2mXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq881pt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92d1cae5939so299352385a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724404; x=1783329204;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=;
 b=ByvI6cdtPWv6CjAHnvtOw9BG9z3lT/X6MUsw9AHHoEPhgUff2twtMGO0PGqb8pp1b9
 HPyslwOLEIErPvHKRfjcRZOzrpdOOMXhZsBvzzsVRvns334PdNQ1YOJqY0sPK2jGgL5j
 Ur5hMbf+pCNCDC4tarNhyuJrXgYpur5hpF/Mxo8XempRgh1Rn52WTfOF7C1MT8k4rkGk
 aU9YcKl0ZFJQYNMrJp/GaY19hdUfilrxcOhomBGpogNbaia+5Z39uXyTeGiTTOZISs6t
 CBQbjZyhBgViR77ZJIot1URnhiyt65pFLRnvOKen6U6YGIRZoFUV/oeYBv4As/owIvP+
 UsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724404; x=1783329204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Swniq0MBenDJhWYnVlOO2+dPpUehCeG1RuSAo0j0sss=;
 b=eD/bKTbCzXSrkr6317CGDSHW9RcBUv/xIJag+TR00Bz4OezDZ7sz/DsJdnF1IlmDnl
 FoB3a0/02PalnUbBg1NKGqds2HNTse4FS5eNEC9c8rjNsp1y5wbSypLC/0SqX9DnMMgP
 h3ENqQxX7wOj2HxFl2hiUZ/rFk9v7/p0HvD/f2cbIwwO55VewTC2tVxd6xPnRKJi03b7
 ZLFxV6qD69G6MNyxS9WYQnGLpE5kSS4OeBnNhhreOesHI5KxmsJNDYk5mIHlsVQjyNs5
 CA0lW6ftSOLEqtaWEaorcSksYvQd77yltQz9XPdcUuYFG2cGyt1Hn04Ks7KOGhmbUY/z
 SyaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fYZX6DBi1TcJwvpbe9WhXhQnzs4xZbsCjj4HFBV9PvYIqhlhkJUuiCIzdAoSIyGyRfUnxo4ss/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoTnysXtgWw6JdsQSrLPWfWlWacW7I69h5reruj9Fke/4fN5Qe
 7vwKe6f1dMrHzrEOyz2iQ/fzmDYZ6Hk4tcIXdb9uOX0KKeYHhI0xCaPtsSNojkdNUVW1C18eiWa
 9a5bXCQNRNpU5O/61Do27sViBEESjYMVbKZKBCvAseC//vLpoba24X+qvUmz612lgQufbOA==
X-Gm-Gg: AfdE7cnvmaQ06CEuma3DfcilaeEcJIMQngJZkT3rAgP73twW5fHjd9gsASBemoBTHlU
 eN4/L7pSMjQcRlBoeqTgdZvaoJwN19/Ic6QH/wIkjMPTxL3ZgASA/FQmkQq0a4nzZwGKaSXWGW4
 kT1BnB2di0zVysl38myLsA1H38IM1EpupSFmryNlvDkl2c8HIyPGTI8l82YuY9luL9XOnmFnlC8
 NSkDEuMVota7ih8ZohureXeC9qSd/n0u02tfJwmR4YjHiJ4cgpd8eV82XyZysMyK4SZfvvXftvy
 l1o4JFJeUD937iykbyTftoMHe2QgQxfmjxySEb9b0EmEMUQlvqwjua0T5tooFasaZXhHnsezTgm
 CCs51csh4BCpf/E7dCKZRSzZdmrkcKzuQrCg1rbVY
X-Received: by 2002:a05:620a:460e:b0:915:9531:f6cd with SMTP id
 af79cd13be357-9293a8a7a96mr2397203085a.13.1782724403802; 
 Mon, 29 Jun 2026 02:13:23 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:915:9531:f6cd with SMTP id
 af79cd13be357-9293a8a7a96mr2397196785a.13.1782724403205; 
 Mon, 29 Jun 2026 02:13:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:13:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:31 +0200
Subject: [PATCH v2 08/19] iommu/fsl: use platform_device_set_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-8-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5iHC62z666s2H9eOZNtsPvlVYHni/Q1SrUqHlSvR4Ww=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcOXpcB2m04XoCsH72/+KXlLVT1Hrj1vwgy/
 IOc5Wf6f7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DgAKCRAFnS7L/zaE
 w43hD/wPlfZOsocHfKTUFsVJhcDF/ETQMNn/4hId9+RMm6T5ZHp69jSRbog5lNfYaqdEh1EET2S
 RDT2B/TdHfj1jeOim/f+DCxKuqp+akBTwoUGXVrN3GvF0ycylarCrN3P99JWiNywZlYYQrFzJmr
 KQnPasd8rXu4GeV0CQlnvJVSdFHEQnE2w91jOXC/OSoOzKyKLqx41JbtE1bQ7WizVboKLTgiMqP
 k1F32lmXmQz8z5OapVRLcm1pihRAim05SSxNWw2kP+6WrJp7yvr5HjtoqWqLAs0E+qHIF/fTusy
 77hz1jMmBNdYDVFcY+6HeGk5fS3LRhNUG55iglR9yJgJFWJLD4ztoxnXNFX2PkOUTi4D8wjerqO
 IvzdipUwAdISu3EM4lXnJV4ppWIHkoBn2hTjtscnm98Tub/1JL3eBhORloIqnIr+ij3hobQwQZA
 zwFmWokXMqXAIZROVuupPTypgGm5NHPS1mj01vVz/fwLKzkEv+25rmetZTox3yUMovtH/ylTNrU
 Us0ZPcuG26Lgh1w5uDYYCe58zBPBbDNehNRiOAwx17NTAOQMM5X5kt+Yk6xDEFU5rV2hlkpXNdG
 QBT4jo8Ybny2dJZvwR4MRhs/vr/nkp5lKNgLQ1QDzI5cFXGvKR8BhAi7jATxQ3PubomQVlgL0oP
 3SR64eGHBbnk/mA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5pQpUQic9uzRxHjaPqvNR1el26iVB2Bq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/Jl2bJnR7Ngn
 vrrguwieMI8XARqukYPuIWtVrfNtUbieykHcwCHMfZHVdeSTKr9oQwpq7J2HgzDAjvgM8WgtQ5B
 WVbr+lzIQaYcZ68lEJTbwX0zQ5/xP3k=
X-Proofpoint-ORIG-GUID: 5pQpUQic9uzRxHjaPqvNR1el26iVB2Bq
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a423735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=3F0hfycR0bi-GMcrnTkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX8GO2//ibswA0
 c/J4bp1blqaE//7wXBvCTUrJzOmozdnxDkVbEpp8skB4XGCA9RwjqMq2TcXZRK6KHbwKmQY6vA9
 f99aEyz70aBEAHIzdLNzqLVzWhlP0bS/RjbFU5vCcdDj0+zC9+p6TQw2oYAtnJ3w+6IzYMuYBXL
 qlvOnLnRBzh6XUc8+bDz+GskORgWr1g51qjy1Ypq4ZzcqzFE7o6U5xjQ5/qROTni0Vn7f7YvqKG
 OiXQ3hOZ5miGOEKBXHyjrQlRlH3Libi/LZonUrgsEUMR0vATserk9H2YDmYeRXY1Yy4tU3y0/OX
 A2uNp2pp4CJIYuwVcqRtDjD29CltBKEh56Fz15FLmq2QKjONgS7b7BR3xoI2r1VnprIbQa6GMYR
 dZFILKfXAPyhfMl5EyJz0kbnVcoUL7agdmZprNjhDUIztsvNSOtssP0xgDxjuLdxUYhpIZUEky+
 YZL4ao7hz0IKQMcrVsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074
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

Acked-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 25aa477a95a95cb4fa4e132727cde0a936750ee2..012839fa0d8a27cafc6a441373f4f6da794388c1 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -973,7 +973,8 @@ static __init int fsl_pamu_init(void)
 		ret = -ENOMEM;
 		goto error_device_alloc;
 	}
-	pdev->dev.of_node = of_node_get(np);
+
+	platform_device_set_of_node(pdev, np);
 
 	ret = pamu_domain_init();
 	if (ret)
@@ -985,12 +986,10 @@ static __init int fsl_pamu_init(void)
 		goto error_device_add;
 	}
 
+	of_node_put(np);
 	return 0;
 
 error_device_add:
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = NULL;
-
 	platform_device_put(pdev);
 
 error_device_alloc:

-- 
2.47.3

