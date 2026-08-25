Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93363C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5101510E8F3;
	Tue, 25 Aug 2026 06:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muuh4RHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712510E8F3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639811; x=1819175811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kStCyIQWlTGa8bJjWMklaZbqgY2fd/gwg3ryzZSEqbw=;
 b=muuh4RHcDNGSW/W/cZb/V6/7TgBeuSW6qD0dyjjz3Liq0H0h+mrybjFu
 YFnDOPCFg1C7mPBZm+2qE1a2KHZrnV8mUS66yLyZ/JZZrKD4OCdAKgq+h
 zmICYkgZpyHOr2jOb7rKgSbpBkVCNDIPh97NA4xuU30/gH2Rs6Nvpj0lT
 WiJ3Oad3ejAhsIr6yxAsGObvYkgC7uWrNeCfHZegDgh/n2FNSPTQ/rS8D
 1jNJP92eCGij9VyBSViEJDvjZZ2cFem7CRyTPp2MfVlG6ZN4i3zMcfhqT
 y1EZSVwzlo+oprAQCBZz9DAgb6D6+lkQWqIx8DW17S2zmHFvxgAMJGGOr w==;
X-CSE-ConnectionGUID: cpwLi8vTRaOBa2wey3z4ew==
X-CSE-MsgGUID: k0iL0C9uS+SJzfsCsojv9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226101"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:51 -0700
X-CSE-ConnectionGUID: BTiDlHquQMqDlugjOHsTSQ==
X-CSE-MsgGUID: jwTa/toGQGWlvZhgVAdzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265428987"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/5] drm/xe/xe_ras: Add support to query page offline queue
 and list
Date: Tue, 25 Aug 2026 12:06:18 +0530
Message-ID: <20260825063615.3697317-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825063615.3697317-7-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c                   | 99 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 43 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c643c7137a42..441462a36dbc 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -328,6 +328,102 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
 	return true;
 }
 
+static void get_queued_pages(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_page_offline_queue response = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret, i;
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
+			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline queue\n");
+			return;
+		}
+		if (rlen != sizeof(response)) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "unexpected page offline queue response length %zu (expected %zu)\n",
+				   rlen, sizeof(response));
+			return;
+		}
+
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);
+
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+
+		if (count > response.total_pages) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "Pages returned from queue exceed total pages %u, returned %u\n",
+				   response.total_pages, count);
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
+	int ret, i;
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
+		request.index = count;
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline list\n");
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "unexpected page offline list response length %zu (expected %zu)\n",
+				   rlen, sizeof(response));
+			return;
+		}
+
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
+
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+
+		if (count > response.total_pages) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "Pages returned from list exceed total pages %u, returned %u\n",
+				   response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
@@ -923,6 +1019,9 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	get_queued_pages(xe);
+	get_offlined_list(xe);
+
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 2fac968879b6..cddcfa656d9f 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
+#define XE_RAS_NUM_PAGES			25
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 /* Device memory error categories */
@@ -280,6 +281,48 @@ struct xe_ras_page_offline_response {
 	u32 reserved;
 } __packed;
 
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
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 3363f48da2b7..194ad3ac3da2 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -27,6 +27,8 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -36,6 +38,8 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
+	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
+	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
-- 
2.47.1

