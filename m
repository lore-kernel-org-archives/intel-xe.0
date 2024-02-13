Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD85C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855E10EB4F;
	Tue, 13 Feb 2024 06:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBzwJYPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320CC10EB11
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806671; x=1739342671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Lf2Cex1Rxixzfet96UAAxyU+aYKwMRIlXKbaUYb8Go=;
 b=GBzwJYPOkT6HboEL7XplkU4gfifzI9rs6ql8B/0uhe/7FEb4UUSOCp4s
 LhLHF2iXNmLFQgJih1tAZDq2JftRrf1iONpXcAB+IaOz9YGAAjJTTSCIR
 IgLURoBch2zIPfw8Rsuy7NI08cmImtgswlgBBpYst/ecyM2K6qHbx+55a
 QNvsxwWl1LMg0LYN3vc2RhLryb6EW5lrdVEH8UmsiRdMlKKdAMjsD+Ovy
 3aI1DhUyWX9PtpvEf9VKhJrxoC8xwXhfijRhwtzx8dHLX3fW/+eX/nuqy
 a8pKmJu1GZfb5w4xUI2IHs0yPnxxysM2JuWaM+vQ4NBC5GyMY+P7AVcmR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5621232"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5621232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="33599784"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 03/16] drm/xe/oa/uapi: Add OA data formats
Date: Mon, 12 Feb 2024 22:44:10 -0800
Message-ID: <20240213064423.131601-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213064423.131601-1-ashutosh.dixit@intel.com>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
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

Add and initialize supported OA data formats for various platforms
(including Xe2). User can request OA data in any supported format.

Bspec: 52198, 60942, 61101

v2: Start 'xe_oa_format_name' enum from 0 (Umesh)
    Fix error rewind with OA (Umesh)
v3: Use graphics versions rather than absolute platform names

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       | 12 +++-
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_module.c       |  1 +
 drivers/gpu/drm/xe/xe_oa.c           | 99 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h           | 16 +++++
 drivers/gpu/drm/xe/xe_oa_types.h     | 76 +++++++++++++++++++++
 include/uapi/drm/xe_drm.h            | 10 +++
 8 files changed, 218 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4d2a45635b9c5..5fe1b889a2cdb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -111,6 +111,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_oa.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index fa3fb48e0eb98..e5529d584eeb3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_perf.h"
@@ -534,10 +535,14 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_heci_gsc_init(xe);
 
-	err = xe_display_init(xe);
+	err = xe_oa_init(xe);
 	if (err)
 		goto err_fini_gt;
 
