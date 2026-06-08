Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EF4CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B22210EF83;
	Mon,  8 Jun 2026 08:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXV8c0cE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FAC10EF7F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908485; x=1812444485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTh/OQR57DSRypp+lhHBhicsKqAcldaHgoZ7a9x1PbQ=;
 b=dXV8c0cEJgJrxbcT+3lYYgcPkFYbfeKDkFXlpFGqKCyGhh0MUSWoFzQG
 /bxK0lidI8BJAfp+fgb3B7M3zdB+nqA5AIJoGBy9f06jkOny4YHk0o3ou
 VshpBqLmfDlvOrxQCtC4haxmmpxteS3Kxl9itVMCBOjpBpOgVfrIq46fS
 +jK62BDGDFOFXmtNKDLRpnkz51RTlX5J/oe/U46SBfK3fczbBG7oxZL18
 56+1c9ERL+toe2PeRzjD4OYhysyZR1Jj1BUbgOIkMRn+z5TnyoZq+yBtn
 PD/k7kyj+kpZMBX91ZbJzl3RuTV5hsHVOj9B0uHar3wpoL7JmaHkGX4jf g==;
X-CSE-ConnectionGUID: 5wB2hYzHTEebRb+V6HczzQ==
X-CSE-MsgGUID: RbhVk6b6QWmuHmPLeezACQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029123"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:05 -0700
X-CSE-ConnectionGUID: YwhFSuPmR1mJkO+M6eGrfw==
X-CSE-MsgGUID: gBdk5ubRQtC22idW7rsr6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466147"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 13/15] drm/xe/xe_ras: Add support to query page offline
 queue and list
Date: Mon,  8 Jun 2026 14:17:14 +0530
Message-ID: <20260608084700.640376-30-riana.tauro@intel.com>
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

Add support to query page offline list and queue from firmware
during module load. The page offline list command retrieves pages that
are already offlined by the firmware. The page offline queue command
retrieves the pages pending to be offlined by the firmware.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: fix commit message
    fix log (Tejas)

v3: move sysctrl prepare command to sysctrl layer (Raag)

v4: break if pages are 0 (Tejas)

v5: add request structure for page offline list
---
 drivers/gpu/drm/xe/xe_ras.c                   | 95 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 44 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 495478f10cb8..58609733a933 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -161,6 +161,98 @@ static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static void get_queued_pages(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_page_offline_queue response = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret;
+
+	/* Supported only on platforms with system controller */
+	if (!xe->info.has_sysctrl)
+		return;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
+				  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
+				  sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "sysctrl: failed to get page offline queue %d\n", ret);
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "sysctrl: unexpected page offline queue response length %zu (expected %zu)\n",
+			       rlen, sizeof(response));
+			return;
+		}
+
+		/* TODO: Process pages and offline them */
+
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+
+		if (count > response.total_pages) {
+			xe_err(xe, "sysctrl: Pages returned from queue exceed total pages %u, returned %u\n",
+			       response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
+static void get_offlined_list(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_offline_list_response response = {0};
+	struct xe_ras_offline_list_request request = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret;
+
+	/* Supported only on platforms with system controller */
+	if (!xe->info.has_sysctrl)
+		return;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
+				  &request, sizeof(request), &response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		request.index = count;
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "sysctrl: failed to get page offline list %d\n", ret);
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "sysctrl: unexpected page offline list response length %zu (expected %zu)\n",
+			       rlen, sizeof(response));
+			return;
+		}
+
+		/* TODO: Process pages and offline them */
+
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+
+		if (count > response.total_pages) {
+			xe_err(xe, "sysctrl: Pages returned from list exceed total pages %u, returned %u\n",
+			       response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -360,6 +452,9 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		aer_unmask_and_downgrade_internal_error(xe);
 
+	get_queued_pages(xe);
+	get_offlined_list(xe);
+
 	/*
 	 * During probe, process and log any errors detected by firmware while the driver was not
 	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index cbd871c09b6a..227493c6ed35 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -16,6 +16,8 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+#define XE_RAS_NUM_PAGES			25
+
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
  *
@@ -195,4 +197,46 @@ struct xe_ras_memory_error {
 	/** @reserved1: Reserved */
 	u32 reserved1[10];
 } __packed;
+
+/**
+ * struct xe_ras_offline_list_request - Request for get offline list command
+ */
+struct xe_ras_offline_list_request {
+	/** @index: Zero-based index into the offline page list */
+	u32 index;
+} __packed;
+
+/**
+ * struct xe_ras_offline_list_response - Response from get offline list command
+ */
+struct xe_ras_offline_list_response {
+	/** @max_entries: Total no of pages that can be stored in flash */
+	u32 max_entries;
+	/** @total_pages: Total number of permanently offlined pages */
+	u32 total_pages;
+	/** @pages_returned: Number of pages returned in this response */
+	u32 pages_returned;
+	/** @page_addresses: Array of permanently offlined page addresses (4KB aligned) */
+	u64 page_addresses[XE_RAS_NUM_PAGES];
+	/** @additional_data: Indicates if more data is available */
+	u8 additional_data;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_page_offline_queue - Response from get offline queue command
+ */
+struct xe_ras_page_offline_queue {
+	/** @total_pages: Total number of queued pages */
+	u32 total_pages;
+	/** @pages_returned: Number of pages returned in this response */
+	u32 pages_returned;
+	/** @page_addresses: Array of page addresses (4KB aligned) */
+	u64 page_addresses[XE_RAS_NUM_PAGES];
+	/** @additional_data: Indicates if more data is available */
+	u8 additional_data;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 93ff0d481d74..c9fbdfea1ffb 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -24,10 +24,14 @@ enum xe_sysctrl_group {
  *
  * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
+	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 };
 
 /**
-- 
2.47.1

