Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EAFCD5BB2
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 08:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC39F10F276;
	Thu, 21 May 2026 08:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6wMyh9G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bd91tXPC";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84710F26E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L75BOm3680286
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=; b=D6wMyh9GV2fJQ0Zx
 f4KBiA4rm8ahVwft1szX4Pu9Nvj+9vf727ddYumyeLD0bzMfrAE0KZ6oHgtfqiSc
 R/Z06LkiMRARLiTkVZikUVyqsKOmr9dYD61LxYNfvUzMQJF4/TSfkh+8Anc6UMkV
 HLqDvBgreugoJt7iZIgoc+bYNdvsOfM7F0O7wQra+ECBQo6ps2B/n9dILSJaBJqW
 p9EhZ5DCZ3JyhQ3ALihI8Wq49SQxDUpWP43KWy0dtQQSSDgN6tWae6KgXXih3U31
 TgBtZjBrQOT4elKE4UaqnfddJYpqylEtpJQzRFXRHCI4S6eoz2u+MlPmc7GZCH+M
 ehUt7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j40tx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 08:37:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-514cbe73d00so182049181cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779352633; x=1779957433;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
 b=Bd91tXPClqb8eVaHLoOn5TOjgNZHvPMaMJe5fqo0na4dPPfwfB5gfIwIuw7WE9arGD
 TaO+0EfvzSrNCG+44MErsmaZfFkym3jhdFNXjEEqw9p0Ndgsv/P9RDqMMLDW13kU8aHP
 iLuoBiOF+ltTMEtK5RmyvRRp/qlBMe4iUTyglAGOWpBMsPnuplkOqKpaSYVWkRDRyhLM
 WGTD+L9/7P/z2trT4UffDYZQa7w9H3pie3AIDmSr+FiEJ/+I1udXjX5VHzZoBYTfOBCs
 1X25UNUMO555IAphDT2Ib4aydPS+dH3lxgQAZ3QXotqFLg20sdEPnK1Hve9aNskmWOLC
 3O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779352633; x=1779957433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
 b=hlTE51lT/URKDHCXcjqtjP/HS5f6JBWM/tDhi8MGpEkNIeqYSHL/O/7UHmVrvYk3U9
 C9XPNNTuHcdB9kjg/9tqFjtRyGpkvHHMS7qwsBYVz8Y/AmD8/qsiC0E7W1X/WIlIcfw3
 nn+xxJ2reKfhQFTUE0obRTTDqpsGKW7BaMfJvus9+l+7L17ds2ccVHhNN2dRz/QvV/ul
 jBABVIvSrKIiPWcuq7JyZ3WLHFc0BT7oaU6/DeX5TCpUi3n3I5W+2EHC2HUN4RXipNdB
 SgvoojxjD68xBLutLM1qbXWPsLkocPOsfSGz5LiQzDCa1my1gUCHDqbCP/ExeycGgeVK
 n1PQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8RJYngVF8xwrvynOMlNnpwphfJhOZ3Eo25o07Ld5/2HdgCuKavlL6rJYJnOnrMNHnAp9RzcqLV+w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMaQSUF+EYKajt1PhTOXJyMjPccXF2LjVHOtAapuv49l4lxMw7
 +M/bqtTXMpF12r+/hQHJXbEZbgH94Y9WkoBMPfMYeJAi3k4KLHsowVCof/HmadvhWMtDEVwJbzp
 S3vuwbJaq2G9QS16OY27RcJlSw4/9V0BTbiBsu4Xd5lkC8q027dbVigPNDMARvne6FHUE/w==
X-Gm-Gg: Acq92OG+8ATjuh+ZJEUSBkZd+rNTGtBdsJkglb7glWnOIepIxOlEBCVIQKlNJtVtknB
 llbAPC3nTJZoa8gpD2pEYcbU/Pn+Pk+wlUwJU9IoO1d/yUFk81+TEdc3+/mYu0bfWG3aiIKE40M
 OhSRk3aaiClmmz4QkDbp3Gm89wdlbJAvP5Hto2KutjuHkf7wbJXUNaXoWtbCQS1QQWeEOfch0TA
 6Mo1h1ekxkhC/zheGVtC4P0fH8iLvU54BZJHIYnt5WrRB5HgVSLbBQj3HxKBKlLcx4h5JnMDKbF
 oMWKPIGH12YnDgdnAZITvhc1wVkGpvMW4iNGPhkWBkCf46sRyxbCU4BVetZII8vIg6I47w+3drN
 0CPcqlxnwhUsVyWzTZzDo0j4/u05mVGMYT9Qd7fg9NW44esjQVXk=
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id
 d75a77b69052e-516c544afb5mr24558541cf.10.1779352633349; 
 Thu, 21 May 2026 01:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id
 d75a77b69052e-516c544afb5mr24558211cf.10.1779352632852; 
 Thu, 21 May 2026 01:37:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 01:37:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:25 +0200