+	err = xe_display_init(xe);
+	if (err)
+		goto err_oa_fini;
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		goto err_fini_display;
@@ -557,6 +562,9 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
+err_oa_fini:
+	xe_oa_fini(xe);
+
 err_fini_gt:
 	for_each_gt(gt, xe, id) {
 		if (id < last_gt)
@@ -589,6 +597,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_display_fini(xe);
 
+	xe_oa_fini(xe);
+
 	xe_heci_gsc_fini(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d233..ac3faa8ec0c28 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,6 +17,7 @@
 #include "xe_gt_types.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
+#include "xe_oa.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
@@ -460,6 +461,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @oa: oa perf counter subsystem */
+	struct xe_oa oa;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 42085a4b56be2..b5108e66dd1ee 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
+#include "xe_oa.h"
 #include "xe_pci.h"
 #include "xe_perf.h"
 #include "xe_sched_job.h"
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
new file mode 100644
index 0000000000000..ae6b2005be113
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/xe_drm.h>
+
+#include "xe_device.h"
+#include "xe_oa.h"
+
+#define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
+
+static const struct xe_oa_format oa_formats[] = {
+	[XE_OA_FORMAT_C4_B8]			= { 7, 64,  DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A12]			= { 0, 64,  DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128, DRM_FMT(OAG) },
+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
+	[XE_OAC_FORMAT_A24u64_B8_C8]		= { 1, 320, DRM_FMT(OAC), HDR_64_BIT },
+	[XE_OAC_FORMAT_A22u32_R2u32_B8_C8]	= { 2, 192, DRM_FMT(OAC), HDR_64_BIT },
+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, DRM_FMT(OAM_MPEC), HDR_64_BIT },
+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, DRM_FMT(OAM_MPEC), HDR_64_BIT },
+	[XE_OA_FORMAT_PEC64u64]			= { 1, 576, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
+	[XE_OA_FORMAT_PEC64u64_B8_C8]		= { 1, 640, DRM_FMT(PEC), HDR_64_BIT, 1, 1 },
+	[XE_OA_FORMAT_PEC64u32]			= { 1, 320, DRM_FMT(PEC), HDR_64_BIT },
+	[XE_OA_FORMAT_PEC32u64_G1]		= { 5, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
+	[XE_OA_FORMAT_PEC32u32_G1]		= { 5, 192, DRM_FMT(PEC), HDR_64_BIT },
+	[XE_OA_FORMAT_PEC32u64_G2]		= { 6, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
+	[XE_OA_FORMAT_PEC32u32_G2]		= { 6, 192, DRM_FMT(PEC), HDR_64_BIT },
+	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4]	= { 3, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
+	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
+};
+
+static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
+{
+	__set_bit(format, oa->format_mask);
+}
+
+static void xe_oa_init_supported_formats(struct xe_oa *oa)
+{
+	if (GRAPHICS_VER(oa->xe) >= 20) {
+		/* Xe2+ */
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_PEC64u64);
+		oa_format_add(oa, XE_OA_FORMAT_PEC64u64_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_PEC64u32);
+		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G1);
+		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G1);
+		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G2);
+		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G2);
+		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_32_G2_4);
+		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_4_G2_32);
+	} else if (GRAPHICS_VERx100(oa->xe) >= 1270) {
+		/* XE_METEORLAKE */
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
+	} else if (GRAPHICS_VERx100(oa->xe) >= 1255) {
+		/* XE_DG2, XE_PVC */
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+	} else {
+		/* Gen12+ */
+		xe_assert(oa->xe, GRAPHICS_VER(oa->xe) >= 12);
+		oa_format_add(oa, XE_OA_FORMAT_A12);
+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
+	}
+}
+
+int xe_oa_init(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	/* Support OA only with GuC submission and Gen12+ */
+	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
+		return 0;
+
+	oa->xe = xe;
+	oa->oa_formats = oa_formats;
+
+	xe_oa_init_supported_formats(oa);
+	return 0;
+}
+
+void xe_oa_fini(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	oa->xe = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
new file mode 100644
index 0000000000000..a2f301e2be57b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_OA_H_
+#define _XE_OA_H_
+
+#include "xe_oa_types.h"
+
+struct xe_device;
+
+int xe_oa_init(struct xe_device *xe);
+void xe_oa_fini(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
new file mode 100644
index 0000000000000..8af7b626cb13a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_OA_TYPES_H_
+#define _XE_OA_TYPES_H__
+
+#include <linux/math.h>
+#include <linux/types.h>
+
+enum xe_oa_report_header {
+	HDR_32_BIT = 0,
+	HDR_64_BIT,
+};
+
+enum xe_oa_format_name {
+	XE_OA_FORMAT_C4_B8,
+
+	/* Gen8+ */
+	XE_OA_FORMAT_A12,
+	XE_OA_FORMAT_A12_B8_C8,
+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
+
+	/* DG2 */
+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
+
+	/* DG2/MTL OAC */
+	XE_OAC_FORMAT_A24u64_B8_C8,
+	XE_OAC_FORMAT_A22u32_R2u32_B8_C8,
+
+	/* MTL OAM */
+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
+
+	/* Xe2+ */
+	XE_OA_FORMAT_PEC64u64,
+	XE_OA_FORMAT_PEC64u64_B8_C8,
+	XE_OA_FORMAT_PEC64u32,
+	XE_OA_FORMAT_PEC32u64_G1,
+	XE_OA_FORMAT_PEC32u32_G1,
+	XE_OA_FORMAT_PEC32u64_G2,
+	XE_OA_FORMAT_PEC32u32_G2,
+	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
+	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
+
+	XE_OA_FORMAT_MAX,
+};
+
+/** struct xe_oa_format - Format fields for supported OA formats */
+struct xe_oa_format {
+	u32 counter_select;
+	int size;
+	int type;
+	enum xe_oa_report_header header;
+	u16 counter_size;
+	u16 bc_report;
+};
+
+/**
+ * struct xe_oa - OA device level information
+ */
+struct xe_oa {
+	/** @xe: back pointer to xe device */
+	struct xe_device *xe;
+
+	/** @oa_formats: tracks all OA formats across platforms */
+	const struct xe_oa_format *oa_formats;
+
+#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
+
+	/** @format_mask: tracks valid OA formats for a platform */
+	unsigned long format_mask[FORMAT_MASK_SIZE];
+};
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 311eb3f0fda27..58a86a3f98b68 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1402,6 +1402,16 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
 };
 
+/** enum drm_xe_oa_format_type - OA format types */
+enum drm_xe_oa_format_type {
+	DRM_XE_OA_FMT_TYPE_OAG,
+	DRM_XE_OA_FMT_TYPE_OAR,
+	DRM_XE_OA_FMT_TYPE_OAM,
+	DRM_XE_OA_FMT_TYPE_OAC,
+	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
+	DRM_XE_OA_FMT_TYPE_PEC,
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

