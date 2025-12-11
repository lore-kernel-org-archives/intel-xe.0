Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714A5D3E783
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970010E0D0;
	Thu, 11 Dec 2025 01:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0d1D+gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1E10E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418234; x=1796954234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CkSHD1EJJwEthQE/zd1MJx5NH0EmNGwUPDVpQ45ltk8=;
 b=X0d1D+gpAQJ0q+igwvfai6lTfZd3BdEO80rB9fM1vGAEu8qGxfGxhBXx
 fl48HB2Hk19VwdxWK0At7t1Ko7zwYALalIAEXifGjqqzMoaOUfohKC+P4
 s3xI9/QpwJfvpx2Ym0NTo5ncbZE9fzBNJd+rvvHUyKa4y6XHzYZ66+UeO
 cpT2aX7mlNxdniE2udsZG/TGy5gRLzhmRVv4vePhWeK8EVxqFyMvKq7eL
 InKqqGxFAXNZY7aUH+SfHz3g4k/jXTWY4v363sEEIdd7NgOZDOGhyDpsH
 WGCTplL35BvBj8H3kFFpPWvyy5CtMJI+wWZz0xQR+IqqZ0VC2hPvD/PS5 g==;
X-CSE-ConnectionGUID: 5NRkubP6TB2G2kgGkQ6zzw==
X-CSE-MsgGUID: Xn5Gm/5QSbe/cveCvzaW4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244465"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:14 -0800
X-CSE-ConnectionGUID: eSUV1TArQLOHpwMf3c/Q+Q==
X-CSE-MsgGUID: I7UvkNMsTLynqF7X5XiBfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676689"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 01/12] drm/xe/gt: Add engine masks for each class
Date: Wed, 10 Dec 2025 17:57:00 -0800
Message-ID: <20251211015700.34266-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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
---
v2: Use _INSTANCES suffix (Michal)
v3: s/__ENGINE_INSTANCES_MASK/XE_ENGINE_INSTANCES_FROM_MASK/ (Michal)
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
index f0407bab9a0c..fb5ccdb004f8 100644
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
index f3f2c8556a66..bf289c480cd2 100644
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

