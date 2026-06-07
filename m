Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2A8CD8C8C
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872DD10E5CC;
	Sun,  7 Jun 2026 21:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngD8UMRR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cw0TkEe7";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31DA10E5CC
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 21:33:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 657LQm4w1663541
 for <intel-xe@lists.freedesktop.org>; Sun, 7 Jun 2026 21:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=; b=ngD8UMRRkCVGGPXg
 fDoNGLDne2G4UuEFKonFSx0S0RwdRzAru+C7w6MEU7k/2OAsBmYgEhJ4x+R0qQbZ
 L2qSTlNJ6APTR6FLdwyAJ3tv/FTIGvm8kU9rY7djgBDw15dFuemzomhxKdpWojTP
 NaB337ghqIJozX29QuKHVtKhQqNLyrokSGQ5vE+zhAJI7N3oE7b9CM3wh6yVU1G1
 vk/OHKxhODvOt+r2AiWgd6htZAPilaoag0Ma/JH8xhNRCCIiRtvi4NqQREpKDMw9
 /qMjeOKjwfGpstW6QDVPpis/XwbOOD1OhUqxD8sbTdei0Ei4COfjwVsXoYPIexRF
 B6tBMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4w0f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 07 Jun 2026 21:33:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5178fc89b1bso44816461cf.1
 for <intel-xe@lists.freedesktop.org>; Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780868001; x=1781472801;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=;
 b=cw0TkEe7RnHL2jYsV+wbdnjEFpReHpkYAhMMMBdjgN2wWFq3Dz0UaDEGyRe/TvTZYS
 PKBpZpRQy4iQrKHk4jnb8Qe7gQ1CF3o55ATyz3YN5tH275mV9XRsMHfAtiKkzIngDZbZ
 cFoqP/n+60b5lZ8Y8CqIfxvpQVS4F9hVOyI1jHf9m8lKbdna2WnJ1Xn950Nje39N0Hsr
 XZj7bHLr/Z5FjN7CxyCprJVsHc507rIDgJKUolXKEappxkowGDTuuls/KiAJaTFTuj3W
 T0zOhnysjqj02scTS8QJiOqs9LK22M0hKGy17ImvQzu9CSacQu5uM7IDp9VcwS1IY7sn
 H2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780868001; x=1781472801;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=;
 b=E4PGpn5JIO8KoPHuz5S5EGKMk3p6q2ZqKCIZTS1/5p6u6yJy0T88Q/U8PDWO57KzJh
 99ZEglsHBAK7Hok47ZYeXLN7D2U1AbnX8xb9sP6RcNtbGzAhRITXYdovNvhB3/o+M0qD
 Mvm+HIz0wgT1TsNJAc+hEbZNC/d7yvLI1dx/CSM2hKRx2AVRB0w1DzcqziJfkaKaL2OS
 /4JvvuHTa3sfS2VMVe65v/3GlmWfJBGj1OXtTCQLEM7ECN0x/iLMyr1P9srtKhBkNMB9
 OkyZIA0fWhC54NcBOT+NtSKq2fibvuIKq9iJyuLmFWQrtk4/bjteOajmn78QKNncmDwM
 yfsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fsaEN8F3Tmo0AoqMw9Ug2RREc50p/PbEsxO21J6RoYHZAZkE/GE0fi9hAWiwEwis79iBdb2ruGQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Y02Qgrhpy4DjERoVzvXAC+3t+fYIYckqhLx2c86N3RKOjzRF
 sQ60O1voOrlRWWYcZDS8h2+Z/mbuw547+yuuECBSgeFnoyOcwNkhs8vUVM44F9NufRLOm/nrDpu
 PWDWvni6Kb6dvYD5vtF5z0BW9X3BoW+j24fp8zG12ZQ2Q+Jki1n7tGi28KXFs0urByDk+JA==
