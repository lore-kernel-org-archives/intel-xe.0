Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBDECA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D58A10E733;
	Wed, 17 Sep 2025 03:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0QKo1PH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF5110E409
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lp3n9JYMR26UaSyiRosJol9BoNlZWwCxq3ixwxaZSOs=;
 b=W0QKo1PHLyUDGTtqhjhxo2SrowkbDikm9P3/kzVm9XWIif7sD9YKBgDq
 MuS0lWmZErGdhTZZaP54xvI8Ycxsvx1lter3o5WbrSm64dR8wPrp2653R
 hqoog4E3jxC5xxcGMGygBZOtbPKxhHlGWL3uFkx9EvRBrGlZKM7ZW0HLq
 YsS0pOrhfvSI1ghBO4IPL1H9iwsqEvhW5Eg0LoYcZ/9uqsI8IHLSv9Ueh
 j96ROqcBgzTM6emkCMEHDH1n9kP7ad609UhJpfSOBV6M63HsSFBbPeuXH
 IiGe2MkQNS9lauUbJxtERPaoX/uCpI1oZ9TIgTBdnuzmJMqAvgObCZTAL g==;
X-CSE-ConnectionGUID: InBE77QrQCistXv3bQPfIg==
X-CSE-MsgGUID: mj55Dh5ITVOrs5ixLLVNAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060795"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: KDmSuFDOS5iQ8BTil6lu4w==
X-CSE-MsgGUID: oyZxYj3UTI2p7WhJ9Nnt5g==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/28] drm/xe/vf: Remove memory allocations from VF post
 migration recovery
Date: Tue, 16 Sep 2025 20:46:00 -0700
Message-Id: <20250917034615.3977603-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 29 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov.c             |  8 +++++--
 drivers/gpu/drm/xe/xe_sriov_vf.c          | 14 ++++++++---
 drivers/gpu/drm/xe/xe_sriov_vf.h          |  2 +-
 6 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9134dd28444f..6c158e753cdd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1223,17 +1223,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
+	void *buf = gt->sriov.vf.migration.lrc_wa_bb;
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
@@ -1241,12 +1237,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
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
@@ -1323,15 +1317,28 @@ static void migration_worker_func(struct work_struct *w)
 /**
  * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
  * @gt: the &xe_gt
+ *
+ * Return 0 on success, errno on failure
  */
-void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
+int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 {
+	void *buf;
+
+	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
+			   post_migration_scratch_size(gt_to_xe(gt)),
+			   GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	gt->sriov.vf.migration.lrc_wa_bb = buf;
 	init_rwsem(&gt->sriov.vf.self_config.lock);
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
 
 	if (!vf_migration_supported())
 		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
+
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 2ac6775b52f0..195dbebe941e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -23,7 +23,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
-void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
+int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 53680a2f188a..496b657119de 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued */
 	spinlock_t lock;
+	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
+	void *lrc_wa_bb;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 7d2d6de2aabf..358a35c80d5a 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -116,8 +116,12 @@ int xe_sriov_init(struct xe_device *xe)
 			return err;
 	}
 
-	if (IS_SRIOV_VF(xe))
-		xe_sriov_vf_init_early(xe);
+	if (IS_SRIOV_VF(xe)) {
+		int err = xe_sriov_vf_init_early(xe);
+
+		if (err)
+			return err;
+	}
 
 	xe_assert(xe, !xe->sriov.wq);
 	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 7d91553c4acc..e622a7c562c4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -180,16 +180,24 @@ static void vf_migration_init_early(struct xe_device *xe)
 /**
  * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
  * @xe: the &xe_device to initialize
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
-void xe_sriov_vf_init_early(struct xe_device *xe)
+int xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
+	int err;
 
-	for_each_gt(gt, xe, id)
-		xe_gt_sriov_vf_migration_init_early(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_vf_migration_init_early(gt);
+		if (err)
+			return err;
+	}
 
 	vf_migration_init_early(xe);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 4df95266b261..13969c6910ce 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -11,7 +11,7 @@
 struct dentry;
 struct xe_device;
 
-void xe_sriov_vf_init_early(struct xe_device *xe);
+int xe_sriov_vf_init_early(struct xe_device *xe);
 int xe_sriov_vf_init_late(struct xe_device *xe);
 bool xe_sriov_vf_migration_supported(struct xe_device *xe);
 void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
-- 
2.34.1

