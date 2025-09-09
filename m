Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE4CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05210E2D6;
	Tue,  9 Sep 2025 16:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ3lyrVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39E10E0B8
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757437198; x=1788973198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uIb5+EQn/mjhpfcU15UbV1vwEj7UMBIdAp2Db4VJf8=;
 b=CZ3lyrVnon8S26W2OqNoGCb2FHs/VuA43AO5eINzmX7gPIYWNuU2zBes
 nDA+nkR5G4kiFOiGxdk6/oQkYVH01WxVuS4lT8gH2XX5bCQx0b9UlmpIf
 im3Bkh83WKrichBKHRnXD8mgFK1CDGoFQ7KSyCZGFkKO/oj6mTxB/I6UX
 dyARyAEOv+XfV+LgDxYgwQM53dkZJdIdEtUmbiIQOD56REnPMsZe1PwkY
 1chN+RdErpQAKNvESdu+7n89JwI3YXF/EpOVs5r+xi/mFFf5h5glDhQKP
 tMdQ4KCUcLwKY5bi9NOs2U5UXTDMBUqXHonFW1Ggk3vWswjhT3cVvpQym Q==;
X-CSE-ConnectionGUID: p7sDtmNpTTG9FJ3JRYY5Gw==
X-CSE-MsgGUID: rmD3AGstRPWQcAFBJnWMPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71148960"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71148960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:58 -0700
X-CSE-ConnectionGUID: BPpBpwQHQTGr9tlWtkYqmw==
X-CSE-MsgGUID: 6/Mrhi6ZQHSH5U8OyMnc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177426213"
Received: from dopitz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 4/5] drm/xe: Add dedicated printk macros for tile and device
Date: Tue,  9 Sep 2025 18:59:38 +0200
Message-ID: <20250909165941.31730-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909165941.31730-1-michal.wajdeczko@intel.com>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: use uppercase for FMT macro (Rodrigo)
---
 drivers/gpu/drm/xe/xe_gt_printk.h   |  11 ++-
 drivers/gpu/drm/xe/xe_printk.h      | 129 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_printk.h | 127 +++++++++++++++++++++++++++
 3 files changed, 261 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index dcc45628cca9..1313d32862db 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -6,14 +6,13 @@
 #ifndef _XE_GT_PRINTK_H_
 #define _XE_GT_PRINTK_H_
 
-#include <drm/drm_print.h>
-
 #include "xe_gt_types.h"
+#include "xe_tile_printk.h"
 
 #define __XE_GT_PRINTK_FMT(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
 
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
-	drm_##_level(&gt_to_xe(_gt)->drm, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
+	xe_tile_printk((_gt)->tile, _level, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
@@ -37,7 +36,7 @@
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
 #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
-	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
+	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
 
 #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
 	xe_gt_WARN_type((_gt),, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
@@ -72,9 +71,9 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
 
 	/*
 	 * The original xe_gt_dbg() callsite annotations are useless here,
-	 * redirect to the tweaked drm_dbg_printer() instead.
+	 * redirect to the tweaked xe_tile_dbg_printer() instead.
 	 */
-	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
+	dbg = xe_tile_dbg_printer((gt)->tile);
 	dbg.origin = p->origin;
 
 	drm_printf(&dbg, __XE_GT_PRINTK_FMT(gt, "%pV", vaf));
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
new file mode 100644
index 000000000000..c5be2385aa95
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
+#define __XE_PRINTK_FMT(_xe, _fmt, _args...)	_fmt, ##_args
+
+#define xe_printk(_xe, _level, _fmt, ...) \
+	drm_##_level(&(_xe)->drm, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
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
+	xe_WARN_type((_xe),, _condition, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
+
+#define xe_WARN_ONCE(_xe, _condition, _fmt, ...) \
+	xe_WARN_type((_xe), _ONCE, _condition, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
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
+	drm_printf(&ddp, __XE_PRINTK_FMT(xe, "%pV", vaf));
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
index 000000000000..63640a42685d
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
+#define __XE_TILE_PRINTK_FMT(_tile, _fmt, _args...)	"Tile%u: " _fmt, (_tile)->id, ##_args
+
+#define xe_tile_printk(_tile, _level, _fmt, ...) \
+	xe_printk((_tile)->xe, _level, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
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
+	xe_tile_WARN_type((_tile),, _condition, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
+
+#define xe_tile_WARN_ONCE(_tile, _condition, _fmt, ...) \
+	xe_tile_WARN_type((_tile), _ONCE, _condition, __XE_TILE_PRINTK_FMT((_tile), _fmt, ##__VA_ARGS__))
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
+	drm_printf(&dbg, __XE_TILE_PRINTK_FMT(tile, "%pV", vaf));
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

