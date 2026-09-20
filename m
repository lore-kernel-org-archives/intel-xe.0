Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1D5C982EE
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAF110E28B;
	Sun, 20 Sep 2026 15:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWyQcel5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdwMq5Wo";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7072610E279
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBoeqr3272496
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=; b=gWyQcel5PQlGIvaF
 89v0J16W2kHow0eXcQk1Ikpk1UPb6+b0NyHDf73otBPE+HUejqvOV+/3rwcR+rSH
 U5tTdN0hyaMHO/toVhiJrQEwBx+XVWbhEdSdMFnrj2S7rZvfUiV3K34pTvOPkrVG
 5nBkaHu1g/PB7Psd/W5cXRb4uyvhcGZpEga5gmyBYNx5Sed3VcBk6L8s++B6t5Cd
 85Slr/CIGVr8XBZFhia0Aloy0DIF4rnnb+VN/6v70Ew/vV8ZvvP0ac/wL9F3pxTp
 Erf/PklqnDeZRWMiIPbxMQklb19aIVIxaiYql6XDrTCx4B6axyeKlqse+lhaYhR9
 DJO26g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbc6q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9104215fbdbso27913716d6.0
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916498; x=1790521298;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
 b=BdwMq5WoU0dLPOQmIFkPmTJMzO16M279N9tsJugwHY06pU6H1W3U69aYjAf5FddSrc
 7zGyEiD0CXIaYpuvlDZiRmwUyiREPedPWI9u3xOEPUjqMoUT7q+LeCxwn2KIReYlse9J
 WtSSTVDdAMEVUjc+C5vpNGASkz9MhJqOdGxAjscJbD+oIVm76ZOwiYLP8/GpF8Q7dkGP
 6u4Hn6XPEE1YA9PuUWF/rQZONaTj+SlZzKmHzGRxQm2OxCGJxDnLiPgfvnH4fsjtFoJ1
 70T0ubJMtAV76eLE8tDcHG53lDMsL1Q1A4yMJ1DPRD+kcpeAVI9SOzYiiE82Grr+Wjo6
 l6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916498; x=1790521298;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
 b=oHRSgcx2QuLsnDMuzoFM5YAd2wuaXfDLzRG9EWpNjFyO2ivR0sh87CdCNz0d96bzOV
 79i3wzVXw0XpA4+TCLpBgTEdsc6jlpKFCUP07ee+MJfEGnNPylcU+QloeaVcwTcvhn+H
 phC4i5lbyfJA9HcG399TNnXIgux2msLnEJkvcf13cFWMMTH/KGGG4duZlwtjKn69AJUN
 exCPi4hAe7qju13XOCd4RvnS+EIv62gfFaRXBbGBvadpUHTahDJ6a6qNWmC6Z7DmpBF7
 UjSHVctYKCpEmsTRJgNpz1oqCxwkL9grF1mhGbXsnK5YpK8xR5lqoXSiS99Cbm7dXfMy
 z+VQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxOjA/c+cDrx34D0vfgt2Q2pWUAmrSWHpfaQ0SLxU/OiPyiSGU8CXNAA/ivJH8k5TsIU54Sa3V5zg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kP46iFiFSWMAg50Nv0s+wCHU1Ke7111/Usx60PTku0cOfv8HbR
 od5fhljFpzPHoQUII0h3Opk+BFgjs8+eLtoe47wxLxF0vJj4HytLg2sqwK9YsDN9WSQ1u7EwsoA
 U+y2Kl1J5Z0O6A78+UmJl8bPbVReWHr7qRtAe49SJHDG4TP++o4GB62Q42ziB8SsofYE2ag==
