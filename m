Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAFFC27C4A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A291C10E75F;
	Thu, 26 Oct 2023 04:02:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2150610E752
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292913; x=1729828913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FWh9YGz3hQMIanx5H4KJQzMgb6lmACVn3rQ3BuKDzU=;
 b=mnzBy0nb1R4XG5opr6wXwlcHL10fB9rCA7qqAOyRWaxG4KF7aZTKzVH2
 X/FjKQ/MGnLuAFTmX2sW+zwQLhkDAk/D1WKX/hOVoHFewoD6OGBCzRwnT
 qP0af3mdIhFTlI5FKqtrFCSeq95meeHJJsbTV1Yr81K/+lwthq9USJ5gq
 7h6cIi3bYZKIHDUPMQ91jYvMyXir4d/TACel8PZSCo0MkEF2ovSSgSd3x
 7YmChtmSzaIW0vGX0NPBxCnaYoQ8IB/A1ZOwRniEK4v25+dEEq0N/5PHt
 ZcTp9x9Y16hltFxLV9QmrALN8ldAeimYjG8FBDKb10hXDjSjcR1b1N6m5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822006"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822006"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682395"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682395"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:03 -0700
Message-Id: <20231026040213.1272993-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/26] drm/xe: Fix vma_is_valid to use tile
 argument
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

We convert gt to tile in vma_is_valid. Rather than so this just pass in
the tile.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0c87e590a9d8..82df72f71696 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -69,10 +69,10 @@ static bool access_is_atomic(enum access_type access_type)
 	return access_type == ACCESS_TYPE_ATOMIC;
 }
 
-static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
+static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
-	return BIT(gt_to_tile(gt)->id) & vma->tile_present &&
-		!(BIT(gt->info.id) & vma->usm.tile_invalidated);
+	return BIT(tile->id) & vma->tile_present &&
+		!(BIT(tile->id) & vma->usm.tile_invalidated);
 }
 
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
@@ -174,7 +174,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
-	if (vma_is_valid(gt, vma) && !atomic)
+	if (vma_is_valid(gt_to_tile(gt), vma) && !atomic)
 		goto unlock_vm;
 
 	/* TODO: Validate fault */
-- 
2.34.1

