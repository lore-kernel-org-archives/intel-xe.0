Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AE7D31895
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B6B10E5A3;
	Tue, 13 Jan 2026 23:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqQ4O0fm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16F10E57B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345423; x=1799881423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+wtEUpBjBNKL/5QaG5dF/J0pwg8n5MsTjdW651UdWI=;
 b=kqQ4O0fmMyNl5qZ/bEH6xtCjAVzobr7X8tSk8V4D9aRIf3MOMPojaoPE
 7y5oj+xIbRsKuyBbBANKHM38901re/JWtbl8+jRv/kFDHrvizAPk1sUh8
 SYzIqsqvxXzpucIyTURAm0lHBwznP0Vts4oTSEMmgq3MlwrGQcSYFwM/n
 gsGj6GfrVT3Q67pveX5ZIzf8cOdTvRHzmAre9NlYPqcTHk6njvu0XoTrG
 pggNfTDdeGUjXSSwDSI9tMfVawXp31q8P/jR8okaD7Lc+Fsn3pujk1+pD
 /Oe7vlqOgnStkpFG7LrIvlxxKLzzF+1NEQL75CNFeq059DjmGg12eO15v A==;
X-CSE-ConnectionGUID: Qs3kgy0OTyeRZ7IXqtXNkA==
X-CSE-MsgGUID: ib3zD979TNmG+ryuRcB72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92311183"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="92311183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:42 -0800
X-CSE-ConnectionGUID: yrTusW4eQhOHNA1QlHc+dg==
X-CSE-MsgGUID: +J9U4mybRGuPiLiuHRCMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204147485"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:03:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 77/79] drm/xe: Simplify header in xe_wa.c
Date: Tue, 13 Jan 2026 15:04:22 -0800
Message-ID: <20260113230315.3081153-158-matthew.d.roper@intel.com>
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

xe_wa.c doesn't use anything from xe_gt.h and only needs the
corresponding 'types' header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a93717e77da0..a991ee2b8781 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -19,7 +19,7 @@
 #include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
-#include "xe_gt.h"
+#include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
-- 
2.52.0

