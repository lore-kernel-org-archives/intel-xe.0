Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E56CD98F9
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 04:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D470910EBED;
	Thu, 18 Jun 2026 04:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp4G6tun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ED310EBD9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781756672; x=1813292672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HNYZDV52YxFiudMZsGG/CztPNYk1cBIRyBmoWROk4sw=;
 b=lp4G6tunIDMWqXGOETmVze5dSOJyYpo4W9z7SrfHLaB+9bydbcapeIMu
 6Zn7AMhb9yUPZW0JmCnsvC8srpEM2svQ0VW6/p+UN3fTTXaTarpg+hpG5
 mh5oCZCHJ5mRHEgKqcNr4HKSIq1pa3tDhnJsIbGKMHiK7eKTPyN5tjGA8
 tu4zQJSvucizm/1t9POc0Hsa5T7AKZ+VH6K0xEkKqnK40CihnrpURwad5
 hxAinKDUtUJcXxOUz5+wtTiGG8qKjQ4uL9GLQD2XFIOw8cXRu7gzE2ekP
 lQTU744a9wClCAVXzdDqh1bTq8UbBuYMWPUdSF1FxAC2MmGCMljxVJQn0 w==;
X-CSE-ConnectionGUID: tQz8d9oMReyUoPqBQEpl+w==
X-CSE-MsgGUID: KL19b8obRaGG8XbNBNKZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="70099573"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="70099573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:24:32 -0700
X-CSE-ConnectionGUID: i/RxmnKqQayhCrx4VGNFLg==
X-CSE-MsgGUID: GCvoxxjdQf6o4/lo03+/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="241885276"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 21:24:31 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	stuart.summers@intel.com
Subject: [PATCH] drm/xe: Add debugfs knob to disable Mid-Thread Preemption per
 GT
Date: Thu, 18 Jun 2026 09:54:21 +0530
Message-ID: <20260618042421.483657-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a per-GT debugfs entry 'disable_mtp' that forces thread-group
preemption granularity on Xe2+ RCS/CCS engines by writing CS_CHICKEN1
via MI_LRI into the WA BB of each newly created LRC.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 32 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++++++
 drivers/gpu/drm/xe/xe_lrc.c        | 24 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f45306308cd6..e8f7ba6fc3c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -334,6 +334,37 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+static int disable_mtp_get(void *data, u64 *val)
+{
+	struct xe_gt *gt = data;
+
+	*val = gt->disable_mtp;
+
+	return 0;
+}
+
+static int disable_mtp_set(void *data, u64 val)
+{
+	struct xe_gt *gt = data;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (GRAPHICS_VER(xe) < 20)
+		return -EOPNOTSUPP;
+
+	if (!(gt->info.engine_mask & (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)))
+		return -EOPNOTSUPP;
+
+	gt->disable_mtp = !!val;
+	drm_dbg(&gt_to_xe(gt)->drm, "GT%u: disable_mtp=%u: new LRCs will %s MTP\n",
+		gt->info.id, !!val, !!val ? "disable" : "enable");
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(disable_mtp_fops,
+			 disable_mtp_get,
+			 disable_mtp_set,
+			 "%llu\n");
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -366,6 +397,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
+	debugfs_create_file("disable_mtp", 0600, root, gt, &disable_mtp_fops);
 
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e5588c88800a..4f6d63b614f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -219,6 +219,14 @@ struct xe_gt {
 	 */
 	u32 ccs_mode;
 
+	/**
+	 * @disable_mtp: Force thread-group preemption granularity by disabling
+	 * Mid-Thread Preemption on newly created LRCs.
+	 *
+	 * Xe2+ RCS/CCS only, controlled via debugfs.
+	 */
+	bool disable_mtp;
+
 	/** @usm: unified shared memory state */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..893456dad6a5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1262,6 +1262,29 @@ static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
 	return emit(gt, batch) - batch;
 }
 
+static ssize_t setup_disable_mtp_wa(struct xe_lrc *lrc,
+				    struct xe_hw_engine *hwe,
+				    u32 *batch, size_t max_len)
+{
+	struct xe_gt *gt = lrc->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 *cmd = batch;
+
+	if (!gt->disable_mtp || GRAPHICS_VER(xe) < 20 ||
+	    (hwe->class != XE_ENGINE_CLASS_RENDER &&
+	     hwe->class != XE_ENGINE_CLASS_COMPUTE))
+		return 0;
+
+	if (xe_gt_WARN_ON(gt, max_len < 3))
+		return -ENOSPC;
+
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);
+	*cmd++ = CS_CHICKEN1(0).addr;
+	*cmd++ = REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, PREEMPT_GPGPU_THREAD_GROUP_LEVEL);
+
+	return cmd - batch;
+}
+
 struct bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -1342,6 +1365,7 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
 		{ .setup = setup_timestamp_wa },
 		{ .setup = setup_invalidate_state_cache_wa },
 		{ .setup = setup_utilization_wa },
+		{ .setup = setup_disable_mtp_wa },
 		{ .setup = setup_configfs_post_ctx_restore_bb },
 	};
 	struct bo_setup_state state = {
-- 
2.43.0

