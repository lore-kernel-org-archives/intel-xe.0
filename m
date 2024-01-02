Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C6DC47079
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B6610E21E;
	Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F0010E222
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704230252; x=1735766252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MDKI4pEpFRVo3aYo3hw21/cvDwcDApg+h6d8kURntgI=;
 b=hFsFwRBoVlWiNW5rvjCQp/K7zHcvMaOvhV92x5BDezGe8yYAt2rgHnKK
 F6mwmTGUGt1XdMkxzeGBsF2auc9/ZYAyOoRrelLpcTy0gZCC9tdwN+0Uf
 H2iZarjtn4801doAvW1OCQtlIClKMfI7FJSzf/kKDnjtAIIt+jMFfmrR5
 86xjgnA7wTDiruiujQUY7Z+gTMMSh0mb1A+99tsJ/ktzsD+rXisE5LJ8C
 PMOMrOVd25FssHjJz+EZcqZU46PxzKo/LnGSbsrhfhYknSLgZJrhtm11C
 YXLlGKl2AfhJzNpJsTNxVEv8h+wxDDujUtNso76L0Pd7XJv7PcO4hzbiQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396654455"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396654455"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898648790"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="898648790"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Refactor __xe_exec_queue_create()
Date: Tue,  2 Jan 2024 13:17:28 -0800
Message-ID: <20240102211731.6720-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
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

