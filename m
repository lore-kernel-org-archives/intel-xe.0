Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311CCF8DFCE
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA1610E99B;
	Fri, 17 Apr 2026 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2eomNxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F2F10E997
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414377; x=1807950377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3y0VV6v6adzeZWbhzzp0/jISAk8WPHwoWcxq4OmFyIY=;
 b=J2eomNxmUI6VxNEjws/C3S3H48itcldA7b2ce0vSJ6TqIKzitAxzSFcy
 l3jJ9EoEv27iVuB41lzneEqHPMrsgvcERDjBKMMICHto6SbJT90AKdoAg
 ku2vseYgVE6OHclsKoAxyB9MMDgdnI3kKtyhKkee1Z8DdyVMCRvACxoIq
 XgNvDWhNj6ZmdPXa3oKAu5KamL6StFJn0My04IIVtVKF6qonBHoJ5sIh1
 pHbEqRl0PJPocEypBTrtLgbusBbJZK/wPqvjW31e64ILFJIjwXqOaqimM
 vK3v07Jm4aeasOaYbkH7wTbcdLL7JdF4iJ2MvADDnMwQPvulf2daB6RUU w==;
X-CSE-ConnectionGUID: r4nbZvbITsWZ17dvIaKuYw==
X-CSE-MsgGUID: 3+aNIN75QnGM5erO53zzZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045914"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:15 -0700
X-CSE-ConnectionGUID: dWxFaCmySCi0d8q9jj39iQ==
X-CSE-MsgGUID: H4VCJO8qT5y3Gs+IFlQWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962306"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list and
 queue commands
Date: Fri, 17 Apr 2026 14:28:23 +0530
Message-ID: <20260417085812.4013309-26-riana.tauro@intel.com>
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

Add handling for page offline list and queue sysctrl commands. The page
offline list command retrieves pages that are already offlined by the
firmware. The page offline queue command retrieves the pages pending to be
offlined by the firmware.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 39 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  6 +-
 3 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index cd1ac6441b92..42ec27c05e9a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -319,6 +319,87 @@ int xe_ras_page_offline(struct xe_device *xe, enum xe_ras_page_action action, u6
 	return 0;
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
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
+				&response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected %zu, got %zu\n",
+			       sizeof(response), rlen);
+			return;
+		}
+
+		/* TODO: Process pages and offline them */
+
+		count += response.pages_returned;
+		if (count > response.total_pages) {
+			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total pages %u, returned %u\n",
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
+	int ret, count = 0;
+	size_t rlen;
+
+	/* Supported only on platforms with system controller */
+	if (!xe->info.has_sysctrl)
+		return;
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
+				&response, sizeof(response));
+
+	do {
+		memset(&response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+		if (ret) {
+			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected %zu, got %zu\n",
+			       sizeof(response), rlen);
+			return;
+		}
+
+		/* TODO: Process pages and offline them */
+
+		count += response.pages_returned;
+		if (count > response.total_pages) {
+			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total pages %u, returned %u\n",
+			       response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
@@ -394,4 +475,8 @@ void xe_ras_init(struct xe_device *xe)
 #ifdef CONFIG_PCIEAER
 	aer_unmask_and_downgrade_internal_error(xe);
 #endif
+
+	/* Get any pages that need to be offlined from firmware and reserve them */
+	get_offlined_list(xe);
+	get_queued_pages(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index d76310866da5..1a5de6cd16a1 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_ERROR_ARR		3
 #define XE_RAS_MAX_ERROR_DETAILS	16
+#define XE_RAS_NUM_PAGES		25
 #define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
 
 /**
@@ -297,4 +298,42 @@ struct xe_ras_page_offline_response {
 	/** @reserved: Reserved for future use */
 	u32 reserved;
 } __packed;
+
+/**
+ * struct xe_ras_page_offline_list - Response from get offline list command
+ *
+ * This structure provides the details of offlined pages from flash.
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
+ *
+ * This structure provides the details of queued offlined pages from firmware.
+ */
+struct xe_ras_page_offline_queue {
+	/** @total_pages: Total number of queued pages */
+	u32 total_pages;
+	/** @pages_returned: Number of pages returned in this response */
+	u32 pages_returned;
+	/** @page_addresses: Array of offlined page addresses (4KB aligned) */
+	u64 page_addresses[XE_RAS_NUM_PAGES];
+	/** @additional_data: Indicates if more data is available */
+	u8 additional_data;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 2cafa8a14cc3..b6139ac0eaca 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -15,10 +15,14 @@
  *
  * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
  * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Get list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Get list of offlined queued pages from firmware
  */
 enum xe_sysctrl_mailbox_command_id {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
-	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08
+	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
+	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
+	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A
 };
 
 enum xe_sysctrl_group {
-- 
2.47.1

