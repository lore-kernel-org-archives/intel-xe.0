Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FC3C7EE30
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA3F10E340;
	Mon, 23 Jun 2025 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fD54inRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319A10E33E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671472; x=1782207472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hHOSXLa+lUM3NYLPFkcOCX3BNFhWnaWzeT1p1Z3fXi8=;
 b=fD54inRIjJNvBFu76JPU6aBJq6dzMSyZQ0a1gJZaxvq3jy2X5Nw7ot0e
 HIAORi6ZD8Ov31kVE1XQKY3whC+WXfhc0BFb9ow2bSdyXSYgXKcWzeiK8
 6Kgx/O9sTBRF9o5NknyFkrKl8UtcuMW3OEWN2E34wOtWGwB04/YJzFSdi
 8mFj2eb+3qBSfuHC8ZP21iDpUKsRL4+yi1Xd7jLPd2pvn4I5fh+TWB4jE
 9jF87uMQ0J3F3U7lArh/ahjt5whOH73nF3jIt9oV3RAjerV/2HUdlVqoN
 onoS7BGduuWT3DmPYZi3Hr2RsoXptS2e0B3WlD6PLxs5uCaPi+hbyNVhE w==;
X-CSE-ConnectionGUID: vuhvR/yxQbqHU2ZRDVRbeQ==
X-CSE-MsgGUID: 23CUsMP3QMW3g1As4z2O6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740335"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:52 -0700
X-CSE-ConnectionGUID: 93cswjK6S3SNLQaJsdk3DA==
X-CSE-MsgGUID: 0/Oyfq7hTnOVHlqLpufxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152057648"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH v2 5/5] drm/xe/xe_hw_error: Add fault injection to trigger csc
 error handler
Date: Mon, 23 Jun 2025 15:31:08 +0530
Message-ID: <20250623100109.1086459-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250623100109.1086459-1-riana.tauro@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
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

Add a debugfs fault handler to trigger csc error handler that
wedges the device and sends drm uevent

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c  |  2 ++
 drivers/gpu/drm/xe/xe_hw_error.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..134610437aea 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -29,6 +29,7 @@
 #endif
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
+DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
@@ -273,4 +274,5 @@ void xe_debugfs_register(struct xe_device *xe)
 	xe_pxp_debugfs_register(xe->pxp);
 
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+	fault_create_debugfs_attr("inject_csc_hw_error", root, &inject_csc_hw_error);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index ad1e244ea612..544d28c799dc 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/fault-inject.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -12,6 +14,7 @@
 #include "xe_mmio.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
+extern struct fault_attr inject_csc_hw_error;
 
 /* Error categories reported by hardware */
 enum hardware_error {
@@ -42,6 +45,11 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
 	}
 }
 
+static bool fault_inject_csc_hw_error(void)
+{
+	return should_fail(&inject_csc_hw_error, 1);
+}
+
 static void csc_hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
@@ -131,6 +139,9 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
 	enum hardware_error hw_err;
 
+	if (fault_inject_csc_hw_error())
+		schedule_work(&tile->csc_hw_error_work);
+
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
 		if (master_ctl & ERROR_IRQ(hw_err))
 			hw_error_source_handler(tile, hw_err);
-- 
2.47.1

