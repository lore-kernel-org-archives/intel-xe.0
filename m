Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C32CC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFDB10EA10;
	Fri,  8 Dec 2023 06:43:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ED310E990
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017815; x=1733553815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Ep2IZO/NmHJqgDupvGjQcqp36BdvEqmcHbWrinAp6M=;
 b=U/Ud89Z6VSuKoBLN3tPHwy0hHEpbOSHgPJd3PmTmQRHEWciixvzZ9Hqh
 7cqNTX+2JybJvo+t6+raNc5lo1ICOJygpuLhICU40OI6rVQFDDKHmD7BB
 NMTiJUGZoYfh0eJXYIfPbyWMsBJVmXdQ7VZmAedvMu2mFeUOj4kXhwvuY
 kzaY3GoGzGOolQfr8OdJhP7MdHJCTX/OVr6+wVh/cMEv+StF2TWG+2xDT
 yz/7m3sCjgGZvpF4KL7X3gRJWgUbPA61NZq8V3M14hsJtVle8GAG8C8Qg
 FwYAaYw9uVxBjgNGcRYpsQijh3SP/+mktcgnhQbWDfAhujB2O13vJdLOE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866605"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699232"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699232"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:34 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/17] drm/xe/oa/uapi: Add OA data formats
Date: Thu,  7 Dec 2023 22:43:16 -0800
Message-ID: <20231208064329.2387604-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_oa.c           | 94 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h           |  2 +
 drivers/gpu/drm/xe/xe_oa_types.h     | 78 +++++++++++++++++++++++
 include/uapi/drm/xe_drm.h            | 10 +++
 5 files changed, 188 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9a212dbdb8a49..842ca8b1a7408 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -15,6 +15,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_gt_types.h"
+#include "xe_oa.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_pmu.h"
@@ -418,6 +419,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @oa: oa perf counter subsystem */
+	struct xe_oa oa;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f4cacb4af47c5..11662a81ef6d8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -13,15 +13,109 @@ static u32 xe_oa_max_sample_rate = 100000;
 
 static struct ctl_table_header *sysctl_header;
 
+#define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
+
+static const struct xe_oa_format oa_formats[] = {
+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
+	[XE_OA_FORMAT_A12]			= { 0, 64 },
+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
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
 int xe_oa_init(struct xe_device *xe)
 {
+	struct xe_oa *oa = &xe->oa;
+
+	/* Support OA only with GuC submission and Gen12+ */
+	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
+		return 0;
+
+	oa->xe = xe;
+	oa->oa_formats = oa_formats;
+
 	/* Choose a representative limit */
 	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.reference_clock / 2;
+
+	xe_oa_init_supported_formats(oa);
 	return 0;
 }
 
 void xe_oa_fini(struct xe_device *xe)
 {
+	struct xe_oa *oa = &xe->oa;
+
+	oa->xe = NULL;
 }
 
 static struct ctl_table oa_ctl_table[] = {
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 1b81330c9708b..2145c73176953 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -6,6 +6,8 @@
 #ifndef _XE_OA_H_
 #define _XE_OA_H_
 
+#include "xe_oa_types.h"
+
 struct xe_device;
 
 int xe_oa_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
new file mode 100644
index 0000000000000..3758bd2879cbb
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
+	XE_OA_FORMAT_C4_B8 = 7,
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
index 3539e0781d700..5bfb2d5aba12a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1175,6 +1175,16 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
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

