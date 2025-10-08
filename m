Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583BCCCD188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095DB10E89B;
	Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuOjRzVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2710E89B
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959941; x=1791495941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Jzoo9uLUtbziH1Ujh4gejoWvEXVAdHL5/ccynqvnr7c=;
 b=JuOjRzVY7H+fUDEBVtfOgofaNwzKSgOIPZp2ON5CToKBwYFQ4aXNSCHI
 h+CgIEptRloE8T4GtPBRcuhw3zRWia8hE7hKe29x2v04rOxDajRJZmxRk
 FVwlXPbMinutqJQYXYrgXD/zlkYaaU5hCZz5ID8NPT1YS9bDqwRFCR0lu
 z4rbl/9MfB/8BsDFi4CvDHigmy5X8BBwrw0fcWJgqkB+6eEnn9mtuDrQv
 L9h3liMULKxAvUXjnmFUVq0kuVwQ9FP0B7J/X5iyviHumhPH4vVHFHBoi
 wnfRpKSh85LLLyOVxmn8k5mr/nKxwxJI1i6aewXKULV2wDNHddfxV4/q2 g==;
X-CSE-ConnectionGUID: j6tFvXFaRje7UKhOIuXWtA==
X-CSE-MsgGUID: knj+kyA/QlehTdsRK9CLRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726853"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:41 -0700
X-CSE-ConnectionGUID: +jHKAwwqTIGlMdLJHvVLUw==
X-CSE-MsgGUID: Qp4DgDlfSp+Nx1MjZ5BWsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635191"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 11/34] drm/xe/vf: Remove memory allocations from VF post
 migration recovery
Date: Wed,  8 Oct 2025 14:45:09 -0700
Message-Id: <20251008214532.3442967-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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
index 93612ea5029f..737243fd3d40 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1165,17 +1165,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
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
@@ -1183,12 +1179,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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
@@ -1273,9 +1267,18 @@ static void migration_worker_func(struct work_struct *w)
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

