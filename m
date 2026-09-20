Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA6C982D8
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0208210E290;
	Sun, 20 Sep 2026 15:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc3H3Mhj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlviLA02";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069EF10E290
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBokx62423719
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=; b=Tc3H3MhjFhnblgJD
 SPNW+KTDOflRPaWcL2vLPAG7WqseeqmVAEBRj58+94rfWA1icLbM5/eDLWwI3vcX
 9swNh5fsoZC+3zlx5WDw7cIxzYqz8qoqpwAT6n0+1g1Ko3n0m+oYsJqEFnQTlUjY
 /Pd837l494hM/8LQecJxSwFZcVZWwz6Yg8YPdH6EWctRA+GQmpOM6TKm1iXSjokv
 lCvKpwfqTZfD3PtBhFWsNS6ANlRWxvrZZWwNB24DNR2SlEiVkKc9+HcbZs2XLznb
 ltoNsbnsIFVRysLBL9+qxrMR9s2vqkH6HbxOzxQYUA0x5QJof8KLgJ3x9crfOigq
 sXGFEQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm336sv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-79cdabf7d89so2451096137.2
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916568; x=1790521368;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
 b=DlviLA02Nf/VyVolNJi4gR53Gr0Z3SAVJcKUoqV1NxbjSrDgq5QPms95DvgNOB7Pg+
 WxakNOq1Eu1rmpko+rigaMLfiyBU9G1nV715JllYAmvM+k+aw/ZGg1RHOxAdNnNjuoGJ
 d95b8PeD0mVAf8YL08cfS3+QbB73reNHl6CsQdrHBvkn4toJ1wQFCq0R9fWS0Ym+wFUs
 wKiIVQhoroel6RyZZqmvOX8FTFrBk+f3VkZvrxzPtedsl2cbQtiEwDSFRHyuE52MdUmu
 HZN0Nu//Ud2/I4ltfJ8Lw7skCT/fU6di7JWsc9nBlGxAChKHqeMQI2ykdRNMupRfzY+6
 mdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916568; x=1790521368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
 b=v9KEwO9/o+iwkeMIL+jXRoD421qKQGwcrexAbW/gWhHOug8D/3tdgHgKFAdlhgHKcV
 tYXRrKA8CKl099iaDylIEzOFYATeh298it0an5oEyxPCzUaBhLowCjtMLwbF64tDniX6
 mLSdNOZwlJzh/59FvxMB39cJ21N6aAt6pUTKDcPZ43RmJpu/s7BDhsETR6wVk6kjGNAG
 1RB/VRs3ozDLmV+ryEQc0RbflAzkp67ahzz3cj5SUPvOEK0piCXmKbx43F8G2y0AgkqY
 bxzPpAGK9BuOGoClN8tfXk+W9dVIBycJqz7Moubkak4lq+1msxJ5mHBEusZ8BGUY6r/S
 GHnw==
X-Forwarded-Encrypted: i=1;
 AKwUvByivK5lh6DR4FVXtQzRmVwSCs2l+TJ355aQ3xMTk6QYvB5tUxHStvAN4VoeHNo/Jep/EBX6vcaQEw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++m93mMG/Q9aqMEHmjEq+dwFbXBRUL49HVU4mnaaDre81FlEdnXj
 YreofDGdhmqU/DgG8fnDP9HR6JRd/1eLD3eSo3inrmyhR422WD6/5z06n06a+n4OVDQ+LFJ2MLr
 VHhEp2U40b3Tjn9MbUu+DzvWgk5BDeWKREXOxxL6kJA0/tZkpTjI9ZXbskSGXW5IGg2HJCcNxCL
 XFOg==
