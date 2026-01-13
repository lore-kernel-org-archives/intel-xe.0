Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77259D30CFF
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AD110E57E;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uz4fdgV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6BE10E569
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ow4dc7eFMN30QpVeCX69HBacqCY0Vi2WORNL2v1qC6w=;
 b=Uz4fdgV+h6Z/juewqa027F8W4b0yzYVULERIPmpxJjRDksC38AAdGecq
 66W3TdRgpdusEex1Ge0rFA8Z/jOWWICAE6BNRHIwRJHG/9LpKCK/9x3bq
 Y+z0L7VpDrwEhYGNB1RCDMT4W3K9fY4A6cf8MeTgYq6MA4omVQEQHyJPs
 YFpScVuABJmhaDJfq5vKktIYs7Dd82pDtDBisP19L34g/Eg8dsZWP1cOv
 lm6p+t22XperfvgJM9DBArWiRokADDXfRCSll8hKgCs/hPWBttzSGytQS
 b9xtxB+q7uhaAJWK1tPUGibThmFzREUNQofsenev/EJ6dROIUjlQAnfna A==;
X-CSE-ConnectionGUID: p8ZI0qPeTeqNtkFJdNcJgw==
X-CSE-MsgGUID: NyQ4ImQZRSik5qKygQd9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311136"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: zoy+ne/RRvSQvdO4fQ74Jw==
X-CSE-MsgGUID: G3kuwG/WSCaXy8IVaAn+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147375"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 31/79] drm/xe: Simplify header in xe_guc_log.c
Date: Tue, 13 Jan 2026 15:03:36 -0800
Message-ID: <20260113230315.3081153-112-matthew.d.roper@intel.com>
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

xe_guc_log.c only needs xe_gt_types.h; it doesn't use anything from
xe_gt.h.  Replace the include to reflect this.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index d7473b9673bb..acac66a4eca7 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -15,8 +15,8 @@
 #include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
-- 
2.52.0

