Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB77CFD37F
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 10:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAFE10E3B4;
	Tue, 25 Nov 2025 10:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aj1lVZp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABD910E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066652; x=1795602652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hVJH/E1Znw0OzyrmXgrxHMcwOvKcZJom4AWaUw9Sc5M=;
 b=Aj1lVZp6ozDlYtKEbsP63XjIlwTEwlAvsy4WYvWcycHO3ID19zyZKDSa
 wIAkmXK0BmFmaEvP5CbwkFIvhGSRAE6OO/1V2MxFhyz1J+NydpZ7DK6R6
 I+bQjhYbiY7VCWdsQcqqNzD3LQGPh78Z1lfRTwdCoEyN19kxIigv/CXIz
 /ql0zx+9HfuxIlUM1tZCBMT2lOzIYKELHKDbD3wGPenai4tkfuTRvOpwH
 66/EnDz6UtbrcxYSLvayj4LYi3xgWGxbp1vnepFQbh834bje3khw4loYk
 j58/+B2DFBUfHTHLUOZCl8WcE5tEV/uit/4y0nmod6zapDsiqiKFNAva5 Q==;
X-CSE-ConnectionGUID: w6GCS0uzQOOUmboLbWMlLg==
X-CSE-MsgGUID: sPW3uxsyQwSd7D5oJyaB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68669640"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="68669640"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:30:52 -0800
X-CSE-ConnectionGUID: SB4aL4hqTr69iD32uCYybg==
X-CSE-MsgGUID: wqgmvHPoR66kkABWfpQZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191742528"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 25 Nov 2025 02:30:51 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com
Subject: [PATCH] fixeup! drm/xe/xe_pagefault: Fix potential uninitialized
 fence usage in xe_pagefault_handle_vma
Date: Tue, 25 Nov 2025 15:54:29 +0530
Message-ID: <20251125102428.2325859-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

The variable "fence" should be initialized to NULL,
and any usage of fence should be guarded
by a check to ensure it is not NULL

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index afb06598b6e1..401f1835939b 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -70,7 +70,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int err, needs_vram;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -122,8 +122,10 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 		}
 	}
 
-	dma_fence_wait(fence, false);
-	dma_fence_put(fence);
+	if (fence) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
 
 unlock_dma_resv:
 	xe_validation_ctx_fini(&ctx);
-- 
2.43.0

