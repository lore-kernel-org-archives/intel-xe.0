Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F86D3B7E5
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ECA10E30F;
	Sat,  6 Dec 2025 23:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXE2ZqCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925410E30F
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062249; x=1796598249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Shoy5PMzgXlEzPjKY+t7mDE6Z7ic+cxOotnJFPMMCJc=;
 b=HXE2ZqCT6yGXqmtkf7QToFkZMX8ZBwnVeZNrRqVxFsOqK7493rwThFdy
 p7mihb8vMtGjWsnYkuhszo/ho5qbve1hcM535go3jzHpbUQuwHbfMmMB6
 xm+F3o4yU4x3Y3t4pnuObdqRTOgG236x/RPlIlsnQXI7T/O2eteM5vbpR
 ZARznFJaTuoiTV6gPzUKYBrDHKVRhBfQHWD1NUmeUuNTGSnFHSJLM2xBy
 xwXmvBDK4M1i8H2/khFkyiGA1/efie1oALNUnb2hEVELIPhWq0gO9XMMN
 +5twkvh9vvJaxdecfII10KVJtN65WxT/rWxDYk0kCDnNzQutWWh1YPh+g A==;
X-CSE-ConnectionGUID: EfOc0FH4TO6ve7wEbWjE+g==
X-CSE-MsgGUID: 73ltm5emQwyYZtxz98k+aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411679"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:09 -0800
X-CSE-ConnectionGUID: B+u/lHgYQuCxWqYojs+C3A==
X-CSE-MsgGUID: B1h9U8hWQtClOl0w7YAArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045494"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:09 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 01/11] drm/xe/gt: Add engine masks for each class
Date: Sat,  6 Dec 2025 15:03:57 -0800
Message-ID: <20251206230356.3600292-14-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

v2: Use _INSTANCES suffix (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h          | 9 ++++++++-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 2 +-
 drivers/gpu/drm/xe/xe_guc.c         | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 2 +-
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 94969ddd9d88..2eeeeeb6b912 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -20,7 +20,14 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+#define __ENGINE_INSTANCES_MASK(gt, name) \
+	(((gt)->info.engine_mask & XE_HW_ENGINE_##name##_MASK) >> XE_HW_ENGINE_##name##0)
+
+#define RCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, RCS)
+#define VCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, VCS)
+#define VECS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, VECS)
+#define CCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, CCS)
+#define GSCCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, GSCCS)
 
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
index 88376bc2a483..ccc914563ca0 100644
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
index 3ca2558c8c96..af43acf7baae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -388,7 +388,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
 
 	*emit++ = XE_GUC_ACTION_UPDATE_SCHEDULING_POLICIES_KLV;
 
-	if (CCS_MASK(guc_to_gt(guc)))
+	if (CCS_INSTANCES(guc_to_gt(guc)))
 		emit = emit_render_compute_yield_klv(emit);
 
 	count = emit - data;
-- 
2.43.0

