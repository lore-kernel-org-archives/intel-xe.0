Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E07C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B510E65C;
	Fri,  2 Jun 2023 10:43:16 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D45C10E65A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702594; x=1717238594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVYWIgNdcmYAfkM1nzvOOkF6/RNJqz1hpFU42TfZ6no=;
 b=eRxxtoqbuACFgJtDhoHqiXkA7wVmz5snByAM2fyKMnG3voINVTXx8I2f
 AM4Am82C2s4pqXMVlMdEaBphf9q+e5cdPQbyNZB2rwO1gyHjuS9SfrTyg
 a7xyrlTl5fhJzY/mnCld9MSuFOcE1jxkxdXXImt//H0a/6f63+fCRoX6K
 G+fvBlojoEc8rF7DKTHrl6TDNPK3l3GJvmZrPinT1V7k5R1iIclY6JkJU
 QKNYTT263Sly8I+89UkF/2ffPqQtBPUX5qkoHZCBnHWc/1JYy2RmMC+Gy
 xT5qsVuBIq+ZvPqHneF2gGIYXoWpHkEL9Zb2KDsV0WGu0JLAfy3E61xay Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215572"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215572"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237922"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237922"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:12 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:36 +0300
Message-Id: <20230602104237.1014684-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 09/10] drm/i915/fbc: Moved fence related code
 away from intel_fbc
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

Add new functions to check support for legacy fencing and fence id and use
these in fbc code

v2: intel_gt_fence_count renamed as intel_gt_support_legacy_fencing

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_gt_types.h |  2 ++
 drivers/gpu/drm/i915/i915_vma.h          |  5 +++++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 0edfc897e94d..8bf88cc39833 100644
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
@@ -607,7 +608,7 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-	if (to_gt(i915)->ggtt->num_fences)
+	if (intel_gt_support_legacy_fencing(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
@@ -991,11 +992,10 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
-		    !plane_state->ggtt_vma->fence);
+		    !intel_gt_support_legacy_fencing(to_gt(i915)));
 
-	if (plane_state->flags & PLANE_HAS_FENCE &&
-	    plane_state->ggtt_vma->fence)
-		fbc_state->fence_id = plane_state->ggtt_vma->fence->id;
+	if (plane_state->flags & PLANE_HAS_FENCE)
+		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
 	else
 		fbc_state->fence_id = -1;
 
@@ -1022,7 +1022,7 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	 */
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
-		 plane_state->ggtt_vma->fence);
+		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f08c2556aa25..f879dad6b913 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -306,4 +306,6 @@ enum intel_gt_scratch_field {
 	INTEL_GT_SCRATCH_FIELD_COHERENTL3_WA = 256,
 };
 
+#define intel_gt_support_legacy_fencing(gt) (gt->ggtt->num_fences <= 0)
+
 #endif /* __INTEL_GT_TYPES_H__ */
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
-- 
2.34.1

