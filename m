Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C609AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 07:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718210E804;
	Mon, 13 Jul 2026 07:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJZ9lZ9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6364F10E804
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783928906; x=1815464906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Je06CONUaDI63lc1l+YDsX96ryCWG8iM/ApsC1mF6Mc=;
 b=hJZ9lZ9Rnl4k2G6EGSqg55xnbMAJw8hC/cBfSFCh4s1gEVg5+7b9Ipkx
 DOoz0x7T15U6m4Lq6rqtDhGqAoEiQB0RSAss3+Xj3FQ4XMeN1pB2z2+fn
 w8eWI1kaCW9Z0Lh9rO7uiEPHa/lpKo14CYZ62h0zhamyfxwjHCC2xVp3w
 3ZFCvAPMAlMYrfxbzcj2giDom0kjjAgrrs6aTBEsn0aeNAdU+xsPXShML
 SszXXEoPEgQkJFCYwklWryaBGKYL6XM0ZY2oeWaOc+1gQMfSIkNgXNAB8
 EZDK1VG+PQjpj3sQjctFegi+jOH9PSKR93gFJErrD0HzAd2BnoJhsW5AO g==;
X-CSE-ConnectionGUID: bUtS6R9tTE2+zcqjyv6TmA==
X-CSE-MsgGUID: TYdM8X68Tyaa/kVGvLqvLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84548859"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84548859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:25 -0700
X-CSE-ConnectionGUID: HROctf64RnqO9XpLaAN8Kg==
X-CSE-MsgGUID: sNCNBNvJTceGSSQzv1gBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278737288"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 2/4] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
Date: Mon, 13 Jul 2026 13:17:58 +0530
Message-ID: <20260713074755.1278607-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260713074755.1278607-6-riana.tauro@intel.com>
References: <20260713074755.1278607-6-riana.tauro@intel.com>
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
error_detected is invoked request an SBR (Secondary Bus Reset) from PCI
core.

Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected engine  without disrupting the rest of the device.

Upon detection of an uncorrectable local core-compute error, an AER is
generated and GuC is notified of the error to trigger engine reset.
Return recovered from PCI error callbacks for these errors as no
action is needed.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
[1] Local error recovery by GuC merged
 https://lore.kernel.org/all/20260706234353.3874355-1-zhanjun.dong@intel.com/

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

v8: add error type for core-compute
    use goto (Mallesh) 
---
 drivers/gpu/drm/xe/xe_ras.c                   | 116 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  56 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 74d5016d9ffe..1204b9f05b24 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -8,12 +8,21 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
-#include "xe_ras_types.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 
+#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
+/*
+ * Uncorrectable error type for core compute errors.
+ * 0 - Correctable Error
+ * 1 - Local Uncorrectable Error
+ * 2 - Global Uncorrectable Error
+ * 3 - Informational Error
+ */
+#define  GLOBAL_UNCORR_ERROR		2
+
 /* Severity of detected errors  */
 enum xe_ras_severity {
 	XE_RAS_SEV_NOT_SUPPORTED = 0,
@@ -193,6 +202,24 @@ static void ras_usp_aer_init(struct xe_device *xe)
 	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
 }
 
+static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
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
@@ -254,6 +281,93 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	return 0;
 }
 
+/**
+ * xe_ras_process_errors() - Process and contain hardware errors
+ * @xe: xe device instance
+ *
+ * Get error details from system controller and return recovery
+ * method.
+ *
+ * Returns: recovery action to be taken
+ */
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	enum xe_ras_recovery_action final_action;
+	u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
+	struct xe_ras_get_soc_error response;
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
+			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
+				sev_to_str(severity));
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
+		/* Treat flooding as a system controller error */
+		if (!--remaining) {
+			xe_err(xe, "[RAS]: sysctrl: get soc error response flooding\n");
+			goto err;
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
 /**
  * xe_ras_get_counter() - Get error counter value
  * @xe: Xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index ba0b0224df23..618364734043 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_H_
 
 #include <linux/types.h>
+#include "xe_ras_types.h"
 
 struct xe_device;
 struct xe_sysctrl_event_response;
@@ -16,5 +17,6 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 void xe_ras_init(struct xe_device *xe);
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..8d344691b549 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -9,6 +9,25 @@
 #include <linux/types.h>
 
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_NUM_ERROR_ARR			3
+
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
 
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
@@ -121,4 +140,41 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
+
+/**
+ * struct xe_ras_error_array - Details of the error types
+ */
+struct xe_ras_error_array {
+	/** @value: Counter value of the detailed error */
+	u32 value;
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
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index b0c123096969..f12bc99ee31b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -22,11 +22,13 @@ enum xe_sysctrl_group {
 /**
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
+ * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  */
 enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
-- 
2.47.1

