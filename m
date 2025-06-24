Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4EFC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 20:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4710E126;
	Tue, 24 Jun 2025 20:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TecZKj+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D722310E11A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750795782; x=1782331782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pSMoLbDu1UR2a5HRN8By1nHBqwyLZHjzhCzbDHlsw8M=;
 b=TecZKj+OLlnzzWJAuIp9d9+CTItrAT6JD7cnLyJEJGMNfWiORK7F9gX9
 G32mYw3pWC37uQ6+dviXLx7zinDuBeu/7ZsRdkOH6PtQStriF4n0XeyBd
 1MxyNvoSSUNlJlQQmzU+CSGMsDu6NbeOZOxhQ4vTuFczN8isao+0pK/jK
 2xhwJOaoYCXGAFHuqhEYcdGjajqK4OJ0dh41ZqXG7Zu+HUAQMtqPbzroe
 POSU42By6Dc0R8eiC8YAfeigPUL0DJdLKX63mHiTPMPLJ9jf35YEwueLw
 kRXC5NvX7eec/At3z/uXgZGTxppAam/iSrNRUwBhYS83zyjAwW1WcDEvs Q==;
X-CSE-ConnectionGUID: uSBYln6ISoGnKi0KtYNG+g==
X-CSE-MsgGUID: JfW/qQJcQSy9jonp2uRTlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52920644"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52920644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:42 -0700
X-CSE-ConnectionGUID: ViCt3D5VTNCcwE4Q9Ob8SQ==
X-CSE-MsgGUID: Q1pLAhB4RH6YFEqlQuG3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="189195581"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 13:09:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/vf: Store negotiated VF/PF ABI version at device
 level
Date: Tue, 24 Jun 2025 22:09:23 +0200
Message-Id: <20250624200923.1348-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250624200923.1348-1-michal.wajdeczko@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
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

There is no need to maintain PF ABI version on per-GT level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 30 +++++++++++++----------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 12 ---------
 drivers/gpu/drm/xe/xe_sriov_vf_types.h    | 14 +++++++++++
 3 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9b2fc9db55b8..d168264e63ea 100644
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
@@ -966,7 +969,7 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	struct vf_runtime_reg *rr;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
+	xe_gt_assert(gt, gt_to_xe(gt)->sriov.vf.pf_version.major);
 	xe_gt_assert(gt, !reg.vf);
 
 	if (reg.addr == GMD_ID.addr) {
@@ -1073,9 +1076,10 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
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

