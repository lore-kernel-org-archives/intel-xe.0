Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FC3C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 18:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D5310E8CA;
	Thu, 25 Jul 2024 18:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mynzkIVh";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D31110E8CA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 18:32:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fec34f94abso11090625ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721932353; x=1722537153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDjMIFEeVXZhyE2FUfdBNcvGVe0XeEzW23UFOiGsCi4=;
 b=mynzkIVh82d5Uu/s0VdD4jioVcamBLofBPh7AqdH93joMF0KFBchkmThbuA7rHtq0x
 IvRcYfpgYjL9YhTybKLgiJ7SQr2J52pkmXVSVllE+gn2HYmqvKyPUaNDimF7bOX5S1ot
 AVw50Zp4Hf1B41ZLniebs8m2oAV4YdSirHApYold+8vVpvnWmmVjFllM5H7//bn4ykY+
 TQO6am3yaixg2arZ48zM/i5yuhEpoCVF87wS+IfqcEAIBxeQYqyc0Mz5CH6BE3CeQeZJ
 QGRgMuQqg9U6tDsiXxJmLvCjzjAK5a3/2PGloyA1AthCnGlJKnjT9vuFckV4CgdTMd0B
 piQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721932353; x=1722537153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDjMIFEeVXZhyE2FUfdBNcvGVe0XeEzW23UFOiGsCi4=;
 b=T+hw+fCKQMXdBbJwe4kuHw5W8Ht1w1Y3OZ23k/qNiw/0D+MgxC7WHeXxMFTNb8PUjD
 NY5IbgDju3vYRGanXunEZK9+bMiqezVGOiqB20VUA0g+n7ccfWZMuw7/rb2ACmq9Bhvl
 VEBRl/i4RKoTxZD36p23Hj2QfYKLfLydi1xsGe8ET+FO7MgNOa6zaaOazniWAkL3v9EI
 fvT4SdS7i7wgVv2OoKaWrPiuKKT3XTR4bF3R1F6UOVvmWrWQhszzJiCZzfK/fi6QUHSo
 xpIjcgkjll8fxLVbxiGfJ4p4O5JHfPaRptFwjg8pJG1Kifg0WO4hM/Ab8jsWSU0TG0oE
 6KSQ==
X-Gm-Message-State: AOJu0YwWR5KKjXnyOOAWDMKN2XCG652pB4asTk69STJRX4C44xDOYBzZ
 qQLPXYIPaj80Nskqp5b9DQQMjvi+u45qnS/bHjJq/n+19iuAk2rTSfuRguYWw0Q=
X-Google-Smtp-Source: AGHT+IFvBDM+VOT96USqafkh/HDOnckN5sI8tTinUU+XJC63bsgk5C/Z3xdygUvDWCn3Qi5tKQuv8A==
X-Received: by 2002:a17:902:ec87:b0:1fb:a1c6:db72 with SMTP id
 d9443c01a7336-1fed92cc22cmr29031665ad.60.1721932353212; 
 Thu, 25 Jul 2024 11:32:33 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7ff06b9sm17402395ad.294.2024.07.25.11.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:32:33 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/i915/display: allow creation of case
 I915_FORMAT_MOD_4_TILED_XE2_CCS type framebuffer
Date: Thu, 25 Jul 2024 21:35:54 +0300
Message-ID: <20240725183600.3458050-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725183600.3458050-1-juhapekka.heikkila@gmail.com>
References: <20240725183600.3458050-1-juhapekka.heikkila@gmail.com>
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

Add I915_FORMAT_MOD_4_TILED_XE2_CCS to possible created tiling for new framebuffer
on Xe driver. Here taken out unconditional decompression of Tile4 type framebuffers
on Xe2 hardware as Tile4 vs I915_FORMAT_MOD_4_TILED_XE2_CCS have different
requirement on dGfx.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c       | 1 +
 drivers/gpu/drm/i915/display/intel_fb.c            | 9 +++++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++-----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 01a5faa3fea5..8de2ea7dd1a1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6259,6 +6259,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		case I915_FORMAT_MOD_Y_TILED:
 		case I915_FORMAT_MOD_Yf_TILED:
 		case I915_FORMAT_MOD_4_TILED:
+		case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 			break;
 		default:
 			drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f23547a88b1f..95150f400eb5 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -163,6 +163,10 @@ struct intel_modifier_desc {
 
 static const struct intel_modifier_desc intel_modifiers[] = {
 	{
+		.modifier = I915_FORMAT_MOD_4_TILED_XE2_CCS,
+		.display_ver = { 14, -1 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_MTL_MC_CCS,
 		.display_ver = { 14, 14 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
@@ -437,6 +441,10 @@ static bool plane_has_modifier(struct drm_i915_private *i915,
 	    HAS_FLAT_CCS(i915) != !md->ccs.packed_aux_planes)
 		return false;
 
+	if (md->modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS &&
+	    GRAPHICS_VER(i915) < 20)
+		return false;
+
 	return true;
 }
 
@@ -653,6 +661,7 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..105cc6c29df4 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -520,6 +520,7 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Y_TILED:
 	case I915_FORMAT_MOD_4_TILED:
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 		/*
 		 * FIXME ADL sees GGTT/DMAR faults with async
 		 * flips unless we align to 16k at least.
@@ -948,6 +949,8 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 		return PLANE_CTL_TILED_4 | PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE;
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
+		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
@@ -1085,11 +1088,6 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
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
2.43.2

