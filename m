Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7412C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8161D10E0C4;
	Fri,  1 Dec 2023 09:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EF010E0C4
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422810; x=1732958810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WR5Ru5m3+0s2n2JppGzavJ+pqwJZKpXUtgIVEImvEV4=;
 b=S5Os2o8FN4fy+LEZg8rxluDw2ju1XAZJzjgpCOe+VrmYsvDIamoU0Dtz
 no7mrO8/vOjyqzlK5kbOYPHQ0j/bldo9l3DtyYP7KYk1I081tPZ/FIUY3
 9lA6yGjCPeAetUS6mMM4QHJiIeZC9CYsziURW5bad1D5k1v+jCD46WcFz
 F5+K2650/SQX6Ta8EDC1oEe7sMtB20fILgglhMxEINrttGR33MWFthXzG
 DZuJf5ltmv+21FoUsb6o+9V2idkCgtQBMxev8t4NzwCVHChw7aZalfcjL
 jPJGnYlRbcgYxIQVKBr0NHtPmKyvy+ovZPbv4I2qdtNeSRy3kpaPaDrOG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378498919"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="378498919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798655726"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798655726"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2023 01:26:49 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 14:44:00 +0530
Message-Id: <20231201091405.658548-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231201091405.658548-1-animesh.manna@intel.com>
References: <20231201091405.658548-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/6] Revert "FIXME: drm/i915/dsb: xe changes
 for dsb"
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

This reverts commit ae96663654bcc3bff12f5c497647df2818e0c1a8.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 117 +++++------------------
 1 file changed, 24 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 796b1b36dc59..3e32aa49b8eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -4,13 +4,7 @@
  *
  */
 
-// As with intelde_dpt, this depends on some gem internals, fortunately easier to fix..
-#ifdef I915
 #include "gem/i915_gem_internal.h"
-#else
-#include "xe_bo.h"
-#include "xe_gt.h"
-#endif
 
 #include "i915_drv.h"
 #include "i915_irq.h"
@@ -24,10 +18,6 @@
 #include "intel_vrr.h"
 #include "skl_watermark.h"
 
-#ifndef I915
-#define CACHELINE_BYTES 64
-#endif
-
 struct i915_vma;
 
 enum dsb_id {
@@ -42,12 +32,8 @@ struct intel_dsb {
 	enum dsb_id id;
 
 	u32 *cmd_buf;
-	struct intel_crtc *crtc;
-#ifdef I915
 	struct i915_vma *vma;
-#else
-	struct xe_bo *obj;
-#endif
+	struct intel_crtc *crtc;
 
 	/*
 	 * maximum number of dwords the buffer will hold.
@@ -70,42 +56,6 @@ struct intel_dsb {
 	int dewake_scanline;
 };
 
-static u32 dsb_ggtt_offset(struct intel_dsb *dsb)
-{
-#ifdef I915
-	return i915_ggtt_offset(dsb->vma);
-#else
-	return xe_bo_ggtt_addr(dsb->obj);
-#endif
-}
-
-static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val)
-{
-#ifdef I915
-	dsb->cmd_buf[idx] = val;
-#else
-	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
-#endif
-}
-
-static u32 dsb_read(struct intel_dsb *dsb, u32 idx)
-{
-#ifdef I915
-	return dsb->cmd_buf[idx];
-#else
-	return iosys_map_rd(&dsb->obj->vmap, idx * 4, u32);
-#endif
-}
-
-static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz)
-{
-#ifdef I915
-	memset(&dsb->cmd_buf[idx], val, sz);
-#else
-	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
-#endif
-}
-
 /**
  * DOC: DSB
  *
@@ -178,6 +128,8 @@ static bool is_dsb_busy(struct drm_i915_private *i915, enum pipe pipe,
 
 static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 {
+	u32 *buf = dsb->cmd_buf;
+
 	if (!assert_dsb_has_room(dsb))
 		return;
 
@@ -186,13 +138,14 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)
 
 	dsb->ins_start_offset = dsb->free_pos;
 
-	dsb_write(dsb, dsb->free_pos++, ldw);
-	dsb_write(dsb, dsb->free_pos++, udw);
+	buf[dsb->free_pos++] = ldw;
+	buf[dsb->free_pos++] = udw;
 }
 
 static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
 					u32 opcode, i915_reg_t reg)
 {
+	const u32 *buf = dsb->cmd_buf;
 	u32 prev_opcode, prev_reg;
 
 	/*
@@ -203,8 +156,8 @@ static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
 	if (dsb->free_pos == 0)
 		return false;
 
-	prev_opcode = dsb_read(dsb, dsb->ins_start_offset + 1) & ~DSB_REG_VALUE_MASK;
-	prev_reg =  dsb_read(dsb, dsb->ins_start_offset + 1) & DSB_REG_VALUE_MASK;
+	prev_opcode = buf[dsb->ins_start_offset + 1] & ~DSB_REG_VALUE_MASK;
+	prev_reg = buf[dsb->ins_start_offset + 1] & DSB_REG_VALUE_MASK;
 
 	return prev_opcode == opcode && prev_reg == i915_mmio_reg_offset(reg);
 }
@@ -237,8 +190,6 @@ static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb, i915_reg_
 void intel_dsb_reg_write(struct intel_dsb *dsb,
 			 i915_reg_t reg, u32 val)
 {
-	u32 old_val;
-
 	/*
 	 * For example the buffer will look like below for 3 dwords for auto
 	 * increment register:
@@ -262,30 +213,31 @@ void intel_dsb_reg_write(struct intel_dsb *dsb,
 			       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
 			       i915_mmio_reg_offset(reg));
 	} else {
+		u32 *buf = dsb->cmd_buf;
+
 		if (!assert_dsb_has_room(dsb))
 			return;
 
 		/* convert to indexed write? */
 		if (intel_dsb_prev_ins_is_mmio_write(dsb, reg)) {
-			u32 prev_val = dsb_read(dsb, dsb->ins_start_offset + 0);
+			u32 prev_val = buf[dsb->ins_start_offset + 0];
 
-			dsb_write(dsb, dsb->ins_start_offset + 0, 1); /* count */
-			dsb_write(dsb, dsb->ins_start_offset + 1,
+			buf[dsb->ins_start_offset + 0] = 1; /* count */
+			buf[dsb->ins_start_offset + 1] =
 				(DSB_OPCODE_INDEXED_WRITE << DSB_OPCODE_SHIFT) |
-				i915_mmio_reg_offset(reg));
-			dsb_write(dsb, dsb->ins_start_offset + 2, prev_val);
+				i915_mmio_reg_offset(reg);
+			buf[dsb->ins_start_offset + 2] = prev_val;
 
 			dsb->free_pos++;
 		}
 
-		dsb_write(dsb, dsb->free_pos++, val);
+		buf[dsb->free_pos++] = val;
 		/* Update the count */
-		old_val = dsb_read(dsb, dsb->ins_start_offset);
-		dsb_write(dsb, dsb->ins_start_offset, old_val + 1);
+		buf[dsb->ins_start_offset]++;
 
 		/* if number of data words is odd, then the last dword should be 0.*/
 		if (dsb->free_pos & 0x1)
-			dsb_write(dsb, dsb->free_pos, 0);
+			buf[dsb->free_pos] = 0;
 	}
 }
 
