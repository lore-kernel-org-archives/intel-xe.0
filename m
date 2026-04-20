Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF9F5A8D5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 23:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55B310EB5F;
	Mon, 20 Apr 2026 23:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpvBvE1Q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XswJcXwk";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1CE10EB5F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 23:34:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63KHMBoU3015219
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 23:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=HpvBvE1QLHNxgFMc
 QoUecGt/rJg9vNlE4G4+5je7Lv52Wc44BKL4NREup+GtkJlzefSb9vMblGPkSi07
 ssTeEQHMaSu89LcWDOxAHa/PJL+Yf8BE0ke+O2jJfO0FpawHKOcX1KLkIqHvcn1E
 gBG+0dRkFjFCmb1LR8re7MIJVF4MmVbox0mXkUWK8uWMxtq09/mu9qzVtW9uZkZA
 xv+A/lnE9lVAnDglO/OJuphfp2iKqnhgqrn6HY4ejWe8pYxvZxopCN2STQcdgeP8
 I2cyMh/ZdSD8PqhlianfkMpq4FGHhh37vXF/fTe9/kimWd6Q1USMiJ9QOyLukYDL
 czPPFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuktgjq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 23:34:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50edf0245b0so30029981cf.1
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776728040; x=1777332840;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
 b=XswJcXwkuoqkWu/5ltgE38HlPSfFlXoOWp/vJpskzOWJHmwVUvjwyEtz5ql1OVRXKR
 vRZRBstuGnFFTpCTf1Z/iGdfXylVOFxlupnV0G8HIVi8edh3P/2g6tNla2rTYm5Q/IR0
 RWn8A1k86kw8GR4XlLJWhTy1sUp5e6R5O8Il43qY8b4J+q6LuK8FnD2mDmij8+2keU5z
 BJm32Si/ijBl9Ilpd4KnHhY0gUfXDLvL9abLnDnSEBIdVA4UlkdBIoDj7odxcpzFqEWJ
 5wktxIW62VdoKsnVKqp27Xusy6Lb0gZ3hKRfidK2FbCzzLTvZufMtHQrK0G5SJXBCm6t
 VbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776728040; x=1777332840;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
 b=UCCdJ3cE8svAN4RvikAb2orbD2rdCC2ZMCllTkOrG8OHU6G7Yt6JovsnXwf2qd+JrS
 z/zJyjLOdrtn8QMYNJhfd5nz1iJZUeL5a7E7YFUjax7CAIEncpyqZpBuJwxX6gzgz0UC
 LwVQC/PjLn5E10vbmHolRgQVWFpTRnLcV7fRtZGhI4EM5qpFeZ8hHvR3uwcLdhvamTzw
 S16m4HF1CthtO/QfYpxf2/sKW8DolxgGLnxFAV9Rmb7+xJ1C1ccZnrBYnYyLyBwKQDEZ
 umfF5LBAyadVdoe7f+FWNiyoVZxqlbRC3a1PYjMTBA7hCfNZH66fEVvf1SMkZ1KNk9al
 wxxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JTT3ujUQ5M+tMIr6D9lqy2U97rlxbjcXQkdM9qr8hD3VzFpt5SuT1831emB3ck+EGEfF4s64tSg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxXopl75JfKw7ymuE+z+L/nbJGS8QsYSWYxhUVlHCg1s2alSxT
 F+gdCPx4uVF1+ZAMTNIzbqnwZKvOnsgUTDurU+nTqqOQNq5mhAOw+L/vLBgLlVcwNrFPweFMycU
 Wz1SO2Bb4qbHBAA0uUmCYpquKLLgBMqaGgbX8gFAQwO/3zzwOEjkI+2+yqymhprFRt3OWbA==
