Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CEFC4829E
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 20:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F4005112DEC;
	Tue,  6 Feb 2024 20:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6GUl806";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9A1112DE9
 for <Intel-Xe@lists.freedesktop.org>; Tue,  6 Feb 2024 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707250895; x=1738786895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwWEOlpA71o0gXoVENeTcxl4V5RVSfrq168HdygQrKE=;
 b=F6GUl806nY+rq1lLQ1JbhtzzIOWg/v+fTZPT+YdCLTaEXCVcEwkt8Krl
 pcS4/70vT83KLkvqjNPSuYn65rYjdOliO6cGM8OLzBVUd50qvo9P9e239
 cJ7GHMSv6rmgLnNwDfgXOCjcNaqH9gsBzwjmuD2PdQeEL1s+aIQ4pxTvU
 0kBT0beC6+wWdUR+QHB3x91u5Y1K4p5r10hY4F0MqgdLhNnXiRbdR8SsZ
 WCejWuM7EcIB3gdnKHaONnIRuNZFzOA0+OkgdzaaDiZYmnEvC0YVFknUJ
 R7iV5gKlmdTQDzhSLYInMBavVMOoy/cWXwOP1RBbgyXKbGmvBFPev+gtd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="747412"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="747412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1119431"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2024 12:14:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/2] drm/xe: Make read_perf_limit_reasons globally accessible
Date: Tue,  6 Feb 2024 12:11:50 -0800
Message-ID: <20240206201153.2773996-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Other driver code beyond the sysfs interface wants to know about
throttling. So move the query function out of sysfs.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c           | 18 +++++++++++--
 drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index e5b0f4ecdbe8..4cf7772c387f 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -3,15 +3,17 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include "xe_gt_freq.h"
-
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device_types.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+#include "xe_gt_freq.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
@@ -220,3 +222,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
 
 	xe_gt_throttle_sysfs_init(gt);
 }
+
+u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
+{
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+	else
+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+
+	return reg;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
index f3fe3c90491a..89be518b4967 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.h
+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
@@ -6,8 +6,12 @@
 #ifndef _XE_GT_FREQ_H_
 #define _XE_GT_FREQ_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 void xe_gt_freq_init(struct xe_gt *gt);
 
+u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
index 63d640591a52..89d9f89962ad 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -8,6 +8,7 @@
 #include <regs/xe_gt_regs.h>
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_freq.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_mmio.h"
@@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
 	return kobj_to_gt(dev->kobj.parent);
 }
 
-static u32 read_perf_limit_reasons(struct xe_gt *gt)
-{
-	u32 reg;
-
-	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
-	else
-		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
-
-	return reg;
-}
-
 static u32 read_status(struct xe_gt *gt)
 {
-	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
 
 	return status;
 }
 
 static u32 read_reason_pl1(struct xe_gt *gt)
 {
-	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
 
 	return pl1;
 }
 
 static u32 read_reason_pl2(struct xe_gt *gt)
 {
-	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
 
 	return pl2;
 }
 
 static u32 read_reason_pl4(struct xe_gt *gt)
 {
-	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
 
 	return pl4;
 }
 
 static u32 read_reason_thermal(struct xe_gt *gt)
 {
-	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
 
 	return thermal;
 }
 
 static u32 read_reason_prochot(struct xe_gt *gt)
 {
-	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
 
 	return prochot;
 }
 
 static u32 read_reason_ratl(struct xe_gt *gt)
 {
-	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
 
 	return ratl;
 }
 
 static u32 read_reason_vr_thermalert(struct xe_gt *gt)
 {
-	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
 
 	return thermalert;
 }
 
 static u32 read_reason_vr_tdc(struct xe_gt *gt)
 {
-	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
 
 	return tdc;
 }
-- 
2.43.0

