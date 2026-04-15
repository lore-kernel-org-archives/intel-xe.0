Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B612F433D4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA5810E7A5;
	Wed, 15 Apr 2026 23:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecU/bmn9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9H2liy1";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1CB10E778
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63FELZ1I2972580
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=; b=ecU/bmn9v1itzIBb
 68x+4zJohm4hFwl+P/1pO62Wz+JE+YbZGYSTfNve8Xf74w4ihxA5XEqHWqZedt57
 6LWs4oFYLn9iE/P7lv/E1xQD+ohk7jNq41w6g6hDkBB7WnUjESAoNJEftCtY7WET
 AV3Wx+itysbZUglZw/CJ5WTPnZfPumUjJ/nnLkE/PBtf4NWxHxkGhpiHN6TLx7HQ
 Dm2OLDmS9ZPFxfkY8gjXk+haWXqV8fejehk6KYMuplKf4k3envkRCXsUzF7fu9py
 7EpaSjl8qxAxQUYmoUSi2Mj1H/a5UWHwMFvzLR7ZhBsNfGQM0r42XIVbce5xFZUe
 6vx92g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74gaxc4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50d8e4c29caso189438581cf.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776295367; x=1776900167;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
 b=O9H2liy1dcIk3wGAO26/HZ9Hsxc288PlFNu0eCYD0OYdJFqV2VoXua5PsUaTa+Uw8c
 VPB41t9dSC/s/ixUMRQWsaLDR3YDQmQ7vEhMweua0M7fInY4lp6f4z1nt2DOEN0B7FNr
 i0tmnUtx3jNW2ynUyL8vri2LSIo0C1bm1pcXYwjOQYrjZAUu4+yAqe8Ul3CLINes28VD
 4yPLfGIkL6sipUepk/eDp6tno5RZDPQvrPVugideXysjUBRUXG/zJk9uzQbdjPXtpNF8
 PSittOxd7jKy50a8Yu6RW5Aai+JLt2YL9c9l0FCze0M1EF1SVEVMmqzX84W33GjN1d+T
 ORog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776295367; x=1776900167;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a4KSfjn1joLi2IK5RttCTaEwdkwsswlE9sN0psAruEM=;
 b=ODc+qpZqEsmKIG4KTXfIW9rGeLZDSjKMRovTLxMdEV9Oo+CmgWg9/pU/feuLskc/TW
 W2bFEQrmPEpQNFB5IBkRfWmLZgsab1nxpMKqzUxBBs/h7w7TsgywHo/GpkfPAk/hi4Xz
 eHfv1859AUe3DAUF6uMCZptBYn+aHaKiwkxqAJjgRNLWBY+ogPImu4tDjJ1RoldjC6i5
 TxdDZ0TYi4PP0Yf4az+4BxMfB3N+gpu/V5VXTQBUVnNDhgyhCYBE5wDu391WhxQH75HN
 44sUYv+3cjG/ilQqFfUHHYwQAk0A+HHpz449jPPUeh0R6GioJ4q86TjYFoN8l81mfpx4
 YSIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jQZ++yDYSvLpc0EVYoGPlEkeMkcowQ4gV/H0xEja2mnmrxflsAXEqVOBjGALv+Ee+W1viqTBUHw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJnlUzP0MsK+CK3LC293Vx1F+7Y2jUNDoLtuMYMZm/B8+/T/pS
 H1VTv83mPu2cjrnqKXHUVl0y71AzSiNB11YERNPHtuqKdbf8lIv3dOGq7gKXI/AT8+TnRI/B6SP
 iupMPl8MdymWQM1cWHmfDxhee1haWPP0EMzsG/ihNKlZELASxupSsos5YjJ88yBa+CKz4YA==
