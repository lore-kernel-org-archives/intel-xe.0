Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D812CC6FD1F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9925410E48C;
	Mon, 13 Mar 2023 08:04:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1C610E48C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678694646; x=1710230646;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q3W55ut+RewyjK2pyJhKdeMeOPMKtAooAIi8Uwkda/k=;
 b=kc2M8VldczTKzcJoo5vAejeUMA6cDP4QdHdLGH1eGplhlT1OKy0M7lQs
 Bwnm9gIvYG78DsOjWW95dOJPuF+iHwaTibbn3k1/Fc5XNYuIPyteH93ie
 ocrz2fVgd4vXB2LLVYMK27Hl1zup4kwlk6MmZCm/Xoy6jIv4lr+xHmQY1
 7/3JnB0IddDhDOHujN25SxRTmPalAKvGXK5xXU7L0B3dcbBYSMxWM+mDT
 SBphBvwmVtHcbC4ESA3pL15mfJ4cIGA9SIV9IBJezAny+/SwILUuX0kBv
 4pbTAMwQ6Z77V9BNSluoGQj1uDVrXWAwRGrMOjEMuWIKgM8AMVS9dqDz/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334565091"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="334565091"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="680933503"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="680933503"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:04:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:03:56 +0100
Message-Id: <20230313080357.2364-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log messages
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

While debugging GT related problems, it's good to know which GT was
reporting problems. Introduce helper macros to allow prefix GT logs
with GT idetifier. We will use them in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
new file mode 100644
index 000000000000..b12a92024126
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_PRINTK_H_
+#define _XE_GT_PRINTK_H_
+
+#include <drm/drm_print.h>
+#include "xe_gt_types.h"
+
+#define gt_printk(_gt, _level, _fmt, ...) \
+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_err(_gt, _fmt, ...) \
+	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
+
+#define gt_warn(_gt, _fmt, ...) \
+	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
+
+#define gt_notice(_gt, _fmt, ...) \
+	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
+
+#define gt_info(_gt, _fmt, ...) \
+	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
+
+#define gt_dbg(_gt, _fmt, ...) \
+	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
+
+#define gt_err_ratelimited(_gt, _fmt, ...) \
+	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ON(_gt, _condition) \
+	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
+
+#define gt_WARN_ON_ONCE(_gt, _condition) \
+	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
+
+#endif
-- 
2.25.1

