Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4674C47DB7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD1C10EAE0;
	Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037CA10EADE
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716031; x=1737252031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSj42vxTenSMDZRBHXGmcJw+0h/B4qgCOi+xWY8aAUQ=;
 b=f08Cqyhhj9t7h9IHahbVptwDyMKuVlW9T8y2zMfQsKYP07l3rfb15T+/
 VngD0jzDXozfdFL80JLFz6j/NgHoki4EI1AaEhG6n7yk2OtR0+uPRNvqQ
 kxp4fIbO7PY5X4xYZlcZ+85w1l18Z7vGzQbkM5Cv2eevtXo9/sFQvtOkd
 KzlD/HvvsOUQV8HPDHpAuiHrdKQcQfD6MB20ywdTlzhK79Zvwr6Y2B80Y
 yyY132NAYzBD8rdBs+91Abs8rqOLTxhJWXy7/seWmF1CDyjJmPkOAzQ26
 ASljIa8xK0sInQQRyuHlokXn3VguAOcpvt7ZgqjJMLJIBPxB4nSWchBK+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472939"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472939"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125700"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125700"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/16] drm/xe/oa/uapi: Initialize OA units
Date: Fri, 19 Jan 2024 18:00:14 -0800
Message-ID: <20240120020026.1261201-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Initialize OA unit data struct's for each gt during device probe. Also
assign OA units for hardware engines.

v2: Remove XE_OA_UNIT_OAG/XE_OA_UNIT_OAM_SAMEDIA_0 enum (Umesh)
    Change mtl_oa_base to 0x13000 (Umesh)
    Remove OAG_OASTATUS bits

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h    |  91 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_oa.c              | 162 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h        |  56 ++++++++
 include/uapi/drm/xe_drm.h               |   6 +
 6 files changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
new file mode 100644
index 0000000000000..00d0c9763e8da
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_OA_REGS__
+#define __XE_OA_REGS__
+
+#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
+#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
+
+#define RPM_CONFIG1			XE_REG(0xd04)
+#define   GT_NOA_ENABLE			REG_BIT(9)
+
+#define EU_PERF_CNTL0			XE_REG(0xe458)
+#define EU_PERF_CNTL4			XE_REG(0xe45c)
+#define EU_PERF_CNTL1			XE_REG(0xe558)
+#define EU_PERF_CNTL5			XE_REG(0xe55c)
+#define EU_PERF_CNTL2			XE_REG(0xe658)
+#define EU_PERF_CNTL6			XE_REG(0xe65c)
+#define EU_PERF_CNTL3			XE_REG(0xe758)
+
+#define OA_TLB_INV_CR			XE_REG(0xceec)
+
+/* OAR unit */
+#define OAR_OACONTROL			XE_REG(0x2960)
+#define  OAR_OACONTROL_COUNTER_SEL_MASK	REG_GENMASK(3, 1)
+#define  OAR_OACONTROL_COUNTER_ENABLE	REG_BIT(0)
+
+#define OACTXCONTROL(base) XE_REG((base) + 0x360)
+#define OAR_OASTATUS			XE_REG(0x2968)
+#define  OA_COUNTER_RESUME		REG_BIT(0)
+
+/* OAG unit */
+#define OAG_OAGLBCTXCTRL		XE_REG(0x2b28)
+#define  OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK	REG_GENMASK(7, 2)
+#define  OAG_OAGLBCTXCTRL_TIMER_ENABLE		REG_BIT(1)
+#define  OAG_OAGLBCTXCTRL_COUNTER_RESUME	REG_BIT(0)
+
+#define OAG_OAHEADPTR				XE_REG(0xdb00)
+#define  OAG_OAHEADPTR_MASK			REG_GENMASK(31, 6)
+#define OAG_OATAILPTR				XE_REG(0xdb04)
+#define  OAG_OATAILPTR_MASK			REG_GENMASK(31, 6)
+
+#define OAG_OABUFFER		XE_REG(0xdb08)
+#define  OABUFFER_SIZE_MASK	REG_GENMASK(5, 3)
+#define  OABUFFER_SIZE_128K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 0)
+#define  OABUFFER_SIZE_256K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 1)
+#define  OABUFFER_SIZE_512K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 2)
+#define  OABUFFER_SIZE_1M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 3)
+#define  OABUFFER_SIZE_2M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 4)
+#define  OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
+#define  OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
+#define  OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
+#define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
+
+#define OAG_OACONTROL				XE_REG(0xdaf4)
+#define  OAG_OACONTROL_OA_CCS_SELECT_MASK	REG_GENMASK(18, 16)
+#define  OAG_OACONTROL_OA_COUNTER_SEL_MASK	REG_GENMASK(4, 2)
+#define  OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
+/* Common to all OA units */
+#define  OA_OACONTROL_REPORT_BC_MASK		REG_GENMASK(9, 9)
+#define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
+
+#define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
+#define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
+#define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
+#define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
+
+#define OAG_OASTATUS			XE_REG(0xdafc)
+/* OAM unit */
+#define OAM_HEAD_POINTER_OFFSET			(0x1a0)
+#define OAM_TAIL_POINTER_OFFSET			(0x1a4)
+#define OAM_BUFFER_OFFSET			(0x1a8)
+#define OAM_CONTEXT_CONTROL_OFFSET		(0x1bc)
+#define OAM_CONTROL_OFFSET			(0x194)
+#define  OAM_CONTROL_COUNTER_SEL_MASK		REG_GENMASK(3, 1)
+#define OAM_DEBUG_OFFSET			(0x198)
+#define OAM_STATUS_OFFSET			(0x19c)
+#define OAM_MMIO_TRG_OFFSET			(0x1d0)
+
+#define OAM_HEAD_POINTER(base)			XE_REG((base) + OAM_HEAD_POINTER_OFFSET)
+#define OAM_TAIL_POINTER(base)			XE_REG((base) + OAM_TAIL_POINTER_OFFSET)
+#define OAM_BUFFER(base)			XE_REG((base) + OAM_BUFFER_OFFSET)
+#define OAM_CONTEXT_CONTROL(base)		XE_REG((base) + OAM_CONTEXT_CONTROL_OFFSET)
+#define OAM_CONTROL(base)			XE_REG((base) + OAM_CONTROL_OFFSET)
+#define OAM_DEBUG(base)				XE_REG((base) + OAM_DEBUG_OFFSET)
+#define OAM_STATUS(base)			XE_REG((base) + OAM_STATUS_OFFSET)
+#define OAM_MMIO_TRG(base)			XE_REG((base) + OAM_MMIO_TRG_OFFSET)
+
+#endif /* __XE_OA_REGS__ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 047cde6cda107..fba3f7fd793e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -10,6 +10,7 @@
 #include "xe_gt_idle_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
