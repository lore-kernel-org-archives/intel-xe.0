Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFCCD0427
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 23:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A609F10E448;
	Mon,  5 Jan 2026 23:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7hMFK6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851E10E448
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767656037; x=1799192037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EZ/HlDYF/0XQHWiKvnKDH5rGZuXqiwsLx6LJxplmgXY=;
 b=C7hMFK6siviLJlf5xuEQUyRhmXTNtEr7DsWO3tVoUyVXJoAUgtr7S/L8
 rO6aTJoMC9vcssswVCS63UDfgmFOnDtywSVaRnyD69g4zU6mx1lgzuQbT
 iR+jvEjGsJHstEkxn7yfbxVboSWGce9G5XXGjCWu4f0iY0CETRi72YbID
 HoZvj8Y/xJ7acGd5SCNF3P86/J+/R0ngG7CH6fd5K5d3QW+vkj06pFmHk
 /QW/PXOCPhGWSS3/ikDfPBmbrC83tfy3YycXgy3SKBmE9Jg5e6rsvaNzQ
 PdTsmg1rR8idQ1z/NmOfshzv4ESUFoZf+9i8SXZJpzS0VqPRiRTbaVdMr w==;
X-CSE-ConnectionGUID: 8IhwLL7jSmWj1m6XdHRH/Q==
X-CSE-MsgGUID: YYDitz+zRiOv9Sdcl7HDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69066961"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69066961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 15:33:56 -0800
X-CSE-ConnectionGUID: 1rorSp01QWKGx6frmUv2ow==
X-CSE-MsgGUID: 0i/T0xQPRwaMYUEOnthOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233199128"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa002.jf.intel.com with ESMTP; 05 Jan 2026 15:33:56 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Date: Tue,  6 Jan 2026 07:33:54 +0800
Message-ID: <20260105233351.3753716-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105233351.3753716-6-brian3.nguyen@intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
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

PRLs could be invalidated to indicate its getting dropped from current
scope but are still valid. So standardize calls and add abort to clearly
define when an invalidation is a real abort and PRL should fallback.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c  | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h  |  3 +++
 drivers/gpu/drm/xe/xe_pt.c            | 21 +++++++++------------
 drivers/gpu/drm/xe/xe_tlb_inval_job.c |  2 +-
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 94d4608ebd74..9f086067a4a1 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -100,6 +100,29 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
 	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
 }
 
+/**
+ * xe_page_reclaim_list_abort() - Abort a PRL, invalidate it, and log
+ * @gt: GT associated with this PRL
+ * @prl: Page reclaim list to invalidate
+ * @format: printf-style format string for vm_dbg
+ *
+ * This is intended for PRL abort paths where we want to track aborted PRLs
+ */
+void xe_page_reclaim_list_abort(struct xe_gt *gt, struct xe_page_reclaim_list *prl,
+				const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_page_reclaim_list_invalidate(prl);
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &va_args;
+	vm_dbg(&gt_to_xe(gt)->drm, "PRL aborted: %pV", &vaf);
+	va_end(va_args);
+}
+
 /**
  * xe_page_reclaim_list_init() - Initialize a page reclaim list
  * @prl: Page reclaim list to initialize
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index a4f58e0ce9b4..2464268dba69 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -19,6 +19,7 @@
 struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
 struct xe_tile;
+struct xe_gt;
 struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
@@ -75,6 +76,8 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
 						   struct xe_page_reclaim_list *prl,
 						   struct xe_tlb_inval_fence *fence);
 void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
+void xe_page_reclaim_list_abort(struct xe_gt *gt, struct xe_page_reclaim_list *prl,
+				const char *format, ...);
 void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
 int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
 /**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6cd78bb2b652..2752a5a48a97 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1618,10 +1618,9 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 	} else if (is_2m_pte(xe_child)) {
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
 	} else {
-		xe_page_reclaim_list_invalidate(prl);
-		vm_dbg(&tile_to_xe(tile)->drm,
-		       "PRL invalidate: unsupported PTE level=%u pte=%#llx\n",
-		       xe_child->level, pte);
+		xe_page_reclaim_list_abort(tile->primary_gt, prl,
+					   "unsupported PTE level=%u pte=%#llx",
+					   xe_child->level, pte);
 		return -EINVAL;
 	}
 
@@ -1670,10 +1669,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 					break;
 			} else {
 				/* overflow, mark as invalid */
-				xe_page_reclaim_list_invalidate(xe_walk->prl);
-				vm_dbg(&xe->drm,
-				       "PRL invalidate: overflow while adding pte=%#llx",
-				       pte);
+				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
+							   "overflow while adding pte=%#llx",
+							   pte);
 				break;
 			}
 		}
@@ -1682,10 +1680,9 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
 	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
 	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
-		xe_page_reclaim_list_invalidate(xe_walk->prl);
-		vm_dbg(&xe->drm,
-		       "PRL invalidate: kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
-		       level, addr, next, xe_child->num_live);
+		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
+					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
+					   level, addr, next, xe_child->num_live);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 6a7bd6315797..b8916552101c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -182,7 +182,7 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
 	struct xe_vm *vm = job->vm;
 
 	/* BO creation retains a copy (if used), so no longer needed */
-	xe_page_reclaim_entries_put(job->prl.entries);
+	xe_page_reclaim_list_invalidate(&job->prl);
 
 	if (!job->fence_armed)
 		kfree(ifence);
-- 
2.52.0

