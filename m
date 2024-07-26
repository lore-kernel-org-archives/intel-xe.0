Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD7C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 05:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F3A10E351;
	Fri, 26 Jul 2024 05:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3XeiILR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1C910E351
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 05:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721971215; x=1753507215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KAUGpUbuB2bczULOIle9uQKPzLUciFWr19x4x9+9YhA=;
 b=W3XeiILRh+r2NzP4de42iYyQohytsXjiPPBZvdf0S18OMWjmYd0tvp3L
 PP2ZDCYu/9gYOzradrQgzu2X9sUaNt4Xek/M8qs9uuBlGnpUUPXGieSDY
 d737mQ408VYhlEsU5EVaL5QGnQewU+DrKxmnY5uvAySShgyRalCCj4RXc
 17X3GFIt3dSYIMbUe2Itp82tO6VPLGa9gInaVRn8rg5nY1qKX2aLf0Frz
 dUSM+/J01ld0rc66N2AI35qlsoja905C1Ja2GHIz0m/Ig/i2YWoqzhe64
 ne6Y1jx0Ghnqt9SHizDtAWXuF3aWRZW8taqqRCA/kEIpbypKey5XQpN3r A==;
X-CSE-ConnectionGUID: UNIljgZySwaxG/Pt06/Tgg==
X-CSE-MsgGUID: 6hdzAWbPQcqagAayXoy8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19887189"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19887189"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 22:20:15 -0700
X-CSE-ConnectionGUID: bYOIXjkKTIymhBl9/HkIuw==
X-CSE-MsgGUID: JziNDI12Sf6T8Y/e34FyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53233424"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 22:20:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, paulo.r.zanoni@intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2] drm/xe: Faster devcoredump
Date: Thu, 25 Jul 2024 22:21:01 -0700
Message-Id: <20240726052101.2069493-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The current algorithm to read out devcoredump is O(N*N) where N is the
size of coredump due to usage of the drm_coredump_printer in
xe_devcoredump_read. Switch to a O(N) algorithm which prints the
devcoredump into a readable format in snapshot work and update
xe_devcoredump_read to memcpy from the readable format directly.

