Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B7FD31887
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A3C10E594;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxj9xbpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA1B10E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345422; x=1799881422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jLClaQ/7wnnq1Ki/jnIJ8SUGHhZEWCjSDeWLNZceH+0=;
 b=lxj9xbpvYUCIGKXfJvvMdIibW70TbO44jZ13E52Ye7si5G/ot+EeB9Ek
 tSyjTI89VdmJUnFBXkjSt6LuKloPsVLT3VXI/e89c8L05UPiVbICZm1Ml
 qxtG9uk/3Qz+wc07o/4JLEwXjNOYXaS4Cueg6bEoBszCmJcCRlPWYcTxZ
 4R4EFIkZHgslKWZxnnJjQLqzECyTfZSy41TVgnMIQ1O2uwm8Z9nkpTuvN
 aSoQgavJpCAqkeJnGQNd9k3Fe5hMkNN6B1GxC+ZHW0TDc8jvMVnF0xrkD
 0uIedRon1IN9GXioNzjb8nduJh0KTxx4bu6Q4b+XIoyqDRU8zMHDt8Ir7 g==;
X-CSE-ConnectionGUID: /MYbpft/RuS+nqLB1/3HqA==
X-CSE-MsgGUID: 2jU82BOhRMK9LcMdOTCw+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311155"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:41 -0800
X-CSE-ConnectionGUID: /zLngmLpR2GL5MiDD6OmGA==
X-CSE-MsgGUID: kXDU17onQD+F7zE8tE7pjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147412"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 48/79] drm/xe: Drop unused headers in xe_page_reclaim.c
Date: Tue, 13 Jan 2026 15:03:53 -0800
Message-ID: <20260113230315.3081153-129-matthew.d.roper@intel.com>
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

xe_page_reclaim.c doesn't use anything from xe_gt_regs.h, xe_assert.h,
xe_mmio.h, or xe_vm.h.  Drop the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index a8f35919a9da..e13c71a89da2 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -10,15 +10,11 @@
 
 #include "xe_page_reclaim.h"
 
-#include "regs/xe_gt_regs.h"
-#include "xe_assert.h"
 #include "xe_gt_stats.h"
 #include "xe_macros.h"
-#include "xe_mmio.h"
 #include "xe_pat.h"
 #include "xe_sa.h"
 #include "xe_tlb_inval_types.h"
-#include "xe_vm.h"
 
 /**
  * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a VMA
-- 
2.52.0

