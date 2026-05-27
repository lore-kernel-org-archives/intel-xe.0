Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C1CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35D310E78D;
	Wed, 27 May 2026 11:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDfw95za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACE610E780
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779880431; x=1811416431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kluMUKdstQsFlbA+bUkBl9Zv0Td2V+iu8kp/vcxmMTM=;
 b=gDfw95zajeTPDvbc6GAZlQnZjnsmBx9kyS2iUw9Sg7rggLFj3u7h8hOh
 And3c+Wozh6T02iAPB6/geLrLk8hqCWGeEibDRQjvm3slbUdIvzHUP9U0
 YkbyLVBMUMZaBFhd5h+iU2qtG/F3XbHzm2psYdmTNQxpVqCMUz6Y4PeFT
 niVVkLGOQ82Kb/neYMPct+4ny1SQqpS6qoLEhBWd6WUNI33VjS+Fk6F32
 qohzjDsFpvUsJzziN34cysjWDQbMD2a2yjOIkpuuZvoXnUiRAcfr8bSN+
 vVLHFhkZPNvZd5SGRHT5VhD+xvWsarFmp1l0Hq512nhZFm5W4wi8UzEzK g==;
X-CSE-ConnectionGUID: T7Zg8FFITquf9Ipxx0Z/oQ==
X-CSE-MsgGUID: GWcSvE8dTnKwNB7lLTLOMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80612987"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80612987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:51 -0700
X-CSE-ConnectionGUID: xU7lwiQYSKK50e3V4EJGmQ==
X-CSE-MsgGUID: cDy21td4RBSttVRg/2Gxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242371086"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 02/10] drm/xe/guc: refactor to_guc_class() to accept hwe
Date: Wed, 27 May 2026 12:13:38 +0100
Message-ID: <20260527111335.140000-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527111335.140000-12-matthew.auld@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
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

Rather than inferring the GuC engine class from the generic hw engine
class, pass in the hwe itself, which gives the complete view, like
instance etc.  On future GuC versions, there is dedicated PAGING class to
identify the KMD reserved BCS engine, so we need more info here in order
to return the correct GuC specific engine class.

