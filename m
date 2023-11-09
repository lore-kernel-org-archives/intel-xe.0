Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AB0C4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBE510E8E0;
	Thu,  9 Nov 2023 16:18:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D41C10E8EB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546709; x=1731082709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OsZCGoDliWzObLJNAqNUq9HagLnAZImNUutxTeb5Vu0=;
 b=Jy4Ra07ekHhSdmWP2iFHDL5xcWmiUDavDwf5CCKL8S2v6wEiYcfUra0s
 DtKGX8L4xeeBJWnsYh/EsSlQQvowyXs51dRNeDgKkALDXVTMatGC8gDLp
 DLMRRLGaQopup8YIpK9Qb28kBPGeVaz9p0/HffpcKlQJ8pWQxOqNnkmxR
 Iv15KvRhvFvkc07YCvh64rmOybh4Cx5ofpOYyZb5AcwO1iaNLE7CGbT8j
 GA7kAwO2383CB59FPiyjOwBLVgeZCsy7AxYTO2xLjGx5tMHPeRs5neVbf
 off5QgUSJLu+a5ejGkk7wLcLcO4qDh0aRQs7Ylu5cZzkU93LtFz7Ym4V/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11563326"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11563326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4764624"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 18:17:57 +0200
Message-Id: <013010b3a58efd514968a8aab60d27cd36977361.1699546565.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699546565.git.jani.nikula@intel.com>
References: <cover.1699546565.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/i915: remove excess functions from plane
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce the function calls by reusing ->decrypt.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231109160722.3372379-2-jani.nikula@intel.com
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

