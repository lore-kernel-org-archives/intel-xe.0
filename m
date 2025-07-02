Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545CC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 21:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615510E764;
	Wed,  2 Jul 2025 21:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUKPTYMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACFF10E764
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 21:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492016; x=1783028016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bM8Ilm7zlLz4nyOQVQ0rFWngJaEftRUsX+Vdg/DZhmY=;
 b=GUKPTYMjtvK6BM4x4oT6cO3m21cWfNWm+jDTS1d1OY5KIYzNdZxarby4
 bSYcH+wS0kZoWe3wGuuQH7MUOwHhoES79+RKct7LD6HrPZEnZjWcMI+rN
 ktS2//mCxmlfAfg7UMKL3pEsgFSj1VPafa+zxihvM/4eaSB7pSfd4rzOQ
 HN7WVLdID5+hU44/VUFxg+wL9yNWOG/F0TLHac5dJPRuEXmzYSeL/x1Gy
 1nuQqIp6fupWYKE3NmkaZL68oez/cqZAYjuuZsLxka/ByxRJnBY2rLRqv
 SoXvTO8aWmMVOwuyRbnSFZNw/OLXvTh2ugdiS80on354qMZ++7rSlFuMJ w==;
X-CSE-ConnectionGUID: wavojf4bR4avVUy2OAy5+w==
X-CSE-MsgGUID: Jfs8kohiTQmF4NkrOkw1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64049794"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64049794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:33:35 -0700
X-CSE-ConnectionGUID: 8LMnPBsSQmyiHKX1mriYVA==
X-CSE-MsgGUID: cB3GfCdxT62gX/Rgz21c6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153637921"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:33:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH] drm/xe: Allocate PF queue size on pow2 boundary
Date: Wed,  2 Jul 2025 14:35:11 -0700
Message-Id: <20250702213511.3226167-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

CIRC_SPACE does not work unless the size argument is a power of 2,
allocate PF queue size on power of 2 boundary.

Cc: stable@vger.kernel.org
Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Fixes: 29582e0ea75c ("drm/xe: Add page queue multiplier")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..5a75d56d8558 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -419,6 +419,7 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 #define PF_MULTIPLIER	8
 	pf_queue->num_dw =
 		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
+	pf_queue->num_dw = roundup_pow_of_two(pf_queue->num_dw);
 #undef PF_MULTIPLIER
 
 	pf_queue->gt = gt;
-- 
2.34.1

