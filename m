Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1257C982EB
	for <intel-xe@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E0C10E27C;
	Sun, 20 Sep 2026 15:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXC/ueKz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdV0Bj8q";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40BE10E57C
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBnntR974571
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
 rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
 RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
 yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
 EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
 rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
 R5evsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk33rq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93903622880so673817985a.0
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
 b=bdV0Bj8qIkANNVPc7oOJVA83vq72JmRavPC7jGCVN82dRI7r+t/UUTHYW52O3r75SG
 C80pfTJJHY1r2xK217a6ECokNUCo8eXGp3rlhYYMb1yoJVoSkOh3MWnBnM3WxaAGfUeX
 R+l2zrYpVsfq4EXQ/EcHG8D30+PbaAGcFyTeB2QT/bj+ImqQgglQZDeRLezrqOBZZ7Tm
 /Kv5/ZBINeQbYK8lYc6M0eDW7ehBUk3pbXm/WbiQuAW5NMa/yt7dl178FK2A4xYXabm2
 XEEX0AFSmh7mnxohgyNaT++9SxaKJYZKukwHsLkESDREVDNmEhmkQDid11A7cS2mtH6s
 3NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916507; x=1790521307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
 b=hf9wp/NGbV6voM8pONyRkjk7IHCdFudOaDLCZF+Yo8lrBQtnarVF8tZ93Z0xGDB/Tf
 OXWXUfFgBcz9eruRfxHQJ4PXPHKMVzYcwK1Q3W0hFvDpmS3VY69aWU6A194qiZtE3Quv
 fCg2hbk5lnZG7BEjGn+7u2ine7hvMO9NDPGzG/HJn7Hc6F1rEK7lUSp7Ua27NTYYSNgP
 HL3W/SQplrnoISEC3B04G8ICp/NdkNzucXzaGwoqyBAnKOQ7ojfSYYepjGgMC3v50jMm
 BHACNxqaA0RO5rM4PDZ+LMsReqJs4QPo9/KzYVuja31B5t919Dg/QpTUw2FoimcwkEj6
 EdJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkX+SnWEWqlXnJvkAIuipSJU+a98iwF+rsjcsEhK65QyYZxNx9KlLZC0BBE6B+fir32jU9E4dOsg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nuE6we35ZJbEoLwAb/rfB/r64Saquc/CR6PoeOeuXW3BY3SYxs
 F438yB07erZR08aDjUTF/PijV74YQsyO8i6KUkSXpSh0vtxkJ13GeBbWA1u5RTf0bcQgO0dnhMy
 CBjGyiHl4SpMRqC6QNzR1GtY6atrgTMYlbycp7PIfxUwqs51LKXInQ+qmQpQj/urNJAF1rg==
X-Gm-Gg: AYBFou1P1uHfgTpcQSAGlxsc8IVntAWejS4s+iEZwdBMaIs2CguVtuR8wxo45VSy428
 /48TLBGtSjipNqr6yw8KJeHrsreecG/0aRhrPOGvDjHtlInYNvS6RP7RIVGk9jfaeWaufBmdq5t
 aRe13qo21PIHRbWPlW8zqTGYS/VKf6E9j7B2U0ICXAuZi4uCS9PLhpt0EWUoM0qZhU2FCCVqANT
 EkS9jKz2XFtTBIErviVhPPJJe2qN1x5C9qzL8ILS5fH1+LgEgbYISQDq6/EK2i3y3mSkVieM714
 dOPJ/Sk/J14Jn+um5PNb6bhaO4K7BO59ZytrNZ/YwAunQJVL+NEI4Cms7C5mGAJaD24Pg1C4xO1
 iE8vg2v7A3iWi0l6zxuT8QGXhCaXwOoNKQN05GdpJQNPapDqtT1ogHN7IY77Sbn6I6z9SPUFc9g
 Z4PDL4FAjWh7jG
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id
 d75a77b69052e-532b6f9c339mr59088001cf.0.1789916507108; 
 Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id
 d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618; 
 Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaff55c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXwmnZKHSHSoq0
 zrJ3IJDnba+K86SvnkZ3ULKOkMDZCGQuou0zAh89bYuJEUFH3HzH6IPgnjHPwbGBj+/rjKOJtpy
 PI05L5gfbgG95eyRUeuWzWaN2HBlRXRYq3eAjxK9Gp3GI+EFVbYi/VnwL1NzJbgP1N6HDsr7j2/
 QngCm0FnQlsVYXPMTqoA2hNzWkmGjwF/hoEc2lYyU/wqSDmpR+p1/rrZgpRIsET1hsrB0rZZ9i2
 GUehPG2hcg7uNXabT0cNsz2JuYc/mQva04aIIEpgO0Cq+huM6oqfgF00CnQrEt93b4FhZhzqxbo
 fKuvUzCo8dH5dwAFEHGkfETDNkmIpPVRIOTF4euVP622uoSyUNKjFqArD7xTMXT3dujzYuFZ48K
 0lGymfipVNVGm9eRLBIIqU634YEB1k9vKLwcM62uT/cTYqMczg46F2qQ9hU9p/GRU4XiVL+acTu
 2+PQJ1Ve4jxtISAgnKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXztAF4V7N28TG
 DiT2JUPDaTUg3Ma1pThbqrxzzlgYjEHw6pDy890hCZ7bss3CHt1jejfU33Up3qUDyma3KvaRGK+
 fYM7hcUdOmkFfKzZ93Gg8xFyU6ToU4g=
X-Proofpoint-ORIG-GUID: I3_Y-2pfAR6WThNjGsqbWB83sVcp8Ic3
X-Proofpoint-GUID: I3_Y-2pfAR6WThNjGsqbWB83sVcp8Ic3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3

