Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3413BCD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB74C10F000;
	Thu, 11 Jun 2026 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muGRnW/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8C910EFF2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781194673; x=1812730673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2fcdyE1zuWUQwh7N+OPJO7vixaR36iuYYx3PL6lW4Cw=;
 b=muGRnW/JM0oippZRwahgECCxue7QPUiLax++/R3cAptimdKD/hkTdlwA
 DISCA/+DHPyjg09FQrYsPPGy02GTODP+at5jq2vTecOvPqRnZnjXmZ6ix
 /De/3lK24Ng9iNqgO6opvW1R+ry7SSfCX2LEuUgiVXch5AzEf3PW+JdLz
 G8bKwTC+lxyWzhZGOLk0abwM/gqIeBUBXdZw/XQD/MKCJo9t268H7Hvrh
 qY6HfuSnX0x5y5LVFOrciNPiid2X3mBERFygDR7xd97F8ODKzr+rjiA3s
 VICFPmyXQnLsFT9ClG7VQwjheppUgr8dvHkr4nBoxoJdOoGl0kJ5j/jf1 g==;
X-CSE-ConnectionGUID: fW0BkEm5R1WgXLtUxGydBQ==
X-CSE-MsgGUID: bbYwa+jUSnCHEgLRFAa3YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93402996"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93402996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:53 -0700
X-CSE-ConnectionGUID: slO21j5tTNyiVIj0EHsY5w==
X-CSE-MsgGUID: RI4f6I65QO+HXAUMBMrF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251617053"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 06/10] drm/xe/guc: handle guc logical instance for paging
 engine
Date: Thu, 11 Jun 2026 17:16:41 +0100
Message-ID: <20260611161634.506476-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611161634.506476-12-matthew.auld@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
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

In the GuC backend, we need a different logical instance when referring
to the reserved paging engine. Under the hood, this is still just the
same physical BSC engine, however from the GuC POV this is actually
re-mapped to a separate GUC_PAGING_CLASS, with the logical index
starting from zero.

The idea is to not leak this into the upper layers, since this is GuC
version specific, so the changes here are purely on the GuC side.

No functional change.

v2:
  - Add some kernel-doc to explain the usage.
  - Move the implementation to guc.c

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  3 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 31 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h                 |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c             |  5 +++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++--
 drivers/gpu/drm/xe/xe_hw_engine_types.h     |  7 ++++-
 7 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index f28c7ae0e8c2..0f242db775e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -382,9 +382,10 @@ static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
 	if (group < num_groups) {
 		for_each_hw_engine(hwe, gt, id) {
 			u8 guc_class = xe_hwe_to_guc_class(hwe);
+			u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
 			u32 mask = groups[group].engines[guc_class];
 
-			if (mask & BIT(hwe->logical_instance)) {
+			if (mask & BIT(guc_logical_instance)) {
 				strlcat(engines, hwe->name, sizeof(engines));
 				strlcat(engines, " ", sizeof(engines));
 			}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index cf117bf52d41..cdfe194926d3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -472,6 +472,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
 
 	for_each_hw_engine(hwe, gt, id) {
 		u8 guc_class = xe_hwe_to_guc_class(hwe);
+		u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
 
 		switch (hwe->class) {
 		case XE_ENGINE_CLASS_VIDEO_DECODE:
@@ -490,7 +491,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
 			slice = 0;
 		}
 
-		values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe->logical_instance);
+		values[slice_to_group[slice]].engines[guc_class] |= BIT(guc_logical_instance);
 	}
 
 	*groups = values;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2bc9fa5fb393..847c4d74d169 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1861,6 +1861,37 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	return false;
 }
 
+/**
+ * xe_hwe_guc_logical_instance - Get the GuC-aligned logical instance of a
+ * hardware engine.
+ * @hwe: Hardware engine.
+ *
+ * For GuC backend usage, we should no longer use the raw logical instance
+ * directly. This helper must be used to retrieve the logical instance of the
+ * hardware engine, taking care of any necessary adjustments (such as the GuC
+ * PAGING engine mapping). This is assumed to be used in conjunction with the
+ * GuC engine class.
+ *
+ * Return: Logical instance, taking into account for stuff like GuC PAGING
+ * engine mapping.
+ */
+u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+
+	if (xe_guc_has_paging_engine(&hwe->gt->uc.guc) &&
+	    xe_gt_is_usm_hwe(gt, hwe)) {
+		int shift = gt->usm.paging_hwe0->logical_instance;
+
+		xe_gt_assert(gt, shift <= hwe->logical_instance);
+
+		/* GUC_PAGING_CLASS:guc_logical_instance */
+		return hwe->logical_instance - shift;
+	}
+
+	return hwe->logical_instance;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_guc_g2g_test.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 0934927e8254..61e3ee19a59b 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -69,6 +69,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
 #endif
 
 u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
+u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe);
 
 static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 03fc317265b7..ea4cfb5a9ff8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -592,11 +592,14 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 	guc_mapping_table_init_invalid(gt, info_map);
 
 	for_each_hw_engine(hwe, gt, id) {
+		u16 guc_logical_instance;
 		u8 guc_class;
 
 		guc_class = xe_hwe_to_guc_class(hwe);
+		guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
+
 		info_map_write(xe, info_map,
-			       mapping_table[guc_class][hwe->logical_instance],
+			       mapping_table[guc_class][guc_logical_instance],
 			       hwe->instance);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 150d891d5a09..2feb87492312 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -28,6 +28,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
 	struct engine_activity_buffer *buffer;
 	u16 guc_class = xe_hwe_to_guc_class(hwe);
+	u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
 	size_t offset;
 
 	if (engine_activity->num_functions) {
@@ -39,7 +40,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
 	}
 
 	offset += offsetof(struct guc_engine_activity_data,
-			  engine_activity[guc_class][hwe->logical_instance]);
+			  engine_activity[guc_class][guc_logical_instance]);
 
 	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
 }
@@ -151,8 +152,9 @@ static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine
 	struct xe_guc *guc = &hwe->gt->uc.guc;
 	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
 	u16 guc_class = xe_hwe_to_guc_class(hwe);
+	u16 guc_logical_instance = xe_hwe_guc_logical_instance(hwe);
 
-	return &eag->engine[guc_class][hwe->logical_instance];
+	return &eag->engine[guc_class][guc_logical_instance];
 }
 
 static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2cf898e682f5..f3b7bb785096 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -114,7 +114,12 @@ struct xe_hw_engine {
 	enum xe_engine_class class;
 	/** @instance: physical instance of this hw engine */
 	u16 instance;
-	/** @logical_instance: logical instance of this hw engine */
+	/**
+	 * @logical_instance: logical instance of this hw engine.
+	 *
+	 * Note: For GuC usage, always use xe_hwe_guc_logical_instance().
+	 * For GuC usage, we should no longer use the raw logical instance.
+	 */
 	u16 logical_instance;
 	/** @irq_offset: IRQ offset of this hw engine */
 	u16 irq_offset;
-- 
2.54.0

