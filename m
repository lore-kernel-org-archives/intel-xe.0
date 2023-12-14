Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C12C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5680310E2EA;
	Thu, 14 Dec 2023 18:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8810E1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579649; x=1734115649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sxt6ts6P5cU8LhtUN/kvEpmT09hcOSJe6w0tZvVY0wg=;
 b=eJuzbzwkOC9FdW7K5RiXrYakfYrIP8omXb01XPewf/ZRYgG97cJ0226k
 zA3kKDeYsZUuAdFBcnPIP5PsaiCyZ5afai0FpEyNyYkurpqPxPdC4tZPR
 0CXZWpezMaoIjYP51djhHhZCfgunb1BSwG28fIeGlBOVrg01DOoU9xG2R
 acZF1q+FnStrfkk8DD6m37zQ1RPMVsBFKp8TyIslsnxFm3fhSePeee9We
 I4vkcM8fSAXpFBUXk3LMLdaRsP0NKxJFsNSMSo0ClaVIFJN7onkpyKorh
 JXHcMT7nT08Z0DJZnFTMQJeUQGdiIt2Pf9hxxnXdUsJkaguZv8LEQVYbF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953936"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953936"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581858"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581858"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 8/8] drm/xe: Drop some unnecessary header includes
Date: Thu, 14 Dec 2023 10:47:08 -0800
Message-ID: <20231214184659.2249559-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Several files were including register headers that they no longer
require.  Drop the unnecessary includes to reduce build dependencies.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 1 -
 drivers/gpu/drm/xe/xe_ggtt.c     | 1 -
 drivers/gpu/drm/xe/xe_heci_gsc.c | 1 -
 drivers/gpu/drm/xe/xe_lrc.c      | 2 --
 drivers/gpu/drm/xe/xe_pci.c      | 1 -
 drivers/gpu/drm/xe/xe_ring_ops.c | 1 -
 6 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index d82b50de144e..507b6baec3dc 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -12,7 +12,6 @@
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
-#include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 374ae4289fa0..3efd2d066bf7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -11,7 +11,6 @@
 #include <drm/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 19eda00d5cc4..bfdd33b9b23b 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -8,7 +8,6 @@
 #include <linux/pci.h>
 #include <linux/sizes.h>
 
-#include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d6dfbd0bdc70..b7fa3831b684 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -9,9 +9,7 @@
 #include "instructions/xe_gfxpipe_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
-#include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
-#include "regs/xe_regs.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b75b629db886..1f997353a78f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -15,7 +15,6 @@
 #include <drm/drm_drv.h>
 #include <drm/xe_pciids.h>
 
-#include "regs/xe_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_display.h"
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 1201e42ef823..1e4c06eacd98 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -11,7 +11,6 @@
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
-#include "regs/xe_regs.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
-- 
2.43.0

