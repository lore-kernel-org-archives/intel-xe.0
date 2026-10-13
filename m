Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF493CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 06:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C9010F4A2;
	Tue, 13 Oct 2026 06:00:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574210F48E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791871225; x=1823407225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78Y/juoXd/Dorny7SIT8/qQs7/GXmR/+dCzdAZ0iN0w=;
 b=Nq9CE3FxnPheqbVhwaL5qAggER8X5zLKgVCoG86Jt8l9pL9pnxvwT8Il
 1YVLNlkyvsGW6eyYzWhfR4DQDdLexz1/QbSm6WJDY8aRJrcalwA1kDjRR
 IjsJ2zrGe1hX1i6tuXWzrpyfwsrSH+MA2Uo7kDQAK2s7CbVDWiXfK9Bkf
 qWyYlYDldzzV5ushzTN7Y+U4vBjbQ1NcfJl7V4uoAamDnKd19YGL6NoGy
 2LEiJ3Gpa4CKQdFOYS+BGJLK41KvhOoa2G/nNYi85q5c2MtARxUxG2GGS
 ykpWeldPUVMCEwzsU6Pa38FLUQOFez3vSyRm+aUgQrjaqqCPKumDkm57X A==;
X-CSE-ConnectionGUID: r0JcGfl7QHSGbQW905QmPA==
X-CSE-MsgGUID: wmwFbFxdSs26hVqHIgkXoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="591740"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="591740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:24 -0700
X-CSE-ConnectionGUID: /4zcu/y8Qf2xbuyeKyVN+g==
X-CSE-MsgGUID: 0mkMkw+CQOGxe+ZKX4e0Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="978726"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 3/6] drm/xe/xe_ras: Add support to query page offline queue
 and list
Date: Tue, 13 Oct 2026 11:30:02 +0530
Message-ID: <20261013055959.2569963-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261013055959.2569963-8-riana.tauro@intel.com>
References: <20261013055959.2569963-8-riana.tauro@intel.com>
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
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
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
index 28f950773844..0263fc3ccc07 100644
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
index 91b090cd2c7e..b6f4cfbadede 100644
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
index 01d944fa3e5e..1f3f782d770e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -33,6 +33,8 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a page
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -44,6 +46,8 @@ enum xe_sysctrl_gfsp_cmd {
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

