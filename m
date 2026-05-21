Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B717CD5BB1
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB8610F27D;
	Thu, 21 May 2026 08:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="djQmFj4O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsyrg8TX";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BD810F27A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L2SwxW3815917
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=; b=djQmFj4O78Kw61Af
 ZTRwyYsSq1FlwApquXAjrrMNV6MDYgIBSnNZiRtCqTVIosmFcxjAkb1ty/75WjCK
 YhtUfvmst1pJLM3GcrvSe0ezIW7Y50K4lTYcWo33TJohgKYVSUOZ+WkqzTwOCbCo
 gSbIPnGGTI5VqDzxpucso1RxtjGPhan9P3mqO4xk4xxPWE95nTbckAEOX/Nhkh6A
 zpCTWRZMwjoYJuZP0mtrLG2RWeFPWj/XrmkVB+nJYoKeg7L7a3JorUpO1077eV9g
 V9PdzC9QKLJxRsQUorxPcY9EMEzc++ifXfG4xJzguDOQbn218aeX2vyAagWRixO5
 w5qyzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19jp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50e423a05c8so160875841cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352639; x=1779957439;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
 b=jsyrg8TX6ghmKH+zxZeqFGFouUz8eULNSaUO+GTT+4IA+vY4l15B+QdhNV1qBkTWjr
 Jn5MdJj0LsRlnkC6+g1CHuY9Syjf1jO6mw6nEN9VJoCXbh1CE32ZEh8BG/DfnipIOVnU
 vRh/NiCxug75VXAdE0w+mURK560Jdv7cVpzjm8f0L3n86OPMTF4ZbWKXtDQ5pUjYgryB
 GTrzfcW6wexYzH7dAjMxf8kmvvoOqH8bQo4IUaEW5UxHCwn0faUGqPbaBNXBQcrIsT70
 0KQy1F+DW6vQ6HCsdH/ck6E8sYPQl+A8Tg131uLp844NLv82swrFxHAq7CNhMkU0tZx0
 lygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352639; x=1779957439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
 b=SEev5t5ldsezcLn0dY2r1ZHazafrvOwhmNgq7jkBPq3gsz/kohzsIgv8/nYyHoMvxT
 UDyW8pMhp1ZGiSQHkYTYjG1r91wAqz93ET8N/FRCZvr6/5JyN1YQMP0oIS1FhtDE4cwu
 P1YGP1kFM/sR43qQxSEu3IHARGbo8O5HT7IfVIkpI67OoKbdEtHHYrVmuOLUlvLWFmTx
 gSZYobqBOt2dn+7afoAY+6cUa12mQwPdgp7eyxTespbZVIWgBw7fgKnxKEo3kQsLOQ6M
 bXG1oGoWBRdPgjVDMqu1+TJTX1GJtvAyccoEiU0HKhW7Rv9HTfWz1M1uLUzf7EOwtM6N
 IGJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qdE+QDN0ZQUWUhmIE0eiyde4OJC45HVv7nx/6aoJ38Kg9a6oyEjVrTBAF6tV23yGx5+xBSVZ6zQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC1f9/sFYPem5FZ8piMOmqYbCn5JOTmZdOPT65sdsYnegYjz2P
 jcldRisO1ddpJ37Cjqf+vvnBDCkWWqYYSR61KMSE2j7wHiPp+Jz403iExJDRM17ZbjIsG7IrO7O
 IzGPggDELZcPv0UwpiPeJXXtNrunp3qg7l/lzS+Ts3kOTXi5rxdT/4h0e2YwHSRgvAdGUsA==
X-Gm-Gg: Acq92OGnyhbOcR3b+1VkQKe4cr12h8OZv816ZLpApHSNoAgznZ9KSZG/g2SKvERxfTk
 A0G2Hvm61eKX56vFihuKoXY5Fveg3gWpOVJF4lvp6L9mipDEZ30uHB4VYaprFCNsPUlVEni6PNd
 jR2N7I06l6BAZ5OE2KNMu3IjXQ0eUA9992N79x4yM+Jq+l5GI3LP05UT1KGpIhVBzvVtM4StYdm
 UKUp7PFVMliMb4ZSamLwCi6HzQT9n/Rbx3lAjA/EeGFwxdmvys5Vk67DtyryVf8I4hOUjCqkRMC
 +e+2jXL/U7Tj62oesHzAF/8BIbY/H4gzbCMAghUJud+74qzm9lJBarpsx8KwO7jpZO0m7P9A/hf
 +ofM7Ni7z03dp+MhGZD/Aar3DNotVcrZbXeajrWwzHfYwF/HiRgU=
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id
 d75a77b69052e-516c551754bmr17064221cf.11.1779352639517; 
 Thu, 21 May 2026 01:37:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id
 d75a77b69052e-516c551754bmr17063841cf.11.1779352638906; 
 Thu, 21 May 2026 01:37:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:27 +0200
