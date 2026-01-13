Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC03D30CEE
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04E010E562;
	Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDlp5UnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4C310E562
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345419; x=1799881419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kfqFsQ9QvrRh9Y7kjIjg2li9IQHLcQL1wcEX8kn7WX8=;
 b=FDlp5UnU9Pzg1B/K3Tz6LI4m+rlR+6w+pZEhyEVImIsxoFlzf9uY0Dzi
 RNegFiGeEXOaR5i9LeFncYoP3VNSYnN+giH0vcZ7ajlAwOhCzFWG4jOnu
 qO+D+vNXqrUQnN/BkdZdF1raHi6tfu74PJUJGIdWiamEQQXtLdWPnPfs2
 EFKQToWkU/okXIsnUZG8TPsEStYlkS70k1XAl7irPbxu7kNzNGt4JFdI2
 OkIeIZ1GLHo9auA6eov5WU1I2L4p4/V+NNj4KSXdyaLNYvJdkzt3BcaOR
 Q0EO2Czwo2HfZP0i16IVV6JmnFIcWpPUb5sYaEhFF6rN+7rEGsIub53eK A==;
X-CSE-ConnectionGUID: pJg8YCHnQRONt6qJCzBo8w==
X-CSE-MsgGUID: JoQ7q1GYRr24t/JKoVYaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311105"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
X-CSE-ConnectionGUID: J8G0eYTOTMm+SwO7dFmFqg==
X-CSE-MsgGUID: LO8qBoc9T3qZmImTVMCy0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147258"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 03/79] drm/xe: Cleanup headers in xe_devcoredump.c
Date: Tue, 13 Jan 2026 15:03:08 -0800
Message-ID: <20260113230315.3081153-84-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113230315.3081153-81-matthew.d.roper@intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
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

The devcoredump code only needs xe_gt_types.h, not xe_gt.h and doesn't
use anything from xe_module.h.  Drop/replace the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7263c2a5f3a8..cf41bb6d2172 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -15,14 +15,13 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
-#include "xe_module.h"
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
-- 
2.52.0

