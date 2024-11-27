Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B12D609AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB68410EA1A;
	Wed, 27 Nov 2024 08:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fF5Y6fVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2112A10EA1A
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694996; x=1764230996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IE2tx5z/KsA6NhO4ddURD2yV9UBex8rOtymzIGVB1yA=;
 b=fF5Y6fVknEIA9RyTqlaXJ5ItyWyXQRzQNnepCLYEpIf3BP/vlWgGRImk
 7P4cEb0Ul1yjq2x4/jfedbXZkYtJdjBvHcDxZc+oJDXzbW50SFaGED8Jo
 +0yyrQCL180n3dWVyDNsShLxipCvFq2dzyKTfwo4Morvg3dViJs/IX1Nq
 6wukwUofTDN+aKfdtiL3ZPlTsQqSILIropIqGVPFWJszKApzNlTKjk4Hs
 f3I48cleypRmGhIsM4f7HbPmYVBj69nEETI+9HWrjn9zchx24avvCs6xp
 YJAC1h2s/GP8RnrgVD433Ew/M4nJ3cX3Fa1Sk2XGHHnGzsIiYCXWzCoJp A==;
X-CSE-ConnectionGUID: V5HZ4aCLSHaBTlbT6C65EA==
X-CSE-MsgGUID: WGj8hMPqR5G02WYnkibwrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36810246"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36810246"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:09:56 -0800
X-CSE-ConnectionGUID: o2MiletMTTyDSOc82J0Ndw==
X-CSE-MsgGUID: vNMdM+/CQtukpFuEq2oaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92689710"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 00:09:54 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] Revert "drm/xe: Move the coredump registration to the
 worker thread"
Date: Wed, 27 Nov 2024 14:00:41 +0530
Message-Id: <20241127083042.358726-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
References: <20241127083042.358726-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This reverts commit e7c5f5ac82a9a763207eb30b194500fad48fbc88. The commit
was accidentally and unintentionally pushed.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 63 +++++++++++++----------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5d19a4e3d5af..f4c77f525819 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -167,6 +167,31 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	ss->vm = NULL;
 }
 
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+	unsigned int fw_ref;
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
+
+	/* Calculate devcoredump size */
+	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
+
+	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
+	if (!ss->read.buffer)
+		return;
+
+	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
+	xe_devcoredump_snapshot_free(ss);
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -215,40 +240,6 @@ static void xe_devcoredump_free(void *data)
 		 "Xe device coredump has been deleted.\n");
 }
 
-static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
-{
-	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
-	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
-	unsigned int fw_ref;
-
-	/*
-	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
-	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
-	 * thread and not in the initial capture call.
-	 */
-	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
-			      xe_devcoredump_read, xe_devcoredump_free,
-			      XE_COREDUMP_TIMEOUT_JIFFIES);
-
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
-
-	/* Calculate devcoredump size */
-	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
-
-	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
-	if (!ss->read.buffer)
-		return;
-
-	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
-	xe_devcoredump_snapshot_free(ss);
-}
-
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 				 struct xe_exec_queue *q,
 				 struct xe_sched_job *job)
@@ -337,6 +328,10 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
+
+	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
+			      xe_devcoredump_read, xe_devcoredump_free,
+			      XE_COREDUMP_TIMEOUT_JIFFIES);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
-- 
2.34.1

