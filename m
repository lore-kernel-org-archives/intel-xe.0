Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC4CE81815
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 04:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E8210E00C;
	Wed, 27 Sep 2023 04:31:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AEA10E00C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 04:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695789063; x=1727325063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5aiJOc1uON4/MwaO/6e2jN3KQ0gItuy16mSTXvgeCc=;
 b=c3sH4AJ+s94jI3rt/h1JOhj2zAGCJHKpqdbAt6LjcaaqbwQg18njEdvz
 kcxFMqQ9COadklbK/Z4sH356SCy2thnBngCrsI6KQZ3bpx4Sp2s8L2MWL
 Hojj08SujErgHGTKl0LczTR9InZ3N3orG1n0ByomsvFmNt4g61TZOAUvM
 Fc/l/T55VhnQk5i8XxIyMzomtyPzT44WGNjn5eukOnaKcSY8m+PwssKjV
 35ylrr+0bhXZK75c4N87QVt+anI8wNweij0Shhq4bxSh0XokVbHeOqohf
 XowMzGOs9V8d3YGBUuRfDST0O8aZLCGIMBtP0buuXUGCShmA43EEO18vN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381628614"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="381628614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819273117"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="819273117"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:31:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 26 Sep 2023 21:31:18 -0700
Message-Id: <20230927043118.3017207-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Drop -EAGAIN userptr invalidation dance
 from VM bind IOCTL
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

This isn't needed as the nexr exec, preempt rebind worker, or page fault
will issue a rebind. Drop thing complication.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 61 +-------------------------------------
 drivers/gpu/drm/xe/xe_vm.c | 10 -------
 2 files changed, 1 insertion(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index aec469842471..34954d354013 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1042,36 +1042,6 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 {}
 #endif
 
-#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
-
-static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
-{
-	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
-	static u32 count;
-
-	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = xe_vma_vm(vma);
-
-		vma->userptr.divisor = divisor << 1;
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&vma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-		return true;
-	}
-
-	return false;
-}
-
-#else
-
-static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
-{
-	return false;
-}
-
-#endif
-
 /**
  * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
  * @base: Base we derive from.
@@ -1139,7 +1109,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_pt_migrate_pt_update *userptr_update =
 		container_of(pt_update, typeof(*userptr_update), base);
 	struct xe_vma *vma = pt_update->vma;
-	unsigned long notifier_seq = vma->userptr.notifier_seq;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int err = xe_pt_vm_dependencies(pt_update->job,
 					&vm->rftree[pt_update->tile_id],
@@ -1149,36 +1118,8 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	userptr_update->locked = false;
-
-	/*
-	 * Wait until nobody is running the invalidation notifier, and
-	 * since we're exiting the loop holding the notifier lock,
-	 * nobody can proceed invalidating either.
-	 *
-	 * Note that we don't update the vma->userptr.notifier_seq since
-	 * we don't update the userptr pages.
-	 */
-	do {
-		down_read(&vm->userptr.notifier_lock);
-		if (!mmu_interval_read_retry(&vma->userptr.notifier,
-					     notifier_seq))
-			break;
-
-		up_read(&vm->userptr.notifier_lock);
-
-		if (userptr_update->bind)
-			return -EAGAIN;
-
-		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
-	} while (true);
-
-	/* Inject errors to test_whether they are handled correctly */
-	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
-		up_read(&vm->userptr.notifier_lock);
-		return -EAGAIN;
-	}
 
+	down_read(&vm->userptr.notifier_lock);
 	userptr_update->locked = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 861d050871bb..147d5f901f24 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2757,7 +2757,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	struct drm_exec exec;
 	int err;
 
-retry_userptr:
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	drm_exec_until_all_locked(&exec) {
 		err = op_execute(&exec, vm, vma, op);
@@ -2767,15 +2766,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
-	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
-		lockdep_assert_held_write(&vm->lock);
-		err = xe_vma_userptr_pin_pages(vma);
-		if (!err)
-			goto retry_userptr;
-
-		trace_xe_vma_fail(vma);
-	}
-
 	return err;
 }
 
-- 
2.34.1

