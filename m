Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40FCC44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332D10E968;
	Thu, 22 Jan 2026 09:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoE6xoc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FF710E96F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074568; x=1800610568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9jxJb7Xhrnqx2LZK5xTa6o/bt1ZMf7r7TPmq56TE4k=;
 b=HoE6xoc6sNK2JYjWamIc2531Ql531NqD5EIW1NoUN5VXJA2wZbuxcOeI
 OCV9KGr1kNbplTl6TJrpR0u+qYPAneEnrF0E7FGjJoGg/h4xMGedco07B
 kIfEZdCVkJxsin0rai0YBMFkFDscItr+ObY1jTnNLH2CasNx8R0zSnUCZ
 +mch3HOHNrIpnz25gsqXQE0F9Qb40ndkohFVluxyA+Fec1YW6fwW/URYZ
 wvuithzeMjTQmG8SKiRKgBfmLVYbAZXpjkPqTlaSNYLKDcOTfdKa8b6gC
 LJM6MLF/+an1BulEGS3P9xKYM78B5Ax1QhzNF5RiklMZQRDPrmdTbXKwK A==;
X-CSE-ConnectionGUID: Vl4MTq8mRbOv0gxMiVjPlg==
X-CSE-MsgGUID: erHn9B1pSJ25uiqVy1kYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937764"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:07 -0800
X-CSE-ConnectionGUID: c8sHLkqgQm+lMyj8ZjxTRA==
X-CSE-MsgGUID: r6kK08Y/QtipX3vQqhBTOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122817"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:05 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 6/8] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
Date: Thu, 22 Jan 2026 15:36:18 +0530
Message-ID: <20260122100613.3631582-16-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c                   |  53 +++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 131 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  13 ++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ba5ed37aed28..ace08d8d8d46 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,9 +4,62 @@
  */
 #include <linux/pci.h>
 
+#include "xe_assert.h"
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
+	XE_RAS_COMPONENT_SOC,
+	XE_RAS_COMPONENT_MAX
+};
+
+static const char * const xe_ras_severities[] = {
+	[XE_RAS_SEVERITY_NOT_SUPPORTED]		= "Not Supported",
+	[XE_RAS_SEVERITY_CORRECTABLE]		= "Correctable",
+	[XE_RAS_SEVERITY_UNCORRECTABLE]		= "Uncorrectable",
+	[XE_RAS_SEVERITY_INFORMATIONAL]		= "Informational",
+};
+
+static const char * const xe_ras_components[] = {
+	[XE_RAS_COMPONENT_NOT_SUPPORTED]	= "Not Supported",
+	[XE_RAS_COMPONENT_DEVICE_MEMORY]	= "Device Memory",
+	[XE_RAS_COMPONENT_CORE_COMPUTE]		= "Core Compute",
+	[XE_RAS_COMPONENT_RESERVED]		= "Reserved",
+	[XE_RAS_COMPONENT_PCIE]			= "PCIe",
+	[XE_RAS_COMPONENT_FABRIC]		= "Fabric",
+	[XE_RAS_COMPONENT_SOC]			= "SoC",
+};
+
+static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
+{
+	xe_assert(xe, severity < XE_RAS_SEVERITY_MAX);
+
+	return xe_ras_severities[severity];
+}
+
+static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
+{
+	xe_assert(xe, comp < XE_RAS_COMPONENT_MAX);
+
+	return xe_ras_components[comp];
+}
+
 #ifdef CONFIG_PCIEAER
 static void unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..c7a930c16f68
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,131 @@
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
+	/** @num_errors: No of errors reported in this response */
+	u8 num_errors;
+	/** @additional_errors: Indicates if the errors are pending */
+	u8 additional_errors;
+	/** @error_arr: Array of up to 3 errors */
+	struct xe_ras_error_array error_arr[3];
+} __packed;
+
+/**
+ * struct xe_ras_compute_error: Error details of Compute error
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
index 1f315ad1b996..45ef10f5cfa2 100644
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

