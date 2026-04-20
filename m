Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8ACF588E3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9C610E6CE;
	Mon, 20 Apr 2026 15:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzNtXH2b";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+cG9hJT";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3A310E6C8
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63KAvMMO3015168
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=; b=HzNtXH2bvzTox7o2
 vnkPd4sgI/sS/DKOfRf6aX53mydCGVWVJlA4CK/Ed53DieRqMAFPl59F3iZtAPvP
 xRZm50UiMSsamOVwmEbOGL74IkUpoYbuJf54e9C6+3KOTQyzfqZDqM7RAUNfzL/A
 fR+b0R/crLZGrmqg90XO8eJG+ggQa3Ly/SID9r/nwgpha4viJgun5m+QMxRGqXE/
 pv6wdVpbMZIBmCowX7vjYZQVVjZCBSJjVxJfBw1kHc4P9zlkQemuwlAdOv9X+cE3
 xGNCuSJaERFq7jS7xr/oNVn9KfLMuR0Fg90XbpPyWQ+nvXKk5KH/QsJgIM/yBGjX
 OE4YRA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuks021-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:49 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-479d4437fd1so835629b6e.1
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776699109; x=1777303909;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=;
 b=A+cG9hJT2dE0ex/YZrC07n6Z0QZcvCc0Td8Nda3Ao4BTozFRBop2XRfqTSNS1YrrNj
 iQCqGlA+IZATytlkTm5C+Js5uXJp3dWqLVbvz2w8vu+n8YjNyovIEvyU3T7Z9oKc6Fwn
 1Ox/aHlOmL8S31lmWw6J+cZQ+vojf9iIIE1b1QL+cW5IBS5trIJr57g5ELQQVsKOg5eX
 AeNsl8epxcAuqaF1RifK+p8JaZm0qeQs3f6uW+6Yidr75s29TOIFtD++iKAgKy66IGtF
 r351Mcx4sqC+VMXkXeztVhzYnvPeDu5Djcz1OcYRyC3Bg8afPxWe6GQaADUw49aSPPcO
 ledQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776699109; x=1777303909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AmYXQGfZQ3O+GgA0tO4TttSZ2SWimLy/iubKy0FAa3c=;
 b=S1LwEDRJWjVoRPczdqwY8pqrsNPXMoucCnfxF9L3gN+vpm4t7y6rcIdkResf0Nyk6i
 gG3GWuCs4md4nx01SyX2fXyE3xTVCpSTw0N3CNJdLElw8TbcbXOfhpSeqNeesS3ObhNH
 GoVEIASvJK6pUZGqw/zUli0TWm8KR5A2dx7U6pFdXGXXanqPu1fZhxEHUzL2y6CLgAt7
 +jOJotwSWoY/5LcHU3Qkt+7pOC0Tv9Xksqj6ZGXr9VVfCBK3GGmq7DbXyFv9c+/buLWx
 y/gdcF2SifYJ2R6uefk8nYDDGBnvXcKpaskBt0fABXSV9XGB2hQxwdNZvAreWMNbMFsD
 Oc8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nZwz/IF2SKLEMB6fvu2WuPva83Zt9XNW+jm86mpujKkoQBOs8QuSgsBfav44+NIeXteT3V89Jsw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweKi694AkN+k/sJoA3DPFtFhVKdS2fabwOKYGnddKsKzkRqYbQ
 VVWjRqHjrLffWZKXMmtbius46T2qDcUOoRPBMvOCZH1k0uWNPw0wECnxq0TVSo4QFkgBizYUUfY
 ctbup5MdIUFzEXtxDXBArPhDhdAkaLVAbRXhWgNnxG9qyDVgLUjbJVauOdmW1gWYXoIMscg==