v2:
 - Fix double free on devcoredump removal (Testing)
 - Set read_data_size after snap work flush
 - Adjust remaining in iterator upon realloc (Testing)
 - Set read_data upon realloc (Testing)

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 140 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_devcoredump.h       |  13 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
 drivers/gpu/drm/xe/xe_vm.c                |   9 +-
 drivers/gpu/drm/xe/xe_vm.h                |   4 +-
 5 files changed, 136 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d8d8ca2c19d3..6af161250a9e 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+static void __xe_devcoredump_read(char *buffer, size_t count,
+				  struct xe_devcoredump *coredump)
 {
-	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
-
-	/* keep going if fw fails as we still want to save the memory and SW data */
-	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
-		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
-	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
-	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
-}
-
-static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
-				   size_t count, void *data, size_t datalen)
-{
-	struct xe_devcoredump *coredump = data;
 	struct xe_device *xe;
 	struct xe_devcoredump_snapshot *ss;
 	struct drm_printer p;
@@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct timespec64 ts;
 	int i;
 
-	if (!coredump)
-		return -ENODEV;
-
 	xe = coredump_to_xe(coredump);
 	ss = &coredump->snapshot;
 
-	/* Ensure delayed work is captured before continuing */
-	flush_work(&ss->work);
-
 	iter.data = buffer;
 	iter.offset = 0;
-	iter.start = offset;
+	iter.start = 0;
 	iter.remain = count;
 
 	p = drm_coredump_printer(&iter);
@@ -129,15 +110,86 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
 	drm_printf(&p, "\n**** VM state ****\n");
-	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+	xe_vm_snapshot_print(ss, coredump->snapshot.vm, &p);
 
-	return count - iter.remain;
+	ss->read_data_size = iter.offset;
+}
+
+static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
+{
+	int i;
+
+	xe_guc_ct_snapshot_free(ss->ct);
+	ss->ct = NULL;
+
+	xe_guc_exec_queue_snapshot_free(ss->ge);
+	ss->ge = NULL;
+
+	xe_sched_job_snapshot_free(ss->job);
+	ss->job = NULL;
+
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (ss->hwe[i]) {
+			xe_hw_engine_snapshot_free(ss->hwe[i]);
+			ss->hwe[i] = NULL;
+		}
+
+	xe_vm_snapshot_free(ss->vm);
+	ss->vm = NULL;
+}
+
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
+
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
+	xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+
+	ss->read_data = kvmalloc(SZ_16M, GFP_USER);
+	if (!ss->read_data)
+		return;
+
+	ss->read_data_size = SZ_16M;
+	__xe_devcoredump_read(ss->read_data, SZ_16M, coredump);
+	xe_devcoredump_snapshot_free(ss);
+}
+
+static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
+				   size_t count, void *data, size_t datalen)
+{
+	struct xe_devcoredump *coredump = data;
+	struct xe_devcoredump_snapshot *ss;
+	ssize_t byte_copied;
+
+	if (!coredump)
+		return -ENODEV;
+
+	ss = &coredump->snapshot;
+
+	/* Ensure delayed work is captured before continuing */
+	flush_work(&ss->work);
+
+	if (!ss->read_data)
+		return -ENODEV;
+
+	if (offset >= ss->read_data_size)
+		return 0;
+
+	byte_copied = count < ss->read_data_size - offset ? count :
+		ss->read_data_size - offset;
+	memcpy(buffer, ss->read_data + offset, byte_copied);
+
+	return byte_copied;
 }
 
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
-	int i;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -145,13 +197,8 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
-	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
-	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
-	xe_sched_job_snapshot_free(coredump->snapshot.job);
-	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (coredump->snapshot.hwe[i])
-			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
-	xe_vm_snapshot_free(coredump->snapshot.vm);
+	xe_devcoredump_snapshot_free(&coredump->snapshot);
+	kvfree(coredump->snapshot.read_data);
 
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
@@ -260,4 +307,33 @@ int xe_devcoredump_init(struct xe_device *xe)
 {
 	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
+
+int xe_devcoredump_check_iterator(struct xe_devcoredump_snapshot *ss,
+				  struct drm_printer *p, size_t len)
+{
+	struct drm_print_iterator *iterator = p->arg;
+	size_t new_size;
+	void *new_data;
+
+	if (ss->read_data_size > iterator->offset + len + SZ_4K)
+		return 0;
+
+	new_size = roundup_pow_of_two(iterator->offset + len + SZ_4K);
+
+	new_data = kvmalloc(new_size, GFP_USER);
+	if (!new_data)
+		return -ENOMEM;
+
+	memcpy(new_data, iterator->data, iterator->offset);
+
+	kvfree(iterator->data);
+
+	iterator->data = new_data;
+	iterator->remain += new_size - ss->read_data_size;
+	ss->read_data_size = new_size;
+	ss->read_data = new_data;
+
+	return 0;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index e2fa65ce0932..8bbef2244d5c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -6,12 +6,18 @@
 #ifndef _XE_DEVCOREDUMP_H_
 #define _XE_DEVCOREDUMP_H_
 
+#include <linux/types.h>
+
+struct drm_printer;
+struct xe_devcoredump_snapshot;
 struct xe_device;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
 void xe_devcoredump(struct xe_sched_job *job);
 int xe_devcoredump_init(struct xe_device *xe);
+int xe_devcoredump_check_iterator(struct xe_devcoredump_snapshot *ss,
+				  struct drm_printer *p, size_t len);
 #else
 static inline void xe_devcoredump(struct xe_sched_job *job)
 {
@@ -21,6 +27,13 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 {
 	return 0;
 }
+
+static inline int
+xe_devcoredump_check_iterator(struct xe_devcoredump_snapshot *ss,
+			      struct drm_printer *p, size_t len)
+{
+	return 0;
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 923cdf72a816..884802e46a98 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -46,6 +46,10 @@ struct xe_devcoredump_snapshot {
 	struct xe_sched_job_snapshot *job;
 	/** @vm: Snapshot of VM state */
 	struct xe_vm_snapshot *vm;
+	/** @read_data_size: size of read data */
+	size_t read_data_size;
+	/** @read_data: Read data */
+	void *read_data;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12d43c35978c..5cf45cb83676 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -25,6 +25,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_devcoredump.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_pagefault.h"
@@ -3366,9 +3367,11 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 	}
 }
 
-void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
+void xe_vm_snapshot_print(struct xe_devcoredump_snapshot *ss,
+			  struct xe_vm_snapshot *snap, struct drm_printer *p)
 {
 	unsigned long i, j;
+	int err;
 
 	if (IS_ERR_OR_NULL(snap)) {
 		drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
@@ -3384,6 +3387,10 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 			continue;
 		}
 
+		err = xe_devcoredump_check_iterator(ss, p, snap->snap[i].len);
+		if (err < 0)
+			return;
+
 		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..4537420b9c94 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -19,6 +19,7 @@ struct drm_file;
 struct ttm_buffer_object;
 struct ttm_validate_buffer;
 
+struct xe_devcoredump_snapshot;
 struct xe_exec_queue;
 struct xe_file;
 struct xe_sync_entry;
@@ -279,5 +280,6 @@ static inline void vm_dbg(const struct drm_device *dev,
 
 struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
-void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
+void xe_vm_snapshot_print(struct xe_devcoredump_snapshot *ss,
+			  struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
-- 
2.34.1

