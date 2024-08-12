Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D33C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 20:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACF910E2A7;
	Mon, 12 Aug 2024 20:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3U97ska";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5591310E2A7
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 20:12:32 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-710dc3015bfso2129286b3a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493552; x=1724098352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7hE1RgLy8mX4J8hF3W1OJ9Lh99mP7nU/Guto6WhUSA=;
 b=F3U97ska4t2t79OZxfdDRDEy9QmR583CqTOnDI8HFPVMBmjLSV+Kwf+1296XzooVtj
 wDf+P477JGOaF7cYjfkQkbR17qkF3nguqHrgwZeBhDaSrpjpn/8dvlE+K9fOplFlxaQH
 H2yxpb+FXmTErWr/4KE9TpTkl2r+7LMEqQRSky8NDbwCPLSSzhU84VCWfOeg+JE8nm6D
 h3AAKgoMXIip0Eh6cXdB48LKWn6oHRGUAHGbeBukGtLiXxPH5U5Yt2lLFTtuA+06UVr/
 gV3T3Rkbn7OajxitOmG6+EbweqNFqXF15FGHskEWUnojBcNcIIJhbdHU+q89zD9CgsVY
 gcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493552; x=1724098352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7hE1RgLy8mX4J8hF3W1OJ9Lh99mP7nU/Guto6WhUSA=;
 b=Gi4UDifHoVEKkYprePhcgoXVVD7GAhjtXbcmF2yxSqqQuC9N9AbIpx03cD9SGBU9fv
 TVg++kKnk5RDIlGsDOiNDrofKPl0x7YeusOgpXvP20ttwu3IYy1k+4Kl+h5w96f1SKPa
 0x/g+igBm3uR/cqY5QNAqzBcKs5zxCNQ/KErar3iggoJ/UBjwGlhDqwVEK+B7QjLtmG1
 0YYYC3yZpuxy37Nx2hSwXhDaPA6VZBD6e48S7I+ct3nO5ak5hNuhIYvH1DTNcVKwr7zh
 5YzPOkSZ2RQTYZ7DWmUIrlbygEiFQ8WwhpUM2COwCJbfq4P7G3EY8OEC1s3UGHXSNoH+
 tnFA==
X-Gm-Message-State: AOJu0Yz4nneXQPr1qByWaxt5M6WuP01TgRaLd9QpAyI2n/Zw8i1eR883
 vRmASmUwYV/IZnFasUFAkg02y0KsE+iqUYOjdvgTrKd6BXBd45Vk0o7I5gYpl2yQhLBg
X-Google-Smtp-Source: AGHT+IFFlEnTzCxxLU+Sdb+k0xr0Qqg0RFEWayWW2VPRdx2nENDHtIkBiMAPTMvU9Sg3Ac/eEu4KYA==
X-Received: by 2002:a05:6a20:4c94:b0:1c3:acd1:5caf with SMTP id
 adf61e73a8af0-1c8da30c77emr898573637.23.1723493551504; 
 Mon, 12 Aug 2024 13:12:31 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c697a4b9f1sm81822a12.75.2024.08.12.13.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:12:31 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 1/3] drm/i915/display: Don't enable decompression on Xe2 with
 Tile4
Date: Mon, 12 Aug 2024 23:14:35 +0300
Message-ID: <20240812201549.2014168-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From now on expect Tile4 not to be using compression

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..a1ab64db0130 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1085,11 +1085,6 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 	if (DISPLAY_VER(dev_priv) == 13)
 		plane_ctl |= adlp_plane_ctl_arb_slots(plane_state);
 
-	if (GRAPHICS_VER(dev_priv) >= 20 &&
-	    fb->modifier == I915_FORMAT_MOD_4_TILED) {
-		plane_ctl |= PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
-	}
-
 	return plane_ctl;
 }
 
-- 
2.45.2

