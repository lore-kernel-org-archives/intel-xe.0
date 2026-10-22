Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DA606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3UfktEy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C2112641;
	Thu, 22 Oct 2026 13:28:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE0311263A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA0C9W2396880
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=S8CFFZcnxeDjyDK1
 UwXDhjtwoydfibEOA/Mn/eW1A4RO4Pr+mu0hyxuCaGmWz4FprGpi537xk7D+7lOD
 Xi5/O/Kbs2KBWw7L22+eZ6uQ3mATsNLnea0xOvHYKKwAmLWFF67iNbWUtYK/6aAE
 unOPSH0GDvKZENAdw8T++m4rQbtFquVxKc+ig/v0qVsL1dMB4RsPjizf1KrrMnD8
 kuHxe+xZH3cmkyihrBHH1MgM5x8xILMTY5vfQWoSTQ7BoFHImmIQ9SNvuCu5nYZP
 FM9L0CjPSjYfCoMOpx8j/e3ZTTP34KuZrgrIJxeBojPyGeCoGerWfIPTKMJK1GkX
 vkdzXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bur4b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93e92aad34aso399971385a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675711; x=1793280511;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
 b=D3UfktEyP0vZ9KXTH3ODgpPg8QMp1OVO/ENjAEyj+nUTvdEEvYU7sU6geFv0Ic7gnt
 Ng1X0OhtRn3+WC4466MP9n5vDIwVixJk8E7+R4S51HbIOrXW0ltEo5El07l/zH2g43CL
 71ptlIygkyngnFlW3i3cqNiLW+3ZDO1X2ZSQrMMLJuiHbpnG4rTFcEyvSdsM4/QLUD75
 ev690XqDMVh+GUL+yPy+v8IeBfyrXHB3fmN8ZzqbY3bYghhpfM507WoDn137zTtLa90b
 FcyRd5wgsuIFOWMEZSN4aZU6PWguSv+zq1BuwxedbNC3qwzqCGsk2YJQbox6SntyAJQt
 4M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675711; x=1793280511;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
 b=gpvz0ADJDmBY4ezILCe7JPnYFE0Q3n9AWC1a9GQBg3OUNQMc2iUSqcWtqwr/rdTFkN
 OLrSwLjCLucOESmfQavpSAuTzpifU3kWur0vCIt4nvPK6jAiV8G7XLaZHHubWUyJ06Dc
 00CaknLedwPHV60LUtTcAGlV4rTW5Q9FsAnAMCJXMSDwa+AwQAsHu3KxLP8tz4uG6w4D
 l6WYfLLjaUSCEoND9ZfOCmVjz4+G+zMFZ5HZJ6lPQzs4FVy64PG12Somx6SjL25DA0/D
 0fjTt1OgnRfkgeQoDY9BeLKdRKRQwEuqTys/2c02gu3s5DRdbFB09NBgXqedB0rdZ/kz
 IlBw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoYLZZ1KUbu5yZT7NIj5VneT8u2cSvLE0PAIYSgHIjB6PVHEZdmqG3urdoLhgbRxDYp0SFYHTZaQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLGONPvvqQ/5KGR0KQTVXdrYWgJ2HmuWTX0HOy1ngGQLZZBEJsw
 2xTnhG1jNKCdbqGEby/+bb6A0RMZX+97e9xx6QeVi3u42KoFQNQP0VRR1BqO5uh5JBcmfIjrAzh
 7Y5DqxGp1dZCQep662CAHjMtud6MftT/rfRNuBYpQXsaGjhJbJIZ4Mq1jLaU3hAi+UfxduA==
X-Gm-Gg: AYBFou0E4kW278NStqBQU8n5+wWMye4G4mX3oGUoZpft/zXD524NrWzfLRCal2dlx84
 PBG74SjhmcRNO1ovmpQdPQusMtwdF1jMUEyMkNTHiM/pM7MWFrxyx8F7V8BHKeyANARPtOYV2v6
 q2qACTEM7tJw8AnUuUKxfHm6SaAqk94bfUbzPed/t5mdxx20RFiiYA84FTfSneGaZyifnwOVBzP
 k9HrwdRO2lfSTNf5UaN8a3S5iMwf6Rip/7OdujT5rTBaF/2O0om1FpLJU8aCQoAMESnuWqLgz8v
 Flfp/ro3fuTHhSxz27xh076g+gkQfJuMgzyNJ0aF/o2zMDGN1iLqp0AwTM91mUHyjb69MvXy06h
 5O2AW+4xgqOEOV7IYeIYpZm62n8qTFxQumTlDAgeqFiIVOq2NOw6AqIuf8rB6U7a/MZfcxMi4uc
 ORWndOJRKjLCcg
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f57f1d8f7mr941933885a.45.1792675710976; 
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f57f1d8f7mr941924685a.45.1792675710367; 
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:02 +0300
Subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XbnsZm7/G9+6/HZ+XJTOjbptEIAHWIuqiD02f+/AGHg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/vTwOk7t+tp5eoZf2Nf+emM0WXT7iVln2H3mOSzik
 TlX3Z/VyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJnGXkYFjHcl3xl82uvyJ3
 Wp9cXbxrJf/3zrq8wjf81TlV3SGbf9ad392vEaD009si5p+8ZUtBbJPTS4WU/622FvemV++LEjx
 sk3bS7/IxR89aqcQM9cmli4ourm/5eJx5v38RT4Sia+1mHV6tGYuXPt8k8GsK+1QTP+lMkSITM+
 /1Roekl+ucltlmGrnP+aN0iaXg+cdu78w3NHq9669bFx0QcnrZ+40Lt77a97OiX+qhvqUmd58hV
 25yjPmeUnaH5Wt/sX3xmq6k9XlukvCCNSpJ29pONM/SSZdd6LA+zKZM/L7zhwXnix2P5GxKO2zF
 nBgeGdORydXzLuLOpYq1z5yZLjRdlJe4airS/IH/0o8iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JRi-F2df_4tnygd3GCZe6_X8Tt2Zj99n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX8ozAO65qpsjx
 ZoZA93RP939pj5Z0fC12LuKTa+tvlzvr/hWmCE1ijW4MnqoIUELsa/iAp0OB7DC1T3xZUox0ZZ4
 mVma+zVBChAEl96g7u89HFT1xsY3gpQ=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada0f7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JRi-F2df_4tnygd3GCZe6_X8Tt2Zj99n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXx3KUAY4CrJvz
 qvTRMKHRP0GdwhJFWKfKooVhyLUQ1ivdazYbiHEa+WQhBk+NhGs4MEJOdaDQQERqWxTWTFdHVWF
 Bo6+Wa7L3ph5nqSLvaN93CAvibAYS8LTs0i3Yv4HiMPnNFy1nNkPo4rNma1VYfe9n2ypoSWxrPU
 /GbAmX0QLSLWSghFYOTEcZ8RGDNjAL7GLZRXKeRhM7WIjxi0Mh0qC2CpDra9jZnxPFhVee0gsD/
 gOQTD5qUHmO2/Ahf5LTL/3VNuLt+cjkNwAxLx+isUKNdXv18cn4exSYVRGlwkKh/sXO7R84s3ST
 hzp8ZDn3vnftbt9+DQ4a1o+K+PRqd/2OdGrkk9InK8ff+kJbxd1UXIC8HLA9n6eSS4HbT8Jasgp
 gHW4TqmdKW5k/gsokB4UPgvghmW/WrnB9Bfz5SiI/Q6a0YgPy8l9HU4F+AyeAhRy8vnZmaRGwFW
 66A2wZ5syr2Tl6foOfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..6a8b3b8e1fe7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

