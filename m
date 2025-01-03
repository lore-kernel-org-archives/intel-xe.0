Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B38E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 13:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6310E8B3;
	Fri,  3 Jan 2025 13:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jHdaP6mp";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5D910E8B3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 13:27:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1934318866b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jan 2025 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735910783; x=1736515583; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=jHdaP6mp/4UI2m71BjkyGwje6TScbdXssDO7oDxja/QG4PYz1VocdekBzMy8BOc1KH
 4a2TteMLPouHYZyeF7ByibRNpnexk5DnNNPCdPXnpM8M/xD+aZiQ40AChPecgeMCoQmi
 vBkQBu2gu+1EVXrH/bPFT+kKQK+0CUSSOZuE+hRr8JZxdLrwHW7i9r9ooo6esKqxCW+Y
 ViTziFzTca3Mg/cZPNGOuH2BMfifMFDYOHbeAk+OZ/lAHxrH3WVuVG4ynG6ZauU/DAvx
 b5pz7fj+8pqpkmIItnBuD/m4sxXvbkokBhq+9FOyeBc0WG+OILWgl/7u8d1+wRseynOb
 3Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735910783; x=1736515583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=BE5yyn+8ZuJH5q8+EPdqvgVsFiI9OWUs42pXDHqutdfhKhTgYPsYYB4mtvQyZitkLG
 9irTAVtjjsWSRub0ssGbsgdmPS+WzUB6g1MLi8bNnmmPIC8JShYZaU1zQ9nLWEUlGLuB
 hqa0amtTUK3vwgeQgJ371tS0FDgkwXrA9Dn0HFIgKu5rxQ4EhYqba38EpPJBt8w4fiOM
 WHsmlv9JVVDO5vgX9rnTTOyEmS3Ftc7BVxgcgsLZy63crgrnIswqiORX9mdw+zHN5vHf
 iy9sfhsxYQBTl+yiHLfVhGEh6gGGmYiBX8UlQIYhCXXZOOwFhOSssxFU7FmovXXn6yQj
 dYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmXm9MZXMLAW18IJ/lecTt0zK/+qAj3XXVkarlaqeO+GIKGrwqPaYA056+P3FgpB6ecLAYtl2eUg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3g9rPa57OsBxqYx1eb68/E3PIuQusvjXpyHmJJSwlbskroUcM
 BbLmlV6nMLPGQPoqw1R9sq4uKlAfRXPbDnPi8O+nLDYwD3UOOaQasBH+W+U+iPOPgkeRzDmHAj9
 4
X-Gm-Gg: ASbGnct/+hKO0pcU0SrrJdeeneYxdi5ejn6HT4TTQA/oVvj1VGAu+RbONblbE+gcPr5
 4n1H5tItclSuvJnFAt98o2H+9rItGS+rdCZ8eAGSMx8Ddp7pObk+r3wNbi3Z1KdlRctYvYZhvLq
 v/fF1aOqYVDpOZ2tYQuh4TH+tWl8GjVXkqwXssmzw3gag4UYZIiIx7tQXySmiEN78tGY8CPaYx2
 QS4njyOedEzaRSWYAl8DZcLbv9+IqlT2nLkXuynFECA0UyStqonCxQs
X-Google-Smtp-Source: AGHT+IHuqDHnHcd3WF9fZflWdy+Epup29qUDvzgDke+6NvPjnNnt0l09UcQvUzjj7ALc15cgq9nQ7g==
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id
 ffacd0b85a97d-38a22405d3emr42892574f8f.58.1735909131268; 
 Fri, 03 Jan 2025 04:58:51 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:16 +0200
Subject: [PATCH v3 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-2-5c367f4b0763@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98By7+7V5W8HMUxlKldGyiQrYwuq4jO5Of1X
 B3VQSkyoXKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAQAKCRAbX0TJAJUV
 VuApD/4qJrXPMuVFlu1Y3C0w2QBGNOwC8Kd1/O1an/dVPfDmHFzp1BN4X5XeV54FXsFUPl7z/Yv
 CLx7tlv9WL2kvIqM/n93QJkE67uOATYU1pcOPkmnQc8HZ+x5JN2QZgyD3saXpcv2UUEzEMlcxY/
 KeZHgN4TKA7G4LZHG79/0tYd26xSR0HgOOpjD+ltQ8LCD9rF6zY4TAgCy3HgzrbQvBG8c++rQRA
 He8crsrdI25Xh1uXL+YuieNyNP6OwxpYfxbUcJNEbmfK66CDf7vHcbM8uyzR6+dq4DHof8D/VRv
 LL7F5L7VHvN5ysvlCRTuEBRaZ+k41TLkkCW2C2QABpXk/NE1Nc6honOz8l0kOnfxuKK6xqg+tgk
 5h39FDZEaMvbkcz2JD/Cu6KfhgNiqMeY/UzReYHNDVoK71OdB2ogBcdujH8tCQAhHoE1t06Civ+
 /x4fsT3oyE6IKfInlIDQq0rpK+4F6eDNwHFBJCCp0lIY6XWmTk1ehHrySv6zH3z2MbUJBNZsKQ2
 GKQO9QF7w9OgfciGKtoKNptEilU9MO/yIyih95mVXG97xYdGt1QwZqD+MjLVoihfhl9SiavHziH
 VbIalr2poTpXTXVQZ67PSqmogwtYx5ba2nwdNhrOm9hu8tu2/sXkpgUb5g86pQo3WI98DUoS2ak
 dzODu9EtTIz9otA==
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1

