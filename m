Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9337C61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841B410E905;
	Tue, 25 Aug 2026 06:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlT1x1E7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E410E905
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639819; x=1819175819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCnjZ4DmPr1pZBGEdw/rC1CjRYErFF+5ibB1b6A6NlI=;
 b=jlT1x1E7+5uzRTyyTPSRSd0hFuRlKAAGgREea3uwjPLz9Gxd6mnDexmB
 CfvoeaRM1E0lI1RODnvyAjfgdHgKvUdxFajdAm9Zt7N1Gjlot5rgke6FE
 CoskmeJU1XayEm5u7E62ANd6X45tih6bLMutcAThHkUQLJ72bzjGjXy8X
 R9QWcYp9D8+cB6+qj3jiuxEHgnp5y8vNV9WM3Yef6CX9WeRiOdIRGGg15
 7K+pBgRrGJo1E0hS982JajPbH7CgHXmuSg2orEXZedZjV9/KczsTgilIW
 O6kexHzwybS2pI7jYKFdN8UP5wzI/LkPZo1K2Ty+kHo5wvvDl2Lvjy3Ro w==;
X-CSE-ConnectionGUID: OdUdBfCORySZ8gN1nhcchg==
X-CSE-MsgGUID: ia2uB4LhQWmmWN0w/21oFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226112"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:58 -0700
X-CSE-ConnectionGUID: wXjqNPQfT6WcjGTbeIN1rg==
X-CSE-MsgGUID: 34jiucb5R6KaixJCcNuirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265429052"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 5/5] drm/xe/xe_ras: Track offlined pages by firmware to avoid
 duplicates
Date: Tue, 25 Aug 2026 12:06:20 +0530
Message-ID: <20260825063615.3697317-12-riana.tauro@intel.com>
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

A memory scrubber can report multiple errors at the same address. Track
pages already successfully offlined by the firmware so that subsequent
reports for the same address are declined and removed from the firmware
queue instead of issuing redundant page offline requests.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c    |  4 +++-
 drivers/gpu/drm/xe/xe_ras.c       | 35 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ras.h       |  2 +-
 drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..e087e89f610d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1039,7 +1039,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_ras_init(xe);
+	err = xe_ras_init(xe);
+	if (err)
+		return err;
 
 	/*
 	 * Now that GT is initialized (TTM in particular),
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ca6d55907626..df7b2aee955d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -17,6 +17,9 @@
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 
+/* Any non-null entry marks the page as offlined by firmware */
+#define XE_RAS_PAGE_OFFLINED		xa_mk_value(1)
+
 #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
 /*
  * Uncorrectable error type for core compute errors.
@@ -207,6 +210,7 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_page_offline_request request = {0};
 	struct xe_ras_page_offline_response response = {0};
+	struct xe_ras *ras = &xe->ras;
 	size_t rlen;
 	int ret;
 
@@ -244,6 +248,10 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 		return ret;
 	}
 
+	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
+		xa_store(&ras->offlined_pages, page_address >> PAGE_SHIFT,
+			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
+
 	return ret;
 }
 
@@ -287,7 +295,11 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send
 			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
 		return ret;
 	case -EEXIST:
-		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		if (xa_load(&xe->ras.offlined_pages, page_address >> PAGE_SHIFT))
+			action = XE_RAS_PAGE_ACTION_DECLINE;
+		else
+			action = XE_RAS_PAGE_ACTION_OFFLINE;
+
 		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
 			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
 			   page_address);
@@ -409,8 +421,11 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++) {
 			handle_page_offline(xe, response.page_addresses[i], false);
+			xa_store(&ras->offlined_pages, response.page_addresses[i] >> PAGE_SHIFT,
+				 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
+		}
 
 		if (!ras->max_pages)
 			ras->max_pages = response.max_entries;
@@ -1005,6 +1020,13 @@ static const struct attribute_group gpu_health_group = {
 	.attrs = gpu_health_attrs,
 };
 
+static void ras_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xa_destroy(&xe->ras.offlined_pages);
+}
+
 /**
  * xe_ras_get_max_pages() - Get maximum pages
  * @xe: Xe device instance
@@ -1025,22 +1047,27 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
  *
  * Initialize Xe RAS
  */
-void xe_ras_init(struct xe_device *xe)
+int xe_ras_init(struct xe_device *xe)
 {
+	struct xe_ras *ras = &xe->ras;
 	int ret;
 
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
-		return;
+		return 0;
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	xa_init(&ras->offlined_pages);
+
 	get_queued_pages(xe);
 	get_offlined_list(xe);
 
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
+
+	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1510edeb7c73..b0212e354734 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -16,7 +16,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value);
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
-void xe_ras_init(struct xe_device *xe);
+int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 2b0c6ef8c8a4..64d1b335f43a 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
@@ -375,6 +376,8 @@ struct xe_ras_set_health_response {
 struct xe_ras {
 	/** @max_pages: Total number of pages that can be stored by firmware */
 	u32 max_pages;
+	/** @offlined_pages: XArray of pages offlined by firmware */
+	struct xarray offlined_pages;
 };
 
 #endif
-- 
2.47.1

