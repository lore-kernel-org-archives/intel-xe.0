Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADCCC5B572
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 13:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B510EB96;
	Tue, 11 Aug 2026 13:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWFQFfGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03C10EB96
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786453223; x=1817989223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jGRy2IX9uk8U7UwQeeqAFoCDPl7RdIXYQdKR2v8lCCs=;
 b=nWFQFfGtWqLN+n7ZCbyPBVflWZ0/LKruR74ZZgom1vmEo6FRXNrApQWi
 S6PH/TjO/w9epbrU50PdsOf8tDiLGxYdgfpEnNm0fAaYhlIlPNdF4ge/G
 yhWmVw167ZDCio+uiV29RNDpVCDuCd6vaEC0lESBAivre8c8JldgBOywa
 xnYWSFyFBAdo9Cl0PrxX7K1imL9WBSEzl2tpkTrMqsxRVQQudlbJxt7P3
 wmCueRvcmso8Js4AlxvEHjqenhbK5Z3MDRQg6Pozj3/0VgQHAKCnik3YC
 RKFmTzVdnXULESYu9Erx4+UrcMcSWsXGYIFIOMULCh8UdPGkUTf4MHbbO w==;
X-CSE-ConnectionGUID: /G3uoAsaTvWYHlZ5OJBXMg==
X-CSE-MsgGUID: kkcPWX6QQH6Hw+eQ8ja7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87006978"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87006978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:00:23 -0700
X-CSE-ConnectionGUID: 0xOFADedQRyrxm21AfXw5w==
X-CSE-MsgGUID: XRQRGNVrREGkUjr1uRsS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266819269"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 11 Aug 2026 06:00:21 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT
Date: Tue, 11 Aug 2026 19:07:56 +0530
Message-ID: <20260811133753.1742666-6-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811133753.1742666-4-nitin.r.gote@intel.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
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

EXEC_QUEUE_FLAG_PERMANENT used to mark kernel-owned exec queues that were
only torn down at driver unload, so that guc_exec_queue_destroy() could
take a synchronous teardown path for them while user queues went through
the async destroy worker.

Exec-queue teardown now routes every queue through the single
message-based path (with the message layer gating any HW/H2G work behind
drm_dev_enter()/drm_dev_exit() and taking a runtime-PM reference only
while the device is bound), so the PERMANENT flag no longer has any effect.
Drop it and all its users, and renumber the remaining flags to keep the
bit range contiguous.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  3 ---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 ++++++--------
 drivers/gpu/drm/xe/xe_gsc.c              |  3 +--
 drivers/gpu/drm/xe/xe_migrate.c          |  2 --
 drivers/gpu/drm/xe/xe_pxp_submit.c       |  5 ++---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  1 -
 drivers/gpu/drm/xe/xe_vm.c               |  1 -
 7 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9f3d022a1463..c4213bb9c137 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -207,9 +207,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	struct xe_gt *gt = hwe->gt;
 	int err;
 
-	/* only kernel queues can be permanent */
-	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
-
 	q = kzalloc_flex(*q, lrc, width);
 	if (!q)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index b2276559c2f6..95f75d61a647 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -135,20 +135,18 @@ struct xe_exec_queue {
 
 /* queue used for kernel submission only */
 #define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
-/* kernel engine only destroyed at driver unload */
-#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(2)
+#define EXEC_QUEUE_FLAG_VM			BIT(1)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(2)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
 /* flag to indicate low latency hint to guc */
-#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
 /* for migration (kernel copy, clear, bind) jobs */
-#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
 /* for programming COMMON_SLICE_CHICKEN3 on first submission */
-#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
+#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index aab59dc647fb..524ac56bdcc7 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -478,8 +478,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 
 	q = xe_exec_queue_create(xe, NULL,
 				 BIT(hwe->logical_instance), 1, hwe,
-				 EXEC_QUEUE_FLAG_KERNEL |
-				 EXEC_QUEUE_FLAG_PERMANENT, 0);
+				 EXEC_QUEUE_FLAG_KERNEL, 0);
 	if (IS_ERR(q)) {
 		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
 		return PTR_ERR(q);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f79d0047bec6..75b83687f1b5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -493,7 +493,6 @@ int xe_migrate_init(struct xe_migrate *m)
 		 */
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
 					    EXEC_QUEUE_FLAG_KERNEL |
-					    EXEC_QUEUE_FLAG_PERMANENT |
 					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
 					    EXEC_QUEUE_FLAG_MIGRATE |
 					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
@@ -501,7 +500,6 @@ int xe_migrate_init(struct xe_migrate *m)
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
-						  EXEC_QUEUE_FLAG_PERMANENT |
 						  EXEC_QUEUE_FLAG_MIGRATE, 0);
 	}
 	if (IS_ERR(m->q)) {
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index e60526e30030..5de86a8cf27d 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -46,7 +46,7 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
 		return -ENODEV;
 
 	q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
-				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
+				 EXEC_QUEUE_FLAG_KERNEL, 0);
 	if (IS_ERR(q))
 		return PTR_ERR(q);
 
@@ -144,8 +144,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 	}
 
 	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
-				 EXEC_QUEUE_FLAG_KERNEL |
-				 EXEC_QUEUE_FLAG_PERMANENT, 0);
+				 EXEC_QUEUE_FLAG_KERNEL, 0);
 	if (IS_ERR(q)) {
 		err = PTR_ERR(q);
 		goto bo_out;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index a8c831fbee3b..a54138461f44 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -354,7 +354,6 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx->ctx_id = ctx_id;
 
 		flags = EXEC_QUEUE_FLAG_KERNEL |
-			EXEC_QUEUE_FLAG_PERMANENT |
 			EXEC_QUEUE_FLAG_MIGRATE;
 		q = xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
 		if (IS_ERR(q)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e0176861cb6..cb6db353147e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4955,7 +4955,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	/* User VMs and queues only */
 	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
-	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
 	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
 	xe_assert(xe, vm->xef);
-- 
2.50.1

