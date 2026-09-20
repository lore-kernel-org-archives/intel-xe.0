Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51823C982F0
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CA710E3AA;
	Sun, 20 Sep 2026 15:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDwitiGU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVkAR+vM";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72A10E2A5
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBo16W2569647
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=; b=fDwitiGUAlmn+T3A
 wgOVHrwULnPTDg9jDbWTok799UNFv16tdbaqlNDnLjhMmTZ4b/rU7ICOL2q5n0ZH
 AEDkUcQGXBbvDcKLQBGELs3KXEfYcQzEHcH2eUYXfIpa5OTilkznskHsMWSSBgTV
 A+h/z9K45JMRA616ToMAoA6PfP3WOh1qYXSYGEZQztA+1MFiVP14eezAXuRPcUt5
 ZqlmlL03hNR6ZQgBZgua1syuym1OVKxvGp2EGHog1lVZ7YoxlL2UOtG8Qs4BT/G6
 JMqimxdRVwbv938mTFpEAiGczcn+pNEXuvnZE3zw8fAVJRae1FL+UYbzbs4NOc0/
 lkRxrQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjfuk71h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7a9378b844dso2488137.1
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916505; x=1790521305;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
 b=WVkAR+vMOJV3aQL7RtDWq5IIwtF6kGaccSI19TC6PIM1bWXFeSo0yjmLDNX705XGG6
 RDrtLrKaMwe6YDRG62gbGQVHl/nQqeT6qPgiZoXSHnbshMyI6njzpcqcbfXknNwVOQJj
 5rgKh/NnVSxb8y7OgtJ7fCBQiQsSuyio4AgezTM4FIcs+ItDycy2eDAu37EoVRr3TLHb
 jDSnBfHNhxYCGAU320XJQwB64WUjXJ8jHWCykSTuVq9sZdYz+BATIX0r/zgKmSSblOA6
 gA4U5iL8C9QZl2HaUNjOllSVUeb//+WKdRPRWeQy0IGpDDlcW1+sCFm9e2NugoCP1/wz
 GUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916505; x=1790521305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
 b=X8G9dGbPJwtJuqz3/vmjrZdI5heWGlDZeXlATAAih6sP3LFBJeEdbqJQeq9jXHqYZ8
 ku0Qa3UR+PR6400q2onWLFzrdKgS9R92XH2q9BiBDTGZNH1Y1xdiaY0nmWxikPnAAu0/
 A0tmK15cUGvlRANNKZRtaTX9YCAS4zJ6xfwD+5JTMtIcJIB+pivaaBTteX6cph79e+pr
 JpGYkbrf5/UeYsPFcIEqstIopd3Ih3EVUoyz85ydKJxAnKGCyTp8AJTkZOnmxJDMyTqD
 OA88gkAf23go/NxZOdk60+gWpmG6Vzz2rLZ9bmMlHTQ684v3D64b6ElGa+2YiZb4TFRv
 9vqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1ZHc/BbbrtzYZWmrfGGC5RVstQAcGwOjv6BpYtKqP6OEeFzR4I1untYb+TL2HPYKcIgNVk6POQA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mJfew/m35BdE+USKKHXG6zozWr9AlUNXe1Oe+9AmJyaF+zwSs4
 vJQJgbPYcxZkrI77GOtAaH28dEI6ByG1UF+EALtSv1LAFRACdEgfPQLBzwj3MFgbX6iWRcAMjKf
 4S/rQ0dIsudGexGpe6QRbII80B+8adBcO71s2ZKMhJP393ZRhkWRNbey5/cQTBI+FKMvy2A==
