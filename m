Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBBDC982DA
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30D10E1E2;
	Sun, 20 Sep 2026 15:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyhU/NIf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5B7HobN";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A0E10E1E2
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBnqJe1572111
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
 f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
 J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
 7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
 zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
 y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
 AdYkuQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9u2fy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7961a79fcd8so630630137.3
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916554; x=1790521354;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=M5B7HobNKDs6W2oZ0axlW7qYoXiZQ4CPhtckKGf+q5YT1//me/HDicM0wU0Ag87r+8
 Gw4SYXRgjZNQeihjtImzOJEP9UteugZQ/GbEVaezvUS6cqe5HXJvgcTfjNb44jBeH2lT
 m0i1nz6C3HNEPOTp+1Sc6nHtRT2A7GfuzrvbiIuWmgTjUGoM6un2JpHQ0RElWeKM/6Xf
 CsuUW2eB4r2A5tbPxeAFHtZ/SIUK7IkD1+21Ji5WZ/LYj0zApF0UgF8KScSUDYClL53N
 N+xaODQQxsEJWuL+PsosqUvIzAQ0wSBmyqkUMJ+eHV8I/sY9KhVtlEqplCxh2Pu3Aqvh
 Nx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916554; x=1790521354;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=TOi9EMcTgznFct0JNzyQCGM0OBOU3krxrRdNKr0ShIZv9ShgdZeFyq40mGgi+8Xjyp
 bKEvHfwSND4DNnTtn0RU3/eqZiAHG2y9/WMtDSg5UKw4J5pe6QgqD1ktNuONDf43sSOF
 dXNSHNMWawfcatPcJhvb4U91QdW70dJIY63z+pwuRJeM4OXrczQ3ujwZfzpu3rkbqswE
 wGTX/nVxHAYyG3gcyruA+fGYjtXa6R4cmaftzIXz9e0E/Y8SC/hMMSwZnGerGvPrIRfH
 izUu3XUYWrJZWt6vprDxJ0UtpYnqqc4WIxTEmKY/ibERshj0PBeDh0VREcT80w3jz8w/
 fY3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuGDPllFcnPetVVSl46BTicl2K0ZO59c46jCj4SzWqNXY0hv94bMBWc/+CLk420HLmia4hI1+MHg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mdt4cvaYZI49i2GpnsGWQtSwOq0/b7HNoQUorIa8Vfm1+B9J0w
 EuGkRNiZ/ItraMCDmgfdkuuHp32CfJ4gyP5RVKu0A5Tz0mZvfi27HqdFl/uLacmN0p91wJ0r5fx
 +POBDDw4AafBVLYeyvgizNkhWp2TvrgkwfKyMYuevrkY8ctj2ALfJv9WykgjCfZs10u10aw==
X-Gm-Gg: AYBFou1srzjE7LFM1QJ38vqLVsexrOHyZcoglLz62/aavI7TbMNHAR8lXZo2lMYualN
 ZE2LgDfq99Fb+4H67qMkg+coZM5t+xwddjtUVLOr63UFkVNnvovh/HOebmGx5quyUpqe8SbjyIU
 9LgcjjifQGustGMyj9mvOT0YcN17dihhosKxnSMtDQsvEqEy5TjyHGMILuXd1zvUaFtU8FKhiz0
 Df4NlyQV+Yg8AHWpP5CKcOiAPXy9cbR79XZN/K0ST1xv3wjLVr+/czxi97CRbaiN8IEEG2aa7/l
 HFRLokuiBBxMa0+u5k+PSjezmcmRs+kXODe668u/4vtvsIcI+FkpmIqW+63vQHou4IOCLbnhp1Q
 cIeehJ1cCG91HRZHh3QVGpIPQnuiope60MUPD4q7IAgksQMtMsexDDvAYYTfX4Y6aDrIb9IFnel
 rHolbtx3oNvW0d
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id
 ada2fe7eead31-7a55ca8a2ffmr2385175137.20.1789916540429; 
 Sun, 20 Sep 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id
 ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407; 
 Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ze-DNgfLmaUHPs__Q-ZrRK_KN_SF8Boo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXxwM3Ak23Lihk
 I/2UD8W3sTTOj6njzp2XlrkPB/0YCK/wKlep0qB7E9APrU2LtZDYBWXCWj7zjj6B9bMokUBRMb3
 aPykZlczLvz8ikTE3h1C9vwvjKtiSZrshRvMG6K5BOEFl+L8/s7vfo6BWn8/Sg0ClaqC6+5mN1r
 7RpLwk25xvqCI+X0kT7YaJjY6XXsXXdUDDIVH7YR0h7hPIPCmraVg0HpH5WghrbaW+zvHOaJwVW
 cctmEW5TPPPJ23i5tpdGXijKg7j7a4D27bkRHSQKnu9zeox9Z9kExoZypW7qyJscbVl82s5VV0M
 L+NIivZ3O0JlSx7oUKkcfEvbBNoAwhxXaa3B12rRhhwNH28gJDyNahR9sO6BJkf0bfIcHlyROix
 /reEqD1bp86U7XH70TuSyG9z6ih+Vex5O9dEVnfPWJTM5Q/UOBDTAo2tgTI6dJKN9Lq1VfV0S2f
 STM8k5t3lOFBcaNmUkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXwcEqObvrAlG7
 hH7ou5vQwm6Efj+6rlydSCwSmlWvFBrAN14pFoPzi31sLDuK+Z+3dxMwBZniuir0P6t1gJpMMLt
 GMa3grP33Q9/v6WW/jxkTaczHDLBG2Y=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaff58b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Ze-DNgfLmaUHPs__Q-ZrRK_KN_SF8Boo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
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

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
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

