Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD60BCF6BE4
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 01:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93310E1EE;
	Wed,  7 Jan 2026 01:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5to4w8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AC010E18A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 01:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767747891; x=1799283891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5BfrshSxx0wZhiZDNeyBfpJHinNuyl0FGbkAYyp3tgk=;
 b=B5to4w8w6Q2Ea/xn7EFL9afSAVzo9NHAeeG/nXviRuNro6m5DcWTRaC2
 N2HS4KmQhDUkc4yJ3xdt/WxOtZgg1nGBwsDbelakJusBQFn4IEdD57zab
 p++Y2jwRO4IktUGntB3MoFk/MaeOSeQHw+VxdDI7UZyytFolsMV4Sf9vw
 Zs0ysBMdaOgixnT9YlM6WFxOSwB4BGkhDwpXwlDNfQZs75JOtS/gnDz3P
 JYHip31Pe7Cn8pYGevSqga70LH4bNjY47fvgi9DiFVznNMv9I5ZrpPs1U
 SJH6vbE+w90TIBYMqOY6Q6ucIcaXonDo4/LwKfTHFnm/noFj9OEywqIeK w==;
X-CSE-ConnectionGUID: k8omrq1VSxugg3MS2obajg==
X-CSE-MsgGUID: OTLBDJjNRl6ukpcZotyWCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72964798"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72964798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:04:50 -0800
X-CSE-ConnectionGUID: Xvmr3ScZRjiP48JAeeU0rA==
X-CSE-MsgGUID: fsOwb7HZS4idexwydb+JYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206937246"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 17:04:52 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Date: Wed,  7 Jan 2026 09:04:50 +0800
Message-ID: <20260107010447.4125005-8-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107010447.4125005-6-brian3.nguyen@intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
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

v3:
 - Update abort function to macro. (Matthew B)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.h | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 21 +++++++++------------
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index a4f58e0ce9b4..12f861f357d8 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -19,6 +19,7 @@
 struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
 struct xe_tile;
+struct xe_gt;
 struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
@@ -75,6 +76,24 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inva
 						   struct xe_page_reclaim_list *prl,
 						   struct xe_tlb_inval_fence *fence);
 void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
+
+/**
+ * xe_page_reclaim_list_abort() - Invalidate a PRL and log an abort reason
+ * @gt: GT owning the page reclaim request
+ * @prl: Page reclaim list to invalidate
+ * @fmt: format string for the log message with args
+ *
+ * Abort page reclaim process by invalidating PRL and doing any relevant logging.
+ */
+#define xe_page_reclaim_list_abort(gt, prl, fmt, ...)					\
+	do {										\
+		struct xe_gt *__gt = (gt);						\
+		struct xe_page_reclaim_list *__prl = (prl);				\
+											\
+		xe_page_reclaim_list_invalidate(__prl);					\
+		vm_dbg(&gt_to_xe(__gt)->drm, "PRL aborted: " fmt, ##__VA_ARGS__);	\
+	} while (0)
+
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
-- 
2.52.0

