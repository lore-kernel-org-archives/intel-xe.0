Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB3C79F82
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 01:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DD510E4BC;
	Wed,  9 Sep 2026 01:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SI0PGY+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320F910E4BC
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 01:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788918168; x=1820454168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h5ZeBQBH2emyWcRbO6SB5PfWWIJSVLCI8aUkQas/6xo=;
 b=SI0PGY+Pf3wo26CeZekbCx9F/WYsx0LJeGYUaNdnKcJwaG2mtK8r0a7s
 ViZ/kCrRyCLvz+j3pzN3oi1zTnrj6EVJ3NZ7hfgQiSxXfoU2bDGBdDnLv
 k/koqiyKfOVUm0yYwvxZSIPRMmjAuvKv0qq+5WGD/pvosQRSXgYEN3VKO
 +tA/MvzWNLErrhBugV30POeI+HmXWvkqNgip51jzSSEnyiV9Nl6NvEwXi
 p4yPC1KlqItUVO4dHtJhxiv51zW2gpAiIiB0riMIAeSSi3viDwYEqVDCl
 oOiEEgp82eJiNaX1lsTHVjvxOP1+N5S96gShpxNaZEHxPmYo7HhMK/dmr Q==;
X-CSE-ConnectionGUID: VIRWSVg1Q0eRfsznIEGzIQ==
X-CSE-MsgGUID: 6AkcyYlCQ4OfIgkfIHgEYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114876491"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114876491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 18:42:48 -0700
X-CSE-ConnectionGUID: lX+JrVHsRXCYRUZ7SH3XrQ==
X-CSE-MsgGUID: Im4Mi7c4Q6+BsvpMvHilpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="276388506"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2026 18:42:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: Inspect all forcewake bits for runtime idleness
Date: Tue,  8 Sep 2026 18:37:11 -0700
Message-Id: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Ensure all forcewake bits are clear in the runtime suspend idleness check.
This includes the ones not typically used by Xe KMD as well. Skip suspend
when any of these bits are set, since it could mean someone is trying to
keep the GT awake. Runtime subsystem can retry and succeed when forcewake
bits clear.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Assisted-by: Claude:Claude-Sonnet-5
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_force_wake.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c        |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 197e2197bd0a..167f39946648 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -148,6 +148,33 @@ static int domain_sleep_wait(struct xe_gt *gt,
 	return __domain_wait(gt, domain, false);
 }
 
+/**
+ * xe_force_wake_any_bit_set - Return true if any domain FW bit is set
+ * @fw: struct xe_force_wake
+ *
+ * Check if any FW bit is set across all domains for a given GT.
+
+ * Return: true if any bit in the FW reg is set
+ */
+bool xe_force_wake_any_bit_set(struct xe_force_wake *fw)
+{
+	struct xe_gt *gt = fw->gt;
+	struct xe_force_wake_domain *domain;
+	unsigned int tmp;
+	u32 val;
+
+	for_each_fw_domain(domain, fw, tmp) {
+		val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
+		if (val & 0xFFFF) {
+			xe_gt_info(gt, "FW bit set in domain: %d, val: 0x%x",
+				   domain->id, val);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * xe_force_wake_get() : Increase the domain refcount
  * @fw: struct xe_force_wake
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index e2721f205d6c..2f2924a7f146 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
+bool xe_force_wake_any_bit_set(struct xe_force_wake *fw);
 
 const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..187a39894513 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -1438,9 +1439,14 @@ static int xe_pci_runtime_idle(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_gt *gt;
+	u8 id;
 
 	xe_pm_d3cold_allowed_toggle(xe);
 
+	for_each_gt(gt, xe, id)
+		if (xe_force_wake_any_bit_set(gt_to_fw(gt)))
+			return -EAGAIN;
 	return 0;
 }
 
-- 
2.38.1

