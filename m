Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E265ECE57B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 18:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740E10E62A;
	Mon,  9 Sep 2024 18:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZW3BpKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A24C10E62A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725906031; x=1757442031;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JeHeMyIEute77AvDoe4FLpVzHtIOIIcB1b4fFkdB390=;
 b=eZW3BpKe6qPtdsDR7juOo8waz7KHhEplv8ImZ43xUJN1Syv5E95eydYR
 rTwAXCS8PyBnnYsuQfRWHK1DYftYLEBYUpvCRkmWAckM03VI2yJ6WljCT
 Fl3MTYbr8sDuBKWyXiemaoTpiM11O+0REMDODTm1KIqmSkCOym7chhgXU
 KB3AwV/eDTc6pX+OHtsgYHE4Ec9zq7M0OnihtqRRjvOKYVECvMFIg/xhS
 HiHlIf0IAJ+ZzjHbkna/0kSfokqBCvXfSI7MdBABn9sBOCjxEL2QGXtCX
 9QHHQKAF1Mp+D6foHlIPeMIhVXaJcbyHS4XKYhAehN11AuokLEKzy9GY4 w==;
X-CSE-ConnectionGUID: oxoqikzNTGap5Q2Yw8y29A==
X-CSE-MsgGUID: 47ut8LZlSE+LGW3KUgaDLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24422834"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24422834"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:20:31 -0700
X-CSE-ConnectionGUID: yqEUjVInQBKQuQud6jYzCw==
X-CSE-MsgGUID: PMJXXfq9QXeZbVvNu1AKNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="67021570"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:20:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop xe_mark_range_accessed in HMM layer
Date: Mon,  9 Sep 2024 11:21:28 -0700
Message-Id: <20240909182128.585364-1-matthew.brost@intel.com>
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

Not needed as hmm_range_fault does this and also as pages returned from
hmm_range_fault could move while mmap lock is dropped and not not
holding notifier lock. Page corruption showed up in similar code paths
in SVM work.

Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 2c32dc46f7d4..dde80a66c9aa 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -19,30 +19,6 @@ static u64 xe_npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
-/*
- * xe_mark_range_accessed() - mark a range is accessed, so core mm
- * have such information for memory eviction or write back to
- * hard disk
- *
- * @range: the range to mark
- * @write: if write to this range, we mark pages in this range
- * as dirty
- */
-static void xe_mark_range_accessed(struct hmm_range *range, bool write)
-{
-	struct page *page;
-	u64 i, npages;
-
-	npages = xe_npages_in_range(range->start, range->end);
-	for (i = 0; i < npages; i++) {
-		page = hmm_pfn_to_page(range->hmm_pfns[i]);
-		if (write)
-			set_page_dirty_lock(page);
-
-		mark_page_accessed(page);
-	}
-}
-
 /*
  * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
  * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
@@ -242,7 +218,6 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 	if (ret)
 		goto free_pfns;
 
-	xe_mark_range_accessed(&hmm_range, write);
 	userptr->sg = &userptr->sgt;
 	userptr->notifier_seq = hmm_range.notifier_seq;
 
-- 
2.34.1

