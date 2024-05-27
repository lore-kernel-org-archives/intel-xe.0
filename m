Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2548BC25B75
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B962710F76A;
	Mon, 27 May 2024 01:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="an7Kv12B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDD510E050
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 01:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716774219; x=1748310219;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nbMLa64kA3lE6kliDvCdQRyseqMHcibx3UwONrlNK50=;
 b=an7Kv12BCgLjkmukK32Zwo//Xqq4pCH35Zfa/eGitB9V45mazmFdYwhd
 tqN9OM9O+Ltcx2SQpppDIsp0s6aJZMvL/vAurGK3Vi6dbaixemY1Tvy7x
 uFHIepYBU/lDUNUeJzI7Z2/UoJA9mT/5E4Ao1XfCiQBVYPU8OSG3DoBxb
 e5edeY8yYESiOHrEtZezHJpzoj6WWfqJdila/C7UE42ilYkrivenODa/F
 fI656E6d97gR3Ooa+paAsQDxc0ecN+iFYR5j6ouyMfE3N/3y09qRgW/nl
 Y/Ig249UyCOyptySp5O3Q10Agy5/EvhvZSAStX0R5dia6ZCa+h6BxBLad w==;
X-CSE-ConnectionGUID: 2ceXvctbRFmllUCvcvXHWQ==
X-CSE-MsgGUID: 861sGhehQneztoD/IE8A3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="11707464"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="11707464"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
X-CSE-ConnectionGUID: fhS9Gg25QrKHpRMlHaNNPQ==
X-CSE-MsgGUID: 8zn9gTZ3QSiNi1znFTY0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="65821705"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:43:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/17] drm/xe/oa/uapi: Initialize OA units
Date: Sun, 26 May 2024 18:43:20 -0700
Message-ID: <20240527014333.603914-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240527014333.603914-1-ashutosh.dixit@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h    |  95 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
 drivers/gpu/drm/xe/xe_oa.c              | 162 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h        |  54 ++++++++
 include/uapi/drm/xe_drm.h               |  12 ++
 6 files changed, 329 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
new file mode 100644
index 000000000000..f9a60b79fa53
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -0,0 +1,95 @@
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
+#define  OASTATUS_MMIO_TRG_Q_FULL	REG_BIT(6)
+#define  OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
+#define  OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
+#define  OASTATUS_REPORT_LOST		REG_BIT(0)
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
index 10a9a9529377..24bb95de920f 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -12,6 +12,7 @@
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
+#include "xe_oa.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
@@ -387,6 +388,9 @@ struct xe_gt {
 		 */
 		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
 	} user_engines;
+
+	/** @oa: oa perf counter subsystem per gt info */
+	struct xe_oa_gt oa;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index b2f64b92a636..41028fa064f8 100644
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
index 3349e645cb72..7237c67728ec 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -5,11 +5,16 @@
 
 #include <drm/xe_drm.h>
 
+#include "regs/xe_oa_regs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
 #include "xe_oa.h"
 
+#define XE_OA_UNIT_INVALID U32_MAX
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -34,6 +39,141 @@ static const struct xe_oa_format oa_formats[] = {
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
@@ -81,6 +221,8 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
 int xe_oa_init(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
+	struct xe_gt *gt;
+	int i, ret;
 
 	/* Support OA only with GuC submission and Gen12+ */
 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
@@ -89,13 +231,33 @@ int xe_oa_init(struct xe_device *xe)
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
index 1e339090c90d..4ecbf802f687 100644
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
@@ -58,6 +62,53 @@ struct xe_oa_format {
 	u16 bc_report;
 };
 
+/** struct xe_oa_regs - Registers for each OA unit */
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
+	/** @gt_lock: lock protecting create/destroy OA streams */
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
@@ -72,5 +123,8 @@ struct xe_oa {
 
 	/** @format_mask: tracks valid OA formats for a platform */
 	unsigned long format_mask[FORMAT_MASK_SIZE];
+
+	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
+	u16 oa_unit_ids;
 };
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bb87bf0c96f9..dba17bae510d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1433,6 +1433,18 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
 };
 
+/** enum drm_xe_oa_unit_type - OA unit types */
+enum drm_xe_oa_unit_type {
+	/**
+	 * @DRM_XE_OA_UNIT_TYPE_OAG: OAG OA unit. OAR/OAC are considered
+	 * sub-types of OAG. For OAR/OAC, use OAG.
+	 */
+	DRM_XE_OA_UNIT_TYPE_OAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
+	DRM_XE_OA_UNIT_TYPE_OAM,
+};
+
 /** enum drm_xe_oa_format_type - OA format types */
 enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_OAG,
-- 
2.41.0

