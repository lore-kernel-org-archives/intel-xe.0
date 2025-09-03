Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84768CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DE010E94A;
	Wed,  3 Sep 2025 21:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb1NvKIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2827E10E94A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935449; x=1788471449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQjvSbgnYp4YDMVWOFhFE+E99GJH/yFJtlTYlkOzyQU=;
 b=Tb1NvKIMPuDehC/Nhkp66Z6kMxY+FgN9P2XherybwkYAwaewfrZEQk77
 A2NIx2clHNOdmwZxAXxqIpxFqbKZ73tsQCkqBkEnoZmvKaJE+CiHRt1pU
 eesVCJsM7kxWcSAwZUssXn9foN1vDDmJQv0fHbO30WaUF1YvYJyBUhd0t
 G08SgSY6L0Xzb28VahbD5XEjMJo8/FTi0z8IRap/wrLXVza055OOEsObb
 bKcGb/ujZ05cxGW1/nqKZkgHkohvfuApW6g3VqlriwCkjIYq3Bsfm55J0
 cofsAiqxV6i1R9hwn21Xs3hh2Hi6Xf4Xc9OAb+eyrY1W1TqoD4gOWhC3/ w==;
X-CSE-ConnectionGUID: /iq3Qr82QGuDopdgjxN+lw==
X-CSE-MsgGUID: 9fXcwbjARfyo0fe2wL7Epw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178984"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:29 -0700
X-CSE-ConnectionGUID: /Afy9yxuTemu6R2qLSpOHQ==
X-CSE-MsgGUID: BAD1g7+CSYKhTxniUCVNHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957558"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/7] drm/xe: Add dedicated printk macros for tile and device
Date: Wed,  3 Sep 2025 23:36:09 +0200
Message-ID: <20250903213712.6364-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903213712.6364-1-michal.wajdeczko@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
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

We already have dedicated helper macros for printing GT-oriented
messages but we don't have any to print messages that are tile
oriented and we wrongly try to use plain drm or GT-oriented ones.

Add tile-oriented printk messages and to provide similar coverage
as we have with xe_assert() macros. Also add set of simple macros
for the top level xe_device, which we could easily tweak to include
extra device specific info if needed.

