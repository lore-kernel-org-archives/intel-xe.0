Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A1F433D4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF37F10E79B;
	Wed, 15 Apr 2026 23:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy+HDyD8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UltBrhCa";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6625C10E78F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63FF4Sd0862148
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=dy+HDyD8rosMW30L
 FUNS2GM/lG+f/jTnHznm8IJHSBbRKc8RhizcSnMXCOajnDCwPJ/IKZK3lnQYIZiR
 5VKDEhgK4DHJVakIozsfYZg7KlcCwAMoGQOmkhSGBjTFSmCtWANSVh5S2uR937Qs
 H0E459ajMWPkg3SVX2V0hyqHbN+cuo+/M2f7gOfIlX9gb4gOjGTiTivjV/7Yp08h
 F8AQkM8ppWipV88ZV6NJ/dxUwcEez1dQlF9I1+cOieWmHaPGJZj2fhGu6Ty/ESU1
 0i2Ir6mBYMoWn4ekLksWwE/zbLXb7CbdULcLrzuFhEX1qItdysCZyXaSC8yRLZ6b
 MXl3cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0e9f54-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:22:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb706313beso323245485a.3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776295373; x=1776900173;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
 b=UltBrhCaVzChWu80ErzS0sc5c9zyTY/8jy6RYo5MLz1mdj3NN/Jna3NYyqcmWJX5+R
 jqLqdqrYbEDCVcf8YL+abfi0/MgV9oGQB15Zw7oTMVDPoAvUWJDGrHLB/dQArTmMdJ4y
 Mh4lABsqaKz8Abl8kxog3SD0JwfN1pKoWGU9iRYyWMtYiCT1iOoTx2fU6ZHss7K5ySNY
 aiIXXol+hHm/7xz37jJh0P2uvbarwHx9sTn8GslGsfZN/NCj+v+gqOvJ/fVNEe4WsRWQ
 PQg+qba9if6pSRHWxW98IyBjR9RTeR8SB31TMqBXq47J3vZMpxcQ++2PwkGWNShWXgjL
 vO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776295373; x=1776900173;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
 b=gNMRtVTekAX8ZqOGGI14bzqZv8GvPgbs1D0B71QMHatxusvQBEYIAq1FxSa+Ns+D+n
 YK797DLwQZ3f0X6MOYy7ejI5M4HZkgaNAZzrgA4D41hPPU9G1oAKn8JY1TxgTPzdUmHT
 6Z3KJ895hQ2Yvi/vZXU/zyYID1OuswynWafhn64rgDe/OQ9pYjiwRNb63kiWC9sRltxB
 OMrOALA4Poz3B+SZ+r/IB6caOGKCLYJnFg5xEMGsuFCgqKEP80Ira8eaQzRpJ257BZpX
 2CQH5XLMRpUNHInWgZGbaXrqGvF0FtR2EGyuc619nLK4WEcFtguriOs1+ipF3quuwPkK
 xqJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9w+U/EuTBGEfmnHmmvebc0IvmK8qS8+f80fUlXU7xKZB5ELRCF0/2jNi3CCevX310wwk5FDuJr9Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwvGPsSViyukEmwVvPBegtTZVZ9cD0htZR6LYbFieIp6906VJO
 APoIGzWRjRJJCDu/FWaIC7scD24BOAQyw+pXZvNZKh1hF+WPyCaK12EKCPvaQFney30SpvO0Jpu
 iPyBudkvx22W4mA23Xx5WguDeVbGcHnrWHuUuQHSTAVUuezAUhDuEyxLMDqdbDCLg0ypoqg==
X-Gm-Gg: AeBDiesCnAP9sCb1znuBqmdsf9YwpEKX5iqoCks5aAUau39GJELzlZRQtvpUgN7LFMT
 l4mPoCNZfoyfmliYBcTANmtpsoqYToL9IrH7Z5BOx7AnnkGcoJEJFi7XK79Itc2b9KJegTJg98F
 Dny/bziokvU7L1K71jVOGGgH/XtK9zXIGYdSVhkvvfA6FcVxr2ecDqvEa5A8zuzItaRFhNvnjfZ
 MLfevjkF+tpksOTlE/Lp8kk1OM/LHr21OswFyqU9M0LvPMrSMNFAqIYa3l3GvKVbqCE3dMNPvoR
 WftVPxP/P2my5oN52ZG3YHHENds4lbuRUXYR4nhzzXqFm/32MjErJ8AfNMReNf4CCrv9vKndwIZ
 g/YN3Gtl8cTkF7GrSRA+JdTAxpJ19Bf2qe5y4RYDQakvSgWEamYbnlINxcD5/fKFt8mOfMBmvA4
 mps6C9n/ir/6KMwPOwLN+GuQIb7/A9dlxvFdW1lP62w+M9yg==
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id
 d75a77b69052e-50dd5ad88b2mr362529561cf.20.1776295372962; 
 Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id
 d75a77b69052e-50dd5ad88b2mr362528991cf.20.1776295372491; 
 Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:36 +0300
Subject: [PATCH 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-5-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25RIprvup1/Ku4C5KowC01NBQ8O5kpPwx4h
 eobWONDt92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QO1B/0SHnYn7panRBTo1IS+8Cr8do8q3/z8CG8T6fTAgUXlq7xy/zOnHoCF42M0ieXTyV7YQ/z
 cQnWdqx+Erjt/bwe0xRuejxplCDVdRnwoqJWlkTQa3RRpVC3Pv1J3HETUgH9dQxAe2InJ5RdKbp
 I2lxInSBYOdMD30sbJs2NfKL+tcRKO3hy5lap1+JKBCjWzIKj4juaEgZcxleBs1mdIhAWgzZGUD
 nLFhYljjrwhvhv6dvi+IXD9E5I1faQmchJFUq7tjgSod3CPzjUL4byQJIpqrpRZRYM4mlUzY81g
 41iEJM/GZIAKEMqXIyPiU2UPMeuXPR6g4go3iwvPkEoI4Fmr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ML8fH7wB5gQpRIKnaYzlIOjb6Nxqbby7
X-Proofpoint-ORIG-GUID: ML8fH7wB5gQpRIKnaYzlIOjb6Nxqbby7
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e01dcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5qjnEABnMYrc5H2CFY0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfX+UhUv4MW7qwb
 mpwgI8nfJ+ocEzT9M7AeisfT5OuTdanmlqFd9jA5T0Rz9SptyP6+f/molePyTxu3+sx7RJeoaj/
 fag+KMWI/++uQTYGxTuBXmannrJrv+ljBbzMGvR98zx1PuKX+gNirERs7CDpBhsomIM/WLPjLyA
 mGPUz1NybualxavZVhssgn9QsuOmzd2Q7y1VftRIOFPcZ1ovy0PyhsT+XJzhLetWPHb8xZTuGxs
 vlnT/P8FY9dTOfwaVqpBu08U4xpePxofrj6Io0GojdwPGlwJgu53MRrQQDxd1Q4HqMXS2qpQte5
 UCb9ehVPcfVZud0O5AYDfEauqDqlppKS+zTBqyRMWj79ZMK20sNc3qHD4BUbaw+QV5wClgZ4jAx
 p8MitefNuSTIUGbqyU4r0up8o7/j8hjS6KH7kcYR+zeJuFPIMpy977G1bvlE674/hV6fXTn+wa7
 GPsZ6WjgbwSLqA/FaYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150219
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
 drivers/soc/qcom/pmic_glink_altmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..618dce748316 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_with_irq(&alt_port->bridge->dev,
+						   conn_status,
+						   alt_port->hpd_irq);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

