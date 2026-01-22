Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9C4C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4510E971;
	Thu, 22 Jan 2026 09:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cupTE3vY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECAD10E971
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074571; x=1800610571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fEu6FgyjeXIDO0Cu9i7EJ++OXYYVfHAxzl42rfNDDAQ=;
 b=cupTE3vYRs1W4yHv9CRGId8r36npFFwwEAtPE5q3LBrarEyuaQkx418Z
 nqPJ3ZRwApur1HGdHMvKL0rCEnjMLSDupH03zsS3LFlmIIwheWHfar2yF
 AodI17Smq9FOCphW9O57FNccyWObUoCCAQyiWubn3ZZJw5iyyv3Ts8MTc
 5PxP916bUOgjvNPn7qVK5NDSVyja5b4zzcUmEZ/bXR4tOM0EN+KxyyZK2
 eI2EPPt02nqTxj3A3dGgfWGGSOeC+rcHbeh8Lar9wAlR0NDmyQP86L5aw
 /ykHAvG3XyVOaMLkdA8xfMBShF7VCPh0OAoXBR0SyBmA39b8gY6AKPdaF A==;
X-CSE-ConnectionGUID: 4X1q001fRB6LeF1BO60oRw==
X-CSE-MsgGUID: aagA4pTnSJCwxSPUH/eBzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937769"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:11 -0800
X-CSE-ConnectionGUID: a67xaOtwS9iwc51GQbhZsg==
X-CSE-MsgGUID: xTcclbpxQ8G8VLk0/XomPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122821"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:09 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable Core-Compute
 errors
Date: Thu, 22 Jan 2026 15:36:19 +0530
Message-ID: <20260122100613.3631582-17-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h |   3 +
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ace08d8d8d46..2a98cb116dc7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -2,11 +2,16 @@
 /*
  * Copyright © 2026 Intel Corporation
  */
-#include <linux/pci.h>
-
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
 
 /* Severity classification of detected errors */
 enum xe_ras_severity {
@@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
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
+	xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x",
+	       tile, instance, severity_to_str(xe, common_info.severity),
+	       comp_to_str(xe, common_info.component), cause);
+}
+
+static pci_ers_result_t handle_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
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
+		return PCI_ERS_RESULT_NEED_RESET;
+
+	/* Local errors are recovered using a engine reset */
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+/**
+ * xe_ras_process_errors - Process and contain hardware errors
+ * @xe: xe device instance
+ *
+ * Get error details from system controller and return recovery
+ * method. Called only from PCI error handling.
+ *
+ * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
+ * PCI_ERS_RESULT_NEED_RESET otherwise.
+ */
+pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
+	struct xe_ras_get_error_response response;
+	u32 req_hdr;
+	size_t rlen;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return PCI_ERS_RESULT_NEED_RESET;
+
+	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		  FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_SOC_ERROR);
+
+	msg_hdr.data = req_hdr;
+	command.header = msg_hdr;
+	command.data_out = &response;
+	command.data_out_len = sizeof(response);
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
+		for (int i = 0; i < response.num_errors; i++) {
+			struct xe_ras_error_array arr = response.error_arr[i];
+			struct xe_ras_error_class error_class;
+			u8 component;
+
+			error_class = arr.error_class;
+			component = error_class.common.component;
+
+			if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
+				ret = handle_compute_errors(xe, &arr);
+				if (ret == PCI_ERS_RESULT_NEED_RESET)
+					goto err;
+			}
+		}
+
+	} while (response.additional_errors);
+
+	return PCI_ERS_RESULT_RECOVERED;
+
+err:
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
 #ifdef CONFIG_PCIEAER
 static void unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 14cb973603e7..28400613c9a9 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,8 +6,11 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include <linux/pci.h>
+
 struct xe_device;
 
 void xe_ras_init(struct xe_device *xe);
+pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
 
 #endif
-- 
2.47.1

