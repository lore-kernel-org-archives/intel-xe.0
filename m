Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4598C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0710E962;
	Thu, 10 Jul 2025 20:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNCj/tbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363DA10E952
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179726; x=1783715726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rwr29Ci/aLTKQm3wa9SaQguTs6uqnKhEZSBAChf9D0o=;
 b=nNCj/tbmvu+OumfklgfMTSspEbqMpYGDyu4+JqIml+ASwMF823KB6ULR
 4iYFCXj6SnqGCPiiIq74OBtIx4t44ig1A4q8U+VDhVNSNrHIL+aX0p6Mf
 h7bteECa/AMRNQ0S4hdOTv1qYDnKqN1ToiUj+qNuc6RAmL35djt6ijm+T
 njqkxwIi27qrDG2OVIPJYdB/RDovfbGrlsaVcBRr8EhoIIItHGTzfCMdq
 C7Sv4pgTpyPATrc628qnIWFz3V2c9GxGl/AgBx+rhTlJjx5mAkPvVuKNw
 1RP6y8XfTCV4jgyDZtrCoPqw8pLXbyUnK33zqxAKEUFeArCMeBsa/iA4y g==;
X-CSE-ConnectionGUID: PUvsNotcQTebxmeC+Y6dgw==
X-CSE-MsgGUID: nQwTsNmUTgKQJ7BHgCPKgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908484"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:26 -0700
X-CSE-ConnectionGUID: pNC2dP+HT6KjkOBpCIISCw==
X-CSE-MsgGUID: pmUEH/MLRze+c3pDNrckVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744264"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 7/7] drm/xe: Waste fewer instructions in emit_wa_job()
Date: Thu, 10 Jul 2025 13:33:52 -0700
Message-ID: <20250710-lrc-refactors-v2-7-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I was debugging some unrelated issue and noticed the current code was
very verbose. We can improve it easily by using the more common batch
buffer building pattern.

Before:
                bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
     c4d:       41 8b 56 10             mov    0x10(%r14),%edx
     c51:       49 8b 4e 08             mov    0x8(%r14),%rcx
     c55:       8d 72 01                lea    0x1(%rdx),%esi
     c58:       41 89 76 10             mov    %esi,0x10(%r14)
     c5c:       c7 04 91 01 00 08 15    movl   $0x15080001,(%rcx,%rdx,4)
                        bb->cs[bb->len++] = entry->reg.addr;
     c63:       8b 08                   mov    (%rax),%ecx
     c65:       41 8b 56 10             mov    0x10(%r14),%edx
     c69:       49 8b 76 08             mov    0x8(%r14),%rsi
     c6d:       81 e1 ff ff 3f 00       and    $0x3fffff,%ecx
     c73:       8d 7a 01                lea    0x1(%rdx),%edi
     c76:       41 89 7e 10             mov    %edi,0x10(%r14)
     c7a:       89 0c 96                mov    %ecx,(%rsi,%rdx,4)
 ..etc..

After:
                *cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
     c52:       41 c7 04 24 01 00 08    movl   $0x15080001,(%r12)
     c59:       15
                        *cs++ = entry->reg.addr;
     c5a:       8b 10                   mov    (%rax),%edx
 ..etc..

Resulting in the following binary change:

	add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-348 (-348)
	Function                                     old     new   delta
	xe_gt_record_default_lrcs.cold               304     296      -8
	xe_gt_record_default_lrcs                   2200    1860    -340
	Total: Before=13554, After=13206, chg -2.57%

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 76 ++++++++++++++++++++++++---------------------
 drivers/gpu/drm/xe/xe_lrc.c | 12 ++++---
 drivers/gpu/drm/xe/xe_lrc.h |  2 +-
 3 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2d187606d2482..8bd4093a8b6d5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -194,6 +194,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	unsigned long idx;
 	struct xe_bb *bb;
 	size_t bb_len = 0;