X-Gm-Gg: AYBFou26jdLsGvtPOjv6MLLZmfaTwSgj8i+aqGiyPqVm0tD+gduyZC/EhlwhWYg8u3X
 xvKhMDxxLgwKGriPbViQXfc1Ok3FNBqKDw1ps15MN8KoanFARhmj6sTlhEpTrNgT4wxH+jjuabW
 plgIjTHFReWPb16TmhKRLnCcm+NZRKeo8KVT9X2VZnE9li9swgsed2e7amiNmON901I4A2Nw6s2
 rNzxm0XBezCsPtEqvqrmzb33aghowet4E7SwngCkRWddEsgWLumXo6MGqGn5CXdVa1EjNfekLxr
 +qmbDZk91fqjARGlU1HclGFEs+pL85WOV/kJFxAV8SwKM0wiLpnrigeEnKlNO79tiC2waoMtb/s
 BwpyodFqrvlCWYkNoBCmrpPmStOh1isvFL/jVh5xm53JIufbOVXy1PNljqORTVXJAVMb0ocyyHi
 vayv4lHhgZzRdu
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-532b71fbcbamr62545091cf.15.1789916497800; 
 Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id
 d75a77b69052e-532b71fbcbamr62544181cf.15.1789916497205; 
 Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:27 +0300
Subject: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHQAEbomyPgJF1i4+z0xHxN/ABd0NoA/dTW
 k3gDKnMyFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1fO3CACx3dvdjG5tUF5UKYmmZ3WVKr4NAbrSZvIxkHvDE9/UakP/s3iNZdimLdvdIJmyErbvKAc
 S1zzrVX1hO69AUkpbXVIMN3d/sEEz5VB2QrnashFbT+beRo23VpkXG5VqybBKszC8RLy3gqDW6I
 CEvj5tEOZoICbtxS2dkMl3QqN1BcQbFmflrOwuxr8iygJH+izfFEgK6YmP/X4ZwfCAP3ElB8brx
 l8DTFq8cR0O0ZoQ6f7ZvfJpWTvHQmyh3DPIBjN2QBDGJRLKebNuT0Tu5qO2D75RK9Xtr2aYHXV4
 zQ/+vgcDu31BgxRbPGWxvuc4+l+OUlusdfRuL7TSjKIyn1Qs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NFCdBW6EZjxRxgEoVfRY--hYd8z3n0Dk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX9H1of+648YWi
 omxsbT+Vw5DQrenODsKc3KUqUwzqjaMWljat3y/RQScwnTCU2iZ9+MXoFeo/CKUtIlfjh63tXzo
 cziS0gtLcvmVBVTACevBmWuQ0Q8wZ/ukrRrWTjPct34pAVAMlaC3Ee3n18GNbNnCDp5ft6Fedtt
 Fr6L9ykuY9uE5rhYpJrIky4nyJ7S3UJOBMpKdfVgqZYp2WRdFQ3IFUqZ6PXVtALwhz+QrI4P7qc
 dTZesNPQEGwcRrtbon6i061JWJoNvrl4XREmol8kmwYdRURJREQUZ47grBpYk7t6Ma9P4u8Ro98
 t5T8SAgqHgbUyNlaUhWtqPFuUr+TpVkU2dGeiymVUxbCmVc3W4Tygm0Ax92pvl+vFkKljQyje3p
 MB48zXcJ+eLNNNWtCkzydZm/2SvToWyQ0i1J3sFUi7uixI64XRPrWaK5ybxbGAq5k6y+RCZu0MR
 A2sFciHfvb3HxLBafow==
X-Proofpoint-ORIG-GUID: NFCdBW6EZjxRxgEoVfRY--hYd8z3n0Dk
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaff552 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1ygFos9S19Hx
 Me6FAXR32XDklJz+5BAQYjbncQlxmOMYr0XoR+i3XqsS5xamiSUV7fZ3WUJCL+GAv5asRXPRQRg
 yNYDzK1HIllxcwgpln1pUiFWCgLC2eQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7..a51567d19550 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5d4945ea1e95..f0facccb7859 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3698,7 +3698,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 50ed615cf0f6..a2acff240b45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6800,7 +6800,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 906aaefca7e1..c3374cd2598e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1884,7 +1884,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

