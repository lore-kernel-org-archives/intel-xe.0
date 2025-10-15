Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE34CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F071710E765;
	Wed, 15 Oct 2025 09:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdEChH+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B4E10E763
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519579; x=1792055579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcEh2X6IWa515LwE3H4ZneaxDmr9cp/i7gh2Q8et2HQ=;
 b=WdEChH+dibyrQO22qYllp9oAHOOt3TRP0jgQLBagzMmMwGIzyWmFsFU7
 Ex1z5ec1Czo2twc0MgRexwbNkNSqwPyUUxbjHwRgOXafEEYRmpLGiUAgg
 mnnY3oaOTy9zr0RPSwiFYB1NEEGRZK9+y2//lVYMhDBVsDR6VdDPmnM/t
 la4LePRUWLNUY2L2LeGl9abD/vrkKtZ9/Id3ups7y0wi+MYYK3RVs1n64
 loQlCCYTdWMBVGbeAYM5TlSU0IKemNHEgOTzouBUecoHvNJlstNkszviA
 +avem0AUbgzUt9rVcw6oiiQ1bYrr1L0ign7u5X4tD+InvbZ3pPwvroYyT A==;
X-CSE-ConnectionGUID: bkY5po8hTViig09uDGsknQ==
X-CSE-MsgGUID: D2SniMsGQUGsytPER+Ig/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66515814"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66515814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:59 -0700
X-CSE-ConnectionGUID: /HjOunC3QaavmgiQdOqMXw==
X-CSE-MsgGUID: qdV0BVtaR+GYMUUfbuQ9ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="213065736"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/4] drm/xe/pf: Disable auto-provisioning if changed using
 debugfs
Date: Wed, 15 Oct 2025 11:12:08 +0200
Message-ID: <20251015091211.592-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015091211.592-1-michal.wajdeczko@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

When we attempt to tweak VFs configurations using debugfs, stop
assuming that VFs need auto-(un)provisioning.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  7 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 39 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    | 17 ++++++++
 .../gpu/drm/xe/xe_sriov_pf_provision_types.h  |  4 ++
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c |  3 ++
 5 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index c026a3910e7e..838beb7f6327 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_provision.h"
 
 /*
  *      /sys/kernel/debug/dri/BDF/
@@ -124,6 +125,8 @@ static int POLICY##_set(void *data, u64 val)					\
 										\
 	xe_pm_runtime_get(xe);							\
 	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
+	if (!err)								\
+		xe_sriov_pf_provision_set_custom_mode(xe);			\
 	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
@@ -189,6 +192,8 @@ static int CONFIG##_set(void *data, u64 val)					\
 	xe_pm_runtime_get(xe);							\
 	err = xe_sriov_pf_wait_ready(xe) ?:					\
 	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	if (!err)								\
+		xe_sriov_pf_provision_set_custom_mode(xe);			\
 	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
@@ -246,6 +251,8 @@ static int set_threshold(void *data, u64 val, enum xe_guc_klv_threshold_index in
 
 	xe_pm_runtime_get(xe);
 	err = xe_gt_sriov_pf_config_set_threshold(gt, vfid, index, val);
+	if (!err)
+		xe_sriov_pf_provision_set_custom_mode(xe);
 	xe_pm_runtime_put(xe);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index de7d925a110d..7e74175db972 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -10,6 +10,19 @@
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_provision_types.h"
+#include "xe_sriov_printk.h"
+
+static const char *mode_to_string(enum xe_sriov_provisioning_mode mode)
+{
+	switch (mode) {
+	case XE_SRIOV_PROVISIONING_MODE_AUTO:
+		return "auto";
+	case XE_SRIOV_PROVISIONING_MODE_CUSTOM:
+		return "custom";
+	default:
+		return "<invalid>";
+	}
+}
 
 static bool pf_auto_provisioning_mode(struct xe_device *xe)
 {
@@ -95,3 +108,29 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	pf_unprovision_vfs(xe, num_vfs);
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
+ * @xe: the PF &xe_device
+ * @mode: the new VFs provisioning mode
+ *
+ * When changing from AUTO to CUSTOM mode, any already allocated VFs resources
+ * will remain allocated and will not be released upon VFs disabling.
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	if (mode == xe->sriov.pf.provision.mode)
+		return 0;
+
+	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
+		     mode_to_string(xe->sriov.pf.provision.mode),
+		     mode_to_string(mode), __builtin_return_address(0));
+	xe->sriov.pf.provision.mode = mode;
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
index f6a902190ad7..cf3657a32e90 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -6,9 +6,26 @@
 #ifndef _XE_SRIOV_PF_PROVISION_H_
 #define _XE_SRIOV_PF_PROVISION_H_
 
+#include "xe_sriov_pf_provision_types.h"
+
 struct xe_device;
 
 int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
 int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
 
+int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode);
+
+/**
+ * xe_sriov_pf_provision_set_custom_mode() - Change VFs provision mode to custom.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static inline int xe_sriov_pf_provision_set_custom_mode(struct xe_device *xe)
+{
+	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_CUSTOM);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
index f72bc5db3a60..a847b8a4c4da 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
@@ -15,9 +15,13 @@
  *                                   Any allocated resources to the VFs will be
  *                                   automatically released when disabling VFs.
  *                                   This is a default mode.
+ * @XE_SRIOV_PROVISIONING_MODE_CUSTOM: Explicit VFs provisioning using uABI interfaces.
+ *                                     VFs resources remains allocated regardless if
+ *                                     VFs are enabled or not.
  */
 enum xe_sriov_provisioning_mode {
 	XE_SRIOV_PROVISIONING_MODE_AUTO,
+	XE_SRIOV_PROVISIONING_MODE_CUSTOM,
 };
 static_assert(XE_SRIOV_PROVISIONING_MODE_AUTO == 0);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index c8df18af4d00..931df8a6eaf4 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -15,6 +15,7 @@
 #include "xe_tile_sriov_pf_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_provision.h"
 
 /*
  *      /sys/kernel/debug/dri/BDF/
@@ -143,6 +144,8 @@ static int NAME##_set(void *data, u64 val)					\
 	xe_pm_runtime_get(xe);							\
 	err = xe_sriov_pf_wait_ready(xe) ?:					\
 	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	if (!err)								\
+		xe_sriov_pf_provision_set_custom_mode(xe);			\
 	xe_pm_runtime_put(xe);							\
 										\
 	return err;								\
-- 
2.47.1

