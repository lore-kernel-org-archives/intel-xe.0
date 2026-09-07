Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25898C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1C610E38E;
	Mon,  7 Sep 2026 09:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZB53DXI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967810E38E
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774460; x=1820310460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+XHHniZpqFW7l4FlGn7UeTzTKK5K5xkspahcX9u94Y=;
 b=ZB53DXI3rQYD3a+1EUogrpai/tk0UyNOctda8lkdVNQxz1TTVxykSPVO
 Pz5v48rXbGu8iBAzaOhExYlCDCIS/v69hl+ZQBvWyjNvmf0pIwAcMgLhd
 Ny/PZaavOsMcU6AzUdEqtcZwGeFO2Ou+4ks8iJZuG2OowEk9YKq0O2Z+K
 6HNLF0BIyMS+0NgbGmVNKcHGJlxhhMiYJAJKzjXSjWIhf4upmC918qsjt
 6geQZaX1JcYE7ukuprpI1YL2GEf9GLYItE0+lAd0riFMiioi532XE4zus
 ryBv9zjc9T/QZ52NwgEVwvF7J2zbyPv7c5ofAGliDNwLmFeIjOWMUOhPs g==;
X-CSE-ConnectionGUID: 2DJuawveSqWgO/P0WMPNQA==
X-CSE-MsgGUID: iRki6aMHTY6qTdgZB1n88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100532027"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100532027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:40 -0700
X-CSE-ConnectionGUID: /LsUnTl2QpGXAdJPiRvnBg==
X-CSE-MsgGUID: XdwQZn27Qp+/jd9O+OkLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274175751"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 1/6] drm/xe/xe_ras: Handle page offline requests for device
 memory ecc errors
Date: Mon,  7 Sep 2026 15:17:07 +0530
Message-ID: <20260907094706.1407436-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260907094706.1407436-8-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
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
v2: use ret in sigid logging (Mallesh)
    remove additional log
    use xe_assert (Michal)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 118 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             |  35 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 150 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7a85735c57d5..94ffd0852938 100644
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
@@ -201,6 +204,110 @@ static inline const char *comp_to_str(u8 component)
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
+	ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
+
+	/*
+	 * Handle return code from address fault handling function:
+	 *  0: Page soft offlined, decline to firmware
+	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
+	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
+	 * -EEXIST: Address is soft offlined but yet to be offlined by firmware for second
+	 * occurrence
+	 */
+
+	switch (ret) {
+	case 0:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Poison detected at physical address 0x%llx, page software offlined\n",
+			   page_address);
+		break;
+	/* User policy set to decline page offlining */
+	case -EOPNOTSUPP:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "User policy set to decline page offlining for physical address 0x%llx\n",
+			   page_address);
+		break;
+	case -EIO:
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
+		return ret;
+	case -EEXIST:
+		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		xe_log_err(xe, DEVICE_MEMORY, ret,
+			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
+			   page_address);
+		break;
+	default:
+		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
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
@@ -368,11 +475,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
@@ -384,10 +492,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
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
index fe6f3658a2a4..20c74593ce05 100644
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
index 66e7cbcc3f91..590dd408399c 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -28,6 +28,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
  * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -38,6 +39,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_THRESHOLD		= 0x05,
 	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
-- 
2.47.1

