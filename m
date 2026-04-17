Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90495F8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587AA10E992;
	Fri, 17 Apr 2026 08:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nG1YpEGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAE110E992
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414355; x=1807950355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fcxjh1tpzizhW3WBTdRlQswCQHLCb6CN3/Ui/Q8YZMY=;
 b=nG1YpEGHvu5fL8yVIOKChiTwZAx2oyo9lLTMB8Tq6IJVeVrHV7KuBRZL
 BChnG1pMzKjQYUVzDYA6aUkQrvfse+X2Mia+RnUyb1/c2o9shJ2hNazTU
 T5I2eYEWpA2GSBTKM7KOEFAHtpgdpMFMWR8KsF2ztr0KSkbt3cZD8usIo
 YmgJAK+T/vm9uRp97K53dnAN2dUmzfU38aXX/vK2GY0qCQaFJwHGuSSxU
 k4V1rHI/dAMB2bBc7mDpGtN9ltAnx7EZjHr+ZYPpV74swlqvZVBn2xtQi
 uMauHa5UYY3hK6ANsf1RsMsXizAjPgrgb+9D8Vz7HFtcQMwafsVoGo94r g==;
X-CSE-ConnectionGUID: 3FpnUQkoQoO+if+6+24eaQ==
X-CSE-MsgGUID: z4xnqZLGRuCh8PrSHZFSIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045851"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:53 -0700
X-CSE-ConnectionGUID: BAbdtvkSSY+Bs/Xzz8iBkw==
X-CSE-MsgGUID: ZaU0v6ZhSI67qOD4f+PkTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962267"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and commands for
 uncorrectable errors
Date: Fri, 17 Apr 2026 14:28:18 +0530
Message-ID: <20260417085812.4013309-21-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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

Add the commands and common structures for the get_soc_error
sysctrl command.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: use macro max error details (Mallesh)
    use static_assert
    fix kernel-doc

v3: simplify check (Raag)
    add counter value

v4: use not_supported instead of unknown (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 57 +++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 96 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 13 +++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 4f705deaeefa..bf780e953925 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,9 +3,66 @@
  * Copyright © 2026 Intel Corporation
  */
 
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
+		severity = XE_RAS_SEVERITY_NOT_SUPPORTED;
+
+	return xe_ras_severities[severity];
+}
+
+static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
+{
+	if (comp >= XE_RAS_COMPONENT_MAX)
+		comp = XE_RAS_COMPONENT_NOT_SUPPORTED;
+
+	return xe_ras_components[comp];
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
new file mode 100644
index 000000000000..3d0f9e94a404
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -0,0 +1,96 @@
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
+	/** @counter_value: Counter value of the returned error */
+	u32 counter_value;
+	/** @error_class: Error class */
+	struct xe_ras_error_class error_class;
+	/** @timestamp: Timestamp */
+	u64 timestamp;
+	/** @error_details: Error details specific to the class */
+	u32 error_details[XE_RAS_MAX_ERROR_DETAILS];
+} __packed;
+
+/**
+ * struct xe_ras_get_error_response - Response from get soc error command
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
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 89456aec6097..00a0f05aab32 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -10,6 +10,19 @@
 
 #include "abi/xe_sysctrl_abi.h"
 
+/**
+ * enum xe_sysctrl_mailbox_command_id - Command ID's for GFSP group
+ *
+ * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
+ */
+enum xe_sysctrl_mailbox_command_id {
+	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01
+};
+
+enum xe_sysctrl_group {
+	XE_SYSCTRL_GROUP_GFSP = 1
+};
+
 /**
  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
  */
-- 
2.47.1

