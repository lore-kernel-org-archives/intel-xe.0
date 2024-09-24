Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9434CF9C6F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF0110E89B;
	Tue, 24 Sep 2024 11:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMECiaKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5794010E898
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179134; x=1758715134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5DWmPDEamBJj6hHXO4S3H55SR+C0R801pCqF9znFbQ=;
 b=jMECiaKMe8iy83WuclmR+jWsWurmkVm3KEBXeq8plIzG3AwNb7MXDSiy
 UljUvLSPohn4CkYlDdVswnamP7TARJCekEMsAcfX6iL+L4IVWwKCeWhNN
 g5y16ae59UpeJIDJ6gkkRlA8P+cXmJJZvEc8hzTOprriACi3nWPAR+iX3
 2iZEQWH7o+eqAUFOqeNBx/rVCb/GiE0T7rxKap6xtzZnPO4QO6rB6LDNb
 QXqRjCXIfaNLJs2s3h0Uk7ME3lOe1Dc9bMr56wkbbJ7s/V0MeWuU9eAaR
 UlCvE1XRoC5kzFzFFGg8/FG/WGcj0o5gZn52yCFhr9FaB7LiPJTJpZyGk Q==;
X-CSE-ConnectionGUID: shlgiG80SDOkipt6EvlMvQ==
X-CSE-MsgGUID: H5SuKCfjScik3lCFLjMwqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957026"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:54 -0700
X-CSE-ConnectionGUID: BeQo8SdOSU+rfd56aKqwww==
X-CSE-MsgGUID: 9FSefO4JRL6ylBdThB8pHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319191"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 13/23] drm/xe/guc: Update handling of xe_force_wake_get
 return
Date: Tue, 24 Sep 2024 17:46:31 +0530
Message-Id: <20240924121641.1045763-14-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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
necessarily indicate success. Compare the return value with
XE_FORCEWAKE_ALL to determine the status of the call.

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

v5
- return unsigned int from xe_force_wake_get()
- Remove redundant xe_gt_WARN_ON

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 13 +++++----
 drivers/gpu/drm/xe/xe_guc_pc.c | 50 +++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b6cd5e941f19..e5061aade3de 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -246,10 +246,11 @@ static void guc_fini_hw(void *arg)
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
@@ -1149,14 +1150,14 @@ int xe_guc_start(struct xe_guc *guc)
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
@@ -1177,7 +1178,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2b654f820ae2..3605f0c3f8fc 100644
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
+	if (fw_ref != XE_FORCEWAKE_ALL) {
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
+	if (fw_ref != XE_FORCEWAKE_ALL) {
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
+	if (fw_ref != XE_FORCEWAKE_ALL) {
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
+	if (fw_ref != XE_FORCEWAKE_ALL) {
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

