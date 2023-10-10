Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9D7CD8CB0
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 18:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDDB10E3B4;
	Tue, 10 Oct 2023 18:42:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3E10E0D3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696963329; x=1728499329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5N0piICIxB9EJ/sjMv2uAFsNYZ0uIiS0saLcFgAj4Q=;
 b=Ym/IcdKuXbSDrZsyJiN/+1NFdtRiqnGg+Zfkb2MQFeJERw1Nd8Gs8h/c
 XOS5AYgLM//UWOA+OpSLnDxGM/4Git3YKXPF6upIKhK2T0XRRx+JODqHr
 5ehpuujjDLP38TluU+0e9ESGqOpdtXp7gLAPGDOP/OvuoYh7ljzJs1rvh
 8tB5aFFJdQacoIk331y/T8njh1iKsDG0UQSU41BXM+HGvg0TZZZk8W14U
 ptiMu1/XwInjFFFKXqajzaNzH0+CHUaI/ZWC2ku9VG/G2OomH/GEi7cGy
 k0rObS7Ael7tSZyO+96oVr1VrWP0c5bpNlOtgKh8eOBPUfsGnvs8kEROt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364774290"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="364774290"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 11:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753507773"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="753507773"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 11:41:59 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 11:41:51 -0700
Message-ID: <20231010184151.91195-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010184151.91195-1-jose.souza@intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe: Add INSTDONE registers to
 devcoredump
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   9 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 100 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 +++
 4 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 35dd4837dd75f..32465e384fc24 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -32,6 +32,7 @@
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d8..c6650124ae6a6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -105,6 +105,8 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
@@ -117,6 +119,10 @@
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
 
+#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
+#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
+#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)
+
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -299,6 +305,9 @@
 #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
 #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
 
+#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
+#define ROW_INSTDONE				XE_REG_MCR(0xe164)
+
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 37b3ee1268090..6e144859abb1a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -16,6 +16,7 @@
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -655,6 +656,40 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
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
+	snapshot->reg.instdone.slice_common =
+		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
+	snapshot->reg.instdone.slice_common_extra =
+		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
+	snapshot->reg.instdone.slice_common_extra2 =
+		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
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
@@ -679,10 +714,30 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (!snapshot)
 		return NULL;
 
+	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
+	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
+	 * set in struct xe_hw_engine_snapshot, so here doing additional
+	 * allocations.
+	 */
+	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
+	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
+	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
+	if (!snapshot->reg.instdone.sampler ||
+	    !snapshot->reg.instdone.row ||
+	    !snapshot->reg.instdone.geom_svg) {
+		xe_hw_engine_snapshot_free(snapshot);
+		return NULL;
+	}
+
 	len = strlen(hwe->name) + 1;
 	snapshot->name = kzalloc(len, GFP_ATOMIC);
-	if (snapshot->name)
-		strscpy(snapshot->name, hwe->name, len);
+	if (!snapshot->name) {
+		xe_hw_engine_snapshot_free(snapshot);
+		return NULL;
+	}
+
+	strscpy(snapshot->name, hwe->name, len);
 
 	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
@@ -730,6 +785,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_dma_fadd =
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
@@ -737,6 +793,38 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
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
+	drm_printf(p, "\tSC_INSTDONE: 0x%08x\n",
+		   snapshot->reg.instdone.slice_common);
+	drm_printf(p, "\tSC_EXTRA_INSTDONE: 0x%08x\n",
+		   snapshot->reg.instdone.slice_common_extra);
+	drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
+		   snapshot->reg.instdone.slice_common_extra2);
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
@@ -785,10 +873,13 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
 		   snapshot->reg.ring_dma_fadd_udw,
 		   snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+	xe_hw_engine_snapshot_instdone_print(snapshot, p);
+
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
+	drm_puts(p, "\n");
 }
 
 /**
@@ -803,6 +894,9 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
+	kfree(snapshot->reg.instdone.sampler);
+	kfree(snapshot->reg.instdone.row);
+	kfree(snapshot->reg.instdone.geom_svg);
 	kfree(snapshot->name);
 	kfree(snapshot);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 71c0a0169e62a..0a10a79962c97 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -221,6 +221,16 @@ struct xe_hw_engine_snapshot {
 		u32 ipehr;
 		/** @rcu_mode: RCU_MODE */
 		u32 rcu_mode;
+		/** @ring_instdone: RING_INSTDONE */
+		struct {
+			u32 ring;
+			u32 slice_common;
+			u32 slice_common_extra;
+			u32 slice_common_extra2;
+			u32 *sampler;
+			u32 *row;
+			u32 *geom_svg;
+		} instdone;
 	} reg;
 };
 
-- 
2.42.0

