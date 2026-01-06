Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E21CEFCEC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 18:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616110E1D3;
	Tue,  6 Jan 2026 18:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPFec0Xv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB04110E1D3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767724844; x=1799260844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cn8VKLBLypnAgJyxUsGbtWbt22pDhJ+FtUrGj5WMfDE=;
 b=nPFec0Xv9CD3rp4ZYwBtyEmpFEzImJwQwLZJiYHOTAZGxCbNG4BEGLBy
 ov87fln9Mwg6mVdd+3D6/NyejQ/xpw9nhokvzgEd1NTjzl18fcE0jcteD
 x2fqiSet9XIFIVrwjlGFQMb5ceK7joTwfAI9xld552nL33fp9LbpvMlLV
 FxW8PIQSVhouHAQXlQrDGPGX6yYzC1T51e8IjiczkudiUA0WJAKRhI92y
 fJt7W+uHK9LhLlnCLFuFA8WIcpMWnKmg8pDbKx9llC1S01TGIAa5b6zrm
 UihsJp+B23XIFBt32gP4wRd1ankToyPjEFycF0z/9i9oaNHE13J0bMkb5 g==;
X-CSE-ConnectionGUID: KIZXakfsTDuPhEPJH6evpQ==
X-CSE-MsgGUID: xHJs9p7ySLefMFdfwmb61w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69029400"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="69029400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 10:40:44 -0800
X-CSE-ConnectionGUID: hjWVS5slShKXescvWGjPLA==
X-CSE-MsgGUID: ZMhKIdSuTJCtARhEG+Zvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202487122"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 06 Jan 2026 10:40:43 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3] drm/xe: Allow compressible surfaces to be 1-way coherent
Date: Tue,  6 Jan 2026 18:40:31 +0000
Message-ID: <20260106184031.964336-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104191705.1433993-1-x.wang@intel.com>
References: <20251104191705.1433993-1-x.wang@intel.com>
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

v3:
 - Improve WB compression support detection by checking PAT table instead
of version check

Bspec: 71582, 59361, 59399
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++
 drivers/gpu/drm/xe/xe_bo.c           | 41 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt.c           | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c          | 47 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c           | 13 ++++++++
 5 files changed, 124 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 93643da57428..24fc64fc832e 100644
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
index 8b6474cd3eaf..efd199557f67 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -29,6 +29,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pxp.h"
@@ -3517,17 +3518,39 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
 		return false;
 
+	/* Check if userspace explicitly requested no compression */
+	if (bo->flags & XE_BO_FLAG_NO_COMPRESSION)
+		return false;
+
 	/*
-	 * Compression implies coh_none, therefore we know for sure that WB
-	 * memory can't currently use compression, which is likely one of the
-	 * common cases.
-	 * Additionally, userspace may explicitly request no compression via the
-	 * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also disable
-	 * CCS usage.
+	 * For WB (Write-Back) CPU caching mode, check if compression is
+	 * supported through any available PAT index. If not, FlatCCS
+	 * can't be used.
 	 */
-	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
-	    bo->flags & XE_BO_FLAG_NO_COMPRESSION)
-		return false;
+	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB) {
+		bool wb_comp_supported = false;
+
+		/*
+		 * Compression for WB caching was introduced in
+		 * GRAPHICS_VER 30 (Xe2). Earlier versions do not
+		 * support it.
+		 */
+		if (GRAPHICS_VER(xe) < 30)
+			return false;
+
+		for (int i = 0; i < xe->pat.n_entries; i++) {
+			if (!xe->pat.table[i].valid)
+				continue;
+			if (xe_pat_index_get_comp_en(xe, i) &&
+			    xe_pat_index_get_coh_mode(xe, i) != XE_COH_NONE) {
+				wb_comp_supported = true;
+				break;
+			}
+		}
+
+		if (!wb_comp_supported)
+			return false;
+	}
 
 	return true;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 313ce83ab0e5..04dbf995a18b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -140,6 +140,36 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
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
@@ -466,6 +496,7 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	xe_gt_topology_init(gt);
 	xe_gt_mcr_init(gt);
 	xe_gt_enable_host_l2_vram(gt);
+	xe_gt_enable_comp_1wcoh(gt);
 
 	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
@@ -745,6 +776,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	xe_pat_init(gt);
 
 	xe_gt_enable_host_l2_vram(gt);
+	xe_gt_enable_comp_1wcoh(gt);
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2c3375e0250b..440a9013dc04 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -132,9 +132,10 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
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
@@ -144,8 +145,7 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
 			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
 			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
 			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
-		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
-			XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
+		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE, \
 		.valid = 1 \
 	}
 
@@ -181,6 +181,38 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
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
@@ -501,7 +533,10 @@ void xe_pat_init_early(struct xe_device *xe)
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
index a07d8b53de66..481ee7763b09 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3405,6 +3405,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
+		bool comp_en;
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
@@ -3421,6 +3422,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
 		(*bind_ops)[i].pat_index = pat_index;
 		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -3451,6 +3453,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, comp_en &&
+				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
 				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
 		    XE_IOCTL_DBG(xe, obj &&
@@ -3529,6 +3533,7 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u16 pat_index, u32 op, u32 bind_flags)
 {
 	u16 coh_mode;
+	bool comp_en;
 
 	if (XE_IOCTL_DBG(xe, (bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
 			 xe_pat_index_get_comp_en(xe, pat_index)))
@@ -3574,6 +3579,14 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
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