X-Gm-Gg: AeBDieusDbi4zENJ4aHxTuDqX9LnTc1lBf+k0rYCImPXUCgTfZrQPmnmr0zkej9kwy5
 g2S8dwq218KqljmKJ2fKmD2/7giTIJdA+9AZV0pXYGmTPJ1kUZFLgdGFMdm+3oErlfuqbMptl3P
 1odA9ez8ZbwUzvOjefhGsTtMQd/WrZZsDvRLCa93AE/4llTKgp4buAiHX4uU3K5d7Mg7NjRF/ny
 5mWRPj5qQBqnMXyTZlhK4NTzd/iw8palFoNSX2nOos3MmIU2IR436M55NpXL1nZ6p2fStXRT8sj
 fJUQtf7txB6QZFUlHyjZeh6gRTeh6wPs1/dN2OtDg7RQou/D950jPQxx6WjBMT+auQfCIm39b/9
 Vc9J8Mc7jzzTkIA/LcO4xSgKG2KrzCjVDA/HOz42qV7HJM+SZNgTI1lM0fXD2JS4Z8RA3GQWoIg
 Oxdmi5UACY1044OuvacKuFbf/rc5HL4/xgIbkW9LiPwLJE9Q==
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id
 d75a77b69052e-50e36836149mr208589761cf.2.1776728040276; 
 Mon, 20 Apr 2026 16:34:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4245:b0:50d:8056:da41 with SMTP id
 d75a77b69052e-50e36836149mr208589331cf.2.1776728039743; 
 Mon, 20 Apr 2026 16:33:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc627sm3320714e87.29.2026.04.20.16.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 16:33:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 02:33:36 +0300
Subject: [PATCH v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-hpd-irq-events-v3-6-44d2bf40dfc2@oss.qualcomm.com>
References: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
In-Reply-To: <20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5rfNcYA6Kn6vJQasDmoVbhaWkp9oc1LDRkXYb
 fBIXvmCUy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaea3zQAKCRCLPIo+Aiko
 1R4BB/9GohI0ZFgi+xqrkYGMe/3Udg5Nue1jmSANu/Otqvi7uD155XM2P9LxdiNxtumuSBIOZV0
 ZM2YwJ0094hTPQVf33GGO2TTcvusZV5uQYJ6XLsZYcjreXdNaU7hK/gy3K8J4CDrGah5ai3YG9m
 YPp1Ywnej+ym0q/P04Fko3yj+I+nVVhCJX0grp75+IBHoxlXcN3UQoN52HycYjjeL4oagQReQym
 NR8P+cZwdhtT8RR8dl13lWVTAt92Z7A+IJLUpzga0kyQWAuxOxI4W8RLlO1AGkhOTjPYzfNV+2S
 1iHdUU4TuohfcHIGhYbTI1erKqCzoEvMrcoEnptsZKObh68L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 90XNEbtapqAH_0nqJPDE5JnJ4SGE0SJ5
X-Proofpoint-ORIG-GUID: 90XNEbtapqAH_0nqJPDE5JnJ4SGE0SJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIzMCBTYWx0ZWRfX9gfVuo3NY8fg
 wF2fmEAUhoK0PuWYTMl7FvqHdPeCOcWU8DqSf2odh9kmcn51G/XEzBRpvZkyPyDOz7nKBFG6bvq
 WvINxyLgF8txvYUkFUlm8A+jMDUlcQcvYExwdnMB4wd5RfKi+GIdl9jFMHjvBCqmvj1j7Glm6vC
 YmnazPyAsJRbBPpSdQ9SgAO8g6u7lXNKc9GfU2i0kSFwtsKg6pdlmU857lnljpQqgH46W08h5h5
 wa7zGEgVhaQ35YUAGaZXEVzfHvATvO0I6BqF3vcy/+w9cf2l++nFW/Xn+H4N2xCAK4rUWOZyQvs
 Oqb9MT7HDHqXlxUgNxL8wgNsKkfoZRU89cKuHbBY1WrzKIsR2BY2YKOi1mtd1iqfn0arN+RZw2d
 jFfsUXuytsc6+z4dos8OIbN4Xi6sTAz08KSOkCElgl0kSGTnvImRVdsJ51Xah78rFVWGR8opqrg
 omgkMUzeF2cJxgB3h3A==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6b7ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200230
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

