Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCCF8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DBE10E94F;
	Fri, 17 Apr 2026 08:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQcOaMOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2AE10E94F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414362; x=1807950362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fkYgjvv9IeMetG66BH2Ri3p/9FZoaH5/SFyE5m9YtH4=;
 b=NQcOaMOfaAD02QhqE+3c8w2TYHfTuoh3A4SpnQnRyjIN1UJ+LTItyYC4
 te7hVo6RunQu4gqoAaTcgUQesQXOJtxEJXPsLqWH1SoYXdn48kLzRO7iU
 lTddmZiXpZXFu3h05vRpiCvvZdrsVmXiYg40zgx91EE6puFGUj+CK93Sf
 XLXt98rOBZIX1+yOztStFIFAplbj06A93amwik57W5K8zKs3FP9ZAVfIn
 bYegC9HVvROpU6N96TlU8KAdM5qXDz83sDLlSEbOeXqkIdvjVgZceL7x6
 l8qK0Z1tpCs7UsiNO94l89MY7ITXS/HApm8y7gEf8208aa6LsBres1XQQ Q==;
X-CSE-ConnectionGUID: C9gxJ1XRR5Ke++y+YT13BA==
X-CSE-MsgGUID: 3WvttptGQDKDSQ8EtWIoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045886"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:02 -0700
X-CSE-ConnectionGUID: Rn4PX3WARg2VEsQKr/uRqw==
X-CSE-MsgGUID: wjWxreXYRgizGzfjiWw5Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962283"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:59 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 08/13] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
Date: Fri, 17 Apr 2026 14:28:20 +0530
Message-ID: <20260417085812.4013309-23-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
MIME-Version: 1.0
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

Some critical errors such as CSC firmware and Punit are reported under SoC
internal errors and require special handling.

CSC errors are classified into hardware errors and firmware errors.
Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
firmware errors are critical and require a firmware flash. On such errors,
device is wedged and runtime survivability mode will be enabled to notify
userspace that a firmware flash is required.

PUNIT uncorrectable errors can only be recovered through a cold reset.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: simplify soc structures
    return error code for each SoC error (Mallesh)

v3: squash patches (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c       | 49 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 51 +++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0cc7b3a6b13f..5010cf6211ea 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -8,6 +8,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 
@@ -92,6 +93,51 @@ static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
+	struct xe_ras_soc_error_source source = error_info->error_source;
+	struct xe_ras_error_common common = arr->error_class.common;
+
+	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
+	       comp_to_str(xe, common.component));
+
+	if (source.csc) {
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;
+
+		/*
+		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
+		 * CSC firmware errors are critical errors that can be recovered only by firmware
+		 * update via SPI driver. PCODE enables FDO mode and sets the bit in the capability
+		 * register. On receiving this error, the driver enables runtime survivability mode
+		 * which notifies userspace that a firmware update is required.
+		 */
+		if (csc_error->hec_uncorr_fw_err_dw0) {
+			xe_err(xe, "[RAS]: CSC %s error detected: 0x%x\n",
+			       severity_to_str(xe, common.severity),
+			       csc_error->hec_uncorr_fw_err_dw0);
+			xe_survivability_mode_runtime_enable(xe);
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	if (source.soc) {
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
+
+		if (ieh_error->global_error_status & XE_RAS_IEH_PUNIT_ERROR) {
+			xe_err(xe, "[RAS]: PUNIT %s error detected: 0x%x\n",
+			       severity_to_str(xe, common.severity),
+			       ieh_error->global_error_status);
+			/** TODO: Add PUNIT error handling */
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SOC internal errors, request a reset as recovery mechanism */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 				    u32 cmd_mask, void *request, size_t request_len,
 				    void *response, size_t response_len)
@@ -168,6 +214,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMPONENT_CORE_COMPUTE:
 				action = handle_compute_errors(xe, &arr);
 				break;
+			case XE_RAS_COMPONENT_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, &arr);
+				break;
 			default:
 				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 8bebe958b8e8..4f640124f38f 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_ERROR_ARR		3
 #define XE_RAS_MAX_ERROR_DETAILS	16
+#define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -148,4 +149,54 @@ struct xe_ras_compute_error {
 	/** @spare_log3: Spare log */
 	u32 spare_log3;
 } __packed;
+
+/**
+ * struct xe_ras_soc_error_source - Source of SoC error
+ */
+struct xe_ras_soc_error_source {
+	/** @csc: CSC error */
+	u32 csc:1;
+	/** @soc: SoC error */
+	u32 soc:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+} __packed;
+
+/**
+ * struct xe_ras_soc_error - SoC error details
+ */
+struct xe_ras_soc_error {
+	/** @error_source: Error Source */
+	struct xe_ras_soc_error_source error_source;
+	/** @additional_details: Additional details */
+	u32 additional_details[15];
+} __packed;
+
+/**
+ * struct xe_ras_csc_error - CSC error details
+ */
+struct xe_ras_csc_error {
+	/** @hec_uncorr_err_status: CSC error */
+	u32 hec_uncorr_err_status;
+	/** @hec_uncorr_fw_err_dw0: CSC f/w error */
+	u32 hec_uncorr_fw_err_dw0;
+} __packed;
+
+/**
+ * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) details
+ */
+struct xe_ras_ieh_error {
+	/** @ieh_instance: IEH instance */
+	u32 ieh_instance:2;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+	/** @global_error_status: Global error status */
+	u32 global_error_status;
+	/** @local_error_status: Local error status */
+	u32 local_error_status;
+	/** @gerr_mask: Global error mask */
+	u32 gerr_mask;
+	/** @additional_info: Additional information */
+	u32 additional_info[10];
+} __packed;
 #endif
-- 
2.47.1

