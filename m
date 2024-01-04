Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1905C4707C
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DD810E568;
	Thu,  4 Jan 2024 22:20:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66010E568
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406844; x=1735942844;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9vWwwViP2cC0hEZv7kyKekObWIPM0AGF4riorbttnoA=;
 b=iLnVMuqFqvGdufLggooWpcqjp4JXsXS42m57tJJMEElmmVk86dQ5FWgG
 nvDv0ikl/DW+PXq0sE20JN+Z/OSVmrtAIfng8pUeiE2H4updc+DSWrxfA
 PBMPTw2KTnKdU09EeINiMX6aqIdQRnqE26A/lc7HrRSz4BGq/9RPWbAs7
 4L1Q9ZSLHKh3qiwmkljR4oTiD+CFhwtrZvxa9pkEkw5XsazsQDDDW9hHA
 Yno+XiDcZ8pf3lYSWUEIX749lleE2ojX2FUDGz6WolVc295cfZ27Q5Ove
 WCj8JwDYNwdphXM4H0XhYS0ekS5a86I1BvMZ4Yswxh+bPg9xM+EOuhclq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546851"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022798"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022798"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:43 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 03/10] drm/xe: Introduce GT-oriented SR-IOV logging macros
Date: Thu,  4 Jan 2024 23:20:24 +0100
Message-Id: <20240104222031.277-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
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

To simplify logging and help identify SR-IOV specific messages
related to the GT, define set of helper macros that will add
prefix to the messages based on the current SR-IOV mode.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
new file mode 100644
index 000000000000..17624b16300a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PRINTK_H_
+#define _XE_GT_SRIOV_PRINTK_H_
+
+#include "xe_gt_printk.h"
+#include "xe_sriov_printk.h"
+
+#define __xe_gt_sriov_printk(gt, _level, fmt, ...) \
+	xe_gt_printk((gt), _level, "%s" fmt, xe_sriov_printk_prefix(gt_to_xe(gt)), ##__VA_ARGS__)
+
+#define xe_gt_sriov_err(_gt, _fmt, ...) \
+	__xe_gt_sriov_printk(_gt, err, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_sriov_notice(_gt, _fmt, ...) \
+	__xe_gt_sriov_printk(_gt, notice, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_sriov_info(_gt, _fmt, ...) \
+	__xe_gt_sriov_printk(_gt, info, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_sriov_dbg(_gt, _fmt, ...) \
+	__xe_gt_sriov_printk(_gt, dbg, _fmt, ##__VA_ARGS__)
+
+/* for low level noisy debug messages */
+#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
+#define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) xe_gt_sriov_dbg(_gt, _fmt, ##__VA_ARGS__)
+#else
+#define xe_gt_sriov_dbg_verbose(_gt, _fmt, ...) typecheck(struct xe_gt *, (_gt))
+#endif
+
+#endif
-- 
2.25.1

