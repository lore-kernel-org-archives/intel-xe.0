Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CDDD31889
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C78C10E590;
	Tue, 13 Jan 2026 23:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ufcd8RPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679B210E568
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345421; x=1799881421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Febqv3AZsR1SycoFeNNaqeU+VPnWO0luuVyBCgYKTSg=;
 b=Ufcd8RPAOzyVumg/5YNKpKBfwxGp5gB3dorsl0pjKrgpLoYLmIcvf6oa
 ov0jjbXo7PjPQFCqd9zKIvBFrgYcKxnyhKgLET3cr1qnAQnEz6/3FbBTf
 rKeE+mEdui+IleAucIupnywyyp8tMLxQCWR02QeyQ0a5AUiUSU/1z/R5f
 UTRqYr5S8p8rlp0sk7cOD6uO9JJVuFMiAGoqzWhdX5DCH4DIMml+G5GTZ
 BYmvRXcgp7P5ytMlL6eN4+vpKHlklFClbiEM5LMh+BNjdivV9vVZetF/i
 estU3PGBomur1VYqothxL8xLCUiP04G8hL0ULjdYfsiOzAdze25U/1XZC g==;
X-CSE-ConnectionGUID: 9dHnJiH6S3mX/RV2lVhcjg==
X-CSE-MsgGUID: qRX60CJERyWDF7boyW3eUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311133"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
X-CSE-ConnectionGUID: 4XHAYm9UTYOaDaBaCy6HkQ==
X-CSE-MsgGUID: 0FesO5lXQAGCbAxGr/p0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147366"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 28/79] drm/xe: Cleanup headers in xe_guc_capture.c
Date: Tue, 13 Jan 2026 15:03:33 -0800
Message-ID: <20260113230315.3081153-109-matthew.d.roper@intel.com>
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

xe_guc_capture.c doesn't use anything from xe_guc_regs.h, xe_regs.h, or
xe_guc_ads.h.  It also doesn't need xe_bo.h, just xe_bo_types.h.
Drop/replace the unnecessary includes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index bdd700ac1e54..2f5816c78fba 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -13,17 +13,14 @@
 #include "abi/guc_log_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
-#include "regs/xe_guc_regs.h"
-#include "regs/xe_regs.h"
 
-#include "xe_bo.h"
+#include "xe_bo_types.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
-#include "xe_guc_ads.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_types.h"
 #include "xe_guc_ct.h"
-- 
2.52.0