Typical output of our printk macros will look like:

 [drm] this is xe_WARN()
 [drm] *ERROR* this is xe_err()
 [drm] *ERROR* this is xe_err_printer()
 [drm] this is xe_info()
 [drm] this is xe_info_printer()
 [drm:printk_demo.cold] this is xe_dbg()
 [drm:printk_demo.cold] this is xe_dbg_printer()

 [drm] Tile0: this is xe_tile_WARN()
 [drm] *ERROR* Tile0: this is xe_tile_err()
 [drm] *ERROR* Tile0: this is xe_tile_err_printer()
 [drm] Tile0: this is xe_tile_info()
 [drm] Tile0: this is xe_tile_info_printer()
 [drm:printk_demo.cold] Tile0: this is xe_tile_dbg()
 [drm:printk_demo.cold] Tile0: this is xe_tile_dbg_printer()

 [drm] Tile0: GT0: this is xe_gt_WARN()
 [drm] *ERROR* Tile0: GT0: this is xe_gt_err()
 [drm] *ERROR* Tile0: GT0: this is xe_gt_err_printer()
 [drm] Tile0: GT0: this is xe_gt_info()
 [drm] Tile0: GT0: this is xe_gt_info_printer()
 [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg()
 [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg_printer()

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h   |  11 ++-
 drivers/gpu/drm/xe/xe_printk.h      | 129 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_printk.h | 127 +++++++++++++++++++++++++++
 3 files changed, 261 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5aaacaa6780c..8dc4217ddb4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -6,14 +6,13 @@
 #ifndef _XE_GT_PRINTK_H_
 #define _XE_GT_PRINTK_H_
 
-#include <drm/drm_print.h>
-
 #include "xe_gt_types.h"
+#include "xe_tile_printk.h"
 
 #define __xe_gt_printk_fmt(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
 
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
-	drm_##_level(&gt_to_xe(_gt)->drm, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
+	xe_tile_printk((_gt)->tile, _level, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
@@ -37,7 +36,7 @@
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
 #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
-	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
+	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
 
 #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
 	xe_gt_WARN_type((_gt),, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
@@ -72,9 +71,9 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
 
 	/*
 	 * The original xe_gt_dbg() callsite annotations are useless here,
-	 * redirect to the tweaked drm_dbg_printer() instead.
+	 * redirect to the tweaked xe_tile_dbg_printer() instead.
 	 */
-	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
+	dbg = xe_tile_dbg_printer((gt)->tile);
 	dbg.origin = p->origin;
 
 	drm_printf(&dbg, __xe_gt_printk_fmt(gt, "%pV", vaf));
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
new file mode 100644
index 000000000000..691d3611b889
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PRINTK_H_
+#define _XE_PRINTK_H_
+
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+
+#define __xe_printk_fmt(_xe, _fmt, _args...)	_fmt, ##_args
+
+#define xe_printk(_xe, _level, _fmt, ...) \
+	drm_##_level(&(_xe)->drm, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
+
+#define xe_err(_xe, _fmt, ...) \
+	xe_printk((_xe), err, _fmt, ##__VA_ARGS__)
+
+#define xe_err_once(_xe, _fmt, ...) \
+	xe_printk((_xe), err_once, _fmt, ##__VA_ARGS__)
+
+#define xe_err_ratelimited(_xe, _fmt, ...) \
+	xe_printk((_xe), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define xe_warn(_xe, _fmt, ...) \
+	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
+
+#define xe_notice(_xe, _fmt, ...) \
+	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
+
+#define xe_info(_xe, _fmt, ...) \
+	xe_printk((_xe), info, _fmt, ##__VA_ARGS__)
+
+#define xe_dbg(_xe, _fmt, ...) \
+	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
+
+#define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
+	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
+
+#define xe_WARN(_xe, _condition, _fmt, ...) \
+	xe_WARN_type((_xe),, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
+
+#define xe_WARN_ONCE(_xe, _condition, _fmt, ...) \
+	xe_WARN_type((_xe), _ONCE, _condition, __xe_printk_fmt((_xe), _fmt, ## __VA_ARGS__))
+
+#define xe_WARN_ON(_xe, _condition) \
+	xe_WARN((_xe), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
+
+#define xe_WARN_ON_ONCE(_xe, _condition) \
+	xe_WARN_ONCE((_xe), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
+
+static inline void __xe_printfn_err(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_device *xe = p->arg;
+
+	xe_err(xe, "%pV", vaf);
+}
+
+static inline void __xe_printfn_info(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_device *xe = p->arg;
+
+	xe_info(xe, "%pV", vaf);
+}
+
+static inline void __xe_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_device *xe = p->arg;
+	struct drm_printer ddp;
+
+	/*
+	 * The original xe_dbg() callsite annotations are useless here,
+	 * redirect to the tweaked drm_dbg_printer() instead.
+	 */
+	ddp = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
+	ddp.origin = p->origin;
+
+	drm_printf(&ddp, __xe_printk_fmt(xe, "%pV", vaf));
+}
+
+/**
+ * xe_err_printer - Construct a &drm_printer that outputs to xe_err()
+ * @xe: the &xe_device pointer to use in xe_err()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_err_printer(struct xe_device *xe)
+{
+	struct drm_printer p = {
+		.printfn = __xe_printfn_err,
+		.arg = xe,
+	};
+	return p;
+}
+
+/**
+ * xe_info_printer - Construct a &drm_printer that outputs to xe_info()
+ * @xe: the &xe_device pointer to use in xe_info()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_info_printer(struct xe_device *xe)
+{
+	struct drm_printer p = {
+		.printfn = __xe_printfn_info,
+		.arg = xe,
+	};
+	return p;
+}
+
+/**
+ * xe_dbg_printer - Construct a &drm_printer that outputs like xe_dbg()
+ * @xe: the &xe_device pointer to use in xe_dbg()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_dbg_printer(struct xe_device *xe)
+{
+	struct drm_printer p = {
+		.printfn = __xe_printfn_dbg,
+		.arg = xe,
+		.origin = (const void *)_THIS_IP_,
+	};
+	return p;
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
new file mode 100644
index 000000000000..ed951cdb08cb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_printk.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _xe_tile_printk_H_
+#define _xe_tile_printk_H_
+
+#include "xe_printk.h"
+
+#define __xe_tile_printk_fmt(_tile, _fmt, _args...)	"Tile%u: " _fmt, (_tile)->id, ##_args
+
+#define xe_tile_printk(_tile, _level, _fmt, ...) \
+	xe_printk((_tile)->xe, _level, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
+
+#define xe_tile_err(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), err, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_err_once(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), err_once, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_err_ratelimited(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_warn(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), warn, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_notice(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), notice, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_info(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), info, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_dbg(_tile, _fmt, ...) \
+	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
+
+#define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
+	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
+
+#define xe_tile_WARN(_tile, _condition, _fmt, ...) \
+	xe_tile_WARN_type((_tile),, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
+
+#define xe_tile_WARN_ONCE(_tile, _condition, _fmt, ...) \
+	xe_tile_WARN_type((_tile), _ONCE, _condition, __xe_tile_printk_fmt((_tile), _fmt, ##__VA_ARGS__))
+
+#define xe_tile_WARN_ON(_tile, _condition) \
+	xe_tile_WARN((_tile), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
+
+#define xe_tile_WARN_ON_ONCE(_tile, _condition) \
+	xe_tile_WARN_ONCE((_tile), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
+
+static inline void __xe_tile_printfn_err(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_tile *tile = p->arg;
+
+	xe_tile_err(tile, "%pV", vaf);
+}
+
+static inline void __xe_tile_printfn_info(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_tile *tile = p->arg;
+
+	xe_tile_info(tile, "%pV", vaf);
+}
+
+static inline void __xe_tile_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
+{
+	struct xe_tile *tile = p->arg;
+	struct drm_printer dbg;
+
+	/*
+	 * The original xe_tile_dbg() callsite annotations are useless here,
+	 * redirect to the tweaked xe_dbg_printer() instead.
+	 */
+	dbg = xe_dbg_printer(tile->xe);
+	dbg.origin = p->origin;
+
+	drm_printf(&dbg, __xe_tile_printk_fmt(tile, "%pV", vaf));
+}
+
+/**
+ * xe_tile_err_printer - Construct a &drm_printer that outputs to xe_tile_err()
+ * @tile: the &xe_tile pointer to use in xe_tile_err()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_tile_err_printer(struct xe_tile *tile)
+{
+	struct drm_printer p = {
+		.printfn = __xe_tile_printfn_err,
+		.arg = tile,
+	};
+	return p;
+}
+
+/**
+ * xe_tile_info_printer - Construct a &drm_printer that outputs to xe_tile_info()
+ * @tile: the &xe_tile pointer to use in xe_tile_info()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_tile_info_printer(struct xe_tile *tile)
+{
+	struct drm_printer p = {
+		.printfn = __xe_tile_printfn_info,
+		.arg = tile,
+	};
+	return p;
+}
+
+/**
+ * xe_tile_dbg_printer - Construct a &drm_printer that outputs like xe_tile_dbg()
+ * @tile: the &xe_tile pointer to use in xe_tile_dbg()
+ *
+ * Return: The &drm_printer object.
+ */
+static inline struct drm_printer xe_tile_dbg_printer(struct xe_tile *tile)
+{
+	struct drm_printer p = {
+		.printfn = __xe_tile_printfn_dbg,
+		.arg = tile,
+		.origin = (const void *)_THIS_IP_,
+	};
+	return p;
+}
+
+#endif
-- 
2.47.1

