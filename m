Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A89C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 22:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9A10E2A8;
	Fri, 10 Nov 2023 22:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBD810E2A8
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699656417; x=1731192417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0S0HJ2CeTaAzQX4s+ZKQWd703/bxUwAoXKXD9IJGSI=;
 b=S262fQUnEMmya0qYR7rkeVamcKF5mG2RIfCBkjAVFzHXKsrzL0D32fsP
 Sf9YhqcIUjbT3LvIPe05E5Qd4i6ZjW2p04fl45ct9DkfnZ0H46OaCCcM+
 MYd+5FvfW5FyT/sRKTxaZcVOL6py4ufZfjhCltr4vJ7YePJIBPgUBqwxb
 0AZBhasPxYZgGJtONH69nChpsdKjFuA3ApNCophP1bo4X5cIJpDY7ZQpE
 SMUCqxh0sFQ3+PJ+hxUO+72XIPBpKkB6bb4knLbT2koAgI1JiLwqa+V2U
 vJNuJZOmckLDFV8KYWRTqNp2xDQ2lnzW/KKBmJIKaqwMSeECLDr7oeS+M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387404358"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="387404358"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792943609"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="792943609"
Received: from sschumil-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.111])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 11 Nov 2023 00:46:39 +0200
Message-Id: <20231110224640.3570307-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110224640.3570307-1-jani.nikula@intel.com>
References: <20231110224640.3570307-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 3/4] drm/i915: remove excess functions from plane
 protection check
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce the function calls by reusing ->decrypt.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231109160722.3372379-2-jani.nikula@intel.com
(cherry picked from commit 9b1c97fc0ce6090c328b5723250f4deeefc95fcd)
---
 .../gpu/drm/i915/display/skl_universal_plane.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c1d426dbcc62..301b3f2303ea 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1858,29 +1858,19 @@ static bool skl_fb_scalable(const struct drm_framebuffer *fb)
 	}
 }
 
-static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-
-	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
-}
-
-static bool pxp_is_borked(struct drm_i915_gem_object *obj)
-{
-	return i915_gem_object_is_protected(obj) && !bo_has_valid_encryption(obj);
-}
-
 static void check_protection(struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct drm_i915_private *i915 = to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb = plane_state->hw.fb;
+	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 
 	if (DISPLAY_VER(i915) < 11)
 		return;
 
-	plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
-	plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
+	plane_state->decrypt = intel_pxp_key_check(i915->pxp, obj, false) == 0;
+	plane_state->force_black = i915_gem_object_is_protected(obj) &&
+		!plane_state->decrypt;
 }
 
 static int skl_plane_check(struct intel_crtc_state *crtc_state,
-- 
2.39.2

