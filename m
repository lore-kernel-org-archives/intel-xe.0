Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F54FC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 13:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F5A10E6A1;
	Tue, 25 Feb 2025 13:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mx0kMedG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0486810E6A1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740491104; x=1772027104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+kkGEimyTmo/AsIUOBTDzKwfFAoBC4+7+xrZyxgfLhA=;
 b=Mx0kMedG0vBzgg05VqxvtILFIFxgC8r52Fp5obzakqsJOCiNlbzfFYMg
 Pmc0UkcBA9MBAZAsmTQZ2kiiQGR6RAqpnVXE7F6hGqI/si+hvlZ/jpTRU
 xVw/OiYH9Ra68ZL8bBZJ5aO3cAtOSp+oSwsOkEGifLd2cDP3KgIFoNJa0
 lC/lQymrB+krhXA6ChLyAxeWbzjwsXeKLuUoTVcVH/k0NsTXiIvIUKBJc
 INqbFP2uf8iPkBUXIEYmleEdQNIiKy/nGGM2yFAf/rGiEUv3DBUuPa7Z7
 XqWFJYJAWt22fLZrMo1zImHyXgfWefnbw780UO8vCGKVOe6xUTE1E6z8/ w==;
X-CSE-ConnectionGUID: 6Wd7ySsiSx+a8r7L4o+E9g==
X-CSE-MsgGUID: xZ/ljRkASB+lY+LuBmmVtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41431063"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41431063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:44:52 -0800
X-CSE-ConnectionGUID: zZQ5CkXgT76A0g9ryhhE8g==
X-CSE-MsgGUID: joYITY6LSG6gE//OPMT5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147289570"
Received: from monicael-mobl3 (HELO fedora..) ([10.245.246.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 05:44:51 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI] drm/xe: Fix fault mode invalidation with unbind
Date: Tue, 25 Feb 2025 14:44:26 +0100
Message-ID: <20250225134426.315876-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

Fix fault mode invalidation racing with unbind leading to the
PTE zapping potentially traversing an invalid page-table tree.
Do this by holding the notifier lock across PTE zapping. This
might transfer any contention waiting on the notifier seqlock
read side to the notifier lock read side, but that shouldn't be
a major problem.

At the same time get rid of the open-coded invalidation in the bind
code by relying on the notifier even when the vma bind is not
yet committed.

Finally let userptr invalidation injections during binding
unconditionally return -EAGAIN.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 38 +++++++++-----------------------------
 drivers/gpu/drm/xe/xe_vm.c | 13 +++----------
 2 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..e9f90887b30c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1213,42 +1213,22 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 
 	uvma = to_userptr_vma(vma);
-	notifier_seq = uvma->userptr.notifier_seq;
+	if (xe_pt_userptr_inject_eagain(uvma))
+		return -EAGAIN;
 
-	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
-		return 0;
+	notifier_seq = uvma->userptr.notifier_seq;
 
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-				     notifier_seq) &&
-	    !xe_pt_userptr_inject_eagain(uvma))
+				     notifier_seq))
 		return 0;
 
-	if (xe_vm_in_fault_mode(vm)) {
+	if (xe_vm_in_fault_mode(vm))
 		return -EAGAIN;
-	} else {
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&uvma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-
-		if (xe_vm_in_preempt_fence_mode(vm)) {
-			struct dma_resv_iter cursor;
-			struct dma_fence *fence;
-			long err;
-
-			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
-					    DMA_RESV_USAGE_BOOKKEEP);
-			dma_resv_for_each_fence_unlocked(&cursor, fence)
-				dma_fence_enable_sw_signaling(fence);
-			dma_resv_iter_end(&cursor);
-
-			err = dma_resv_wait_timeout(xe_vm_resv(vm),
-						    DMA_RESV_USAGE_BOOKKEEP,
-						    false, MAX_SCHEDULE_TIMEOUT);
-			XE_WARN_ON(err <= 0);
-		}
-	}
 
+	/*
+	 * Just continue the operation since exec or rebind worker
+	 * will take care of rebinding.
+	 */
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..047f17b230b2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -605,26 +605,18 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	down_write(&vm->userptr.notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
 
-	/* No need to stop gpu access if the userptr is not yet bound. */
-	if (!userptr->initial_bind) {
-		up_write(&vm->userptr.notifier_lock);
-		return true;
-	}
-
 	/*
 	 * Tell exec and rebind worker they need to repin and rebind this
 	 * userptr.
 	 */
 	if (!xe_vm_in_fault_mode(vm) &&
-	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&userptr->invalidate_link,
 			       &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 	}
 
-	up_write(&vm->userptr.notifier_lock);
-
 	/*
 	 * Preempt fences turn into schedule disables, pipeline these.
 	 * Note that even in fault mode, we need to wait for binds and
@@ -642,11 +634,12 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm)) {
+	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
 		err = xe_vm_invalidate_vma(vma);
 		XE_WARN_ON(err);
 	}
 
+	up_write(&vm->userptr.notifier_lock);
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
-- 
2.48.1

