Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72818C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09510E82A;
	Wed, 12 Apr 2023 14:25:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBCE10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309512; x=1712845512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PcwqEd6ru8dDTN8MIiRm9AVwMXsc8d52Ninx3XH07gI=;
 b=eF4riFOe2bvYwsqt+LAyEfhO9OXkM/0Xen+7+wodLyQAVxEcWxYFyTVN
 pQRNo9OjbwQ56WWKJCTKBvBoCf/UOj7iSPu7pxqlTfWe975drdrw/YWOV
 9yn7KOu4RXEo+KPkRxOnwuPdMAlGCB6Ops6ul4aQ9jzJMJG7wXVVqKBW+
 SBcmvktK79bC+8U3g2Nawdc480h3/2v5kuO0yBr3LJcYiTBYwZOqtc8/8
 t87cJUHDdKMlerTaDUp0fAkXks+XyQ42sobN20wo5wMCMRnh/TcrYt+ay
 w3zkQ98ZY7dkAhXAK1K6Slp2sBvErEzmTdYFOCgoQwY17UPNw6tvoDWS6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343916120"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343916120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688956156"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688956156"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:47 +0300
Message-Id: <20230412142006.877109-23-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 22/41] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that we have colorkey type, we can drop the ifdefs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 --
 .../drm/i915/display/intel_display_types.h    |  2 --
 drivers/gpu/drm/i915/display/skl_scaler.c     |  2 --
 .../drm/i915/display/skl_universal_plane.c    | 30 ++++---------------
 4 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 92042e7fcfb4..eaa67be2ac75 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7785,7 +7785,6 @@ static void intel_plane_possible_crtcs_init(struct drm_i915_private *dev_priv)
 	}
 }
 
-#ifdef I915
 int intel_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file)
 {
@@ -7802,7 +7801,6 @@ int intel_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 }
-#endif
 
 static u32 intel_encoder_possible_clones(struct intel_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index fc798734f8d6..bc385aed39a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -755,9 +755,7 @@ struct intel_plane_state {
 	 * this plane. They're calculated by the linked plane's wm code.
 	 */
 	u32 planar_slave;
-#ifdef I915
 	struct drm_intel_sprite_colorkey ckey;
-#endif
 	struct drm_rect psr2_sel_fetch_area;
 
 	/* Clear Color Value */
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 2936cfb66d1d..473d53610b92 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -277,7 +277,6 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 	if (ret || plane_state->scaler_id < 0)
 		return ret;
 
-#ifdef I915
 	/* check colorkey */
 	if (plane_state->ckey.flags) {
 		drm_dbg_kms(&dev_priv->drm,
@@ -286,7 +285,6 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 			    intel_plane->base.name);
 		return -EINVAL;
 	}
-#endif
 
 	/* Check src format */
 	switch (fb->format->format) {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index d3eb56c0efd3..0f1e4e61d32e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -898,9 +898,7 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 		to_i915(plane_state->uapi.plane->dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
 	unsigned int rotation = plane_state->hw.rotation;
-#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
-#endif
 	u32 plane_ctl;
 
 	plane_ctl = PLANE_CTL_ENABLE;
@@ -924,12 +922,10 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 		plane_ctl |= icl_plane_ctl_flip(rotation &
 						DRM_MODE_REFLECT_MASK);
 
-#ifdef I915
 	if (key->flags & I915_SET_COLORKEY_DESTINATION)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_DESTINATION;
 	else if (key->flags & I915_SET_COLORKEY_SOURCE)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_SOURCE;
-#endif
 
 	/* Wa_22012358565:adl-p */
 	if (DISPLAY_VER(dev_priv) == 13)
@@ -1055,35 +1051,26 @@ static u32 skl_plane_aux_dist(const struct intel_plane_state *plane_state,
 
 static u32 skl_plane_keyval(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
 
 	return key->min_value;
-#else
-	return 0;
-#endif
 }
 
 static u32 skl_plane_keymax(const struct intel_plane_state *plane_state)
 {
-	u8 alpha = plane_state->hw.alpha >> 8;
-#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
+	u8 alpha = plane_state->hw.alpha >> 8;
 
 	return (key->max_value & 0xffffff) | PLANE_KEYMAX_ALPHA(alpha);
-#else
-	return PLANE_KEYMAX_ALPHA(alpha);
-#endif
 }
 
 static u32 skl_plane_keymsk(const struct intel_plane_state *plane_state)
 {
-	u8 alpha = plane_state->hw.alpha >> 8;
-	u32 keymsk = 0;
-#ifdef I915
 	const struct drm_intel_sprite_colorkey *key = &plane_state->ckey;
+	u8 alpha = plane_state->hw.alpha >> 8;
+	u32 keymsk;
+
 	keymsk = key->channel_mask & 0x7ffffff;
-#endif
 	if (alpha < 0xff)
 		keymsk |= PLANE_KEYMSK_ALPHA_ENABLE;
 
@@ -1424,7 +1411,6 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-#ifdef I915
 	/* Wa_1606054188:tgl,adl-s */
 	if ((IS_ALDERLAKE_S(dev_priv) || IS_TIGERLAKE(dev_priv)) &&
 	    plane_state->ckey.flags & I915_SET_COLORKEY_SOURCE &&
@@ -1433,7 +1419,6 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 			    "Source color keying not supported with P01x formats\n");
 		return -EINVAL;
 	}
-#endif
 
 	return 0;
 }
@@ -1901,12 +1886,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 		return ret;
 
 	/* use scaler when colorkey is not required */
-#ifdef I915
-	if (!plane_state->ckey.flags && skl_fb_scalable(fb))
-#else
-	if (skl_fb_scalable(fb))
-#endif
-	{
+	if (!plane_state->ckey.flags && skl_fb_scalable(fb)) {
 		min_scale = 1;
 		max_scale = skl_plane_max_scale(dev_priv, fb);
 	}
-- 
2.39.2

