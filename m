Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B5CD8C90
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jun 2026 21:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6452110E5CC;
	Sun,  7 Jun 2026 21:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed2MZhcP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMumt7rZ";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E82F10E67A
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jun 2026 21:33:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 657GdS1O1113556
 for <intel-xe@lists.freedesktop.org>; Sun, 7 Jun 2026 21:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=ed2MZhcPR3ZJGhm5
 +YO16MmNxuN+dCsrIyoX0dbNtKYdE+mXIeUFaI5m4tL/8sC4JDvTHIF+iI/ZKfTy
 5tuPR0kjUDFAN4M/bj01EFAbZmD1vXgW33IHtqdLaKD8+Og9HFpTiEPk6p2rhC3e
 k2QsiU8LYLCa3Uh52T1+5W09iLZykr+H/ckInlthHNkXhnAD7TMu95/MsU7TO+2H
 ka6I5kIsqe4BprbPkA3vl05DmALsf5IyHe1zEyVd6pK1cyEgQY1P1P2Obs57PNDE
 f0NkV/UYxpwp29Ibe4Qt7TgTH/q1wyqQb7nmlqPwWrefKljAe2zwI+rDAhy4Fzcl
 VjPJvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w4uy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 07 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51776d4355cso115843541cf.0
 for <intel-xe@lists.freedesktop.org>; Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780868014; x=1781472814;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
 b=BMumt7rZG8sBo7RTuqz8DRF21Cz7vbc930KqHBfQv9jhCKaUvw72tGxK2bqh0w0s8T
 y4+o2tiprEcIcbZBmkYRRY3JO3N1HXuEVPqHEIKwvbqjJI+66ILcB8pROUvLp7pqx7bY
 7bhQ2dFr1Druw4rtRI5miswV1JrguhjZnKZukB2X32txFPMOynJcM1sXy1jORM8bscLz
 cTHuTDEhuxK2r7KrRMfGpV6OijWGRhaCzUZdFa7E4Rh5t6MohiwN0B+k0ngu94CeKMOU
 6MK48MsCkr3/RWHAUMpOSm2YZpwheOX6SO65hw1TZC8uWDpTzMM55QnUAfxsJkMRomfN
 0z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780868014; x=1781472814;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
 b=LWR6LAEQMKwII7E/QjtHy8pU5S84fwShmUWiVBmCWIaKel7a4q3H/kAVSmjt5/+mW7
 uX/OgcJ93sfsnKQQ2O2zRRYIpqpCrF8gDhsqYKOf31HHIhMmwGPr4WRNIkSxb3Rra/y6
 G8WCLIVtmyW44R9QRTlYaYhHBRGWqVgAsB05ctAqmydf8gEOBc8TnrU6No+9jhK6alEk
 r4gGQNApjIpWHOBLvPb+lm2KSAGOEI/vNbFMn2I3BsPGUCggny26AqJBYaP7xDce0s4W
 pZm5/aqhvR1yNTZsVCN6UIfHIEj8Bps9ZHPsdSHEdQvGnA6t5CJpNYnGkRcTTtZTJmso
 C/8Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/djM2nnVTwqLR1Rw3Q2MuRP+ylZKMM3y0Vd2oZvqE1XXt62znJlbeGWcGvEwX9HDAyuQRGwv/hdQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnAr0qYViOglYZrSqXKWOq1iHrxn8QOEm6W2EafBasBc2LUROz
 2Gjw3DVqHAqhl+99IDOw5n8EtG7JXIUHX7m5cs7sGOI/swyJ92ebWV3KlAjZ3l02jC8RDfjiL+E
 xqII1uMPA3Re6OGP7FPjp5p3bstAvX0iKXZYRg03ZBJ8CKeIANAm0z8BOyiK043UC9R8otA==
X-Gm-Gg: Acq92OG3lqDjVzxjZuFRNYe4xNpgOQVFuUtgKPp6kaXlFJXPquxsIsMDhJH9SGso3Fj
 ukhzIpfNdaG9rI5S5+Al5edfwbyoj2SYB378UTiKVZF58N4hQUyOmQkU7IKmsEx90LEJ4unWgcf
 Pjym2WnVTNO6/zdoF2p7Cy+0UyG9ZOBt5urhEeTvwX7b/6mHx+fKwEq4YUVP+jAyG11TBY/b2tj
 kbvrz10m+rFXyXEDxuPXb1zmkwXsWSwPoGsUATSM7ewfIRxdnQ1nUNWnwnVMpk0118RF0NC/x2m
 xLzHIO3++kIUAzfNR1BoDnWfLG+9BPl5apgYXO+aI/XAThd8v77nr2MzjVR5fE+r1N8D8eeBgaG
 lhTZ0h/dVmcDVR9P4KcPC5ZRK8U+RTXtrPOJqY+tNOkOOCCGtu3Izd4JKlvH113kDUDDBP1yNXb
 VAJtw5mTQCIy8G0NOlpBj8EWlHr5+uJ7cJprwrugszdqXYnQ==
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id
 d75a77b69052e-517987df585mr128694741cf.27.1780868014037; 
 Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id
 d75a77b69052e-517987df585mr128694481cf.27.1780868013602; 
 Sun, 07 Jun 2026 14:33:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 14:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:08 +0300
Subject: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQI5tl/0XcA3tgWGBDfparpRR7p6oX7Tvus
 qwjrqzb+oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWXCACmNj3CHr4O+YRbKUG+T11qRjlO3v5XH4k0gj9GScSSKB/i++PNRfIVaB3JOvEoD/AYHrm
 YFUwGw2fBFT2Jv2Fhyilg176SDLOp8RsHVt0LQrKTd3iVzD84bkfPw5YQRsnoC0q2NNOeteuu4P
 oNZgIAB39IsrY1AUoXDu87QaI9/TPgg/T4uL/reYnY2d84fLwma0S1+Jh2/lbnZ1SDxBsBxpeSE
 e6BfBudjneZilPPKvQDNmThuUz1M8q6khvqmx+48G+tdedZN45pveTW7QE0GhFJ4QlRiFxRstqG
 Gz/WYDvc1HTnwPXv2iuBiwsSXHMYqAaiEHZoR0/q/qODETsN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: bawXfJYN3lUFExdLbpHvwvo_5_y7SgQm
X-Proofpoint-GUID: bawXfJYN3lUFExdLbpHvwvo_5_y7SgQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX7c2CSH8uuZ/1
 oM6w0X89t/uTQRLtaS/o+uJjOQNj1TZm5xRD0qUR4uVr8HlY2GZNmni8XH6/JQbs4jJVwoOx/7c
 i6YimlEL0FojEllxyXepxB9nafOSZepGPL5LeHDqbNCIV98NUsTyz89IE7I34a4tJor0JwGqEl+
 O5IOEidn/2Wvz3UNSloZLsh6vGH9m3Exfnv3ETJYGVPX8H57an9kPpthbL6bBm/O3K3kZdnhSHX
 CMpuERZgcvmoArynfVLFiYx43LhkhqbwdT+Y0h4k9m6sRd2b+ZCb72Htyv9mQchRjqQP2U9uQzo
 2FZDqgBl+h92pN34al+NVq2B66UIg+eS7kBscL4eTMpuoZeckKmFX8HZqQB3UW7CEoPWERY6Vy+
 rraO/0+bhE12WC694eYXyBYmff/E2HVNh5eT052EgelEkf5XIMHvH+KZEw+t6whtA1O0X82XDXO
 Ld+TU0Zhrc3omc2w38Q==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e3ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
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

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

