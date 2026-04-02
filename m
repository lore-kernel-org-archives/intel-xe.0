Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B4CC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4607D10F0D6;
	Thu,  2 Apr 2026 06:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDntJtbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1610F0DA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111402; x=1806647402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysW5R6Dajv96iZA0rzNoOBcPMQJDeMjR29aFWj4QfeE=;
 b=cDntJtbuyDWZnEADx9rt2wSVTj5ysG1tWukbSFriONofu6EgbLJ2cYQl
 1xw3bygSHmqbXnf5j3AizMkpyYgaJHhrmghx05Nh1FBl2ZZ5t3lS1n5u8
 XYJViD8gdsvmteS/6AuTkAxPckAgQv2bswH9M8gcFcWFi5qQESnQsUKk1
 1maWspSNnzysfX4c+vivx6NXmd87dgXzlcN3AkmliVP1WhTxx17DqjTxg
 p9hUY/KpwfS1ADXmhMx8mnpiYvTQj1ZM6nIQYXem5x0sqK71XtHwTK5NB
 wd1r+0cvX4yfQUx5JBE61uy/YxDS+MGQCLZnzQWNVMp8FqYq6BsRhDSqx g==;
X-CSE-ConnectionGUID: fXxPRQz7S+W4Rx2G8/avoQ==
X-CSE-MsgGUID: yy3PpWKRSGmM0e+1pH9ulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051499"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:01 -0700
X-CSE-ConnectionGUID: FApwojjeRAqmqVul8m+Fzw==
X-CSE-MsgGUID: gJSdlYfATQuB+Zd757LlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532319"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:58 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 07/10] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Date: Thu,  2 Apr 2026 12:31:38 +0530
Message-ID: <20260402070131.1603828-19-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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

Uncorrectable Core-Compute errors are classified into Global and Local
errors.

Global error is an error that affects the entire device requiring a
reset. This type of error is not isolated. When an AER is reported and
error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.

A Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without distrupting the rest of the device.

Upon detection of an Uncorrectable Local Core-Compute error, an AER is
generated and GuC is notified of the error which triggers a engine reset.
Return Recovered from PCI error callbacks for these errors.

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
---
 drivers/gpu/drm/xe/xe_ras.c       | 131 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h |  18 ++++
 3 files changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 515c28167a69..6542ed4a6a24 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -5,7 +5,16 @@
 
 #include "xe_assert.h"
 #include "xe_device_types.h"
+#include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
+#define GLOBAL_UNCORR_ERROR			2
+/* Modify as needed */
+#define XE_SYSCTRL_ERROR_FLOOD			16
 
 /* Severity classification of detected errors */
 enum xe_ras_severity {
@@ -61,6 +70,128 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
 	return comp < XE_RAS_COMPONENT_MAX ? xe_ras_components[comp] : "Unknown";
 }
 
+static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
+							 struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
+	struct xe_ras_error_common common = arr->error_class.common;
+	u8 uncorr_type;
+
+	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
+
+	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
+	       comp_to_str(xe, common.component));
+
+	/* Request a RESET if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Local errors are recovered using a engine reset by GuC */
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
+static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
+				    u32 cmd_mask, void *request, size_t request_len,
+				    void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+	u32 req_hdr;
+
+	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	hdr.data = req_hdr;
+	command->header = hdr;
+	command->data_in = request;
+	command->data_in_len = request_len;
+	command->data_out = response;
+	command->data_out_len = response_len;
+}
+
+/**
+ * xe_ras_process_errors - Process and contain hardware errors
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
+	struct xe_ras_get_error_response response;
+	enum xe_ras_recovery_action final_action;
+	u32 count = 0;
+	size_t rlen;
+	int ret;
+
+	/* Default action */
+	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
+
+	if (!xe->info.has_sysctrl)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
+				&response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+		rlen = 0;
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+			goto err;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
+			       sizeof(response), rlen);
+			goto err;
+		}
+
+		for (int i = 0; i < response.num_errors &&  i < XE_RAS_NUM_ERROR_ARR; i++) {
+			struct xe_ras_error_array arr = response.error_arr[i];
+			enum xe_ras_recovery_action action;
+			struct xe_ras_error_class error_class;
+			u8 component;
+
+			error_class = arr.error_class;
+			component = error_class.common.component;
+
+			switch (component) {
+			case XE_RAS_COMPONENT_CORE_COMPUTE:
+				action = handle_compute_errors(xe, &arr);
+				break;
+			default:
+				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
+				action = XE_RAS_RECOVERY_ACTION_RESET;
+				break;
+			}
+
+			/*
+			 * Retain the highest severity action. Process and log all errors
+			 * and then take appropriate recovery action.
+			 */
+			if (action > final_action)
+				final_action = action;
+		}
+
+		/* Break if system controller floods responses */
+		if (++count > XE_SYSCTRL_ERROR_FLOOD) {
+			xe_err(xe, "[RAS]: Sysctrl response flooding\n");
+			break;
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
index 14cb973603e7..e191ab80080c 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,8 +6,11 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include "xe_ras_types.h"
+
 struct xe_device;
 
 void xe_ras_init(struct xe_device *xe);
+enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index ed69654e5bae..e37dd12bffa3 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -11,6 +11,24 @@
 #define XE_RAS_NUM_ERROR_ARR		3
 #define XE_RAS_MAX_ERROR_DETAILS	16
 
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
  * struct xe_ras_error_common - Common RAS error class
  *
-- 
2.47.1