With this everything should now be using the new hwe based interface. No
functional changes.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                 | 21 +---------------
 drivers/gpu/drm/xe/xe_guc_ads.c             | 27 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_capture.c         | 12 ++++-----
 drivers/gpu/drm/xe/xe_guc_capture.h         |  4 +--
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c          |  2 +-
 8 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index ffa27f66bba7..f28c7ae0e8c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -381,7 +381,7 @@ static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
 
 	if (group < num_groups) {
 		for_each_hw_engine(hwe, gt, id) {
-			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+			u8 guc_class = xe_hwe_to_guc_class(hwe);
 			u32 mask = groups[group].engines[guc_class];
 
 			if (mask & BIT(hwe->logical_instance)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index e8458d63742d..cf117bf52d41 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -471,7 +471,7 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
 		return;
 
 	for_each_hw_engine(hwe, gt, id) {
-		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+		u8 guc_class = xe_hwe_to_guc_class(hwe);
 
 		switch (hwe->class) {
 		case XE_ENGINE_CLASS_VIDEO_DECODE:
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 02514914f404..12faf0ba7229 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -67,26 +67,7 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
 int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
 #endif
 
-static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
-{
-	switch (class) {
-	case XE_ENGINE_CLASS_RENDER:
-		return GUC_RENDER_CLASS;
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		return GUC_VIDEO_CLASS;
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		return GUC_VIDEOENHANCE_CLASS;
-	case XE_ENGINE_CLASS_COPY:
-		return GUC_BLITTER_CLASS;
-	case XE_ENGINE_CLASS_COMPUTE:
-		return GUC_COMPUTE_CLASS;
-	case XE_ENGINE_CLASS_OTHER:
-		return GUC_GSC_OTHER_CLASS;
-	default:
-		XE_WARN_ON(class);
-		return -1;
-	}
-}
+u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
 
 static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index b260697dd279..c84b98828981 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -279,7 +279,7 @@ static u32 engine_enable_mask(struct xe_gt *gt, u16 guc_class)
 	u32 mask = 0;
 
 	for_each_hw_engine(hwe, gt, id)
-		if (xe_engine_class_to_guc_class(hwe->class) == guc_class)
+		if (xe_hwe_to_guc_class(hwe) == guc_class)
 			mask |= BIT(hwe->instance);
 
 	return mask;
@@ -494,6 +494,27 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
 			       engine_enable_mask(gt, guc_class));
 }
 
+u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe)
+{
+	switch (hwe->class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return GUC_RENDER_CLASS;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return GUC_VIDEO_CLASS;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return GUC_VIDEOENHANCE_CLASS;
+	case XE_ENGINE_CLASS_COPY:
+		return GUC_BLITTER_CLASS;
+	case XE_ENGINE_CLASS_COMPUTE:
+		return GUC_COMPUTE_CLASS;
+	case XE_ENGINE_CLASS_OTHER:
+		return GUC_GSC_OTHER_CLASS;
+	default:
+		XE_WARN_ON(hwe->class);
+		return -1;
+	}
+}
+
 /*
  * Write the offsets corresponding to the golden LRCs. The actual data is
  * populated later by guc_golden_lrc_populate()
@@ -564,7 +585,7 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 	for_each_hw_engine(hwe, gt, id) {
 		u8 guc_class;
 
-		guc_class = xe_engine_class_to_guc_class(hwe->class);
+		guc_class = xe_hwe_to_guc_class(hwe);
 		info_map_write(xe, info_map,
 			       mapping_table[guc_class][hwe->logical_instance],
 			       hwe->instance);
@@ -814,7 +835,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 		 * 2. Record in the header (ads.reg_state_list) the address
 		 * location and number of entries
 		 */
-		gc = xe_engine_class_to_guc_class(hwe->class);
+		gc = xe_hwe_to_guc_class(hwe);
 		ads_blob_write(ads, ads.reg_state_list[gc][hwe->instance].address, addr);
 		ads_blob_write(ads, ads.reg_state_list[gc][hwe->instance].count, count);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 21f7caf9ea08..50c6b9466c14 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -440,7 +440,7 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
 	 * to be extended
 	 */
 	for_each_hw_engine(hwe, gt, id) {
-		if (xe_engine_class_to_guc_capture_class(hwe->class) ==
+		if (xe_hwe_to_guc_capture_class(hwe) ==
 		    GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
 			has_rcs_ccs = true;
 			break;
@@ -812,7 +812,7 @@ static int guc_capture_output_size_est(struct xe_guc *guc)
 	for_each_hw_engine(hwe, gt, id) {
 		enum guc_capture_list_class_type capture_class;
 
-		capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+		capture_class = xe_hwe_to_guc_capture_class(hwe);
 		capture_size += sizeof(struct guc_state_capture_group_header_t) +
 					 (3 * sizeof(struct guc_state_capture_header_t));
 
@@ -1620,7 +1620,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 	if (!new)
 		return;
 
-	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+	capture_class = xe_hwe_to_guc_capture_class(hwe);
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
 		struct gcap_reg_list_info *reginfo = &new->reginfo[type];
 		/*
@@ -1662,7 +1662,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
 		}
 	}
 
-	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
+	new->eng_class = xe_hwe_to_guc_class(hwe);
 	new->eng_inst = hwe->instance;
 	new->guc_id = guc_id;
 	new->lrca = lrca;
@@ -1826,7 +1826,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 
 	xe_gt_assert(gt, snapshot->hwe);
 
-	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
+	capture_class = xe_hwe_to_guc_capture_class(snapshot->hwe);
 
 	drm_printf(p, "%s (physical), logical instance=%d\n",
 		   snapshot->name ? snapshot->name : "",
@@ -1898,7 +1898,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe != q->hwe)
 			continue;
-		guc_class = xe_engine_class_to_guc_class(hwe->class);
+		guc_class = xe_hwe_to_guc_class(hwe);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index dca97d52b192..eb954f4d1ffd 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -35,9 +35,9 @@ static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16
 }
 
 static inline enum guc_capture_list_class_type
-xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
+xe_hwe_to_guc_capture_class(struct xe_hw_engine *hwe)
 {
-	return xe_guc_class_to_capture_class(xe_engine_class_to_guc_class(class));
+	return xe_guc_class_to_capture_class(xe_hwe_to_guc_class(hwe));
 }
 
 void xe_guc_capture_process(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2b99c1ebdd58..150d891d5a09 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -27,7 +27,7 @@ static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_eng
 {
 	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
 	struct engine_activity_buffer *buffer;
-	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+	u16 guc_class = xe_hwe_to_guc_class(hwe);
 	size_t offset;
 
 	if (engine_activity->num_functions) {
@@ -150,7 +150,7 @@ static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine
 {
 	struct xe_guc *guc = &hwe->gt->uc.guc;
 	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
-	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+	u16 guc_class = xe_hwe_to_guc_class(hwe);
 
 	return &eag->engine[guc_class][hwe->logical_instance];
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806..7dc10cfe98bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -995,7 +995,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
-	info.engine_class = xe_engine_class_to_guc_class(q->class);
+	info.engine_class = xe_hwe_to_guc_class(q->hwe);
 	info.engine_submit_mask = q->logical_mask;
 	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
-- 
2.54.0

