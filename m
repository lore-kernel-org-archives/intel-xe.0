Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DA6CD5BB1
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776410F749;
	Fri, 22 May 2026 12:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJsU/Rjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2C10F72C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453461; x=1810989461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ctRgI//z+Awy+49pat6lz5Hyob9oBucdYOj9kf3Mys=;
 b=eJsU/RjrIMcPwmzadsl0kkjHpt5xAMHMJdCipeaK9SCPaB0Quy8v2D15
 fXDWPL1LoTLTJpxNlKDG7CocAzBz/wJOxuej0fcRCUdCsOQwXqkPuQ3uP
 f9y+DINsyNAQ5rT7kEmTSGpr/bkdFDNF69q/13n+mjkrS0jq9fXEZKihA
 LGsSa692lncXfH5y0PHpfK1tzKfDpvdwDNPTvXqzwUNyIWnkDAlYXYST5
 f6xWDtYc/6I+Bo8FEKTgrqbprnRIUsbQsLxjnBcssTz2yqWSqA3l3xju+
 wIv7JReJhZqGBbPEHFdixm4tU6N36NsTTIIPKNBU/Ld8W/KuI2aEPA3eC g==;
X-CSE-ConnectionGUID: e0IxUecuQs2oxUDKZn2cwA==
X-CSE-MsgGUID: RvRSvbb4SnCm+85OiOOAcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264590"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:40 -0700
X-CSE-ConnectionGUID: APd19i2ET/uboYHuVa3N1A==
X-CSE-MsgGUID: wnHunoZqR66YQK1rs84yTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302160"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 06/10] drm/xe/guc: handle guc logical instance for paging
 engine
Date: Fri, 22 May 2026 13:37:27 +0100
Message-ID: <20260522123720.39656-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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

In the GuC backend, we need a special logical instance when referring to
the reserved paging engine. Under the hood this is still just the same
physical BSC engine, however from the POV of the GuC this is actually
re-mapped as a separate GUC_PAGING_CLASS, with the logical index
starting from zero.

We don't want to leak this into the upper layers, since this is GuC
version specific,  so this really should be hidden on the GuC side, with
upper layers still being able to reference this as a normal BCS engine.

No functional change.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  3 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  3 ++-
 drivers/gpu/drm/xe/xe_guc.h                 |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c             | 22 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  6 ++++--
 5 files changed, 30 insertions(+), 5 deletions(-)

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
index 996eb58f5484..8dd6400827be 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -535,6 +535,23 @@ u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
 	}
 }
 
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
 /*
  * Write the offsets corresponding to the golden LRCs. The actual data is
  * populated later by guc_golden_lrc_populate()
@@ -603,11 +620,14 @@ static void guc_mapping_table_init(struct xe_gt *gt,
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
-- 
2.54.0

