Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B74C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ECB10E75D;
	Wed, 12 Jun 2024 02:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEPOIgPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F52210E1FA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157938; x=1749693938;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0Y8zVe2MgiP7GtKsfN5j1iModKWUC+LZczCGSjInAPE=;
 b=jEPOIgPTnME6d6i8U29CyH3qC9FxlSNxFGW/4VnICoQda12S9FBlSsAD
 23Cvk41bEEATfkE2+CQ7Y+m8UWgbVU80YV80yADlYsBM25GuhPh2GWtRb
 YHk6pPNnKOS+ecb5oqgbacFsyGw4AI1mSvXzj960kBJfaYvkf+K6LhHdJ
 YSmmIlvq7jfgiNfWrRS4HfQkatMhz6pembW0+YkymYhH06mGRDdYeHY8z
 xbVuGMSUHugME7E3Q8JcTx2GmoLplI6+gK/4KRskuTYTTnloVnsic/DCo
 +q8Rhzw2la3b7ZdbIArM6xTQ+tXRoOlQfpT0w6wsZffV7Zfkbvq/kXRGz w==;
X-CSE-ConnectionGUID: EzYr9bHpQOa66KKXTKa3+g==
X-CSE-MsgGUID: JcVYLqMOR9ShhUoLGooq+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15028660"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15028660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:38 -0700
X-CSE-ConnectionGUID: DvRoxf/4Ry2PmYbjLx6vDg==
X-CSE-MsgGUID: dZEAooJySNC7L9HvP32kBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="39738465"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:05:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/17] drm/xe/oa: Add OAR support
Date: Tue, 11 Jun 2024 19:05:24 -0700
Message-ID: <20240612020531.2680081-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
References: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
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

Add OAR support to allow userspace to execute MI_REPORT_PERF_COUNT on
render engines. Configuration batches are used to program the OAR unit, as
well as modifying the render engine context image of a specified exec queue
(to have correct register values when that context switches in).

v2: Rename/refactor xe_oa_modify_self (Umesh)
v3: Move IS_MI_LRI_CMD() into xe_oa.c (Michal)

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   1 +
 drivers/gpu/drm/xe/xe_oa.c                    | 193 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h              |   4 +
 6 files changed, 206 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..ba4db8913098 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -45,6 +45,7 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 263ffc7bc2ef..cdc68d373165 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -129,6 +129,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c1bb85d2e243..21f2f47ac274 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -649,12 +649,18 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 /* Make the magic macros work */
 #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
+#define __xe_lrc_regs_offset xe_lrc_regs_offset
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_PPHWSP_SIZE SZ_4K
 
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
+{
+	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
+}
+
 static size_t lrc_reg_size(struct xe_device *xe)
 {
 	if (GRAPHICS_VERx100(xe) >= 1250)
@@ -686,11 +692,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
-static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
-{
-	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
-}
-
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
 	/* Indirect ring state page is at the very end of LRC */
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 882c3437ba5c..114822624219 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -52,6 +52,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
 u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7b22dfcd92f5..ab2101a4e990 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -13,7 +13,9 @@
 #include <drm/xe_drm.h>
 
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
@@ -24,6 +26,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -58,6 +61,12 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
+struct flex {
+	struct xe_reg reg;
+	u32 offset;
+	u32 value;
+};
+
 struct xe_oa_open_param {
 	u32 oa_unit_id;
 	bool sample;
@@ -598,6 +607,93 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 		free_oa_config_bo(oa_bo);
 }
 
+static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+			     struct xe_bb *bb, const struct flex *flex, u32 count)
+{
+	u32 offset = xe_bo_ggtt_addr(lrc->bo);
+
+	do {
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
+		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
+		bb->cs[bb->len++] = 0;
+		bb->cs[bb->len++] = flex->value;
+
+	} while (flex++, --count);
+}
+
+static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+				  const struct flex *flex, u32 count)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 4 * count, false);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		goto exit;
+	}
+
+	xe_oa_store_flex(stream, lrc, bb, flex, count);
+
+	err = xe_oa_submit_bb(stream, bb);
+	xe_bb_free(bb, NULL);
+exit:
+	return err;
+}
+
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 3, false);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		goto exit;
+	}
+
+	write_cs_mi_lri(bb, reg_lri, 1);
+
+	err = xe_oa_submit_bb(stream, bb);
+	xe_bb_free(bb, NULL);
+exit:
+	return err;
+}
+
+static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
+{
+	const struct xe_oa_format *format = stream->oa_buffer.format;
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
+	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
+	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
+		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
+
+	struct flex regs_context[] = {
+		{
+			OACTXCONTROL(stream->hwe->mmio_base),
+			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
+			enable ? OA_COUNTER_RESUME : 0,
+		},
+		{
+			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
+			regs_offset + CTX_CONTEXT_CONTROL,
+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
+		},
+	};
+	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
+	int err;
+
+	/* Modify stream hwe context image with regs_context */
+	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
+				     regs_context, ARRAY_SIZE(regs_context));
+	if (err)
+		return err;
+
+	/* Apply reg_lri using LRI */
+	return xe_oa_load_with_lri(stream, &reg_lri);
+}
+
 #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
 
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
@@ -615,6 +711,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	/* disable the context save/restore or OAR counters */
+	if (stream->exec_q)
+		xe_oa_configure_oar_context(stream, false);
+
 	/* Make sure we disable noa to save power. */
 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
