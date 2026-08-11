Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF33C5CFC1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CB110E3A1;
	Tue, 11 Aug 2026 20:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSbolCle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290D210ED8A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478960; x=1818014960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BAefHc0YVp6aOPpX7Lm+cRlZeUN0ZAFJhTLMa5eOjyU=;
 b=ZSbolClevFeyv/Oy/XsNPVvn7WZqh2i9B4JjAosOD7pv4s1qlij6C2AS
 Kpj4C/hpeT1XBnPOsXPVl5u0eEKBWrKPKV2aFHpxs5kGEdtDa/M/eSLIg
 NR8tkaQopxSisV+U77lTvRAhbUkEJwt6Pm8F0Z0howWyXf/9VyzlwAxUz
 vFu07C17D5x1Mtl/LTEbcblbCgVusWkKVcCdtLBNW4wdmBooGlgL43sbs
 Ws2weadcHs+ZRbM07Xm3JcRpwPQZovRJd6RGS96V/5Y4/h8raXb7Amwnk
 wGfF6fMKeiCa09QN74qhWsWtLJYINnpYkK691Ofjznn1x5tlcsgs/owvw g==;
X-CSE-ConnectionGUID: uIY5i0S6RFCwojVSDkW9rw==
X-CSE-MsgGUID: v4z5fQ74QeKihxrej1pMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87033181"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87033181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:20 -0700
X-CSE-ConnectionGUID: 0sW7KmZ+TQml4vkFjSRLKw==
X-CSE-MsgGUID: eZkxUzYQTuS77Jeg729JTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260111073"
Received: from rajeevra-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: Remove redundant full pagefault queue check
Date: Tue, 11 Aug 2026 22:09:05 +0200
Message-ID: <20260811200906.10400-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811200906.10400-1-michal.wajdeczko@intel.com>
References: <20260811200906.10400-1-michal.wajdeczko@intel.com>
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

There is no need to check the queue inside the pagefault handler
as it is immediately checked later by the xe_pagefault_queue_add()
function and we can just look for the NULL lpf entry. There will
be also already a full WARN triggered, so no need keep drm_warn().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 45 +++++++++++++------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index cfb65621baec..7e829c61387f 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -864,41 +864,32 @@ static int xe_pagefault_work_index(struct xe_device *xe)
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
 	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
-	bool full;
+	struct xe_pagefault *lpf;
+	bool empty;
 
 	guard(spinlock_irqsave)(&pf_queue->lock);
-	full = xe_pagefault_queue_full(pf_queue);
-	if (!full) {
-		struct xe_pagefault *lpf;
-		bool empty = xe_pagefault_queue_empty(pf_queue);
 
-		lpf = xe_pagefault_queue_add(pf_queue, pf);
-		if (lpf) {
-			lpf->consumer.next = NULL;
+	empty = xe_pagefault_queue_empty(pf_queue);
+	lpf = xe_pagefault_queue_add(pf_queue, pf);
+	if (!lpf)
+		return -ENOSPC;
 
-			if (xe_pagefault_try_chain(pf_queue, lpf)) {
-				xe_gt_stats_incr(pf->gt,
-						 XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT,
-						 1);
-				if (empty) {
-					xe_gt_stats_incr(pf->gt,
-							 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT,
-							 1);
-					xe_pagefault_queue_advance(pf_queue);
-				}
-			} else {
-				int work_index = xe_pagefault_work_index(xe);
-
-				queue_work(xe->usm.pagefault_wq,
-					   &xe->usm.pf_workers[work_index].work);
-			}
+	lpf->consumer.next = NULL;
+	if (xe_pagefault_try_chain(pf_queue, lpf)) {
+		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_CHAIN_IRQ_PAGEFAULT_COUNT, 1);
+		if (empty) {
+			xe_gt_stats_incr(pf->gt,
+					 XE_GT_STATS_ID_CHAIN_DRAIN_IRQ_PAGEFAULT_COUNT, 1);
+			xe_pagefault_queue_advance(pf_queue);
 		}
 	} else {
-		drm_warn(&xe->drm,
-			 "PageFault Queue full, shouldn't be possible\n");
+		int work_index = xe_pagefault_work_index(xe);
+
+		queue_work(xe->usm.pagefault_wq,
+			   &xe->usm.pf_workers[work_index].work);
 	}
 
-	return full ? -ENOSPC : 0;
+	return 0;
 }
 
 /**
-- 
2.47.1

