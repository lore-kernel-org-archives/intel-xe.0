Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62711C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318F10F66B;
	Thu,  3 Sep 2026 15:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmtoV/I6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DB210F66B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447690; x=1819983690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Ap+Pk8hVQoGtzbO1qz1xQ/SrcOCMgUs5HLNh0LFTaw=;
 b=JmtoV/I6dU6JifqQLwNl3tkxBxPNslSQhOk5k5pD/sMR3DhlzIHDveH8
 5ftUyyDe4g2B8lvTaAKmRX5VfkzodFDNJSVgir2GVnQJ4cSe5S4p75Sjv
 wZp4oSB59rl/WDL296BVpHFUJD9lZXwzY81vMBbyMLqdGvnEYHXOoWVOW
 OycfHaYQMOWVET8qQYUDOyiJSYSIMsU2FXb9Iv+9C8jh8k7y2FXJOLfyw
 ZwrykQI+Pex8BlcJxqca+UPuVqiwKr72QBaxKkGeqZkJso75kS/oWfJU3
 80zg5mAR1XyS2ZeffToGYYXdCulc6B8Y6A3y/VKie7prtbprQDO5aw99x w==;
X-CSE-ConnectionGUID: 6RoakhtyS5SnL1oyTLFxpw==
X-CSE-MsgGUID: sul8sXEYSJOIE7pHYK0naA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486776"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486776"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:10 -0700
X-CSE-ConnectionGUID: CupcjIMJSIuGKNU+PjunyA==
X-CSE-MsgGUID: D4J2HeorT1mb6eyANjubMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440990"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:01:05 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH v10 14/27] drm/xe/eudebug: Add hw enablement
Date: Thu,  3 Sep 2026 17:59:38 +0300
Message-ID: <20260903145952.848051-15-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

In order to turn on debug capabilities (i.e. breakpoints), TD_CTL
and some other registers need to be programmed. Implement eudebug
mode enabling, including eudebug related workarounds.

v2: Move workarounds to xe_wa_oob. Use reg_sr directly instead of
xe_rtp as it suits better for dynamic manipulation of those register we
do later in the series.
v3: get rid of undefining XE_MCR_REG (Mika)
v4: return if dss_mask is all 0.
v5: remove unused GLOBAL_DEBUG_ENABLE (Sashiko)
v6: - don't leak fw ref, check for zero dss_mask (Sashiko)
    - hold runtime for hw access (Sashiko)
    - make iter size check byte granularity for safety (Claude)
    - simplify xe_reg_sr_add with overwrite (Claude)
    - check that bitmap size is aligned to hw (4) (Claude)

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  19 +++
 drivers/gpu/drm/xe/xe_eudebug_hw.c    |  72 +++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h    |  23 +++
 drivers/gpu/drm/xe/xe_gt_debug.c      | 201 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h      |  32 ++++
 drivers/gpu/drm/xe/xe_reg_sr.c        |  12 +-
 drivers/gpu/drm/xe/xe_reg_sr.h        |   4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c |   2 +-
 drivers/gpu/drm/xe/xe_rtp.c           |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   2 +
 11 files changed, 364 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a37ab5e654aa..5cdf47f79aa4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -162,7 +162,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8056d007c23e..7537fc1a9c3f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -515,10 +515,20 @@
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
+#define TD_CTL					XE_REG_MCR(0xe400)
+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
+
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
+#define EU_ATT(reg, row)			XE_REG_MCR((reg ? 0xe478 : 0xe470) + (row) * 4)
+
 #define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
 #define   DISABLE_GRF_CLEAR			REG_BIT(13)
 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
@@ -528,6 +538,8 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
+#define EU_ATT_CLR(reg, row)			XE_REG_MCR((reg ? 0xe698 : 0xe490) + (row) * 4)
+
 #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
 #define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
 #define   DIS_EU_GRF_POISON_TO_LSC		REG_BIT(13)
