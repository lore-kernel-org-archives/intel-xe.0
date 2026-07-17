Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB08C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129D10E479;
	Fri, 17 Jul 2026 14:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ee1Gd3eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D110E479
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784297829; x=1815833829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X/Qf6U13o3LMp4AYPSfdyOz7GH6uIOO+8HWZRtwFdV0=;
 b=Ee1Gd3eof7Lya6srvYI7SnaFA+GwfWhO5RoWiQuKgbEBkFJ7ybM5KR1l
 8v0gidE9IaZvmx4kTm3eTeGWgXBJvlivmZuUHpNe0td+Zt/n2IgzJDoJl
 XjxfAuBtgd9rMUSXhqRI6I0sPAz7/R7cF8uhZpnGvmcv7+61aD8Rx0PzX
 Y2BEkfNnegIC1GUprQtPW5UPIHnpHtR3xdoj/s9AdfSRgQHfQ0LToH5rR
 UDU5oexgfUGSzVnAJnpKSu7DxC4iimFkx5NWR7WkoADuLudsoJpx6uNU2
 ALipkWQv3M+iPhIgtQLDPb215Y5SPgI5W5naw31eKYn1Z0Z6aapFFGKVB Q==;
X-CSE-ConnectionGUID: hGts1TsBQ7qFbZXMavtREg==
X-CSE-MsgGUID: kvp/J98rQYKSREci+MMMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84995787"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84995787"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:17:09 -0700
X-CSE-ConnectionGUID: kI/PKGIHRi2a2RN0+7riCQ==
X-CSE-MsgGUID: MXdu3KUGTvK7l6jHpvDwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="255031618"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:17:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v10 2/3] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
Date: Fri, 17 Jul 2026 19:46:53 +0530
Message-ID: <20260717141650.2487761-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260717141650.2487761-5-riana.tauro@intel.com>
References: <20260717141650.2487761-5-riana.tauro@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
PUNIT error handling is done in
https://lore.kernel.org/intel-xe/20260713083939.251872-6-mallesh.koujalagi@intel.com/

v2: simplify soc structures
    return error code for each SoC error (Mallesh)

v3: squash patches (Raag)

v4: re-use csc work

v5: do not use csc work (Mallesh)
    simplify structure member names
    fix sparse warnings

v6: add comment for ieh bit

v7: rebase
---
 drivers/gpu/drm/xe/xe_ras.c       | 44 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 52 +++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ed609912fda1..73f9949286b4 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -8,6 +8,7 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
@@ -235,6 +236,46 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *info = (void *)arr->details;
+	struct xe_ras_soc_error_source *source = &info->source;
+	struct xe_ras_error_class *counter = &arr->counter;
+
+	if (source->csc) {
+		struct xe_ras_csc_error *csc_error = (void *)info->details;
+
+		/*
+		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
+		 * CSC firmware errors are critical errors that can be recovered only by firmware
+		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
+		 * the bit in the capability register. On receiving this error, the driver enables
+		 * runtime survivability mode which notifies userspace that a firmware update
+		 * is required.
+		 */
+		if (csc_error->hec_fw_error) {
+			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
+			       sev_to_str(counter->common.severity),
+			       csc_error->hec_fw_error);
+			xe_survivability_mode_runtime_enable(xe);
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	} else if (source->ieh) {
+		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
+
+		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
+			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
+			       sev_to_str(counter->common.severity),
+			       ieh_error->global_error_status);
+			/* TODO: Add PUNIT error handling */
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SoC internal errors, request a reset as recovery mechanism */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -358,6 +399,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_CORE_COMPUTE:
 				action = handle_core_compute_errors(arr);
 				break;
+			case XE_RAS_COMP_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 766b4b41768e..8803a198b3aa 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,8 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
+/* Error bits in IEH global error status register */
+#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -177,6 +179,56 @@ struct xe_ras_compute_error {
 	u32 reserved[15];
 } __packed;
 
+/**
+ * struct xe_ras_soc_error_source - Source of SoC error
+ */
+struct xe_ras_soc_error_source {
+	/** @csc: CSC */
+	u32 csc:1;
+	/** @ieh: IEH (Integrated Error Handler) */
+	u32 ieh:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+} __packed;
+
+/**
+ * struct xe_ras_soc_error - Error details of SoC internal error
+ */
+struct xe_ras_soc_error {
+	/** @source: Error source */
+	struct xe_ras_soc_error_source source;
+	/** @details: Error details specific to the error source */
+	u32 details[15];
+} __packed;
+
+/**
+ * struct xe_ras_csc_error - CSC error details
+ */
+struct xe_ras_csc_error {
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+	/** @hec_fw_error: CSC firmware error */
+	u32 hec_fw_error;
+} __packed;
+
+/**
+ * struct xe_ras_ieh_error - IEH (Integrated Error Handler) error details
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
+	/** @info: Additional information */
+	u32 info[10];
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
-- 
2.47.1

