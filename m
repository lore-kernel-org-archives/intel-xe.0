Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A52CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF9610E80F;
	Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWI/rdi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58210E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151197; x=1792687197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4TitDIDiRvQHYVnrKNIUlUjd+4O2QkX55VJD6otaaA=;
 b=mWI/rdi/sncO0x9TW/YODsM44zta2i4phHRJtYVtGigJ/R/85bllFW6o
 GtRvOQNEJ9mBKz2bTRU77jt84h2jGD8A0DsxeYzk0OwA66ixsOYDNG9+L
 nDqYtQhIW7lBmenWJX7DlGcJX0CS5ijMng4SLNGjdEUwG3vwecYLEeXWs
 1LmFoLPBKbqtOuKD+FBVfgKm4PPehGGAy9KbDRdKmw54Na73j2B94TpwR
 ZO96WQR7DxPDwTXt9UVTtbOkWeD4J/t3L0zmvxX28YpNxqveoX+Du5COJ
 rKhA20NFqZieeTVpHhuTikMM4yCTsxBafVzgqPd3r2SA27clB6sQRduGj g==;
X-CSE-ConnectionGUID: UwMcHk6tR8iZWOOLunvs3g==
X-CSE-MsgGUID: scrMOc9fSsmMU9PlUmC3Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911754"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:57 -0700
X-CSE-ConnectionGUID: gm88Y+45Q8qfFL5cGr/Iew==
X-CSE-MsgGUID: gb/M9Lw3TBaLTzbMQodW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043701"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 6/7] drm/xe/migrate: support MEM_COPY instruction
Date: Wed, 22 Oct 2025 17:38:35 +0100
Message-ID: <20251022163836.191405-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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

Make this the default on xe2+ when doing a copy. This has a few
advantages over the exiting copy instruction:

1) It has a special PAGE_COPY mode that claims to be optimised for
   page-in/page-out, which is the vast majority of current users.

2) It also has a simple BYTE_COPY mode that supports byte granularity
   copying without any restrictions.

With 2) we can now easily skip the bounce buffer flow when copying
buffers with strange sizing/alignment, like for memory_access. But that
is left for the next patch.

v2 (Matt Brost):
  - Use device info to check whether device should use the MEM_COPY
    path. This should fit better with making this a configfs tunable.
  - And with that also keep old path still functional on xe2 for possible
    experimentation.
  - Add a define for PAGE_COPY page-size.
v3 (Matt Brost):
  - Fallback to an actual linear copy for pitch=1.
  - Also update NVL.

BSpec: 57561
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  2 +
 drivers/gpu/drm/xe/xe_migrate.c               | 61 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
 5 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 8cfcd3360896..5d41ca297447 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -31,6 +31,12 @@
 #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
 #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
 
+#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
+#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
+#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
+#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
+#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
+
 #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
 #define   PVC_MEM_SET_CMD_LEN_DW	7
 #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e..6a62b520f5b5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -305,6 +305,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
+		u8 has_mem_copy_instr:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 95aefe2e71f5..1bbc7bca33ed 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -699,9 +699,9 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 }
 
 #define EMIT_COPY_DW 10
-static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
-		      u64 src_ofs, u64 dst_ofs, unsigned int size,
-		      unsigned int pitch)
+static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+			      u64 dst_ofs, unsigned int size,
+			      unsigned int pitch)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 mocs = 0;
@@ -730,6 +730,61 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 	bb->cs[bb->len++] = upper_32_bits(src_ofs);
 }
 
+#define PAGE_COPY_MODE_PS SZ_256 /* hw uses 256 bytes as the page-size */
+static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
+			  u64 dst_ofs, unsigned int size, unsigned int pitch)
+{
+	u32 mode, copy_type, width;
+
+	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
+	xe_gt_assert(gt, pitch <= U16_MAX);
+	xe_gt_assert(gt, pitch);
+	xe_gt_assert(gt, size);
+
+	if (IS_ALIGNED(size, PAGE_COPY_MODE_PS) &&
+	    IS_ALIGNED(lower_32_bits(src_ofs), PAGE_COPY_MODE_PS) &&
+	    IS_ALIGNED(lower_32_bits(dst_ofs), PAGE_COPY_MODE_PS)) {
+		mode = MEM_COPY_PAGE_COPY_MODE;
+		copy_type = 0; /* linear copy */
+		width = size / PAGE_COPY_MODE_PS;
+	} else if (pitch > 1) {
+		xe_gt_assert(gt, size / pitch <= U16_MAX);
+		mode = 0; /* BYTE_COPY */
+		copy_type = MEM_COPY_MATRIX_COPY;
+		width = pitch;
+	} else {
+		mode = 0; /* BYTE_COPY */
+		copy_type = 0; /* linear copy */
+		width = size;
+	}
+
+	xe_gt_assert(gt, width <= U16_MAX);
+
+	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
+	bb->cs[bb->len++] = width - 1;
+	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page-copy/linear above */
+	bb->cs[bb->len++] = pitch - 1;
+	bb->cs[bb->len++] = pitch - 1;
+	bb->cs[bb->len++] = lower_32_bits(src_ofs);
+	bb->cs[bb->len++] = upper_32_bits(src_ofs);
+	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
+	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
+	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
+			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
+}
+
+static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
+		      u64 src_ofs, u64 dst_ofs, unsigned int size,
+		      unsigned int pitch)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.has_mem_copy_instr)
+		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
+	else
+		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
+}
+
 static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
 {
 	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c3136141a953..c9f07fac48b9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -342,6 +342,7 @@ static const struct xe_device_desc lnl_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_pxp = true,
+	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
@@ -362,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_heci_cscfi = 1,
 	.has_late_bind = true,
 	.has_sriov = true,
+	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
@@ -378,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_sriov = true,
+	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
@@ -390,6 +393,7 @@ static const struct xe_device_desc nvls_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_flat_ccs = 1,
+	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.va_bits = 48,
@@ -657,6 +661,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index a4451bdc79fb..9892c063a9c5 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -46,6 +46,7 @@ struct xe_device_desc {
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_mem_copy_instr:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
-- 
2.51.0

