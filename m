Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CEE9B340
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80B410E476;
	Mon,  2 Mar 2026 09:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdoD0esZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB2710E476
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445042; x=1803981042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmig5SQfqzragGEMKZtjshPLKAzBvT4VKWLZoDZCwPU=;
 b=OdoD0esZe3sU38ttKw+Y4KHR3VGmw4o9rf/eYO/FGBt136UUT6elS72R
 s8GrbJzPmZe9iD7/tmTAEBRxm614plstSifQHQ+gzs7JkPqF7/IOrzcpJ
 K+Ov3jT4p/K+nVtcFH1vOAWAU+I0r0Fq8YMUmYzhJgEQ5mtwjfHjDKKH4
 k0QOJ/MkrvXaeaw4xfToakJ1ETuw8imneFm1fM14d7bLCwY2DA9XP5gAx
 aw5O5InRXnL727miLfjdUXk/fmGvUYn7AOW2uisO7xiqg1fsPmOkMVB3W
 LuSQsS+VpUBqnSuFERhrk6vRZ6W0C3kW/GKz5ZwXUSe2Pi1MW7sYt6xxK A==;
X-CSE-ConnectionGUID: 4+HBUDZqTla+HMkQgIxabw==
X-CSE-MsgGUID: Xti0BPuoROKzhXZiJAv+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783054"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:42 -0800
X-CSE-ConnectionGUID: eG3VBWl7TnGYwqlLqUCxMA==
X-CSE-MsgGUID: pdSrWHnRTUKziL6ho4Du6w==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:40 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Date: Mon,  2 Mar 2026 15:52:03 +0530
Message-ID: <20260302102155.4074630-21-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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
generated and GuC is notified of the error. The KMD then sets
the context as non-runnable and initiates an engine reset.
(TODO: GuC <->KMD communication for the error).
Since the error is contained and recovered, PCI error handling
callback returns PCI_ERS_RESULT_RECOVERED.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add newline and fix log
    add bounds check (Mallesh)
    add ras specific enum (Raag)
    helper for sysctrl prepare command
    process all errors before deciding recovery action
---
 drivers/gpu/drm/xe/xe_ras.c       | 139 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h       |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h |  16 ++++
 3 files changed, 158 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 3bef589082d7..61c01a4bfadb 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,7 +4,14 @@
  */
 
 #include "xe_device_types.h"
+#include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+
+#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
+#define GLOBAL_UNCORR_ERROR			2
 
 /* Severity classification of detected errors */
 enum xe_ras_severity {
@@ -62,6 +69,138 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
 	return xe_ras_components[comp];
 }
 
+static void log_ras_error(struct xe_device *xe, struct xe_ras_error_class *error_class)
+{
+	struct xe_ras_error_common common_info = error_class->common;
+	struct xe_ras_error_product product_info = error_class->product;
+	u8 tile = product_info.unit.tile;
+	u32 instance = product_info.unit.instance;
+	u32 cause = product_info.error_cause.cause;
+
+	xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x\n",
+	       tile, instance, severity_to_str(xe, common_info.severity),
+	       comp_to_str(xe, common_info.component), cause);
+}
+
+static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
+							 struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
+	u8 uncorr_type;
+
+	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
+	log_ras_error(xe, &arr->error_class);
+
+	xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected error type %u\n",
+	       arr->timestamp, uncorr_type);
+
+	/* Request a RESET if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Local errors are recovered using a engine reset */
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
+static void xe_ras_prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
+					   u32 cmd_mask, void *request, size_t request_len,
+					   void *response, size_t response_len)
+{
+	struct xe_sysctrl_mailbox_app_msg_hdr hdr = {0};
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
+	size_t rlen;
+	int ret;
+
+	/* Default action */
+	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
+
+	if (!xe->info.has_sysctrl)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	xe_ras_prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
+				       &response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+		rlen = 0;
+
+		ret = xe_sysctrl_send_command(xe, &command, &rlen);
+		if (ret || !rlen) {
+			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+			goto err;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
+			goto err;
+		}
+
+		if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {
+			xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
+			       XE_RAS_NUM_ERROR_ARR);
+			goto err;
+		}
+
+		for (int i = 0; i < response.num_errors; i++) {
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
+				break;
+			}
+
+			/*
+			 * Retain the highest severity action. Process and log all errors
+			 * and then take appropriate recovery action
+			 */
+			if (action > final_action)
+				final_action = action;
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
index 676755732ef6..221d07efd84c 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -11,6 +11,22 @@
 #define XE_RAS_NUM_ERROR_ARR		3
 #define XE_RAS_MAX_ERROR_DETAILS	16
 
+/**
+ * enum xe_ras_recovery_action - RAS recovery actions
+ *
+ * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
+ * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
+ * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
+ *
+ * This enum defines the possible recovery actions that can be taken in response
+ * to RAS errors.
+ */
+enum xe_ras_recovery_action {
+	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
+	XE_RAS_RECOVERY_ACTION_RESET,
+	XE_RAS_RECOVERY_ACTION_DISCONNECT
+};
+
 /**
  * struct xe_ras_error_common - Common RAS error class
  *
-- 
2.47.1

