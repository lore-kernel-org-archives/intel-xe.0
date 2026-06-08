Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068AACD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C029B10EF7B;
	Mon,  8 Jun 2026 08:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5B/1RMw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A811A10EF7B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908466; x=1812444466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cSWQdK8tuUWNQrgBMYhJgvewhpkdxhgyrUCATFXTxbg=;
 b=e5B/1RMwJuCqnU/m4U59i7G0NQsY3wglCvhEvJNvEggGq5+rObB5ost4
 WsWubL0+iMBmK6AilZhk7mn77++NuqjOmsqNj9SRV1hdDvUx0gp/6CajO
 1s8qZ/oOwx2QixaS11yOMQbDJfjWCR1HG/6UuofeHzPsuoHjkZRHJQ/iQ
 FgmzNL1KAr8vDlj3idGzi1qd4nGYBhfpD4OU41pNZncdl1/XwUEnUInS9
 x3RpTYAo6BtL6yYPNjrX/dcYzeCKQ9AAgdRFlq+HttrMt2GhBe9tV1gdU
 J+ETGEHXq5g37ztegy6ASLmD2GcJYbueV2oF02MnMG0UBumPDua9MclC3 Q==;
X-CSE-ConnectionGUID: oBUyCEdPSeuiPwku/tvljQ==
X-CSE-MsgGUID: M46v8u6vQuuTZxlofSJ0RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029092"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:46 -0700
X-CSE-ConnectionGUID: cZ0T7sTJS3O6BGwBDepJ1Q==
X-CSE-MsgGUID: 1/g8zxlGRW6tAXcU6pzwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466107"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:42 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 08/15] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
Date: Mon,  8 Jun 2026 14:17:09 +0530
Message-ID: <20260608084700.640376-25-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
Return recovered from PCI error callbacks for these errors as no
action is needed.

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

v6: remove xe parameter
    remove error_class local variable (Mallesh)
    move prepare_sysctrl_command to sysctrl layer (Raag)
    shorten structure member names
    rename count to remaining
    fix sparse warnings

v7: rename sysctrl_build_command (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 110 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  55 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   4 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 6 files changed, 201 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c846e98ec6ab..005db8ab9622 100644
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
@@ -66,6 +71,24 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (void *)arr->details;
+	u8 uncorr_type;
+
+	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
+
+	/* Request a reset if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/*
+	 * No action needed for other errors.
+	 * Local errors are recovered using an engine reset by GuC.
+	 */
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -92,6 +115,93 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
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
+	u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
+	size_t rlen;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Default action */
+	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
+				  NULL, 0, &response, sizeof(response));
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
+			struct xe_ras_error_array *arr = &response.arr[i];
+			enum xe_ras_recovery_action action;
+			u8 component, severity;
+
+			component = arr->counter.common.component;
+			severity = arr->counter.common.severity;
+
+			xe_err(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
+			       sev_to_str(severity));
+
+			switch (component) {
+			case XE_RAS_COMP_CORE_COMPUTE:
+				action = handle_core_compute_errors(arr);
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
+		if (!--remaining) {
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
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 8acfd0ffe48e..8d106c708ff1 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,11 +6,14 @@
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
index 4e63c67f806a..3ffd7baa7a8c 100644
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
+	/** @counter: Error counter */
+	struct xe_ras_error_class counter;
+	/** @timestamp: Timestamp */
+	u64 timestamp;
+	/** @details: Error details specific to the counter */
+	u32 details[XE_RAS_NUM_COUNTERS];
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
+	/** @arr: Array of up to 3 errors */
+	struct xe_ras_error_array arr[XE_RAS_NUM_ERROR_ARR];
+} __packed;
+
+/**
+ * struct xe_ras_compute_error - Error details of Core Compute error
+ */
+struct xe_ras_compute_error {
+	/** @log_header: Error Source and type */
+	u32 log_header;
+	/** @reserved: Reserved */
+	u32 reserved[15];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3caa9f15875f..f49d8dabcf73 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -307,6 +307,34 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
 	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
 }
 
+/**
+ * xe_sysctrl_create_command() - Create System controller command structure
+ * @command: Sysctrl command structure
+ * @group_id: Command group ID
+ * @cmd_id: Command ID
+ * @request: Pointer to request buffer (can be NULL)
+ * @request_len: Size of request buffer
+ * @response: Pointer to response buffer
+ * @response_len: Size of response buffer
+ *
+ * Helper function to create sysctrl command to be sent via xe_sysctrl_send_command()
+ */
+void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
+			       void *request, size_t request_len, void *response,
+			       size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr header = {0};
+
+	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
+		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
+
+	command->header = header;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
 /**
  * xe_sysctrl_send_command() - Send mailbox command to System Controller
  * @sc: System Controller instance
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
index f67e9234de48..0ba841b0be1b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
@@ -27,5 +27,7 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
 int xe_sysctrl_send_command(struct xe_sysctrl *sc,
 			    struct xe_sysctrl_mailbox_command *cmd,
 			    size_t *rdata_len);
-
+void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
+			       void *request, size_t request_len, void *response,
+			       size_t response_len);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index faa973986c0d..93ff0d481d74 100644
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

