Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2C5CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C90D10E834;
	Thu, 27 Nov 2025 17:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntbcl+lq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFFC10E835
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764263282; x=1795799282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xr3cEdFZ6eze9oZ0uraa5ThWk9PdYnkuptsHHihZFX0=;
 b=ntbcl+lqqRXVcAUkxUmo1DO0hky30KFJzkMFgTFRMlyIeBHZ6OiPxKMF
 +0wkynxb4VWltxkYVLMDzUdFbcm9AZcBm6Oway1+k6CyRD8w+WvzGVxcb
 7ov+VClRgNE4vJ7n4MX5xzc2aCjR++No6E5smdPIfxezsiV4lkF0GNSEa
 n8qwOyDRo7tf8Vpe51Jx7wALO16CG9Jth0HJ9XYvdcQ3F3sprJsQKn0Bz
 qWebJriEmP4xxHpQmFROCgu8BsdSFAJ48D2dCiJ2fX9282jh35BGws6w3
 TMz/wqcNFOsNIDCk+7zJnaKmtJYNXh0eItSJ6f1O4XTBqpIZBzIwpVfjT A==;
X-CSE-ConnectionGUID: FwjWORFqQ3SpcAyCtD29ow==
X-CSE-MsgGUID: ee0G+XIqTg+kKIRpl9T6Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66344051"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66344051"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:08:01 -0800
X-CSE-ConnectionGUID: K670ivZqSJCo7v0w5/ZGgA==
X-CSE-MsgGUID: jM3EIAY+QFCdhA9ekXSPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="230554362"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa001.jf.intel.com with ESMTP; 27 Nov 2025 09:08:01 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v8 1/6] drm/xe/guc: Add log init config abi definitions
Date: Thu, 27 Nov 2025 12:07:54 -0500
Message-Id: <20251127170759.2620994-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127170759.2620994-1-zhanjun.dong@intel.com>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_lic_abi.h | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h

diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
new file mode 100644
index 000000000000..9169644093a2
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
@@ -0,0 +1,77 @@
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
+/**
+ * enum guc_lic_type - Log Init Config KLV IDs.
+ */
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
+ * struct guc_lic - GuC LIC (Log-Init-Config) structure.
+ *
+ * This is populated by the GUC at log init time and is located in the log
+ * buffer memory allocation.
+ */
+struct guc_lic {
+	/**
+	 * @magic: A magic number set by GuC to identify that this
+	 * structure contains valid information: magic = GUC_LIC_MAGIC.
+	 */
+	u32 magic;
+#define GUC_LIC_MAGIC			0x8086900D
+	/**
+	 * @version: The version of the this structure.
+	 * Major and minor version number are represented as bit fields.
+	 */
+	u32 version;
+#define GUC_LIC_VERSION_MASK_MAJOR		GENMASK(31, 16)
+#define GUC_LIC_VERSION_MASK_MINOR		GENMASK(15, 0)
+
+#define GUC_LIC_VERSION_MAJOR	1u
+#define GUC_LIC_VERSION_MINOR	0u
+
+	/** @data_count: Number of dwords the `data` array contains. */
+	u32 data_count;
+	/**
+	 * @data: Array of dwords representing a list of LIC KLVs of
+	 * type guc_klv_generic with keys represented by guc_lic_type
+	 */
+	u32 data[] __counted_by(data_count);
+} __packed;
+
+#endif
-- 
2.34.1

