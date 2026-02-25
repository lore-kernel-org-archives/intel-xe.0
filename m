Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE2AFD45FA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 23:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10BA10E845;
	Wed, 25 Feb 2026 23:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFEJLcr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5810E845
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772063411; x=1803599411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4oao1bkEYsKEPiAsgYi1rn6R7pFv0rVCyN6IqdeAkZE=;
 b=iFEJLcr1ectNiYrBLadm5iABM8lJB6tapnX1c1QFV1gf1a5vjKRUzkjq
 ag9i5d0tyNxJ8R+n89gGRQqZXxTuMuJrLNPOS/FwP9bhREwPHiLriYs3I
 nTXOhIbX9W89wKFTA4Rb6+x0hjhWnWxdmW0SOJG2rTOXQJxJc9r7DiUNE
 bOhm5dxlcyVUq0J9TCtIQpCdB6V8wyksR+whwwumbj0O/k46X8i25rYy1
 ZBVkp4aeaCsO6DmjV8lxlow52ktdN9xuJXctiJljHq479YhMnzhGo5wiB
 KAU48A+iWCLh9L7WCELBl8nM0iKGdUxCwUlEg9uNFuFm0XBR/O9Rezjq8 g==;
X-CSE-ConnectionGUID: xovDtJYIR5iCZAAj6aEYew==
X-CSE-MsgGUID: Tc9lirEMQymUd7c4ZG0whg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95730758"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95730758"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 15:50:10 -0800
X-CSE-ConnectionGUID: qzM07G1mS46jEQvWZ9SEbw==
X-CSE-MsgGUID: yZCrq3qEQCmE47KYWTyUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246934354"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 25 Feb 2026 15:50:09 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/4] drm/xe/vf: Redo LRC creation while in VF fixups
Date: Thu, 26 Feb 2026 00:54:47 +0100
Message-Id: <20260225235447.2772383-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260225235447.2772383-1-tomasz.lis@intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
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

If the xe module within a VM was creating a new LRC during save/
restore, this LRC will be invalid. The fixups procedure may not
be able to reach it, as there will be a race to add the new LRC
reference to an exec queue.

Even if the new LRC which was being created during VM migration is
added to EQ in time for fixups, said LRC may still remain damaged.
In a small percentage of specially crafted test cases, the resulting
LRC was still damaged and caused GPU hang.

Any LRC which could be created in such a situation, have to be
re-created.

Due to VM having arbitrarily set amount of CPU cores, it is possible
to limit the amount to 1. In such case, there is a possibility that
kernel will switch CPU contexts in a way which allows to miss
VF migration recovery running in parallel (by simply not switching
to the LRC creation thread during recovery). Therefore checking
if the migration is in progress just after LRC creation, is not
enough to ensure detection.

Free the incorrectly created LRC, and trigger a re-run of the
creation, but only after waiting for default LRC to get fixups.
Use additional atomic value increased after fixups, to ensure any VF
migration that avoided detection by just checking for recovery in
progress, will be caught.

v2: Merge marker and wait for default LRC, reducing amount of calls
  within xe_init_eq(). Alter the LRC creation loop to remove a race
  with post-migration fixups worker.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 29 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 25 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 4 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2cb37af42021..07c6d8bc3ad8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -365,17 +365,28 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 * from the moment vCPU resumes execution.
 	 */
 	for (i = 0; i < q->width; ++i) {
-		struct xe_lrc *lrc;
+		struct xe_lrc *__lrc = NULL;
+		int marker;
 
-		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-				    xe_lrc_ring_size(), q->msix_vec, flags);
-		if (IS_ERR(lrc)) {
-			err = PTR_ERR(lrc);
-			goto err_lrc;
-		}
+		do {
+			struct xe_lrc *lrc;
+
+			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
+
+			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+					    xe_lrc_ring_size(), q->msix_vec, flags);
+			if (IS_ERR(lrc)) {
+				err = PTR_ERR(lrc);
+				goto err_lrc;
+			}
+
+			xe_exec_queue_set_lrc(q, lrc, i);
+
+			if (__lrc)
+				xe_lrc_put(__lrc);
+			__lrc = lrc;
 
-		xe_exec_queue_set_lrc(q, lrc, i);
+		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 7f83c0d3b099..3da38f2ee317 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1277,6 +1277,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
+
 	return 0;
 }
 
@@ -1515,20 +1517,39 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
 	return true;
 }
 
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)
+{
+	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
+	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
+		return 0;
+
+	/* should never match fixups_complete value */
+	if (!vf_valid_ggtt(gt))
+		return -1;
+
+	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
+}
+
 /**
  * xe_gt_sriov_vf_wait_valid_ggtt() - wait for valid GGTT nodes and address refs
  * @gt: the &xe_gt
  */
-void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
+int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 {
 	int ret;
 
+	/*
+	 * this condition shall identical to one in
+	 * xe_vf_migration_fixups_complete_count()
+	 */
 	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
 	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
-		return;
+		return 0;
 
 	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
 					       vf_valid_ggtt(gt),
 					       HZ * 5);
 	xe_gt_WARN_ON(gt, !ret);
+
+	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 7d97189c2d3d..a6f7127521a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -39,6 +39,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
-void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index fca18be589db..0b397f259a26 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
 	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
+	/** @fixups_complete: Counts completed fixups stages */
+	atomic_t fixups_complete;
 	/** @debug: Debug hooks for delaying migration */
 	struct {
 		/**
-- 
2.25.1