X-Gm-Gg: Acq92OEP7vOFwI0+Y/zoCmEGGu6sOxhKEB/NjtI+/WTtCoufjKncdXjOIuMHZ97E1Mg
 s/WACq0dgX3qygDGiPuRmC9pl+qUluVdjrGAU1BPHXuY6+m6nVdNJlprDcJMFGytuNe3qXFMpW/
 zkxFFBQ4QXO4oI12x5OIP+UKsrUyOsLKMWF66bb3wq3BLN/tBSMEuttnkRaCWno1CM+ziHu/A2v
 XVTtB7NEohGkka0TfCPZ3ZAsurFzHa5Tkie6LBZm6QBGZ2hqgie10WRnv8OQqILKA54YK8r3rIj
 8U9R5/VimlY81deBUUu8e+lQf5TFgbZmCYNYd+8jjrHkgDH4bLyPY2TL9HI2aOj1X2yGx2TcBrE
 jZea7K3Q/5jpktyN1hNik/lqsXhLLeKheD3VyHcpWXXIx9TH0G+f46hCBSFAir8dlYIXP0hiXKa
 dEq909WqDCNIn4nbP+BFA4Q1iMatw+oQFdzYGCS33QCr4NbA==
X-Received: by 2002:a05:622a:2517:b0:517:5e32:af23 with SMTP id
 d75a77b69052e-51795aebe02mr194976001cf.23.1780868000992; 
 Sun, 07 Jun 2026 14:33:20 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:517:5e32:af23 with SMTP id
 d75a77b69052e-51795aebe02mr194975711cf.23.1780868000589; 
 Sun, 07 Jun 2026 14:33:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 14:33:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:04 +0300
Subject: [PATCH v4 3/8] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-3-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7243;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdu6Lwit2C5KKaZ0v/12eMby0f1nLoCKXdHmYUOIy4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQYUpV6AbZ+K+nm95Zl+WoXVrg+fMcXpgbX
 h8vS/IYrmOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWjB/9dqo7HAElaDvU+mxdxI+Ru2jHiFBIziemApDHFDezmPew+WlYPwGnF4HXVVGkwnqnNYXC
 RdsLnO6V2yjRvaDUyB3jljvapCpKeqoAOjTWpYWuh7ruL4RvL3r7RJbVdFiRCgvjbBpkr4EIXLI
 LPiNpjUmR/NV96lBKA8T7VZzMAO/WA0wS20cUkD+RMtdPlURGoSblZFEOZjOC6VhgmtUv6XT1mh
 2uMqBR0JZBDRXy8Exl1Wg7/eF3lvh3i2WAxvn0PsSWdr2wJKf9djD7ZnJrxViM/sOkJHaLMT12p
 J6fPPAx0hkYm0ysKoMyk6Lw8ZrANBEfDyScM8c5G3um5s3Jo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ykWWTIkQs1FJU36Weggiyem5eNxhN9HA
X-Proofpoint-GUID: ykWWTIkQs1FJU36Weggiyem5eNxhN9HA
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e3a1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfXwGp1UU7PuReb
 kbF/o5FVQ2Yb726n6sQ6wlOlGCc2cuo2+6qzi69Z7IUDdQJeD4N1X1mbgF2RnOzltyMmdfB3UeT
 rBs87rPNzDeBIoKb1U5qLAL7SQRKl4UxBHT7bm4Va6jD6IOy8BlT+TOZqY9xKmFVwRueA31pIVW
 7Irt3l7z5cQ1/50gI1iwYC14ktiGgwrLm2fRF0ZxIiA7c4a/ax60XL6TOMFxye3JaZv1wJ20zzp
 +0MXgWHxZ/a4sEL8YoXz5Uun5aKYU6dUgqA2dTXu+JKAnX70YmVrGln6C0otwJ/DXxFLfSYXNhN
 Nc8baqOAGybe5C15uCATMZ3bChp4wUJasz+RYnTfYfq1BpcGfNFUOEiM32f9SYPX4SLaNvXo7wx
 dNQLEo+3xOW9K4kNNCLW2YfMqN/8Houoc8hzEDQmH43P0Vre8mnqHriCwiM56qMGSyWCdAEKHxl
 VdXwv5uoI0cJHp4gWgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 47 insertions(+), 14 deletions(-)

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
index 687b36eea0c7..84e55db5c1fe 100644
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
 		bridge->hpd_cb(bridge->hpd_data, status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..f9a86886b0df 100644
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
+						   enum drm_connector_status_extra extra_status)
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
index 4ba3a5deef9a..78b0d83ef2aa 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1581,8 +1581,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status status),
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

