Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B3FEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68D10EBD2;
	Fri, 27 Feb 2026 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfa40KtS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E1010EBD2
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211802; x=1803747802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zOld4CIAuua9/KrUjDscRUZezE8QG38QHxUl8vfKeUY=;
 b=mfa40KtS005p7LA2b3og6ZK1UG5jA7eRETKgWEPJecexjnjicH95eLdx
 KE+FCCiWN7KdDDaESb8w0S5h0acBfY+S3DPppXlifzB2I0tl6wlM3xB39
 pyCuKx732a/JKMuzqJ9dMa52EVC43KDQDnpLR46RJeWgLwtTkcCIu6r00
 EnsC/7ADKlR1eZrjYtCsMlcdIQ5pkZhjgrIZo2s0tehKLv9mR+suZV7ao
 mAfQE+JH9ZKShH8pqnx6ISLy6rFDHZm6Fvyn41/XA5LVY1zSbZqgJOm1q
 92OqeitFmp8N6f5ojKVnr5glyQCxyPimtNFzYZQTfSCM5eWL9r1zssbz2 A==;
X-CSE-ConnectionGUID: hNRUDoGRQAaSLlVz8pcZtA==
X-CSE-MsgGUID: gKG2GTlQSMyJkMWhW7lZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169898"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:21 -0800
X-CSE-ConnectionGUID: e5J0GS85TOqTmsn+FOrF+w==
X-CSE-MsgGUID: eqkcS+JpTKWaV8Oqs5QgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964680"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:17 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/9] drm/xe/gt: Introduce FLR helpers
Date: Fri, 27 Feb 2026 22:30:42 +0530
Message-ID: <20260227170049.3418863-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
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

In preparation of usecases which require preparing/re-initializing GT
before/after PCIe FLR, introduce flr_prepare/done() helpers. All GT uCs
are already brought up as part of xe_gt_resume() sequence, but before
that happens we still need to re-initialize their firmwares so that they
can be loaded as part of xe_gt_resume() sequence.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_gsc.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h  |  2 ++
 drivers/gpu/drm/xe/xe_guc.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h |  1 +
 drivers/gpu/drm/xe/xe_huc.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_huc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c  | 36 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h  |  2 ++
 10 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index e5c234f3d795..452976c7a8e5 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -552,6 +552,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 		flush_work(&gsc->work);
 }
 
+/**
+ * xe_gsc_flr_done() - Re-initialize GSC firmware after FLR
+ * @gsc: The GSC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gsc_flr_done(struct xe_gsc *gsc)
+{
+	if (!xe_uc_fw_is_loadable(&gsc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&gsc->fw);
+}
+
 void xe_gsc_stop_prepare(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index b8b8e0810ad9..8b7fd98f0be6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -13,6 +13,7 @@ struct xe_gsc;
 struct xe_gt;
 struct xe_hw_engine;
 
+int xe_gsc_flr_done(struct xe_gsc *gsc);
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..ff4a4e769fb1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -947,6 +947,28 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		xe_pm_runtime_put(gt_to_xe(gt));
 }
 
+/**
+ * xe_gt_flr_prepare() - Prepare GT for FLR
+ * @gt: the GT object
+ *
+ * Prepare all GT uCs for FLR.
+ */
+void xe_gt_flr_prepare(struct xe_gt *gt)
+{
+	xe_uc_flr_prepare(&gt->uc);
+}
+
+/**
+ * xe_gt_flr_done() - Re-initialize GT after FLR
+ * @gt: the GT object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_gt_flr_done(struct xe_gt *gt)
+{
+	return xe_uc_flr_done(&gt->uc);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..5e6e4eb09efe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -63,6 +63,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
  */
 void xe_gt_record_user_engines(struct xe_gt *gt);
 
+int xe_gt_flr_done(struct xe_gt *gt);
+void xe_gt_flr_prepare(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..4e8a1748bcec 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1656,6 +1656,20 @@ void xe_guc_sanitize(struct xe_guc *guc)
 	xe_guc_submit_disable(guc);
 }
 
+/**
+ * xe_guc_flr_done() - Re-initialize GuC firmware after FLR
+ * @guc: The GuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_guc_flr_done(struct xe_guc *guc)
+{
+	if (!xe_uc_fw_is_loadable(&guc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&guc->fw);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 66e7edc70ed9..ee7e8fd99b86 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -32,6 +32,7 @@
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
+int xe_guc_flr_done(struct xe_guc *guc);
 int xe_guc_init_noalloc(struct xe_guc *guc);
 int xe_guc_init(struct xe_guc *guc);
 int xe_guc_init_post_hwconfig(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..0e7d2ef86241 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
 	xe_uc_fw_sanitize(&huc->fw);
 }
 
+/**
+ * xe_huc_flr_done() - Re-initialize HuC firmware after FLR
+ * @huc: The HuC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_huc_flr_done(struct xe_huc *huc)
+{
+	if (!xe_uc_fw_is_loadable(&huc->fw))
+		return 0;
+
+	return xe_uc_fw_reinit(&huc->fw);
+}
+
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
index fa1c45e70443..7600ea196908 100644
--- a/drivers/gpu/drm/xe/xe_huc.h
+++ b/drivers/gpu/drm/xe/xe_huc.h
@@ -17,6 +17,7 @@ enum xe_huc_auth_types {
 	XE_HUC_AUTH_TYPES_COUNT
 };
 
+int xe_huc_flr_done(struct xe_huc *huc);
 int xe_huc_init(struct xe_huc *huc);
 int xe_huc_init_post_hwconfig(struct xe_huc *huc);
 int xe_huc_upload(struct xe_huc *huc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d9aa845a308d..e8ce15b7fb15 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -17,6 +17,7 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
+#include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
 static struct xe_gt *
@@ -283,6 +284,41 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+/**
+ * xe_uc_flr_prepare() - Prepare uCs for FLR
+ * @uc: The uC object
+ *
+ * Flush pending work and stop all uCs.
+ */
+void xe_uc_flr_prepare(struct xe_uc *uc)
+{
+	xe_gsc_wait_for_worker_completion(&uc->gsc);
+	xe_uc_reset_prepare(uc);
+	xe_uc_stop(uc);
+	xe_uc_sanitize(uc);
+}
+
+/**
+ * xe_uc_flr_done() - Re-initialize uCs after FLR
+ * @uc: The uC object
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_uc_flr_done(struct xe_uc *uc)
+{
+	int ret;
+
+	ret = xe_guc_flr_done(&uc->guc);
+	if (ret)
+		return ret;
+
+	ret = xe_huc_flr_done(&uc->huc);
+	if (ret)
+		return ret;
+
+	return xe_gsc_flr_done(&uc->gsc);
+}
+
 void xe_uc_suspend_prepare(struct xe_uc *uc)
 {
 	xe_gsc_wait_for_worker_completion(&uc->gsc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 255a54a8f876..1756821edea1 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -8,6 +8,8 @@
 
 struct xe_uc;
 
+int xe_uc_flr_done(struct xe_uc *uc);
+void xe_uc_flr_prepare(struct xe_uc *uc);
 int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
-- 
2.43.0

