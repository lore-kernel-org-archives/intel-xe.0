Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF96ECCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7669010E2E1;
	Tue, 30 Sep 2025 23:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2SG04rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD710E144
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275336; x=1790811336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gk8zz+740pv6IjzKdW4nXgrEFZK6RY4VYDOa1oLlTnI=;
 b=T2SG04rqXtgmWVMljTnR1TOBuZ9BA56wAFjmYXt3d3kOHA1Qbt4XCtP+
 oizoOnbiLt/jsLcMoQzEGwSoslF5ZzwdoLmlBy29k09XMzweF5I6paR0j
 UX671bqUuo0hLtY0f4WPvZ9cJ1sV7EWLeOgh51LuS7WfDUXc5NsV08kDW
 vNSji+JQMFT6LaZaSIffFrXWCIBqDgUaXXx5HYcbCW5WiVsbZJ/Ynzt6F
 cNF2qreMjDGGp6ABQILccO3TB6+dNVWnZ8BVUBkMXjds09khBfrQ7CtEJ
 uwTr6HnoLHrQpugQPwjQP2EFDUt0Hmyp3TTTBL1hx9pND8cH1pJg6UheW w==;
X-CSE-ConnectionGUID: 6pgMFmb+RIKN0kRrU2biQw==
X-CSE-MsgGUID: Cv8zTfTXSKaUjjs28jsf/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646723"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:36 -0700
X-CSE-ConnectionGUID: Fcv17KisRDqGmbTStWsHOg==
X-CSE-MsgGUID: YCOe74TYT8SX81eZv1ylwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775500"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/6] drm/xe/pf: Add top level functions to control VFs
Date: Wed,  1 Oct 2025 01:35:19 +0200
Message-ID: <20250930233525.201263-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

We already have control functions that we use to control the VF
state on the per-GT basis, but that is low level detail from the
user point of view, who rather expects VF-level functions.

For now add simple functions that just iterate over all GTs and
call per-GT control function. We will soon allow to use some of
them from the user facing interfaces like debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c        |   8 +-
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 104 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  16 ++++
 4 files changed, 124 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c5d2388997d..84321fad3265 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -174,6 +174,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt_ml.o \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o \
+	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index af05db07162e..9c1c9e669b04 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -17,6 +17,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_printk.h"
 
@@ -60,13 +61,10 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 
 static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
-	struct xe_gt *gt;
-	unsigned int id;
 	unsigned int n;
 
-	for_each_gt(gt, xe, id)
-		for (n = 1; n <= num_vfs; n++)
-			xe_gt_sriov_pf_control_trigger_flr(gt, n);
+	for (n = 1; n <= num_vfs; n++)
+		xe_sriov_pf_control_reset_vf(xe, n);
 }
 
 static struct pci_dev *xe_pci_pf_get_vf_dev(struct xe_device *xe, unsigned int vf_id)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
new file mode 100644
index 000000000000..56c0dd382262
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_sriov_pf_control.h"
+
+/**
+ * xe_sriov_pf_control_pause_vf() - Pause a VF on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier (can't be 0 == PFID)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_pause_vf(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_control_resume_vf() - Resume a VF on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_resume_vf(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_control_stop_vf - Stop a VF on all GTs.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_stop_vf(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
+/**
+ * xe_sriov_pf_control_reset_vf() - Perform a VF reset (FLR).
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_trigger_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
new file mode 100644
index 000000000000..9bf059f746d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_CONTROL_H_
+#define _XE_SRIOV_PF_CONTROL_H_
+
+struct xe_device;
+
+int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+
+#endif
-- 
2.47.1

