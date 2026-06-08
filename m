Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E44CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0477110EF79;
	Mon,  8 Jun 2026 08:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjd9MQfJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8231410EF79
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908490; x=1812444490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VlEtwaAl1W8Dg1+dy6oeF1jCbzyheURpafa5ZBJ/e6Q=;
 b=hjd9MQfJyoz3eg7evrrcnFccpBEycW1yRJrH0Kkn+QnI6M9iN9ij9kUI
 FTbe6Efa5KhPA2t9CqNJxWwp3jtmRa0J/dto7f1a1ftVgo15MUS8MkpKB
 sNIDN+CGVAVHZ+2GHmEUju1UlHyahuY2Icsr0lGN8xZYcJ7PDONlANTwk
 sjtn6diJDKfG1Dq25sKpeLsIPJ8Eg7TxD2pWBkDWQIQZZbo0c4ZkfhWuZ
 lN687jUVdj98y3HysE4jvW+64lxeJG2kHykJJtEMOFeROPh/DLLiZ7+RW
 4hW9nfwWOrMJKxmnxX6VbQGUr7cdFrsDNhu4+fX8hyGr2qwg4T/Yo1wvw A==;
X-CSE-ConnectionGUID: PuXaIxq6T4Gjs3uYuNqZ2w==
X-CSE-MsgGUID: cu+J4pH4T3mrLZDIFHbkRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029134"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029134"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:10 -0700
X-CSE-ConnectionGUID: qhTXdgUxQVq7M9ma8Sm1CQ==
X-CSE-MsgGUID: A82E7oDYQI+8hoKhpnWwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466152"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:06 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC PATCH v8 14/15] drm/xe/xe_ras: Add support to offline and
 decline a page address
Date: Mon,  8 Jun 2026 14:17:15 +0530
Message-ID: <20260608084700.640376-31-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
https://lore.kernel.org/intel-xe/20260506141143.4033299-12-tejas.upadhyay@intel.com/
Sending for initial comments.

Add basic support for sending page offline/decline requests
to system controller and use it for device memory ECC error
handling.

Handle return values from xe_ttm_vram_handle_addr_fault() and take
corresponding action. Pages that belong to critical BOs cannot
be handled by offlining and require a SBR (Secondary Bus Reset).
Pages that are configured for log-only handling are declined.
Other eligible page addresses are offlined through firmware.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: set ret to 0 (Tejas)
    use switch for status

v3: rebase
---
 drivers/gpu/drm/xe/xe_ras.c                   | 123 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             |  58 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 182 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b0df2bb3aeca..c4ff696ec2f2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -72,6 +73,122 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static int ras_status_to_errno(u32 status)
