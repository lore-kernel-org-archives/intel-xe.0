Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82229D609AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 08:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CDF10EA18;
	Wed, 27 Nov 2024 08:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGC6uHEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ECE10EA18
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694994; x=1764230994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Thk0uJhuXJDRqOSqyb83a5UUbeuBHW0o13/x2d7Sn1g=;
 b=lGC6uHEaDOQFaGPeDmpX2arF8QIsH8938KwoyRl6Afpztqqju8z9UQ5G
 VnPPeQ0KIXVHRyjNqs5au1C8ZVA4Wo2fBe+QfW9xpgyrvQCHyT7Ee39Ru
 TO4zFzBPlYa0UpT2IAmZ/l6zrXHO1F4bznmZ48EDm1BLUwZJOj3K+HFpR
 cXbw/NdmN9SLbb03HJj7nClvEbdGZlPUKRfC+ua1JyEyC6HBPRytTKUx7
 N0mu6MjiwG9IUJ9WqHWyiujIVUM7NrmYMQKCQEkyYO/gVH0DYx7mp+0CK
 Lgf53pTlqvlYYHyZ6fYRKf75xIFRunrFvVw0vtdjn+EXzBn2KxPGEU3c8 g==;
X-CSE-ConnectionGUID: ybr49QkYQN+M/AJDwBY9Ow==
X-CSE-MsgGUID: IxfVF3iiTzuIeXGhOp8Xpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36810239"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36810239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 00:09:53 -0800
X-CSE-ConnectionGUID: CcMKBCzHTde59AGtnK0fKA==
X-CSE-MsgGUID: bMgaESn0SB2nBXQbA+dXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92689706"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 00:09:51 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/3] Revert "drm/xe: Add mutex locking to devcoredump"
Date: Wed, 27 Nov 2024 14:00:40 +0530
Message-Id: <20241127083042.358726-2-himal.prasad.ghimiray@intel.com>
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

This reverts commit b9428d0ac54fcece5ad8fc86c5d3e7aacc6e2c76. The commit
was accidentally and unintentionally pushed.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 33 ++---------------------
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +--
 2 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index dd6a4f591ee0..5d19a4e3d5af 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -182,24 +182,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	/* Ensure delayed work is captured before continuing */
 	flush_work(&ss->work);
 
-	mutex_lock(&coredump->lock);
-
-	if (!ss->read.buffer) {
-		mutex_unlock(&coredump->lock);
+	if (!ss->read.buffer)
 		return -ENODEV;
-	}
 
-	if (offset >= ss->read.size) {
-		mutex_unlock(&coredump->lock);
+	if (offset >= ss->read.size)
 		return 0;
-	}
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
 	memcpy(buffer, ss->read.buffer + offset, byte_copied);
 
-	mutex_unlock(&coredump->lock);
-
 	return byte_copied;
 }
 
@@ -213,8 +205,6 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
-	mutex_lock(&coredump->lock);
-
 	xe_devcoredump_snapshot_free(&coredump->snapshot);
 	kvfree(coredump->snapshot.read.buffer);
 
@@ -223,8 +213,6 @@ static void xe_devcoredump_free(void *data)
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
-
-	mutex_unlock(&coredump->lock);
 }
 
 static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
@@ -333,11 +321,8 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	va_list varg;
 
-	mutex_lock(&coredump->lock);
-
 	if (coredump->captured) {
 		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
-		mutex_unlock(&coredump->lock);
 		return;
 	}
 
@@ -352,8 +337,6 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
 		 xe->drm.primary->index);
-
-	mutex_unlock(&coredump->lock);
 }
 
 static void xe_driver_devcoredump_fini(void *arg)
@@ -365,18 +348,6 @@ static void xe_driver_devcoredump_fini(void *arg)
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
-	int err;
-
-	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
-	if (err)
-		return err;
-
-	if (IS_ENABLED(CONFIG_LOCKDEP)) {
-		fs_reclaim_acquire(GFP_KERNEL);
-		might_lock(&xe->devcoredump.lock);
-		fs_reclaim_release(GFP_KERNEL);
-	}
-
 	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1a1d16a96b2d..e6234e887102 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -80,9 +80,7 @@ struct xe_devcoredump_snapshot {
  * for reading the information.
  */
 struct xe_devcoredump {
-	/** @lock: protects access to entire structure */
-	struct mutex lock;
-	/** @captured: The snapshot of the first hang has already been taken */
+	/** @captured: The snapshot of the first hang has already been taken. */
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
 	struct xe_devcoredump_snapshot snapshot;
-- 
2.34.1

