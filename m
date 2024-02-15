Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C34FC48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 18:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0557F10E750;
	Thu, 15 Feb 2024 18:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHkRwLPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E2510E91A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708021044; x=1739557044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBI5vgw4NgiYnAIWfIneZpcRcIsorn2U7rALQl9Jnbk=;
 b=IHkRwLPHDI61x9SAqAv+DAsC9HPBxmR9Kr8gS82Ir5kf/tbsm2BOX28t
 l4+9OqkpVO/Z+s/mMWb7Izp5JEBzKiRqltBRZv7oSb2oL7dP2+RIPQ9Qu
 rTnxKzOxMBiJUYIr9brWLrQN8z13RjZo9eDTzBWk+CxcBcdD2/3H7oj7P
 Gw/ZN7Ycq5cK/NSzGq7kPEIC79bUOLumC1xBrm6ymqxvPSoHMraBhgeHK
 MDLLGI87hXMx6+emWcnoIl2NPRgN1ivRLM6B4pPmf/Arc2ML1YjpUr1mX
 zEhgyqiAtrq0dk/XjNopq1sbKUyN1J+0Xg0WG9svvP+3Y5e9P3kGsdjWZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13528582"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13528582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="34408159"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 10:17:22 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 1/2] drm/xe: Expose user fence from xe_sync_entry
Date: Thu, 15 Feb 2024 20:11:51 +0200
Message-Id: <20240215181152.450082-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
References: <20240215181152.450082-1-mika.kuoppala@linux.intel.com>
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

v2: xe_user_fence can be kept opaque (Jani, Matt)
v3: indent fix (Matt)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 58 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_sync.h       |  4 +++
 drivers/gpu/drm/xe/xe_sync_types.h |  2 +-
 3 files changed, 53 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index aab92bee1d7cf..02c9577fe4185 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
-struct user_fence {
+struct xe_user_fence {
 	struct xe_device *xe;
 	struct kref refcount;
 	struct dma_fence_cb cb;
@@ -27,31 +27,32 @@ struct user_fence {
 	struct mm_struct *mm;
 	u64 __user *addr;
 	u64 value;
+	int signalled;
 };
 
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
-					    u64 value)
+static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
+					       u64 value)
 {
-	struct user_fence *ufence;
+	struct xe_user_fence *ufence;
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
@@ -69,7 +70,7 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 
 static void user_fence_worker(struct work_struct *w)
 {
-	struct user_fence *ufence = container_of(w, struct user_fence, worker);
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
@@ -80,10 +81,11 @@ static void user_fence_worker(struct work_struct *w)
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
@@ -92,7 +94,7 @@ static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
 
 static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
-	struct user_fence *ufence = container_of(cb, struct user_fence, cb);
+	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
 
 	kick_ufence(ufence, fence);
 }
@@ -340,3 +342,39 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 	return ERR_PTR(-ENOMEM);
 }
+
+/**
+ * xe_sync_ufence_get() - Get user fence from sync
+ * @sync: input sync
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
index 852db5e7884fc..30ac3f51993b9 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -18,7 +18,7 @@ struct xe_sync_entry {
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