X-Gm-Gg: AeBDies4arZdd6NnAaDuRAqTk9HJbQFetgxSUVZgGIcfJ2JEl54mnHEf/XpuPtjsqqf
 +op+j7J70lYnRGYGDCNQuuTZY0ab+041Y9Vz6vIZhmqCaE3oA4w3gLFUGL2+o7DJwHbJ37SQmwd
 8PehTmypeCdA+3eko5Ogz5PHv/mxZbp9oVwfxKEdrF1DtmPN5MhBseo31aF8AJdqaFk1j+u9N5U
 NnQhE2nh/q3Ww1XBhicTy1mkvwGWP+ewdJd/ERlyLyKezz3i2GYSSUYUnpaTymu8GOdWPgs+pf7
 XRB668iUKqdMvV0ZtNQbV1ley8aU3wlh76P8k+t4UffT6Y2ArpJKMsoGHrA6jO8/dH88HWWuSUH
 cQGbQmaN8vswXdZ0qn5dD+2HJedduG6ordcbtQxOkv3FlTBxNMZjdvfbKvYVRP1/BQZOMyXBYE+
 C6upAAZiEzNTve3gZaFZFtV85fo52NuJjY5LwxXlBayJwH0w==
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id
 d75a77b69052e-50dd5b30c24mr373453931cf.11.1776295367304; 
 Wed, 15 Apr 2026 16:22:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1822:b0:50d:736a:6248 with SMTP id
 d75a77b69052e-50dd5b30c24mr373453501cf.11.1776295366820; 
 Wed, 15 Apr 2026 16:22:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 16:22:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:34 +0300
Subject: [PATCH 3/6] drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-3-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6722;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mz8dmJX1o7L+LkFDzvBa1x8iVPv9TimP8vXBvzsNNxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25wq4mEi/132w7NqLGejQ6ZJBdwpIzHMQlR
 CgdKQu+o1uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1bnDB/0SNFEv411ScvEko1SCNGqXnGoqWBUVGwV489aKOY+PT5D4wMY3kl7mN6JyZQ5TDhpESNT
 XszzIh45Q6TdckQtvLV5BndM4pjBHB7Ifftp9Tr0LenZqp6LO2HhtKbsoxtyCdt+2teeemdUWwo
 NFD+rY4+gIcP16wKtPP0HqVTpJirb+ndjoDatTbsb9xXrVGvE8MhxxPMjH3kf627kp+9Bt8S0f0
 PXmX19LnBxkToLnq88pT8puI2CDZOca59+RijyQKFm385Ek4yP7xaYt3ImCB4DZPwj4eR/tYKl+
 92hStNtdLrmfLDIhFNjTci/g+IN7G4qgHoQZ/l2MzP+1pKAm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX71KQtyLkyeVn
 sVrdISVqe+ylt/DTg/KQtBIi6iNsiMKFqlGKvB05J57yzXkRgqmI3d6u7/35KWlcMv8ICGPvncN
 EHNSgY2soqde1DrcpOvoua+WH0MvsRvLF+sE7diLMGefz8vnGA1aH1RXRaX0CgJ8c+YPRT2ybaP
 2C8VCMkniryoEttKHk9GdQGm1mgKZl7gLwMMOMJKm12ZMd6ffGPOXJ6qFaKtImYpOsPmewwVwfa
 4Luxc0t5OjLVGtBALM98ZgOHyNXr8u3VTnbcbSL49SLojHniG8co+oIvBZ6Tg0Xve4cqJDdNgNi
 neiZ1QMYqbAm+OSxmtB5jGygsMpZ2MRNwvOpyIWec72+8PfFWnR7mcQZC8BxmhcQhnwNZVVb5Sd
 ZS8vJaxoUoSgQQ4Pm4fe/KB2+FAvQEDBRD7TlaEItHsUsl0F0veji+O7SQ0e0/KDnGaEZxWlVDr
 MLifK6wF5RjQQuC4CLA==
X-Proofpoint-ORIG-GUID: mpgtPzKz95s-K9-fVBIN4uBRQM9BqEv7
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69e01dc8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mpgtPzKz95s-K9-fVBIN4uBRQM9BqEv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
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
 drivers/gpu/drm/bridge/aux-hpd-bridge.c |  9 ++++++---
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..74d606b27dc6 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_with_irq - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -155,7 +158,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_with_irq);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9c44e9b6c638..5a3dd4f92fbc 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_with_irq - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @irq_hpd: recorded IRQ_HPD status
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
+ * detect a change in the output status or when the sink has reported the IRQ
+ * event (usually delivered as IRQ_HPD pulse), when hot plug detection has been
  * enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, false);
+		bridge->hpd_cb(bridge->hpd_data, status, irq_hpd);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_with_irq);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..6f837df90b2f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+					enum drm_connector_status status,
+					bool irq_hpd);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_with_irq(struct device *dev,
+						      enum drm_connector_status status,
+						      bool irq_hpd)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_with_irq(dev, status, false);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4eea124c7eb7..c3bb30133925 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1555,8 +1555,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      bool irq_hpd),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_with_irq(struct drm_bridge *bridge,
+				    enum drm_connector_status status,
+				    bool irq_hpd);
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
+	drm_bridge_hpd_notify_with_irq(bridge, status, false);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3

