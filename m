Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBA3C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF3112A88;
	Mon, 29 Jan 2024 18:18:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFE0112A94
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 18:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706552280; x=1738088280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6frPtNxMyf4i1PKTNhEp/tYJOKrN7wifvTDTHLNYLA=;
 b=Pub3J9FwBfzuIi4qomM+goIF3LjgGoYYLXlT5XlkZMDtW5b8VDqKSlMw
 U0Z5l6K4Kdnt6sWXZRpCZ3QtdzXjJCU67OkBZCDWBUr+/f8cwhnsrypXS
 DVGAtMOVXzOquiqyjuU5a2DGNebj0pBIFLtrDGBhGLtSuCpKbuePUuAgQ
 gE/oDLnRZIQY7Hd9dZQXpxVbV/fSrHxzo4LYfro8trs2qGRH/5NdKHqrI
 XmxrD8+hWwZlQyipKxRJ7svVzT019dAzWFaZEjIRzjuy20A9Ohqy9zrS0
 9NvwUKUzFku8Ah+3GEzV0XpanfId7HMZemSs/J4QwHg1ySnPUekkZOhaD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2903346"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2903346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3439269"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:57 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/xe: Add INSTDONE registers to devcoredump
Date: Mon, 29 Jan 2024 10:17:42 -0800
Message-ID: <20240129181742.183694-6-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This registers contains important information that can help with debug
of GPU hangs.

While at it also fixing the double line jump at the end of engine
registers for CCS engines.

v2:
- print other INSTDONE registers

v3:
- add for_each_geometry/compute_dss()

v4:
- print one slice_common_instdone per glice in DG2+

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 ++
 4 files changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 0b1266c88a6af..055bba1eb8f01 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -65,6 +65,7 @@
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd27480f64862..2957550bbd50d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -94,6 +94,8 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
@@ -110,6 +112,14 @@
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
 #define   FD_END_COLLECT			REG_BIT(5)
 
+#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
+#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
+#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)
+
+#define DG2_SLICE_COMMON_INSTDONE		XE_REG_MCR(0x7100)
+#define DG2_SLICE_COMMON_INSTDONE_EXTRA		XE_REG_MCR(0x7104)
+#define DG2_SLICE_COMMON_INSTDONE_EXTRA2	XE_REG_MCR(0x7108)
+
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -326,6 +336,9 @@
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
+#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
+#define ROW_INSTDONE				XE_REG_MCR(0xe164)
+
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 61b0c18d8b624..04471f7d1ef3c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -735,6 +736,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
+static bool
+is_slice_common_per_gslice(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1255;
+}
+
+static void
+xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int dss;
+	int group, instance;
+
+	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
+
+	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
+		return;
+
+	if (is_slice_common_per_gslice(xe) == false) {
+		snapshot->reg.instdone.slice_common[0] =
+			xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
+		snapshot->reg.instdone.slice_common_extra[0] =
+			xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
+		snapshot->reg.instdone.slice_common_extra2[0] =
+			xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
+	} else {
+		for_each_geometry_dss(gt, dss, group, instance) {
+			snapshot->reg.instdone.slice_common[dss] =
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE, group, instance);
+			snapshot->reg.instdone.slice_common_extra[dss] =
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE_EXTRA, group, instance);
+			snapshot->reg.instdone.slice_common_extra2[dss] =
+				xe_gt_mcr_unicast_read(gt, DG2_SLICE_COMMON_INSTDONE_EXTRA2, group, instance);
+		}
+	}
+
+	for_each_geometry_dss(gt, dss, group, instance) {
+		snapshot->reg.instdone.sampler[dss] =
+			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
+		snapshot->reg.instdone.row[dss] =
+			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
+
+		if (GRAPHICS_VERx100(xe) >= 1255)
+			snapshot->reg.instdone.geom_svg[dss] =
+				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVG,
+						       group, instance);
+	}
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -749,6 +801,7 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
+	size_t len;
 	u64 val;
 
 	if (!xe_hw_engine_is_valid(hwe))
@@ -759,6 +812,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (!snapshot)
 		return NULL;
 
+	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
+	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
+	 * set in struct xe_hw_engine_snapshot, so here doing additional
+	 * allocations.
+	 */
+	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
+	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
+	if (!snapshot->reg.instdone.slice_common ||
+	    !snapshot->reg.instdone.slice_common_extra ||
+	    !snapshot->reg.instdone.slice_common_extra2 ||
+	    !snapshot->reg.instdone.sampler ||
+	    !snapshot->reg.instdone.row ||
+	    !snapshot->reg.instdone.geom_svg) {
+		xe_hw_engine_snapshot_free(snapshot);
+		return NULL;
+	}
+
 	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
 	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
@@ -806,6 +881,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
 	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
@@ -813,6 +889,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	return snapshot;
 }
 
+static void
+xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+{
+	struct xe_gt *gt = snapshot->hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int dss;
+	int group, instance;
+
+	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
+
+	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
+		return;
+
+	if (is_slice_common_per_gslice(xe) == false) {
+		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
+			   snapshot->reg.instdone.slice_common[0]);
+		drm_printf(p, "\tSC_EXTRA_INSTDONE[0]: 0x%08x\n",
+			   snapshot->reg.instdone.slice_common_extra[0]);
+		drm_printf(p, "\tSC_EXTRA2_INSTDONE[0]: 0x%08x\n",
+			   snapshot->reg.instdone.slice_common_extra2[0]);
+	} else {
+		for_each_geometry_dss(gt, dss, group, instance) {
+			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common[dss]);
+			drm_printf(p, "\tSC_EXTRA_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common_extra[dss]);
+			drm_printf(p, "\tSC_EXTRA2_INSTDONE[%u]: 0x%08x\n", dss,
+					snapshot->reg.instdone.slice_common_extra2[dss]);
+		}
+	}
+
+	for_each_geometry_dss(gt, dss, group, instance) {
+		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
+			   snapshot->reg.instdone.sampler[dss]);
+		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
+			   snapshot->reg.instdone.row[dss]);
+
+		if (GRAPHICS_VERx100(xe) >= 1255)
+			drm_printf(p, "\tGEOM_SVGUNIT_INSTDONE[%u]: 0x%08x\n",
+				   dss, snapshot->reg.instdone.geom_svg[dss]);
+	}
+}
+
 /**
  * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
  * @snapshot: Xe HW Engine snapshot object.
@@ -852,9 +971,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
 	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+	xe_hw_engine_snapshot_instdone_print(snapshot, p);
+
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
+	drm_puts(p, "\n");
 }
 
 /**
@@ -869,6 +991,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
+	kfree(snapshot->reg.instdone.slice_common);
+	kfree(snapshot->reg.instdone.slice_common_extra);
+	kfree(snapshot->reg.instdone.slice_common_extra2);
+	kfree(snapshot->reg.instdone.sampler);
+	kfree(snapshot->reg.instdone.row);
+	kfree(snapshot->reg.instdone.geom_svg);
 	kfree(snapshot->name);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 27deaa31efd31..ed4029ef6d27f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -211,6 +211,16 @@ struct xe_hw_engine_snapshot {
 		u32 ipehr;
 		/** @reg.rcu_mode: RCU_MODE */
 		u32 rcu_mode;
+		/** @ring_instdone: RING_INSTDONE */
+		struct {
+			u32 ring;
+			u32 *slice_common;
+			u32 *slice_common_extra;
+			u32 *slice_common_extra2;
+			u32 *sampler;
+			u32 *row;
+			u32 *geom_svg;
+		} instdone;
 	} reg;
 };
 
-- 
2.43.0

