Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2B4C52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237810E7D4;
	Thu,  8 Aug 2024 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYqti1mz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F4E10E7D4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142562; x=1754678562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Bi8RLh1vzJpxLiKRRW9V6x/oZVVgrJ08OjPOkiOG4s=;
 b=dYqti1mzKBicg8GrhmQ6Rjtpqa7cdUvK39vQzAYntPobQFfNTVWgCfTm
 bNB7Y4ZCfqM5OKOZ1Ri0tDi5O/7TB0g/NtpFc0w/TZXeZZEHZxpqHuIGe
 YnzWWDcmfRdKk0HkuOQ/QEho6H10OigqBMz/hewAEF7y8SWSSnnYkIUAS
 p1YWh3vwR0m73GGW18dr9cJkWQIUqf2RDOmCUrU31zYeEbzHbPlHqntEM
 Weg2Ax8UZwtoefX/2TbDHO5rsuh8bD5cTcL069hvCMtOXEd/U2Xt3H2Dq
 aQRji1eQSIab07vb5XgNYd6Pex08AoF+Qk21qwIALsG4mx/HBIO4kSM4U A==;
X-CSE-ConnectionGUID: qwFhZX/WTgGlls+HmEj4Dw==
X-CSE-MsgGUID: m77/NbZZR16Lj2mlHQOHMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921597"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:42 -0700
X-CSE-ConnectionGUID: KigEzejWRgSWegFS+0u+KQ==
X-CSE-MsgGUID: 57deUJgvSy28/sjJizOetA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975926"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:40 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 06/11] drm/xe/exec_queue: Prepare last fence for hw engine
 group resume context
Date: Thu,  8 Aug 2024 20:40:24 +0200
Message-ID: <20240808184220.1715625-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

