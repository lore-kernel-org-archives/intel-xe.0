Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C20C30659
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 10:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19E10E38D;
	Mon,  1 Jul 2024 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6d1DyJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D790E10E38D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719829668; x=1751365668;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vO6x+6AvAtY1uAvybEhoVT/fqwCdMQ/p/pYFoX+wlIE=;
 b=Z6d1DyJdgyl2E/sf68+pEPsVXl9F01Yxn2eSnukbFOA1dWdjb0g/F8oC
 i8r5mYEAoQrn2YB5+VwXI+x/axGIasvdAmZghCjRZSsafm33WmE1H+JeQ
 sfqz66C/qhXHcPbd0naDcWNCmgtsW8usdH8vQZ+ekPYjfhDOMdugoeRkb
 jzyp/EqFmL7dHA7D+q00lyMbmUIFp43jSc85jv1tU+zDuWPQxMl6hz5YF
 JDOPKDgi92NOJNjyA3PS3HXG2pikJa5lZvE9GEs1sB0dmbwHSYQBkhE9m
 QClHC/xoFl+7j1owgSmGaH//vt0sU+xNxy7ehqr5HgxC0tjlTKLkeFcum g==;
X-CSE-ConnectionGUID: H83qja+yRoez1admLKGL3g==
X-CSE-MsgGUID: orTLdMBuQw2Mll4sb5OPjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28341415"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28341415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:48 -0700
X-CSE-ConnectionGUID: lHTB/O61Q/GVVvRdASIPmw==
X-CSE-MsgGUID: 7h2mZJPXQ8qtv7upO81mNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76665649"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/pf: Skip fair VFs provisioning if already
 provisioned
Date: Mon,  1 Jul 2024 12:27:36 +0200
Message-Id: <20240701102738.934-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240701102738.934-1-michal.wajdeczko@intel.com>
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
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

Our debugfs allows to view and change VFs' provisioning configs.

If we attempt to experiment with VFs provisioning before enabling
them, this early config will affect fair provisioning calculations,
and will also be overwritten, which is undesirable behavior.

To improve this, check if the VFs configs are empty (unprovisioned)
before starting the fair provisioning procedure.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 48 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 +
 drivers/gpu/drm/xe/xe_pci_sriov.c          | 13 ++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 694671497f6e..810b579a0025 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1922,6 +1922,54 @@ int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh
 	return err;
 }
 
+static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	bool valid_ggtt, valid_ctxs, valid_dbs;
+	bool valid_any, valid_all;
+
+	valid_ggtt = pf_get_vf_config_ggtt(primary_gt, vfid);
+	valid_ctxs = pf_get_vf_config_ctxs(gt, vfid);
+	valid_dbs = pf_get_vf_config_dbs(gt, vfid);
+
+	/* note that GuC doorbells are optional */
+	valid_any = valid_ggtt || valid_ctxs || valid_dbs;
+	valid_all = valid_ggtt && valid_ctxs;
+
+	if (IS_DGFX(xe)) {
+		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
+
+		valid_any = valid_any || valid_lmem;
+		valid_all = valid_all && valid_lmem;
+	}
+
+	return valid_all ? 1 : valid_any ? -ENOKEY : -ENODATA;
+}
+
+/**
+ * xe_gt_sriov_pf_config_is_empty - Check VF's configuration.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be PF)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: true if VF mandatory configuration (GGTT, LMEM, ...) is empty.
+ */
+bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid)
+{
+	bool empty;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	empty = pf_validate_vf_config(gt, vfid) == -ENODATA;
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return empty;
+}
+
 /**
  * xe_gt_sriov_pf_config_print_ggtt - Print GGTT configurations.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index e8238c1ad06a..58c8f879d7ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -53,6 +53,8 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
 int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
 
+bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
+
 int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
 int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 74c8fadc9365..aaceee748287 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -13,6 +13,17 @@
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_printk.h"
 
+static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
+{
+	unsigned int n;
+
+	for (n = 1; n <= num_vfs; n++)
+		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
+			return false;
+
+	return true;
+}
+
 static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	struct xe_gt *gt;
@@ -20,6 +31,8 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	int result = 0, err;
 
 	for_each_gt(gt, xe, id) {
+		if (!pf_needs_provisioning(gt, num_vfs))
+			continue;
 		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
-- 
2.43.0

