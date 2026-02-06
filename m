Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F375EE6B66
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2F10E251;
	Fri,  6 Feb 2026 22:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXkfhCRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6328710E251
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 22:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770417068; x=1801953068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ZJ9UoxQDN+ye9MqgQTFbbXyry0XNOUFNo1g5Na9mLQ=;
 b=XXkfhCRf/oyN035PXTnQrNWZKqqcCVzkfJcRpFg4hJE50SydSNbsfkgY
 2HWvniLC68ZOpPz95zmoITgFnaijTPADMD8DYExyc3ScpH1udwK34U/sx
 XW/I5IkLKolfdI8XA2c3QOgbGCD1sgqeRts8npgcrkMrr5+hqru6e+WKP
 t13R501Ln8YYHknuiLSNrxrprbsuz8OkzUUy/2EYVuqSHekfHbgr8Lx2D
 bWhEA0Zdey0LGr9t2LxzGhMxkE9bAoT0VBjE0LqmXi/WetwciauZoYd/d
 m4dV1X9WfOLXiPBrN+HlK0dz3y/xF46ddqxkTNDHN8ALkQh2rKCMwjJju Q==;
X-CSE-ConnectionGUID: M/K+LnqhR6K6/lXePHyVug==
X-CSE-MsgGUID: n7hEr8cxQxeK0q+0Z0QYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94280079"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="94280079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:31:07 -0800
X-CSE-ConnectionGUID: CkjwJeAcSpqRCeMU1TOAGw==
X-CSE-MsgGUID: PHjA5W43T0SAzEPt/keYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="241642000"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:31:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/wa: Steer RMW of MCR registers while building default
 LRC
Date: Fri,  6 Feb 2026 14:30:59 -0800
Message-ID: <20260206223058.387014-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

When generating the default LRC, if a register is not masked, we apply
any save-restore programming necessary via a read-modify-write sequence
that will ensure we only update the relevant bits/fields without
clobbering the rest of the register.  However some of the registers that
need to be updated might be MCR registers which require steering to a
non-terminated instance to ensure we can read back a valid, non-zero
value. The steering of reads originating from a command streamer is
controlled by register CS_MMIO_GROUP_INSTANCE_SELECT.  Emit additional
MI_LRI commands to update the steering before any RMW of an MCR register
to ensure the reads are performed properly.

Note that needing to perform a RMW of an MCR register while building the
default LRC is pretty rare.  Most of the MCR registers that are part of
an engine's LRCs are also masked registers, so no MCR is necessary.

Fixes: f2f90989ccff ("drm/xe: Avoid reading RMW registers in emit_wa_job")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 +++
 drivers/gpu/drm/xe/xe_gt.c               | 66 +++++++++++++++++++-----
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 68172b0248a6..dc5a4fafa70c 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -96,6 +96,12 @@
 #define   ENABLE_SEMAPHORE_POLL_BIT		REG_BIT(13)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+
+#define CS_MMIO_GROUP_INSTANCE_SELECT(base)	XE_REG((base) + 0xcc)
+#define   SELECTIVE_READ_ADDRESSING		REG_BIT(30)
+#define   SELECTIVE_READ_GROUP			REG_GENMASK(29, 23)
+#define   SELECTIVE_READ_INSTANCE		REG_GENMASK(22, 16)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 22132467ff4f..ae041168fabf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -207,11 +207,15 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	return ret;
 }
 
