Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5063CC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1692C10E7A5;
	Wed,  9 Jul 2025 10:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYcBY3dE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACDC10E7A5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752058580; x=1783594580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LInGAV5IP7CEQDYZFnrFjkzXWq03Mm2GXg2UwXCu13o=;
 b=XYcBY3dESgrjyD00d7/AQIH9i7t+nCbqmaQNR0NpVrmcYKgyL9Gj8wj2
 lu6ChygVpMYZ/EsDJUobEv4m3MDo/HjUlTrc5yvMqhexqEbuZkuf5ty0n
 Srp+EDI2SNk/JyXhbfT/wm/zbWuu/BDghTNLQkDhiTUpmlbim/m3QitkU
 oUeI6BiZyOXq2RtJjvXZ+WQfM3Mnti/c11fdrxuRJOS0Vyb1pqvE+Hn9l
 7bHizuCJEmtTB4Ovv7PM/CPLpbqm9l9QmlEJCTjH8xG/yBO6zUu3eyKMj
 E6Qh7qpiGE77gxaT6gIo3WweGtv52tcsl8kwBUD4/MhNgpMOXMRsjmDCq g==;
X-CSE-ConnectionGUID: MRsYtc/1Tb6X3MWk/D/tkw==
X-CSE-MsgGUID: r43UmdgzSyGpBk410rMhNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54288524"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54288524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:56:20 -0700
X-CSE-ConnectionGUID: kEq8mlKgQVeqhrlSmbJUPw==
X-CSE-MsgGUID: cQt19u2lTnKxDHUOTZbXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="192936489"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:56:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v4 9/9] drm/xe/xe_hw_error: Add fault injection to trigger csc
 error handler
Date: Wed,  9 Jul 2025 16:50:21 +0530
Message-ID: <20250709112024.1053710-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250709112024.1053710-1-riana.tauro@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
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
index 7cc9b8a7fa1a..2d56a93b3a71 100644
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
@@ -13,6 +15,7 @@
 #include "xe_survivability_mode.h"
 
 #define  HEC_UNCORR_FW_ERR_BITS 4
+extern struct fault_attr inject_csc_hw_error;
 
 /* Error categories reported by hardware */
 enum hardware_error {
@@ -43,6 +46,11 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
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
@@ -134,6 +142,9 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
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