+	u32 *cs;
 
 	/* count RMW registers as those will be handled separately */
 	xa_for_each(&sr->xa, idx, entry) {
@@ -222,13 +223,15 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
+	cs = bb->cs;
+
 	if (count) {
 		/*
 		 * Emit single LRI with all non RMW regs: 1 leading dw + 2dw per
 		 * reg + 1
 		 */
 
-		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
+		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 
 		xa_for_each(&sr->xa, idx, entry) {
 			struct xe_reg reg = entry->reg;
@@ -243,8 +246,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 
 			val |= entry->set_bits;
 
-			bb->cs[bb->len++] = reg.addr;
-			bb->cs[bb->len++] = val;
+			*cs++ = reg.addr;
+			*cs++ = val;
 			xe_gt_dbg(gt, "REG[0x%x] = 0x%08x", reg.addr, val);
 		}
 	}
@@ -256,46 +259,49 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			if (entry->reg.masked || entry->clr_bits == ~0)
 				continue;
 
-			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
-			bb->cs[bb->len++] = entry->reg.addr;
-			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
-
-			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
-					    MI_LRI_LRM_CS_MMIO;
-			bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
-			bb->cs[bb->len++] = entry->clr_bits;
-			bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
-			bb->cs[bb->len++] = entry->set_bits;
-
-			bb->cs[bb->len++] = MI_MATH(8);
-			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
-			bb->cs[bb->len++] = CS_ALU_INSTR_LOADINV(SRCB, REG1);
-			bb->cs[bb->len++] = CS_ALU_INSTR_AND;
-			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
-			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
-			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCB, REG2);
-			bb->cs[bb->len++] = CS_ALU_INSTR_OR;
-			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
-
-			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
-			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
-			bb->cs[bb->len++] = entry->reg.addr;
+			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
+			*cs++ = entry->reg.addr;
+			*cs++ = CS_GPR_REG(0, 0).addr;
+
+			*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+				MI_LRI_LRM_CS_MMIO;
+			*cs++ = CS_GPR_REG(0, 1).addr;
+			*cs++ = entry->clr_bits;
+			*cs++ = CS_GPR_REG(0, 2).addr;
+			*cs++ = entry->set_bits;
+
+			*cs++ = MI_MATH(8);
+			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
+			*cs++ = CS_ALU_INSTR_LOADINV(SRCB, REG1);
+			*cs++ = CS_ALU_INSTR_AND;
+			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
+			*cs++ = CS_ALU_INSTR_LOAD(SRCA, REG0);
+			*cs++ = CS_ALU_INSTR_LOAD(SRCB, REG2);
+			*cs++ = CS_ALU_INSTR_OR;
+			*cs++ = CS_ALU_INSTR_STORE(REG0, ACCU);
+
+			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
+			*cs++ = CS_GPR_REG(0, 0).addr;
+			*cs++ = entry->reg.addr;
 
 			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
 				  entry->reg.addr, entry->clr_bits, entry->set_bits);
 		}
 
 		/* reset used GPR */
-		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) | MI_LRI_LRM_CS_MMIO;
-		bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
-		bb->cs[bb->len++] = 0;
-		bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
-		bb->cs[bb->len++] = 0;
-		bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
-		bb->cs[bb->len++] = 0;
+		*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) |
+			MI_LRI_LRM_CS_MMIO;
+		*cs++ = CS_GPR_REG(0, 0).addr;
+		*cs++ = 0;
+		*cs++ = CS_GPR_REG(0, 1).addr;
+		*cs++ = 0;
+		*cs++ = CS_GPR_REG(0, 2).addr;
+		*cs++ = 0;
 	}
 
-	xe_lrc_emit_hwe_state_instructions(q, bb);
+	cs = xe_lrc_emit_hwe_state_instructions(q, cs);
+
+	bb->len = cs - bb->cs;
 
 	ret = emit_job_sync(q, bb, HZ);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8b240144829e9..bda495b94c08d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1786,7 +1786,7 @@ static const struct instr_state xe_hpg_svg_state[] = {
 	{ .instr = CMD_3DSTATE_DRAWING_RECTANGLE, .num_dw = 4 },
 };
 
-void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
+u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs)
 {
 	struct xe_gt *gt = q->hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1821,7 +1821,7 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 	if (!state_table) {
 		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
 			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
-		return;
+		return cs;
 	}
 
 	for (int i = 0; i < state_table_size; i++) {
@@ -1844,12 +1844,14 @@ void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *b
 		    instr == CMD_3DSTATE_DRAWING_RECTANGLE)
 			instr = CMD_3DSTATE_DRAWING_RECTANGLE_FAST;
 
-		bb->cs[bb->len] = instr;
+		*cs = instr;
 		if (!is_single_dw)
-			bb->cs[bb->len] |= (num_dw - 2);
+			*cs |= (num_dw - 2);
 
-		bb->len += num_dw;
+		cs += num_dw;
 	}
+
+	return cs;
 }
 
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eb6e8de8c939e..b6c8053c581ba 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -112,7 +112,7 @@ void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class);
 
-void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
+u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);

-- 
2.49.0

