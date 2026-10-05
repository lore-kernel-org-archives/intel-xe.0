Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4429CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5728E10EC2E;
	Mon,  5 Oct 2026 09:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5bl/jsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66B110EC22
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190940; x=1822726940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imy6DzB2CdBN337ECQM/MG1axFJ/S7+JEImdMgUw2O0=;
 b=X5bl/jsb13PjW8lDp87lybZC9ep7IYtWdY0pa5XyeH2LFRZkV+DYVncd
 x5jrYK2IoX2J963qNB67xFnNOb7a0hM84SnfpcRi98uTnytzgWoE5XMo6
 PxGs2p9BjtLEpFVqQLUMRFss5axckZzGI13o14VhzVFCwZvW/fo//Ijr8
 eke/3ucnbp9W3fs5Tv+myfasFW5/M6P1AL89puoHVmJpe9CbFBrejK2s9
 WbdX/XBlbMFiRXZyH5cG8XCTLr0eYnv0Kregbx0XNCj7M1FjU0uzhcUXp
 GPUvMgDSCrkSV06v6IWzX6wmZFzyzO7StxhfADWujoit5Bvi6C/Q2c4I8 Q==;
X-CSE-ConnectionGUID: Cu3Cj0qTQverDPjEQCuGYg==
X-CSE-MsgGUID: BpqwoLblTaax3uZsvUmVtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109346375"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109346375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:20 -0700
X-CSE-ConnectionGUID: QqfIAl0cTKi7UU+27KL/wg==
X-CSE-MsgGUID: kNi6sVNKSi2qxXZ9frWnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280050153"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:02:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 3/6] drm/xe/xe_ras: Add support to query page offline queue
 and list
Date: Mon,  5 Oct 2026 14:31:59 +0530
Message-ID: <20261005090156.1233748-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261005090156.1233748-8-riana.tauro@intel.com>
References: <20261005090156.1233748-8-riana.tauro@intel.com>
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
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: rebase
    store total pages once per response (Sashiko)

v3: common function for offline and queue (Himal)

v4: re-order list and queue (Sashiko, Himal)
    remove type
	use size_t
	add description and rename functions (Tejas)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 87 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2ec310c29489..14fc3227483c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -343,6 +343,89 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
 	return true;
 }
 
+/*
+ * Fetch and process offline list and queue from firmware via mailbox. @notify_fw controls
+ * whether firmware is notified of the offline/remove action.
+ */
+static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size_t req_size,
+				  void *resp, size_t resp_size,
+				  struct xe_ras_offline_common *common, bool notify_fw)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_offline_list_request *list_req;
+	u32 total_pages = 0, count = 0;
+	size_t rlen;
+	int ret, i;
+
+	list_req = req;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, cmd, req, req_size, resp,
+				  resp_size);
+
+	do {
+		memset(resp, 0, resp_size);
+
+		if (list_req)
+			list_req->index = count;
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
+				   cmd);
+			return;
+		}
+
+		if (rlen != resp_size) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
+				   rlen, resp_size, cmd);
+			return;
+		}
+
+		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, common->page_addresses[i], notify_fw);
+
+		count += common->pages_returned;
+		if (!common->pages_returned)
+			break;
+
+		if (!total_pages)
+			total_pages = common->total_pages;
+
+		if (count > total_pages) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
+				   total_pages, count, cmd);
+			return;
+		}
+	} while (common->additional_data);
+}
+
+/*
+ * Retrieve firmware queued pages from warm-retained SRAM during probe. Handle and soft-offline
+ * each page as required.
+ */
+static void get_offline_queue(struct xe_device *xe)
+{
+	struct xe_ras_offline_common response = {0};
+
+	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
+			      sizeof(response), &response, true);
+}
+
+/*
+ * Retrieve permanently offlined pages from firmware's non-volatile storage during probe,
+ * allowing the driver to soft-offline them before kernel allocations begin.
+ */
+static void get_offline_list(struct xe_device *xe)
+{
+	struct xe_ras_offline_list_response response = {0};
+	struct xe_ras_offline_list_request request = {0};
+
+	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
+			      &response, sizeof(response), &response.common, false);
+}
+
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
@@ -1067,6 +1150,10 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	/* Fetch the offline list before queue to avoid duplication */
+	get_offline_list(xe);
+	get_offline_queue(xe);
+
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 1495a8636255..40224db38906 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
+#define XE_RAS_NUM_PAGES			25
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 /* Device memory error categories */
@@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
 	u32 reserved;
 } __packed;
 
+/**
+ * struct xe_ras_offline_common - Common structure for offline list and queue
+ */
+struct xe_ras_offline_common {
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
+	/** @common: Common offline page information */
+	struct xe_ras_offline_common common;
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 60d17ccc002c..e1bb64856f43 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -31,6 +31,8 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a page
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
+	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
+	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
-- 
2.47.1

