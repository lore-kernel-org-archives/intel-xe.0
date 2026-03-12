Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC88105A59F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FE410EA0C;
	Thu, 12 Mar 2026 13:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlgJGOld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7310EA0C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773323227; x=1804859227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+tLosyNYAW5XlMaNAlUNPFHjKptQ5MpcCNy3zcqRK78=;
 b=OlgJGOldWL15DlGJV0Qkpw8rYa50rGprB2j0adm9pmHSdFHUje0Az8+W
 bB9X0wg6qRTb1iUuIauUkitcvxARkEcVG/aRvX9Z5NlzVUh47Z+Z6qjJM
 tVfJfNJkc3S/E4QaC14EmGI/ze9YuPWMUIm9srhA20JeC21N2DQHbKX/q
 HeeCazUpETKdk65gI0Qx5ijmpsAqONIKd9tKeSN0FSQqWCkVDmWCqG0I+
 fTbclRGlHqaTU1wxQYE+crLr028JbE7UETlGDBtz2O9Ci3FbTMlmaeSI4
 S4tREo5udO5c/pE49ARfAehwbAOPepT/KAY2zhThwCjneAAuSLnb7Huly Q==;
X-CSE-ConnectionGUID: I4dbW/v+T6CSrq5KbzpKTw==
X-CSE-MsgGUID: TmJXJcHZTZWJi6OJgGo/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74382320"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74382320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:47:07 -0700
X-CSE-ConnectionGUID: Txe7U5uOQfWTyxv4G4vnrQ==
X-CSE-MsgGUID: t5twzfg9TJaCZnc3K2okow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="251319166"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.114])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:47:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: always keep track of remap prev/next
Date: Thu, 12 Mar 2026 13:46:49 +0000
Message-ID: <20260312134648.286641-2-matthew.auld@intel.com>
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
we skip doing the rebind of those vma and set next/prev to NULL.
However, if we need to do an ops unwind later, we currently need to know
the next/prev when removing the two end vma, before then re-inserting
the original vma we tried to split. If we don't remove the prev/end vma,
then the re-insertion could fail since the two end vma are overlapping
the range we want to re-insert. This could explain the user bug, and
does seem to fit.

With that keep prev/next intact, and rely on skip prev/next.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_vm.c |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 13b355fadd58..a5bc553f8456 100644
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
@@ -2178,12 +2178,12 @@ static int op_prepare(struct xe_vm *vm,
 
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
@@ -2408,10 +2408,10 @@ static void op_commit(struct xe_vm *vm,
 
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
index 5572e12c2a7e..9a897388ff5f 100644
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
@@ -2594,7 +2593,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 			if (!err && op->remap.skip_next) {
 				op->remap.next->tile_present =
 					tile_present;
-				op->remap.next = NULL;
 			}
 		}
 
-- 
2.53.0

