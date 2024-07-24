Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B14C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2854310E7A9;
	Wed, 24 Jul 2024 19:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXS+jtRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ABD10E79B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849707; x=1753385707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QmbV+yZ8Ue62TGb6eAdkrOQ0hkBLxESsBfbyrYXmvfU=;
 b=lXS+jtRiYg58K5LBUBnu6zyhqXXyrjYfIRW12dtHhMFmj659PyEo46n0
 jeEu/q7WZkitDzBuFBz3PII/4nEDke9g38ARPLXLJuulZIqe/LcDkMoq+
 LDkNYB/74M4Q3sokiX+SqLQ6sV3PbDvDGE9W7vIyPQS0PLZnEYByGG/g5
 N86VDzbzcP0/clTdSnRDzauQShsKCsJgyexADaHX6jXiAgDrTyV017c3j
 mB29lZ6IsTtXOLMuvCCtVMcDl563RU4o1WRRgyqwTl3bOXQE0hOwg7K+S
 Grp/OrZjeDpHzzY1JfROWaXfxbNTjJnax1mTijKw5Bwt9sAqJorGusueF w==;
X-CSE-ConnectionGUID: EMnWhA5ERQKEO12jH8Ea6g==
X-CSE-MsgGUID: jmRWS+u0RiCE+9cpicCdrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691132"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:07 -0700
X-CSE-ConnectionGUID: OJKEij21Tka5HOPd3nAc2g==
X-CSE-MsgGUID: bemkFOOrQImtqPt5akuTow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292260"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 05/12] drm/xe/exec_queue: Prepare last fence for hw engine
 group resume context
Date: Wed, 24 Jul 2024 21:32:58 +0200
Message-ID: <20240724193431.2685833-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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
context of resuming jobs from the hw engine group. In this case the
asserts lockdep_assert_held*() are used to check if the semaphore is
properly held. This is why we need a new variant of
xe_exec_queue_last_fence().

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 33 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6fc952755cb3..2a817206b91f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -837,10 +837,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
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
@@ -897,6 +899,33 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 	return fence;
 }
 
+/**
+ * xe_exec_queue_last_fence_get_to_resume() - Get last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, takes a ref, from the context of resuming jobs
+ * of the hw engine group, where xe_exec_queue_last_fence_lockdep_assert
+ * is not applicable, hence rely on the group semaphore instead.
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_last_fence_get_to_resume(struct xe_exec_queue *q,
+							 struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+
+	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
+
+	if (q->last_fence &&
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
+		xe_exec_queue_last_fence_put(q, vm);
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
index 289a3a51d2a2..b5ac55967f1d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -73,6 +73,8 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
 void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
+struct dma_fence *xe_exec_queue_last_fence_get_to_resume(struct xe_exec_queue *e,
+							 struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
-- 
2.43.0

