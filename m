Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28175CCA470
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D902C10E2AE;
	Sun,  5 Oct 2025 13:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxHq8RU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CA5899A3
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759671413; x=1791207413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wEsR+UKW0LKcb3dfibru/E7oR3fSJYgaP9ja3UP51eI=;
 b=fxHq8RU2QODo7v65PEaLl1L7LJpQu/jwY6nmqKPIp0X0Yfl7R2y1s6oX
 fPWtPumQm5rm+zTemlfEts5J/KZMe7ytB/uE1vaNZyLAQO7MFmyawLDF/
 UnZHkG6wIo7Lvdyhu0S+LDjnedKG/+5kQ6OpXfVm96DU7OyTAb1wLZiwo
 /nYqCerJlhzHcJ9i2+eFcv0YgAAY+xBynxtOQ4bT8xYC4Fatw0o+1yiE5
 cGNAZKag8Kuus3FghyM0x5wwiEUZVKB44p8ILR95nTIqg6xiBmWhh0/c+
 Vq/d+43mQ5r0xRooupHs6VIf7c86SyTh8F5glMxPhzwYR4zviC6H0jmRO w==;
X-CSE-ConnectionGUID: dg2uXfFwSoK2PYS4sDTFNA==
X-CSE-MsgGUID: 1u5ntzrHSKu4uC80no7hmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61779320"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="61779320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:53 -0700
X-CSE-ConnectionGUID: 8mfuaDcGSn2fl+qE4L18Rg==
X-CSE-MsgGUID: tU+Qx87mTUa7bZUW4gk0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="179348602"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/4] drm/xe: Add tile-based SRIOV printk macros
Date: Sun,  5 Oct 2025 15:36:38 +0200
Message-ID: <20251005133641.2651-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005133641.2651-1-michal.wajdeczko@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
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

We already have device and GT level SR-IOV specific macros, but
unlike native case, we don't have yet tile-based ones.

Add macros to match native use case and also update GT-based
macros to rely on those new tile-based SR-IOV macros. This will
slightly rearrange the output of the GT logs and instead:

  [...] Tile0: GT0: PF: pushed VF1 config with 2 KLVs...

we might see:

  [...] PF: Tile0: GT0: pushed VF1 config with 2 KLVs...

but that's even better.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h   |  7 +++--
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 33 +++++++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
index 17624b16300a..d3457d608db8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_printk.h
@@ -7,10 +7,13 @@
 #define _XE_GT_SRIOV_PRINTK_H_
 
 #include "xe_gt_printk.h"
-#include "xe_sriov_printk.h"
+#include "xe_tile_sriov_printk.h"
+
+#define __XE_GT_SRIOV_PRINTK_FMT(_gt, _fmt, ...) \
+	__XE_TILE_SRIOV_PRINTK_FMT((_gt)->tile, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
 
 #define __xe_gt_sriov_printk(gt, _level, fmt, ...) \
-	xe_gt_printk((gt), _level, "%s" fmt, xe_sriov_printk_prefix(gt_to_xe(gt)), ##__VA_ARGS__)
+	xe_sriov_##_level(gt_to_xe(gt), __XE_GT_SRIOV_PRINTK_FMT((gt), fmt, ##__VA_ARGS__))
 
 #define xe_gt_sriov_err(_gt, _fmt, ...) \
 	__xe_gt_sriov_printk(_gt, err, _fmt, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_printk.h b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
new file mode 100644
index 000000000000..68323512872c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_printk.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_TILE_SRIOV_PRINTK_H_
+#define _XE_TILE_SRIOV_PRINTK_H_
+
+#include "xe_tile_printk.h"
+#include "xe_sriov_printk.h"
+
+#define __XE_TILE_SRIOV_PRINTK_FMT(_tile, _fmt, ...) \
+	__XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__)
+
+#define xe_tile_sriov_printk(_tile, _level, _fmt, ...) \
+	xe_sriov_##_level((_tile)->xe, __XE_TILE_SRIOV_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
+
+#define xe_tile_sriov_err(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, err, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_sriov_notice(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, notice, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_sriov_info(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, info, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_sriov_dbg(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, dbg, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_sriov_dbg_verbose(_tile, _fmt, ...) \
+	xe_tile_sriov_printk(_tile, dbg_verbose, _fmt, ##__VA_ARGS__)
+
+#endif
-- 
2.47.1