Subject: [PATCH 04/23] pmdomain: imx: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQhtpU/CqYzAaq1jp+LLLiJjIA5Qt/YY/0VT
 S3IUh2uDoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIQAKCRAFnS7L/zaE
 w1etD/4l9O7wUTmpxjRT+gvruneHUxzYHEIhXscwzHkmXXFaTqlBavoUQKz+sPAmBcudjOXscQZ
 mu4A2CkrCOVZtrepbcDAksLfqo0RIXfw8xZ6iNAc7TSbIK3BuxmxPm9SM9FrlfFCYlcXIlQCPU3
 VVJ56YN3+53SSoxDlaWqJqOl01UWof5ledWKTH8dzoqTxaxB+LlTLL2+tl6wzT1hIGLaHrq0NHx
 bCcVpM4BywkAyrn1olQuZt9D+PmGCR/zu4IqxjWNsg1Ik47sX+JWSrJCCDlVs9WzwSP6edRFsTr
 eWVh9X/z0Zp1hPf5XkuxC8WEE+ciQUi1ZtOFxOUY3Vjfup0mR2EWcJYYwcvH85XbmRz/VZugYMl
 LhAXbqUdasak8C0n65UmlfBHkKOBeIwN23suD7Yx+Q0ORyAUBdEQEp4N7QpNWQpHLr+upEQjLOY
 2MWtqbCVH++FysZ9T8ZwTwT0ndcQDFCyMi2V3eXQjB7KVSGpXFzWPg/SFqJSbL97xhV84W6Izaz
 hKCOM+EEUU296NZs3+u5L2wPfjObJIqYpxM9fKJuc1oRI1cjHoUUBAbdGLhOXXnN62XXTsUqhLm
 zCKbcupHSwPo+aF8UgCOTdYr82ZFVr+ZBQa5PZBJSIY2Wd4qB0rRonQwRh/TRYIARXk9niYp7WR
 TMEzEazWVqpnxdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXxIFVxSsmXhU8
 yISYo9bI4ONjOEtw8sEnbqrih4uJe7VLaEFxP/R5HZ/w9FJx57wTB8SdEePhtxsN8gs0cipx7Yy
 XqlkzkP55E2M7TO1DW9fIgDGn13EZMtVqNdFIj7C97Or47wZGFB+w11JWLtx/pA6Qx2Gkp5hEYi
 lTeL4uBUASCxTc1QTor8uIo6+nHmFKTsEsN1oIRHRKkmAgFMcxd5dbWP+8B1ZScEa4bGkaBtQJk
 rbHU6PPL70mkmer1JNEzkq1VxsnBHSJUdBfesS/erpNNynMigThzkE3kqkSNdi/g04NDcDYf5w6
 kNTxLesUiSK0r0JTGorsf5+WMs1S3/6bemX1hrFgSLevCnT0kZuicBeIBW2mSWH0GnLpGUoFDoM
 YBpdyUs2qGjWn6S2OZXN3un0UxEthHY+DrFReNYcAaKFOcADE9hILOjgiVIusP8Rv8C+ZCDce3b
 5Cj3ymo8+K5DVlMRTrw==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec440 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3puIpDhKG-71yv69WsIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 54PPAT3komtcdQ346_DftuAU5Z4nFM-4
X-Proofpoint-GUID: 54PPAT3komtcdQ346_DftuAU5Z4nFM-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083
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

for_each_child_of_node_scoped() decrements the reference count of the
nod after each iteration. Assigning it without incrementing the refcount
to a dynamically allocated platform device will result in a double put
in platform_device_release(). Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each OF child loop")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d4eb5168942a893c 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = np;
+			pd_pdev->dev.of_node = of_node_get(np);
 			pd_pdev->dev.fwnode = of_fwnode_handle(np);
 
 			ret = platform_device_add(pd_pdev);

-- 
2.47.3