X-Gm-Gg: AYBFou25g5AzoRLNbrZJSsgcR3KxDNTs2adB2odFkeC+subrltuBfaIzWb7HVEB9m7/
 rJ13ltz5mqjN8a7r2HYAzRtGzU1B12nEwvjN8JejJqM6ILaKLO12UwqivHGIuT/1HQviXpNbAM1
 xxhP1dMzT1mgmbbowPg4fL3a6KSJJhKMpiBHUjXFnpToD6p/BQ1sQa9Phq7XSaF+/YvoFJBW/hF
 nHcjekiXf/lFMj21YGYXVS8rBxVAk3Qr8+A5rzg6Osp/OmpIst+zwreyz1X789bDBC273mWT61l
 AIkDKPtlPiUi0R81HNLtgbu153m2E39zV2wDGh/tRL5HrKQlPYRuifbiR9wfrP329OPJRQELqn6
 5sGoR5t0VURrLAcrKwKtH7pCasnXtKb4FNp9I6rUUfEjiTIjmTewp83pVhKXANeV0nRay05u7mi
 VVh9kqOSEJgKr/
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id
 ada2fe7eead31-7a55daa4aefmr3063818137.28.1789916522244; 
 Sun, 20 Sep 2026 08:02:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id
 ada2fe7eead31-7a55daa4aefmr3061758137.28.1789916509473; 
 Sun, 20 Sep 2026 08:01:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:32 +0300
Subject: [PATCH v5 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-7-ff1de0090c72@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y5prep+uK+TtAox//5HU+Am3tOMfG+jy1KYlpaBl7WM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b6rx73FSI8L3M2/xHQ/9vYsClqvtqFDunnUQJ/PTexr
 Vv7aI1qJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmElTKwbD89sa9B+8KP2p6
 9qOlQ9erc85v7vgP/5qXta3VXDshTN3/Up7LDJtlL8+XKNV/nFwR31K7W5/D58kd6e+bZ24U8Jb
 /G8gmHewiJqL8jL2WrcxMS/Ti58O9Fx9eOvZPplTDuPleqNjUa5/TZJQEZBavPv7u8rZFan835h
 /JcWlYGCxxZsPZZd7B0s+tc1h1k7K3GWgw2Jy0vdfuc1v1WU2GiVlsj8TeLyc+1zUcza34H/tRP
 WV1X0m30rY5/Km1j/JT8r9yXFfKeHJNsP/illuvGRza3lV79FUZpr5cIl+oXZAv5rmqW7SdcWPD
 RKdOZ8X4PTNsYi4yZ3DdC+JJfxHRKpHnwxL5cnLz+sm7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UvTsK-eYcNgP7HgHZ2ECN0L9ZI6E8Fyp
X-Proofpoint-GUID: UvTsK-eYcNgP7HgHZ2ECN0L9ZI6E8Fyp
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aaff599 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX9iOmBdPyoRBp
 FYZ6Djizhm8PkIpfP96elS4H+VdMtlIlbnCHet1X2NOEbPYL1k8ZmdUTkxkUaqC4bzIbLyZ5GHD
 K1YpN4K/21S45j3ELwOMLQQoxNGfu5OtaTTI5NxKWYr1MpGxu2qPNgTTNoiGlxm8ahYZYzvvLOs
 QaVcoCMVHMTDDGHy97LpcAMAq2CcX9QbuYTqFZ72yhxBTV+0IAcBXHFSeTmXDWoDVqdZ19BGABX
 lTePUyXgEUboKYnT2o839BV5I0+edQVckf/vndIS/NfCkahXncN2Q4Wv/d8M3VGUtwjZVUu6Q/5
 D5KcYhOl8JPYusV62KNykZBXOtofZRCAgIqnu377u4JLoeb54aOXK+F4fBHvxGbsBM2VRwnqQ5V
 FCOxcwg7DxZydwlJqsqZh6oG7P1c542/dfjB2xMbn1UJll3BaYsEKijf45B2NKrYTvopei9tRyY
 7DyHAliDxBQoAzOvuEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXxPsP1y6JWQk4
 fiyTyPDKtKDAynLVii0SMkbDkfxwk7+h0rSNzDQ2i/PoCQ5xXYBZ2lm7WAPQNXXeT/vJbImK1cM
 TjT+cFyVMlRqr+B6CHMc3aQLIzojHZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
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

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..e903d4910e9c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
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

