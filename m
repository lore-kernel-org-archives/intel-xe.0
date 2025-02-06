Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D0EC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F296510E812;
	Thu,  6 Feb 2025 10:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hh1opdew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440D310E812
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738837599; x=1770373599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+qHRoByWmi0kcq8U9eQYZcixJ9EWdTrjOacNPuXXMo=;
 b=Hh1opdewfIMw3qx6SxhbEIjbigmi5QT+8w/BPjke2jhfvs8NYJRGUun7
 1riZ5vKmVXhKwPm9WWWBLC7mFeAlJ4vPZNxKXClhyX9h5587bZQ+AN6NJ
 AqSWM+zB6IQAK8OD1dXLIQJJIzEE7+AGdTaE3kqlvvQA0JWxeoqMJiYT4
 Su+tYJXVWOMNcIPzfkpgTj2C5VXNwHA5z2LC2fBEOe4BiTBVmc4d0G25h
 3q0+G19fUcMmf2Fx2qFae0NuzzWD9PS4N8pOUn5utxevm80Br5HKnpfo4
 gSK13dpVwmfrwO2Q3wZDmQJ6xZ9ZP5+69MQRBttatmse7/RJWfbK7n+pO w==;
X-CSE-ConnectionGUID: 2Uqa5ZmgRd6Z22Fmvj7W7A==
X-CSE-MsgGUID: HqmyNDEcQymZcRhEsP2Z0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64787038"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64787038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:26:39 -0800
X-CSE-ConnectionGUID: /za92PdwQp2xtgWLSNSLLQ==
X-CSE-MsgGUID: y6UbKWdNQVGje1tNyGfteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110998166"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:26:37 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 8/8] drm/xe/pf: Enable per-function engine activity stats
Date: Thu,  6 Feb 2025 16:13:57 +0530
Message-ID: <20250206104358.3436519-9-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206104358.3436519-1-riana.tauro@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
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

Enable per-function engine activity stats when
sriov_numvfs are set and disable when sriov_numvfs
are set to 0.

Also restart engine stats when VF's are reprovisioned

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c          | 25 +++++++++++++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..25855dcb6e42 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -23,6 +23,7 @@
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_db_mgr.h"
+#include "xe_guc_engine_activity.h"
 #include "xe_guc_fwif.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_guc_klv_helpers.h"
@@ -1972,6 +1973,21 @@ static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_conf
 #undef reset_threshold_config
 }
 
+/**
+ * xe_gt_sriov_pf_engine_stats - Enable/Disable engine stats for PF and VFs
+ * @gt: the &xe_gt
+ * @num_vfs: number of VFs to enable
+ * @enable: enable/disable
+ *
+ * Enable or disable engine stats for PF and VF
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable)
+{
+	return xe_guc_engine_activity_function_stats(&gt->uc.guc, num_vfs, enable);
+}
+
 static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
@@ -2362,8 +2378,10 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
  */
 void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
 {
-	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
-	unsigned int fail = 0, skip = 0;
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
+	u16 num_vfs = pci_num_vf(to_pci_dev(xe->drm.dev));
+	unsigned int fail = 0, skip = 0, ret = 0;
 
 	for (n = 1; n <= total_vfs; n++) {
 		if (xe_gt_sriov_pf_config_is_empty(gt, n))
@@ -2372,6 +2390,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
 			fail++;
 	}
 
+	ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, true);
+	if (ret)
+		xe_gt_sriov_dbg(gt, "Failed to enable engine stats for PF and VF's %d\n",
+				ret);
 	if (fail)
 		xe_gt_sriov_notice(gt, "Failed to push %u of %u VF%s configurations\n",
 				   fail, total_vfs - skip, str_plural(total_vfs));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index f894e9d4abba..a5585b178e6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -62,6 +62,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_config_engine_stats(struct xe_gt *gt, unsigned int num_vfs, bool enable);
 
 void xe_gt_sriov_pf_config_restart(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..612e64efb43c 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -62,6 +62,21 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static int pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs, bool enable)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int ret = 0;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_gt_sriov_pf_config_engine_stats(gt, num_vfs, enable);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -94,6 +109,11 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
+
+	err = pf_engine_activity_stats(xe, num_vfs, true);
+	if (err < 0)
+		xe_sriov_warn(xe, "Failed to enable function activity stats\n");
+
 	return num_vfs;
 
 failed:
@@ -110,6 +130,7 @@ static int pf_disable_vfs(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	u16 num_vfs = pci_num_vf(pdev);
+	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
 	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
@@ -117,6 +138,10 @@ static int pf_disable_vfs(struct xe_device *xe)
 	if (!num_vfs)
 		return 0;
 
+	err = pf_engine_activity_stats(xe, num_vfs, false);
+	if (err < 0)
+		xe_sriov_warn(xe, "Failed to disable function activity stats\n");
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
-- 
2.47.1