X-Gm-Gg: AYBFou02SbUUyJMKNBf6fsPITgQe6az8lsddfhs5LZaC2T9ueFUb1z47qZxNe21PRpP
 9v008hY6Cs5dP6scQ/80W8/3qAzjdTy5L+2Xuan7TYrVQbCzhnr/obiS1MPyUfCp/+40As7AVyR
 WjRAI10tz3H9QOSbOhyencKBl3gWPrpdoGq3D0gBIJR+YdHTCEQMX51mMSzHDm02xoHU69ADOBV
 s/8PcZzaZa6BXF+NxHCeCvmyRu3EuOvHAqGJv+pz5VaWLgX7eZD9ghKqYrZ4nwIIQTkimLIAmA8
 zMUNwPyWBgSpfDIKuO/ojDIPPlGOcS2AwVgPxXJSS+ir88jwzCcnNL98rzAJQTho+kJs41VMTwO
 2sOvxxcQRtFDQJb+ZNxYX6+beFbmyg7W8QIls1lGnD9HNNPor6FBowmBCitzltXHiXM0dBctdY9
 oVzdbGpOynbJAU
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id
 ada2fe7eead31-7a7196a9b84mr1109487137.30.1789916504268; 
 Sun, 20 Sep 2026 08:01:44 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id
 ada2fe7eead31-7a7196a9b84mr1109380137.30.1789916503710; 
 Sun, 20 Sep 2026 08:01:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:30 +0300
Subject: [PATCH v5 5/8] drm/bridge: pass down IRQ_HPD to the drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH0X+ZgDiNdgzP7ztTorDWrfF/sYFMWjIJ+
 AFYEh8ij4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1dpmB/92Rev8krCBc9OkmzcO4nICFFJMqs1wwor+LYDE1FIuzYroa9qKYU+ewIsPOeIt8K8t7Hp
 Gxp6nAMJTPtAjZdxhgkdecOWQfp4RIJhtTsa3ahM4r8zY5uuXzrEaGYJ+ZGNb6j8FtRUK8EgEiP
 hOpLZguncW4ZDHTzc3E02aMh1s5I/f7f2CCqHzJRxB+H5rYG4EXSBWER3OuELSZ2vqKLTcEqQeg
 y1KaNlpG72U/h2VtMdheehS2cDOllI4OKq/e3bBGrsryLHSF2rSVptWk/gJ9j+M8heIaZdyT4oT
 9ardZe07B+qSesrCWyyiQcefaFdPO9NmF0V/cmMAPR2I2+bi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX4L+1kspz/Rer
 qeeloZLFi8Ls6uNmH9Dgy1yihuzLF6yrkpipOZZDNRw+AD8jd2NndAfK9+PldMg8mZJ1piVc/Rm
 wbnTnDX7e1SGlG5spNEQOWVUh1WPzFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX8mfHM+DFvcDR
 rF4Ko/fltCaaI4cD23tTtrJtuMJh5xsHhmU0iMmPI40f5YTIkuzr2k00pUauf6xwUUQXIhSB7xo
 /t2Os8sRX9L3PGQhZk1eqNyFtU9em+EDVGpKr2WZrn/P3twL5BZH/1+22KnGa7IBBOWk0Eh45ET
 /DGo0b32YFQIuoPtNWLxMdEzWacgB6jm8YN5+qBMqJxijCzWOrvbPXqndTg4sdHNULM3dmYQQ9D
 jXS8XJWlR3Je0fOPI8FRk6uRcGtm0LB71dgN2qIOIxVAEffjK8b/sRBwDu3v5Hv2xE7Xx/ngiJy
 1YUhM75S2Hsx2sCPnk/TchBfn/ilGTmDLakKwHA+b7RP8YKr3jXtireR409jP6j4FcYceAZd5mQ
 krVDajt0zU49z15cJX1qCAZQlrJnBKvPLY72/IuAs8H9AXwXMvqpVcmLv4MZUt3TWon/GCGe7Du
 RIHtn6zn/c/tjiJqc2g==
X-Proofpoint-ORIG-GUID: _tky_rGJutB5Re5_So7pUxqDXudaiU_x
X-Proofpoint-GUID: _tky_rGJutB5Re5_So7pUxqDXudaiU_x
X-Authority-Analysis: v=2.4 cv=QKv91QLL c=1 sm=1 tr=0 ts=6aaff559 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
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
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f8aa2dd1cde7..083d70017f02 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..9308e373447c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index ea0d749265d1..47fb10628125 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ed9f77a2597a..2b3cad4bedde 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

