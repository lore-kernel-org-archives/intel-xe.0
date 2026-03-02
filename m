Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB163E9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968010E472;
	Mon,  2 Mar 2026 09:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTqLF8UF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC73810E476
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445039; x=1803981039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rxRoUUqrJT3ke1km23Gdw7tNIVi1gkYHyOt1vJs70Vs=;
 b=iTqLF8UFKO4uQOwJselrBdwIvKMiwP+yxtDvlS9uD2Np8/m2jR3nXufu
 hyc7+5DMoqTQM9as1+g0hCZIX7lJtYjOEjUmepH2DLIzV0SR8U98RbeNq
 BDk1R6BSsYOsBasULiwdGZVHjatV8uMwqu4TneoN2uzfTactv+N1GIN1k
 5s3eayK1w93hLY3QHnzmOnG0i+rE31IaymTrBBe5wd7iStL24cOAuVZoc
 rciWeo+mdk9m5YAmClAgl13PU2UJUOnXeiufenwF9homO3hcSUmLK7ffQ
 l8g026lCrA4Eoz4/o78vUVEG+XBjTeg1eEakeE0dIph2Nz7MfPpw69su0 w==;
X-CSE-ConnectionGUID: 8ovVe8T3RAeJAVQSLr/W9Q==
X-CSE-MsgGUID: zNxsz9sjSju3LVR2NBpdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783052"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:38 -0800
X-CSE-ConnectionGUID: wgaKl0vLRSO7M9ekcMkJ0w==
X-CSE-MsgGUID: yMHB/l0xRbm0Y1Nof6ukEw==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 07/11] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
Date: Mon,  2 Mar 2026 15:52:02 +0530
Message-ID: <20260302102155.4074630-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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

Add the sysctrl commands and response structures for Uncorrectable
Core Compute errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: use macro max error details (Mallesh)
    use static_assert
    fix kernel-doc
    remove xe_assert
---
 drivers/gpu/drm/xe/xe_ras.c                   |  56 ++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 132 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 ++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index bc7615c6c1be..3bef589082d7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -6,6 +6,62 @@
 #include "xe_device_types.h"
 #include "xe_ras.h"
 
