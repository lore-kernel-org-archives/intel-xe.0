Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0E60A2602
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJlErNqe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmzaDL9G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33CF112B45;
	Fri, 23 Oct 2026 13:40:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49575112B58
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NAAZcq2509102
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=HJlErNqekbOdhbGu
 fq2JdyVxxnhNnzhKDDJFKd0T3DVu7DzZmUgPWl6QZKXfvt3vvObkM3tjay+9hwL9
 bieK2sbsTVVU/5P6AbfilMgaXi+1l+64oVUBLC405ul3DaQdghriXAciLH25sdlp
 zAUxptVQ/3LRvJyRmkitrRH1L9N4E2QuCrzaHQet6aKbJzc9K4E7Fkzztv7KtKpG
 Zd/LnXFr0Nwavc109VXGpqqdJ3rHVukP6XHwd2VSGCIPlz4vuUmlVSFmisvoVxkD
 mk1CEEz3V4+xr35FV49nJXDUYWzjq5mNgFsElBMx9Z7ZVdnPLUAbNWNa2sMd6mx9
 4LxOnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbaku-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso120472985a.2
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792762825; x=1793367625;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
 b=TmzaDL9GQM80omks6egWxHxYIg/6VMWGEQfwUMOCq384EeqTLN+J/x89Q+Ko0+hWFG
 4cLEYh9SpeVnQQ8CHr6zWv05ZSmq0L4+rE3NnseAapCqvrnmKfb4WSylYcrsdSMrYt9f
 qCDExbMsKU1zTwfeTc7fAdd4OqHo+CrJKk5X4UKXakk2QbM4LaYjLT+hQ2wY9DHbs0PT
 CSxfb8dfmOJHDvsLQIpBdInIIUbK5jBsf3b6AryONIcjj/xN61tEtjkq1qNzyUnpZ9fx
 V6hLEogqLp/88A2uC5d1AT5SaVlZbJLwxMd1D2LCikntWb0fcRKS1OXX+tXCAJMDXcD0
 8mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792762825; x=1793367625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
 b=uFho/lEihT299V43CFGzy2psqeqA1lKUI9Rz8/WTA9hLy5/uV+mItPILN3/8T0bpzT
 LgTNzo2BH3hLDOjSOFUq2VsLWkbDnN9F8NPPl5Sbl/8MjEDs1X4vGOODOrBG5wsIektQ
 J8xmASKfYv51whgBV11TWto5MLukE3UOH7IAiC1RVLtkyjHwCKeBzShWzADDIQBeWlor
 FJV4Nhj8dLuZFPWycGP0yrnehO0nbbp28mlUGq1jZzw9U8QkwYOdvPAV3RfqIDdEC14U
 JoI6cXohXiRjr4g6PVe1BGEbhcjctM7L06bFi9/kU4Z+WqlUZCO2fDehvqr/5hL3/fMc
 QyQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQUkr5XxZP+zFvAwGF7jws4NB4Nvc+uk3sv4+gHuq2co09HyNx9Lme5OjATNklFOVdopJjKvlNSw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK105RiS7zuVO3PktslNxNLAGZ2OWdwU4tbqI6DTNG3a7fhPvFo
 QmQ8VTKdpDC78ImRkR9Fh338WMzHRU3kPVdv0aUfSlJGUPWHVzPo10qqIV2gcouocKGvj2aPrST
 9woCxvxjoYPE7vAcdxw0qAQcJBEgzV/topqkzRsAa+co6VMLcsTF3OeKp2RwirAIv9AgbOA==
