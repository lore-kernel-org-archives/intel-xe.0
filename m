Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9645CD1283
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA51711253D;
	Thu, 28 Mar 2024 18:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCwo8EWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6575A112044
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711650089; x=1743186089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YuGGke4xbDiu4G8LhN78sJQjwUfpKas6zLi4TJgfpcQ=;
 b=lCwo8EWDvq9Xm9y4aO8c6PGBzfh6hI7jO/PFgs/wv+hFuif+cdj/vihT
 mTSHMNz+zOz87ePuxC8jK+TTclVevCzcw4e2QiKS9NviOZl3wj91gpJJF
 KFTQGY4aLBz6GL/388IcwXaULzi54lQ95VifGcR4g/DuvAubD1RSxWLy8
 8jiADz267MyDC5zoyA4Sy/yXq1oF9Im1rrtDmW+xXSmvsJTGdIENXzVDQ
 Vkn8+jXRiqc/yNXMfhXhsV+Uj3bQhjEy7Vz/lWqqYcnQ5/JPUMwA+2tn6
 q9Qi9u3mcCHJRZRKEg3MOQqJn23BlLFQkUc3yRcWe1EPJYhqOlB1eI2x2 A==;
X-CSE-ConnectionGUID: 4a6HSaE2Si6WZ5ihhawcow==
X-CSE-MsgGUID: v3iSGLW+Q/ebsCgmVineMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29307493"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="29307493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16784216"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:21:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe: Use ordered WQ for TLB invalidation fences
Date: Thu, 28 Mar 2024 11:21:47 -0700
Message-Id: <20240328182147.4169656-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328182147.4169656-1-matthew.brost@intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
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

TLB invalidation fences need to be ordered within an exec queue and if
an unordered WQ is used TLB invalidation fences could be reordered. Use
an ordered WQ to fix this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 580fe869b414..8f2ba4472ad0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1105,7 +1105,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(ifence->gt->ordered_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		dma_fence_signal(&ifence->base.base);
-- 
2.34.1