@@ -344,7 +296,7 @@ static void intel_dsb_align_tail(struct intel_dsb *dsb)
 	aligned_tail = ALIGN(tail, CACHELINE_BYTES);
 
 	if (aligned_tail > tail)
-		dsb_memset(dsb, dsb->free_pos, 0,
+		memset(&dsb->cmd_buf[dsb->free_pos], 0,
 		       aligned_tail - tail);
 
 	dsb->free_pos = aligned_tail / 4;
@@ -406,7 +358,7 @@ static void _intel_dsb_commit(struct intel_dsb *dsb, u32 ctrl,
 			  ctrl | DSB_ENABLE);
 
 	intel_de_write_fw(dev_priv, DSB_HEAD(pipe, dsb->id),
-			  dsb_ggtt_offset(dsb));
+			  i915_ggtt_offset(dsb->vma));
 
 	if (dewake_scanline >= 0) {
 		int diff, hw_dewake_scanline;
@@ -428,7 +380,7 @@ static void _intel_dsb_commit(struct intel_dsb *dsb, u32 ctrl,
 	}
 
 	intel_de_write_fw(dev_priv, DSB_TAIL(pipe, dsb->id),
-			  dsb_ggtt_offset(dsb) + tail);
+			  i915_ggtt_offset(dsb->vma) + tail);
 }
 
 /**
@@ -453,7 +405,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
 	enum pipe pipe = crtc->pipe;
 
 	if (wait_for(!is_dsb_busy(dev_priv, pipe, dsb->id), 1)) {
-		u32 offset = dsb_ggtt_offset(dsb);
+		u32 offset = i915_ggtt_offset(dsb->vma);
 
 		intel_de_write_fw(dev_priv, DSB_CTRL(pipe, dsb->id),
 				  DSB_ENABLE | DSB_HALT);
@@ -493,11 +445,10 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct intel_dsb *dsb;
-	unsigned int size;
-#ifdef I915
 	struct i915_vma *vma;
+	unsigned int size;
 	u32 *buf;
-#endif
+
 	if (!HAS_DSB(i915))
 		return NULL;
 
@@ -510,7 +461,6 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	/* ~1 qword per instruction, full cachelines */
 	size = ALIGN(max_cmds * 8, CACHELINE_BYTES);
 
-#ifdef I915
 	obj = i915_gem_object_create_internal(i915, PAGE_ALIGN(size));
 	if (IS_ERR(obj))
 		goto out_put_rpm;
@@ -533,21 +483,6 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	dsb->vma = vma;
 	dsb->crtc = crtc;
 	dsb->cmd_buf = buf;
-#else
-	/* ~1 qword per instruction, full cachelines */
-	size = ALIGN(max_cmds * 8, 64);
-	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
-				   NULL, PAGE_ALIGN(size),
-				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
-				   XE_BO_CREATE_GGTT_BIT);
-	if (IS_ERR(obj)) {
-		kfree(dsb);
-		goto out_put_rpm;
-        }
-	dsb->obj = obj;
-#endif
-
 	dsb->size = size / 4; /* in dwords */
 	dsb->free_pos = 0;
 	dsb->ins_start_offset = 0;
@@ -575,10 +510,6 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
  */
 void intel_dsb_cleanup(struct intel_dsb *dsb)
 {
-#ifdef I915
 	i915_vma_unpin_and_release(&dsb->vma, I915_VMA_RELEASE_MAP);
-#else
-	xe_bo_unpin_map_no_vm(dsb->obj);
-#endif
 	kfree(dsb);
 }
-- 
2.29.0

