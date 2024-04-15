Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28524C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5F10E9BA;
	Mon, 15 Apr 2024 19:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRaDUIKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51B110E9BA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713207866; x=1744743866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoAenCJr1mS6CdLjWX5wVKOSFYh/YnuNiL6FDWelDxA=;
 b=bRaDUIKfPwIZ/hYxTuZzDq3VaQdzREdblr6ihlA2Dfna0UIa34pCRJag
 2lPoS4I0oDmweeX/lUC/SW7dRSi9eoB+ZS4IpyyCseTWpmGflAfOAQCau
 cRClWN2D8i0IwoazIRDp83L+osi0tlklA7CwDL018cWNtSxKFsIP6XjDS
 Wqb1HQPweCpgCuuDM/nSmuhloawzKTC6K5fQiuw8o3xZxsXRsWZItgwYN
 rlLQaG7pcA9rbZ16QnrwtHnBEHgiITJGcniEUtY8xhHJXRidpFZXHPxC5
 hUXa8+DGAxzsh/p8Mq0pocUCfsSRCAEzVWu7jZnJ5ORW1ESUiL0OGnlsE Q==;
X-CSE-ConnectionGUID: 9T+nF0rgTa2prUY4gPJVZA==
X-CSE-MsgGUID: oTOR0707TayIkR7c6TJKhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12463721"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="12463721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:04:26 -0700
X-CSE-ConnectionGUID: hBgcaIIqTo2R5Tomr3wLdw==
X-CSE-MsgGUID: hNaoJSbyQJiRWzaFOgMa6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22018416"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:04:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 1/1] drm/xe: Only use reserved BCS instances for usm migrate
 exec queue
Date: Mon, 15 Apr 2024 12:04:53 -0700
Message-Id: <20240415190453.696553-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240415190453.696553-1-matthew.brost@intel.com>
References: <20240415190453.696553-1-matthew.brost@intel.com>
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

The GuC context scheduling queue is 2 entires deep, thus it is possible
for a migration job to be stuck behind a fault if migration exec queue
shares engines with user jobs. This can deadlock as the migrate exec
queue is required to service page faults. Avoid deadlock by only using
reserved BCS instances for usm migrate exec queue.

Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate engine on PVC")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9f6e9b7f11c8..c37bb7dfcf1f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -12,8 +12,6 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
-#include <generated/xe_wa_oob.h>
-
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gtt_defs.h"
@@ -34,7 +32,6 @@
 #include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
-#include "xe_wa.h"
 
 /**
  * struct xe_migrate - migrate context.
@@ -300,10 +297,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 }
 
 /*
- * Due to workaround 16017236439, odd instance hardware copy engines are
- * faster than even instance ones.
- * This function returns the mask involving all fast copy engines and the
- * reserved copy engine to be used as logical mask for migrate engine.
  * Including the reserved copy engine is required to avoid deadlocks due to
  * migrate jobs servicing the faults gets stuck behind the job that faulted.
  */
@@ -317,8 +310,7 @@ static u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
 		if (hwe->class != XE_ENGINE_CLASS_COPY)
 			continue;
 
-		if (!XE_WA(gt, 16017236439) ||
-		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
+		if (xe_gt_is_usm_hwe(gt, hwe))
 			logical_mask |= BIT(hwe->logical_instance);
 	}
 
@@ -369,6 +361,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		/*
+		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
+		 * PVC, may want to revisit if performance is needed.
+		 */
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
-- 
2.34.1

