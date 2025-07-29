Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC0C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 06:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3E10E5CE;
	Tue, 29 Jul 2025 06:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKs2rDws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F1910E5CE
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753770392; x=1785306392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pt9EMjY7628tP3Ryf5Se3zC+9cl6mWeXD+MPyCj+DhM=;
 b=fKs2rDwsZAmoQmpvZQWQ3iv6YMGJo53a0sBroduWVEEpIGwZ5igzv2IC
 McyYyz3hXSpeTUDOm0of9XgKS2hFWd9NFdcqKcCr8KrVIJjz3XsOoBVWA
 h6YlaKPFU2+z96b87tYK5GN7R4ZsY3F/miraIoQyU6zMeFPLtk3DFhbfQ
 0T+U+pFO3GuxTVVntpgb1jvOC+YM1hVNfuCBVbVCKTWGB0Eoc17+3t1MK
 6kDzIslukSTWqH/VsrhJXiLs7vxau4bVilw3HWcZkJ/Pg+LaE7Bd7SomV
 5orrCX5YctIR2XV7Cc4WCiKRAaLapOspIDfpKozgYbG5w5JW+xngL7i2U w==;
X-CSE-ConnectionGUID: jMrXBnRMTAO4O8f4+cuPmg==
X-CSE-MsgGUID: fjKvlB/PTVazWrVBcpxjnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56177809"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="56177809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:26:32 -0700
X-CSE-ConnectionGUID: xmZLZPf2R/+XdGfuLmxw3A==
X-CSE-MsgGUID: 0NSLtCvOSk653ZSxMz93Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="163393659"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 28 Jul 2025 23:26:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3] drm/xe/vf: Fix VM crash during VF driver release
Date: Tue, 29 Jul 2025 12:13:17 +0530
Message-ID: <20250729064317.28366-1-satyanarayana.k.v.p@intel.com>
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

Oops: general protection fault, probably for non-canonical address
0x6b6b6b6b6b6b6b83: 0000 [#1] SMP NOPTI
RIP: 0010:xe_lrc_ring_head+0x12/0xb0 [xe]
Call Trace:
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

Update the VF CCS migration initialization sequence to align with the new
migration framework changes, resolving the release-time crash.

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
V2 -> V3:
- Fixed issue with error handling in xe_migrate_init() (Michal)

V1 -> V2:
- Updated xe_migrate_init() input arguments and return type (Michal)
- Fixed review comments.
---
 drivers/gpu/drm/xe/xe_gt.c           |  6 ++---
 drivers/gpu/drm/xe/xe_migrate.c      | 40 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h      |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  7 ++++-
 4 files changed, 33 insertions(+), 22 deletions(-)

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
index 90065d7d29ff..a5b2fe6ecac2 100644
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
 
@@ -412,15 +412,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
 			  XE_VM_FLAG_SET_TILE_ID(tile));
 	if (IS_ERR(vm))
-		return ERR_CAST(vm);
+		return PTR_ERR(vm);
 
 	xe_vm_lock(vm, false);
 	err = xe_migrate_prepare_vm(tile, m, vm);
 	xe_vm_unlock(vm);
-	if (err) {
-		xe_vm_close_and_put(vm);
-		return ERR_PTR(err);
-	}
+	if (err)
+		goto err_out;
 
 	if (xe->info.has_usm) {
 		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
@@ -429,8 +427,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 							   false);
 		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
 
-		if (!hwe || !logical_mask)
-			return ERR_PTR(-EINVAL);
+		if (!hwe || !logical_mask) {
+			err = -EINVAL;
+			goto err_out;
+		}
 
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
@@ -449,8 +449,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_MIGRATE, 0);
 	}
 	if (IS_ERR(m->q)) {
-		xe_vm_close_and_put(vm);
-		return ERR_CAST(m->q);
+		err = PTR_ERR(m->q);
+		goto err_out;
 	}
 
 	mutex_init(&m->job_mutex);
@@ -460,7 +460,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
-		return ERR_PTR(err);
+		goto err_release_queue;
 
 	if (IS_DGFX(xe)) {
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -475,7 +475,15 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 			(unsigned long long)m->min_chunk_size);
 	}
 
-	return m;
+	return err;
+
+err_release_queue:
+	xe_exec_queue_put(m->q);
+
+err_out:
+	xe_vm_close_and_put(vm);
+	return err;
+
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

