Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96606CED240
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 04:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3972010E1DD;
	Tue, 18 Nov 2025 04:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEuheWDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44A10E1DD
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 04:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763439666; x=1794975666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X4nnQbdBsymWxAdUV6Zxg1sf26JXOKhwbpYDnVrKFhw=;
 b=jEuheWDAMfeaA1MFABQ1AD3PyCf/lTd4IU0398dl+vu17OLUmew6yFLu
 MP6fFyZx1A6FUCYeVHUbA9LxnK3Eq86nNUsJSADstn+wAEEO6BTQMdbgL
 +NR5H5GIue9hTSGpPjsFX83bqWu6zayEt2o/u/Gt1YsUM6bMyybBdzAm9
 Z/L2yJy6GYqHJimyNv02qwj8mWclVbEcmqxaBasMIv0VsfBlLV248FgnG
 rHb7YbhvMpYjl1uaWjNp3IaIupL/vwn0sPeKYDkjihMP9okgXiKvCPvHZ
 GUOezHBG+RMqMnH0hqvOreeCrvtx4P7eLJ1QyYNJhyMK5BqROrOXUX5aL A==;
X-CSE-ConnectionGUID: WSP0RpVYSGWU7W3nopvLvw==
X-CSE-MsgGUID: KP76eKgaTKu7WXbamDsgyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65390389"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65390389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 20:21:05 -0800
X-CSE-ConnectionGUID: eg4OMG78SjqVD94tFqrvXA==
X-CSE-MsgGUID: LKlnx5/HSW2htvKUt6zrBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="214042844"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2025 20:21:03 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, matthew.d.roper@intel.com,
 matthew.auld@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2] drm/xe: Allow compressible surfaces to be 1-way coherent
Date: Tue, 18 Nov 2025 04:20:48 +0000
Message-ID: <20251118042048.597801-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Previously, compressible surfaces were required to be non-coherent (allocated
as WC) because compression and coherency were mutually exclusive. Starting
with Xe3, hardware supports combining compression with 1-way coherency,
allowing compressible surfaces to be allocated as WB memory. This provides
applications with more efficient memory allocation by avoiding WC allocation
overhead that can cause system stuttering and memory management challenges.

The implementation adds support for compressed+coherent PAT entry for the
xe3_lpg devices and updates the driver logic to handle the new compression
capabilities.

v2: (Matthew Auld)
- Improved error handling with XE_IOCTL_DBG()
- Enhanced documentation and comments
- Fixed xe_bo_needs_ccs_pages() outdated compression assumptions

Bspec: 71582, 59361, 59399
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++
 drivers/gpu/drm/xe/xe_bo.c           |  9 +++---
 drivers/gpu/drm/xe/xe_gt.c           | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c          | 47 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c           | 13 ++++++++
 5 files changed, 96 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..043ba797fb56 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -89,6 +89,7 @@
 #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
 
 #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
+#define   EN_CMP_1WCOH				REG_BIT(15)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
 #define CCS_AUX_INV				XE_REG(0x4208)
@@ -101,6 +102,11 @@
 
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
+#define XE2_GAMWALK_CTRL			0x47e4
+#define XE2_GAMWALK_CTRL_MEDIA			XE_REG(XE2_GAMWALK_CTRL + MEDIA_GT_GSI_OFFSET)
+#define XE2_GAMWALK_CTRL_3D			XE_REG_MCR(XE2_GAMWALK_CTRL)
+#define   EN_CMP_1WCOH_GW			REG_BIT(14)
+
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..f6a89d0d4f3b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3523,11 +3523,10 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 		return false;
 
 	/*
-	 * Compression implies coh_none, therefore we know for sure that WB
-	 * memory can't currently use compression, which is likely one of the
-	 * common cases.
-	 */
-	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
+	* Pre-Xe3: WB memory incompatible with compression.
+	* Xe3+: WB memory may use compression.
+	*/
+	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB && GRAPHICS_VER(xe) < 30)
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dbb5e7a9bc6a..05de6da997c1 100644
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
index 1b4d5d3def0f..f4f3627be069 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -102,9 +102,10 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
  * in the table.
  *
  * Note: There is an implicit assumption in the driver that compression and
- * coh_1way+ are mutually exclusive. If this is ever not true then userptr
- * and imported dma-buf from external device will have uncleared ccs state. See
- * also xe_bo_needs_ccs_pages().
+ * coh_1way+ are mutually exclusive for platforms prior to Xe3. Starting
+ * with Xe3, compression can be combined with coherency. If using compression
+ * with coherency, userptr and imported dma-buf from external device will
+ * have uncleared ccs state. See also xe_bo_needs_ccs_pages().
  */
 #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
 	{ \
@@ -114,8 +115,7 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
-		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
-			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
 		.valid = 1 \
 	}
 
@@ -151,6 +151,38 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
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
@@ -485,7 +517,10 @@ void xe_pat_init_early(struct xe_device *xe)
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c..b8811269fc92 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3359,6 +3359,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
+		bool comp_en;
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
@@ -3375,6 +3376,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
 		(*bind_ops)[i].pat_index = pat_index;
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -3405,6 +3407,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, comp_en &&
+				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
 				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
 		    XE_IOCTL_DBG(xe, obj &&
@@ -3483,6 +3487,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u16 pat_index, u32 op, u32 bind_flags)
 {
 	u16 coh_mode;
+	bool comp_en;
 
 	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
@@ -3524,6 +3529,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return -EINVAL;
 	}
 
+	/*
+	 * Ensures that imported buffer objects (dma-bufs) are not mapped
+	 * with a PAT index that enables compression.
+	 */
+	comp_en = xe_pat_index_get_comp_en(xe, pat_index);
+	if (XE_IOCTL_DBG(xe, bo->ttm.base.import_attach && comp_en))
+		return -EINVAL;
+
 	/* If a BO is protected it can only be mapped if the key is still valid */
 	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
 	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
-- 
2.43.0

