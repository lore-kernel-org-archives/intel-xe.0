Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A9EC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 22:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719910E2A7;
	Fri, 10 Nov 2023 22:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59E810E2A7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 22:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699656411; x=1731192411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4mlR2Wk/HUPf5qUQN87fZWYFf94+b/Ka2RA0fD89+A=;
 b=S9aXxJISKRQfl1eOj0XZETlFba06fDnBIRnCMoQ0HNdsFR4DVDxRcvlF
 qdeX6D0YRZF6BqfMgontcU4tKMbxSUu0AXphsSkHu+4AlhT5lTRJO9EHl
 v0GfsmWi9FMpl8pJ5/Ivk8Ulx/o1/Aw9MkvN3Ey3STfpSY2MEIyAFQfK8
 j9Hudldnri42JtncE5E/449Q3st0oziA0GSggjusMGz2RQ+gIUa8VHd+x
 4F9EoWrVLzszxK/Ldx/w+IwfhJ3T7myZojyDzKJrrrlIzy8MimlIZB28b
 wxjpe8lypJ8uUZ2E/SPNJz9NUwJPG2nB8breE5YZMo08PhUAaqrsLvmJL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387404341"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="387404341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1095278203"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; d="scan'208";a="1095278203"
Received: from sschumil-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.54.111])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 14:46:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 11 Nov 2023 00:46:38 +0200
Message-Id: <20231110224640.3570307-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110224640.3570307-1-jani.nikula@intel.com>
References: <20231110224640.3570307-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/4] drm/i915: abstract plane protection check
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

Centralize the conditions in a function.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231109160722.3372379-1-jani.nikula@intel.com
(cherry picked from commit 88a6e46cd3e33756b168c7f2366bf7029a16da56)
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

