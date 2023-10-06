Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B1AE92FFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1844E10E4D7;
	Fri,  6 Oct 2023 10:00:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336B410E4D6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586405; x=1728122405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MA9AJSX1I4okXlMsjapIdxCroK0oK+SzmGr0fXxT34s=;
 b=Nw4wrnssvmDMwzais4bGjN4ty+3BPO14tGlyPCy/eyr1GSddL4m89f8T
 e8l9+3s32T2wng8sohlLo0jPVErzblcrXcm1qooZJHdbNyHCvAnNQw7h+
 sZIUXoPru6APoVIKpB7+MZrUZose1mQVh/kSrfgwtTi6jvU+lRZMvUNAQ
 LfarfPzoVo4cq3mJqWEZqLaNJm49UhhAlK5WeZ1X+8qvvL4NPBViVPYTJ
 QhB/tYqz8t6qyUekPxzkTRIhaTGZnCA+1RIlxzYufHrA/dTVAYj9SZzsv
 9vULkF6K59pogQo5uYdLrqoJNni6KaHc00AGBWk9tNWyU8Z5rxBEb6FZJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907156"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907156"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815847"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815847"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:00:03 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:31 +0000
Message-Id: <20231006095943.7-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 08/20] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
uAPI, deprecate the implementation first by making
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP. After removal of
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE the proper is simply inherented
from the VM.

v2:
 - Update commit message with explaination of removal (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
 2 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6f1e64896a2d..68cd2234acf5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
 				       u64 value, bool create)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
-		return -EINVAL;
-
-	if (value) {
-		struct xe_vm *vm = q->vm;
-		int err;
-
-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, q->width != 1))
-			return -EINVAL;
-
-		q->compute.context = dma_fence_context_alloc(1);
-		spin_lock_init(&q->compute.lock);
-
-		err = xe_vm_add_compute_exec_queue(vm, q);
-		if (XE_IOCTL_DBG(xe, err))
-			return err;
-
-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
-	}
-
 	return 0;
 }
 
@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
 		return -EINVAL;
 
 	if (value)
@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		xe_vm_put(vm);
 		if (IS_ERR(q))
 			return PTR_ERR(q);
+
+		if (xe_vm_in_compute_mode(vm)) {
+			q->compute.context = dma_fence_context_alloc(1);
+			spin_lock_init(&q->compute.lock);
+
+			err = xe_vm_add_compute_exec_queue(vm, q);
+			if (XE_IOCTL_DBG(xe, err))
+				goto put_exec_queue;
+		}
 	}
 
 	if (args->extensions) {
 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
 		if (XE_IOCTL_DBG(xe, err))
-			goto put_exec_queue;
-	}
-
-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
-		err = -EOPNOTSUPP;
-		goto put_exec_queue;
+			goto kill_exec_queue;
 	}
 
 	q->persistent.xef = xef;
@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
 	if (err)
-		goto put_exec_queue;
+		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
 
 	return 0;
 
-put_exec_queue:
+kill_exec_queue:
 	xe_exec_queue_kill(q);
+put_exec_queue:
 	xe_exec_queue_put(q);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 347d28442701..f73b9e80b25a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -60,12 +60,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
 /* queue keeps running pending jobs after destroy ioctl */
 #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
-/* queue for use with compute VMs */
-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(5)
+#define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.34.1

