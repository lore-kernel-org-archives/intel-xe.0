Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2061AD2D11F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C117B10E584;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg88QBbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A1D10E57D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=twKTpPuv/Flrtov2ve3qt3jKLe1x6ItLDRn6ePQn0VM=;
 b=Rg88QBbQaogsRvem78Lpe2RNCwgwn+FE4uevftwI8gTUiyfd8+0dAYSS
 QUctj6b019PGLvuA7rZ10mP6LX8RCEF73n2qFqzucUrwKT9mCnNDxoRjh
 PMlD3khppr91RrOD1lWOYCA6C7Ojkyfk3aGi5m6zeUPZajuzI1vUmWMjw
 vTBwqvhWzQaZ3KpU5mwnWnKzQOP2RsVvdZBaS7CEks+GHMV86h9gz8hBS
 XYrxEsC4msUjSeFCTXtUiL/bNONT0UtPaBUPI5pDlbI+YaEKYBWl4jHDO
 RBY945aOGm0VTITBeKxGYW/gP+6cuDGFkriKJag0OzFUOn4paFba9cmOU Q==;
X-CSE-ConnectionGUID: n/yYbu5FQ1SGdi2qDBdExA==
X-CSE-MsgGUID: BqiF+j2IQ0iFfsKK6dstlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311171"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: BkNQUEkuQGenzYowNNrYCQ==
X-CSE-MsgGUID: mjopXVzRTeyniKL+AFt2UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147449"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 65/79] drm/xe: Cleanup headers in xe_tlb_inval.c
Date: Tue, 13 Jan 2026 15:04:10 -0800
Message-ID: <20260113230315.3081153-146-matthew.d.roper@intel.com>
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

xe_tlb.inval.c doesn't need anything from abi/guc_actions_abi.h,
xe_gt_printk.h, or xe_guc.h.  It also only needs the "types" headers for
GT/device rather than the full headers.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index dec042248164..8f6c2c665d91 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -5,13 +5,10 @@
 
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_abi.h"
-#include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
-#include "xe_guc.h"
+#include "xe_gt_types.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_mmio.h"
-- 
2.52.0

