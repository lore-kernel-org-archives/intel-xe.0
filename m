Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE15C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4C710E745;
	Mon,  7 Sep 2026 09:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRWluvxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834710E745
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774479; x=1820310479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Cc7W/8xkA6kuCZei9oWLr3QF+lD8g0jJqA14ao4jTc=;
 b=SRWluvxPNk/bKyy24RQ2T+m+GwZ3mYzGs/5WfojqhsCtjqfNTV8rrv1T
 SnClIMSY0iqkQWtNEF4U1YFCWa3Mt7ga+wQ+5rsCnhLHHA/QPvuky8zNk
 HgmZnzGbzEGPIYRJ1vaedp72/DbbtT6TM97KmFeIlMJ5wR7EWO8Iq3w4S
 Y34lHbtBAsu1r3ag54EmdlHuxIRq7TsvMJK0MnOfrwZ3qS48nKtPwlG5u
 ZRBX8ruNO5Z15ASLjUbEaAhSXzm22jScmW6vJDeON0TpfMu6k5Pz03r1L
 iTFNPufktK53RETkfTZc4y1K0RVJHB3Lohp2R5jMJfXSw4cY8RmrAZFfH g==;
X-CSE-ConnectionGUID: geZze4BVQg26vdWi9YiJMA==
X-CSE-MsgGUID: RCnfuUZUSWa6PRFf9u/pMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100532072"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100532072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:59 -0700
X-CSE-ConnectionGUID: esh0C+VsT5KidZGU/Dt0Qg==
X-CSE-MsgGUID: JRTIWtkJQXOB5H/Ojc4tHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274175802"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:47:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v2 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
Date: Mon,  7 Sep 2026 15:17:12 +0530
Message-ID: <20260907094706.1407436-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260907094706.1407436-8-riana.tauro@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c       | 36 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ras.h       |  2 +-
 drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
 4 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..ff4a17d30461 100644
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
index 7058482e32a9..0ca395ac81e6 100644
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
 
@@ -244,11 +248,16 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
 		return ret;
 	}
 
+	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
+		xa_store(&state->offlined_pages, page_address >> PAGE_SHIFT,
+			 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
+
 	return ret;
 }
 
 static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
 {
+	struct xe_ras_state *state = &xe->ras.state;
 	enum xe_ras_page_action action;
 	int ret = 0;
 
@@ -288,7 +297,11 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send
 			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
 		return ret;
 	case -EEXIST:
-		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		if (xa_load(&state->offlined_pages, page_address >> PAGE_SHIFT))
+			action = XE_RAS_PAGE_ACTION_DECLINE;
+		else
+			action = XE_RAS_PAGE_ACTION_OFFLINE;
+
 		xe_log_err(xe, DEVICE_MEMORY, ret,
 			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
 			   page_address);
@@ -410,8 +423,11 @@ static void get_offlined_list(struct xe_device *xe)
 			return;
 		}
 
-		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
+		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++) {
 			handle_page_offline(xe, response.page_addresses[i], false);
+			xa_store(&state->offlined_pages, response.page_addresses[i] >> PAGE_SHIFT,
+				 XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
+		}
 
 		if (!state->max_pages)
 			state->max_pages = response.max_entries;
@@ -1120,20 +1136,28 @@ static const struct attribute_group gpu_health_group = {
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
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
  *
  * Initialize Xe RAS
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
 	 * TODO: Replace platform check with xe->info.has_disable_vram_page_offline
@@ -1145,10 +1169,14 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	xa_init(&state->offlined_pages);
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
index c411a6cb3731..b0f7ebc14ec6 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component);
 int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *threshold);
 int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
-void xe_ras_init(struct xe_device *xe);
+int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 
 static inline bool xe_ras_get_disable_page_offline(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 9f23970fd5a1..dfee83d558ed 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
@@ -425,5 +426,7 @@ struct xe_ras_state {
 	bool disable_page_offline;
 	/** @max_pages: Total number of pages that can be stored by firmware */
 	u32 max_pages;
+	/** @offlined_pages: XArray of pages offlined by firmware */
+	struct xarray offlined_pages;
 };
 #endif
-- 
2.47.1

