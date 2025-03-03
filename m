Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CD2C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EB010E4BE;
	Mon,  3 Mar 2025 17:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEkFRcop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6410E4BE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023340; x=1772559340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5oVbhg98FZNmGzsNmuzgaeIhE+qsP3nULRwvAYZFVP4=;
 b=nEkFRcop/Lbgh+Xoyi8en8XceFTvxcyq2ej12o90595FK0g66fmI7+yf
 V/Va4VxD7ZO9e8zyeOZyAaEcAXmzMy2FA2X6xGjoTWWLeWI2Qp5Y4ljg8
 ttgEXLCnhE/fJsNZMbhPRiLk6r4+eqX29XDjkpF7fsdmNfU4hWsIQTam7
 x0/j4JZO8wzytp1ndaFfcK0jDe6kEH6DvoZJki4A3NZqlcomFyXI+++9A
 owEbu4c+Ny9Kb0qeJY2OII8dNXhtaxs6zZLh+QYpZ8OiJuxT1+SaXkZRe
 KgM8RLLlsTi0xbE4Rrg9nTRU2kttJUDVFk4qo861FO91FRB2HYJ9YVhxM A==;
X-CSE-ConnectionGUID: TYxUli2dQ6+KK5tHLOxH4w==
X-CSE-MsgGUID: STVRROn3Sh6e9qg8vRRADQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937520"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:40 -0800
X-CSE-ConnectionGUID: GADbgL9gSHmty8pAzGIYZw==
X-CSE-MsgGUID: 1XRfk9wWS62okL4aGQx1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101307"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/5] drm/xe: Avoid reading RMW registers in emit_wa_job
Date: Mon,  3 Mar 2025 18:35:20 +0100
Message-Id: <20250303173522.1822-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

To allow VFs properly handle LRC WAs, we should postpone doing
all RMW register operations and let them be run by the engine
itself, since attempt to perform read registers from within the
driver will fail on the VF. Use MI_MATH and ALU for that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 84 ++++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 10a9e3c72b36..8068b4bc0a09 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -12,8 +12,10 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "instructions/xe_alu_commands.h"
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
@@ -176,15 +178,6 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	return 0;
 }
 
-/*
- * Convert back from encoded value to type-safe, only to be used when reg.mcr
- * is true
- */
-static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
-{
-	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
-}
-
 static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 {
 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
@@ -194,6 +187,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	struct xe_bb *bb;
 	struct dma_fence *fence;
 	long timeout;
+	int count_rmw = 0;
 	int count = 0;
 
 	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
@@ -206,30 +200,32 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	xa_for_each(&sr->xa, idx, entry)
-		++count;
+	/* count RMW registers as those will be handled separately */
+	xa_for_each(&sr->xa, idx, entry) {
+		if (entry->reg.masked || entry->clr_bits == ~0)
+			++count;
+		else
+			++count_rmw;
+	}
 
-	if (count) {
+	if (count || count_rmw)
 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
 
+	if (count) {
+		/* emit single LRI with all non RMW regs */
+
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 
 		xa_for_each(&sr->xa, idx, entry) {
 			struct xe_reg reg = entry->reg;
-			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
 			u32 val;
 
-			/*
-			 * Skip reading the register if it's not really needed
-			 */
 			if (reg.masked)
 				val = entry->clr_bits << 16;
-			else if (entry->clr_bits + 1)
-				val = (reg.mcr ?
-				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
-				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
-			else
+			else if (entry->clr_bits == ~0)
 				val = 0;
+			else
+				continue;
 
 			val |= entry->set_bits;
 
@@ -239,6 +235,52 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		}
 	}
 
+	if (count_rmw) {
+		/* emit MI_MATH for each RMW reg */
+
+		xa_for_each(&sr->xa, idx, entry) {
+			if (entry->reg.masked || entry->clr_bits == ~0)
+				continue;
+
+			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
+			bb->cs[bb->len++] = entry->reg.addr;
+			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
+
+			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+					    MI_LRI_LRM_CS_MMIO;
+			bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
+			bb->cs[bb->len++] = entry->clr_bits;
+			bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
+			bb->cs[bb->len++] = entry->set_bits;
+
+			bb->cs[bb->len++] = MI_MATH(8);
+			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
+			bb->cs[bb->len++] = CS_ALU_INSTR_LOADINV(SRCB, REG1);
+			bb->cs[bb->len++] = CS_ALU_INSTR_AND;
+			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
+			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
+			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCB, REG2);
+			bb->cs[bb->len++] = CS_ALU_INSTR_OR;
+			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
+
+			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
+			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
+			bb->cs[bb->len++] = entry->reg.addr;
+
+			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
+				  entry->reg.addr, entry->clr_bits, entry->set_bits);
+		}
+
+		/* reset used GPR */
+		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) | MI_LRI_LRM_CS_MMIO;
+		bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
+		bb->cs[bb->len++] = 0;
+		bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
+		bb->cs[bb->len++] = 0;
+		bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
+		bb->cs[bb->len++] = 0;
+	}
+
 	xe_lrc_emit_hwe_state_instructions(q, bb);
 
 	job = xe_bb_create_job(q, bb);
-- 
2.47.1

