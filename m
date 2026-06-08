Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B5DCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413B10F6B6;
	Mon,  8 Jun 2026 16:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuLClD0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE54E10F6B8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935492; x=1812471492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L55Tar7cCxRtzfbbmkGbuTGczRAr1H5iv9rFM0IiUVo=;
 b=RuLClD0vhJ3GTsxYJP79dFC8G8GIW0GxBBECfBCorpSEWeNc3TU+OOgO
 M8VuPzfnq+AiwBIelKZK2BS8lDcEBTPdZkud/N8SgBufVSAKKQupSSbMB
 OYacD3SFZztR2OrHkVDLDNl+AZKHJjm/VGRxuY8tc3UPCdo0H3iOMSXFG
 kNtuHSpUaqaZoIq7p9AvjVnq72OZM2pQJ5IKqJHpeS4tXq/zVmFr66K4c
 VNWa6zAoAcxAMq+4WMmbHLnDkK9ELB+DzOHMnNd/9iCD3Mxh/xXsfaoQw
 wO/3dd8yC4cifRKtG3mixNRQ2qpuTOio6JPRWo/RmhTOMZWEFKjiSA34s w==;
X-CSE-ConnectionGUID: W/FAG+2wThSjPuoeLm5A2w==
X-CSE-MsgGUID: hWVoOFobTdurP4yh8EekPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531973"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:11 -0700
X-CSE-ConnectionGUID: lsQzbVC3SOy+O/5X0FFuow==
X-CSE-MsgGUID: Ca7bGflIT0CY3fz+YhNc5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247458675"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:18:06 -0700
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
Subject: [PATCH 13/18] drm/xe/eudebug: hw enablement for eudebug
Date: Mon,  8 Jun 2026 19:16:31 +0300
Message-ID: <20260608161639.1652127-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
and some other registers needs to be programmed. Implement eudebug
mode enabling including eudebug related workarounds.

v2: Move workarounds to xe_wa_oob. Use reg_sr directly instead of
xe_rtp as it suits better for dynamic manipulation of those register we
do later in the series.
v3: get rid of undefining XE_MCR_REG (Mika)
v4: return if dss_mask is all 0.
v5: remove unused GLOBAL_DEBUG_ENABLE (Sashiko)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  19 +++
 drivers/gpu/drm/xe/xe_eudebug_hw.c    |  72 ++++++++++
 drivers/gpu/drm/xe/xe_eudebug_hw.h    |  25 ++++
 drivers/gpu/drm/xe/xe_gt_debug.c      | 182 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h      |  32 +++++
 drivers/gpu/drm/xe/xe_reg_sr.c        |  21 ++-
 drivers/gpu/drm/xe/xe_reg_sr.h        |   4 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c |   2 +-
 drivers/gpu/drm/xe/xe_rtp.c           |   2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   2 +
 11 files changed, 353 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 83e88d75c3e0..1531ea9b3a93 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -158,7 +158,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # debugging shaders with gdb (eudebug) support
-xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o xe_eudebug_vm.o xe_eudebug_hw.o xe_gt_debug.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 15b98a413831..0573d007e62e 100644
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
index 000000000000..7362ed9bde68
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include <linux/types.h>
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
index 000000000000..918aada63927
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -0,0 +1,182 @@
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
+	const enum xe_force_wake_domains fw_domains = XE_FW_GT;
+	xe_dss_mask_t dss_mask;
+	unsigned int dss, fw_ref;
+	u16 group, instance;
+	int ret = 0;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), fw_domains);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
+	bitmap_or(dss_mask, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	/* If by any chance dss_mask is all 0s */
+	if (!bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS))
+		return -EINVAL;
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
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
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
+			if (iter->i >= iter->size)
+				return 0;
+
+			XE_WARN_ON(iter->i + sizeof(val) > xe_gt_eu_attention_bitmap_size(gt));
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
index e328f5072557..6d184a4b62d6 100644
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
@@ -114,15 +115,23 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	reg = sanitize_mcr(sr, e, gt);
 
 	if (pentry) {
-		if (!compatible_entries(pentry, e)) {
+		if (overwrite && e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (overwrite && !e->set_bits) {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits &= ~e->clr_bits;
+			pentry->read_mask |= e->read_mask;
+		} else if (!compatible_entries(pentry, e)) {
 			ret = -EINVAL;
 			goto fail;
+		} else {
+			pentry->clr_bits |= e->clr_bits;
+			pentry->set_bits |= e->set_bits;
+			pentry->read_mask |= e->read_mask;
 		}
 
-		pentry->clr_bits |= e->clr_bits;
-		pentry->set_bits |= e->set_bits;
-		pentry->read_mask |= e->read_mask;
-
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
index 2e84b1c49f37..1e9f37753e4b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -184,7 +184,7 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
 		}
 
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
+		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt, false);
 
 		slot++;
 	}
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 83a40e1f9528..dd92550b01c9 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -238,7 +238,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 	};
 
 	sr_entry.reg.addr += mmio_base;
-	xe_reg_sr_add(sr, &sr_entry, gt);
+	xe_reg_sr_add(sr, &sr_entry, gt, false);
 }
 
 static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 445ba0d19051..1eef9b082fa3 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -66,3 +66,5 @@
 		GRAPHICS_VERSION_RANGE(2004, 3005)
 14022766366	GRAPHICS_VERSION_RANGE(2001, 2004)
 		GRAPHICS_VERSION_RANGE(3000, 3005)
+18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
+14015474168	PLATFORM(PVC)
-- 
2.43.0