Subject: [PATCH 02/23] net: mv643xx: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-2-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vq0LogXtRhRUgP5LIHiwXCljDYw8Y78nK8IIxKqwPs0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQeyipWeVwe1gZ+CShmDvyxkCw/2ac+wigtc
 yDfWrx9B7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EHgAKCRAFnS7L/zaE
 wyD4D/96Sc4XMe6BqcGdeU5XMrq255mM+2Q9i1CnFxUGJYNsHRGALjwq4agMpWWID3Xz0IFWadP
 f9cYo4zSx5YrZJ3NC8aBSnDFEgSpaoPv3vd9dR2i8safu4aQx7wG82O3RVcGqAtL3shTrfG+ziV
 24wzbVP4UKjc4kcw0m4sVpF7kpzz7f5uypJ40k4tC22VMdLsN48F2nNloAOonMA1CRtVwaegwPS
 +LUzSr8fUVE+Cxwfhm9M9QMbPPQV+Xz+9D2lIV7JibUmMSyMlUkkC6W1WGY+EE+y164ZvEPQUQ8
 pTOt0/CtDCCs881XvieaOneXcOv3CZKeJfbv1pyGp4onPZPod1ja8YYi3oKqQoKx/gipqSIa+KZ
 Q/NIA268QzWCrxR8+M+BFyghvPzKE3QrjxrAPc3rcoL21lH4E0UT10PFSpkt6UoABVUDQdVTK8R
 RrccYHir46M0LNRd0CQvLxeHCuup/uV62AYyq1es4haCqR+Sd8PD0hE4YjipqixdOX1d7vlbeSE
 rgk90YNfpnJQ3q+VJCtHjTCKFzSuzfumxnfLZNPUSMSvUO20eJ4PT3Lo1yq4VTiixwQqm6Ev6wg
 dUzkMbEHmGi4j5dxcRVozkGO2hBgM1870hwtdEda5YSqgm33yqUq5FDx8pa0vrhMYxaI4X/Iwcc
 +Nh8Ur4nvc/+Ing==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec43a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2glh-Q7MoEu8omcI7JcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: EjA2UqGKIst4qPz5zbEAuAFuSitsm10o
X-Proofpoint-ORIG-GUID: EjA2UqGKIst4qPz5zbEAuAFuSitsm10o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/GRl2vrFOSd2
 Q7HHzsNWLnJd2iSzTH5KuSf3NtKdDjQdqW6vwBGlkfg/T+0Q8cJmB1EqwqgYYx7JjqCf7MIhdvj
 GGxD4Z3gy3dfmOL++7p39ZNkxuIMPmtAqv8a7wqBknK94mxfolZbSFrFT9MtNN8yLrfslCM8m9H
 jqpQXko2Pqa1fZNw3+FYXAYOsUTmsZb7RrICMV6RJ/SMcWljj4x7WAsC88HTIycT3AUnOogEaE5
 HHZQYiEkpLltKioRe+GaeRMijIgL64Nnc1Af5cL5FnYSeWVysjLSRvOSmCfDRLOaeIQHGmXLO7J
 Grf0dbKhc4Av/cEUphDxK0KaJ78aXaqCx7QK7Cr+jqQKR2/395AEpSoRLpSeXrwDmLG7q+FNwFA
 sVHONtUTfCYr5TTdtZVGLDbQkkQgEo/DZCN5BoBnXbVjmj1WLhI/UGKnLr/ywoWuZv+Gq8vR6lt
 A0bVuWxBeINuZA7rc1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
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

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 76723bca2802 ("net: mv643xx_eth: add DT parsing support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index f9055b3d6fb102ebc695dce9c6c8321889a78dfa..1881583be5ce2e972fceb14c2b8348280c49ad1d 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = pnp;
+	ppdev->dev.of_node = of_node_get(pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

