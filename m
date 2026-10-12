Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C982CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC0210E42B;
	Mon, 12 Oct 2026 05:41:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D598110E42B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791783692; x=1823319692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8x7duWE6qUzkFfItzfU9py3uG4IR6m9CmShwXKIL4NA=;
 b=QNEqWx3PQJcDP4POhGyyLdkFsYsclmn0CJkDOPCWfvi3H9+E1ceh6cZk
 FfjhMguOF+eza/9qc47/wvlBxJ60NjGP8opyWYc+tT/FjiRRTLxjj/ir/
 xaSvkh/Cznkjr62T4ExOqE9NdOqe8DJGZqYX5F+z714KlQ2BPiZCXXm6B
 amu9TMjDDFJ60+h2bg0dYis62lSiVFoFjQZ0ew1lmkClxp5tzvzDscvSx
 J7JBwucQV94jPfzdH/l+gDRN5OWx87I2ZDkmDF8uU0rIYKOtounUOMb33
 Vhm6A3tZ0qlH/HXh0OwMHamsc/VmUe59+if9gwPqaRkbLUpCjQPxyNMSR A==;
X-CSE-ConnectionGUID: SDwswXjnRoyImTgY9hAxtg==
X-CSE-MsgGUID: GrwAJEX3TEq8Seg8W7k3lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="367843"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="367843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:32 -0700
X-CSE-ConnectionGUID: XJB8HyRrSNaJiyb+D76l9g==
X-CSE-MsgGUID: 2P/165R1RzuqTWqw/WCWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="787147"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:41:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
Date: Mon, 12 Oct 2026 11:11:02 +0530
Message-ID: <20261012054056.2272869-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261012054056.2272869-8-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
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

A memory scrubber can report multiple errors at the same address. Track
pages already successfully offlined by the firmware so that subsequent
reports for the same address are removed from the firmware queue instead
of issuing redundant page offline requests.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v2: use xe page shift (Sashiko)

v3: handle ret
    re-order list and queue (Himal)

v4: handle xa_err (Tejas)
---
 drivers/gpu/drm/xe/xe_device.c    |  4 ++-
 drivers/gpu/drm/xe/xe_ras.c       | 51 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ras.h       |  2 +-
 drivers/gpu/drm/xe/xe_ras_types.h |  3 ++
 4 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c4..643846721d1e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -974,7 +974,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_ras_init(xe);
+	err = xe_ras_init(xe);
+	if (err)
+		return err;
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 389789c95a6f..8dab634505aa 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -20,6 +20,9 @@
 #include "xe_sysctrl_mailbox_types.h"
 #include "xe_ttm_vram_mgr.h"
 
+/* Any non-null entry marks the page as offlined by firmware */
+#define XE_RAS_PAGE_OFFLINED		xa_mk_value(1)
+
 #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
 /*
  * Uncorrectable error type for core compute errors.
@@ -210,6 +213,7 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_page_offline_request request = {0};
 	struct xe_ras_page_offline_response response = {0};
+	struct xe_ras_state *state = &xe->ras.state;
 	size_t rlen;
 	int ret;
 
@@ -251,11 +255,21 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 		return ret;
 	}
 
+	if (action == XE_RAS_PAGE_ACTION_OFFLINE) {
+		ret = xa_err(xa_store(&state->offlined_pages,
+				      page_address >> XE_PTE_SHIFT,
+				      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
+		if (ret)
+			xe_err(xe, "Failed to store offlined page 0x%llx: %d\n", page_address,
+			       ret);
+	}
+
 	return 0;
 }
 
 static int handle_page_offline(struct xe_device *xe, u64 page_address, bool notify_fw)
 {
+	struct xe_ras_state *state = &xe->ras.state;
 	enum xe_ras_page_action action;
 	u64 addr;
 	int ret;
@@ -299,7 +313,11 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 			   page_address);
 		return ret;
 	case -EEXIST:
-		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
+			action = XE_RAS_PAGE_ACTION_REMOVE;
+		else
+			action = XE_RAS_PAGE_ACTION_OFFLINE;
+
 		xe_log_err(xe, DEVICE_MEMORY, ret,
 			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
 			   page_address);
@@ -354,6 +372,7 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_offline_list_request *list_req;
 	struct xe_ras_state *state = &xe->ras.state;
+	unsigned long index;
 	u32 total_pages = 0, count = 0;
 	size_t rlen;
 	int ret, i;
@@ -388,8 +407,18 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
 			state->max_pages =
 				((struct xe_ras_offline_list_response *)resp)->max_entries;
 
-		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
+		for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++) {
 			handle_page_offline(xe, common->page_addresses[i], notify_fw);
+			/* The pages are already offlined by firmware */
+			if (!notify_fw) {
+				index = common->page_addresses[i] >> XE_PTE_SHIFT;
+				ret = xa_err(xa_store(&state->offlined_pages, index,
+						      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
+				if (ret)
+					xe_err(xe, "Failed to store offlined page 0x%llx: %d\n",
+					       common->page_addresses[i], ret);
+			}
+		}
 
 		count += common->pages_returned;
 		if (!common->pages_returned)
@@ -1120,6 +1149,13 @@ static const struct attribute_group gpu_health_group = {
 	.attrs = gpu_health_attrs,
 };
 
+static void ras_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xa_destroy(&xe->ras.state.offlined_pages);
+}
+
 /**
  * xe_ras_get_vram_page_offline - Get the vram page offline user policy
  * @xe: xe device instance
@@ -1147,15 +1183,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
  * @xe: xe device instance
  *
  * Initialize Xe RAS
+ *
+ * Return: 0 on success, negative error code otherwise
  */
-void xe_ras_init(struct xe_device *xe)
+int xe_ras_init(struct xe_device *xe)
 {
+	struct xe_ras_state *state = &xe->ras.state;
 	int ret;
 
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
-		return;
+		return 0;
 
 	/*
 	 * TODO: Replace with xe->info.has_disable_vram_page_offline once the feature flag is
@@ -1167,6 +1206,8 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	xa_init(&state->offlined_pages);
+
 	/* Fetch the offline list before queue to avoid duplication */
 	get_offline_list(xe);
 	get_offline_queue(xe);
@@ -1174,4 +1215,6 @@ void xe_ras_init(struct xe_device *xe)
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
+
+	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 268c2afa10b6..1b358c7d040f 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *threshold);
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
-void xe_ras_init(struct xe_device *xe);
+int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 1283c83510b2..a86f9d2b8c92 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
@@ -417,5 +418,7 @@ struct xe_ras_state {
 	bool disable_vram_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
 	u32 max_pages;
+	/** @offlined_pages: XArray of pages offlined by firmware */
+	struct xarray offlined_pages;
 };
 #endif
-- 
2.47.1

