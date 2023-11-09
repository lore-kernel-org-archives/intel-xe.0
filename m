Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6F3C001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831E10E8E9;
	Thu,  9 Nov 2023 16:18:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E82210E8ED
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546709; x=1731082709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pYiu7az/p4ssGhKv1AkQeLS+4GJoW2zdiMi/KwvkvAg=;
 b=AzJAInT9zp8JmRJKyrz2mJfHeY74xzKLeJdBI/Y3QWoVZQJVg3ZhPO2l
 iAipMeYOzAERhPtPYb0E2JB1z+F8fGYauh8SDMHUTVOuDi6FgYl38eBdo
 fiy+heEkyqeJzLnhtnA26OhCnRowUcET7TwcUnrKb575H63CNwTu7VnvQ
 co/SCJ6jVLD1/1N9V7PhG2IXhYrouSYCvZNhvgc0+ryVYj3cpWtrd7dby
 NqzRcCjsf6QO7K8oSX42WojCAT8pHdqwz65U4i8YPivSqi0F4Zesb8Lk9
 vPuyAdjU1sHLmWlSzMbYCmavPRRf27DRpzNVoQ/lxoJcRsxpMfVRCUSC+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11563305"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11563305"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4764615"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 18:17:56 +0200
Message-Id: <f64007a104d52c769e19da0fcdcb5a2b6e1f9d78.1699546565.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699546565.git.jani.nikula@intel.com>
References: <cover.1699546565.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/i915: abstract plane protection check
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Centralize the conditions in a function.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231109160722.3372379-1-jani.nikula@intel.com
---
 .../gpu/drm/i915/display/skl_universal_plane.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index a4d0e2ede2f7..c1d426dbcc62 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1870,6 +1870,19 @@ static bool pxp_is_borked(struct drm_i915_gem_object *obj)
 	return i915_gem_object_is_protected(obj) && !bo_has_valid_encryption(obj);
 }
 
+static void check_protection(struct intel_plane_state *plane_state)
+{
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	const struct drm_framebuffer *fb = plane_state->hw.fb;
+
+	if (DISPLAY_VER(i915) < 11)
+		return;
+
+	plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
+	plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
+}
+
 static int skl_plane_check(struct intel_crtc_state *crtc_state,
 			   struct intel_plane_state *plane_state)
 {
@@ -1914,10 +1927,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
 	if (ret)
 		return ret;
 
-	if (DISPLAY_VER(dev_priv) >= 11) {
-		plane_state->decrypt = bo_has_valid_encryption(intel_fb_obj(fb));
-		plane_state->force_black = pxp_is_borked(intel_fb_obj(fb));
-	}
+	check_protection(plane_state);
 
 	/* HW only has 8 bits pixel precision, disable plane if invisible */
 	if (!(plane_state->hw.alpha >> 8))
-- 
2.39.2

