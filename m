Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82049C4707B
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4497310E2D1;
	Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B1210E2CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307449; x=1735843449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PdImKlLireqpgA0K1wCd6T9iGIEUwnCSMFppWk4H5F4=;
 b=a1rPaBzkO+wrnX2lAZxsjHpVcvUh80I2SHOd7XZbEf61hRopywwCXtjB
 yDw3heJsBC0IEriBBmFoho9orcJBSJ65f/xIKm4q0d/ZGq8McXpq46S28
 e+/r0fTykrMOjgC2oCsBkxCS6eT5dc7odAyehG//0gp1GwzMlyGw/GFet
 +4zv7EVWF27AVVTOcOqz5cWxDZkmMLrIgCMClYOnG4IOg2+SwVyLAWro3
 zBDXQ4mJ17G/BK3kFg8aeLYFaOxbAGGzt6g1rn7zXk9M1s/2xZW1UB/Sd
 Jk/Ox25Im4nZw+FR7EAy4FLqx6Vq7iVJ8ZzHCwBfG9bOy6XS1sUEx6nlT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3815682"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3815682"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814330124"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="814330124"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:08 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/xe: Refactor __xe_exec_queue_create()
Date: Wed,  3 Jan 2024 10:44:04 -0800
Message-ID: <20240103184408.17844-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103184408.17844-1-brian.welty@intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
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

Split __xe_exec_queue_create() into two functions, alloc and init.

We have an issue in that exec_queue_user_extensions are applied too late.
In the case of USM properties, these need to be set prior to xe_lrc_init().
Refactor the logic here, so we can resolve this in follow-on. We only need
the xe_vm_lock held during the exec_queue_init function.

Signed-off-by: Brian Welty <brian.welty@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 58 ++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 44fe8097b7cd..94ae87540854 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -30,16 +30,14 @@ enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
 };
 
-static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
-						    struct xe_vm *vm,
-						    u32 logical_mask,
-						    u16 width, struct xe_hw_engine *hwe,
-						    u32 flags)
+static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
+						   struct xe_vm *vm,
+						   u32 logical_mask,
+						   u16 width, struct xe_hw_engine *hwe,
+						   u32 flags)
 {
 	struct xe_exec_queue *q;
 	struct xe_gt *gt = hwe->gt;
-	int err;
-	int i;
 
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
@@ -77,8 +75,23 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
 
-	for (i = 0; i < width; ++i) {
-		err = xe_lrc_init(q->lrc + i, hwe, q, vm, SZ_16K);
+	return q;
+}
+
+static void __xe_exec_queue_free(struct xe_exec_queue *q)
+{
+	if (q->vm)
+		xe_vm_put(q->vm);
+	kfree(q);
+}
+
+static int __xe_exec_queue_init(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+	int i, err;
+
+	for (i = 0; i < q->width; ++i) {
+		err = xe_lrc_init(q->lrc + i, q->hwe, q, q->vm, SZ_16K);
 		if (err)
 			goto err_lrc;
 	}
@@ -95,16 +108,15 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	 * can perform GuC CT actions when needed. Caller is expected to have
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
-	return q;
+	return 0;
 
 err_lrc:
 	for (i = i - 1; i >= 0; --i)
 		xe_lrc_finish(q->lrc + i);
-	kfree(q);
-	return ERR_PTR(err);
+	return err;
 }
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
@@ -114,16 +126,27 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	struct xe_exec_queue *q;
 	int err;
 
+	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
+	if (IS_ERR(q))
+		return q;
+
 	if (vm) {
 		err = xe_vm_lock(vm, true);
 		if (err)
-			return ERR_PTR(err);
+			goto err_post_alloc;
 	}
-	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
+
+	err = __xe_exec_queue_init(q);
 	if (vm)
 		xe_vm_unlock(vm);
+	if (err)
+		goto err_post_alloc;
 
 	return q;
+
+err_post_alloc:
+	__xe_exec_queue_free(q);
+	return ERR_PTR(err);
 }
 
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
@@ -174,10 +197,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
 		xe_device_mem_access_put(gt_to_xe(q->gt));
-	if (q->vm)
-		xe_vm_put(q->vm);
-
-	kfree(q);
+	__xe_exec_queue_free(q);
 }
 
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
-- 
2.43.0

