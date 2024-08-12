Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64AC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 20:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0F610E2A9;
	Mon, 12 Aug 2024 20:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVwmssPQ";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CE910E2A9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 20:12:40 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-710dc3015bfso2129361b3a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493560; x=1724098360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQZ6dy+9gSA3N/oI1kSn5YWukli1n/P0SORjeJucq48=;
 b=XVwmssPQN2jkv4gDLIh44sKcDtALHxTJEOpxbCbVEdN7UYECD/rG83TLe0Ui9SACgF
 dbI38E/nRT6V0hXN8n1MKlsSXF1N5rsMA1v3f7VtBSoOrxKSnb9uOjbFMpJ2ww2X0axn
 YWO9KyF10kxc6dlEpS1pL5sJYl0uXVgEq/Lofh62MRCam+8lACEGal82hGfbX6GKqf8p
 0jv7XN7N+2UHINWBI1hX3ZFeqwp0E1l+hMoSlL1VF2CU8YsgESAHFHBnZqscNT4OOjqc
 DSd8Z2UI/5+zPMJx8VBcuf6TOGHG8721kb2HSFOBZvKKUJgDCpg5I1VCMA9tzELdm85h
 g1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493560; x=1724098360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQZ6dy+9gSA3N/oI1kSn5YWukli1n/P0SORjeJucq48=;
 b=ZHXMoM1PAiWU/7u+MCdk0hLYO7X+3QLiIKVanZJuVMv4IOSUnBudcL3fYFK9omJRYA
 ZY1XM+DfO3DNGt1G7eapF0tIYlL4EyABd5YL9ZFgL/M7Fj1Z6ZA8DM0fKUN3YMX84qXc
 SXtisaPoPVlikws3HkfI3NW1CFgYXZx5P8cMkIByatyueBW1MqSxMwexfBc/0DYnspqX
 0WICZHvFcwSa+4mfwcaqF9vTby1WFQ8yBF/W5gz6/aRlQZN0G2Ifo8cRDGQaMK/eoW16
 llAtA10rwBJXDsaG60L3cM5UvClpo+M5WAaMltUmYqzOTjfp/fWK/R8Fwz3oP7nxphP2
 jFfg==
X-Gm-Message-State: AOJu0Yzs82QvzwOgDGG276BLgeGTO5F3M6LqpXL9spyXkmE4kwMrDkiF
 oAOgOSpRPJDPkTaIP0gCjn1b9xxbaQ2fP9xQYWzwvaGNYQoZaW3P6f59ByBJPUKkSQKH
X-Google-Smtp-Source: AGHT+IFDbDXJFpkcpWot12POO8GdHsyiITGJw7nMES/BL7jKHGSjKUN7LK0XMTIkfdrNTxjfszDowg==
X-Received: by 2002:a05:6a20:111f:b0:1c6:ecee:1851 with SMTP id
 adf61e73a8af0-1c8da306cc5mr781002637.22.1723493559617; 
 Mon, 12 Aug 2024 13:12:39 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c697a5492esm80224a12.65.2024.08.12.13.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:12:38 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 3/3] drm/i915/display: allow creation of Xe2 ccs framebuffers
Date: Mon, 12 Aug 2024 23:14:37 +0300
Message-ID: <20240812201549.2014168-4-juhapekka.heikkila@gmail.com>
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

Add I915_FORMAT_MOD_4_TILED_BMG_CCS and I915_FORMAT_MOD_4_TILED_LNL_CCS to possible
created modifier for new framebuffer on Xe driver.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c   |  2 ++
 drivers/gpu/drm/i915/display/intel_fb.c        | 18 ++++++++++++++++++
 .../gpu/drm/i915/display/skl_universal_plane.c |  5 +++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9f2a4a854548..1042f65967ba 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6260,6 +6260,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 		case I915_FORMAT_MOD_Y_TILED:
 		case I915_FORMAT_MOD_Yf_TILED:
 		case I915_FORMAT_MOD_4_TILED:
+		case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+		case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 			break;
 		default:
 			drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f23547a88b1f..d2716915d046 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -163,6 +163,14 @@ struct intel_modifier_desc {
 
 static const struct intel_modifier_desc intel_modifiers[] = {
 	{
+		.modifier = I915_FORMAT_MOD_4_TILED_LNL_CCS,
+		.display_ver = { 20, -1 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+	}, {
+		.modifier = I915_FORMAT_MOD_4_TILED_BMG_CCS,
+		.display_ver = { 14, -1 },
+		.plane_caps = INTEL_PLANE_CAP_TILING_4,
+	}, {
 		.modifier = I915_FORMAT_MOD_4_TILED_MTL_MC_CCS,
 		.display_ver = { 14, 14 },
 		.plane_caps = INTEL_PLANE_CAP_TILING_4 | INTEL_PLANE_CAP_CCS_MC,
@@ -437,6 +445,14 @@ static bool plane_has_modifier(struct drm_i915_private *i915,
 	    HAS_FLAT_CCS(i915) != !md->ccs.packed_aux_planes)
 		return false;
 
+	if (md->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
+	    (GRAPHICS_VER(i915) < 20 || !IS_DGFX(i915)))
+		return false;
+
+	if (md->modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS &&
+	    (GRAPHICS_VER(i915) < 20 || IS_DGFX(i915)))
+		return false;
+
 	return true;
 }
 
@@ -653,6 +669,8 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 			return 128;
 		else
 			return 512;
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index a1ab64db0130..0e81d540ecc9 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -537,6 +537,8 @@ static u32 tgl_plane_min_alignment(struct intel_plane *plane,
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 		/*
 		 * Align to at least 4x1 main surface
 		 * tiles (16K) to match 64B of AUX.
@@ -948,6 +950,9 @@ static u32 skl_plane_ctl_tiling(u64 fb_modifier)
 		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 		return PLANE_CTL_TILED_4 | PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE;
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
+		return PLANE_CTL_TILED_4 | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
 	case I915_FORMAT_MOD_Y_TILED_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 		return PLANE_CTL_TILED_Y | PLANE_CTL_RENDER_DECOMPRESSION_ENABLE;
-- 
2.45.2

