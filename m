Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C83AC44527
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 10:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD48910E161;
	Mon, 20 Jul 2026 10:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/MjsVcj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B705D10E86B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784543058; x=1816079058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gVGLrulhs+WHKtsALdXP9a+k1Rr0mPzYDxczEgpqHfk=;
 b=R/MjsVcjPok3ykRpxfQu9z5rAZmrhKQvCSvjrKq4VmlRGZkc1JVoywvC
 4Sr/PW+Gj/zemu77hpBcoZxH+JmN8sA6MFb/Nc0g/UNaHH6TOZODshFoZ
 iMgXrU3eQ6dvAs85459GyV1mKUkXH5G7b5tGpKbzmejfocFngjfymhp1c
 rHesk96stL1ZKcHKuiPxu6WKoNMUrvZygbz+QybOxQr36uCVT/BxW3KPK
 eaFEPj993jJkfyDXIq8loNc+iGsaqoK5EyQtobnC6QxMiKAqezYc4uk/5
 pDQ5jiAJlICtK+C5KWC6J3NYZm6uodcgM7OY1b+P5687YQ2UvH2TUWco1 A==;
X-CSE-ConnectionGUID: ag6SP30OTOOFRhqUvg+b7A==
X-CSE-MsgGUID: Ool0VSr8RSePlNsnbbIPPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87659453"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="87659453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:24:17 -0700
X-CSE-ConnectionGUID: GL7UIrnXQne5BT8sdvuvzw==
X-CSE-MsgGUID: XOQKXaSCSwSKiSGxNI9uSQ==
X-ExtLoop1: 1
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa003.fm.intel.com with ESMTP; 20 Jul 2026 03:24:16 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/vf: Add drm_dev guards when detaching CCS read/write
 buffers
Date: Mon, 20 Jul 2026 15:56:00 +0530
Message-ID: <20260720102604.1835784-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
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

CCS read/write buffers are freed during BO destruction. In some cases,
BOs may be destroyed after the device is unbound but while the DRM
structure remains valid, leading to NULL pointer dereferences when
accessing device resources.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 9376 Comm: xe_pat Not tainted 7.2.0-rc2+ #1 PREEMPT(lazy)
RIP: 0010:xe_sriov_vf_ccs_rw_update_bb_addr+0x4d/0xa0 [xe]
RSP: 0018:ffffcf304110b9c8 EFLAGS: 00010246
RAX: ffff8a85c38a0a00 RBX: 00000000810ef000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8a85c39c1888
RBP: ffffcf304110b9e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8a85c39c1888
R13: 0000000000000000 R14: ffff8a85c39b4f28 R15: ffff8a85c3885000
FS:  0000000000000000(0000) GS:ffff8a878b809000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000010314a002 CR4: 0000000000772ef0
PKRU: 55555554
Call Trace:
 <TASK>
 xe_migrate_ccs_rw_copy_clear+0x98/0x120 [xe]
 xe_sriov_vf_ccs_detach_bo+0x2c/0x60 [xe]
 xe_ttm_bo_delete_mem_notify+0xc8/0xe0 [xe]
 ttm_bo_cleanup_memtype_use+0x26/0x80 [ttm]
 ttm_bo_release+0x29e/0x2d0 [ttm]
 ttm_bo_fini+0x39/0x70 [ttm]
 xe_gem_object_free+0x1f/0x30 [xe]
 drm_gem_object_free+0x1d/0x40
 ttm_bo_vm_close+0x5f/0x90 [ttm]
 remove_vma+0x2c/0x70
 tear_down_vmas+0x63/0xf0
 exit_mmap+0x20d/0x3f0
 __mmput+0x45/0x170
 mmput+0x31/0x40
 do_exit+0x2ba/0xac0
 do_group_exit+0x2d/0xb0
 __x64_sys_exit_group+0x18/0x20
 x64_sys_call+0x14a0/0x2390
 do_syscall_64+0xdd/0x640
 ? count_memcg_events+0xea/0x240
 ? handle_mm_fault+0x1ec/0x2f0

Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c      | 15 +++++++++------
 drivers/gpu/drm/xe/xe_migrate.h      |  3 ++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 14 ++++++++++++--
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c84e14e86a82..b63a58902f21 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1301,7 +1301,8 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
  * Returns: None.
  */
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
-				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write,
+				  bool bound)
 {
 	struct xe_mem_pool_node *bb = src_bo->bb_ccs[read_write];
 	struct xe_device *xe = xe_bo_device(src_bo);
@@ -1315,13 +1316,15 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 	bb_pool = ctx->mem.ccs_bb_pool;
 
 	scoped_guard(mutex, xe_mem_pool_bo_swap_guard(bb_pool)) {
-		xe_mem_pool_swap_shadow_locked(bb_pool);
+		if (bound) {
+			xe_mem_pool_swap_shadow_locked(bb_pool);
 
-		cs = xe_mem_pool_node_cpu_addr(bb);
-		memset(cs, MI_NOOP, bb->sa_node.size);
-		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
+			cs = xe_mem_pool_node_cpu_addr(bb);
+			memset(cs, MI_NOOP, bb->sa_node.size);
+			xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
 
-		xe_mem_pool_sync_shadow_locked(bb);
+			xe_mem_pool_sync_shadow_locked(bb);
+		}
 		xe_mem_pool_free_node(bb);
 		src_bo->bb_ccs[read_write] = NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 78e5b63f3ebe..c3a268b01768 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -142,7 +142,8 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
-				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
+				  enum xe_sriov_vf_ccs_rw_ctxs read_write,
+				  bool bound);
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 6787564629c6..a8c831fbee3b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <drm/drm_drv.h>
+
 #include "instructions/xe_mi_commands.h"
 #include "instructions/xe_gpu_commands.h"
 #include "xe_bb.h"
@@ -446,7 +448,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem)
 	 */
 	for_each_ccs_rw_ctx(ctx_id) {
 		if (bo->bb_ccs[ctx_id])
-			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
+			xe_migrate_ccs_rw_copy_clear(bo, ctx_id, true);
 	}
 	return err;
 }
@@ -466,19 +468,27 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	struct xe_mem_pool_node *bb;
+	bool bound;
+	int idx;
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
 
 	if (!xe_bo_has_valid_ccs_bb(bo))
 		return 0;
 
+	bound = drm_dev_enter(&xe->drm, &idx);
+
 	for_each_ccs_rw_ctx(ctx_id) {
 		bb = bo->bb_ccs[ctx_id];
 		if (!bb)
 			continue;
 
-		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
+		xe_migrate_ccs_rw_copy_clear(bo, ctx_id, bound);
 	}
+
+	if (bound)
+		drm_dev_exit(idx);
+
 	return 0;
 }
 
-- 
2.53.0

