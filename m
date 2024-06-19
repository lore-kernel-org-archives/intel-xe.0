Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C53C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 14:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6320610ECC4;
	Wed, 19 Jun 2024 14:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wkg166oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885210ECC4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718807519; x=1750343519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gaMK1mcJoxSfqiqXEpn/vWXq7dDpmoG5aD8kRe0mJwU=;
 b=Wkg166oUp8Q9cyLmI7RQSOI/HOGbmZ3bX0M6ceR9c11r89HcNr6UxftK
 u9mEw6a94v8xifK3waGyzAeREHAZsVQj6BvpLb2RNRXwHjyOlELV+KVR0
 GcY7xazWa61A805tKTFUHFk2aSefKJAmCy4tkKuxZe6dxiIKLZJ7IEOjA
 jEjSXbWy8byyADv4ASESKRHkYg4aRLN1hKkoYKvT649SFHqc9CPjp4hSU
 M80vTtX3zV4cLzcktL6J2it+Ir3S7XryO79DX/m+Y2Yw3F+8KDc6PQZG1
 +8FChjdzwKNgRpeTbKcz0bLnKqEH/mCA7csy0QywkopYzNHB6+yFYMDpt A==;
X-CSE-ConnectionGUID: rUbYP3uORvKKk7oyMrS9Fw==
X-CSE-MsgGUID: U3U8yY4YQfKmS/lXImq1nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26341936"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26341936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:31:59 -0700
X-CSE-ConnectionGUID: pC9BvsvuQT6sL1WWW1JiYw==
X-CSE-MsgGUID: Pq3xwaKSROqFKwe2iOg9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="47071530"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:31:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH 1/2] drm/xe/bmg: implement Wa_16023588340
Date: Wed, 19 Jun 2024 15:31:26 +0100
Message-ID: <20240619143127.110045-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
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

This involves enabling l2 caching of host side memory access to VRAM
through the CPU BAR. The main fallout here is with display since VRAM
writes from CPU can now be cached in GPU l2, and display is never
coherent with caches, so needs various manual flushing.  In the case of
fbc we disable it due to complications in getting this to work
correctly (in a later patch).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  3 ++
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c |  8 ++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  3 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h       |  8 ++++
 drivers/gpu/drm/xe/xe_device.c             | 30 ++++++++++++
 drivers/gpu/drm/xe/xe_device.h             |  1 +
 drivers/gpu/drm/xe/xe_gt.c                 | 54 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c                | 11 ++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules         |  1 +
 9 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 20dc9759bb3c..0e16e5029081 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -24,10 +24,13 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
+	$(obj)/xe_device.o \
 	$(obj)/xe_gsc.o \
+	$(obj)/xe_gt.o \
 	$(obj)/xe_guc.o \
 	$(obj)/xe_guc_ads.o \
 	$(obj)/xe_migrate.o \
+	$(obj)/xe_pat.o \
 	$(obj)/xe_ring_ops.o \
 	$(obj)/xe_vm.o \
 	$(obj)/xe_wa.o \
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 9e860c61f4b3..ccd0d87d438a 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -7,6 +7,8 @@
 #include "intel_display_types.h"
 #include "intel_dsb_buffer.h"
 #include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_gt.h"
 
 u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
@@ -16,7 +18,10 @@ u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
 
 void intel_dsb_buffer_write(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val)
 {
+	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
+
 	iosys_map_wr(&dsb_buf->vma->bo->vmap, idx * 4, u32, val);
+	xe_device_l2_flush(xe);
 }
 
 u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
@@ -26,9 +31,12 @@ u32 intel_dsb_buffer_read(struct intel_dsb_buffer *dsb_buf, u32 idx)
 
 void intel_dsb_buffer_memset(struct intel_dsb_buffer *dsb_buf, u32 idx, u32 val, size_t size)
 {
+	struct xe_device *xe = dsb_buf->vma->bo->tile->xe;
+
 	WARN_ON(idx > (dsb_buf->buf_size - size) / sizeof(*dsb_buf->cmd_buf));
 
 	iosys_map_memset(&dsb_buf->vma->bo->vmap, idx * 4, val, size);
+	xe_device_l2_flush(xe);
 }
 
 bool intel_dsb_buffer_create(struct intel_crtc *crtc, struct intel_dsb_buffer *dsb_buf, size_t size)
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..240b59561fe7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -10,6 +10,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_pm.h"
@@ -304,6 +305,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err_unpin;
 
