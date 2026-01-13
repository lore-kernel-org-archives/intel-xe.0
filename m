Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB66D30CFC
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7257410E57D;
	Tue, 13 Jan 2026 23:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqkFwoMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E5F10E573
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+oDg+1kbhT+MTPD8b8R21xyHMxyV4riLpfgTfrI1pg=;
 b=RqkFwoMrnSuO55/xhmG4AGYQfO/hCzddVjSj3U4LIvaT+qA96A38F134
 Yf92vw+lNaX0JWFL2piHmHCIdt0aG2PvDX4fUdv2Acgl5ln2RrvUo2hwh
 7ax0KL4vMc4VwhnvLRPkP9J5QAqlZPoiB4/9nVv6BsZUKc5hPrq9DSFgG
 HeVUOaqlpfazQyPl15HSYfclqD5si5EKmzzYgZgI7+Nw5L9MC4bcb/q+/
 8X8rgCCmnjjt+TALDKm6uPzDrrveobnbz9CUrmMR+SLRHiiMFUFk/XSWo
 Y0LS0aagf1Os3qoaz1RigMTpkJw3s/caBjeS1f/1LPjgD6rppW01yek4S A==;
X-CSE-ConnectionGUID: TfHmmTBmRTeWfP1/Jw9tzg==
X-CSE-MsgGUID: Shpz7yk4QKeKhtXEkdu9tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311160"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: tqlRsMB8S46VyBm0RgUcDQ==
X-CSE-MsgGUID: NpHe6yjGTZq4RS07fta5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147422"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 53/79] drm/xe: Cleanup headers in xe_reg_sr.c
Date: Tue, 13 Jan 2026 15:03:58 -0800
Message-ID: <20260113230315.3081153-134-matthew.d.roper@intel.com>
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

xe_reg_sr.c doesn't use anything from the register headers or
xe_macros.h.  It also only needs the GT types header rather than the
full GT header.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 1a465385f909..d3e13ea33123 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -13,16 +13,13 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
-#include "regs/xe_engine_regs.h"
-#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
-#include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
 
-- 
2.52.0