@@ -546,11 +558,13 @@
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 #define   EARLY_EOT_DIS				REG_BIT(1)
+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
@@ -616,6 +630,11 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define RCU_DEBUG_1				XE_REG(0x14a00)
+#define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
+#define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
+#define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
+
 #define RCU_ASYNC_FLUSH				XE_REG(0x149fc)
 #define   RCU_ASYNC_FLUSH_IN_PROGRESS	REG_BIT(31)
 #define   RCU_ASYNC_FLUSH_ENGINE_ID_SHIFT	28
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
new file mode 100644
index 000000000000..aa31b4c91713
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include "xe_eudebug_hw.h"
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <generated/xe_wa_oob.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
+
+#include "xe_eudebug.h"
+#include "xe_eudebug_types.h"
+#include "xe_exec_queue.h"
+#include "xe_exec_queue_types.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "xe_hw_engine.h"
+#include "xe_lrc.h"
+#include "xe_macros.h"
+#include "xe_mmio.h"
+#include "xe_reg_sr.h"
+#include "xe_rtp.h"
+#include "xe_wa.h"
+
+static void add_sr_entry(struct xe_hw_engine *hwe,
+			 struct xe_reg_mcr mcr_reg,
+			 u32 mask, bool enable)
+{
+	const struct xe_reg_sr_entry sr_entry = {
+		.reg = mcr_reg.__reg,
+		.clr_bits = mask,
+		.set_bits = enable ? mask : 0,
+		.read_mask = mask,
+	};
+
+	xe_reg_sr_add(&hwe->reg_sr, &sr_entry, hwe->gt, true);
+}
+
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe_rtp_match_first_render_or_compute(xe, gt, hwe))
+		return;
+
+	if (XE_GT_WA(gt, 18022722726))
+		add_sr_entry(hwe, ROW_CHICKEN,
+			     STALL_DOP_GATING_DISABLE, enable);
+
+	if (XE_GT_WA(gt, 14015474168))
+		add_sr_entry(hwe, ROW_CHICKEN2,
+			     XEHPC_DISABLE_BTB,
+			     enable);
+
+	if (xe->info.graphics_verx100 >= 1200)
+		add_sr_entry(hwe, TD_CTL,
+			     TD_CTL_BREAKPOINT_ENABLE |
+			     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+			     TD_CTL_FEH_AND_FEE_ENABLE,
+			     enable);
+
+	if (xe->info.graphics_verx100 >= 1250)
+		add_sr_entry(hwe, TD_CTL,
+			     TD_CTL_GLOBAL_DEBUG_ENABLE, enable);
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
new file mode 100644
index 000000000000..23dd55fc7ad9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_EUDEBUG_HW_H_
+#define _XE_EUDEBUG_HW_H_
+
+#include <linux/types.h>
+
+struct xe_eudebug;
+struct xe_hw_engine;
+struct xe_gt;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable);
+
+#else /* CONFIG_DRM_XE_EUDEBUG */
+
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
+#endif /* _XE_EUDEBUG_HW_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
new file mode 100644
index 000000000000..b20e42e66c5b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_gt_topology.h"
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "xe_pm.h"
+#include "xe_macros.h"
+
+unsigned int xe_gt_eu_att_regs(struct xe_gt *gt)
+{
+	return (GRAPHICS_VERx100(gt_to_xe(gt)) >= 3000) ? 2u : 1u;
+}
+
+int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
+				     int (*fn)(struct xe_gt *gt,
+					       void *data,
+					       u16 group,
+					       u16 instance,
+					       bool present),
+				     void *data)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	const enum xe_force_wake_domains fw_domains = XE_FW_GT;
+	xe_dss_mask_t dss_mask;
+	unsigned int dss, fw_ref;
+	u16 group, instance;
+	int ret = 0;
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -EIO;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), fw_domains);
+	if (!fw_ref) {
+		ret = -ETIMEDOUT;
+		goto out_pm;
+	}
+
+	bitmap_or(dss_mask, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	/* If by any chance dss_mask is all 0s */
+	if (!bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS)) {
+		ret = -EINVAL;
+		goto out_fw;
+	}
+
+	/*
+	 * Note: This removes terminating zeros when last dss is fused out!
+	 * In order bitmask to be exactly the same as on with i915 we would
+	 * need to figure out max dss for given platform, most probably by
+	 * querying hwconfig
+	 */
+
+	for (dss = 0;
+	     dss <= find_last_bit(dss_mask, XE_MAX_DSS_FUSE_BITS);
+	     dss++) {
+		xe_gt_mcr_get_dss_steering(gt, dss, &group, &instance);
+
+		ret = fn(gt, data, group, instance, test_bit(dss, dss_mask));
+		if (ret)
+			break;
+	}
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+out_pm:
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static int read_first_attention_mcr(struct xe_gt *gt, void *data,
+				    u16 group, u16 instance, bool present)
+{
+	unsigned int reg, row;
+
+	if (!present)
+		return 0;
+
+	for (reg = 0; reg < xe_gt_eu_att_regs(gt); reg++) {
+		for (row = 0; row < XE_GT_EU_ATT_ROWS; row++) {
+			u32 val;
+
+			val = xe_gt_mcr_unicast_read(gt, EU_ATT(reg, row), group, instance);
+
+			if (val)
+				return 1;
+		}
+	}
+
+	return 0;
+}
+
+#define MAX_EUS_PER_ROW 4u
+#define MAX_THREADS 8u
+
+/**
+ * xe_gt_eu_attention_bitmap_size - query size of the attention bitmask
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: size in bytes.
+ */
+int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt)
+{
+	xe_dss_mask_t dss_mask;
+
+	bitmap_or(dss_mask, gt->fuse_topo.c_dss_mask,
+		  gt->fuse_topo.g_dss_mask, XE_MAX_DSS_FUSE_BITS);
+
+	if (XE_WARN_ON(bitmap_empty(dss_mask, XE_MAX_DSS_FUSE_BITS)))
+		return 0;
+
+	return (find_last_bit(dss_mask, XE_MAX_DSS_FUSE_BITS) + 1) *
+		XE_GT_EU_ATT_ROWS * xe_gt_eu_att_regs(gt) * MAX_THREADS *
+		MAX_EUS_PER_ROW / 8;
+}
+
+struct attn_read_iter {
+	struct xe_gt *gt;
+	unsigned int i;
+	unsigned int size;
+	u8 *bits;
+};
+
+static int read_eu_attentions_mcr(struct xe_gt *gt, void *data,
+				  u16 group, u16 instance, bool present)
+{
+	struct attn_read_iter * const iter = data;
+	unsigned int reg, row;
+
+	for (reg = 0; reg < xe_gt_eu_att_regs(gt); reg++) {
+		for (row = 0; row < XE_GT_EU_ATT_ROWS; row++) {
+			u32 val;
+
+			if (iter->i + sizeof(val) > iter->size)
+				return 0;
+
+			if (present)
+				val = xe_gt_mcr_unicast_read(gt, EU_ATT(reg, row), group, instance);
+			else
+				val = 0;
+
+			memcpy(&iter->bits[iter->i], &val, sizeof(val));
+			iter->i += sizeof(val);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_eu_attention_bitmap - query host attention
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: 0 on success, negative otherwise.
+ */
+int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
+			      unsigned int bitmap_size)
+{
+	struct attn_read_iter iter = {
+		.gt = gt,
+		.i = 0,
+		.size = bitmap_size,
+		.bits = bits
+	};
+
+	/* One u32 of attention state per dss, register and row */
+	BUILD_BUG_ON(MAX_THREADS * MAX_EUS_PER_ROW / 8 != sizeof(u32));
+
+	if (XE_WARN_ON(!IS_ALIGNED(bitmap_size, sizeof(u32))))
+		return -EINVAL;
+
+	return xe_gt_foreach_dss_group_instance(gt, read_eu_attentions_mcr, &iter);
+}
+
+/**
+ * xe_gt_eu_threads_needing_attention - Query host attention
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: 1 if threads waiting host attention, 0 otherwise.
+ */
+int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
+{
+	int err;
+
+	err = xe_gt_foreach_dss_group_instance(gt, read_first_attention_mcr, NULL);
+
+	XE_WARN_ON(err < 0);
+
+	return err < 0 ? 0 : err;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
new file mode 100644
index 000000000000..9dabe9cc1d25
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_GT_DEBUG_
+#define __XE_GT_DEBUG_
+
+#include <linux/bits.h>
+#include <linux/math.h>
+
+struct xe_gt;
+
+#define XE_GT_ATTENTION_TIMEOUT_MS 100
+#define XE_GT_EU_ATT_ROWS 2u
+
+unsigned int xe_gt_eu_att_regs(struct xe_gt *gt);
+
+int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
+int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
+				     int (*fn)(struct xe_gt *gt,
+					       void *data,
+					       u16 group,
+					       u16 instance,
+					       bool present),
+				     void *data);
+
+int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
+int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
+			      unsigned int bitmap_size);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index e328f5072557..72919a5612a5 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -104,7 +104,8 @@ static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
 
 int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt)
