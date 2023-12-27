Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59959C47072
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732C10E1B5;
	Wed, 27 Dec 2023 23:59:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD310E181
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721548; x=1735257548;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LfeiBoD2xM5v0DgFbaDjlyFiSp/pcyh7HkyXjXY1B0M=;
 b=dJvEEMssHjzR8GhIldy7Nt0NlHrWSLAXLL9I4E1onZh0bUCk6rbgoJgA
 YrHfLe3bUrrlStuesHCnri6WkUs5bEKeUak347AnQuPvJo2g9mqBuxaRy
 0ihoAB0X0y6/6LkNgKJ9Cn8g9zZqsBic9qHrp2hC3XRH5AAUi184Oy1PI
 UbjKOB5Yn/54CdGsEkSmWSOt5S5+/DH2VZjOix7yanoPKecBJgwGeuTxL
 c/gzUlapVq4RQXsQTY7rC4ZspeatEoJ1d3U7+yDi73ZFaU+tPkKaITKvI
 B/E/A74nAGlvO9B0dpdXP+8xsZnlBmLF3sLPz2vwAbNxuvRzw107rifMT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329151"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589867"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589867"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/10] drm/xe: Introduce GT-oriented SR-IOV logging macros
Date: Thu, 28 Dec 2023 00:58:31 +0100
Message-Id: <20231227235838.212-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

