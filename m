Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1949DC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 14:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AEB10E2D2;
	Wed, 14 Feb 2024 14:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsUmYjug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8310E2D2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 14:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707920270; x=1739456270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bGqLPng5mEDtw6dGntB0DvE1xOFn4YRT7wDoUtxCBVs=;
 b=YsUmYjugjOAvn6tlRLixAbEPdc016TO+yMxKRhqGbRo4b0xDwVZqL+Cd
 B1VzHUpPDoM9g95U5Mh2RKhw48SKhm3Zto4mJWRIl7QRVw+7ow5oC/Rlw
 DRUd9Fv0W1dTPaeYerPhmfAjcxRmU/AbNQqNlYksJYktsc6F3OzZyu0lu
 0ST/FtjwYLsanQPG+y7k4Rr5WApTi7CwMdjJ7MhqyffI/Uuh+W+poW0Ja
 t/oQhSNPcMcq1Yb301fQh+rIueSyoStEXRRzfDiztMMTbEmU6IPWdxij/
 z0p2b9fDETf95GOtBQximkEf1r/qrAL8t0WOf3m0QtQDePW+M1k7VXpw/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5783802"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5783802"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3552283"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 06:17:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe: Expose user fence from xe_sync_entry
Date: Wed, 14 Feb 2024 16:12:16 +0200
Message-Id: <20240214141217.361122-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

By allowing getting reference to user fence, we can
control the lifetime outside of sync entries.

This is needed to allow vma to track the associated
user fence that was provided with bind ioctl.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 63 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_sync.h       |  4 ++
 drivers/gpu/drm/xe/xe_sync_types.h | 20 +++++++---
 3 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index aab92bee1d7cf..c3e745c7778b9 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -19,39 +19,29 @@
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
-struct user_fence {
-	struct xe_device *xe;
-	struct kref refcount;
-	struct dma_fence_cb cb;
-	struct work_struct worker;
-	struct mm_struct *mm;
-	u64 __user *addr;
-	u64 value;
-};
-
 static void user_fence_destroy(struct kref *kref)
 {
-	struct user_fence *ufence = container_of(kref, struct user_fence,
+	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
 						 refcount);
 
 	mmdrop(ufence->mm);
 	kfree(ufence);
 }
 
-static void user_fence_get(struct user_fence *ufence)
+static void user_fence_get(struct xe_user_fence *ufence)
 {
 	kref_get(&ufence->refcount);
 }
 
-static void user_fence_put(struct user_fence *ufence)
+static void user_fence_put(struct xe_user_fence *ufence)
 {
 	kref_put(&ufence->refcount, user_fence_destroy);
 }
 
-static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
+static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					    u64 value)
 {
-	struct user_fence *ufence;
+	struct xe_user_fence *ufence;
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
@@ -69,7 +59,7 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 
 static void user_fence_worker(struct work_struct *w)
 {
-	struct user_fence *ufence = container_of(w, struct user_fence, worker);
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
@@ -80,10 +70,11 @@ static void user_fence_worker(struct work_struct *w)
 	}
 
 	wake_up_all(&ufence->xe->ufence_wq);
+	WRITE_ONCE(ufence->signalled, 1);
 	user_fence_put(ufence);
 }
 
-static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
+static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
 {
 	INIT_WORK(&ufence->worker, user_fence_worker);
 	queue_work(ufence->xe->ordered_wq, &ufence->worker);
@@ -92,7 +83,7 @@ static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
 
 static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
-	struct user_fence *ufence = container_of(cb, struct user_fence, cb);
+	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
 
 	kick_ufence(ufence, fence);
 }
@@ -340,3 +331,39 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 	return ERR_PTR(-ENOMEM);
 }
+
+/**
+ * xe_sync_ufence_get() - Get user fence from sync
+ * @sync: input syncs
+ *
+ * Get a user fence reference from sync.
+ *
+ * Return: xe_user_fence pointer with reference
+ */
+struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync)
+{
+	user_fence_get(sync->ufence);
+
+	return sync->ufence;
+}
+
+/**
+ * xe_sync_ufence_put() - Put user fence reference
+ * @ufence: user fence reference
+ *
+ */
+void xe_sync_ufence_put(struct xe_user_fence *ufence)
+{
+	user_fence_put(ufence);
+}
+
+/**
+ * xe_sync_ufence_get_status() - Get user fence status
+ * @ufence: user fence
+ *
+ * Return: 1 if signalled, 0 not signalled, <0 on error
+ */
+int xe_sync_ufence_get_status(struct xe_user_fence *ufence)
+{
+	return READ_ONCE(ufence->signalled);
+}
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index f43cdcaca6c57..0fd0d51208e62 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -38,4 +38,8 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
 	return !!sync->ufence;
 }
 
+struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
+void xe_sync_ufence_put(struct xe_user_fence *ufence);
+int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 852db5e7884fc..6176ef9d65c72 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -7,18 +7,28 @@
 #define _XE_SYNC_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/kref.h>
+#include <linux/dma-fence.h>
+#include <linux/workqueue.h>
 
-struct drm_syncobj;
-struct dma_fence;
-struct dma_fence_chain;
 struct drm_xe_sync;
-struct user_fence;
+
+struct xe_user_fence {
+	struct xe_device *xe;
+	struct kref refcount;
+	struct dma_fence_cb cb;
+	struct work_struct worker;
+	struct mm_struct *mm;
+	u64 __user *addr;
+	u64 value;
+	int signalled;
+};
 
 struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
 	struct dma_fence *fence;
 	struct dma_fence_chain *chain_fence;
-	struct user_fence *ufence;
+	struct xe_user_fence *ufence;
 	u64 addr;
 	u64 timeline_value;
 	u32 type;
-- 
2.34.1