+	/* Ensure DPT writes are flushed */
+	xe_device_l2_flush(xe);
 	return vma;
 
 err_unpin:
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d44564bad009..fd9d94174efb 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,6 +80,9 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
+#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
+#define   CG_DIS_CNTLBUS			REG_BIT(6)
+
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
@@ -372,6 +375,11 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
+#define XE2_GLOBAL_INVAL			XE_REG(0xb404)
+
+#define SCRATCH1LPFC				XE_REG(0xb474)
+#define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75d4c8ae9234..4d3fed0163ea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -54,6 +54,9 @@
 #include "xe_vm.h"
 #include "xe_vram.h"
 #include "xe_wait_user_fence.h"
+#include "xe_wa.h"
+
+#include <generated/xe_wa_oob.h>
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -767,6 +770,11 @@ void xe_device_td_flush(struct xe_device *xe)
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 
+	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
+		xe_device_l2_flush(xe);
+		return;
+	}
+
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
 			continue;
@@ -790,6 +798,28 @@ void xe_device_td_flush(struct xe_device *xe)
 	}
 }
 
+void xe_device_l2_flush(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	int err;
+
+	gt = xe_root_mmio_gt(xe);
+
+	if (!XE_WA(gt, 16023588340))
+		return;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return;
+
+	xe_mmio_write32(gt, XE2_GLOBAL_INVAL, 0x1);
+
+	if (xe_mmio_wait32(gt, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
+		xe_gt_err_once(gt, "Global invalidation timeout\n");
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..0a2a3e7fd402 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -162,6 +162,7 @@ u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 void xe_device_td_flush(struct xe_device *xe);
+void xe_device_l2_flush(struct xe_device *xe);
 
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 57d84751e160..32268f13b82e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -10,6 +10,8 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
@@ -93,6 +95,51 @@ void xe_gt_sanitize(struct xe_gt *gt)
 	gt->uc.guc.submission_state.enabled = false;
 }
 
+static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
+{
+	u32 reg;
+	int err;
+
+	if (!XE_WA(gt, 16023588340))
+		return;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(err))
+		return;
+
+	if (!xe_gt_is_media_type(gt)) {
+		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
+		reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
+		reg |= CG_DIS_CNTLBUS;
+		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
+	}
+
+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
+static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
+{
+	u32 reg;
+	int err;
+
+	if (!XE_WA(gt, 16023588340))
+		return;
+
+	if (xe_gt_is_media_type(gt))
+		return;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (WARN_ON(err))
+		return;
+
+	reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
+	reg &= ~CG_DIS_CNTLBUS;
+	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
 /**
  * xe_gt_remove() - Clean up the GT structures before driver removal
  * @gt: the GT object
@@ -109,6 +156,8 @@ void xe_gt_remove(struct xe_gt *gt)
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+
+	xe_gt_disable_host_l2_vram(gt);
 }
 
 static void gt_reset_worker(struct work_struct *w);
@@ -506,6 +555,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 
 	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
+	xe_gt_enable_host_l2_vram(gt);
 
 	err = xe_uc_init(&gt->uc);
 	if (err)
@@ -641,6 +691,8 @@ static int do_gt_restart(struct xe_gt *gt)
 
 	xe_pat_init(gt);
 
+	xe_gt_enable_host_l2_vram(gt);
+
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
@@ -788,6 +840,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_idle_disable_pg(gt);
 
+	xe_gt_disable_host_l2_vram(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "suspended\n");
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 4ee32ee1cc88..722278cc23fc 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -7,6 +7,8 @@
 
 #include <drm/xe_drm.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_reg_defs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -15,6 +17,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 
 #define _PAT_ATS				0x47fc
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
@@ -382,7 +385,13 @@ void xe_pat_init_early(struct xe_device *xe)
 	if (GRAPHICS_VER(xe) == 20) {
 		xe->pat.ops = &xe2_pat_ops;
 		xe->pat.table = xe2_pat_table;
-		xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
+
+		/* Wa_16023588340. XXX: Should use XE_WA */
+		if (GRAPHICS_VERx100(xe) == 2001)
+			xe->pat.n_entries = 28; /* Disable CLOS3 */
+		else
+			xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
+
 		xe->pat.idx[XE_CACHE_NONE] = 3;
 		xe->pat.idx[XE_CACHE_WT] = 15;
 		xe->pat.idx[XE_CACHE_WB] = 2;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 12fe88796a49..3152d869018d 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,3 +27,4 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+16023588340	GRAPHICS_VERSION(2001)
-- 
2.45.1

