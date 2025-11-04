Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E80CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64A210E31F;
	Tue,  4 Nov 2025 19:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfHHboyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A518010E31F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762283829; x=1793819829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bfee9MJTS1ndPSPxZcxggmemzufmenjbF5cSH0cXjT0=;
 b=cfHHboyNbD/26uyi6ZeqRRz4dGR5U38njOQj1CqeD1+4+Mbk+el72nAN
 2X3VFmX5LrFVJriquR00+5gJdA0a8WN2qJS06LeDFEz2rGwVhntAl8UUx
 kCVk0ykRB+BftRTLCuVI0OjzLS082oyGKpYU2LboFmtjpqN17Xk2PyxZX
 4E3o/qiGXcNEU9BXmnabgyWGOSaMkICukZI/brXRdSaDZ5WBik5lQRuoY
 X3Dzbvz0QYcpf76QqgfnulpLK/BfoNFTH8GTWusnOOgWRsQjR2E1jXqUK
 UFNT6qCmYreEmig1He3Njv3FrizbsEPwjORLWgaiLFuAPoANrL/c+qgU7 g==;
X-CSE-ConnectionGUID: iWQZQ+vFSTuWFvlirCv/FA==
X-CSE-MsgGUID: HVE/ZTYsQQ6N8M0c4s5hSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74683374"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74683374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:17:09 -0800
X-CSE-ConnectionGUID: +TFm7ihoQYme40+ENeukKA==
X-CSE-MsgGUID: IJQQ9t1SSdSCGufXRguv7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187972445"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2025 11:17:08 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, shuicheng.lin@intel.com, matthew.auld@intel.com,
 alex.zuo@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: Allow compressible surfaces to be 1-way coherent
Date: Tue,  4 Nov 2025 19:17:05 +0000
Message-ID: <20251104191705.1433993-1-x.wang@intel.com>
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

enable EN_CMP_1WCOH when initialising or restarting each GT.

add PAT entry 16 describing the compressed+coherent mapping and
expose helpers to query compression support.

remove the legacy mutual-exclusion assumption between compression
and ≥1-way coherency in the PAT macros.

reject PAT indices that enable compression for userptr mappings
or imported dma-bufs to avoid stale CCS state.

Bspec: 71582, 59361, 59399

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++
 drivers/gpu/drm/xe/xe_gt.c           | 32 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c          | 52 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pat.h          |  8 +++++
 drivers/gpu/drm/xe/xe_vm.c           | 13 +++++++
 5 files changed, 106 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2088256ad381..0e03681b8c99 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -89,6 +89,7 @@
 #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
 
 #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
+#define   EN_CMP_1WCOH				REG_BIT(15)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
 #define CCS_AUX_INV				XE_REG(0x4208)
@@ -101,6 +102,14 @@
 
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
+#define XE2_GAMWALK_CTRL			0x47e4
+#define XE2_GAMWALK_CTRL_MEDIA			XE_REG(XE2_GAMWALK_CTRL + MEDIA_GT_GSI_OFFSET)
+#define XE2_GAMWALK_CTRL_3D			XE_REG_MCR(XE2_GAMWALK_CTRL)
+#define   EN_CMP_1WCOH_GW			REG_BIT(14)
+
+#define MMIOATSREQLIMIT_GAM_WALK_3D             XE_REG_MCR(0x47f8)
+#define   DIS_ATS_WRONLY_PG                     REG_BIT(18)
+
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6d479948bf21..52f2a68d70eb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -145,6 +145,36 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
+static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
+	u32 reg;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return;
+
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
+		reg |= EN_CMP_1WCOH;
+		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
+
+		if (xe_gt_is_media_type(gt)) {
+			xe_mmio_rmw32(&gt->mmio, XE2_GAMWALK_CTRL_MEDIA, 0, EN_CMP_1WCOH_GW);
+		} else {
+			reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMWALK_CTRL_3D);
+			reg |= EN_CMP_1WCOH_GW;
+			xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
+		}
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+}
+
 static void gt_reset_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
@@ -474,6 +504,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
+	xe_gt_enable_comp_1wcoh(gt);
 
 	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -771,6 +802,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	xe_pat_init(gt);
 
 	xe_gt_enable_host_l2_vram(gt);
+	xe_gt_enable_comp_1wcoh(gt);
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 68171cceea18..a01c1c1c2373 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -100,11 +100,6 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
  * Reserved entries should be programmed with the maximum caching, minimum
  * coherency (which matches an all-0's encoding), so we can just omit them
  * in the table.
- *
- * Note: There is an implicit assumption in the driver that compression and
- * coh_1way+ are mutually exclusive. If this is ever not true then userptr
- * and imported dma-buf from external device will have uncleared ccs state. See
- * also xe_bo_needs_ccs_pages().
  */
 #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
 	{ \
@@ -114,8 +109,7 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
-		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
-			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
 		.valid = 1 \
 	}
 
@@ -151,6 +145,38 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
 	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
 };
 
+static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
+	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
+	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
+	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
+	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
+	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
+	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
+	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
+	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
+	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
+	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
+	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
+	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
+	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
+	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
+	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
+	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
+	[16] = XE2_PAT( 0, 1, 0, 0, 3, 2 ),
+	/* 17..19 are reserved; leave set to all 0's */
+	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
+	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
+	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
+	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
+	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
+	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
+	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
+	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
+	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
+	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
+	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
+	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
+};
 /* Special PAT values programmed outside the main table */
 static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
 static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
@@ -196,6 +222,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 	return xe->pat.table[pat_index].coh_mode;
 }
 
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index)
+{
+	if (WARN_ON(pat_index >= xe->pat.n_entries))
+		return false;
+	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
@@ -479,7 +512,10 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.idx[XE_CACHE_WB] = 2;
 	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
-		xe->pat.table = xe2_pat_table;
+		if (GRAPHICS_VER(xe) == 30)
+			xe->pat.table = xe3_lpg_pat_table;
+		else
+			xe->pat.table = xe2_pat_table;
 		xe->pat.pat_ats = &xe2_pat_ats;
 		if (IS_DGFX(xe))
 			xe->pat.pat_pta = &xe2_pat_pta;
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 05dae03a5f54..be6e2131b2fe 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -58,4 +58,12 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
  */
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_pat_index_get_comp_mode - Extract the compression mode for the given
+ * pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ */
+bool xe_pat_index_get_comp_mode(struct xe_device *xe, u16 pat_index);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ce2f2c063eba..e9a8a1502d9d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3360,6 +3360,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
+		bool comp_mode;
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
@@ -3376,6 +3377,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
 		(*bind_ops)[i].pat_index = pat_index;
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		comp_mode = xe_pat_index_get_comp_mode(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -3406,6 +3408,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, comp_mode &&
+				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
 				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
 		    XE_IOCTL_DBG(xe, obj &&
@@ -3482,6 +3486,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u16 pat_index, u32 op, u32 bind_flags)
 {
 	u16 coh_mode;
+	bool comp_mode;
 
 	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
@@ -3523,6 +3528,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
+	/**
+	 * Ensures that imported buffer objects (dma-bufs) are not mapped
+	 * with a PAT index that enables compression.
+	 */
+	comp_mode = xe_pat_index_get_comp_mode(xe, pat_index);
+	if (bo->ttm.base.import_attach && comp_mode)
+		return -EINVAL;
+
 	/* If a BO is protected it can only be mapped if the key is still valid */
 	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
 	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
-- 
2.43.0

