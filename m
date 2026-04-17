Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B970F8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465410E991;
	Fri, 17 Apr 2026 08:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW8wGzuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A6010E997
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414372; x=1807950372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FN/GffF0/Jw9cZ3xZ+tHrvpCYR8fnJkNrqlxjIiyoO0=;
 b=cW8wGzuvEOgRP9G1LdQRcq81sFaDW+5Ztx2zszloRkeZi8VpP91I4pNZ
 5llvS8UysPo2bDB4KHDz3xsPKi+p8TxNylemU3SrhaqRE0ruVfrN9M/pj
 BGi1aRcIZ6lSRrGXmsh0qhahZuOxVnQVkSsnXAvNluYjAn8F7Biv8dkUe
 fGTqhz6S/CFVWjTKu7Q44p2T3w+RooqhPzWjNIrtnuCogXlo/HkaK4LIZ
 BTa0gQLpKzJV4zDQKog7RRHg/kncnxzUFj28dYCj4qg9hPxTPT5MqgFE0
 7BBWzshBs7J9lr6h4EfPv0Ngxj3J6BorUNhjFHe/IOrFAMJPGXZBUR6AT A==;
X-CSE-ConnectionGUID: W0bQ+aTOQqOzJm+PPGCE2Q==
X-CSE-MsgGUID: yfqhWZ3HRACRaksA+Kg4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045908"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:11 -0700
X-CSE-ConnectionGUID: +HGoTgUyT4CYMTdN78sCPQ==
X-CSE-MsgGUID: cD61MzNnT0G4ppMyGovDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962296"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 10/13] drm/xe/xe_ras: Add support to offline/decline a page
Date: Fri, 17 Apr 2026 14:28:22 +0530
Message-ID: <20260417085812.4013309-25-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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

Add a helper function that sends commands to system controller
to offline/decline a page based on user policy.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 51 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  2 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 37 ++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 347844b3d2bf..cd1ac6441b92 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -268,6 +268,57 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+/**
+ * xe_ras_page_offline() - Send page offline/decline request to system controller
+ * @xe: xe device instance
+ * @action: Action to be performed (offline/decline)
+ * @page_address: address of the page
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action action, u64 page_address)
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
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_PAGE_OFFLINE, &request,
+				sizeof(request), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected %zu, got %zu\n",
+		       sizeof(response), rlen);
+		return -EINVAL;
+	}
+
+	if (response.status) {
+		xe_err(xe, "[RAS]: sysctrl: Page offline command failed with status %u\n",
+		       response.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index e191ab80080c..ec59258eb3df 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -12,5 +12,7 @@ struct xe_device;
 
 void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);
+int xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action action,
+			u64 page_address);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 020e3f92a057..d76310866da5 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -30,6 +30,19 @@ enum xe_ras_recovery_action {
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
 /**
  * struct xe_ras_error_common - Common RAS error class
  *
@@ -260,4 +273,28 @@ struct xe_ras_memory_error {
 	/** @reserved2: Reserved for future use */
 	u32 reserved2[2];
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
+	/** @action: Action to be performed (enum xe_ras_page_action) */
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
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 00a0f05aab32..2cafa8a14cc3 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -14,9 +14,11 @@
  * enum xe_sysctrl_mailbox_command_id - Command ID's for GFSP group
  *
  * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
  */
 enum xe_sysctrl_mailbox_command_id {
-	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01
+	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08
 };
 
 enum xe_sysctrl_group {
-- 
2.47.1

