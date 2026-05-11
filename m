Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB3CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB82410E804;
	Mon, 11 May 2026 16:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kasJNKbJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B53B10E84C
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518582; x=1810054582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BsKOAzGG0Kh5EnSsfDpEzEFyEF1NuyweHhZVAI2BNHI=;
 b=kasJNKbJXJ9D6Zvyg3m0GNalWsOZym2uC5ScUx9dt4xnaKZYMfp7dh9t
 4vbuIC6+2s6EH6VJ+WjcQ0eKY2K91d3MA5Eb8wfz4lVCH4Pi5OSalx76t
 ropq2PnBtNwQztV0sf9jiBXnorQCu3xecHK/acK9d4VV2waVQFcsEewbl
 /f6QOkHmlRnURTL5gZmr3uN55osmrrzLBU9MP5el4c5aXP9lMBBEZIeNn
 4ylJDJbQd1mD5dwR+dhzgugBgaX3bdQrJTRsW/oCgn1Fu7iYMS1uGY6Rs
 JI02URi+tOIaqc+Q+yq3FpFmbS8UmPQMSCsU6qKutELorp3BFbOdrPqCk w==;
X-CSE-ConnectionGUID: nlwvwm18Suumjiik3axjlQ==
X-CSE-MsgGUID: NS5V7xNGTMCLQJE13o8pmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513553"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:22 -0700
X-CSE-ConnectionGUID: cCdCnrxvSn6EYQl0cY1b4A==
X-CSE-MsgGUID: 0peXlxdKSieslZJsyDJZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988751"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 07/14] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
Date: Mon, 11 May 2026 22:59:14 +0530
Message-ID: <20260511172908.1122252-23-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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

Add structures and command for get soc error and process uncorrectable
core-compute errors.

Uncorrectable core-compute errors are classified into global and local
errors.

Global error is an error that affects the entire device requiring a
reset. This type of error is not isolated. When an AER is reported and
error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.

Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without disrupting the rest of the device.

Upon detection of an uncorrectable local core-compute error, an AER is
generated and GuC is notified of the error to trigger engine reset.
Return recovered from PCI error callbacks for these errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add newline and fix log
    add bounds check (Mallesh)
    add ras specific enum (Raag)
    helper for sysctrl prepare command
    process all errors before deciding recovery action

v3: remove TODO from commit message
    remove redundant rlen check
    fix loop
    add check for sysctrl flooding (Raag)
    do not use xe_ras prefix for static functions (Soham)

v4: remove rlen initialization to 0
    remove local variable
    add error message for length mismatch (Raag)
    reset on sysctrl flooding
    fix sysctrl flood condition

v5: rebase
    modify log and move it to process_errors
    modify sysctrl flood check
    remove whitespace
    simplify structure (Raag)
    fix typo in commit message
---
 drivers/gpu/drm/xe/xe_ras.c                   | 126 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  55 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 24642c309967..ecadad5857b2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -9,6 +9,11 @@
 #include "xe_ras_types.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
+#define  GLOBAL_UNCORR_ERROR		2
 
 /* Severity of detected errors  */
 enum xe_ras_severity {
@@ -66,6 +71,38 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
+				u32 cmd_mask, void *request, size_t request_len,
+				void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+
+	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	command->header = hdr;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
+static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
+	u8 uncorr_type;
+
+	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->error_log_header);
+
+	/* Request a reset if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Local errors are recovered using an engine reset by GuC */
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -92,6 +129,95 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
+/**
+ * xe_ras_process_errors() - Process and contain hardware errors
+ * @xe: xe device instance
+ *
+ * Get error details from system controller and return recovery
+ * method. Called only from PCI error handling.
+ *
+ * Returns: recovery action to be taken
+ */
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_get_soc_error response;
+	enum xe_ras_recovery_action final_action;
+	u32 count = XE_SYSCTRL_FLOOD;
+	size_t rlen;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Default action */
+	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
+
+	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
+			    &response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
+			goto err;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "sysctrl: unexpected get soc error response length %zu (expected %zu)\n",
+			       rlen, sizeof(response));
+			goto err;
+		}
+
+		/* Report if number of errors exceeds the maximum errors supported */
+		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
+			xe_err(xe, "sysctrl: number of errors received %d out of bound (%d)\n",
+			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
+
+		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
+			struct xe_ras_error_array *arr = &response.error_arr[i];
+			enum xe_ras_recovery_action action;
+			struct xe_ras_error_class error_class;
+			u8 component, severity;
+
+			error_class = arr->error_class;
+			component = error_class.common.component;
+			severity = error_class.common.severity;
+
+			xe_err(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
+			       sev_to_str(severity));
+
+			switch (component) {
+			case XE_RAS_COMP_CORE_COMPUTE:
+				action = handle_core_compute_errors(xe, arr);
+				break;
+			default:
+				/* For any other component, reset */
+				action = XE_RAS_RECOVERY_ACTION_RESET;
+				break;
+			}
+
+			/* Process and log all errors and then trigger highest recovery action */
+			if (action > final_action)
+				final_action = action;
+		}
+
+		/* Treat flooding as an system controller error */
+		if (!--count) {
+			xe_err(xe, "[RAS]: sysctrl: get soc error response flooding\n");
+			return XE_RAS_RECOVERY_ACTION_RESET;
+		}
+
+	} while (response.additional_errors);
+
+	return final_action;
+
+err:
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index a88ea0a46766..cdaad3114dae 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,10 +6,13 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include "xe_ras_types.h"
+
 struct xe_device;
 struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 void xe_ras_init(struct xe_device *xe);
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4e63c67f806a..e97026fd6ff9 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -8,8 +8,27 @@
 
 #include <linux/types.h>
 
+#define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_recovery_action - RAS recovery actions
+ *
+ * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
+ * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
+ * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
+ * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
+ *
+ * This enum defines the possible recovery actions that can be taken in response
+ * to RAS errors.
+ */
+enum xe_ras_recovery_action {
+	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
+	XE_RAS_RECOVERY_ACTION_RESET,
+	XE_RAS_RECOVERY_ACTION_DISCONNECT,
+	XE_RAS_RECOVERY_ACTION_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
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
+	u32 error_details[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+/**
+ * struct xe_ras_get_soc_error - Response from get soc error command
+ */
+struct xe_ras_get_soc_error {
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
+	/** @reserved: Reserved */
+	u32 reserved[15];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 0fa786a9e8c8..5ccfc6325a90 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -22,9 +22,11 @@ enum xe_sysctrl_group {
 /**
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
+ * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  */
 enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 };
 
-- 
2.47.1