+{
+	switch (status) {
+	case XE_RAS_STATUS_SUCCESS:
+		return 0;
+	case XE_RAS_STATUS_INVALID_PARAM:
+		return -EINVAL;
+	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case XE_RAS_STATUS_TIMEOUT:
+		return -ETIMEDOUT;
+	case XE_RAS_STATUS_HARDWARE_FAILURE:
+		return -EIO;
+	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
+		return -ENOSPC;
+	default:
+		return -EPROTO;
+	}
+}
+
+static int send_page_offline(struct xe_device *xe, enum xe_ras_page_action action, u64 page_address)
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
+		xe_err(xe, "[RAS]: Invalid page offline action %d\n", action);
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
+		xe_err(xe, "sysctrl: failed to send page offline command %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EINVAL;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_err(xe, "sysctrl: page offline command failed with status %d\n",
+		       response.status);
+	}
+
+	return ret;
+}
+
+static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_offline_cmd)
+{
+	enum xe_ras_page_action action;
+	int ret = 0;
+
+	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
+		xe_err(xe, "sysctrl: Unaligned page address: 0x%llx\n", page_address);
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
+	 *  0: Address is valid and can be offlined
+	 * -EIO: Address belongs to a critical BO that cannot be offlined
+	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
+	 *
+	 * For any other non-zero error code, skip offlining.
+	 */
+
+	switch (ret) {
+	case 0:
+		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		break;
+	/* User policy set to decline page offlining */
+	case -EOPNOTSUPP:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		break;
+	case -EIO:
+		xe_err(xe, "[RAS]: Page address belongs to critical BO: 0x%llx\n",
+		       page_address);
+		return ret;
+	default:
+		xe_err(xe, "[RAS]: Failed to handle address fault 0x%llx: %d\n",
+		       page_address, ret);
+		return 0;
+	}
+
+	if (send_offline_cmd) {
+		ret = send_page_offline(xe, action, page_address);
+		if (ret)
+			xe_err(xe, "sysctrl: Failed to offline page for address 0x%llx: %d\n",
+			       page_address, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
@@ -135,11 +252,12 @@ static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device
 							       struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	int ret;
 
 	/*
 	 * For memory errors, the recovery action depends on the error category
 	 *
-	 * TODO: Double bit ECC: Page offline handling
+	 * Double bit ECC: Page offline handling
 	 * Poison and data parity errors: Log only
 	 * For any other memory errors, request a reset as recovery mechanism
 	 */
@@ -147,6 +265,9 @@ static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device
 	case XE_RAS_MEMORY_ECC:
 		xe_err(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
 		       info->sw_address);
+		ret = handle_page_offline(xe, info->sw_address, true);
+		if (ret)
+			return XE_RAS_RECOVERY_ACTION_RESET;
 		break;
 	case XE_RAS_MEMORY_POISON:
 		xe_info(xe, "[RAS]: Poison error detected\n");
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 227493c6ed35..3312c9b42fe7 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -36,6 +36,40 @@ enum xe_ras_recovery_action {
 	XE_RAS_RECOVERY_ACTION_MAX
 };
 
+/**
+ * enum xe_ras_page_action - Page offline actions for page offline request
+ *
+ * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to remove page from queue
+ * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to mark page as not offline
+ * @XE_RAS_PAGE_ACTION_MAX: Max value for validation
+ */
+enum xe_ras_page_action {
+	XE_RAS_PAGE_ACTION_OFFLINE,
+	XE_RAS_PAGE_ACTION_DECLINE,
+	XE_RAS_PAGE_ACTION_MAX
+};
+
+/**
+ * enum xe_ras_response_status - RAS response status codes
+ *
+ * @XE_RAS_STATUS_SUCCESS: Operation successful
+ * @XE_RAS_STATUS_INVALID_PARAM: Invalid parameter
+ * @XE_RAS_STATUS_OP_NOT_SUPPORTED: Operation not supported
+ * @XE_RAS_STATUS_TIMEOUT: Operation timed out
+ * @XE_RAS_STATUS_HARDWARE_FAILURE: Hardware failure
+ * @XE_RAS_STATUS_INSUFFICIENT_RESOURCES: Insufficient resources
+ * @XE_RAS_STATUS_UNKNOWN_ERROR: Unknown error
+ */
+enum xe_ras_response_status {
+	XE_RAS_STATUS_SUCCESS = 0,
+	XE_RAS_STATUS_INVALID_PARAM,
+	XE_RAS_STATUS_OP_NOT_SUPPORTED,
+	XE_RAS_STATUS_TIMEOUT,
+	XE_RAS_STATUS_HARDWARE_FAILURE,
+	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
+	XE_RAS_STATUS_UNKNOWN_ERROR
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -239,4 +273,28 @@ struct xe_ras_page_offline_queue {
 	/** @reserved: Reserved for future use */
 	u8 reserved[3];
 } __packed;
+
+/**
+ * struct xe_ras_page_offline_request - Request for page offline command
+ *
+ * This structure provides the request format to offline/decline a page
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
+	/** @status: Status of the page offline request, see &enum xe_ras_response_status */
+	u32 status;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index c9fbdfea1ffb..f6cbb349c416 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -24,12 +24,14 @@ enum xe_sysctrl_group {
  *
  * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
  * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
  * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
 	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
 	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 };
-- 
2.47.1

