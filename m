Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DFC87FCC
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 01:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A421210E5C2;
	Tue, 22 Jul 2025 01:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UhJAfA/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48F10E3CE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 01:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753148197; x=1784684197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/lj0XJETUff5TLlwirSzNz1RmLX5S77xV75Fn4ZTMl4=;
 b=UhJAfA/NCo1i7xukyAtS2ivbuwcuv6jHXv9MCMtqqwj3eXUaHzeuAbTf
 +h4fuKmQuMwjYw6tEThj/LhqZVWePwfv1VFEjdjkXFsidYO5UqPB9PDtl
 CEvOr71OjS/54SFnA0y2+zg0JsGoF86USxnDT3K4W2yU6u6k2V82i9AGM
 ci9OVbnkCdvxM7UuqRLC+pdsvNWJHBQOj3K6mXnDXeb7K4U4XPn6yzQDY
 1k4SPVomAKUhuiVmc1leLtvEPQiDssCcgDxux5GNKynJsD6WYlXEOH+LJ
 CjsW4IS6aHUObtXgE686X99eeNSHmuUq4IDCCQjis95kzKrJzv28roR6f w==;
X-CSE-ConnectionGUID: VT+ycWbWS9mQipg/eIrplA==
X-CSE-MsgGUID: z0SLWN6KQryMS0EKuT5lZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54596787"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="54596787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 18:35:55 -0700
X-CSE-ConnectionGUID: j3NZoZvjQoua4h19ZV1BGw==
X-CSE-MsgGUID: vXiI/NygR7i43x0YV21auw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; d="scan'208";a="163225878"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa003.jf.intel.com with ESMTP; 21 Jul 2025 18:35:55 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 1/6] drm/xe/guc: Add log init config abi definitions
Date: Mon, 21 Jul 2025 21:35:48 -0400
Message-Id: <20250722013553.1266218-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722013553.1266218-1-zhanjun.dong@intel.com>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
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

Add GuC log init config (LIC) ABI definitions.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
new file mode 100644
index 000000000000..a4e27da304cd
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_LIC_ABI_H_
+#define _ABI_GUC_LIC_ABI_H_
+
+#include <linux/types.h>
+
+/** enum guc_lic_type - Log Init Config TLV IDs. */
+enum guc_lic_type {
+	/**
+	 * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
+	 * is a 32 bit number represented by guc_sw_version.
+	 */
+	GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
+	/**
+	 * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
+	 * bit.
+	 */
+	GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
+	/**
+	 * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
+	 * frequency. Value is a 32 bit number representing frequency in
+	 * kHz. This timestamp is utilized in log entries, timer and
+	 * for engine utilization tracking.
+	 */
+	GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
+	/**
+	 * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
+	 * representing graphics, media and display HW architecture IDs.
+	 */
+	GUC_LIC_TYPE_GMD_ID = 0x4,
+	/**
+	 * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
+	 * Value is 32 bits.
+	 */
+	GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
+};
+
+/**
+ * struct guc_sw_version - This structure describes the full version of a
+ * software component.
+ */
+struct guc_sw_version {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
+#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
+#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
+#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)
+} __packed;
+
+/**
+ * struct guc_lic_format_version - Log Init Config Structure Version.
+ * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
+ * than 1.12)
+ */
+struct guc_lic_format_version {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/*
+	 *  Log-Init-Config structure minor version. Must be
+	 * GUC_LIC_FORMAT_VERSION_MASK_MINOR
+	 */
+#define GUC_LIC_FORMAT_VERSION_MASK_MINOR		GENMASK(15, 0)
+	/*
+	 *  Log-Init-Config structure major version. Must be
+	 * GUC_LIC_FORMAT_VERSION_MASK_MAJOR
+	 */
+#define GUC_LIC_FORMAT_VERSION_MASK_MAJOR		GENMASK(31, 16)
+} __packed;
+
+/**
+ * struct guc_lic - GuC lic (Log-Init-Config) structure.
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer as per the Log Buffer Layout (In Memory). The array of guc log
+ * buffer states plus this structure must not exceed 4KB
+ */
+struct guc_lic {
+	/**
+	 * @magic: A magic number set by GuC to identify that this
+	 * structure contains valid information: magic = GUC_LIC_MAGIC.
+	 * Used to verify the information in this structure is valid.
+	 */
+	u32 magic;
+#define GUC_LIC_MAGIC			0x8086900D
+
+	/**
+	 * @version: The version of the this structure. Represented by
+	 * guc_lic_format_version
+	 */
+	struct guc_lic_format_version version;
+#define GUC_LIC_FORMAT_VERSION_MAJOR	1u
+#define GUC_LIC_FORMAT_VERSION_MINOR	0u
+
+	/** @dw_size: Number of Dws the `data` array contains. */
+	u32 dw_size;
+	/**
+	 * @data: Array of dwords representing a list of LIC KLVs of
+	 * type guc_klv_generic with keys represented by guc_lic_type
+	 */
+	u32 data[] __counted_by(dw_size);
+} __packed;
+
+#endif
-- 
2.34.1

