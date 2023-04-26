Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84557C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 21:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079B10EA4A;
	Wed, 26 Apr 2023 21:32:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85C610E335
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682544776; x=1714080776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1AMUllHACUQ8IV1HFBvKk57BnrsC2GUKsYAjs9RPuJ0=;
 b=ZENIYRdaCeQ3YEoaLPNNwYQjBJYVJMzPxWG+L3TTzcYD3hOLQbCD16f/
 C0l2vlRF/5/1hDCMU8le4zaul5XN6WZNHzE9qywSwXhCxT0aT0tEdwxu5
 xLPwEvnlTJmOhtrBHkhkaTeASgEK6I6fpc/yd+2+D9wwysnDsGlrcTfi/
 RjfHJU96aNFB0HT3KrOSfSj37KnkC6Z0U86k3T8P5L4M+VQt1pd6EOU1M
 PQTxFoPEOJ1LZDTZB6VPYjk2xu092KDAY0ysmHY94ZQeTGu/6apkxoFJ9
 CEmgxtinfv/OhK12LKF84HCYrR1JEQjhGwaz2vyymdmVEGh7YLEXDes4z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375213090"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375213090"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="644415172"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="644415172"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:32:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Apr 2023 14:32:32 -0700
Message-Id: <20230426213242.1315119-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230426213242.1315119-1-lucas.demarchi@intel.com>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/17] drm/xe/guc: Move GuC registers to regs/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There's no good reason to keep the GuC registers outside the regs/
directory: move the header with GuC registers under that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/{xe_guc_reg.h => regs/xe_guc_regs.h} | 4 ++--
 drivers/gpu/drm/xe/xe_guc.c                             | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                         | 2 +-
 drivers/gpu/drm/xe/xe_huc.c                             | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                           | 2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                           | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/xe/{xe_guc_reg.h => regs/xe_guc_regs.h} (99%)

diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
similarity index 99%
rename from drivers/gpu/drm/xe/xe_guc_reg.h
rename to drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 0cd38d51cc60..011868ff38aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_GUC_REG_H_
-#define _XE_GUC_REG_H_
+#ifndef _XE_GUC_REGS_H_
+#define _XE_GUC_REGS_H_
 
 #include <linux/compiler.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ff2df4f30e97..e00177f4d294 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -6,6 +6,7 @@
 #include "xe_guc.h"
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -15,7 +16,6 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
-#include "xe_guc_reg.h"
 #include "xe_guc_submit.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fd9911ffeae4..fe1d5be1241e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,10 +9,10 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
-#include "xe_guc_reg.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index a9448c6f6418..a1c3e54faa6e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -5,12 +5,12 @@
 
 #include "xe_huc.h"
 
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
-#include "xe_guc_reg.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 97328e441f0f..cd5433b5c970 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -8,11 +8,11 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
-#include "xe_guc_reg.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index c8cc3f5e6154..7b5014aea9c8 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -5,10 +5,10 @@
 
 #include "xe_wopcm.h"
 
+#include "regs/xe_guc_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
-#include "xe_guc_reg.h"
 #include "xe_mmio.h"
 #include "xe_uc_fw.h"
 
-- 
2.40.1

