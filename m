Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39F4CF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B862110E05C;
	Mon, 30 Sep 2024 05:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHUrVyZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90710E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673236; x=1759209236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Uy4yIU3wIsYC2xJdEhKDw6NjZrl/3l6D+tPC52YRe4=;
 b=PHUrVyZ9Y0suoeNrbamyUrtrpZvkNwffvm9P5ZWCr+7N1no8F6l6uwHr
 qJrSOD0zWOT3Kz2pELPBkycfyEThsbDfyJEls+72308rF6fSQ23ljFiEo
 T5xt1AdvfSU153/ysg6e21xIu2Zlj6g3XwKMstIZEuL4r3TctG161tz4f
 2hAkwPTsQTw7/wKBBJDvTg1RDq+CRP3EjaEDWytx2HHDWzxlhZIQLZAhV
 Wzu6T3QfQBf/6HL4eWSIpG5d7jtIGhQQ48en8BhD55RxCSqNQDFStS/yY
 tuAtOxxoabK4EhPVQGThJ3bkvhQUdHRvFS20hOLuTMXfanUdB8/XYq1kY Q==;
X-CSE-ConnectionGUID: igNoPpoOQuG5ASK0VgJOIw==
X-CSE-MsgGUID: J3Gy1eIuRmKxjx0jmbWmOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367976"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:55 -0700
X-CSE-ConnectionGUID: jaJotCdsTzWB/t1SBGGGGA==
X-CSE-MsgGUID: bQOqyki6SJmCmDPr6UYgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752203"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 15/25] drm/xe/guc: Update handling of xe_force_wake_get
 return
Date: Mon, 30 Sep 2024 11:01:39 +0530
Message-Id: <20240930053149.1246339-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

A non-zero return value in the case of XE_FORCEWAKE_ALL does not
necessarily indicate success. Use xe_force_wake_ref_has_domain() to
determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()
- Remove redundant xe_gt_WARN_ON

v6
- use helper xe_force_wake_ref_has_domain()

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 13 +++++----
 drivers/gpu/drm/xe/xe_guc_pc.c | 50 +++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c2ddf883702b..3b39e5e33799 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -247,10 +247,11 @@ static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
+	unsigned int fw_ref;
 
-	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
-	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -1150,14 +1151,14 @@ int xe_guc_start(struct xe_guc *guc)
 void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
+	unsigned int fw_ref;
 	u32 status;
-	int err;
 	int i;
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
@@ -1178,7 +1179,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2b654f820ae2..e8b9faeaef64 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -415,22 +415,24 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
-	int ret;
+	unsigned int fw_ref;
 
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		return ret;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		return -ETIMEDOUT;
+	}
 
 	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
 
 	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
 	*freq = decode_freq(*freq);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
 }
 
@@ -480,6 +482,7 @@ u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
 int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
+	unsigned int fw_ref;
 	int ret;
 
 	mutex_lock(&pc->freq_lock);
@@ -493,9 +496,11 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	 * GuC SLPC plays with min freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		goto out;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		ret = -ETIMEDOUT;
+		goto fw;
+	}
 
 	ret = pc_action_query_task_state(pc);
 	if (ret)
@@ -504,7 +509,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = pc_get_min_freq(pc);
 
 fw:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 out:
 	mutex_unlock(&pc->freq_lock);
 	return ret;
@@ -855,6 +860,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
+	unsigned int fw_ref;
 	int ret = 0;
 
 	if (xe->info.skip_guc_pc)
@@ -864,13 +870,15 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		return ret;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		return -ETIMEDOUT;
+	}
 
 	xe_gt_idle_disable_c6(gt);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	return 0;
 }
@@ -956,13 +964,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	unsigned int fw_ref;
 	int ret;
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		return ret;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		return -ETIMEDOUT;
+	}
 
 	if (xe->info.skip_guc_pc) {
 		if (xe->info.platform != XE_PVC)
@@ -1005,7 +1016,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
 
 out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return ret;
 }
 
@@ -1037,18 +1048,19 @@ static void xe_guc_pc_fini_hw(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
+	unsigned int fw_ref;
 
 	if (xe_device_wedged(xe))
 		return;
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
+	fw_ref = xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	xe_guc_pc_gucrc_disable(pc);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
 	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
 
-	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
 
 /**
-- 
2.34.1

