Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30268FED9F6
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 18:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16F810E5D5;
	Tue, 17 Mar 2026 18:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDOYdL6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6B10E5D5
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773771708; x=1805307708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ucC2/0G97/hjyZyNrhUQ85dPfwvMxQ7R/isuhqzY2vs=;
 b=jDOYdL6Zi2HgkVov5BVkWlB6zbhEYMsqa+3PzCS10o+xCFh8AQh78Oy+
 A6ZGh3JKDInP7UmxbmbgE7nWuugecAA0g1GMXowskwrPKyuIkSs6374dE
 K154Xnp9Wm8j6CrQBWpwdCCuWRURyRozOTrbE6oeABw5KokxJQVvNzCUU
 tlr0f3RJp3zsx/JWRb9k26icpHE4TKRLNLUiWcngMmZ46m60cKBdWYYvO
 CcGgtbmkFN6q3DLoyJQpDOpnpoY6ANSSdSn1SQqQiDy/Ik8pwQNDQdk8t
 1eTSEBIoIQTcecQy2vgbQ+stzzCC8U5CB++A0YQEnxfCekFxJ6YCYcwT7 A==;
X-CSE-ConnectionGUID: ieJs15DzR5qk2OrIsWX3Uw==
X-CSE-MsgGUID: XPIhuRVeTl2ivaImzGUDpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="73835480"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="73835480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 11:21:47 -0700
X-CSE-ConnectionGUID: AsHEasAfSwSYp10R5TAkIA==
X-CSE-MsgGUID: bTx4sQuKTRyewu2UYVBNkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="227306719"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.147])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 11:21:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: always keep track of remap prev/next
Date: Tue, 17 Mar 2026 18:21:38 +0000
Message-ID: <20260317182137.60189-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.53.0
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

During 3D workload, user is reporting hitting:

[  413.361679] WARNING: drivers/gpu/drm/xe/xe_vm.c:1217 at vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe], CPU#7: vkd3d_queue/9925
[  413.361944] CPU: 7 UID: 1000 PID: 9925 Comm: vkd3d_queue Kdump: loaded Not tainted 7.0.0-070000rc3-generic #202603090038 PREEMPT(lazy)
[  413.361949] RIP: 0010:vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe]
[  413.362074] RSP: 0018:ffffd4c25c3df930 EFLAGS: 00010282
[  413.362077] RAX: 0000000000000000 RBX: ffff8f3ee817ed10 RCX: 0000000000000000
[  413.362078] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  413.362079] RBP: ffffd4c25c3df980 R08: 0000000000000000 R09: 0000000000000000
[  413.362081] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8f41fbf99380
[  413.362082] R13: ffff8f3ee817e968 R14: 00000000ffffffef R15: ffff8f43d00bd380
[  413.362083] FS:  00000001040ff6c0(0000) GS:ffff8f4696d89000(0000) knlGS:00000000330b0000
[  413.362085] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  413.362086] CR2: 00007ddfc4747000 CR3: 00000002e6262005 CR4: 0000000000f72ef0
[  413.362088] PKRU: 55555554
[  413.362089] Call Trace:
[  413.362092]  <TASK>
[  413.362096]  xe_vm_bind_ioctl+0xa9a/0xc60 [xe]

Which seems to hint that the vma we are re-inserting for the ops unwind
is either invalid or overlapping with something already inserted in the
vm. It shouldn't be invalid since this is a re-insertion, so must have
worked before. Leaving the likely culprit as something already placed
where we want to insert the vma.

Following from that, for the case where we do something like a rebind in
the middle of a vma, and one or both mapped ends are already compatible,
we skip doing the rebind of those vma and set next/prev to NULL. As well
as then adjust the original unmap va range, to avoid unmapping the ends.
However, if we trigger the unwind path, we end up with three va, with
the two ends never being removed and the original va range in the middle
still being the shrunken size.

If this occurs, one failure mode is when another unwind op needs to
interact with that range, which can happen with a vector of binds. For
example, if we need to re-insert something in place of the original va.
In this case the va is still the shrunken version, so when removing it
and then doing a re-insert it can overlap with the ends, which were
never removed, triggering a warning like above, plus leaving the vm in a
bad state.

With that, we need two things here:

 1) Stop nuking the prev/next tracking for the skip cases. Instead
    relying on checking for skip prev/next, where needed. That way on the
    unwind path, we now correctly remove both ends.

 2) Undo the unmap va shrinkage, on the unwind path. With the two ends
    now removed the unmap va should expand back to the original size again,
    before re-insertion.

v2:
  - Update the explanation in the commit message, based on an actual IGT of
    triggering this issue, rather than conjecture.
  - Also undo the unmap shrinkage, for the skip case. With the two ends
    now removed, the original unmap va range should expand back to the
    original range.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm.c | 14 ++++++++++----
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2d9ce2c4cb4f..713a303c9053 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1442,9 +1442,9 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 		err = vma_check_userptr(vm, op->map.vma, pt_update);
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		if (op->remap.prev)
+		if (op->remap.prev && !op->remap.skip_prev)
 			err = vma_check_userptr(vm, op->remap.prev, pt_update);
-		if (!err && op->remap.next)
+		if (!err && op->remap.next && !op->remap.skip_next)
 			err = vma_check_userptr(vm, op->remap.next, pt_update);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
@@ -2198,12 +2198,12 @@ static int op_prepare(struct xe_vm *vm,
 
 		err = unbind_op_prepare(tile, pt_update_ops, old);
 
-		if (!err && op->remap.prev) {
+		if (!err && op->remap.prev && !op->remap.skip_prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
 					      op->remap.prev, false);
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
-		if (!err && op->remap.next) {
+		if (!err && op->remap.next && !op->remap.skip_next) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
 					      op->remap.next, false);
 			pt_update_ops->wait_vm_bookkeep = true;
@@ -2428,10 +2428,10 @@ static void op_commit(struct xe_vm *vm,
 
 		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
 
-		if (op->remap.prev)
+		if (op->remap.prev && !op->remap.skip_prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
 				       fence, fence2, false);
-		if (op->remap.next)
+		if (op->remap.next && !op->remap.skip_next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
 				       fence, fence2, false);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5572e12c2a7e..cf15f2c222f4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2584,7 +2584,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			if (!err && op->remap.skip_prev) {
 				op->remap.prev->tile_present =
 					tile_present;
-				op->remap.prev = NULL;
 			}
 		}
 		if (op->remap.next) {
@@ -2594,11 +2593,11 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			if (!err && op->remap.skip_next) {
 				op->remap.next->tile_present =
 					tile_present;
-				op->remap.next = NULL;
 			}
 		}
 
-		/* Adjust for partial unbind after removing VMA from VM */
+		/* Adjust for partial unbind after removing VMA from VM. In case
+		 * of unwind we might need to undo this later. */
 		if (!err) {
 			op->base.remap.unmap->va->va.addr = op->remap.start;
 			op->base.remap.unmap->va->va.range = op->remap.range;
@@ -2865,8 +2864,15 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
 			xe_svm_notifier_unlock(vm);
-			if (post_commit)
+			if (post_commit) {
+				/* Restore the old va range, in case of the
+				 * prev/next skip optimisation. Otherwise what
+				 * we re-insert here could be smaller than the
+				 * original range. */
+				op->base.remap.unmap->va->va.addr = xe_vma_start(vma);
+				op->base.remap.unmap->va->va.range = xe_vma_size(vma);
 				xe_vm_insert_vma(vm, vma);
+			}
 		}
 		break;
 	}
-- 
2.53.0

