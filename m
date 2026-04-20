Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36545F588E3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 15:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FDE10E6DA;
	Mon, 20 Apr 2026 15:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtpjgyQZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHCOqXae";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40DB10E6D6
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63KCPU6T1532102
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=FtpjgyQZHS7PWmHX
 SuFii37KrFCQGP1LI4OU4yqebryV5Sdp6N0joKTBHIOOB8hPymm+uyqRdH+Tm97r
 +EBhBi1g1DCY6m8agqOGgBCv/Qa7DME6E4+WpcWLasxMExe//m6f1R6+R3lkGCg5
 voui14+vXjyZQwGiTCfOXeX92zt6jC9TdC6bhjcKwkWNSLDdBPCSbRPKO3grnW61
 R3IWg//h+uFyX9BrgTFnNiTrs/ANd6XGcbhtb61siLp8IgbkBKxNqs86qDk6RhUW
 XaPVVErtMPx5PZpqCXWqAoIpuco5vY6w7caepoLq9Ivz37pNr02hqoEy1yzdef97
 yvJd7g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus21k1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:31:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-4723af8974fso2470675b6e.3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776699112; x=1777303912;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
 b=XHCOqXaeC3rKvgeakkJKimYjez1xTtBwGj7P8xNfuplftCMtgsY8KPoN4K8T9j+FSK
 FBNMQ5tHLKG1EwMB+dzC1pGzilk+Ep2Z3jD3MYm5jlfmzIBzYTPRknMUz7ksUePRaI9z
 rukPtW0+HfHfQlI6pWhpE7fcYi59lOEX4sDxHKYdmH1PYvaV3+Y3r4JSFO3r/1VgCHCh
 N5uxCEqQihMS9vXDVLmFQIBsBErBne55J0z/aPt7Ir4SdwK+9EfyAnlhooaU0mopS40O
 0ZE7tj1FBTEdKQJnDsPhFRZicwvg1GWFCCjhjaOqnlt7UrpM9ym8KFEveNfajrFs3wxG
 SKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776699112; x=1777303912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
 b=pVIJLTDC0dtMXRapHsWedaLDjLN0TaVuRfKKsPzzqri/6SkMIeonP9dOK2+Wv3iJan
 ixU/ScNJltK++48sTLRFc2aX5OpD/ntk99oWS2IzC2zrxMiglGNcO5uUUnkw6W5bew2s
 0ieoMbDvlV27qiSPpgmLxLXDn3IelgkoTvJZjVBYNRjzbXhCuVTK2OM3uYEGpwoyeXbl
 FLWI4eULGf6Pp3N/2Z3frfPkKEnCSvwjmL7J4198J3p5x58URfZHpGMgs+GM/xdoy6P2
 ZtoZE4Ji0xeFtfErmSK+Ly8nLC3Chp2wQHVwSgeCx+Dwv8hYJxm0y9o/DmRRnTsMrjd4
 GEng==
X-Forwarded-Encrypted: i=1;
 AFNElJ8P8RNu6E1hoRzNeoQRNA85P14LkcnxoXW3joDPqtw36YBO6/2RFLUN2Lq7DKviaBUEsQOvvJwdTg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsjq9LxVGvi556K/YJEys2RwSmgVUr8CMsaCyTRaGHkVAdYSBc
 RkbsJuDoU2CL/XlnekaWgCdkK3iSssxFLyz6lNwzy26HtOwaiVOpQLwIF4oauUfFTS5B6pB6J3e
 NS+UJ27Pqq3XfPY39legPVLMMFDCF+5MeOwZMu5wwbra8MxhAgzcQASfHVBlP+2TI+Bw7hw==
X-Gm-Gg: AeBDieu8SyvHwtVVjrzbMhjG+eKXBC3jzH+mXC7cqd36awj7ad3ebq95bXcI+gvacLl
 d7WW27h6qcrdBv/eaZB/zY9ejX69aYqEsP/xEFm+3F4piELR8It160hyW3MOslCTJcZjL59GPba
 T7V9+UUPmO+06znVVPa+UlZOaM/dkSn93vQRcVvAE6MFUATA/pWcfOliZOOL4gZ878SV4zilEqv
 +Dx84uRGCyiZLfQuKsuJFxYgcKw/b4D0M/jQkuFV1dIv23iP+LUZeVRwo6XLGjwrSPloxH0cIQP
 ky0iT7QG79PH6aq7LD0T9aYgj4QTMYvCxSLRHX5oq2qtzCrf/XL7QSljSCbVBamh+MR7yf/V4/c
 eYBbp9gQDH7I6PQR37EiO9JSuPkPtkfV4rJ/3kKpICgzE1Gpb5yWoMGpDvgzP2PsKoM/1sW5hC8
 pvLx6osp6FVyiLLzb6imch0jqzMwdJEWFl+xY+jMh7AiDuWw==
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id
 5614622812f47-4799c818433mr7486808b6e.3.1776699112055; 
 Mon, 20 Apr 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id
 5614622812f47-4799c818433mr7486766b6e.3.1776699111336; 
 Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:43 +0300
Subject: [PATCH v2 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-5-402ffe27e9e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc08iYjB4Uag0ka8zVax5tTnA3IFY+usHE2
 EDoi9ciSAyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1Vt4B/wNiW+YWqmfm+8Rmhnz7THsToqY8cu5mLfFy7IsLit6vS2wLSP/yBCekylhcTV6irXUM8P
 42VEGhqz/Ymuv4uS+YoIB5ejPO9MLGk0vVkfMOIy2Hni+pR7i8owtJvna+wF3TP9/BgaM6gzw5r
 9VgXLqpTSqAWk6UDwvnI4WVZx69ueHd9x+giIKzmS2XWlnronU3X4nEw1nj6M8ixGQARP/0lGiH
 U2cXh7bRCqlzc3NP4rjYbyWpEnFGUWNk2KQ1MwH8MFIqVQjkH0ydOc585da12iuEC7ikpiCOx1D
 3or91Wxi6twREDMlpKWS8i9MNs8T8zzR635ByxjwU5RWoNn7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX4+jUUHtsyM4s
 m2NsQsc3bGVpiHwjqmFShOIWuUuIMLirqMn72Jo7sk2CSRIIK6wLs14aEIvmDlGFy+B0Q4gtbDg
 H9klN6g2AnHaBHggD7kkQaAUeA3MM6sKyrOjhyt+NigGVcKWsWRFkDBaSDtPvM62p4th3FIp4Em
 Ez/DaRD3KZCgKRpGMhFPoXV5sp5NaOlZaPz324GrlFDYH0ikrnEhpkONMsZdJ+zz7PcyOjH1xgz
 b1vV+wvounPH6VIpiFDHaYtvVtk23lf1plk+PhHt6QRsnDaQmyYE++YqzXtu0ptxyqKXkHUfqGV
 5UtdlFECfS5+/MPcaFfNYU2hEK351p4/VfQhO0JiX0TpX/wgVSDSsyHi3qA5ME4R9H9BrjjkEez
 cPSjBD8Zx/268GP8id167+Uumd9jyGEn+6Try6pc24HMmgHAZvHJlD2NN8exv4fwWVK4lol0SJk
 2dpZeRWVt0KVEDIXU4A==
X-Proofpoint-GUID: Ib9Go6JywBG6FUaxNpDz8OQkej1UgyGq
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e646e9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: Ib9Go6JywBG6FUaxNpDz8OQkej1UgyGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
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