+#include "xe_oa.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
@@ -359,6 +360,9 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @oa: oa perf counter subsystem per gt info */
+	struct xe_oa_gt oa;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index dfeaaac08b7f9..3fc396bc72f0f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -148,6 +148,8 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 	/** @eclass: pointer to per hw engine class interface */
 	struct xe_hw_engine_class_intf *eclass;
+	/** @oa_unit: oa unit for this hw engine */
+	struct xe_oa_unit *oa_unit;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f2fcd50f3fcd8..35a55ad8270f3 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -5,9 +5,14 @@
 
 #include <drm/xe_drm.h>
 
+#include "regs/xe_oa_regs.h"
 #include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_mmio.h"
 #include "xe_oa.h"
 
+#define XE_OA_UNIT_INVALID U32_MAX
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -32,6 +37,141 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
 };
 
+static u32 num_oa_units_per_gt(struct xe_gt *gt)
+{
+	return 1;
+}
+
+static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
+{
+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
+		/*
+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
+		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
+		 */
+		drm_WARN_ON(&gt_to_xe(hwe->gt)->drm,
+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
+
+		return 0;
+	}
+
+	return XE_OA_UNIT_INVALID;
+}
+
+static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
+{
+	switch (hwe->class) {
+	case XE_ENGINE_CLASS_RENDER:
+	case XE_ENGINE_CLASS_COMPUTE:
+		return 0;
+
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return __hwe_oam_unit(hwe);
+
+	default:
+		return XE_OA_UNIT_INVALID;
+	}
+}
+
+static struct xe_oa_regs __oam_regs(u32 base)
+{
+	return (struct xe_oa_regs) {
+		base,
+		OAM_HEAD_POINTER(base),
+		OAM_TAIL_POINTER(base),
+		OAM_BUFFER(base),
+		OAM_CONTEXT_CONTROL(base),
+		OAM_CONTROL(base),
+		OAM_DEBUG(base),
+		OAM_STATUS(base),
+		OAM_CONTROL_COUNTER_SEL_MASK,
+	};
+}
+
+static struct xe_oa_regs __oag_regs(void)
+{
+	return (struct xe_oa_regs) {
+		0,
+		OAG_OAHEADPTR,
+		OAG_OATAILPTR,
+		OAG_OABUFFER,
+		OAG_OAGLBCTXCTRL,
+		OAG_OACONTROL,
+		OAG_OA_DEBUG,
+		OAG_OASTATUS,
+		OAG_OACONTROL_OA_COUNTER_SEL_MASK,
+	};
+}
+
+static void __xe_oa_init_oa_units(struct xe_gt *gt)
+{
+	const u32 mtl_oa_base[] = { 0x13000 };
+	int i, num_units = gt->oa.num_oa_units;
+
+	for (i = 0; i < num_units; i++) {
+		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
+
+		if (gt->info.type != XE_GT_TYPE_MEDIA) {
+			u->regs = __oag_regs();
+			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
+			u->regs = __oam_regs(mtl_oa_base[i]);
+			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
+		}
+
+		/* Set oa_unit_ids now to ensure ids remain contiguous */
+		u->oa_unit_id = gt_to_xe(gt)->oa.oa_unit_ids++;
+	}
+}
+
+static int xe_oa_init_gt(struct xe_gt *gt)
+{
+	u32 num_oa_units = num_oa_units_per_gt(gt);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_oa_unit *u;
+
+	u = kcalloc(num_oa_units, sizeof(*u), GFP_KERNEL);
+	if (!u)
+		return -ENOMEM;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u32 index = __hwe_oa_unit(hwe);
+
+		hwe->oa_unit = NULL;
+		if (index < num_oa_units) {
+			u[index].num_engines++;
+			hwe->oa_unit = &u[index];
+		}
+	}
+
+	/*
+	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
+	 * will appear in OA unit query, but no perf streams can be opened on them.
+	 */
+	gt->oa.num_oa_units = num_oa_units;
+	gt->oa.oa_unit = u;
+
+	__xe_oa_init_oa_units(gt);
+
+	return 0;
+}
+
+static int xe_oa_init_oa_units(struct xe_oa *oa)
+{
+	struct xe_gt *gt;
+	int i, ret;
+
+	for_each_gt(gt, oa->xe, i) {
+		ret = xe_oa_init_gt(gt);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
 {
 	__set_bit(format, oa->format_mask);
@@ -91,6 +231,8 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
 int xe_oa_init(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
+	struct xe_gt *gt;
+	int i, ret;
 
 	/* Support OA only with GuC submission and Gen12+ */
 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
@@ -99,13 +241,33 @@ int xe_oa_init(struct xe_device *xe)
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
+	for_each_gt(gt, xe, i)
+		mutex_init(&gt->oa.gt_lock);
+
+	ret = xe_oa_init_oa_units(oa);
+	if (ret) {
+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
+		goto exit;
+	}
+
 	xe_oa_init_supported_formats(oa);
 	return 0;
+exit:
+	oa->xe = NULL;
+	return ret;
 }
 
 void xe_oa_fini(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
+	struct xe_gt *gt;
+	int i;
+
+	if (!oa->xe)
+		return;
+
+	for_each_gt(gt, xe, i)
+		kfree(gt->oa.oa_unit);
 
 	oa->xe = NULL;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index c5d33a47d8fa7..bb9a579d4529a 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -8,6 +8,10 @@
 
 #include <linux/math.h>
 #include <linux/types.h>
+#include <linux/mutex.h>
+
+#include <drm/xe_drm.h>
+#include "regs/xe_reg_defs.h"
 
 enum xe_oa_report_header {
 	HDR_32_BIT = 0,
@@ -60,6 +64,55 @@ struct xe_oa_format {
 	u16 bc_report;
 };
 
+/**
+ * struct xe_oa_regs - Registers for each OA unit
+ */
+struct xe_oa_regs {
+	u32 base;
+	struct xe_reg oa_head_ptr;
+	struct xe_reg oa_tail_ptr;
+	struct xe_reg oa_buffer;
+	struct xe_reg oa_ctx_ctrl;
+	struct xe_reg oa_ctrl;
+	struct xe_reg oa_debug;
+	struct xe_reg oa_status;
+	u32 oa_ctrl_counter_select_mask;
+};
+
+/**
+ * struct xe_oa_unit - Hardware OA unit
+ */
+struct xe_oa_unit {
+	/** @oa_unit_id: identifier for the OA unit */
+	u16 oa_unit_id;
+
+	/** @type: Type of OA unit - OAM, OAG etc. */
+	enum drm_xe_oa_unit_type type;
+
+	/** @regs: OA registers for programming the OA unit */
+	struct xe_oa_regs regs;
+
+	/** @num_engines: number of engines attached to this OA unit */
+	u32 num_engines;
+
+	/** @exclusive_stream: The stream currently using the OA unit */
+	struct xe_oa_stream *exclusive_stream;
+};
+
+/**
+ * struct xe_oa_gt - OA per-gt information
+ */
+struct xe_oa_gt {
+	/** @lock: lock protecting create/destroy OA streams */
+	struct mutex gt_lock;
+
+	/** @num_oa_units: number of oa units for each gt */
+	u32 num_oa_units;
+
+	/** @oa_unit: array of oa_units */
+	struct xe_oa_unit *oa_unit;
+};
+
 /**
  * struct xe_oa - OA device level information
  */
@@ -74,5 +127,8 @@ struct xe_oa {
 
 	/** @format_mask: tracks valid OA formats for a platform */
 	unsigned long format_mask[FORMAT_MASK_SIZE];
+
+	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
+	u16 oa_unit_ids;
 };
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 41af3361e7bee..5c7529c35b907 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1398,6 +1398,12 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
 };
 
+/** enum drm_xe_oa_unit_type - OA unit types */
+enum drm_xe_oa_unit_type {
+	DRM_XE_OA_UNIT_TYPE_OAG,
+	DRM_XE_OA_UNIT_TYPE_OAM,
+};
+
 /** enum drm_xe_oa_format_type - OA format types */
 enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_OAG,
-- 
2.41.0

