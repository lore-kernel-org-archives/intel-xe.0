Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82BBCD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0D112F2B;
	Tue,  9 Apr 2024 20:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAbet/oz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03152112F27
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693096; x=1744229096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhRfksJYKgoznj4eEdumgTEQn+nbU48Y3HzzSq46MSY=;
 b=oAbet/ozBGi0ifQoVPAwMGE315MKiNfiDr6fwMZq3mOAHv7/zj0s4DYe
 xwOHaEEfywtAumKnOrICXCkaBB0wBIykomzU09eFYa6Vz7KknXovUGGUK
 dqP1oCMLwjoP7+vGq1/rVE2GtIm5le7sYXlHdRflyOaupz8egkZVPVycl
 GotyADAPYIzPjDjFXIefa8rL8bePSQzj+rKHlSfs7S2Uwf1Xo+8LwRHYM
 klKEVYH9pyL0kXb4Vbjb+hxpz+4Al1HxMO87ZVfJuDo0o/fgqF1AX0fnV
 pUK068VszJDyUQOAaC5eeSyhOUxVZzgBKRVubdOk9Fs2ONUDF4N4R7qhp A==;
X-CSE-ConnectionGUID: gjg7BCYGRlC4Mz8KWLzw/g==
X-CSE-MsgGUID: OcJUH/WiRymQ3jsMPA6RRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803765"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: n86ahg9hSzes7XYOSMIFAA==
X-CSE-MsgGUID: GX+1HmwOQB6heMlOtN+BEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773782"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 23/31] drm/xe/svm: Trace buddy block allocation and free
Date: Tue,  9 Apr 2024 16:17:34 -0400
Message-Id: <20240409201742.3042626-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

trace_xe_buddy_block_alloc and trace_xe_buddy_block_free
are added to trace buddy allocation and free.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm_devmem.c |  6 ++++-
 drivers/gpu/drm/xe/xe_trace.h      | 35 ++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index 5ba0cd9a70b0..088ac209ad80 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -17,6 +17,7 @@
 #include "xe_migrate.h"
 #include "xe_ttm_vram_mgr_types.h"
 #include "xe_assert.h"
+#include "xe_trace.h"
 
 /**
  * struct xe_svm_block_meta - svm uses this data structure to manage each
@@ -81,8 +82,10 @@ void xe_devm_page_free(struct page *page)
 
 	xe_assert(tile->xe, i < pages_per_block);
 	clear_bit(i, meta->bitmap);
-	if (bitmap_empty(meta->bitmap, pages_per_block))
+	if (bitmap_empty(meta->bitmap, pages_per_block)) {
 		free_block(block);
+		trace_xe_buddy_block_free(block, size, block_pfn_first);
+	}
 }
 
 /**
@@ -135,6 +138,7 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
 		block->private = meta;
 		block_pfn_first =
 					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+		trace_xe_buddy_block_alloc(block, size, block_pfn_first);
 		for(i = 0; i < pages_per_block; i++) {
 			struct page *page;
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 5f7d26bf4cd7..f3fcce9f1434 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -21,6 +21,7 @@
 #include "xe_guc_exec_queue_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include <drm/drm_buddy.h>
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
@@ -622,6 +623,40 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+DECLARE_EVENT_CLASS(xe_buddy_block,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn),
+
+               TP_STRUCT__entry(
+                               __field(u64, block)
+                               __field(u64, header)
+                               __field(u64, size)
+                               __field(u64, pfn)
+               ),
+
+               TP_fast_assign(
+                               __entry->block = (u64)block;
+                               __entry->header = block->header;
+                               __entry->size = size;
+                               __entry->pfn = pfn;
+               ),
+
+               TP_printk("xe svm: allocated block %llx, block header %llx, size %llx, pfn %llx\n",
+                       __entry->block, __entry->header, __entry->size, __entry->pfn)
+);
+
+
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_alloc,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn)
+);
+
+
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_free,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.26.3

