Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93C0CD5BC8
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762FF10E0FF;
	Mon, 25 May 2026 09:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyhddOFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9606D10E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701621; x=1811237621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=18hK/aWnbWgtVy7LOAB/Ts9TBnCi53ydxPsvn3Ea56w=;
 b=hyhddOFD1nXOGa7X0jA2wVtfQvy8y8/R4olNhnzBHax2DKk2hxtxSEHG
 YgQh8QOWvS8fvbbQ11Cws6WV9/nai6jUDj0x4g77lViz1JxzHBItS3pYV
 OTQWpi6hhJaWm5ju7RqblGyiq18IR6f6rRdFExPxfEgYLLzkf8PlNBRfA
 3EI9ygaxEsDpDITzPlrGm6yf/Sf/fJ/4ZARaHRyynbyMPVgjUSpkqkpFX
 Zdu1XTzd9vVQVvgNtI0TFhWoCcuMiXypKN68bMAakfovUrklSjtU/ds4W
 RlkgWNQepNork9qSGEqlwSTv7LwYqfDTztlnhZg9IBVekcilUGpfJOD3i Q==;
X-CSE-ConnectionGUID: r2cYlNM8Tv2YXK3cXKBA7g==
X-CSE-MsgGUID: jTr0knHbSKqDbg5IJzukPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046843"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:41 -0700
X-CSE-ConnectionGUID: l8whgb+yThqCPddWIOQPGg==
X-CSE-MsgGUID: 40piaZJoQCKXsbmvA9lk4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669703"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:38 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page offline
 queue and list
Date: Mon, 25 May 2026 15:36:30 +0530
Message-ID: <20260525100619.3155663-28-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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

v3: move sysctrl prepare command to sysctrl layer (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index fb6da3d06b9a..1710c6080554 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -146,6 +146,88 @@ static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device
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
+	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
+				 NULL, 0, &response, sizeof(response));
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
+	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
+				 NULL, 0, &response, sizeof(response));
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
@@ -341,4 +423,7 @@ void xe_ras_init(struct xe_device *xe)
 #ifdef CONFIG_PCIEAER
 	aer_unmask_and_downgrade_internal_error(xe);
 #endif
+
+	get_queued_pages(xe);
+	get_offlined_list(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 8c2d13152b32..fada9802667e 100644
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
 	/** @reserved1: Reserved */
 	u32 reserved1[10];
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

