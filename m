Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32632C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 19:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0730310E491;
	Tue, 28 Mar 2023 19:58:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5056D10E4AE
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680033504; x=1711569504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zsgb/DaLcD363ffzdrc95cZK0TnEuNU/zyNePGClds=;
 b=evIzkG1nd7g+BTeoovrCjl0RcSXXgRdo4IG5GSvVeLaK97N9wWhP6KSJ
 UwhZ93Hr42DXfhsm8umFPYlaq7IG6SEVLEPpADyWg8nY6s21/HPm6iwuf
 Z/oiLrEoZPwdMrAHFUGbbbzc++/pY4p+ap5Uon8bCAbuP3eKJruLxoAP2
 o31lU5vrrBIa24Ntzsivpf7T3nffScyGpQ0aa/zxvRCaLvBZzNgVJBw9n
 KseMQIS6NJp1rStIWVKdL+1h9ZAV/70E4t+x4qybcL0lRDBe5y/yp8ahV
 fbnAYBlQIrCrtkDIb24oFx1xYOpdEGypP/cKjvJeoIRFtNOHApWmULxHG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343087487"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="343087487"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827609934"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="827609934"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 12:58:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 12:58:21 -0700
Message-Id: <20230328195822.1941865-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328195822.1941865-1-matthew.brost@intel.com>
References: <20230328195822.1941865-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Better error messages for
 xe_gt_record_default_lrcs
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

Add some error messages describing the problem when
xe_gt_record_default_lrcs fails.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6322e0689a9e..724ba2be5d3d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_engine_types.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -257,30 +258,46 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 				     hwe, ENGINE_FLAG_WA);
 		if (IS_ERR(e)) {
 			err = PTR_ERR(e);
+			drm_err(&xe->drm, "gt%d, hwe %d:%d, xe_engine_create,e failed=%d",
+				gt->info.id, hwe->class, hwe->instance, err);
 			goto put_vm;
 		}
 
 		/* Prime golden LRC with known good state */
 		err = emit_wa_job(gt, e);
-		if (err)
+		if (err) {
+			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_wa_job,e failed=%d",
+				gt->info.id, hwe->class, hwe->instance,
+				e->guc->id, err);
 			goto put_engine;
+		}
 
 		nop_e = xe_engine_create(xe, vm, BIT(hwe->logical_instance),
 					 1, hwe, ENGINE_FLAG_WA);
 		if (IS_ERR(nop_e)) {
 			err = PTR_ERR(nop_e);
+			drm_err(&xe->drm, "gt%d, hwe %d:%d, xe_engine_create,nop_e failed=%d",
+				gt->info.id, hwe->class, hwe->instance, err);
 			goto put_engine;
 		}
 
 		/* Switch to different LRC */
 		err = emit_nop_job(gt, nop_e);
-		if (err)
+		if (err) {
+			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_nop_job,nop_e failed=%d",
+				gt->info.id, hwe->class, hwe->instance,
+				nop_e->guc->id, err);
 			goto put_nop_e;
+		}
 
 		/* Reload golden LRC to record the effect of any indirect W/A */
 		err = emit_nop_job(gt, e);
-		if (err)
+		if (err) {
+			drm_err(&xe->drm, "gt%d, hwe %d:%d, guc_id=%d, emit_nop_job,e failed=%d",
+				gt->info.id, hwe->class, hwe->instance,
+				e->guc->id, err);
 			goto put_nop_e;
+		}
 
 		xe_map_memcpy_from(xe, default_lrc,
 				   &e->lrc[0].bo->vmap,
-- 
2.34.1

