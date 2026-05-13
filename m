Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE649CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 18:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDC610F010;
	Wed, 13 May 2026 18:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adOOFUnq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKWBC+BP";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F37F10F00B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 18:24:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64DBXYtq3324683
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=adOOFUnqD/cK+eQt
 lzJ7pMMU0fq91KwakaSBkYOagBIE6/8cH83nWlAgh3JSK+ZkPY4lAYueqom0Oa9f
 wc0pEl0e0UaS0c+Kynn1xjQhLjmV7cdGToDW1gWuSiqaiuWP4AmvLFddcO31vAPI
 WxptBTOrewx+2AHw1RuIc5ZHyq9RjarZWhCQo7wYpRN/X2Jy3TUYWOAnur1+AhRP
 8/4VE+NdttnJicMKGweDNaMHGF0o0bkdvpC0g0eExp34w0X2Tt7qclAjhSXjw2ih
 g1GEQyi5cDWpRFm3VROExFq1gsIisJCw1lhQn4ZCAxW+/hJapsL2ANbARxN8JZyS
 XyYgDA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdavct-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 18:24:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-95cfe3d4c16so10952934241.3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778696642; x=1779301442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
 b=EKWBC+BPZPvYQQB3xrttjG2sw1mJ+w1QhQsbxiOZaRV3Cpbo0lasTPWfzQZ4pQQTUr
 jmtYwXebrWkslc/xU6fV4h9F3+MsPbxPLZRc26CEwc8upLr6PZqUarKm1m4FXGHdn489
 Dy1VfITPBPv4sMG8/fkySq2xTGQPmduwrFujHb3C7BdKgTMsKvCT6mVL1GPsmifSGNhE
 enMSAk4APtXh68OA1omA1wWFmgGOxsQOaPHBBJuoGjo4ZzkDug4Qfd24/3RT/70YUfpA
 B2IWkFlOiYKEkE5rpdivxPon8II294avkLFILaM82KoJMd09RoVLp0eKDgSL9w4SXrJ1
 rVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778696642; x=1779301442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
 b=GO+EPWnWnc5pbIbBXVJ5WAtQvLLytrtXcxY6ckUlMBZfs6P4/80SVVaHSxgOAtWMeu
 O11PsX0etJqZeG4d6OS9iEmsEO38L7lvbIOaNn24EM/iAZlOY5QSDkeDpr2s8rtYaYgL
 0K7EMf8mO/43fASW9I1a/7pQuc/YEc1vRAqguMX1wN0cjGGGXWcIdL1emuA3OBENwBuJ
 lcXKz6VHkrZ7KBkal+fAKro96jaWfHlLCTyf2M+4BGvMi5QWYyyfj6HW12oS7N5AFmZA
 Lr0qEzSU9XsuKqLk1m653hHmc5ITMpVnWJrnf/OHpZMyl66k5QPfNVgXhpqNEpsHgkwA
 4FGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qqfh/c2rNSiSOAEPOhTJH1bRe2SPzHUbxIelNFmXr5nEnH8RzO2Y5zUVnDFE7Tb4QylSAGhi1jw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpu9ujyxJYly5bI1M9vhN+o6xfhnfZsXHRApYLzuB9VZa+9L5E
 cCL/tjg/77/7/jg2j/EWXUV2jcOfU46O+3J89rLrq+gOZIVhOu84FGo2lOThDkogMbbu71o4/Bu
 cYWZz6tfSbVEtx0oqUrALQJxQLEaZxr0x39PfTlW79hQREu6qwtsW3CDW9wWkkywjJl+CYg==
X-Gm-Gg: Acq92OG3GzH0zT0FX2rdotDaonSdkIh7/FGMi9TLyaQyGivfa6D2NktHw/y2CUH7OBl
 SCNnuPJ60VvB53eMtbJ2gQ7ZuGw3NOnSlyn6DTfbpnfikzbuXBui7dNKY4pEHlcYJsFwCrOykxO
 QFQ5uZJQjPZuyHnrnBL6xypsQSDtYHdKmAz8l3IjsKNfgFkCiiH03c+Po0nV14vcLdcTCqNMHjK
 lOCq5NsmB8AdMQKpSZ5P3wmIhjbU4W8nGaOZ8oamFfTnBvdSVRtwjJw16OSvupk+bfyVlE59UnR
 PbuHwL0jfOuulVdZt3o9fuVOAB0POwnBLl5Dyk8lZU9epclGcMwfs+Y0SkRaQyP/oa+Whl63bxY
 hpptHok6aU+E7G/tkRlYUaq6nBn2xpqIIDmcpra1EE3/v0wEE3hBSePRdea9w+Ikn41a8CRRQjc
 LFJhg7iutcqAwUwwXTfotT397AUcuLqCoMVug=
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id
 ada2fe7eead31-637754eace2mr2861768137.17.1778696642497; 
 Wed, 13 May 2026 11:24:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id
 ada2fe7eead31-637754eace2mr2861750137.17.1778696642033; 
 Wed, 13 May 2026 11:24:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 11:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:25 +0300
Subject: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0drlwCbTuEWcWCuHk7pQDuuarVA3oztNqH
 T7Bd2hVw3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1RL7B/4jgrhGIEZynL+WT5KesqjMHxOK4WlzF0fcjJVPHChMLdUytHaxmufdMqTgSy0mcUbDBn9
 6q+vvyQ6qYt0ElA3eZFhzZswAyCgcR8e4VTK8o8hpdhNHHqN0OnWTYPFN2SHs8+2VNdnQpl3rl6
 nMO0qA5XZZ0N0MW59OPPIDbL7bNNmFqUKmIe2WCRfvquF0In8ReMbRiQJj7LkMVsU4X/WUHvw1c
 D8V8E3vb27NV4op4UtcX7LQjtY/tpC3kuvEBz1k0eDC+LlEa/A9pzrNHGsDflhVd9anRh7OF2dP
 6y+RL8SzW1ovqNGn+6AgKDUbs46tJjRUUkfsmEfNEOEnsmEN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: hUUSCo9I7d7BOd9YpAbGtMj7Pna8vq4a
X-Proofpoint-ORIG-GUID: hUUSCo9I7d7BOd9YpAbGtMj7Pna8vq4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX7DLRSmPya4o6
 jA0YJznw9206fVEsX0Rl9iQzGiyMFJhcTQcawFxTC2cryW54I0+bQFX9hB/APBOFsll5ayHyAiA
 LWmJ5ujSisrpBfGffdhuL9Ck8G7yxvdEUVX9QO1LWxBuyyCbXUirp5DH2wugqAurDXEK6v1281q
 +KNelrZiOXiRNrgwCFpncNej2LqOCvybuPakz1s7sJMu/fUgRoMAGN5rvPNvnQbfFKiRdWBUZaY
 9cLsKnZduU686gfgQ9HWL7vvI1wctVmytCVkYk2msqW7TkcE7A9G4+NH0hrPpvEvMqNBQHKiC4E
 vejbare5xXvu6+AfUng2LKkmeVsHY0XO/BM7NSSEGkME52uLOP2SCMI0Koj4+UsAslTbwl9p3Sx
 IzAiNH36oeuz1SXpbojvu2JkivTSV/vHe/i+Jb8uhT88cgjEQUd+rutqbnGYor7s7ZUA1DB0FoX
 Bvwh/oHH09QodY+EdgQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04c1c3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
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

