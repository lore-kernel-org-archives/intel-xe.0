Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F672C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 00:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70D210E1CD;
	Fri, 21 Jul 2023 00:30:14 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA8010E165
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689899412; x=1721435412;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Syg5eAKoQnI7WsdSjo+JObVwyJ+5WQuQA/mbcTXoN5o=;
 b=FoMRSRVR9Z2JBEYS+llvhdD0Abn64aThh5qZhILcd220F8Ov+jSCXfMP
 cqp2BaJDQBWis4ms//HcFd2L045Pk8MdKxdF9xDnLoRDfp3Uvz0OFMSDi
 k+yosjRRzV2tGO0o53aZ5grDdrYWpWjUi9hAaLd+rjyjABHih3HidMp+s
 24JjYWQY4zidGA4cmqSUl0tjcy1YjJxtJ2vVUmjbbuI1rQLZZlSalS6jx
 7/FjtOcbX1XBSH5EIhGKvRXaJFG030R37sxaJyIyj2gmKg/5iPsnt8fbB
 0/njgVttMocMQHvqLxUSeCcjHS3UBs4+A8lo6NyJg6Iz8PZJQbIgFhL4m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="366934999"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="366934999"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="790015283"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="790015283"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 17:30:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 17:30:03 -0700
Message-ID: <20230721003006.3467377-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
References: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/10] drm/xe/oa: OA stream initialization
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

Implement majority of OA stream initialization (as part of OA stream open
ioctl). The OA buffer is allocated for receiving perf counter samples from
HW. The selected counter configuration is programmed into OA unit HW using
a command/batch buffer. For OAR, the render context image is modified so as
to have correct register values when the context switches in.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 680 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 677 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 2f6f9a888f2e0..5ee4962b05d43 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -11,13 +11,26 @@
 #include <drm/xe_drm.h>
 #include <drm/drm_drv.h>
 
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
+#include "regs/xe_regs.h"
+#include "xe_bb.h"
+#include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
+#include "xe_lrc.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
+#include "xe_sched_job.h"
+#include "xe_vm.h"
 
+#define OA_BUFFER_SIZE		SZ_16M
+#define OA_TAKEN(tail, head)	(((tail) - (head)) & (OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 
@@ -25,6 +38,12 @@ static u32 xe_oa_stream_paranoid = true;
 static int xe_oa_sample_rate_hard_limit;
 static u32 xe_oa_max_sample_rate = 100000;
 
+struct flex {
+	struct xe_reg reg;
+	u32 offset;
+	u32 value;
+};
+
 static const struct xe_oa_format oa_formats[] = {
 	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
 	[XE_OA_FORMAT_A12]			= { 0, 64 },
@@ -51,6 +70,13 @@ struct xe_oa_open_properties {
 	u64 poll_oa_period;
 };
 
+struct xe_oa_config_bo {
+	struct llist_node node;
+
+	struct xe_oa_config *oa_config;
+	struct xe_bb *bb;
+};
+
 static struct ctl_table_header *sysctl_header;
 
 static void xe_oa_config_release(struct kref *ref)
@@ -73,6 +99,642 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
 	kref_put(&oa_config->ref, xe_oa_config_release);
 }
 
