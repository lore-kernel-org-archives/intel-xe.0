Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA0CC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFDC10ED8A;
	Tue, 11 Aug 2026 20:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnNChOX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796410ED8A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478958; x=1818014958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uf746UoqGSJBe2nJxVf0yjrZdRjQbmtRbPI7Er2FNp4=;
 b=DnNChOX8SGfmEHis31Dr/w/WmVWVlZ7Qzqu56g3eYvkxFIAVWIXss4PP
 zQHifhbBT+NOb73Jp+Rr6gAlA+YhJGtQMXYY0kbLpXZiDLA5aKaYmyJtw
 slW03Ldubl8k52KNJGIT7YL2W2jNFvmoJToGdCdNP2vcVGvnj1uHYbFGa
 cdUtqGDoNCDkQvppcTGe82KfgN488URnx1yKrpXCKj1Kk+0ZAMlw/GBZj
 i59CqgWfCSkdvwl2i+aRLJEcKshKakGwkYLApcsqEWkrxslvilKr6euMx
 GK4tcWPDUkrWN1oy1W3Xd1bkAs+DxtMgkJ7Zjzgtg99z13zgEpSzH1+/f Q==;
X-CSE-ConnectionGUID: 2OfVcdN3TpeZVdpwGJvmMQ==
X-CSE-MsgGUID: 203xHtoWQISWLJe8KVfX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87033180"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87033180"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:18 -0700
X-CSE-ConnectionGUID: GUCS98YER96W+SoyDPGpyg==
X-CSE-MsgGUID: 91P5LkSUQnGILBtUiQN4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260111070"
Received: from rajeevra-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:16 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe: Use guard(spinlock_irqsave) in pagefault handler
Date: Tue, 11 Aug 2026 22:09:04 +0200
Message-ID: <20260811200906.10400-2-michal.wajdeczko@intel.com>
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

It is safer and easier to use guard() instead of explicit lock
unlock calls.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index b2d7bca9e407..cfb65621baec 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -864,10 +864,9 @@ static int xe_pagefault_work_index(struct xe_device *xe)
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
 	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
-	unsigned long flags;
 	bool full;
 
-	spin_lock_irqsave(&pf_queue->lock, flags);
+	guard(spinlock_irqsave)(&pf_queue->lock);
 	full = xe_pagefault_queue_full(pf_queue);
 	if (!full) {
 		struct xe_pagefault *lpf;
@@ -898,7 +897,6 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 		drm_warn(&xe->drm,
 			 "PageFault Queue full, shouldn't be possible\n");
 	}
-	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
 	return full ? -ENOSPC : 0;
 }
-- 
2.47.1

