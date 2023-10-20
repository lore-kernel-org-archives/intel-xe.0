Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8516CC001DF
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 17:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850F10E0FC;
	Fri, 20 Oct 2023 17:22:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C41810E0FC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697822524; x=1729358524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zE4vCYI04mZpv9mN2vVTc75+ma2wJrn9QT0rL/6ny/4=;
 b=CmctvAEr9YCuiN9HvrvRNBp82mkO/ySgJdxmjs6rK5Gp5Wl2zUPq370x
 5sX2MnAcyjQRhcqDCa/1oJm/TtQVYHJn0khUgyrnnlqOI5vADh3vLAwhn
 AVxFLfhCYWdwYWEFP41EMlZnIkSF3nFQpv08etiKuc0UiP59eRY1kUDhF
 qO3fQdb1Zi3URy7rfhiJekB5LVIpdADfzqVNFdMjYkG2T/x9dd4d9pdsd
 j4tZyE5cYqwVsGBk2dM1zTnDsJqlJZafOgQ4X17HQyUJEzMWF6QPnRowG
 hFt+/ateEPKvFKzIw49tQO1VplSegLpKYqfExPDW0xlSXrNIxZz2YYUPG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450769125"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="450769125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5168746"
Received: from dut027tgly.fm.intel.com ([10.105.19.35])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:20:52 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Fri, 20 Oct 2023 17:21:55 +0000
Message-Id: <20231020172155.97172-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Move VM entries print to a trace
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
Cc: Stuart Summers <stuart.summers@intel.com>, lucas.demarchi@intel.com,
 himanshu.girotra@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

While this information can be useful for debug, it is a little
verbose to dump during a CI run, resulting in test failures due
to disk limit issues in the CI machines.

For now, move these debug prints to a trace for manual debug.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c    | 35 +++++-------------------------
 drivers/gpu/drm/xe/xe_pt.h    |  8 +++++++
 drivers/gpu/drm/xe/xe_trace.h | 41 +++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 31afab617b4e..eb905878c4cb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -908,6 +908,9 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 			pt_dir->dir.entries[j_] = &newpte->base;
 		}
+
+		trace_xe_pt_commit_bind(&entries[i]);
+
 		kfree(entries[i].pt_entries);
 	}
 }
@@ -929,34 +932,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	return err;
 }
 
-static void xe_vm_dbg_print_entries(struct xe_device *xe,
-				    const struct xe_vm_pgtable_update *entries,
-				    unsigned int num_entries)
-#if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
-{
-	unsigned int i;
-
-	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
-	for (i = 0; i < num_entries; i++) {
-		const struct xe_vm_pgtable_update *entry = &entries[i];
-		struct xe_pt *xe_pt = entry->pt;
-		u64 page_size = 1ull << xe_pt_shift(xe_pt->level);
-		u64 end;
-		u64 start;
-
-		xe_assert(xe, !entry->pt->is_compact);
-		start = entry->ofs * page_size;
-		end = start + page_size * entry->qwords;
-		vm_dbg(&xe->drm,
-		       "\t%u: Update level %u at (%u + %u) [%llx...%llx) f:%x\n",
-		       i, xe_pt->level, entry->ofs, entry->qwords,
-		       xe_pt_addr(xe_pt) + start, xe_pt_addr(xe_pt) + end, 0);
-	}
-}
-#else
-{}
-#endif
-
 #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
 
 static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
@@ -1276,7 +1251,6 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		goto err;
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
 
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
 				   num_entries);
 
@@ -1563,6 +1537,8 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 				pt_dir->dir.entries[i] = NULL;
 			}
 		}
+
+		trace_xe_pt_commit_unbind(entry);
 	}
 }
 
@@ -1627,7 +1603,6 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
 	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
 
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
 				   num_entries);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index d5460e58dbbf..c7e5f7111227 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -18,6 +18,14 @@ struct xe_tile;
 struct xe_vm;
 struct xe_vma;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
+#define xe_pt_set_addr(__xe_pt, __addr) ((__xe_pt)->addr = (__addr))
+#define xe_pt_addr(__xe_pt) ((__xe_pt)->addr)
+#else
+#define xe_pt_set_addr(__xe_pt, __addr)
+#define xe_pt_addr(__xe_pt) 0ull
+#endif
+
 #define xe_pt_write(xe, map, idx, data) \
 	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e32f1cad51d9..24d898061d04 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -17,8 +17,49 @@
 #include "xe_gt_tlb_invalidation_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_pt_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "xe_pt.h"
+
+DECLARE_EVENT_CLASS(xe_vm_pgtable_update,
+		    TP_PROTO(struct xe_vm_pgtable_update *update),
+		    TP_ARGS(update),
+
+		    TP_STRUCT__entry(
+			     __field(u64, page_size)
+			     __field(u64, end)
+			     __field(u64, start)
+			     __field(u64, pt_addr)
+			     __field(unsigned int, level)
+			     __field(u32, ofs)
+			     __field(u32, qwords)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->level = xe_pt_shift(update->pt->level);
+			   __entry->page_size = 1ull << __entry->level;
+			   __entry->pt_addr = xe_pt_addr(update->pt);
+			   __entry->ofs = update->ofs;
+			   __entry->qwords = update->qwords;
+			   __entry->start = __entry->pt_addr + update->ofs * __entry->page_size;
+			   __entry->end = __entry->start + __entry->page_size * update->qwords;
+			   ),
+
+		    TP_printk("Update level %u at (%u + %u) [%llx...%llx]",
+			      __entry->level, __entry->ofs, __entry->qwords,
+			      __entry->start, __entry->end)
+);
+
+DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_bind,
+	     TP_PROTO(struct xe_vm_pgtable_update *entry),
+	     TP_ARGS(entry)
+);
+
+DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_unbind,
+	     TP_PROTO(struct xe_vm_pgtable_update *entry),
+	     TP_ARGS(entry)
+);
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
-- 
2.34.1

