Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47000C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 17:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A70610E67B;
	Wed, 21 Aug 2024 17:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdmRKnP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FB210E67B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260772; x=1755796772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NeyTZvC32cJ2DU+JyA7JnEGRFBNgsgjgHDr4FtFXSuo=;
 b=hdmRKnP1XceCFUo9PaMpTGim62xQaytvFUlVRZB6466mkD7uuDL3atUR
 r/VUBXf+G+nJygBQggk9TAhvmc/ruvdtsnFdiNGQjaMbqEUadESyAgMGU
 R6hVuQEBiI/m9FkW1Au++Iy1629uCZRi1VhDesWQMnDVq5rQSkWBlcsk3
 /WXfB7/ZRnAqJZj2NKBvJfcdcjjPieVy//5nQvYHIPfW8PfBenzxo/e2Z
 ZoXDGleWccP432iQBAQGss0u1i3OfM15b20QjHArsAGRsPHNd3MZjF1Lr
 I1QXambasEXm8lUfR5opZjzAh6GhUv3pUlePuiglN12K69V4EKpqJdO5t g==;
X-CSE-ConnectionGUID: P+UTf+fQSfWwrfoUfzHJEg==
X-CSE-MsgGUID: kdT/d4WYQp++aEMfHqMhRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26430809"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26430809"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:19:32 -0700
X-CSE-ConnectionGUID: 0H6rohE2QIqLkr55Th+Gkw==
X-CSE-MsgGUID: p1Y69/uIQm6ebvLk4dHqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91944485"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:19:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: fixup xe_alloc_pf_queue
Date: Wed, 21 Aug 2024 18:19:18 +0100
Message-ID: <20240821171917.417386-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

kzalloc expects number of bytes, therefore we should convert the number
of dw into bytes, otherwise we are likely just accessing beyond the
array causing all kinds of carnage. Also fixup the error handling while
we are here.

Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 401c0527d914..e4510e56e4a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -417,7 +417,10 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
 
 	pf_queue->gt = gt;
-	pf_queue->data = kzalloc(pf_queue->num_dw, GFP_KERNEL);
+	pf_queue->data = kzalloc(pf_queue->num_dw * sizeof(u32), GFP_KERNEL);
+	if (!pf_queue->data)
+		return -ENOMEM;
+
 	spin_lock_init(&pf_queue->lock);
 	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
 
-- 
2.46.0

