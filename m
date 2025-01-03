Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1FE77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 13:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7996C10E8B3;
	Fri,  3 Jan 2025 13:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wTKXDkdx";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC32F10E8B3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 13:26:45 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so8026025f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jan 2025 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735910744; x=1736515544; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=wTKXDkdxLm2XxkTR0tJ5zd84iATpreBXrmc9/hww9eLGB4ThlKOUThGXOGS6Lof10H
 Me7sUEy9C79O4Y4jK6LztIu7eD9BS6qYvnAT/XV87FL7Sk4xnsosh2aCsKZklcC++oAg
 hdtr9kglAxjxHyJKtSkNtmnd5JvWdE9il/PvxlW3xc+rSwFPv9+EtdgGcAid1e2y1D6f
 zo3w6huwkvxZIerUV1THVdgmwv4aeq7ssyG0wvEyXvMVREhe9lEcWMyPFfUky3Cf9jrz
 ddBiqhDqeKjv89I/TQhQWtjyPiyhyq8ijVQckdRgQztrb+78j6WCD59uZFFHs4UQ7pkp
 kN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735910744; x=1736515544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=ZTnY/o3D/R1bZNh8gBn1ShniA2fWjUHTIWioT+70YDRIdsR8UIHKI9waj9e/CdoXPA
 +xmuy/FqkU5UOArYVtaksRBelRrWV0HOrg20Dx0OhqaOSv5H4UJ1oo7dEH32wyvXDNT+
 OFAA+Efi3gy93Q6caqMIgKqwxdzldf0txUSq65LTg352+sFM6vi3zrBTsrV0i5GVDx3z
 MrOsapfnSW5bvZm/EQiW20OFyIXrfcTI6nQhclx4xKTMLXvfl1rz62E+qqOSYyKKamY2
 zjN1dqB4rbz2eBcYDJzgAnlXJIdsWfHQn5s5FIKZUOnIU+nQiNLCruvYtit7Rg7T00cp
 l4NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+OHaXWJOZShwvnmcUEGHP4dbYmWOVdhSxjWt7LfJw5ULqFQQNPwLD2acBiX1uGeOnqgzOOj2iLQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Yo4gg9Z2BGvx5khTH0aNVwWNeIbpLsMT2WV2jra/Obk9Rsuc
 t59pCAklaPAiJkCSnXdttlSAU8EW4T6gZnHA4Ng9AADnjMrmY0w/E2mUQlEBg3k=
X-Gm-Gg: ASbGncujzOzXX/y6Kq9PppmgOmbXpXA6vzI4XAsYluqqGt9kL0wGe/ebP6oouYBETi0
 4xbQgVUcxQW7f5Ux105a+juOfIO13PLvUBVL/OFvzVA2N1NEso/xWEACkzXoi5jZ/6VNy/4ZLWx
 v1Sw+HfOFigpwz2V1mZIbCNlJYiR6tL2UZ3mPcnl3TOZZ5q+o7Q/6dJB8gUKk2lfW6pYqKOHdnI
 pKtD1FrM73bLp8oTxLbhHkSqswOh+d1vg/DYjuTTZRuNklqCKSKlhqx
X-Google-Smtp-Source: AGHT+IGUnpXjnchYmTBFtUQ71LNCqNAU5Q0SOmAgi8sEQyivFL6wDbTXzLedPgyb7rzrtBvhgs98IA==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id
 5b1f17b1804b1-4366854c062mr416478835e9.5.1735909135449; 
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:18 +0200
Subject: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zhRY8lT1G9JeELkZ54ealjEatpcKTP9np6vn+j2kA9w=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98D5vjbEpomMQ8dXV6RVZNIUGfQhGggxggBR
 Qdgu7UHk5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAwAKCRAbX0TJAJUV
 Voh8D/9SfWx0sZ/dkeV5jYSYWRDoRArPfvo/DRVwDxLshqbRTU8todXxZViuaYxdh0+wz1yC/Tl
 QEgnwoaexcdVCEAq25zErdxGc4DeAW9RvqP/VVsiJug9NL1tl3wpnml4UY6A5JfU7ZB3/JOy9/F
 /ONMwxpcEqk7hKvuddzOaCg1m/haAPzk+i1foSK1pMOcFttgGGASktqORFxgTLVEfYY8cHB4yxM
 dvBYkfyMHeH4AHeDxpk08PfpDC7+kdjNESFHUjBbTQXdkT5tEu/AGxWOoyPQ/T84KwG/0izcapT
 mM2YxbX25qmTlAbYB7G6xo0nZs9IPz1lhpDnv49OF6A0Cji+YOfhvDdQizk4uDXrcS1rwEqNJja
 O82hu9RoIPEiXDGv3rYeLjA/4mkctvac/eWZv3CKxxxadOQfbX46cqUP5ax+8tvgzsY4GDpQ97M
 o0ZNmdt1dc09tsGlamOHx4vapCTX3qSXt9Oj8w0HWezaWJW0MHuDfoH+tZpHYbYZ5+J4i2DExJK
 6igXX5ziVN/sJVwhFYPYRdVp0T3ZkUkCpBTJRBAG/+6uS4hffPzIh+wWpkfNmHMhAatBd10ifQo
 SovAsasDDp0M8XgZ6QSM4qpqr2Z6a0qO6NY0DuXvyC5loIDA2uFCsYWFvBQe8y3+YQAOqdaq5ma
 Xl+1+4xOfJyy7zw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..6ea8245284ab5b6068bfba64f01a960838f577b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	msm_dp_display_lttpr_init(dp);
+
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1

