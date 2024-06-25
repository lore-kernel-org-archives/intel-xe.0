Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26591C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCCE10E07D;
	Tue, 25 Jun 2024 19:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6NfYGwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A637F10E161
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719344758; x=1750880758;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XYxkWPS+t63h4Wx+SfN0CaJdE51EOHYtYz0GJozEkk0=;
 b=Y6NfYGwHkw+laUFbrX0TLYhP2rRetxVGS2pxm17XsQn0Zop/1lx0IFnJ
 a+dD1n5FJru+oMMWplfk0iYlU+r1mqOQaqAcJTQSjFQ0bNOn0K5BUQXIY
 5bXSzwnuB7zrG5W/ZysHT7tSUh9tCa8eX30mhQGT6bvJHOKa9Vbh6VhQG
 HbkCEB7D1cbt3c1PxwTj+6cQ/efD6bgJLPxhS9BLhSNPRbeo/MVce5Xxc
 FfEpOtyjnO8Lo0cSi1ErfgpVmydu+dIK1XTakRnclj9yehgwcozVDtSj3
 KMaaz/727cJZXm63vjqTOXhaYu0MuF4GSLEHpR1Dz2wFJ6NGssh0aCPYu w==;
X-CSE-ConnectionGUID: 8mLuY2C8TgKuWmIlG/Ec6w==
X-CSE-MsgGUID: 63u1aTCJT8OOLK3x8AfQ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41807855"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="41807855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:45:58 -0700
X-CSE-ConnectionGUID: LDcPDUnZRDyACitvpAywfw==
X-CSE-MsgGUID: x0vWgf+MTrKZsgV+ZqXdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43825625"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:45:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/pf: Trigger explicit FLR while disabling VFs
Date: Tue, 25 Jun 2024 21:45:46 +0200
Message-Id: <20240625194546.1301-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240625194546.1301-1-michal.wajdeczko@intel.com>
References: <20240625194546.1301-1-michal.wajdeczko@intel.com>
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

We attempt to unprovision all VFs GuC when disabling them, but
GuC may reject such request if the target VF was previously active
but VF driver didn't unload with explicit VF reset H2G action or
the VMM has not started the VF FLR.

To avoid mismatches between configs maintained the PF and GuC,
trigger an explicit FLR sequences just before releasing resources.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c           | 14 ++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 40b8f881fe04..ebf06e037750 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -129,6 +129,27 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
 	return pf_send_vf_stop(gt, vfid);
 }
 
+/**
+ * xe_gt_sriov_pf_control_trigger_flr - Start a VF FLR sequence.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
+{
+	int err;
+
+	/* XXX pf_send_vf_flr_start() expects ct->lock */
+	mutex_lock(&gt->uc.guc.ct.lock);
+	err = pf_send_vf_flr_start(gt, vfid);
+	mutex_unlock(&gt->uc.guc.ct.lock);
+
+	return err;
+}
+
 /**
  * DOC: The VF FLR Flow with GuC
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
index 850a3e37661f..405d1586f991 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -14,6 +14,7 @@ struct xe_gt;
 int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 06d0fceb5114..74c8fadc9365 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -6,6 +6,7 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -37,6 +38,17 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_config_release(gt, n, true);
 }
 
+static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	unsigned int n;
+
+	for_each_gt(gt, xe, id)
+		for (n = 1; n <= num_vfs; n++)
+			xe_gt_sriov_pf_control_trigger_flr(gt, n);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -94,6 +106,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
+	pf_reset_vfs(xe, num_vfs);
+
 	pf_unprovision_vfs(xe, num_vfs);
 
 	/* not needed anymore - see pf_enable_vfs() */
-- 
2.43.0

