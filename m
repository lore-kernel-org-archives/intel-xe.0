Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F4FC369DC
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 21:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0BE10E3B7;
	Wed, 23 Apr 2025 21:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7NgxDv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731610E283
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 21:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745445506; x=1776981506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nz06ALb4+MkaaZevjzxdaLQy64lJFqylOwLfntAgCbQ=;
 b=h7NgxDv1k1i9C45VHuHKxaSMBii9LAUVca8krRCi6KdO7W4jMHQMUCdw
 E0d/yHC3m09z09SLpBv9O8yeH8A2Eg64GbeR48yRJ3bO27TJbrKt5ir4Y
 RJs6x4xuP7ZOK0i05sP+JwLQHExarRhth1+z+Z/Jo1rwkK32yn/OnKWUZ
 Fye3CjK7jEO7AZUpd6MdnMKeFBJaOUuIF1zV3JFK8d2v8dpcClR7x5VXp
 q8ADK8gS0CyY4WTJs0pzGCpcYY9QLV/C+A2GQhlJ8n2zCr/NIPhKK/GIW
 8lEpRA99dyFt9p3DWb8hmh7e8Riks8PQ1ULoAY6FtM8tJfwneYui6l1ay g==;
X-CSE-ConnectionGUID: zGio99nYRJKHj3szuAQnLQ==
X-CSE-MsgGUID: 7gOGEeatS2eOcbb+PEkl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47073113"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47073113"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 14:58:23 -0700
X-CSE-ConnectionGUID: jYRF1FxjROqBb96AVIC8Qw==
X-CSE-MsgGUID: UUmJ4mglQayD3UGLYYVdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136507644"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 14:58:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 1/6] drm/xe/guc: Add log init config abi definitions
Date: Wed, 23 Apr 2025 14:58:16 -0700
Message-Id: <20250423215821.3078428-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423215821.3078428-1-zhanjun.dong@intel.com>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h | 117 +++++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lic_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
new file mode 100644
index 000000000000..48302bfcab2b
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_log_lic_abi.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _ABI_GUC_LOG_LIC_ABI_H_
+#define _ABI_GUC_LOG_LIC_ABI_H_
+
+#include <linux/types.h>
+
+#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
+#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
+
+#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
+#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
+
+/** enum guc_log_lic_type - Log Init Config KLV IDs. */
+enum guc_log_lic_type {
+	/**
+	 * @GUC_LOG_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
+	 * is a 32 bit number represented by guc_sw_version.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
+	/**
+	 * @GUC_LOG_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
+	 * bit.
+	 */
+	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
+	/**
+	 * @GUC_LOG_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
+	 * frequency. Value is a 32 bit number representing frequency in
+	 * kilohertz. This timestamp is utilized in log entries, timer and
+	 * for engine utilization tracking.
+	 */
+	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
+	/**
+	 * @GUC_LOG_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
+	 * representing graphics, media and display HW architecture IDs.
+	 */
+	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
+	/**
+	 * @GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
+	 * Value is 32 bits.
+	 */
+	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
+};
+
+/**
+ * struct guc_sw_version - This structure describes the full version of a
+ * software component.
+ */
+struct guc_sw_version {
+	/** @dw0: A 32 bits dword, contains multiple bit fields */
+	u32 dw0;
+	/*  Patch version */
+#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
+	/*  Minor version */
+#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
+	/*  Major version */
+#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
+	/*  Branch ID */
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
+	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
+	 */
+#define GUC_LIC_FORMAT_VERSION_MINOR_VERSION		GENMASK(15, 0)
+	/*
+	 *  Log-Init-Config structure major version. Must be
+	 * GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
+	 */
+#define GUC_LIC_FORMAT_VERSION_MAJOR_VERSION		GENMASK(31, 16)
+} __packed;
+
+/**
+ * struct guc_log_init_config - GuC Log-Init-Config structure.
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer as per the Log Buffer Layout (In Memory). The array of guc log
+ * buffer states plus this structure must not exceed 4KB
+ */
+struct guc_log_init_config {
+	/**
+	 * @magic: A magic number set by GuC to identify that this
+	 * structure contains valid information: magic = 0x8086900D.
+	 * Used to verify the information in this structure is valid.
+	 */
+	u32 magic;
+	/**
+	 * @ver: The version of the this structure. Detail description
+	 * is guc_lic_format_version
+	 */
+	struct guc_lic_format_version ver;
+	/** @dw_size: Number of Dws the `data` array contains. */
+	u32 dw_size;
+	/**
+	 * @data: Array of dwords representing a list of LIC KLVs of
+	 * type guc_klv_generic with keys represented by guc_log_lic_type
+	 */
+	u32 data[] __counted_by(dw_size);
+} __packed;
+
+#endif
-- 
2.34.1

