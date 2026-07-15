Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CC6C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 06:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B9110EECD;
	Wed, 15 Jul 2026 06:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyO2geoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E3D10E149;
 Wed, 15 Jul 2026 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784095583; x=1815631583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=incrUGOg2fPdBHiI+Kr0zu396/J9/b0DyF1tfa/Vsxg=;
 b=AyO2geoUUDSUAfvcC2oCJdgHHvpdmlmG0qZ9Uh2qyj7I5tQkw9aNp12p
 5UgtJKZ2lDTdFCkjDUHdCIZr02oUsF2JK5p7+XHruJ8XdaERbApJ4h3Fi
 I8eLx0Jp7W+XMFNQTbATeU0EEG/zKc8BC1mvieNuNPdzPwH+wcT58EI7q
 FvJipW7MVnd/twfZ4tOJMXeBxxf+6ntwp1vQMah0SqLr0V1WP5BFDBOv1
 /qt98rZY8Z/UoVUm0h10l6lnPoTKNLokBPB0GD45SCDg2orsUfEM5Ixiy
 1vTZdTngocnzLuN0AkDdtS+3Kq3ho2MAWQfIHYUG0472zAy59YBr+xCA2 w==;
X-CSE-ConnectionGUID: sRrUorfeT3OMQ8PFz/b/OQ==
X-CSE-MsgGUID: GiKX4SC1QPq0t73h9lzMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84920600"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84920600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:06:22 -0700
X-CSE-ConnectionGUID: UKqgeNI1SWGabR35IpQSeA==
X-CSE-MsgGUID: +Yz/JfNQTjCfeXNYyOlnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="252108181"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2026 23:06:19 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: [PATCH] drm/i915/display: expose blend mode on alpha-capable planes
Date: Wed, 15 Jul 2026 11:12:21 +0530
Message-Id: <20260715054221.451421-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed"), drm_mode_config_validate() warns when a
plane exposes an alpha pixel format but not the "pixel blend mode"
property. The cursor (ARGB8888, all platforms) and the VLV/CHV primary
and sprite planes trip this.

Userspace has historically assumed premultiplied blending when the
property is not attached, so it is safe to assume that planes that
did not expose the property already blended with fixed pre-multiplied
alpha in hardware. Therefore, expose a "pixel blend mode" property
advertising only DRM_MODE_BLEND_PREMULTI to match that assumption and
silence the warning. The cursor call is unconditional; the primary and
sprite calls are gated to VLV/CHV, the only platforms whose format lists
include alpha formats.

Assisted-by: Claude:claude-opus-4-8
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16623
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_plane.c   | 4 ++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 3 +++
 drivers/gpu/drm/i915/display/intel_sprite.c | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 70734d32a409..490908f59141 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -1108,6 +1108,10 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
 						   DRM_MODE_ROTATE_0,
 						   supported_rotations);
 
+	if (display->platform.valleyview || display->platform.cherryview)
+		drm_plane_create_blend_mode_property(&plane->base,
+						     BIT(DRM_MODE_BLEND_PREMULTI));
+
 	zpos = 0;
 	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
 
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 88384dea868b..0673f16f6fd0 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1078,6 +1078,9 @@ intel_cursor_plane_create(struct intel_display *display,
 
 	intel_cursor_add_size_hints_property(cursor);
 
+	drm_plane_create_blend_mode_property(&cursor->base,
+					     BIT(DRM_MODE_BLEND_PREMULTI));
+
 	zpos = DISPLAY_RUNTIME_INFO(display)->num_sprites[pipe] + 1;
 	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
 
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 6a65f92e8a03..3e38960bbbd8 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1722,6 +1722,10 @@ intel_sprite_plane_create(struct intel_display *display,
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
+	if (display->platform.valleyview || display->platform.cherryview)
+		drm_plane_create_blend_mode_property(&plane->base,
+						     BIT(DRM_MODE_BLEND_PREMULTI));
+
 	zpos = sprite + 1;
 	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
 
-- 
2.25.1

