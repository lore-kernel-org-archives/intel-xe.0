Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7A0CD37BE
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF2A10E646;
	Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jh/N2w9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7795F10E63A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V68NEb7uuauMYC2OZJYy4vpVm4uXyExp91CoqcONDeY=;
 b=jh/N2w9Brije2ckq9l/OkgblWtBVyzlBahANTmFz1tHEGwZ+QX32OPaG
 DKgwrMCkX/JR0UmMzLVC/yC7lWqtL7mUiY6gPOGbdckwcfjwYuKaWvayJ
 0v6sSQSVs6bRljZ/dK5fi9xICFsebhBAvs1YIpQYv1QSBynrl0ZcxxmhO
 MifSyKVqMpGHNaQCafRT7ks5QpCgtg2M/VYAlSAb2MQvRJfBio8R3TB1b
 +5N0bEmC3xyi/Is2l8CjQ4xlSfV2e9hgaYRW1UhGghhcEeiuQXt2uZd/7
 N5jJjLgjaE3kKp/vUndG9tBMWM3MpchuEB4PnQvrTWdeHAPHjfNXvaxyY w==;
X-CSE-ConnectionGUID: x+BoyrW5R/2X92YRTcUZvw==
X-CSE-MsgGUID: hgeP1EewRcm7uLx9/zuAng==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904791"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
X-CSE-ConnectionGUID: GhHA0J+HQNOEfbr+Q/pUgg==
X-CSE-MsgGUID: zaBqsva6Svix3jgpgnN1aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944202"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 04/43] drm/xe: Move GSI offset adjustment fields into 'struct
 xe_mmio'
Date: Tue,  3 Sep 2024 17:21:05 -0700
Message-ID: <20240904002100.2023834-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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
index 7427f40086e8..e080be9bba52 100644
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
 	size_t regs_length;
+
+	/** adj_limit: adjust MMIO address if address is below this value */
+	u32 adj_limit;
+
+	/** @adj_offset: offect to add to MMIO address when adjusting */
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
index e9026023e240..593bc5aa9a4a 100644
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

