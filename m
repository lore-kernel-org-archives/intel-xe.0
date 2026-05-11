Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A67CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530EC10E804;
	Mon, 11 May 2026 16:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXIXcgNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0A10E837
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518594; x=1810054594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SwdI7GnkvZvVi/zwg6eLKw0n3u6zXr70Up5KHQ/HEhQ=;
 b=jXIXcgNvkXMrRiB314sVtRdaccuZ8VJOJsTrkROcUI7AzHP4Wlk1zlIz
 MeTVENsMobf5jx6TuOB0m5tb2a0PI2fTTLs5HaJwReoXdvE4dQKewPgzd
 /DWXZsEs4dGM47APY/4Kny3Z3s9UHJo70T8gSbLGpVv3Ede2+OgcFu2Jy
 WdQfMPWfNUpeMJ7XqJBxpS+1N6TMjrfdEGcwms10zfrnIG5ATQFW46Q6o
 abu8tL4/ObLpp4TmoddwJlhcqfm4LbLb9MWLAPcJA3hdNYPnKQ6YP+qxF
 8qzZNcSYQQParTQ+k1ke+zkTaq6W0VsqFhyMgi5Jcyqim5/rNOfOahVht w==;
X-CSE-ConnectionGUID: s+2AS5g/SEyy+mibn2d06g==
X-CSE-MsgGUID: qvVJC5LAQIStz/LlZcDKsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513569"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:34 -0700
X-CSE-ConnectionGUID: 111KH9LVTO2VZNpPWDYglw==
X-CSE-MsgGUID: RPSmWa9tT+qGE/qZfMlh6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988779"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 10/14] drm/xe/xe_ras: Add support to query page offline
 queue and list
Date: Mon, 11 May 2026 22:59:17 +0530
Message-ID: <20260511172908.1122252-26-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
processing pages is done in a later patch.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: fix commit message
    fix log (Tejas)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 803f5fd204bd..a1ae7a3d9696 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -168,6 +168,88 @@ static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device
 	return XE_RAS_RECOVERY_ACTION_RESET;
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
+	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
+			    &response, sizeof(response));
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
+	struct xe_ras_page_offline_list response = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret;
+
+	/* Supported only on platforms with system controller */
+	if (!xe->info.has_sysctrl)
+		return;
+
+	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
+			    &response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
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
@@ -365,4 +447,7 @@ void xe_ras_init(struct xe_device *xe)
 #ifdef CONFIG_PCIEAER
 	aer_unmask_and_downgrade_internal_error(xe);
 #endif
+
+	get_queued_pages(xe);
+	get_offlined_list(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 5999e7b4af1c..640101c3a3c3 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,7 @@
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 #define XE_RAS_MEMORY_ECC			BIT(1)
+#define XE_RAS_NUM_PAGES			25
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -192,4 +193,38 @@ struct xe_ras_memory_error {
 	/** @reserved2: Reserved for future use */
 	u32 reserved2[10];
 } __packed;
+
+/**
+ * struct xe_ras_page_offline_list - Response from get offline list command
+ */
+struct xe_ras_page_offline_list {
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
index 5ccfc6325a90..b7a5e82c6eb0 100644
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