+static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
+{
+	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
+}
+
+static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
+{
+	struct xe_oa_config *oa_config;
+
+	rcu_read_lock();
+	oa_config = idr_find(&oa->metrics_idr, metrics_set);
+	if (oa_config)
+		oa_config = xe_oa_config_get(oa_config);
+	rcu_read_unlock();
+
+	return oa_config;
+}
+
+static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
+{
+	xe_oa_config_put(oa_bo->oa_config);
+	xe_bb_free(oa_bo->bb, NULL);
+	kfree(oa_bo);
+}
+
+static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
+{
+	return &stream->hwe->oa_group->regs;
+}
+
+static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
+{
+	struct xe_hw_engine *hwe = stream->hwe;
+	struct xe_engine *e = stream->engine;
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	struct xe_vm *vm;
+	u64 batch_ofs;
+	long timeout;
+	int err = 0;
+
+	vm = xe_migrate_get_vm(stream->gt->tile->migrate);
+	e = xe_engine_create(hwe->gt->tile->xe, vm, BIT(hwe->logical_instance), 1,
+			     hwe, ENGINE_FLAG_WA);
+	if (IS_ERR(e)) {
+		err = PTR_ERR(e);
+		drm_err(&stream->oa->xe->drm, "gt%d, hwe %s, xe_engine_create,e failed=%d",
+			stream->gt->info.id, hwe->name, err);
+		goto put_vm;
+	}
+
+	batch_ofs = xe_bo_ggtt_addr(stream->gt->tile->mem.kernel_bb_pool->bo);
+	/* Will add MI_BATCH_BUFFER_END */
+	job = xe_bb_create_wa_job(e, bb, batch_ofs);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto put_engine;
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	if (timeout < 0)
+		err = timeout;
+	else if (!timeout)
+		err = -ETIME;
+put_engine:
+	xe_engine_put(e);
+put_vm:
+	xe_vm_put(vm);
+
+	return err;
+}
+
+static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
+{
+	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
+}
+
+static void xe_oa_free_configs(struct xe_oa_stream *stream)
+{
+	struct xe_oa_config_bo *oa_bo, *tmp;
+
+	xe_oa_config_put(stream->oa_config);
+	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
+		free_oa_config_bo(oa_bo);
+}
+
+static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+			     struct xe_bb *bb, const struct flex *flex, u32 count)
+{
+	u32 offset = xe_bo_ggtt_addr(lrc->bo);
+
+	do {
+		bb->cs[bb->len++] = MI_STORE_DWORD_IMM_GEN4 | MI_SRM_LRM_GLOBAL_GTT;
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
+	int err = 0;
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
+	bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(count);
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
+	int err = 0;
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
+static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
+{
+	int err;
+	u32 format = stream->oa_buffer.format->format;
+	u32 offset = stream->oa->ctx_oactxctrl_offset;
+	struct flex regs_context[] = {
+		{
+			GEN8_OACTXCONTROL,
+			offset + 1,
+			enable ? GEN8_OA_COUNTER_RESUME : 0,
+		},
+	};
+#define	GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE BIT(8)
+#define GEN12_OAR_OACONTROL_OFFSET 0x5B0
+	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
+	struct flex regs_lri[] = {
+		{
+			GEN12_OAR_OACONTROL,
+			GEN12_OAR_OACONTROL_OFFSET + 1,
+			(format << GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT) |
+			(enable ? GEN12_OAR_OACONTROL_COUNTER_ENABLE : 0)
+		},
+		{
+			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
+			CTX_CONTEXT_CONTROL,
+			_MASKED_FIELD(GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE,
+				      enable ?
+				      GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE :
+				      0)
+		},
+	};
+
+	/* Modify the context image of pinned context with regs_context */
+	err = xe_oa_modify_context(stream, &stream->engine->lrc[0],
+				   regs_context, ARRAY_SIZE(regs_context));
+	if (err)
+		return err;
+
+	/* Apply regs_lri using LRI with pinned context */
+	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
+}
+
+#define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
+
+static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
+{
+	u32 sqcnt1;
+
+	/*
+	 * Wa_1508761755:xehpsdv, dg2
+	 * Enable thread stall DOP gating and EU DOP gating.
+	 */
+	if (stream->gt->tile->xe->info.platform == XE_DG2) {
+		xe_gt_mcr_multicast_write(stream->gt, GEN8_ROW_CHICKEN,
+					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
+		xe_mmio_write32(stream->gt, GEN7_ROW_CHICKEN2,
+				_MASKED_BIT_ENABLE(GEN12_DISABLE_DOP_GATING));
+	}
+
+	/* disable the context save/restore or OAR counters */
+	if (stream->engine)
+		xe_oa_configure_oar_context(stream, false);
+
+	/* Make sure we disable noa to save power. */
+	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GEN10_GT_NOA_ENABLE, 0);
+
+	sqcnt1 = GEN12_SQCNT1_PMON_ENABLE |
+		 (HAS_OA_BPC_REPORTING(stream->gt->tile->xe) ? GEN12_SQCNT1_OABPC : 0);
+
+	/* Reset PMON Enable to save power. */
+	xe_mmio_rmw32(stream->gt, GEN12_SQCNT1, sqcnt1, 0);
+}
+
+static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
+{
+	struct xe_bo *bo;
+
+	BUILD_BUG_ON_NOT_POWER_OF_2(OA_BUFFER_SIZE);
+	BUILD_BUG_ON(OA_BUFFER_SIZE < SZ_128K || OA_BUFFER_SIZE > SZ_16M);
+
+	bo = xe_bo_create_pin_map(stream->gt->tile->xe, stream->gt->tile, NULL,
+				  OA_BUFFER_SIZE, ttm_bo_type_kernel,
+				  XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	stream->oa_buffer.bo = bo;
+	stream->oa_buffer.vaddr = bo->vmap.is_iomem ?
+					bo->vmap.vaddr_iomem : bo->vmap.vaddr;
+	return 0;
+}
+
+static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
+{
+	u32 i;
+
+#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
+
+	for (i = 0; i < n_regs; i++) {
+		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
+			u32 n_lri = min_t(u32, n_regs - i,
+					  MI_LOAD_REGISTER_IMM_MAX_REGS);
+
+			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM(n_lri);
+		}
+		bb->cs[bb->len++] = reg_data[i].addr.addr;
+		bb->cs[bb->len++] = reg_data[i].value;
+	}
+}
+
+static int num_lri_dwords(int num_regs)
+{
+	int count = 0;
+
+	if (num_regs > 0) {
+		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
+		count += num_regs * 2;
+	}
+
+	return count;
+}
+
+static struct xe_oa_config_bo *
+__xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
+{
+	struct xe_oa_config_bo *oa_bo;
+	size_t config_length = 0;
+	struct xe_bb *bb;
+
+	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
+	if (!oa_bo)
+		return ERR_PTR(-ENOMEM);
+
+	config_length += num_lri_dwords(oa_config->mux_regs_len);
+	config_length += num_lri_dwords(oa_config->b_counter_regs_len);
+	config_length += num_lri_dwords(oa_config->flex_regs_len);
+	config_length++; /* MI_BATCH_BUFFER_END */
+	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
+
+	bb = xe_bb_new(stream->gt, config_length, false);
+	if (IS_ERR(bb))
+		goto err_free;
+
+	write_cs_mi_lri(bb, oa_config->mux_regs, oa_config->mux_regs_len);
+	write_cs_mi_lri(bb, oa_config->b_counter_regs, oa_config->b_counter_regs_len);
+	write_cs_mi_lri(bb, oa_config->flex_regs, oa_config->flex_regs_len);
+
+	oa_bo->bb = bb;
+	oa_bo->oa_config = xe_oa_config_get(oa_config);
+	llist_add(&oa_bo->node, &stream->oa_config_bos);
+
+	return oa_bo;
+err_free:
+	kfree(oa_bo);
+	return ERR_CAST(bb);
+}
+
+static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream)
+{
+	struct xe_oa_config *oa_config = stream->oa_config;
+	struct xe_oa_config_bo *oa_bo;
+
+	/* Look for the buffer in the already allocated BOs attached to the stream */
+	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
+		if (oa_bo->oa_config == oa_config &&
+		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
+			   sizeof(oa_config->uuid)) == 0)
+			goto out;
+	}
+
+	oa_bo = __xe_oa_alloc_config_buffer(stream, oa_config);
+out:
+	return oa_bo;
+}
+
+static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
+{
+	struct xe_oa_config_bo *oa_bo;
+	int err = 0;
+
+	oa_bo = xe_oa_alloc_config_buffer(stream);
+	if (IS_ERR(oa_bo)) {
+		err = PTR_ERR(oa_bo);
+		goto exit;
+	}
+
+	err = xe_oa_submit_bb(stream, oa_bo->bb);
+exit:
+	return err;
+}
+
+static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
+{
+	return _MASKED_FIELD(GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS,
+			     stream->sample ?
+			     0 : GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
+}
+
+static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
+{
+	u32 sqcnt1;
+	int ret;
+
+	/*
+	 * Wa_1508761755:xehpsdv, dg2
+	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
+	 * Disable thread stall DOP gating and EU DOP gating.
+	 */
+	if (stream->gt->tile->xe->info.platform == XE_DG2) {
+		xe_gt_mcr_multicast_write(stream->gt, GEN8_ROW_CHICKEN,
+					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
+		xe_mmio_write32(stream->gt, GEN7_ROW_CHICKEN2,
+				_MASKED_BIT_ENABLE(GEN12_DISABLE_DOP_GATING));
+	}
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+			/* Disable clk ratio reports, like previous Gens. */
+			_MASKED_BIT_ENABLE(GEN12_OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS |
+					   GEN12_OAG_OA_DEBUG_INCLUDE_CLK_RATIO) |
+			   /*
+			    * If the user didn't require OA reports, instruct the hardware
+			    * not to emit ctx switch reports.
+			    */
+			oag_report_ctx_switches(stream));
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
+			(GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME |
+			 GEN12_OAG_OAGLBCTXCTRL_TIMER_ENABLE |
+			 (stream->period_exponent <<
+			  GEN12_OAG_OAGLBCTXCTRL_TIMER_PERIOD_SHIFT)) : 0);
+
+	/*
+	 * Initialize Super Queue Internal Cnt Register
+	 * Set PMON Enable in order to collect valid metrics.
+	 * Enable bytes per clock reporting in OA for XEHPSDV onward.
+	 */
+	sqcnt1 = GEN12_SQCNT1_PMON_ENABLE |
+		 (HAS_OA_BPC_REPORTING(stream->gt->tile->xe) ? GEN12_SQCNT1_OABPC : 0);
+
+	xe_mmio_rmw32(stream->gt, GEN12_SQCNT1, 0, sqcnt1);
+
+	/*
+	 * For Gen12, performance counters are context saved/restored. Only enable it
+	 * for the context that requested this.
+	 */
+	if (stream->engine) {
+		ret = xe_oa_configure_oar_context(stream, true);
+		if (ret)
+			return ret;
+	}
+
+	return xe_oa_emit_oa_config(stream);
+}
+
+static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER;
+}
+
+#define MI_LRI_LEN(x) (((x) & 0xff) + 1)
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
+	u32 len = (xe_lrc_size(stream->gt->tile->xe, stream->hwe->class) - PAGE_SIZE) / 4;
+	u32 *state = stream->gt->default_lrc[stream->hwe->class];
+	u32 offset;
+
+	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
+		return U32_MAX;
+
+	for (offset = 0; offset < len; ) {
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
+	struct xe_reg reg = GEN12_OACTXCONTROL(stream->hwe->mmio_base);
+	u32 offset = stream->oa->ctx_oactxctrl_offset;
+
+	/* Do this only once. Failure is stored as offset of U32_MAX */
+	if (offset)
+		goto exit;
+
+	offset = xe_oa_context_image_offset(stream, reg.addr);
+	stream->oa->ctx_oactxctrl_offset = offset;
+
+	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset\n",
+		stream->hwe->name, offset);
+exit:
+	return offset && offset != U32_MAX ? 0 : -ENODEV;
+}
+
+static int xe_oa_stream_init(struct xe_oa_stream *stream,
+			     struct xe_oa_open_properties *props)
+{
+	struct xe_oa_group *g = props->hwe->oa_group;
+	struct xe_gt *gt = props->hwe->gt;
+	struct xe_oa *oa = stream->oa;
+	int ret;
+
+	stream->poll_oa_period = props->poll_oa_period;
+	stream->hwe = props->hwe;
+	stream->gt = stream->hwe->gt;
+	stream->sample_size = sizeof(struct drm_xe_oa_record_header);
+	stream->oa_buffer.format = &oa->oa_formats[props->oa_format];
+
+	stream->sample = props->sample;
+	stream->sample_size += stream->oa_buffer.format->size;
+	stream->periodic = props->oa_periodic;
+	stream->period_exponent = props->oa_period_exponent;
+
+	if (stream->engine && engine_supports_mi_query(stream->hwe)) {
+		/* If we don't find the context offset, just return error */
+		ret = xe_oa_set_ctx_ctrl_offset(stream);
+		if (ret) {
+			drm_err(&stream->gt->tile->xe->drm,
+				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
+				stream->hwe->name);
+			goto exit;
+		}
+	}
+
+	stream->oa_config = xe_oa_get_oa_config(oa, props->metrics_set);
+	if (!stream->oa_config) {
+		drm_dbg(&oa->xe->drm, "Invalid OA config id=%i\n", props->metrics_set);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = xe_oa_alloc_oa_buffer(stream);
+	if (ret)
+		goto err_free_configs;
+
+	/* Take runtime pm ref and forcewake to disable RC6 */
+	xe_device_mem_access_get(stream->oa->xe);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+	ret = xe_oa_enable_metric_set(stream);
+	if (ret) {
+		drm_dbg(&oa->xe->drm, "Unable to enable metric set\n");
+		goto err_fw_put;
+	}
+
+	drm_dbg(&oa->xe->drm, "opening stream oa config uuid=%s\n",
+		stream->oa_config->uuid);
+
+	WRITE_ONCE(g->exclusive_stream, stream);
+
+	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	init_waitqueue_head(&stream->poll_wq);
+
+	spin_lock_init(&stream->oa_buffer.ptr_lock);
+	mutex_init(&stream->lock);
+
+	return 0;
+
+err_fw_put:
+	xe_oa_disable_metric_set(stream);
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(stream->oa->xe);
+	xe_oa_free_oa_buffer(stream);
+err_free_configs:
+	xe_oa_free_configs(stream);
+exit:
+	return ret;
+}
+
+static int
+xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
+			       struct drm_xe_oa_open_param *param,
+			       struct xe_oa_open_properties *props,
+			       struct drm_file *file)
+{
+	struct xe_file *xef = to_xe_file(file);
+	struct xe_engine *engine = NULL;
+	struct xe_oa_stream *stream = NULL;
+	bool privileged_op = true;
+	int stream_fd;
+	int ret;
+
+	if (props->single_engine) {
+		u32 engine_id = props->engine_id;
+
+		engine = xe_engine_lookup(xef, engine_id);
+		if (XE_IOCTL_DBG(oa->xe, !engine)) {
+			ret = -ENOENT;
+			goto err_engine;
+		}
+	}
+
+	/*
+	 * The OAR unit only monitors the RCS on a per context basis. Relax
+	 * requirements if the user doesn't request global stream access,
+	 * i.e. query based sampling using MI_REPORT_PERF_COUNT
+	 */
+	if (engine && !props->sample)
+		privileged_op = false;
+
+	if (privileged_op && xe_oa_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
+		ret = -EACCES;
+		goto err_engine;
+	}
+
+	if (!props->sample && !engine) {
+		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
+		ret = -EINVAL;
+		goto err_engine;
+	}
+
+	/* We currently only allow exclusive access */
+	if (props->hwe->oa_group->exclusive_stream) {
+		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
+		ret = -EBUSY;
+		goto err_engine;
+	}
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream) {
+		ret = -ENOMEM;
+		goto err_engine;
+	}
+
+	stream->oa = oa;
+	stream->engine = engine;
+
+	ret = xe_oa_stream_init(stream, props);
+	if (ret)
+		goto err_free;
+
+	/* Hold a reference on the drm device till stream_fd is released */
+	drm_dev_get(&oa->xe->drm);
+
+	return stream_fd;
+err_free:
+	kfree(stream);
+err_engine:
+	if (engine)
+		xe_engine_put(engine);
+	return ret;
+}
+
 /*
  * OA timestamp frequency = CS timestamp frequency in most platforms. On some
  * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
@@ -276,6 +938,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_oa_open_param *param = data;
 	struct xe_oa_open_properties props = {};
 	u32 known_open_flags;
+	struct xe_gt *gt;
+	int ret;
 
 	if (!oa->xe) {
 		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
@@ -288,9 +952,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	return xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
-					      param->num_properties,
-					      &props);
+	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
+					     param->num_properties,
+					     &props);
+	if (ret)
+		return ret;
+
+	gt = props.hwe->gt;
+
+	mutex_lock(&gt->oa.lock);
+	ret = xe_oa_stream_open_ioctl_locked(oa, param, &props, file);
+	mutex_unlock(&gt->oa.lock);
+
+	return ret;
 }
 
 static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
-- 
2.41.0

