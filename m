Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6DCD358E1
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5795110E283;
	Thu, 29 Jan 2026 08:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arEwhMG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4010E7FC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769675279; x=1801211279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vuw/8wktFWYVIBSWb39aI0gAbQzl6mwUtnY/1wQfS8c=;
 b=arEwhMG90aCKsN64z/nXUCSnHyr/osWtdH/qR+G5+D0vTomd3C27+OC0
 r5p2+ErjtKvpjty2HFeGss3miewKglXE5BPr9q6kZMiYh0+wuiC80lchn
 cTN4cWlAasp80lscck3zqX2w2Pv4bpdk+QTwbMgnJ3TsnhqEpSebukoyy
 kMwijeVb4T9qFGfX5GN9PT+vWa/vpFWJzsNi0ESFj3zM4Q6Gkp1dnGIK2
 EnbgXbEORi4gggfLnZ61z4zP/JzfA0hklN/X9/eMMd5wsCyjzqCMIUwEf
 9Vs4bhOOQB5/EMX52DTLEKbMRI35Kh0i4jzbZzQmuq3QQ5A02qXuB73Qw w==;
X-CSE-ConnectionGUID: zTuxbAmuSEGQfMWdigl4iw==
X-CSE-MsgGUID: VHYgFOK7RKSeXPWq29zPYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70942711"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70942711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:27:58 -0800
X-CSE-ConnectionGUID: FJbtP1t8SAmDHzSQFLb2fg==
X-CSE-MsgGUID: kZLhCcviQ265GtO012Dugg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="207756743"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 00:27:58 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Date: Thu, 29 Jan 2026 08:27:58 +0000
Message-ID: <20260129082756.1096935-4-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129082756.1096935-3-brian3.nguyen@intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
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

Originally, page reclamation is handled by the same fence as tlb
invalidation and uses its seqno, so there was no reason to separate out
the handlers. However in hindsight, for readability, and possible
future changes, it seems more beneficial to move this all out to its own
function.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 23 ++++++++---------------
 drivers/gpu/drm/xe/xe_page_reclaim.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..3d69314170f8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -31,6 +31,7 @@
 #include "xe_guc_submit.h"
 #include "xe_guc_tlb_inval.h"
 #include "xe_map.h"
+#include "xe_page_reclaim.h"
 #include "xe_pm.h"
 #include "xe_sriov_vf.h"
 #include "xe_trace_guc.h"
@@ -1604,17 +1605,11 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
-	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
-		/*
-		 * Page reclamation is an extension of TLB invalidation. Both
-		 * operations share the same seqno and fence. When either
-		 * action completes, we need to signal the corresponding
-		 * fence. Since the handling logic (lookup fence by seqno,
-		 * fence signalling) is identical, we use the same handler
-		 * for both G2H events.
-		 */
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
+		ret = xe_guc_page_reclaim_done_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
 		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
 		break;
@@ -1822,15 +1817,13 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
-	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
-		/*
-		 * Seqno and fence handling of page reclamation and TLB
-		 * invalidation is identical, so we can use the same handler
-		 * for both actions.
-		 */
 		__g2h_release_space(ct, len);
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
+		__g2h_release_space(ct, len);
+		ret = xe_guc_page_reclaim_done_handler(guc, payload, adj_len);
+		break;
 	default:
 		xe_gt_warn(gt, "NOT_POSSIBLE");
 	}
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index e13c71a89da2..60b0fda59ce3 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -11,6 +11,7 @@
 #include "xe_page_reclaim.h"
 
 #include "xe_gt_stats.h"
+#include "xe_guc_tlb_inval.h"
 #include "xe_macros.h"
 #include "xe_pat.h"
 #include "xe_sa.h"
@@ -130,3 +131,22 @@ int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
 
 	return page ? 0 : -ENOMEM;
 }
+
+/**
+ * xe_guc_page_reclaim_done_handler() - Page reclaim done handler
+ * @guc: guc
+ * @msg: message indicating page reclamation done
+ * @len: length of message
+ *
+ * Page reclamation is an extension of TLB invalidation. Both
+ * operations share the same seqno and fence. When either
+ * action completes, we need to signal the corresponding
+ * fence. Since the handling logic is currently identical, this
+ * function delegates to the TLB invalidation handler.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
+int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	return xe_guc_tlb_inval_done_handler(guc, msg, len);
+}
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index 3dd103e37beb..0412611f3af7 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -20,6 +20,7 @@ struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
 struct xe_tile;
 struct xe_gt;
+struct xe_guc;
 struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
@@ -122,4 +123,6 @@ static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry
 		put_page(virt_to_page(entries));
 }
 
+int xe_guc_page_reclaim_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
 #endif	/* _XE_PAGE_RECLAIM_H_ */
-- 
2.43.0

