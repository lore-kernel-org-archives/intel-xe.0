Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972FD6E2B7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF59910EBC1;
	Thu, 18 Dec 2025 22:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Stksw98t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45310EBC0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097542; x=1797633542;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5lA8MI+6YhNslNHPvwZFM0SCmcEPEKSGJ1Hi6mkft+Q=;
 b=Stksw98tWajL0uDzpcSOPDY260QBkfvWX50w3tj8m9iESchP3Q5wDreT
 ltcgE5Pl0vxIPgSUC9oMivhfoygs8bpQHFJnrmreqWDPsB8EoT4T3lgyN
 oP+D1J6vGuADyFw8K5/E2ymyIqUeRIj941N58kXTzoNSgbmFJ9wyVB9oi
 2Vl+KhklAZsmQRXUW9plpqqiT/b2GaU48q3Z9Vvyp/j0pIG+8iEd/q/d3
 uJUgbNlbkkANRyld7ylUMe8zPxfiOwFYfMy8S1XnCRcrJnnZKfO+mO+pp
 tZxA0V7kEL3y3s8+cFTneiKWAEVrrsxvpgimuEbIeoOYJhvES9NslA7OD w==;
X-CSE-ConnectionGUID: eS9qyidkRf2DfgwkPXd6tA==
X-CSE-MsgGUID: v20KXlrDQc2096H2Vc1DZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71910893"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71910893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:02 -0800
X-CSE-ConnectionGUID: K0ix2oeZTHqN1hfWmsyJIg==
X-CSE-MsgGUID: tFO8FhPUTDGLqaHl2jLpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199176804"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:39:02 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 01/12] drm/xe/gt: Add engine masks for each class
Date: Thu, 18 Dec 2025 14:38:47 -0800
Message-ID: <20251218223846.1146344-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
References: <20251218223846.1146344-14-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Follow up patches will need the engine masks for VCS and VECS engines.
Since we already have a macro for the CCS engines, just extend the same
approach to all classes.

To avoid confusion with the XE_HW_ENGINE_*_MASK masks, the new macros
use the _INSTANCES suffix instead. For consistency, rename CCS_MASK to
CCS_INSTANCES as well.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h          | 9 ++++++++-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 2 +-
 drivers/gpu/drm/xe/xe_guc.c         | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 2 +-
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 94969ddd9d88..a2ba80c954a6 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -20,7 +20,14 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+#define XE_ENGINE_INSTANCES_FROM_MASK(gt, NAME) \
+	(((gt)->info.engine_mask & XE_HW_ENGINE_##NAME##_MASK) >> XE_HW_ENGINE_##NAME##0)
+
+#define RCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, RCS)
+#define VCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, VCS)
+#define VECS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, VECS)
+#define CCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, CCS)
+#define GSCCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, GSCCS)
 
 #define GT_VER(gt) ({ \
 	typeof(gt) gt_ = (gt); \
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 50fffc9ebf62..91ac22ef5703 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -17,7 +17,7 @@
 static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 {
 	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
-	int num_slices = hweight32(CCS_MASK(gt));
+	int num_slices = hweight32(CCS_INSTANCES(gt));
 	struct xe_device *xe = gt_to_xe(gt);
 	int width, cslice = 0;
 	u32 config = 0;
@@ -59,7 +59,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
 
 			/* If a slice is fused off, leave disabled */
-			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
+			while ((CCS_INSTANCES(gt) & BIT(cslice)) == 0)
 				cslice++;
 
 			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
@@ -94,7 +94,7 @@ num_cslices_show(struct device *kdev,
 {
 	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
 
-	return sysfs_emit(buf, "%u\n", hweight32(CCS_MASK(gt)));
+	return sysfs_emit(buf, "%u\n", hweight32(CCS_INSTANCES(gt)));
 }
 
 static DEVICE_ATTR_RO(num_cslices);
@@ -131,7 +131,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 	 * Ensure number of engines specified is valid and there is an
 	 * exact multiple of engines for slices.
 	 */
-	num_slices = hweight32(CCS_MASK(gt));
+	num_slices = hweight32(CCS_INSTANCES(gt));
 	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
 		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
 			  num_engines, num_slices);
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f8779852cf0d..ef3b853f5c8c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -17,7 +17,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
 static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
 {
 	/* Check if there are more than one compute engines available */
-	return hweight32(CCS_MASK(gt)) > 1;
+	return hweight32(CCS_INSTANCES(gt)) > 1;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 09ac092c3687..44360437beeb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -175,7 +175,7 @@ static bool needs_wa_dual_queue(struct xe_gt *gt)
 	 * the DUAL_QUEUE_WA on all newer platforms on GTs that have CCS engines
 	 * to move management back to the GuC.
 	 */
-	if (CCS_MASK(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
+	if (CCS_INSTANCES(gt) && GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 43fd2069f9b2..d6cfc3481ace 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -407,7 +407,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
 
 	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
 
-	if (CCS_MASK(guc_to_gt(guc)))
+	if (CCS_INSTANCES(guc_to_gt(guc)))
 		emit = emit_render_compute_yield_klv(emit);
 
 	count = emit - data;
-- 
2.43.0

