Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5738C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAA710E324;
	Thu, 16 Jul 2026 10:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjCJ3+LH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3340A10E324
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784197293; x=1815733293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kLS/xAi+1lZ8EYp2lKcXnTpj+fOTRxeJJzH9O087Qac=;
 b=IjCJ3+LHv8ctUw8QvYd5tfF8B+WFl1zODRBTVK5RQNQATsbL2fsn0g4R
 dKjY/8JCjA4k1J3J4a+G1pZN2yWrBjShymrQqNo7GzLrIAJ/eETwrDLVO
 XYNkwKKqCsCijofj5X0ZarJTcxcq1p0/qeCpoMMpqHvONNgO34y7rDTgy
 dKqZ77v975Xjmp+lucYKq+Fz4gYjtd5m9V9UKZZHVT7rkMufMPnrJEN6c
 lfOZPwUpb4BeEM7bkdkVRSNCzHDB++XGXCd3aI1jAg2afgwR7MF1vVf/2
 DQaxEvmI8yG+vOUAfmEeRHLw6YxrGPkhWaSd2OCs3knDfYHKMxZC3mnpE A==;
X-CSE-ConnectionGUID: bQ0idnZKROqzIoOHHiCByg==
X-CSE-MsgGUID: O8Am/YFySjG+GYifEJpA7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96367757"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96367757"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:33 -0700
X-CSE-ConnectionGUID: G/NCR3UBT3SAeeP3+0qMBw==
X-CSE-MsgGUID: d8U1lb9pTfK7rF1ORinTZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253833805"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:21:32 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH V13 01/11] drm/xe: Link VRAM object with gpu buddy
Date: Thu, 16 Jul 2026 15:51:07 +0530
Message-ID: <20260716102110.1549938-14-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
References: <20260716102110.1549938-13-tejas.upadhyay@intel.com>
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

Setup to link TTM buffer object inside gpu buddy. This functionality
is critical for supporting the memory page offline feature on CRI,
where identified faulty pages must be traced back to their
originating buffer for safe removal.

V2(MattB): Clear block->private in xe_ttm_vram_mgr_del as well

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index b518f7dec680..5ab5dfdb183c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	mgr->visible_avail -= vres->used_visible_size;
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = tbo;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -176,8 +179,11 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 		to_xe_ttm_vram_mgr_resource(res);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
 
 	mutex_lock(&mgr->lock);
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = NULL;
 	gpu_buddy_free_list(mm, &vres->blocks, 0);
 	mgr->visible_avail += vres->used_visible_size;
 	mutex_unlock(&mgr->lock);
-- 
2.52.0

