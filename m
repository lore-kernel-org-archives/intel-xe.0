Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C047EE01F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9C410E933;
	Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPs9gJUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130010E933
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012046; x=1757548046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hJ7gBzrv0jx2pQTkb7g23X8fIiuGpA98qVwLgTBwyLU=;
 b=HPs9gJUzZZID64Xjuxok+Do2QW2KoIGh/r0hWlfcgsQaRY2PDC2OeY0K
 KlmdARBBoUHIAzkxUuXCDrsOkl36uftCs1qR4H2nn2i4+hZ8R4svJeNAz
 3kp7bOd7mqgMXjLhN5IAgSjujVUxcRKstbreplCiu0+una51wfEgfOdhB
 gsmPI4T7rUzy11PpRc3ppqroe8iZCJ/LayUBLexAN9iGhWs/lVFPP0y+a
 c6m9E2r9byQik+Tj5ahJmezE1kV8b3QKHWLg8Cihh+pjYtb/cMQ+USvKm
 R8RUEXaQPr9zxy9W/eV+ZSP8KjSC/6UOuXrbjMrIIEKIH17434DKCIvyU Q==;
X-CSE-ConnectionGUID: bW4XD4VdRmGnoDwNHJheQw==
X-CSE-MsgGUID: qlpBi1BNRMqzvFxbb2bDIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144295"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: UAhHoAzVRF++5mkI+EY/uA==
X-CSE-MsgGUID: 3VICaa9jTUyByeAAMbpbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989538"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 04/43] drm/xe: Move GSI offset adjustment fields into
 'struct xe_mmio'
Date: Tue, 10 Sep 2024 16:47:24 -0700
Message-ID: <20240910234719.3335472-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

By moving the GSI adjustment fields into 'struct xe_mmio' we can replace
the GT's MMIO substructure with another instance of xe_mmio.  At the
moment this means MMIO operations wind up pulling information from two
different places (the tile's xe_mmio for the iomap and the GT's xe_mmio
for the adjustment), but we'll address that in future patches.

The type headers change a bit with this change, meaning that various
files should be including xe_device_types.h instead of (or in addition
to) xe_gt_types.h.

v2:
 - Fix pre-existing kerneldoc typo while moving the fields (Lucas)
v3:
 - Add missing '@' in kerneldoc.  (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h       |  2 +-
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
 drivers/gpu/drm/xe/xe_gt_freq.c      |  2 +-
 drivers/gpu/drm/xe/xe_gt_printk.h    |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     | 11 ++---------
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index e22bbf57fca7..04d6b95c6d87 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -10,7 +10,7 @@
 
 #include <drm/drm_print.h>
 
-#include "xe_device_types.h"
+#include "xe_gt_types.h"
 #include "xe_step.h"
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index ec726dcd5f99..ca8d8ef6342b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -9,6 +9,7 @@
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
+#include "xe_gt_types.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ecf95801743d..347fc5ec55e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,7 +14,6 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
-#include "xe_gt_types.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa.h"
@@ -127,6 +126,12 @@ struct xe_mmio {
 	 * non-register regions such as the GGTT PTEs.
 	 */
 	size_t regs_size;
+
+	/** @adj_limit: adjust MMIO address if address is below this value */
+	u32 adj_limit;
+
+	/** @adj_offset: offset to add to MMIO address when adjusting */
+	u32 adj_offset;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 68a5778b4319..552435951f11 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -11,9 +11,9 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
+#include "xe_gt_types.h"
 #include "xe_guc_pc.h"
 #include "xe_pm.h"
 
diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index d6228baaff1e..5dc71394372d 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -8,7 +8,7 @@
 
 #include <drm/drm_print.h>
 
-#include "xe_device_types.h"
+#include "xe_gt_types.h"
 
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
 	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index dd6bbef0bbcd..a287b98ee70b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_TYPES_H_
 #define _XE_GT_TYPES_H_
 
+#include "xe_device_types.h"
 #include "xe_force_wake_types.h"
 #include "xe_gt_idle_types.h"
 #include "xe_gt_sriov_pf_types.h"
@@ -147,15 +148,7 @@ struct xe_gt {
 	 * register space, but have their own copy of GSI registers at a
 	 * specific offset.
 	 */
-	struct {
-		/**
-		 * @mmio.adj_limit: adjust MMIO address if address is below this
-		 * value
-		 */
-		u32 adj_limit;
-		/** @mmio.adj_offset: offect to add to MMIO address when adjusting */
-		u32 adj_offset;
-	} mmio;
+	struct xe_mmio mmio;
 
 	/**
 	 * @pm: power management info for GT.  The driver uses the GT's
-- 
2.45.2

