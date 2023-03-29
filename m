Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB1DC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 17:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9BC10EBD6;
	Wed, 29 Mar 2023 17:33:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C7F10EBCE
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680111234; x=1711647234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hRlTxqb2HA7KwOyqIP4d8hYA/BshH5ADiZ1jQRTMurU=;
 b=UF98QyhMQbN1vDFpXEOx2aJgZTm3hMiy2f7qxY8tTZFwQexQAa9Aq3sV
 XpG0wqVBzRL1o2GEwSDfYAM+LESaaFeNVc8TuVcIi2qokk2eH3T9Gxy0n
 RSZwKd3gyeUwfbZfYAuisKuVCxuWchAl/mzR4EWwQjCS/jfLZy0H2tbUf
 HdgodBGpaSe30OEgCQO3w5B9xU4SWkN22Kz6yHwMMhWLrT5HRaBs5cuY8
 BsdZMY4Q+D4LhDx3rgo/kBzEss/owB/9ZU5RT2SfhOV+sYx0rhj4rBSkG
 NUPuKFvwDplgfqQh9ClEKBMqZ5PWN+0xgkt3Fp2I3FgIKEzQRgWrh3OAc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405896898"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="405896898"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677854285"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="677854285"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 10:33:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Mar 2023 10:33:32 -0700
Message-Id: <20230329173334.4015124-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329173334.4015124-1-matthew.d.roper@intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Include hardware prefetch buffer in
 batchbuffer allocations
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The hardware prefetches several cachelines of data from batchbuffers
before they are parsed.  This prefetching only stops when the parser
encounters an MI_BATCH_BUFFER_END instruction (or a nested
MI_BATCH_BUFFER_START), so we must ensure that there is enough padding
at the end of the batchbuffer to prevent the prefetcher from running
past the end of the allocation and potentially faulting.

Bspec: 45717
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 5b24018e2a80..f326f117ba3b 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -8,11 +8,26 @@
 #include "regs/xe_gpu_commands.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
+#include "xe_gt.h"
 #include "xe_hw_fence.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
+static int bb_prefetch(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt->xe;
+
+	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
+		/*
+		 * RCS and CCS require 1K, although other engines would be
+		 * okay with 512.
+		 */
+		return SZ_1K;
+	else
+		return SZ_512;
+}
+
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
@@ -21,8 +36,14 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	if (!bb)
 		return ERR_PTR(-ENOMEM);
 
-	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool :
-			      &gt->usm.bb_pool, 4 * dwords + 4);
+	/*
+	 * We need to allocate space for the requested number of dwords,
+	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
+	 * space to accomodate the platform-specific hardware prefetch
+	 * requirements.
+	 */
+	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
+			      4 * (dwords + 1) + bb_prefetch(gt));
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
 		goto err;
-- 
2.39.2

