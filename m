Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A8C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E5810E382;
	Tue, 30 May 2023 10:35:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92C610E37E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442921; x=1716978921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qIb40d4157jSl3ChFcTZlfBpKRcgh2WxQWdfiYrFduw=;
 b=AKuP7Cd+g2BEB02gbTgjOVmndnTFrDi3aIYdO4mD8J8YkoYWAOx2lbyf
 cgUaDkhB+fxhMuPoSBAKMXEhZHgytXjTS+/6GajIqSlcVVF8/wg/mnIpz
 nYHSIChx3smzwPWNXZcKOMTkps8B53AiWr5KJQyQ6ijBQFEWQs4HnSlrF
 PJsL3jDTXd3JYJ0AQYyigL82lZ2Zzge6J7J5Cmt2l+/Y2XHOmZ8xCT3uM
 9gV7trLLh/WIX55APWaLB4OAbOsoKHRgUnlcUNQYd70Vy12XmX0CbrlPg
 3lyje9hbxkqSufkrY5NbBwBCBb1Ix3aeTyKL0cXO8RFFQRZaqTVrdOLJ0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378112"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378112"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226229"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226229"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:35:03 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:20 +0300
Message-Id: <20230530103420.2561722-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] Add new fence_id and fence count functions
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add new fence id and fence count functions and use them instead of directly
accessing struct members

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c         | 16 +++++-----------
 drivers/gpu/drm/i915/i915_vma.h                  |  5 +++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h    |  2 ++
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 2cb537504c2f..7e4dcd747c02 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -47,6 +47,7 @@
 #include "i915_reg.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
+#include "i915_vma.h"
 #include "intel_cdclk.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
@@ -988,17 +989,14 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-#ifdef I915
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
-		    !plane_state->ggtt_vma->fence);
+		    !intel_gt_fence_count(to_gt(i915)));
 
-	if (plane_state->flags & PLANE_HAS_FENCE &&
-	    plane_state->ggtt_vma->fence)
-		fbc_state->fence_id = plane_state->ggtt_vma->fence->id;
+	if (plane_state->flags & PLANE_HAS_FENCE)
+		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
 	else
-#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1008,7 +1006,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1025,10 +1022,7 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	 */
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
-		 plane_state->ggtt_vma->fence);
-#else
-	return true;
-#endif
+		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index ed5c9d682a1b..06e613752c55 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -418,6 +418,11 @@ i915_vma_unpin_fence(struct i915_vma *vma)
 		__i915_vma_unpin_fence(vma);
 }
 
+static inline int i915_vma_fence_id(const struct i915_vma *vma)
+{
+	return vma->fence ? vma->fence->id : -1;
+}
+
 void i915_vma_parked(struct intel_gt *gt);
 
 static inline bool i915_vma_is_scanout(const struct i915_vma *vma)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index c40bb27ac72a..45ea0e44073d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -11,4 +11,6 @@ struct i915_vma {
 	struct drm_mm_node node;
 };
 
+#define i915_vma_fence_id(vma) -1
+
 #endif
-- 
2.34.1

