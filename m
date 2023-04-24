Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F2C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1D510E1B9;
	Mon, 24 Apr 2023 16:51:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70410E12B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355105; x=1713891105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yYLDoXMb+hkgFXwHi3+JUALRqDdbQiIqF9JREfSHjDc=;
 b=QYQiVyiIQFLBs4VPg19pPnQWxQ9eLuXoohEuTKB++Jy5OBmcDCNFXX41
 69kkhzBM7CZR2+ci9xhH9I8gUU/ZudzrYpoacN69425AbWW77n08Yvw4a
 iGO+cjz6Gl1Uf1XIcvvs1k59m/1XFFOgwwP9LawO16ErrZimrLBleL+P6
 VGNsdnzsvnRyXRjFp+t8xU9QFgH14RSU2lFoFcxuVUUAzDZ5payAlh4qO
 ggvLsbBtzJUKJSE4oiKTsoQWhA/K+PlUIs50qkPpfB0+kYjRv2zx0rMVv
 37RJEETg7LOcalOhCpcY6Zz4aaRHw0vY6o2lONxr5fWoSj1llKq0Wfi4/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704192"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704192"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785334"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785334"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:43 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:21 -0700
Message-Id: <20230424165135.132494-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/15] drm/i915/display: remove
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
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

