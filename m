Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9539FC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EE210F6CB;
	Fri, 14 Aug 2026 17:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEYifFsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D02E10F6DA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727955; x=1818263955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hB8xH1jVGgI4WoiN4KI28YF5PLEEAZtlZzRyffdP3AY=;
 b=jEYifFsTbwwcLvuK77dGmHt6yfTgzLH+fFkAx4y1GHGXimjGFzfOGjcK
 oqTrJwiARRyS4jlMBRmTFdN5yGSOGIFUniIq9N8pVgAmqg896wMr5R53v
 4c20FOgmCkU0n7wnMw9uz2LXA7wmrHHLz+z81k65/OE+8gWFGnvW2e1U/
 mJRkWttmtHMPJBfdfhW2NJZb9buVfzBnV23uZqnmiW1XfV5of5rWLBWRA
 IY+fpNkVOpYGV2wS/7gGeWje6EukHRTHmnJvFzwHKzY47T+SD6i0bJwwE
 XKbp4YLGr+ZwhwPhur8NmaNStHRN1Yg5hEq/eXwzyjuA8lGkYI7idGySR w==;
X-CSE-ConnectionGUID: JwzlDsMYT8C2MIp4nkEsDg==
X-CSE-MsgGUID: bxJ5cZreTa6TOmqrLKTsew==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464121"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464121"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:15 -0700
X-CSE-ConnectionGUID: nIxTJRxwTGqM9ZX9ELYC1g==
X-CSE-MsgGUID: +aDAgtHJSoCY5um1yiREcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946376"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 31/33] drm/xe/gt: Report 'Fault response' pagefault error
 using SIGID
Date: Fri, 14 Aug 2026 19:17:57 +0200
Message-ID: <20260814171801.13347-32-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'Unsuccessful response' error using xe_log_err_info() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: rebased (Michal) reword message (Mallesh)
v3: use info level helper (Rodrigo/Daniele)
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 7e829c61387f..8b1f6f5448ba 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -14,6 +14,7 @@
 #include "xe_gt_types.h"
 #include "xe_gt_stats.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
 #include "xe_svm.h"
@@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
 				xe_pagefault_cache_start_invalidate(cache_start);
 				xe_pagefault_print(pf);
-				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
-					   ERR_PTR(err));
+				xe_log_err_info(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
 			} else {
 				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
 				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
-- 
2.47.1

