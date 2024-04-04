Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F3ECD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FC4113287;
	Thu,  4 Apr 2024 15:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahUaZIDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A50113288
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246206; x=1743782206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hX0nd+Lj/+/a4iuaNP9W6Ed4pL8Xhi4fGI8AGMtMcrQ=;
 b=ahUaZIDkkYuuDKXl19b1X1EOgw9VvrE2pd0cJc9FR80ImN2gKsL2TCtg
 Dsj0sI3nB/LK4QXnORHB78YPtGCSSfTOoxe1z4iiw7E8UZPI1XPPqAKgY
 VwVCJuMq8GxmywFd6++fP1ZjYUwE7GRmq1p24km+D5+wSZ0vcPAvCR6dA
 OIoNHP/7Hw/2/+X5f9nfWkvNXFWmfq9GRzaaDjetEAuze1JwYsGeEu17Q
 +8Yk8JHUMd9hPO4i3ZtG8q2izu66OGMk++7n2MmZxf9iLroxtUujSDmeL
 YhUyuTYJIaaYXwL2Njbtlg6afxdgcgWWR3Um8sxYkrREfiu7LIc6QsahH Q==;
X-CSE-ConnectionGUID: MN5aTDgSSjq5YdgBl9CHsg==
X-CSE-MsgGUID: kPiYXJgiTVOP5/UaH8oIsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8119124"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8119124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:54:45 -0700
X-CSE-ConnectionGUID: i9cg9KsYQvG9nMmW4L1shQ==
X-CSE-MsgGUID: UXoH+1D4S0uSRopYtSPG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41992440"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:44:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe: Add SR-IOV info attribute to debugfs
Date: Thu,  4 Apr 2024 17:44:31 +0200
Message-Id: <20240404154431.583-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404154431.583-1-michal.wajdeczko@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
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

As SR-IOV support varies between platforms and the driver can run
in different SR-IOV modes, add debugfs file with these details.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_sriov.c   | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h   |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..13e13f22ccff 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
 #include "xe_pm.h"
+#include "xe_sriov.h"
 #include "xe_step.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
@@ -70,8 +71,18 @@ static int info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int sriov_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_sriov_print_info(xe, &p);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
+	{ .name = "sriov_info", .show = sriov_info, },
 };
 
 static int forcewake_open(struct inode *inode, struct file *file)
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 94fa98d8206e..d324f131e3da 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -101,3 +101,17 @@ int xe_sriov_init(struct xe_device *xe)
 
 	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
 }
+
+/**
+ * xe_sriov_print_info - Print basic SR-IOV information.
+ * @xe: the &xe_device to print info from
+ * @p: the &drm_printer
+ *
+ * Print SR-IOV related information into provided DRM printer.
+ */
+void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
+{
+	drm_printf(p, "supported: %s\n", str_yes_no(xe_device_has_sriov(xe)));
+	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
+	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 9e3f58874e98..f9dec84d77e3 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -10,9 +10,12 @@
 #include "xe_device_types.h"
 #include "xe_sriov_types.h"
 
+struct drm_printer;
+
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
 
 void xe_sriov_probe_early(struct xe_device *xe);
+void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
-- 
2.43.0

