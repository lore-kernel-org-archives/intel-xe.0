Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0664C52D73
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8BA10E587;
	Wed,  7 Aug 2024 16:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNNvRAsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884CE10E582
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047887; x=1754583887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mfQD+lox0PN6GCXFzoksaO1oXwXQxB8Nvcg66Ho5gHg=;
 b=UNNvRAsBbxKGVDsE/hr8koj09o2Pw7nGDSPswLTyOrUoDJ7AbHtAKGqC
 I5X/hGWILHR66UBqyUa66O3RtcJhkZ6768nTSDu9KqBisG7gCe6Fimkp1
 Wh/gHjoANXph7qjXCQD+ZiHos0cK0/esiHc+LNRhQl5OI+EEwOqf5z12Y
 2R7USmdHT7J97wjhzpT1LrhOwHwc4PJ7VhHR99m0U6W9V6WJ05zmB8/oR
 LDg/d8PfJy3cQW5mHSdkcDsWDInD9+EQpKXmww95+dIm6j2jq85S4oRjf
 88lsn6IVMJbQXGh1G0LSUSyP6hVpkdqMYJ0F0k+tpjTlxDbxT0Ag7YjKJ A==;
X-CSE-ConnectionGUID: r7GvfRLEQPaZFfuA0EFrKA==
X-CSE-MsgGUID: /GQk4QJcTH2NkidsLKFxtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040448"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:47 -0700
X-CSE-ConnectionGUID: rtId0xStRvaQ8ciKL61zYQ==
X-CSE-MsgGUID: hokUuzeWSLyBQ5AM/KXIag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61791001"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:44 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 06/13] drm/xe/exec_queue: Prepare last fence for hw engine
 group resume context
Date: Wed,  7 Aug 2024 18:23:35 +0200
Message-ID: <20240807162416.1307061-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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

Ensure we can safely take a ref of the exec queue's last fence from the
context of resuming jobs from the hw engine group. The locking requirements
differ from the general case, hence the introduction of
xe_exec_queue_last_fence_{get,put}_for_resume().

v2: Add kernel doc, rework the code to prevent code duplication

v3: Fix kernel doc, remove now unnecessary lockdep variants (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 48 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h |  3 ++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 85da2a30a4a4..99ddcc826bce 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -818,10 +818,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_VM) {
 		lockdep_assert_held(&vm->lock);
-	else
+	} else {
 		xe_vm_assert_held(vm);
+		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
+	}
 }
 
 /**
@@ -836,6 +838,21 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
 	xe_exec_queue_last_fence_put_unlocked(q);
 }
 
+/**
+ * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Only safe to be called in the context of resuming the hw engine group's
+ * long-running exec queue, when the group semaphore is held.
+ */
+void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
+
+	xe_exec_queue_last_fence_put_unlocked(q);
+}
+
 /**
  * xe_exec_queue_last_fence_put_unlocked() - Drop ref to last fence unlocked
  * @q: The exec queue
@@ -875,6 +892,33 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 	return fence;
 }
 
+/**
+ * xe_exec_queue_last_fence_get_for_resume() - Get last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, takes a ref. Only safe to be called in the context of
+ * resuming the hw engine group's long-running exec queue, when the group
+ * semaphore is held.
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
+							  struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+
+	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
+
+	if (q->last_fence &&
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
+		xe_exec_queue_last_fence_put_for_resume(q, vm);
+
+	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
+	dma_fence_get(fence);
+	return fence;
+}
+
 /**
  * xe_exec_queue_last_fence_set() - Set last fence
  * @q: The exec queue
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ded77b0f3b90..fc9884a6ce85 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
 
 void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
 void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
+void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
+struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
+							  struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
-- 
2.43.0

