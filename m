Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67D5C369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 13:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8F610E5AB;
	Mon, 14 Apr 2025 13:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kwmv+d3d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301EE10E5AB
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744637168; x=1776173168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PKJ4Roznl3Yg2FWFUh3nz+SZkHXf4hT8t2CQq8HDJu0=;
 b=Kwmv+d3dEeUWPPrToNRbL1v/9lcXALnBigrcjPTwcdYTMfop8ogRXYhl
 DiTgXA/RUQlCGecSx7DLxIfmFTFYrVIQ5jJS8hE/UmIpyJlTkZj2Iosyz
 fS9vCoRkxvafMy+ALHBYqhamjC6IaQIET4QaItRycrqTQZP0MB+4e/V81
 yYnbAwcOd4gkvXOZOhBBZgD3dnKZQG4VO8nIjGgJUVVzlBt05MDe86ifg
 tWmQiLw0pXA2C0Y2eDZ6gB5Q85z/RIKXUTX4uhyKPlW8i0L7CnbxvQ5V2
 9JZsXlaf1W4HtGcmLSzMxx783HZoDgOA9ADBPninJMINX5bbo7crS4arI w==;
X-CSE-ConnectionGUID: qsvpCzUHR2yY7INqolgEWw==
X-CSE-MsgGUID: GGRtVudXQaiYDq29B1rm/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45987898"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45987898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:26:08 -0700
X-CSE-ConnectionGUID: 9GqZHTiWRkWZ4YmIK1iPkg==
X-CSE-MsgGUID: 6PazK+wXR7ySdV2awzdjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="160775103"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.253])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 06:26:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/userptr: fix notifier vs folio deadlock
Date: Mon, 14 Apr 2025 14:25:40 +0100
Message-ID: <20250414132539.26654-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

User is reporting what smells like notifier vs folio deadlock, where
migrate_pages_batch() on core kernel side is holding folio lock(s) and
then interacting with the mappings of it, however those mappings are
tied to some userptr, which means calling into the notifier callback and
grabbing the notifier lock. With perfect timing it looks possible that
the pages we pulled from the hmm fault can get sniped by
migrate_pages_batch() at the same time that we are holding the notifier
lock to mark the pages as accessed/dirty, but at this point we also want
to grab the folio locks(s) to mark them as dirty, but if they are
contended from notifier/migrate_pages_batch side then we deadlock since
folio lock won't be dropped until we drop the notifier lock.

Fortunately the mark_page_accessed/dirty is not really needed in the
first place it seems and should have already been done by hmm fault, so
just remove it.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4765
Fixes: 0a98219bcc96 ("drm/xe/hmm: Don't dereference struct page pointers without notifier lock")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
---
 drivers/gpu/drm/xe/xe_hmm.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index c3cc0fa105e8..57b71956ddf4 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -19,29 +19,6 @@ static u64 xe_npages_in_range(unsigned long start, unsigned long end)
 	return (end - start) >> PAGE_SHIFT;
 }
 
-/**
- * xe_mark_range_accessed() - mark a range is accessed, so core mm
- * have such information for memory eviction or write back to
- * hard disk
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
 static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
 		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
 {
@@ -331,7 +308,6 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 	if (ret)
 		goto out_unlock;
 
-	xe_mark_range_accessed(&hmm_range, write);
 	userptr->sg = &userptr->sgt;
 	xe_hmm_userptr_set_mapped(uvma);
 	userptr->notifier_seq = hmm_range.notifier_seq;
-- 
2.49.0

