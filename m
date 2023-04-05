Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF56C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1E10E9FD;
	Wed,  5 Apr 2023 15:40:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C9E10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709253; x=1712245253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9BxLbMvGVWBV4VqDz4Dt3ZRy0KETNVlMpStwUItcRUc=;
 b=MefbZY0/+ATExi8i/+INpRVpMPVT/W9e4YR6o/B5iJfTWBAxNoapLYMx
 W8eFnQY2Uiq9eYsySAfcDuA+ZCj50zamGFFwFXDzRS2XmsaVIBnlwD34w
 KOKlLqVAGWehxhVFbCtfoK7m0IdfidSWJXTDTZT1X2NlvTlasPTz2c05H
 dp3j+Jau7+A0bKpZU9CismBu1tLOpaQOptxoUNPCMWYl/myUuCmEQJbf5
 4GdZXakgXxpyjUzRmBEWM6DHx2AKVsAe+eGZ2RsubOVxhhHoX283kzBIQ
 qjkuvI0D9OEV1b2kTUMcTWe3ZNXtCT0aeMqGENFXe1xeuAcw6xCTukaLz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342501128"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342501128"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756033503"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756033503"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:16 +0300
Message-Id: <20230405153920.926583-18-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/21] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel_sprite.c ifdefs

No longer needed with conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sprite.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 69603563f741..23e23f119a2e 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -53,7 +53,6 @@
 #include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
-#ifdef I915
 static void i9xx_plane_linear_gamma(u16 gamma[8])
 {
 	/* The points are not evenly spaced. */
@@ -267,7 +266,6 @@ static u32 vlv_sprite_ctl_crtc(const struct intel_crtc_state *crtc_state)
 static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
@@ -339,9 +337,6 @@ static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		sprctl |= SP_SOURCE_KEY;
 
 	return sprctl;
-#else
-	return 0;
-#endif
 }
 
 static void vlv_sprite_update_gamma(const struct intel_plane_state *plane_state)
@@ -393,7 +388,6 @@ vlv_sprite_update_arm(struct intel_plane *plane,
 		      const struct intel_crtc_state *crtc_state,
 		      const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 	enum pipe pipe = plane->pipe;
 	enum plane_id plane_id = plane->id;
@@ -433,7 +427,6 @@ vlv_sprite_update_arm(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, SPCNTR(pipe, plane_id), sprctl);
 	intel_de_write_fw(dev_priv, SPSURF(pipe, plane_id),
 			  intel_plane_ggtt_offset(plane_state) + sprsurf_offset);
-#endif
 
 	vlv_sprite_update_clrc(plane_state);
 	vlv_sprite_update_gamma(plane_state);
@@ -659,7 +652,6 @@ static bool ivb_need_sprite_gamma(const struct intel_plane_state *plane_state)
 static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 			  const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	struct drm_i915_private *dev_priv =
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
@@ -729,9 +721,6 @@ static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
 		sprctl |= SPRITE_SOURCE_KEY;
 
 	return sprctl;
-#else
-	return 0;
-#endif
 }
 
 static void ivb_sprite_linear_gamma(const struct intel_plane_state *plane_state,
@@ -1558,13 +1547,10 @@ static const struct drm_plane_funcs vlv_sprite_funcs = {
 	.format_mod_supported = vlv_sprite_format_mod_supported,
 };
 
-#endif
-
 struct intel_plane *
 intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe, int sprite)
 {
-#ifdef I915
 	struct intel_plane *plane;
 	const struct drm_plane_funcs *plane_funcs;
 	unsigned int supported_rotations;
@@ -1684,9 +1670,5 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 	intel_plane_free(plane);
 
 	return ERR_PTR(ret);
-#else
-	BUG_ON(1);
-	return ERR_PTR(-ENODEV);
-#endif
 }
 
-- 
2.39.2

