Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB7C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1321610E02D;
	Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90B110E4B7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B5FMconyQrFo3dHUan6Bc3r1c2hniRK8bqEdsdfi9C8=;
 b=FhzW312MlYJSDHpMbpLcBuAZBNT5j6JmmQ6wv74/Q9IlJzchVjBR8JdD
 x1fRUr9odLBwUM1nhIjEqNFBtgZYGuzF03LV4e4xDw8Jr6X48+I57nITd
 wdeYO9sZLK3ScxTFXz2GWhoU/zPHv/C3kl3237ImjpLYSgorwEdLW5brD
 +LtNV73lqJp+3rEdgRfuHOyF/XUCXQLA+XCoilzqnaT7ldm+jR/efFWjC
 N/zhXA5I5Be+VV3uvGAan92aQbp/4vTYh0blg7ZXY7LYN05UhE1Rrhwa1
 lOOnggSCb91j30KRh4z5KaAUUPDOZvuCQ1RkxUs7u38skH0S1DJULOBMn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769529"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689866"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689866"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:53 -0800
Message-Id: <20231107052603.124361-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 17/27] drm/xe: Fix vma_is_valid to use tile
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
index 27845a6b0b23..6125456373cb 100644
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

