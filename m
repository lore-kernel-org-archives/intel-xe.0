Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5D606A322
	for <intel-xe@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nitdk4fL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OPV6J4Cf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD917112D59;
	Sat, 24 Oct 2026 00:36:12 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9B1112D58
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLvBeR297028
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=Nitdk4fLxCYglS5v
 lpNE3xcYM0PqcPyymcS/VsKjtz9XRBd2fGGM+MttgQ23j4E3RvdXlud5yqSlf8pU
 p2DAz7X16VzLG4CZ/eflG8HzWlkYcaXYdZMYdZOqcPOE5e3JrQVm9A9FZ3YuNstc
 zEjksrxxleEr/nNnwQ2WvQC1T+MQ5thCConlrJlwoBa75i3NjcCHvEE3s/myQl+F
 AcL7XQ5TZg54z1WL3z52y2LhJd0vEJHF5BKNlnByZztXx4TETwsmhkmvXYRa8X01
 W++kkmvGBq/6VIhEQ9N9gXjl1cpDba65rBu+hrppGCwYlCAbDG5BIFyzJmbMG0/M
 I3fbTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhh9x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ca9b53afaso435757785a.0
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 17:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802159; x=1793406959;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
 b=OPV6J4CfBO+HLAG5kxCQPqApt8/Y/j90O2fAUUjotMl+G3ZO7OP3XCQCQjkTKEJorg
 dRGvauAW/s/pvn89WEMVBL37d89tDfJ2RY9Q4NgLPmfILu1eEUGzAMt5yavpoK9+Zkif
 CimRuo03zaSZCFrHyB+yitX50IQ1f81Fs521y5BmqoHnTlnlKeh0DHMvsz2/Bo4RbF09
 8IGnvGuf1la5CtxqOxe+nl1TnPoRnWoxZp4A+3ON0ZpB7On1hKggu9tsbZymV0ou8o1t
 FImEmofV+HxBtRmJZ/SCmcFsBbhzVZDT+7qu+NPMN3ITRyFF45AMQAFYOcQ73OBk0Q9J
 qZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802159; x=1793406959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
 b=ZuXc3Y4B5wpYFVvvHZwwdcM2gCTDdn5sx+0QpmnlM0EJCvrHQjN+E/f0jO3cBNA1v5
 79nxPuKdlTX52hl5u2IguXN5F63k2WQL3Q1Dn3RvjxNrcv/BDPnP8tliWlv0vMJIV+sE
 Vad68J4ONBVzjn9ZWPaJdSYcJVfpthT+hyOrmTX9WEeSwczJbiXMqPhJJFfxi7iOKSDd
 UTc0VnKJqGiD5Oye/a4gKIGgycKO8pHQxSiykWajW7UZ+Hv7IWqM/eX11UN0G8aba8bO
 xiTqGGNA0AdL8uxCmnu9Xhwh4Jr0ziIpCy6x2pkFQKCi4+XWnZHCoCNnaQWsCLdNHzoi
 m5HQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMpAn0MhxFoj3Yzg2Z8jGy+3R8VcnIGguW3bTpO2fg/pcmqQg8YrbQoF5TZdrixsoBZ5a8owpkdQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK5VFRdr7a9AB42ZEIgj9tjopyxkj2+EPzfF3fR0S9/kEeT77Je
 cb6xGrQHokOYm6uCx/RALbqosMMlYiBtvxn5toE+aAD/LSLEbBKxS6ewIAzGKUZkMOtEAtGD7Je
 Pbr4MBoHAs77UD4IZhZzT8kY/IErdKsN9K0GVgDwu7TLmjNNZBh+BZSjZGOUSZu+GeYRqzA==
