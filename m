Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D883C4829E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 00:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3D010E742;
	Tue, 13 Feb 2024 00:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcQikoak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3485110E5BE
 for <Intel-Xe@lists.freedesktop.org>; Tue, 13 Feb 2024 00:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707784613; x=1739320613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WacaOvoPd0m4A110dRjePNrH/BQ8FTVb1+oVTBRk9jg=;
 b=CcQikoaki57+o4+PVZecm+GqlzqXaWfGrXxNYYbR5/t/FMGNdhJgNvcG
 FKpvc07bZELkzJyHlsh5WEvmom3T0kgYfA8JDEFFbWgqOrEIgAbfwuSuz
 QZnJuSujsA2lsv2xtqBrUI/XtTXu163r262uXOEUYPY5Zls3ngbki2rfH
 2OLY4QADj+w9JnnadHDuG4VoUurFZqwByjxRNGOxW344d01yrNEBPgYsp
 uNOY2/NpYQ8fmuL5vTEz3xbC3Gz0ql5zsElR+0naUbq5CkJl/35UTRmhw
 cPUJQRP6K4MSLY0ix4QYvO9isiVegyiT6BlQwi9k8G6HZt/9LMxrDEhZv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1923026"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1923026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 16:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7479351"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 12 Feb 2024 16:36:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Date: Mon, 12 Feb 2024 16:34:25 -0800
Message-ID: <20240213003426.3943662-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
 drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
 drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index e5b0f4ecdbe8..51645a24009e 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -11,7 +11,10 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device_types.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
@@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
 
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