X-Gm-Gg: AeBDieu8rUGCUU9JjV4QkgwX8cz/3Cgn7fSue6GxRePSvx0hhuyeGUUYXsU8s4lswK4
 PqoXMk5Te1kXB3R7Lygzbg1DmdNpr30khUcj0a5+3WIiH5r4pKgmZC1trCeZSrfsIz1fdntzkpl
 yZ3ILJj8bDGG/EnHK4ZHvqiY8gRKnYGBxkxYDIZPJ8GEt4LGT3/LHuYAnFiM3IxQiJoIfc9y2s4
 9xdatmTFa/UfLnSnTO91WT2t0of+iMxMq6yDfm/M2+KoixP/uscUqVdsuX1ZxyWc77UcH8QUT5b
 N6zPf2wb4p7VMILQjvvN/+s5mUd6MlN5GrQ9c8/4llQ6h9PQGjUXIalHX0PNymBjxnLbI2l+s2Q
 Xxq0J/pgFn9eA0G+yGjd6GG/uGdiq5ef5gtuSMVy2fwsgKKwm1aftIr8bDexJS1dsxsyJgnIcbB
 Z3ZVv16KyHvIQtik/pPywzi0k2qGWAoYA2v/m8wd7urjmejg==
X-Received: by 2002:a05:6808:220f:b0:46a:5558:59a6 with SMTP id
 5614622812f47-4799c917c15mr7094908b6e.6.1776699108549; 
 Mon, 20 Apr 2026 08:31:48 -0700 (PDT)
X-Received: by 2002:a05:6808:220f:b0:46a:5558:59a6 with SMTP id
 5614622812f47-4799c917c15mr7094834b6e.6.1776699107907; 
 Mon, 20 Apr 2026 08:31:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 08:31:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:41 +0300
Subject: [PATCH v2 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-3-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7165;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=k6AWZfyGwiIVOlZPNJJzk3hTEvXIgqogLu61ZvsyYxE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbcgJtT3lfdmdIakF6z34HZ3ktHXV3p5BfOq
 8z0zUrUpH+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1emiB/9qqgqonWDO5IRxMutPkvsP/O4ZS025ejyoyaHHApifkD4C9iGzmoGgjhWTkfpnRhKgQ2r
 isp0o3w5u5p1qilZ4V6XFgsyRjfLzICk7d4DvrH5EvOUEmvAa2mS+K7jYE7qKFvKudyGvkv2DoI
 tt38bW6J7tDM6lKdvnf76uqsppAMrrt3IxrUjPImUdq4j/2qMAqOPdm0Qn/UrrDUS1JpAVFe//a
 4rMM3d0LOFW8D4FY7E1lGZI74H65rwyepCg9WZRJ63ZP6ZiSwTmDkUNbVABy1OydVVQyTEtIrcL
 tyGhgYg2tvFXBSx1rzfsvkhA5hiunDOHNOAVyeg4gsu4okr0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 6BGW14NED0RxSQlOb_YEmfEXGIKlIwTT
X-Proofpoint-ORIG-GUID: 6BGW14NED0RxSQlOb_YEmfEXGIKlIwTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX8QEArKNuyblZ
 ZrdtyIrc7+sQxuJtIzq9FkujLmyhnMPLmy79i1Tc2HGQ/8P408poRXmz7NzraDd0Oh23ntUN3c0
 n8Iwn2a/stPWbmqQiVjSeWK8fA9hq3Kw4w5YBiTIQANJn0LELSqInIzxToN2o3cEehZzxoHqXWv
 npFXPDxTED8ZEi4QKODQey7fj6jsL/QYllO4M8tdGG7eBijL8Bch1wO+lwpDcGFT2oX/mSfYxpF
 ICh/3JoXfd+UOLA2dcgeNSNAvNXpHi0wSbwTM3iFxFArctpoo3zEKFktnHDrpOKi+OLv6gIcFet
 sz2ooVilSKFynbwE/4vW5tklUTmVNSSWNHb86+4eRa2gvHdaIFT8MPQAZemftQzsE1bmbAArkEO
 NVQQGC5xh9ycKx636FlFStvAsE2iz/TL9Qdc6qRT8NbReRw6M/gmfTeY9AThbQvvIvLpAbo0FF8
 4VilHOPiObndyDtvGpQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e646e5 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 17 ++++++++++-------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c8c3301cd936..09c3f5954ade 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..7b258485acbd 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status);
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e4672fbd7a8..2cf604cf02db 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1556,8 +1556,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3

