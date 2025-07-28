Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF5C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 06:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9400610E335;
	Mon, 28 Jul 2025 06:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOFfcCQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3210E335
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 06:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753683797; x=1785219797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qjXLYdYYmLM9QHTgr4n+u/CrpZPP16WHD3MhMU8DVvM=;
 b=IOFfcCQjpFBdW5FMc/0JBNWIwVwRNf8C7HtseC87pvm7/I17fDYvINbK
 /yw0cfwOegaGsyA/rnLrFJN5znrbPAEBJ6FA8AEwKXxmMk+mmzCwNWv5P
 ADlHxQ1k46nAPOuk58Uv7hivFRvorg6zWxDa2JmLpwD77jDzmv2e4AGQT
 iWVIjSOB057YoeYV/443Bo3cgVIFJ29WGMGYP3YwQGAiT/kXCJ8T96P9r
 PIfuEtVZJRPWz7xiBi4CiJPN8oUrPPCvlthnQ/yGY1kxElgzis+zALAuF
 lB/1EvdtJuXZpZw08xjlmHEBgRZKpe2YOe5HsPfdpXIBVaiWZ5t3/Rn7I Q==;
X-CSE-ConnectionGUID: ioLnrhXCTkGPZ6R1x24DKQ==
X-CSE-MsgGUID: /PgK5gP2SWuOKFF6DobGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55000657"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55000657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:23:17 -0700
X-CSE-ConnectionGUID: MuPrQculTKSBr3szyJOcwQ==
X-CSE-MsgGUID: 3v9ronGnTDKJ2bETDF7WgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166812437"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa004.jf.intel.com with ESMTP; 27 Jul 2025 23:23:15 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2] drm/xe/vf: Fix VM crash during VF driver release
Date: Mon, 28 Jul 2025 12:10:02 +0530
Message-ID: <20250728064002.8457-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
xe 0000:00:02.1: [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel enabled
CPU: 1 UID: 0 PID: 5998 Comm: bash Kdump: loaded Tainted: G     U  W           6.16.0-xe+ #4 PREEMPT(voluntary)
xe 0000:00:02.0: [drm:xe_sriov_pf_service_handshake_vf [xe]] PF: VF1 negotiated ABI version 1.0
Tainted: [U]=USER, [W]=WARN
Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3214.D01.2505280450 05/28/2025
RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
xe 0000:00:02.1: [drm:xe_gt_sriov_vf_connect [xe]] GT0: VF: using VF/PF ABI 1.0
Code: c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 48 83 ec 10 <f6> 47 18 02 74 45 48 8b 47 38 48 8b 00 4c 8b 20 e8 69 db ff ff 80
RSP: 0018:ffffc900043eb8d0 EFLAGS: 00010282
RAX: 6b6b6b6b6b6b6b6b RBX: 6b6b6b6b6b6b6b6b RCX: ffff88811a028c40
RDX: 0000000000000000 RSI: ffff88811a028c68 RDI: 6b6b6b6b6b6b6b6b
RBP: ffffc900043eb8f8 R08: ffffffffa1695dda R09: 0000000000000010
xe 0000:00:02.1: [drm] GT0: reset done
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88811a029c40
R13: ffffc900043eb970 R14: ffff888119fc40c8 R15: ffff888119fc4548
FS:  00007e03036bf740(0000) GS:ffff8884eb3b0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005af31328c000 CR3: 0000000114534004 CR4: 0000000000f72ef0
PKRU: 55555554
Call Trace:
 <TASK>
 xe_sriov_vf_ccs_fini+0x1e/0x40 [xe]
 devm_action_release+0x12/0x30
 release_nodes+0x3a/0x120
 devres_release_all+0x96/0xd0
 device_unbind_cleanup+0x12/0x80
 device_release_driver_internal+0x23a/0x280
 device_release_driver+0x12/0x20
 pci_stop_bus_device+0x69/0x90
 pci_stop_and_remove_bus_device+0x12/0x30
 pci_iov_remove_virtfn+0xbd/0x130
 sriov_disable+0x42/0x100
 pci_disable_sriov+0x34/0x50
 xe_pci_sriov_configure+0xf71/0x1020 [xe]
 ? sriov_numvfs_store+0x78/0x160
 ? _parse_integer+0xe/0x20
 ? _kstrtoull+0x3a/0xa0
 sriov_numvfs_store+0x10c/0x160
 dev_attr_store+0x14/0x40
 sysfs_kf_write+0x4a/0x80
 kernfs_fop_write_iter+0x166/0x220
 vfs_write+0x284/0x550
 ksys_write+0x6f/0xf0
 __x64_sys_write+0x19/0x30
 x64_sys_call+0x2bf/0x2660
 do_syscall_64+0x93/0x1320
 ? ksys_dup3+0xba/0x170
 ? __x64_sys_dup2+0x2e/0x1f0
 ? do_syscall_64+0x1a2/0x1320
 ? __rseq_handle_notify_resume+0x447/0x5e0
 ? trace_hardirqs_off+0x5a/0xd0
 ? irqentry_exit_to_user_mode+0xdf/0x2f0
 ? irqentry_exit+0x77/0xb0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7e030351c574
Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
RSP: 002b:00007ffd34a10798 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007e030351c574
RDX: 0000000000000002 RSI: 00005af318d7da30 RDI: 0000000000000001
RBP: 00007ffd34a107c0 R08: 0000000000000073 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000202 R12: 0000000000000002
R13: 00005af318d7da30 R14: 00007e03036045c0 R15: 00007e0303601ee0
 </TASK>

Update the VF CCS migration initialization sequence to align with the new
migration framework changes, resolving the release-time crash.

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

---
V1 -> V2:
- Updated xe_migrate_init() input arguments and return type (Michal Wajdeczko)
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_gt.c           |  6 ++----
 drivers/gpu/drm/xe/xe_migrate.c      | 22 +++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++++-
 4 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c8eda36546d3..5a79c6e3208b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -564,11 +564,9 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt)) {
 		struct xe_tile *tile = gt_to_tile(gt);
 
-		tile->migrate = xe_migrate_init(tile);
-		if (IS_ERR(tile->migrate)) {
-			err = PTR_ERR(tile->migrate);
+		err = xe_migrate_init(tile->migrate);
+		if (err)
 			goto err_force_wake;
-		}
 	}
 
 	err = xe_uc_load_hw(&gt->uc);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 90065d7d29ff..7e295ca00763 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -396,15 +396,15 @@ struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
 
 /**
  * xe_migrate_init() - Initialize a migrate context
- * @tile: Back-pointer to the tile we're initializing for.
+ * @m: The migration context
  *
- * Return: Pointer to a migrate context on success. Error pointer on error.
+ * Return: 0 if successful, negative error code on failure
  */
-struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
+int xe_migrate_init(struct xe_migrate *m)
 {
-	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_tile *tile = m->tile;
 	struct xe_gt *primary_gt = tile->primary_gt;
-	struct xe_migrate *m = tile->migrate;
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_vm *vm;
 	int err;
 
@@ -412,14 +412,14 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
 			  XE_VM_FLAG_SET_TILE_ID(tile));
 	if (IS_ERR(vm))
-		return ERR_CAST(vm);
+		return PTR_ERR(vm);
 
 	xe_vm_lock(vm, false);
 	err = xe_migrate_prepare_vm(tile, m, vm);
 	xe_vm_unlock(vm);
 	if (err) {
 		xe_vm_close_and_put(vm);
-		return ERR_PTR(err);
+		return err;
 	}
 
 	if (xe->info.has_usm) {
@@ -430,7 +430,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
 
 		if (!hwe || !logical_mask)
-			return ERR_PTR(-EINVAL);
+			return -EINVAL;
 
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
@@ -450,7 +450,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	}
 	if (IS_ERR(m->q)) {
 		xe_vm_close_and_put(vm);
-		return ERR_CAST(m->q);
+		return PTR_ERR(m->q);
 	}
 
 	mutex_init(&m->job_mutex);
@@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
-		return ERR_PTR(err);
+		return err;
 
 	if (IS_DGFX(xe)) {
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -475,7 +475,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 			(unsigned long long)m->min_chunk_size);
 	}
 
-	return m;
+	return err;
 }
 
 static u64 max_mem_transfer_per_pass(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 3758f9615484..e81ea6b27fb5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -105,7 +105,7 @@ struct xe_migrate_pt_update {
 };
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
-struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
+int xe_migrate_init(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index af43e04179aa..bf9fa1238462 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -270,11 +270,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
 
-		migrate = xe_migrate_init(tile);
+		migrate = xe_migrate_alloc(tile);
 		if (IS_ERR(migrate)) {
 			err = PTR_ERR(migrate);
 			goto err_ret;
 		}
+
+		err = xe_migrate_init(migrate);
+		if (err)
+			goto err_ret;
+
 		ctx->migrate = migrate;
 
 		err = alloc_bb_pool(tile, ctx);
-- 
2.43.0