X-Gm-Gg: AYBFou1fShQGxmLYCZKJzKJd5lzhmJSljyqoF+DFLp/A+giw6Rrkrp8YdwMUqgLW4Wg
 8TT4K0BqHQRG1a2qeiNjdK8u34XfAaBEg8+xoSJruId4h3ZIlvels4g+NWdepE8FWy3lE3pFk0n
 9wPUF8sd8PXiFrpQ5785UVqvhbDdeLQjmkdX8x7mwypITTeljwHJax7ceqS+2GZpxdJEAhNx8gH
 EdTV5Qmx7NFMWSoONrvXg1mf9HJMaiQGtY3/I+j72Uxd1E7dibFv3c5Wb6gkVmUkkFSyMpik8pm
 e9g7cX0+7CtSfScg40sP6vXOS65y3P56YUjgXW6F68vrzy/PKztPDwyOzXXmXROFLdmeMeHIewS
 pMo6W89pYtEU9dw19CU3qfSjzR9DijEW+ifwIo4W4ppWr4CU/Q6WveLmACvG94FqEcgN4Jyqo0B
 HqiaYFyEIDYQ/T
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id
 af79cd13be357-93f6f91b90bmr404249085a.18.1792762824576; 
 Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id
 af79cd13be357-93f6f91b90bmr404240185a.18.1792762823901; 
 Fri, 23 Oct 2026 06:40:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:40:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:45 +0300
Subject: [PATCH v7 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-5-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OpPKFLb0QP2XHRz897yeuMRZWhayLOJL9in
 wL0DwIb9xmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqQAKCRCLPIo+Aiko
 1WMnB/91SjQ2z1G2jcpsMEUAbLrvbhHjUWRqN9sYOBcBnF+Xi/fsnadkbVkBkay8z9UzDLAAWGm
 ZJay6mLJuy9ZxSPM1Q1KBpJBynYTjlRPeVT6YmBj/i4w/3dpKkd1h94Gqce5bTTVe3nq6ohfcwi
 Q0FZX2plfnEhtE2p2/Hs8JwGikunLW/CTudWq8qotyE00aQtd8EEx73Xf6YxfppACGVESQXt6EQ
 jwiJUlk3B/H4Lu/sM+GsNfAlSQiXTTwlFPUiB0bGv3rJttkVXl3ZlN3ZFbPk4GNyyfGRdDtqX1Q
 uDLK2Zrs89ydnUo86jdmaZFwx0gYui5hMi+aCE6sx8ROdlt4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX68wdZMZX055w
 TNYm5cRsPAqs3tAQwD3idMYucBXhn6/nxXwgkYsFP2sQBu/M+jTbcCMOO+ETars2EtabOaoYsNw
 vUi8YyINPDTsdGsYp/q+JgEW8rIdD0CGNopjnYOo26wSLtDTb6Nq+G9rN2JglUfTFHC1wa/g0YK
 Qkz47+MnT9cEsgpY9YxP0k4Kn1LJp+207X3PUVB0osY2sZeNlpnZCrfHleMWLMOZ5VJUoKLssaV
 zrTs5T5fTVYJkytEwMZ1Ou+dd5SBKEZmgcLjUwdt/L9KooCjXwYL9LkQLgC3AH02R2U2GU0bcoC
 6w2G6q6p8DC6l8080RjmkxOT1pmC77CXdZT9m96BwPE0AVoUXecE3/Yoh7F1p5/d6fwZuXLVqL+
 tUzIOZjrwskTxAC8sy8qr5abxChjMRc5xL5k5kYOaFl+QP45QncU8fbF3eG9dj1xPrB6qhdTm5C
 JrPxAMcLhy9Q76rAlWQ==
X-Proofpoint-ORIG-GUID: LdqDnNUq_xCAL-lJHoyJjYzS2HFjdeRB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX6zFT5YaP6pR5
 UT3VhtDz8n0b0gti4OxCl5fLdsK+53wCOL9IGmeNh61gVRkvxG86IpXEF8JFxgKq9Abc5Syky7m
 sft1FWEfwm86/KPhq0zyhWsJe9tGS+Q=
X-Proofpoint-GUID: LdqDnNUq_xCAL-lJHoyJjYzS2HFjdeRB
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb63c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif

-- 
2.47.3

