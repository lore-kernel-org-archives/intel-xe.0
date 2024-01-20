Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2379C4725D
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964110EADE;
	Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3010EACC
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716031; x=1737252031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0HtbEKsCKqb+hETlWubSl+vM7YOWmeNMTdQVX8FJDA=;
 b=HfAQ3VsukwizjwWAmpFAaKhoYShk66sNsO2H68U1UoB2CBOtNPfccwAx
 ndNCR4zTowygI/bkfQauUuruNCIH5enxKGMmsDGGQQ7KpPeRmwX3zHQgG
 ZcUzLqbmVoYl8DOOeG6us94fHZBXJUVlPslBs2yOEbX+m5zKoysV5kmZu
 a5rBePavcD0DiIXjk24uJvyMlcH4WzvceGiQ41WKz1f6UARqA77AORrPs
 NTP1frgGz3pu4v3Oehn9BgE4spPcohIJzCMtHXmaPf/EblzPoLRTlQYlP
 oTsGtjvl+tgHWA4LJBYYdV+pDekjlbJT0Ad5l/TXMTGLgYdbqgDW0B1Ba A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472938"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472938"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125696"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125696"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/16] drm/xe/oa/uapi: Add OA data formats
Date: Fri, 19 Jan 2024 18:00:13 -0800
Message-ID: <20240120020026.1261201-4-ashutosh.dixit@intel.com>
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

Add and initialize supported OA data formats for various platforms
(including Xe2). User can request OA data in any supported format.

Bspec: 52198, 60942, 61101

v2: Start 'xe_oa_format_name' enum from 0 (Umesh)
    Fix error rewind with OA (Umesh)

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |  12 ++-
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_module.c       |   1 +
 drivers/gpu/drm/xe/xe_oa.c           | 111 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h           |  16 ++++
 drivers/gpu/drm/xe/xe_oa_types.h     |  78 +++++++++++++++++++
 include/uapi/drm/xe_drm.h            |  10 +++
 8 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_oa.c
 create mode 100644 drivers/gpu/drm/xe/xe_oa.h
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 99bda12bdd165..a03691ce71760 100644
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
index bede669136fb6..1c3f3545b5335 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -33,6 +33,7 @@
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
index 7eda86bd4c2a4..03d4ac3446b5d 100644
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
@@ -455,6 +456,9 @@ struct xe_device {
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
index 0000000000000..f2fcd50f3fcd8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -0,0 +1,111 @@
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
+	switch (oa->xe->info.platform) {
+	case XE_TIGERLAKE:
+	case XE_ROCKETLAKE:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_ALDERLAKE_N:
+	case XE_DG1:
+		oa_format_add(oa, XE_OA_FORMAT_A12);
+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
+		break;
+
+	case XE_DG2:
+	case XE_PVC:
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+		break;
+
+	case XE_METEORLAKE:
+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
+		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
+		break;
+
+	case XE_LUNARLAKE:
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
+		break;
+
+	default:
+		drm_err(&oa->xe->drm, "Unknown platform\n");
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
index 0000000000000..c5d33a47d8fa7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -0,0 +1,78 @@
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
+/**
+ * struct xe_oa_format - Format fields for supported OA formats
+ */
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
index 004c1f2d3e823..41af3361e7bee 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1398,6 +1398,16 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
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

