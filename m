Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9540DC77B78
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596E110E137;
	Tue, 25 Apr 2023 19:26:36 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0210E598
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450793; x=1713986793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yYLDoXMb+hkgFXwHi3+JUALRqDdbQiIqF9JREfSHjDc=;
 b=HupHLm+2cJXYKpk8VwhOUwWN4R246ZGQF0SujqmvZhGxvY8z55aW8VaS
 /TDJwweTnO1xX6ZXv/5fQ78wDMUHtPrBUcuj+/rcuAdgNhGAcT/uIXkMU
 Dee80FsV28YbzicCDMUnerf6IjISSyQVyFXLysM15tDWWan6/Au8EIrBk
 5iep4FIp4LI7lcl0nQjhCHmigjCJ9nh8d2DzBoxhAiaUtcD8pNCVr539T
 CUHoSKNZNkkQRsJKhZEGV+FGWkyeQLt3BjcyohszZFh6pjbq6hV/FX6Fe
 tgkEGjXNtWvVHJJVlXmPq7KSSDZPeSCl9aI21+IB1a7XeUJ9Czbj90jga w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100756"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100756"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990448"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990448"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:28 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:10 -0700
Message-Id: <20230425192624.168640-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/15] drm/i915/display: remove
 intel_display_commit_duplicated_state()
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

This seems like an unnecessary wrapper layer. Removing it will be
helpful later.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/a38f08e259221d71314ce6d764431147b0fba218.1681465222.git.jani.nikula@intel.com
(cherry picked from commit ae52dd7d6d933511c90d129addfc629feff147b5)
---
 drivers/gpu/drm/i915/display/intel_display.c | 28 +++++++-------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 28a2274503292..fccd067cc9cb0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -702,20 +702,6 @@ intel_plane_fence_y_offset(const struct intel_plane_state *plane_state)
 	return y;
 }
 
-static int
-intel_display_commit_duplicated_state(struct intel_atomic_state *state,
-				      struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_i915_private *i915 = to_i915(state->base.dev);
-	int ret;
-
-	ret = drm_atomic_helper_commit_duplicated_state(&state->base, ctx);
-
-	drm_WARN_ON(&i915->drm, ret == -EDEADLK);
-
-	return ret;
-}
-
 static int
 __intel_display_resume(struct drm_i915_private *i915,
 		       struct drm_atomic_state *state,
@@ -723,7 +709,7 @@ __intel_display_resume(struct drm_i915_private *i915,
 {
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
-	int i;
+	int ret, i;
 
 	intel_modeset_setup_hw_state(i915, ctx);
 	intel_vga_redisable(i915);
@@ -749,7 +735,11 @@ __intel_display_resume(struct drm_i915_private *i915,
 	if (!HAS_GMCH(i915))
 		to_intel_atomic_state(state)->skip_intermediate_wm = true;
 
-	return intel_display_commit_duplicated_state(to_intel_atomic_state(state), ctx);
+	ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
+
+	drm_WARN_ON(&i915->drm, ret == -EDEADLK);
+
+	return ret;
 }
 
 #ifdef I915
@@ -841,10 +831,12 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 	/* reset doesn't touch the display */
 	if (!gpu_reset_clobbers_display(i915)) {
 		/* for testing only restore the display */
-		ret = intel_display_commit_duplicated_state(to_intel_atomic_state(state), ctx);
-		if (ret)
+		ret = drm_atomic_helper_commit_duplicated_state(state, ctx);
+		if (ret) {
+			drm_WARN_ON(&i915->drm, ret == -EDEADLK);
 			drm_err(&i915->drm,
 				"Restoring old state failed with %i\n", ret);
+		}
 	} else {
 		/*
 		 * The display has been reset as well,
-- 
2.40.0

