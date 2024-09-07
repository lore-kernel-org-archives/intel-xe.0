Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44575EB64CA
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E7B10EB42;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQurO8SI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BBA10EB29
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4YID2ewG1BoUZKBIV+lCmZrGKjrusuOzP2cJ4iPZeY=;
 b=OQurO8SIyW+gHUmTl6e/mH9gQBqHkWCH4VPkt2PpIoGwLL2HqJrQcIu4
 59YbKup/RP52nl0mDndbH4iGH8nvwcahQSng3ea9zGkPiM0XUxMe/zKz7
 9piwdkVYjQYCcz5itywrtGAr/IwGGFP23lVmunXC7O4bLcF3Fyo0xk4zB
 vEBeFRX7v6OPM2WeYHSGfOJ11AnqQsSTGDomoMTj3MAIzkpm09s4dDL68
 WeZjaPMuXiLoQ0CJp4nK/JtsmDEnduQx4XO9SYP7UjizjUEijsPQrBra2
 Jfa/WLLHlZ3+UwSCf8cOtaaPvmjbK8fuVl825EWxjafgEZDS82+RltFWZ w==;
X-CSE-ConnectionGUID: btBNdnmTTJiJhOI+ovTdVw==
X-CSE-MsgGUID: RmMPrIRYTUGxcaKM1d5d+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855294"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: jls6KIlOTCqLgmlnnWHLHw==
X-CSE-MsgGUID: tk31GW6sTZudCWgUBDkk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792627"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 04/43] drm/xe: Move GSI offset adjustment fields into
 'struct xe_mmio'
Date: Fri,  6 Sep 2024 17:07:53 -0700
Message-ID: <20240907000748.2614020-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index ecf95801743d..85ef36c5d040 100644
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
+	/** adj_limit: adjust MMIO address if address is below this value */
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

