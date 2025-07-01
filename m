Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33CAC8303A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F4A10E2C1;
	Tue,  1 Jul 2025 12:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljD8MYCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CDC10E5A2
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751374626; x=1782910626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKflgpVRimSBNn4YcXaWpdfRoQzr0kS3xig3wrEjyHA=;
 b=ljD8MYCoQ5G3BjdHoLVpEGEuyxdCskGbOeAfwJkE+wiUKzJ++76rf9oc
 /QzIlBa7bFsM0fm+JxcyzIHJVM3U5NvDYBu+EB7+ZjrqKoRxyjf3Xkt6b
 VKz33ZCVTKNX6y6QIv9bA+zkPd5FeSEfUxetuPJmF8m+zU8vRM6Uyi05S
 TB+KVaZMW7qJM6x9OhpquYxBuZK6iyBGnF0C1JmdhJdMhXNqOiQdG054i
 HRKBGkE4s+Vut1vWU+tgsVu3M16S4HGyirn0zdVz3RrP5XO0gZ6mEmim4
 n5xpjramDbMgphpr7vCk46+2lxDSYbplKQlwCqKwrPzK76sYSvVh1WJ5b Q==;
X-CSE-ConnectionGUID: ZiXCvAS6SEW3tUZT6IWGEA==
X-CSE-MsgGUID: We1H1xCGST6MrLMQhfS2CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53745206"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53745206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:06 -0700
X-CSE-ConnectionGUID: uB0RkoGVRbCAmGSA30u26w==
X-CSE-MsgGUID: WnUku0ibTYazaJ5kaErAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153236578"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:57:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 7/7] drm/xe/vf: Store negotiated VF/PF ABI version at
 device level
Date: Tue,  1 Jul 2025 14:56:46 +0200
Message-Id: <20250701125646.1568-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250701125646.1568-1-michal.wajdeczko@intel.com>
References: <20250701125646.1568-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is no need to maintain PF ABI version on per-GT level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 28 +++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 12 ----------
 drivers/gpu/drm/xe/xe_sriov_vf_types.h    | 14 ++++++++++++
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d65eafd91b17..b282838d59e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -686,21 +686,22 @@ static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
 	return 0;
 }
 
-static void vf_connect_pf(struct xe_gt *gt, u16 major, u16 minor)
+static void vf_connect_pf(struct xe_device *xe, u16 major, u16 minor)
 {
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_assert(xe, IS_SRIOV_VF(xe));
 
-	gt->sriov.vf.pf_version.major = major;
-	gt->sriov.vf.pf_version.minor = minor;
+	xe->sriov.vf.pf_version.major = major;
+	xe->sriov.vf.pf_version.minor = minor;
 }
 
-static void vf_disconnect_pf(struct xe_gt *gt)
+static void vf_disconnect_pf(struct xe_device *xe)
 {
-	vf_connect_pf(gt, 0, 0);
+	vf_connect_pf(xe, 0, 0);
 }
 
 static int vf_handshake_with_pf(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 major_wanted = GUC_RELAY_VERSION_LATEST_MAJOR;
 	u32 minor_wanted = GUC_RELAY_VERSION_LATEST_MINOR;
 	u32 major = major_wanted, minor = minor_wanted;
@@ -716,13 +717,13 @@ static int vf_handshake_with_pf(struct xe_gt *gt)
 	}
 
 	xe_gt_sriov_dbg(gt, "using VF/PF ABI %u.%u\n", major, minor);
-	vf_connect_pf(gt, major, minor);
+	vf_connect_pf(xe, major, minor);
 	return 0;
 
 failed:
 	xe_gt_sriov_err(gt, "Unable to confirm VF/PF ABI version %u.%u (%pe)\n",
 			major, minor, ERR_PTR(err));
-	vf_disconnect_pf(gt);
+	vf_disconnect_pf(xe);
 	return err;
 }
 
@@ -775,10 +776,12 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 
 static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
 {
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	struct xe_device *xe = gt_to_xe(gt);
 
-	return major == gt->sriov.vf.pf_version.major &&
-	       minor <= gt->sriov.vf.pf_version.minor;
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+
+	return major == xe->sriov.vf.pf_version.major &&
+	       minor <= xe->sriov.vf.pf_version.minor;
 }
 
 static int vf_prepare_runtime_info(struct xe_gt *gt, unsigned int num_regs)
@@ -1072,9 +1075,10 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
 	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
-	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
+	struct xe_sriov_vf_relay_version *pf_version = &xe->sriov.vf.pf_version;
 	struct xe_uc_fw_version ver;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index ef041679e9d4..298dedf4b009 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -9,16 +9,6 @@
 #include <linux/types.h>
 #include "xe_uc_fw_types.h"
 
-/**
- * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
- */
-struct xe_gt_sriov_vf_relay_version {
-	/** @major: major version. */
-	u16 major;
-	/** @minor: minor version. */
-	u16 minor;
-};
-
 /**
  * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
  */
@@ -66,8 +56,6 @@ struct xe_gt_sriov_vf {
 	struct xe_uc_fw_version guc_version;
 	/** @self_config: resource configurations. */
 	struct xe_gt_sriov_vf_selfconfig self_config;
-	/** @pf_version: negotiated VF/PF ABI version. */
-	struct xe_gt_sriov_vf_relay_version pf_version;
 	/** @runtime: runtime data retrieved from the PF. */
 	struct xe_gt_sriov_vf_runtime runtime;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 55c2421d4b2e..8300416a6226 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -6,8 +6,19 @@
 #ifndef _XE_SRIOV_VF_TYPES_H_
 #define _XE_SRIOV_VF_TYPES_H_
 
+#include <linux/types.h>
 #include <linux/workqueue_types.h>
 
+/**
+ * struct xe_sriov_vf_relay_version - PF ABI version details.
+ */
+struct xe_sriov_vf_relay_version {
+	/** @major: major version. */
+	u16 major;
+	/** @minor: minor version. */
+	u16 minor;
+};
+
 /**
  * struct xe_device_vf - Xe Virtual Function related data
  *
@@ -15,6 +26,9 @@
  * @XE_SRIOV_MODE_VF mode.
  */
 struct xe_device_vf {
+	/** @pf_version: negotiated VF/PF ABI version. */
+	struct xe_sriov_vf_relay_version pf_version;
+
 	/** @migration: VF Migration state data */
 	struct {
 		/** @migration.worker: VF migration recovery worker */
-- 
2.47.1