X-Gm-Gg: AYBFou3aaMjpS5D3GysR3EIa7LJZMmS4K2dJ0Qvpi9hirAhMr6EqALIL9u8mLG6YuG1
 dB7K4iu8JC0VVGsKqmZBV8jYvJADKgqNOqC9PB1DH3OZ5+cJKAj6B3/NypgDLHwPaofcyPz/Om7
 3HuMgO6nq6zZnZ+eFtwNLEOjicfoNhKWYAVHdsHr1AVwkKcxqgMNEm5EY5cVfxBNox7fOz7QdV0
 Ptp4oyc7rArU3z/d3Q1X0wxJiuco5+iv0llzoSx6seflN6UjJtO+kFeni1PMlpB0z6mkk3N1WAV
 oO/aUPRxLxnNeq3Kou5e7bUYAuXjJroU31SFY7/VQpjbtn9FZn1dMnh+qlAg/VYFaOfr/9mbCbo
 WuzByl6CeW6A45qfsDUV40iGlGaDpCq8P3DvXMn0U3Aslg6B8z6PKf1oqM3XaalpuJni4c+LSkH
 IMt8u9AQpBapQG
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-940ef8b10b5mr103665985a.25.1792802159361; 
 Fri, 23 Oct 2026 17:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-940ef8b10b5mr103661585a.25.1792802158887; 
 Fri, 23 Oct 2026 17:35:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:21 +0300
Subject: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Rc1jx/WVBAxhw3KU26OrNO85SIxkJhkU7q
 NYdX6NMwxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UQAKCRCLPIo+Aiko
 1YRyB/9LbMVmJl7aI7tpQ3jFBUMEiNWDbwwRnlu62xPezLv+SehXjKyLlaYUYq036rwE5Vfn7fr
 fjO6IAXeOJobPd5Ps7ADXWTuF8TK4SEkPazkCfk3+c0JqmcwguNt+U06PIDbhMme9q5VezjPLra
 KP2vD/cNIA8QWyiywCqlwJCKmH8WevIVz1NOx+lxbvjX1QJpGxYVM3sXjkPNBOvimQHxjdbWpNY
 yeNR0ZAJMXAlQmPkYIepBREJkOnaUQm6YNANcZHlAKBfgxog5KDW4y9avHL52SAu/vxpuvUBpni
 T9nszAnpxs5dD5mJCT1ZSn++ImmOCpc1qsnP630ey/8TOX2b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX96MUqwWew79M
 jAZkXNp/ej/Jwk6jgfERWfuqinqe1s7e3TxDrxBv7iPZXFXjucfHbyTyWFukxU8K3FXqN0KvR3J
 a/3pxetvG3Y9A4+whJKJceOGfcJzWhY=
X-Proofpoint-GUID: IiMOHAxv1usAm7LY00uSUYZPYkY62fgk
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbfd70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IiMOHAxv1usAm7LY00uSUYZPYkY62fgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXx5OOnyvkq1qt
 P7QUXESiT9Et+wKS1edncAygo2x7qLkLlmULsAXOZVAF4x3Q+pjhTJDJBPmUQzbdD50NT/2vEoF
 gNoXGjRDqgKNF4bAtYQXK/thPP05TjVnGg+qD2f4pSgKKvZDFpll7lJbC8yQ7YkGf80x7aaVtgt
 vACzwhjKzeRwktHvrx7PDONnTo4B2Sz5gjQgZ+NShhvS6csLaYzcNIVAznfue8acNmAU9l2bQwJ
 77LJ6f+vexPtcrm+uTaZ+2H/HUQfvOe9XJ/9EievfFHX9UihUISYOnRZpGsVY85yfFsIlLxsOjI
 0aeOxJUPmykZ5SZfwGcKlsirLhUUZ7cPNs3PJ/3kids7qitDpGKWLicBT+uuZEYorGMl3nIAxd6
 zi3uJOgzWyTlnXHmuGYiwBPo8Z9KpkP1yLpa0vL+eWxmkJesKv/vYTL6ADHSSRbjLxolJHrhBtp
 NEjHvqf2fz6Y4J8W9rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
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