+		  struct xe_gt *gt,
+		  bool overwrite)
 {
 	unsigned long idx = e->reg.addr;
 	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
@@ -114,15 +115,20 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	reg = sanitize_mcr(sr, e, gt);
 
 	if (pentry) {
-		if (!compatible_entries(pentry, e)) {
+		if (!overwrite && !compatible_entries(pentry, e)) {
 			ret = -EINVAL;
 			goto fail;
 		}
 
 		pentry->clr_bits |= e->clr_bits;
-		pentry->set_bits |= e->set_bits;
 		pentry->read_mask |= e->read_mask;
 
+		/* An overwrite with nothing to set clears instead */
+		if (overwrite && !e->set_bits)
+			pentry->set_bits &= ~e->clr_bits;
+		else
+			pentry->set_bits |= e->set_bits;
+
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index d26cf4713383..8231640edb0f 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -6,6 +6,8 @@
 #ifndef _XE_REG_SR_H_
 #define _XE_REG_SR_H_
 
+#include <linux/types.h>
+
 /*
  * Reg save/restore bookkeeping
  */
@@ -28,7 +30,7 @@ void xe_reg_sr_lrc_check(struct xe_reg_sr *sr,
 			 struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
-		  struct xe_gt *gt);
+		  struct xe_gt *gt, bool overwrite);
 void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index cab1b578ca0e..744844f59bd5 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -193,7 +193,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
 		}
 
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-		xe_reg_sr_add(out, &hwe_entry, hwe->gt);
+		xe_reg_sr_add(out, &hwe_entry, hwe->gt, false);
 
 		slot++;
 	}
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 6a8d6ea68f25..56641a72f33f 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -244,7 +244,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 
 	sr_entry.reg.addr += mmio_base;
 
-	xe_reg_sr_add(sr, &sr_entry, gt);
+	xe_reg_sr_add(sr, &sr_entry, gt, false);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 3de46094ab5c..40a6a57153a7 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -74,3 +74,5 @@
 14027054324	GRAPHICS_VERSION(3511)
 14022766366	GRAPHICS_VERSION_RANGE(2001, 2004)
 		GRAPHICS_VERSION_RANGE(3000, 3005)
+18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
+14015474168	PLATFORM(PVC)
-- 
2.53.0