+/* Severity classification of detected errors */
+enum xe_ras_severity {
+	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
+	XE_RAS_SEVERITY_CORRECTABLE,
+	XE_RAS_SEVERITY_UNCORRECTABLE,
+	XE_RAS_SEVERITY_INFORMATIONAL,
+	XE_RAS_SEVERITY_MAX
+};
+
+/* major IP blocks where errors can originate */
+enum xe_ras_component {
+	XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
+	XE_RAS_COMPONENT_DEVICE_MEMORY,
+	XE_RAS_COMPONENT_CORE_COMPUTE,
+	XE_RAS_COMPONENT_RESERVED,
+	XE_RAS_COMPONENT_PCIE,
+	XE_RAS_COMPONENT_FABRIC,
+	XE_RAS_COMPONENT_SOC_INTERNAL,
+	XE_RAS_COMPONENT_MAX
+};
+
+static const char * const xe_ras_severities[] = {
+	[XE_RAS_SEVERITY_NOT_SUPPORTED]		= "Not Supported",
+	[XE_RAS_SEVERITY_CORRECTABLE]		= "Correctable",
+	[XE_RAS_SEVERITY_UNCORRECTABLE]		= "Uncorrectable",
+	[XE_RAS_SEVERITY_INFORMATIONAL]		= "Informational",
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);
+
+static const char * const xe_ras_components[] = {
+	[XE_RAS_COMPONENT_NOT_SUPPORTED]	= "Not Supported",
+	[XE_RAS_COMPONENT_DEVICE_MEMORY]	= "Device Memory",
+	[XE_RAS_COMPONENT_CORE_COMPUTE]		= "Core Compute",
+	[XE_RAS_COMPONENT_RESERVED]		= "Reserved",
+	[XE_RAS_COMPONENT_PCIE]			= "PCIe",
+	[XE_RAS_COMPONENT_FABRIC]		= "Fabric",
+	[XE_RAS_COMPONENT_SOC_INTERNAL]		= "SoC Internal",
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);
+
+static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
+{
+	if (severity >= XE_RAS_SEVERITY_MAX)
+		return "Unknown Severity";
+
+	return xe_ras_severities[severity];
+}
+
+static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
+{
+	if (comp >= XE_RAS_COMPONENT_MAX)
+		return "Unknown Component";
+
+	return xe_ras_components[comp];
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..676755732ef6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_TYPES_H_
+#define _XE_RAS_TYPES_H_
+
+#include <linux/types.h>
+
+#define XE_RAS_NUM_ERROR_ARR		3
+#define XE_RAS_MAX_ERROR_DETAILS	16
+
+/**
+ * struct xe_ras_error_common - Common RAS error class
+ *
+ * This structure contains error severity and component information
+ * across all products
+ */
+struct xe_ras_error_common {
+	/** @severity: Error Severity */
+	u8 severity;
+	/** @component: IP where the error originated */
+	u8 component;
+} __packed;
+
+/**
+ * struct xe_ras_error_unit - Error unit information
+ */
+struct xe_ras_error_unit {
+	/** @tile: Tile identifier */
+	u8 tile;
+	/** @instance: Instance identifier within a component */
+	u32 instance;
+} __packed;
+
+/**
+ * struct xe_ras_error_cause - Error cause information
+ */
+struct xe_ras_error_cause {
+	/** @cause: Cause */
+	u32 cause;
+	/** @reserved: For future use */
+	u8 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_error_product - Error fields that are specific to the product
+ */
+struct xe_ras_error_product {
+	/** @unit: Unit within IP block */
+	struct xe_ras_error_unit unit;
+	/** @error_cause: Cause/checker */
+	struct xe_ras_error_cause error_cause;
+} __packed;
+
+/**
+ * struct xe_ras_error_class - Complete RAS Error Class
+ *
+ * This structure provides the complete error classification by combining
+ * the common error class with the product-specific error class.
+ */
+struct xe_ras_error_class {
+	/** @common: Common error severity and component */
+	struct xe_ras_error_common common;
+	/** @product: Product-specific unit and cause */
+	struct xe_ras_error_product product;
+} __packed;
+
+/**
+ * struct xe_ras_error_array - Details of the error types
+ */
+struct xe_ras_error_array {
+	/** @error_class: Error class */
+	struct xe_ras_error_class error_class;
+	/** @timestamp: Timestamp */
+	u64 timestamp;
+	/** @error_details: Error details specific to the class */
+	u32 error_details[XE_RAS_MAX_ERROR_DETAILS];
+} __packed;
+
+/**
+ * struct xe_ras_get_error_response - Response for XE_SYSCTRL_GET_SOC_ERROR
+ */
+struct xe_ras_get_error_response {
+	/** @num_errors: Number of errors reported in this response */
+	u8 num_errors;
+	/** @additional_errors: Indicates if the errors are pending */
+	u8 additional_errors;
+	/** @error_arr: Array of up to 3 errors */
+	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
+} __packed;
+
+/**
+ * struct xe_ras_compute_error - Error details of Core Compute error
+ */
+struct xe_ras_compute_error {
+	/** @error_log_header: Error Source and type */
+	u32 error_log_header;
+	/** @internal_error_log: Internal Error log */
+	u32 internal_error_log;
+	/** @fabric_log: Fabric Error log */
+	u32 fabric_log;
+	/** @internal_error_addr_log0: Internal Error addr log */
+	u32 internal_error_addr_log0;
+	/** @internal_error_addr_log1: Internal Error addr log */
+	u32 internal_error_addr_log1;
+	/** @packet_log0: Packet log */
+	u32 packet_log0;
+	/** @packet_log1: Packet log */
+	u32 packet_log1;
+	/** @packet_log2: Packet log */
+	u32 packet_log2;
+	/** @packet_log3: Packet log */
+	u32 packet_log3;
+	/** @packet_log4: Packet log */
+	u32 packet_log4;
+	/** @misc_log0: Misc log */
+	u32 misc_log0;
+	/** @misc_log1: Misc log */
+	u32 misc_log1;
+	/** @spare_log0: Spare log */
+	u32 spare_log0;
+	/** @spare_log1: Spare log */
+	u32 spare_log1;
+	/** @spare_log2: Spare log */
+	u32 spare_log2;
+	/** @spare_log3: Spare log */
+	u32 spare_log3;
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index ce10924c5881..14e2d7989fcc 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -8,6 +8,19 @@
 
 #include <linux/types.h>
 
+/**
+ * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
+ */
+enum xe_sysctrl_mailbox_command_id {
+	XE_SYSCTRL_CMD_GET_SOC_ERROR = 1
+};
+
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP = 1
+};
+
 struct xe_sysctrl_mailbox_mkhi_msg_hdr {
 	__le32 data;
 } __packed;
-- 
2.47.1

