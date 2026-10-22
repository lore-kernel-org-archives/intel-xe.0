Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F6606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPjvCaIy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51AF11265B;
	Thu, 22 Oct 2026 13:29:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483D4112650
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA069p3427069
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
 PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
 nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
 twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
 oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
 xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
 nKHhCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq2j8u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f62934ef6so197578885a.3
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=RPjvCaIyU0xZSn956qGlSYHOpewADTF4EQ7vXH2lYauw+QPvwFO9evPXl0dnngUIiq
 dnoMD3rL8zS4fxCpnlCZ3Qzo2tHmMTe9oVZx22GcwSnf20RS09ByofenI/OR1DZjlArr
 eD3vtTg0o32vPWbkokAqRzKuLRv9OjESFXzSA2FcFDkE1I1orcFCYE5iKOFIF/k7p95R
 Q6TUNPjHMlKj3S76K8JueoVnMnufR4PJAzHCuVAZYSYVtqx6yLH4EvUpMz8x8yaodydk
 zCOIcgdbMBJkv8BihDvqfjGwNafkRHkjMjDaMXXLPfh6w3g21G7fMFww0Pj9iorkHV9p
 enmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675713; x=1793280513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=EefFNqfOfynbZLV0v6AW9JHhPLSh3aJnitGzuGjHEJmqOTyYwerQIMLUtTLvzs2U4G
 7v2bNsfX7FFUk3qYEqQ/ZuK+wZzHtiBVTuJzBoJhR3SbP8zHfbt1DyDkmILGXkIwJEiZ
 XmfHiZZXNcSkexx2AB52FibOmWvN8zJrEjD/OSPQqTFKB7WhWXuDSFQIUCI9QFDNZgb2
 N5fRKcRgWY7mju4iswfWmimbIkbH0SBdqg01aWkB9J+ajkBBUfF1Dti2vr9NLpCEfYQm
 AA7wNOIHPgWsL3/p3ai9yK7c9o1ml4cPkQi0OkEMbzC4qMNzmFqx0NKCueE5/CEA+2zO
 xjZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwjYMBb2d4q69doFRcBxRypxWGfglsDQ7LKoCTCNjYVGz6jqDH0sycvME6xCG92EHkZiM0b+yxGEA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKG/cyg/Uj5s4lCbm8AVWPTldvDjDPGw+PBCo9GIjsY6xZGq2j4
 qSBHhiQYLaMkmGL9od90Vi6QLBUHG1krGGNBL2nnhj0hue4VvHUMNBZCZzX1mhn8MX3E3FzCXK8
 eLuTpoqm8u0aIjUVPR3110wz+Ymfl8LV5meBbLOVimpHgrFhXvxGjXLeMvpjnPZ8s4FPQeg==
X-Gm-Gg: AYBFou1lX4Bq3pPqCKMDaf0e1GYyYaOpLKxGBnLNlhaJzHdTSg9udLYF40Foz1mT7pZ
 1JSHd4hsaY+GAt0gR0tD8bay0VECOfbVD6xi3/tcf7t4u+woO86CBVHybJmgA7bfwXDRMRS4cgs
 LvUC/uI/eBxaijHkTjqRnapNwCXy6NtW/XM2euz3qp9olMCxl8tJsOGHfW5ArI2Fy4b6SMxIbGU
 NkyzIciJcwCEdgfgAi2FVORj+30tzdqv1OHg8s9pDU6AsZnQi1HILwprxBT3GoBJq0SbBPHM3Ds
 NRf8sZj09BTq017xsPHhfrbSa58dh8nG85V29xtIy+5QfUF9TO99TDh+jM0YoXgSpYc2F2N7RWN
 4seUyCGiCF2Hzb72ZFrWqDv7q/Ro91CmLPI2trAQIXrWDIgKEazzjsYvv7jRNsuNLDIsRAqE1nm
 3KxZ975q6dQRXR
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93f57f0551dmr905866185a.25.1792675712638; 
 Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93f57f0551dmr905861085a.25.1792675712171; 
 Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -eESPbXDCcYgiC5rLLkiB6EqnsqPJ4uP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX9BeKp0cuQO12
 ueUG98nHQgZZlqQgJBhyq6uXyDzNzgxTUe9bBx9uzHc1R6/IH7tRPMF0x3NoUzhLDs+Jt9Gd47F
 CIrqwqr90z5f0mePkPJfwG3yoEFKfAj1hHBvAFKtg+hNsJ3b9DSnwEoe8/AEI2wYEuo5+6LRUFZ
 +HueD8mg9p+zQc+dmmn7JN9jiz1WJuzVethOPE2O4nS2AybbwEPBghhBaB6CCDFSsnSn2CEML9b
 TpojDxxu57T5GU/aAGQIe3B3fGS7cEq90JjKMaXSFTsonPlAWltZntdeWKT7DSHEUnGAHV2ny7J
 x2i3V6IwpA8I9RynkjrxWo2U4Zm1CvBmdW0efGqL+NDnae2ifJDNjiZ9YfogJM2x6vd7rAtzGLQ
 VRIBXwyuKKm3+pWJdIq6wNomFo4EZQ==
X-Proofpoint-ORIG-GUID: -eESPbXDCcYgiC5rLLkiB6EqnsqPJ4uP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3ClBSEpEom5o
 atQ2/yp07lboOSfkeTbHvWMdaVm7J9vH2wwCjRtH/RmNT+MQUGVbEz5xcVN1wRVHZknSSWE+hzr
 0DNzJssOGbXMxhrAlPFdr4O3D/oyJ5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
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
index 13c434f8d03a..c463b23c99d3 100644
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

