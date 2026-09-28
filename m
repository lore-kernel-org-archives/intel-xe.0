Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA54C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7CC10E79C;
	Mon, 28 Sep 2026 06:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAqfxLmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CC810E79C
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790576332; x=1822112332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T50DXtzj8ymVdW7JfDNUGyDAfHqdJ7iWZQe02zS4aXE=;
 b=SAqfxLmEdpVgv4sGcnFlb2cExEGPk9/dTQKPbqV8dRV0pNY+PE2SCHXL
 +GctPgTyzNkgQCefTIesl3Jb0PKU0wgiFjUbZyPCk/bSBsfR2DbwWGFCv
 RsQ8Xtxmerlr8pddtY+4nqg6fAPyFl3Kb/EYwGMNGjCPkXV+jDIySek/f
 YHypjmRyWoTcaFSnFAg5YFRTIbsJiJVj9BQusebfktfiP5WEplJMu3spd
 VE46/FKaASsoiNp4ZGKZaGb5hugFfTRj6N1+zsr8TO+bkKlmBOz/754g2
 r36rChB+wav3f0/abGolT0gLaX9oX+zpAOGScV2p5lespPvgJH6xi33WM Q==;
X-CSE-ConnectionGUID: IbGluiXwRQC4x5SQ975Mmw==
X-CSE-MsgGUID: dh2UOWe5QvOQlzyKONH0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100598610"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="100598610"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:18:52 -0700
X-CSE-ConnectionGUID: KyRUCQfiTeiuRHd6r4giZQ==
X-CSE-MsgGUID: KpGiH8ojSLabx4X10pQLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="302901196"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:18:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 1/6] drm/xe/xe_ras: Handle page offline requests for device
 memory ecc errors
Date: Mon, 28 Sep 2026 11:48:31 +0530
Message-ID: <20260928061830.417395-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260928061830.417395-8-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
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

Add basic support for sending page offline/remove requests to system
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
v2: use ret in sigid logging (Mallesh)
    remove additional log
    use xe_assert (Michal)

v3: align address to PAGE_SIZE (sashiko, Himal)
    rename decline to remove
    add more descriptive logs (Himal)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 127 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..1225c561a872 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
@@ -16,6 +18,7 @@
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
+#include "xe_ttm_vram_mgr.h"
 
 #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
 /*
@@ -201,6 +204,119 @@ static inline const char *comp_to_str(u8 component)
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
+	xe_assert(xe, action < XE_RAS_PAGE_ACTION_MAX);
+
+	request.page_address = page_address;
+	request.action = action;
+
+	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
+		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
+			   page_address);
+	else
+		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
+			   page_address);
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
+				  &request, sizeof(request), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
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
+	if (ret)
+		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
+			   response.status);
+
+	return ret;
+}
+
+static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
+{
+	enum xe_ras_page_action action;
+	u64 addr;
+	int ret = 0;
+
+	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
+		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
+			   page_address);
+		return -EINVAL;
+	}
+
+	addr = ALIGN_DOWN(page_address, PAGE_SIZE);
+
+	ret = xe_ttm_vram_handle_addr_fault(xe, addr);
+
+	/*
+	 * Handle return code from address fault handling function:
+	 *  0: Page softofflined, remove from firmware queue
+	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
+	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
+	 * -EEXIST: Address is soft offlined but yet to be offlined by firmware for second
+	 * occurrence
+	 */
+
+	switch (ret) {
+	case 0:
+		action = XE_RAS_PAGE_ACTION_REMOVE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
+			   page_address);
+		break;
+	/* User policy set to decline page offlining */
+	case -EOPNOTSUPP:
+		action = XE_RAS_PAGE_ACTION_REMOVE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Poison detected at physical address 0x%llx, user policy set to decline soft-offlining\n",
+			   page_address);
+		break;
+	case -EIO:
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
+			   page_address);
+		return ret;
+	case -EEXIST:
+		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
+			   page_address);
+		break;
+	default:
+		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
+			   page_address);
+		return 0;
+	}
+
+	if (send_cmd) {
+		ret = send_page_offline_cmd(xe, page_address, action);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
 {
 	u8 severity = counter->common.severity;
@@ -368,11 +484,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
@@ -384,10 +501,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
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
index fe6f3658a2a4..f119489bcdf2 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -17,6 +17,19 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+/**
+ * enum xe_ras_page_action - Page offline actions for page offline request
+ *
+ * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
+ * @XE_RAS_PAGE_ACTION_REMOVE: Instruct firmware to remove the page from queue
+ * @XE_RAS_PAGE_ACTION_MAX: Max value
+ */
+enum xe_ras_page_action {
+	XE_RAS_PAGE_ACTION_OFFLINE,
+	XE_RAS_PAGE_ACTION_REMOVE,
+	XE_RAS_PAGE_ACTION_MAX
+};
+
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
  *
@@ -295,6 +308,28 @@ struct xe_ras_memory_error {
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
index c236e5377f30..a01576bf2e73 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -30,6 +30,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
  * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a page
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -40,6 +41,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_THRESHOLD		= 0x05,
 	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
-- 
2.47.1