+/* Dwords required to emit a RMW of a register */
+#define EMIT_RMW_DW 20
+
 static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 {
-	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
+	struct xe_hw_engine *hwe = q->hwe;
+	struct xe_reg_sr *sr = &hwe->reg_lrc;
 	struct xe_reg_sr_entry *entry;
-	int count_rmw = 0, count = 0, ret;
+	int count_rmw = 0, count_rmw_mcr = 0, count = 0, ret;
 	unsigned long idx;
 	struct xe_bb *bb;
 	size_t bb_len = 0;
@@ -221,6 +225,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	xa_for_each(&sr->xa, idx, entry) {
 		if (entry->reg.masked || entry->clr_bits == ~0)
 			++count;
+		else if (entry->reg.mcr)
+			++count_rmw_mcr;
 		else
 			++count_rmw;
 	}
@@ -228,17 +234,35 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (count)
 		bb_len += count * 2 + 1;
 
-	if (count_rmw)
-		bb_len += count_rmw * 20 + 7;
+	/*
+	 * RMW of MCR registers is the same as a normal RMW, except an
+	 * additional LRI (3 dwords) is required per register to steer the read
+	 * to a nom-terminated instance.
+	 *
+	 * We could probably shorten the batch slightly by eliding the
+	 * steering for consecutive MCR registers that have the same
+	 * group/instance target, but it's not worth the extra complexity to do
+	 * so.
+	 */
+	bb_len += count_rmw * EMIT_RMW_DW;
+	bb_len += count_rmw_mcr * (EMIT_RMW_DW + 3);
 
-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
+	/*
+	 * After doing all RMW, we need 7 trailing dwords to clean up,
+	 * plus an additional 3 dwords to reset steering if any of the
+	 * registers were MCR.
+	 */
+	if (count_rmw || count_rmw_mcr)
+		bb_len += 7 + (count_rmw_mcr ? 3 : 0);
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER)
 		/*
 		 * Big enough to emit all of the context's 3DSTATE via
 		 * xe_lrc_emit_hwe_state_instructions()
 		 */
-		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
+		bb_len += xe_gt_lrc_size(gt, hwe->class) / sizeof(u32);
 
-	xe_gt_dbg(gt, "LRC %s WA job: %zu dwords\n", q->hwe->name, bb_len);
+	xe_gt_dbg(gt, "LRC %s WA job: %zu dwords\n", hwe->name, bb_len);
 
 	bb = xe_bb_new(gt, bb_len, false);
 	if (IS_ERR(bb))
@@ -273,13 +297,23 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		}
 	}
 
-	if (count_rmw) {
-		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
-
+	if (count_rmw || count_rmw_mcr) {
 		xa_for_each(&sr->xa, idx, entry) {
 			if (entry->reg.masked || entry->clr_bits == ~0)
 				continue;
 
+			if (entry->reg.mcr) {
+				struct xe_reg_mcr reg = { .__reg.raw = entry->reg.raw };
+				u8 group, instance;
+
+				xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
+				*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+				*cs++ = CS_MMIO_GROUP_INSTANCE_SELECT(hwe->mmio_base).addr;
+				*cs++ = SELECTIVE_READ_ADDRESSING |
+					REG_FIELD_PREP(SELECTIVE_READ_GROUP, group) |
+					REG_FIELD_PREP(SELECTIVE_READ_INSTANCE, instance);
+			}
+
 			*cs++ = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
 			*cs++ = entry->reg.addr;
 			*cs++ = CS_GPR_REG(0, 0).addr;
@@ -305,8 +339,9 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			*cs++ = CS_GPR_REG(0, 0).addr;
 			*cs++ = entry->reg.addr;
 
-			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
-				  entry->reg.addr, entry->clr_bits, entry->set_bits);
+			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x%s\n",
+				  entry->reg.addr, entry->clr_bits, entry->set_bits,
+				  entry->reg.mcr ? " (MCR)" : "");
 		}
 
 		/* reset used GPR */
@@ -318,6 +353,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 		*cs++ = 0;
 		*cs++ = CS_GPR_REG(0, 2).addr;
 		*cs++ = 0;
+
+		/* reset steering */
+		if (count_rmw_mcr) {
+			*cs++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+			*cs++ = CS_MMIO_GROUP_INSTANCE_SELECT(q->hwe->mmio_base).addr;
+			*cs++ = 0;
+		}
 	}
 
 	cs = xe_lrc_emit_hwe_state_instructions(q, cs);
-- 
2.52.0

