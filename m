Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9FACCD193
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD5210E69F;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFNbUwDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E477F10E197
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842312; x=1791378312;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dIk8TMicjtz7qPObrJCoUDLroKf3o/Pi+PRMX5hSss0=;
 b=JFNbUwDGj6ufZcm3siGtxFY2AGPBD/QhJuvqj4GVGLR5y0cs4c5XH7mV
 Pe6LFghoK6IjUPgeOCBPvQUjujxo6HLzRKcKb5lBA2oJeXiQvt1dX9OKJ
 QAFmBw9NE3pENWnXGT4/bqDa2VutztkODBlxu4+UEn64FfD6XkFaNG/JE
 VkR1Q6i1LVumIYEOTYVQLFnptmCYpwAje2l2Fo10vreIEi8MBbEm8kJoX
 ALoJQ9hTSHOUfEG44vWo1lrHTAB1KxC/Ho2EvQcHRCTqjr7dIbS8oBt4d
 LDQFbl0uujd+9SmpaurTU7zxVZdYwIWi+uTpa4tUGx1VHCCrXJ9PxXIUQ Q==;
X-CSE-ConnectionGUID: 17L6J3NPRDa4I2xfDFmrFg==
X-CSE-MsgGUID: J51rJHU1Q0Ci1AFyVeB/rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639831"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:12 -0700
X-CSE-ConnectionGUID: siHoxPkOQ9CS/adeT7tiQQ==
X-CSE-MsgGUID: cuLAwOsnRRC3bwXJjoE6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576938"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 11/33] drm/xe/vf: Remove memory allocations from VF post
 migration recovery
Date: Tue,  7 Oct 2025 06:04:43 -0700
Message-Id: <20251007130505.2694829-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

VF post migration recovery is the path of dma-fence signaling / reclaim,
avoid memory allocations in this path.

v3:
 - s/lrc_wa_bb/scratch (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 23 +++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1a2cf58f5dfd..31a80d77da36 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1160,17 +1160,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
+	void *buf = gt->sriov.vf.migration.scratch;
 	s64 shift;
-	void *buf;
 	int err;
 
-	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
-	if (!buf)
-		return -ENOMEM;
-
 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
-		goto out;
+		return err;
 
 	shift = xe_gt_sriov_vf_ggtt_shift(gt);
 	if (shift) {
@@ -1178,12 +1174,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
 		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 		if (err)
-			goto out;
+			return err;
 	}
 
-out:
-	kfree(buf);
-	return err;
+	return 0;
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
@@ -1268,9 +1262,18 @@ static void migration_worker_func(struct work_struct *w)
  */
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 {
+	void *buf;
+
 	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		return 0;
 
+	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
+			   post_migration_scratch_size(gt_to_xe(gt)),
+			   GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	gt->sriov.vf.migration.scratch = buf;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index b2c8e8c89c30..e753646debc4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -55,6 +55,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued */
 	spinlock_t lock;
+	/** @scratch: Scratch memory for VF recovery */
+	void *scratch;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
-- 
2.34.1

