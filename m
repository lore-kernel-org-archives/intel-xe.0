Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C94DCC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 06:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91C10F48E;
	Tue, 13 Oct 2026 06:00:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9EB10F48E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 06:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791871235; x=1823407235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TGCuHbYt8ZrwIErT3WG0hC283gphulYXYsRDhrbjLE=;
 b=FE7us/5UxJMlQy5cGijKTksT5mXwXVKloimEptXv3iMGxlZVBoRQhqtK
 PPdYD2nvOwN1V6ZaLHcl/bfjZZbZ627fhngLHn2/l6cEw1SaHZFXck4GG
 lO2MotHs2eFMZr5wArtpJm4qJmKF/8Xl/MXFEKYSX2Ww34mhJiEn5mcxP
 e5Z+UGLcFr8ZH94LbGbOECm7c1sdTNyUU42dhW5+9PHsPd2HdFdvNFG/G
 RtXRHVSxfNOU4trH+KwgpViDxSsdt5I7seTUfRkn3vQ4ErUJN3Bu/Vgqe
 BR0asWHwt/HPbGKDQHOj2TQAlOQArioVhXZ0szyTmPPBiokN+WW2/yuj3 Q==;
X-CSE-ConnectionGUID: pgW88e77SDaZMjQYowea8w==
X-CSE-MsgGUID: lLMgGoh0TuC2dbaA1grsJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="591778"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="591778"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:35 -0700
X-CSE-ConnectionGUID: yUEHdE33TD6qJ17uIk+cEg==
X-CSE-MsgGUID: xhLOK41JTQ6ixmIi4ROJiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="978841"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:31 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
Date: Tue, 13 Oct 2026 11:30:05 +0530
Message-ID: <20261013055959.2569963-14-riana.tauro@intel.com>
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
index d166df04f944..9c15ce8f0b6a 100644
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
  * xe_ras_get_disable_vram_page_offline - Get the vram page offline user policy
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

