Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71DEC10F04
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F51F10E9DC;
	Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3A10E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017816; x=1733553816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t08pWbEgPMe4Lnkbgdjl5DDH1dN4rgeBnq6Q1ub3jLU=;
 b=VvY3Be1m1hAIouZEZjb4UQ72Y13sF2FKXuUhO/mukdo1oGIf/2rzwPqM
 O7wQQXyaY5PzACcyuZDdn7Vlu1J1NZN74nXUem1fU30/YZYb//9f9PvNJ
 PoZW1joMYGUd8J0wHHhHhyw/5BafYOvT5bretVzG/3oCDYCK0I43Tbc27
 s+6/QqE8DUJ0FbBzi3cRGFzeG/o6KEyAhdvLelSovhNiVxlznw2IWDSqS
 NAaQEr8iENPdznRUwv3RnP1C+44lCk89NZr+S6e7C9NC0ds0+GtnkkZRb
 1NLsTf6zP1g+0je4qeWt55gWj7c6znoKTpX/w3zM6kdb3tL0By8oFcgjF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866613"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866613"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699257"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699257"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/17] drm/xe/oa: Add OAR support
Date: Thu,  7 Dec 2023 22:43:24 -0800
Message-ID: <20231208064329.2387604-13-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   1 +
 drivers/gpu/drm/xe/xe_oa.c                    | 216 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h              |   4 +
 6 files changed, 232 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 1cfa96167fde3..d333132b021e0 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -45,6 +45,9 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
+#define   IS_MI_LRI_CMD(x)		(REG_FIELD_GET(MI_OPCODE, (x)) == \
+					 REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1b..76c0938df05f3 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -71,7 +71,8 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 17c0eb9e62cfb..8586e1f4a7fbc 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -565,12 +565,18 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
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
@@ -602,11 +608,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
-static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
-{
-	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
-}
-
 #define DECL_MAP_ADDR_HELPERS(elem) \
 static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 { \
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 28b1d3f404d4f..d6d8aa8fb51eb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,6 +23,7 @@ void xe_lrc_finish(struct xe_lrc *lrc);
 
 size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 073476721377d..9d653d7722d1a 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,7 +12,9 @@
 #include <drm/xe_drm.h>
 
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -20,6 +22,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
 #include "xe_sched_job.h"
@@ -63,6 +66,12 @@ struct xe_oa_config {
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
@@ -640,6 +649,119 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
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
+static int xe_oa_modify_context(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+				const struct flex *flex, u32 count)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 4 * count + 1, false);
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
+static void xe_oa_load_flex(struct xe_oa_stream *stream, struct xe_bb *bb,
+			    const struct flex *flex, u32 count)
+{
+	XE_WARN_ON(!count || count > 63);
+
+	bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
+
+	do {
+		bb->cs[bb->len++] = flex->reg.addr;
+		bb->cs[bb->len++] = flex->value;
+
+	} while (flex++, --count);
+
+	bb->cs[bb->len++] = MI_NOOP;
+}
+
+static int xe_oa_modify_self(struct xe_oa_stream *stream,
+			     const struct flex *flex, u32 count)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 2 * count + 3, false);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		goto exit;
+	}
+
+	xe_oa_load_flex(stream, bb, flex, count);
+
+	err = xe_oa_submit_bb(stream, bb);
+	xe_bb_free(bb, NULL);
+exit:
+	return err;
+}
+
+#define OAR_OAC_OACONTROL_OFFSET 0x5B0
+
+static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
+{
+	const struct xe_oa_format *format = stream->oa_buffer.format;
+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
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
+	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
+	struct flex regs_lri[] = {
+		{
+			OAR_OACONTROL,
+			OAR_OAC_OACONTROL_OFFSET + 1,
+			oacontrol,
+		},
+	};
+	int err;
+
+	/* Modify stream hwe context image with regs_context */
+	err = xe_oa_modify_context(stream, &stream->exec_q->lrc[0],
+				   regs_context, ARRAY_SIZE(regs_context));
+	if (err)
+		return err;
+
+	/* Apply regs_lri using LRI */
+	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
+}
+
 #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
 
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
@@ -657,6 +779,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	/* disable the context save/restore or OAR counters */
+	if (stream->exec_q)
+		xe_oa_configure_oar_context(stream, false);
+
 	/* Make sure we disable noa to save power. */
 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
@@ -814,6 +940,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	u32 oa_debug, sqcnt1;
+	int ret;
 
 	/*
 	 * Wa_1508761755:xehpsdv, dg2
@@ -851,6 +978,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if (stream->exec_q) {
+		ret = xe_oa_configure_oar_context(stream, true);
+		if (ret)
+			return ret;
+	}
+
 	return xe_oa_emit_oa_config(stream);
 }
 
@@ -988,6 +1121,78 @@ static const struct file_operations xe_oa_fops = {
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
+static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
+{
+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	u32 len = (xe_lrc_size(stream->oa->xe, stream->hwe->class) +
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
@@ -1008,6 +1213,17 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
index 05047226af8d1..bcd8d249faaec 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -13,6 +13,7 @@
 
 #include <drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
+#include "xe_hw_engine_types.h"
 
 #define XE_OA_BUFFER_SIZE SZ_16M
 
@@ -132,6 +133,9 @@ struct xe_oa {
 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
 	struct idr metrics_idr;
 
+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
+	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
+
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-- 
2.41.0