@@ -743,6 +843,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	u32 oa_debug, sqcnt1;
+	int ret;
 
 	/*
 	 * Wa_1508761755:xehpsdv, dg2
@@ -780,6 +881,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if (stream->exec_q) {
+		ret = xe_oa_configure_oar_context(stream, true);
+		if (ret)
+			return ret;
+	}
+
 	return xe_oa_emit_oa_config(stream);
 }
 
@@ -949,6 +1056,81 @@ static const struct file_operations xe_oa_fops = {
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
+static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER ||
+		hwe->class == XE_ENGINE_CLASS_COMPUTE;
+}
+
+static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
+{
+	u32 idx = *offset;
+	u32 len = min(MI_LRI_LEN(state[idx]) + idx, end);
+	bool found = false;
+
+	idx++;
+	for (; idx < len; idx += 2) {
+		if (state[idx] == reg) {
+			found = true;
+			break;
+		}
+	}
+
+	*offset = idx;
+	return found;
+}
+
+#define IS_MI_LRI_CMD(x) (REG_FIELD_GET(MI_OPCODE, (x)) == \
+			  REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
+
+static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
+{
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
+	u32 len = (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
+		   lrc->ring.size) / sizeof(u32);
+	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
+	u32 *state = (u32 *)lrc->bo->vmap.vaddr;
+
+	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
+		return U32_MAX;
+
+	for (; offset < len; ) {
+		if (IS_MI_LRI_CMD(state[offset])) {
+			/*
+			 * We expect reg-value pairs in MI_LRI command, so
+			 * MI_LRI_LEN() should be even
+			 */
+			drm_WARN_ON(&stream->oa->xe->drm,
+				    MI_LRI_LEN(state[offset]) & 0x1);
+
+			if (xe_oa_find_reg_in_lri(state, reg, &offset, len))
+				break;
+		} else {
+			offset++;
+		}
+	}
+
+	return offset < len ? offset : U32_MAX;
+}
+
+static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
+{
+	struct xe_reg reg = OACTXCONTROL(stream->hwe->mmio_base);
+	u32 offset = stream->oa->ctx_oactxctrl_offset[stream->hwe->class];
+
+	/* Do this only once. Failure is stored as offset of U32_MAX */
+	if (offset)
+		goto exit;
+
+	offset = xe_oa_context_image_offset(stream, reg.addr);
+	stream->oa->ctx_oactxctrl_offset[stream->hwe->class] = offset;
+
+	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset\n",
+		stream->hwe->name, offset);
+exit:
+	return offset && offset != U32_MAX ? 0 : -ENODEV;
+}
+
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
@@ -966,6 +1148,17 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->periodic = param->period_exponent > 0;
 	stream->period_exponent = param->period_exponent;
 
+	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
+		/* If we don't find the context offset, just return error */
+		ret = xe_oa_set_ctx_ctrl_offset(stream);
+		if (ret) {
+			drm_err(&stream->oa->xe->drm,
+				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
+				stream->hwe->name);
+			goto exit;
+		}
+	}
+
 	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
 	if (!stream->oa_config) {
 		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 5bb8ce0d71c9..d28ee566c51c 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -13,6 +13,7 @@
 
 #include <drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
+#include "xe_hw_engine_types.h"
 
 #define XE_OA_BUFFER_SIZE SZ_16M
 
@@ -137,6 +138,9 @@ struct xe_oa {
 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
 	struct idr metrics_idr;
 
+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
+	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
+
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-- 
2.41.0

