Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BC3606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XaPUq4H4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B45810E680;
	Thu, 19 Nov 2026 10:24:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527FC112259
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795083875; x=1826619875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NibkawhuaTI6M1YLy6tkGyMTuql0kgV9gwalh0I5Nic=;
 b=XaPUq4H4ZimI2+cEN9I+bfIJDXknDn6KWEZMl0w2IHkiluqPuJnldu53
 /mzynzU8g8fIWudEnfc9RQR10qMrlEOvxo5/cH7Z9z0LfgWGBPas8FA7y
 n+WDbp4jvhO17XZtPKJo9Dm0T2VA2bx8YMUB91Ee0Yl308sdnqQZVtXRt
 kGaCXQVwkZWquQdOxRIOi+3zF43J817TTQpf4WaD3PXBu3gWzsMwbHMFp
 O9NPvG9AbVM4SWcDvT+7aGide0jiAa4UbVUNbkvdFJOxyPlLnHJ4HQuk7
 3j07Gjeh3a4BY7jNezN/dsQSMMo45y6i5oRFfyywlwKl81oQRtvQC7BM3 g==;
X-CSE-ConnectionGUID: zJaZRQv1QamxR6mtzMAQow==
X-CSE-MsgGUID: q1a7HISmRraqT3BoG/TNYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3957626"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3957626"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:24:34 -0800
X-CSE-ConnectionGUID: BOsurHH/T4+krev+WCw6tA==
X-CSE-MsgGUID: KBO51YWDTTqLaxP/lbfCsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10473917"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 02:24:33 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 2/2] drm/xe/wedge: Introduce xe_wedge_mode_is_no_reset()
Date: Thu, 19 Nov 2026 15:52:18 +0530
Message-ID: <20261119102344.2053821-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119102344.2053821-1-raag.jadav@intel.com>
References: <20261119102344.2053821-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert open-coded XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET check into its
own helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Introduce xe_wedge_mode_is_no_reset()
v3: Fix wedge_validate_mode() to check for local mode (Sashiko)
v4: Also use xe_wedge_mode_is_no_reset() in guc_submit_hint_wedged() (Sashiko)
---
 drivers/gpu/drm/xe/xe_drm_ras.c     | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c     | 3 ++-
 drivers/gpu/drm/xe/xe_guc_capture.c | 3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c  | 4 ++--
 drivers/gpu/drm/xe/xe_pci_error.c   | 2 +-
 drivers/gpu/drm/xe/xe_wedge.c       | 5 ++---
 drivers/gpu/drm/xe/xe_wedge.h       | 5 +++++
 7 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 3ca6c82345dd..86c589437a9f 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -21,7 +21,7 @@ static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 static int drm_ras_counter_get(struct xe_device *xe, struct xe_drm_ras_counter *info,
 			       u32 error_id, int *idx)
 {
-	if (xe_wedged(xe) && xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedged(xe) && !xe_wedge_mode_is_no_reset(xe))
 		return -ECANCELED;
 
 	if (!info || !info[error_id].name)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 0e1674a394b6..f333480f94e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -30,6 +30,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 /* Slack of a few additional entries per engine */
 #define ADS_REGSET_EXTRA_MAX	8
@@ -544,7 +545,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_mode_is_no_reset(xe))
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 0fd68b41d412..e528b3e9d158 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -35,6 +35,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_sched_job.h"
+#include "xe_wedge.h"
 
 /*
  * struct __guc_capture_bufstate
@@ -1962,7 +1963,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 
 	xe = gt_to_xe(q->gt);
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_mode_is_no_reset(xe))
 		return NULL;
 
 	if (!xe_device_uc_enabled(xe))
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b5c916a764db..0aec902d0ef5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1435,7 +1435,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (!guc->submission_state.initialized)
 		return;
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+	if (xe_wedge_mode_is_no_reset(xe)) {
 		mutex_lock(&guc->submission_state.lock);
 		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
 			if (xe_exec_queue_get_unless_zero(q))
@@ -1455,7 +1455,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (!xe_wedge_mode_is_no_reset(xe))
 		return false;
 
 	if (xe_wedged(xe))
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index d288bb291aa1..fc6ff71d84a0 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -179,7 +179,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 	action = xe_ras_process_errors(xe);
 
 	/* User wants to debug the error, prevent reset */
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+	if (xe_wedge_mode_is_no_reset(xe)) {
 		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_NONE);
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 827fae058976..e48cca34d660 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -157,7 +157,7 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
 	 * hangs, so wedge the device with 'none' recovery method and have
 	 * it available to the user for debugging.
 	 */
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_mode_is_no_reset(xe))
 		xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
 	else
 		xe->wedged.method = method;
@@ -203,8 +203,7 @@ static bool wedge_mode_needs_policy_update(struct xe_device *xe, enum xe_wedged_
 	if (xe->wedged.mode == mode)
 		return false;
 
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
-	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+	if (xe_wedge_mode_is_no_reset(xe) || mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
index f2cab855db35..edb5174c5a75 100644
--- a/drivers/gpu/drm/xe/xe_wedge.h
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -26,6 +26,11 @@ static inline bool xe_wedged_permanent(struct xe_device *xe)
 	return atomic_read(&xe->wedged.perm);
 }
 
+static inline bool xe_wedge_mode_is_no_reset(struct xe_device *xe)
+{
+	return xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
+}
+
 void xe_wedge_declare(struct xe_device *xe, unsigned long method);
 int xe_wedge_init(struct xe_device *xe);
 int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
-- 
2.43.0

