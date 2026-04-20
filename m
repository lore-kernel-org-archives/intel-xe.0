Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B54F588EF
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0B10E6C3;
	Mon, 20 Apr 2026 15:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmkyS6fn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOklZxEG";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC0410E6C5
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63K9mdmw3925866
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=RmkyS6fnhb+Kw7Cz
 CHA3bm4xEZvLa67Sc7VaByoq1777MMO32UoiFTCX9OWYl84bQUYSUt5oiuxal4+t
 Y5EjaMT5Dl60Zqc9cnFtdpSqrrXt/Hq1Q1gJ2ZTj5efhBlyqCoDmo6GXDGMI7Ly1
 wF+BUTYzGoj2FvjH6kNVWk2Zwuf0aIRQjO4vHjmTZjJjwQsYHQCJIkwWUgK64xhY
 AAaJIEKog00iwU+sBfnxn0QYK9FacFb+525cT8XdaTQ2UxU7Gze2/JgUjJaxX/EO
 nzWgfUvOT7pye2NzxlbQvMiL6wc0h/titHO5Dy0JcW+JIEu5tAw3o/AyaFwaJJxs
 gK0rlw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9s6va-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:54 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-41c08879ba3so7495348fac.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776699113; x=1777303913;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
 b=NOklZxEGN72zrVoTnGcOreBwRklcDbwFPOCtpQQBcFyz2K2wFdv+eB6pMt9S6oSN+q
 Y6s+14eVZm/IoaCphVWAfv5KNJ0N0nirnj1ebfDrFw00y77oDMUhbvGqEKAdqx2YZOKu
 lJWag17soee0IPd09wnba/ZHTxU6Gb77bbfCcSRsJhjnTGsFeGzHnRYfbIoqRKw36VIy
 iv0X+3DqVMjE9PZ70xi8aC8H3xTAwn3Tl7dxD4T711dE9CWuCjt51mEK4BrtWQJnX+hR
 MpcZFPuFlgspQ4EhasVf0yYOUhpEZXKVZ7x6v1H/NzaRzkPqExyJzA5oQHpsU5xA7Qi8
 /75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776699113; x=1777303913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
 b=Z91cfK097XxYKIXSpoFwy43Ibcq5Kn4ciSLLqaZSj4hV5gSJdsl3ze0Y0wC7piaIHM
 PR31gitorjFrBVfxVtz+3A68d1xByV/96duQy/uafZ20r9SnVP/awZQxKyq9kzeni9oX
 tYO7fSjEsLrJRqJlhO5ptqKYt2FSDWSBkM3umhFjhQioQRvMS4wq8a+sks57fGn3ooJh
 GlOlV2YRheqC9WxxkNrT1etu/R9UIK0UMOVaQhJWhzGFV34C67AIqDmUM1VcWNv9LgXJ
 dkVjQYGQqPdQ4WZNlYjLyj8IkA6CCr/YB3Ideg7sytKkIXiCAo7SdlgnJ/6YsC2hqGPn
 CJJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+42exr2B6AcIY9tlDpRF2+JWqeHcmtDroDKfFVb+3NueSsIrcvSygzUYdCeAxJU7m8fRSA4dYOMQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywkx4aroojszRygtP9X9j2DN8t/eZaeFwjO0834u+2/4eg9jc5z
 iZLsJEidS5SE3nC6aA7Bx8tyUNW1MAObfD+BigV4xWhbMi79sSTB5zFR8SIAzvQ93ZYr27nexIe
 EQPFha0rBfkthOQ8PxgTE4ngOPArtsuakKJwt0LnoGk4Arv7eloXoa3f1zgp124Vk9qnu6w==
X-Gm-Gg: AeBDietKCDYrjjm0RwTygicvJ7oroLgmhoxsnFCmm4JOmb/jouZp4bkk3+YktD1FbxO
 6ZIIM61eU/4FE8lq8/ru3s4xZh0LrM30HRhMEYlTIOMzoeQNhAI4iLpe68jODw0nES27CLyy0Yf
 ziHo+QoilzyNIvFtZRxI5TKoO061q173YAe7h3TiplZ0hF3V73XbQQ2kXdVnKZSS982JQ7SncNv
 54Px6Chfb2P8nxwBNebDfQz5qEQvYSna2TME1j3xMomGkOo0W+H3U0VbH66jEq9rUC+nHOWjxyW
 ceXJ10Pt1MEsB5bB317orGyL8+UCGKXINdvKYDOisRN44kwrKyOziKluyd9n/4yhhBk9SOXm4Ld
 46nqEr23MNNhsHVk4m6NPXJpuHSw0HT170zRBStG2AuUMleQ74H7CAPA2uX8GgfOkI1ccBgWNVd
 32oV6c8NAiiqM3JGv6IwT3mkrsO4tmlxhn7Mf3IJl2vMRrHQ==
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id
 5614622812f47-4799bfdd9c8mr6136747b6e.25.1776699113554; 
 Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6808:130e:b0:45c:85fa:5a3e with SMTP id
 5614622812f47-4799bfdd9c8mr6136710b6e.25.1776699113069; 
 Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:44 +0300
Subject: [PATCH v2 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-6-402ffe27e9e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbdKgPye7XiAeoSoakScVMUMjCOu46HRvpZ/
 8qrEonxwheJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3QAKCRCLPIo+Aiko
 1Un6B/9Xc/mQPkkBXKR61XdHwQ1fxJIryoBdS++LX1KT0pEEYteBKqRJ/XSYQUrc+EPfqLU9PMe
 H5fUvSJHLdqvfoBUCUEQk1YTcGI7SpMzLE8TkrLZ01bkDNnf5fF1nWJ2jeH0js+HhXpHXNYwq6+
 eMkODvtWK6jOOzLJVIWNEp1Jf/1Qo6CBDpX7f6O8hgnOauDvYkX3G4NrCVHZbGnvqgxwfoT2Fmz
 XfzV/uRG9TPUQ007KR6NG8ovnQVsBtzYYjzGiMZtRYlCbgMnemhbOxWRCAYGadr/D7zvREJKKaC
 /KB3r6hKi8dNIA7osaCTEBo1CdUrJ6ljvRhahpB9mb6AkOwp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX4QRZgq8CMabr
 Tey601cfrT8TPtdDFihzQdbZ/2mzv8WuiE1TjX1SoEhhdFm+wPL28j6aX3FymyTROM5LigEl1EU
 S+bvLIeYIrRreBFYop6pPgIcrxfnfR5Kxk9BRvodwDsDZbB0jPt9xTNiOOrNTA/ASTlcI61zyhx
 fF6hsHnCyigKTU0JNshBkvl0OKlXabspwlyGFmxO4igmIHprh4sE0iOBTd3UshTQu7u3RkhvB/K
 oI1MSKF0dbqamggM4QVcGvb7yZvzq1EE2U+8ditJ+PYw2bKA6gGmIpLmLabqJRpcSDiSNZD6mXn
 jhuf6B4JikFUlNAJEKt3oSYClNoBrqmXQrB+5vCD83zZP77ra/HZzMMGkIFiyZxFhzpJGhIEE9P
 h5OnN9OnHh2HsRmQwnJ+kOGlaIeLZS2wo1AgU41Rja3aGgk82QFkaClo6mHST8FW5iCYpLpTKuj
 TpUO3IS3XCv/gK8qxGw==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e646ea cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: nXphYqurlaSTncg8dhYfFzcVfls52wGM
X-Proofpoint-ORIG-GUID: nXphYqurlaSTncg8dhYfFzcVfls52wGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200151
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

