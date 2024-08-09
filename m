Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CB1C531DB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044B910E96F;
	Fri,  9 Aug 2024 15:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC5FcCsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24E010E96D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218740; x=1754754740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xkt1l4pE8bGIXi7bzFZcOXQJNIvNnVPe5gm5x6dukpg=;
 b=cC5FcCsbwRFQJHM+Zn3t1YQjEx+rxf+oPPXNKdY0T3bQ4jQd4OBWSPMW
 IoBacpKre9gW4juJR9vHViWrMTjCMDLgKIA1DK0a1LuI9NOpO2/ZDXxAk
 q3W3ndBue7cF2p/CHWM8StAQorbmR7f0Tf18RPJxsRmqWpOIGAdo75jOX
 6NeIdYhZdtUmqw7cy6X+LHs/0PDuL6j6fbQNoGym6F46TaC99cw18o4NY
 y5x0fmW0CaLCPMVYECidg5z2rRkXzMtnCIWHp2dWRYWzfWCppY9IHCE3Q
 Y6PNfaYCc/bqLBpGE9gB4yp4OtR5V97Dz94HEM6ymXzz7R8/vDHxPO50I Q==;
X-CSE-ConnectionGUID: 9I9QJsQESFmi1UFFoxK88g==
X-CSE-MsgGUID: OLTBoKHrQT28Bb+OESXjJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207397"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:20 -0700
X-CSE-ConnectionGUID: NglHpAjDSQuu3lYxW7B8bg==
X-CSE-MsgGUID: MCIodf0nRW+L6g5l118ZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728817"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 06/11] drm/xe/exec_queue: Prepare last fence for hw engine
 group resume context
Date: Fri,  9 Aug 2024 17:51:31 +0200
Message-ID: <20240809155156.1955925-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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
differ from the general case, hence the introduction of this new function.

v2: Add kernel doc, rework the code to prevent code duplication

v3: Fix kernel doc, remove now unnecessary lockdep variants (Matt Brost)

v4: Remove new put function (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 33 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 588cf5836798..abb2dfe7b1fd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -819,10 +819,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
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
@@ -876,6 +878,33 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
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
+		xe_exec_queue_last_fence_put_unlocked(q);
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
index ded77b0f3b90..5dcc1a65e5cf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -73,6 +73,8 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
 void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
+struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
+							  struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
-- 
2.43.0

