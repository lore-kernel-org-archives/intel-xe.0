Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA9C0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 08:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5F610E405;
	Wed,  9 Aug 2023 08:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803610E405
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691570695; x=1723106695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mUJ8DScagqJXouEOzU9fOnjG+wfaH2ywiQYQZH4CqkU=;
 b=Sa7tN5rN/q/aTjz5QuvSSTRxRFKPx/Lb3qes4fHAHWDJdgf1Pngwj5Nd
 pIVPkxmFBfxYtotix9AZgOOWz6fA3VesR6MOf1Fvu2Z8dZA6IL7v+zx+Q
 zdI2fzAaxUr3HLc14w2NKyvLT6+TNsMi4kurOwIpNS24TBAFY1FYxGdf+
 50vNpcHeRCJ5qKgurv4rB9/nf2Z/UOkdijAyVw+Iz17B1knqh2FUxLiqf
 dp/HE+HIiLBljOjvueODndL8APLZdiqu9Y6K7T0ECYWSob/MA6L9iw8uS
 tcroUjhmAOlLVW6DOHDTqRAG12ga+BsZUsbvYHGrfjQzFcaZQZSwP4i/z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351374994"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="351374994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 01:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="875149348"
Received: from cwilso3-mobl.fi.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.31])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 01:44:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 09:44:24 +0100
Message-ID: <20230809084423.188541-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: don't warn for bogus pagefaults
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

This appears to be easily user triggerable so warning is perhaps too
much. Rather just make it debug print.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/534
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 125e4744fa38..b6f781b3d9d7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -265,7 +265,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
 
 static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 {
-	drm_warn(&xe->drm, "\n\tASID: %d\n"
+	drm_dbg(&xe->drm, "\n\tASID: %d\n"
 		 "\tVFID: %d\n"
 		 "\tPDATA: 0x%04x\n"
 		 "\tFaulted Address: 0x%08x%08x\n"
@@ -370,7 +370,7 @@ static void pf_queue_work_func(struct work_struct *w)
 	if (unlikely(ret)) {
 		print_pagefault(xe, &pf);
 		pf.fault_unsuccessful = 1;
-		drm_warn(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
+		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
 	}
 
 	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 52c61f78b083..0418313c92eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1643,7 +1643,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_warn(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
+	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-- 
2.41.0

