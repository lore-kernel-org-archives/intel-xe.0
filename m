Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDACC61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1D410E8F4;
	Tue, 25 Aug 2026 06:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ake/2p9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E843210E8F3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639807; x=1819175807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6pooQI5IeB1PSklx9UWnUsDI7Mmv+puWFXEWHLeUOVE=;
 b=Ake/2p9zQfgCoIgyoJ9jG5znKXtmFs5P963hbSx0YeNtLhi/v9j//u2R
 Dr7L6jjd5JEoFMqXzNm2olbnvvOq/AFeiC4OE10d437XTIguGhrwmQcq4
 g2dQ2k/lLXxBJsAelFswlFkKgVSVP0W5EkekFb4gplKsCIF4jo0zjf5KZ
 2/oK89wMcVpjl8RzfBPSs0N27YksPAPTmjrXXCA93YP4PEXlaxIdzKO6+
 4veQL0kzwt4Fhtpr5W8XfPcqm7THBoS9mg6I3lROoj1RNZ/DGtDmIyNkr
 LKz6h4TO2AbtioA1dy3peU726ygEbBQDGjnRgdMcAO45YgSJpijQhZkM+ A==;
X-CSE-ConnectionGUID: mgvkdp+lTiOVPCjmcqlyfw==
X-CSE-MsgGUID: le8Xf52FRzqWlqYxSjj6zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226099"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226099"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:47 -0700
X-CSE-ConnectionGUID: 7rgE/LF8SN+RlzK1Mp37tw==
X-CSE-MsgGUID: TBLZAbMHQp+AolcGfe1vfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265428974"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
Date: Tue, 25 Aug 2026 12:06:17 +0530
Message-ID: <20260825063615.3697317-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825063615.3697317-7-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
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

This will be integrated with the related address-fault handling flow
once this patch is merged.
https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
Sending for initial comments.

Add basic support for sending page offline/decline requests to system
controller and use it for device memory ECC error handling.
Pages that belong to critical BOs cannot be handled by offlining and
require a SBR (Secondary Bus Reset).
Pages that are configured for log-only handling are not marked as bad by
firmware.

For all other valid page addresses, the first occurrence of error
indicates a poison error and the page is offlined only by software.
Firmware avoids permanently marking the page as bad. The second occurrence
of an error indicates a Double-bit ECC error and the firmware
permanently marks the page as bad.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..c643c7137a42 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
+				 enum xe_ras_page_action action)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_page_offline_request request = {0};
+	struct xe_ras_page_offline_response response = {0};
+	size_t rlen;
+	int ret;
+
+	if (!xe->info.has_sysctrl)
+		return 0;
+
+	if (action >= XE_RAS_PAGE_ACTION_MAX) {
+		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
+		return -EINVAL;
+	}
+
+	request.page_address = page_address;
+	request.action = action;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
+				  &request, sizeof(request), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_log_err(xe, SYSCTRL, -EINVAL,
+			   "unexpected page offline response length %zu (expected %zu)\n",
+			   rlen, sizeof(response));
+		return -EINVAL;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
+			   response.status);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
+{
+	enum xe_ras_page_action action;
+	int ret = 0;
+
+	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
+		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
+			   page_address);
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: Call function to handle address fault
+	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
+	 */
+
+	/*
+	 * Handle return code from address fault handling function:
+	 *  0: Page soft offlined, decline to firmware
+	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
+	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
+	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
+	 */
+
+	switch (ret) {
+	case 0:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		xe_log_err(xe, DEVICE_MEMORY, 0,
+			   "Poison detected at physical address 0x%llx, page software offlined\n",
+			   page_address);
+		break;
+	/* User policy set to decline page offlining */
+	case -EOPNOTSUPP:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		break;
+	case -EIO:
+		xe_log_err(xe, DEVICE_MEMORY, -EIO,
+			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
+		return ret;
+	case -EEXIST:
+		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
+			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
+			   page_address);
+		break;
+	default:
+		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
+				 page_address);
+		return 0;
+	}
+
+	if (send_cmd) {
+		ret = send_page_offline_cmd(xe, page_address, action);
+		if (ret)
+			xe_log_err_fatal(xe, SYSCTRL, ret,
+					 "Failed to offline page for physical address 0x%llx\n",
+					 page_address);
+		return ret;
+	}
+
+	return 0;
+}
+
 static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
 {
 	u8 severity = counter->common.severity;
@@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	int ret;
 
 	/*
 	 * For memory errors, the recovery action depends on the error category
 	 *
-	 * TODO: Double-bit ECC errors: Page offlining
+	 * Double-bit ECC errors: Page offlining
 	 * Poison and data parity errors: Log only
 	 * For any other memory errors, request a reset as recovery mechanism
 	 */
@@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 		xe_info(xe, "[RAS]: Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
-		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
-			info->sw_address);
-		/* TODO: Add page offlining for Double-bit ECC error */
-		fallthrough;
+		ret = handle_page_offline(xe, info->sw_address, true);
+		if (ret)
+			return XE_RAS_RECOVERY_ACTION_RESET;
+		break;
 	default:
 		return XE_RAS_RECOVERY_ACTION_RESET;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 99b2466e2062..2fac968879b6 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -17,6 +17,19 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+/**
+ * enum xe_ras_page_action - Page offline actions for page offline request
+ *
+ * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
+ * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
+ * @XE_RAS_PAGE_ACTION_MAX: Max value
+ */
+enum xe_ras_page_action {
+	XE_RAS_PAGE_ACTION_OFFLINE,
+	XE_RAS_PAGE_ACTION_DECLINE,
+	XE_RAS_PAGE_ACTION_MAX
+};
+
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
  *
@@ -245,6 +258,28 @@ struct xe_ras_memory_error {
 	u32 reserved2[10];
 } __packed;
 
+/**
+ * struct xe_ras_page_offline_request - Request for page offline command
+ */
+struct xe_ras_page_offline_request {
+	/** @page_address: Page address (4KB aligned) */
+	u64 page_address;
+	/** @action: Action to be performed, see &enum xe_ras_page_action */
+	u32 action;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_page_offline_response - Response from page offline command
+ */
+struct xe_ras_page_offline_response {
+	/** @status: Status of the page offline request */
+	u32 status;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index d0341538ad05..3363f48da2b7 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -26,6 +26,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
-- 
2.47.1

