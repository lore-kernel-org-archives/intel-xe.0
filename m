Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59DCD8CAD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F56310F769;
	Mon,  8 Jun 2026 16:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+QBMqcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAED10F77E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937695; x=1812473695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PKJxK0pSgWlxwLmDGuO43NHPyWeeu77lollOkb6vxXE=;
 b=L+QBMqcuDny4Q4ZbT6DhChANewDk4HQ84E/IbkDhdVmxMMiyFN7jBDCx
 20CypD/Kauxy/JNlrCLt7LUqGA/yzg3MSKO7Zz6Dnc3kdXn8ap1KVKFV+
 m8bEPt9ML3EJJ0roqNTfmm8hXMP2DtU9TrCxM5CLArXXi4cvjEheU1K40
 pJVOcgnhkoF3P4oVtRqsH7GpJn+HuHH24domHpiHIggngzDLiMwiECpJO
 sh2/xoPCJ8Qwn7bxVyQHQYxui8pjFj3bMU0xKUS74k6WlkdOgfg1RMzeI
 DrIqN3t/QUWybn6FoxWVLjTXvJ9GrJt8q3SoO53mECUre6kUHexShwhTi A==;
X-CSE-ConnectionGUID: 2sySiheaRoykC3WSAlEH+Q==
X-CSE-MsgGUID: Vnb9ILhMRJGO0+7O/AZfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744570"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:55 -0700
X-CSE-ConnectionGUID: WeKhXrIHRVC+NOd0LRAJUg==
X-CSE-MsgGUID: dfqXmXC7QFuRNI6pqP96Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467596"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 12/16] drm/xe/ggtt: Expand __xe_ggtt_init_early()
Date: Mon,  8 Jun 2026 18:54:25 +0200
Message-ID: <20260608165429.587-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We can do more stuff in this software-only initialization function,
even under kunit. This will allow us to develop some xe_ggtt tests.
Note that we keep the GGTT offline for the kunit, as we don't have
access to the GTTMMADR (regs and gsm) from there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 106 ++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..5f4c2ae3293a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -6,6 +6,8 @@
 #include "xe_ggtt.h"
 
 #include <kunit/visibility.h>
+#include <kunit/test-bug.h>
+
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/sizes.h>
@@ -329,6 +331,15 @@ static void ggtt_fini(void *arg)
 	ggtt->scratch = NULL;
 }
 
+static void dev_fini_ggtt(void *arg)
+{
+	struct xe_ggtt *ggtt = arg;
+
+	scoped_guard(mutex, &ggtt->lock)
+		ggtt->flags &= ~XE_GGTT_FLAGS_ONLINE;
+	drain_workqueue(ggtt->wq);
+}
+
 #ifdef CONFIG_LOCKDEP
 void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 {
@@ -354,29 +365,66 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static int __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
+	xe_tile_assert(ggtt->tile, IS_ALIGNED(size, XE_PAGE_SIZE));
+	xe_tile_assert(ggtt->tile, start >= xe_wopcm_size(xe));
+	xe_tile_assert(ggtt->tile, start + size <= GUC_GGTT_TOP);
+
 	ggtt->start = start;
 	ggtt->size = size;
+	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
+
+	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		ggtt->flags |= XE_GGTT_FLAGS_64K;
+
+	if (GRAPHICS_VERx100(xe) >= 1270)
+		ggtt->pt_ops =
+			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
+			(ggtt->tile->primary_gt && XE_GT_WA(ggtt->tile->primary_gt, 22019338487)) ?
+			&xelpg_pt_wa_ops : &xelpg_pt_ops;
+	else
+		ggtt->pt_ops = &xelp_pt_ops;
+
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+	if (!ggtt->wq)
+		return -ENOMEM;
+
 	drm_mm_init(&ggtt->mm, 0, size);
+
+	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
+	if (err)
+		return err;
+
+	ggtt->flags |= XE_GGTT_FLAGS_ONLINE;
+	return 0;
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	int err;
+
+	/* this is kunit only function - do not abuse! */
+	xe_tile_assert(ggtt->tile, kunit_get_current_test());
+
+	err = __xe_ggtt_init_early(ggtt, start, size);
+	if (err)
+		return err;
+
+	/* we don't have GTTMMADR on kunit (yet) */
+	ggtt->flags &= ~XE_GGTT_FLAGS_ONLINE;
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
 
-static void dev_fini_ggtt(void *arg)
-{
-	struct xe_ggtt *ggtt = arg;
-
-	scoped_guard(mutex, &ggtt->lock)
-		ggtt->flags &= ~XE_GGTT_FLAGS_ONLINE;
-	drain_workqueue(ggtt->wq);
-}
-
 /**
  * xe_ggtt_init_early - Early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -392,9 +440,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u64 wopcm = xe_wopcm_size(xe);
+	u64 ggtt_start, ggtt_size;
 	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
-	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
 		if (GRAPHICS_VERx100(xe) >= 1250)
@@ -407,6 +455,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		}
 		ggtt_start = wopcm;
 		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
+
+		if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
+			ggtt_size = GUC_GGTT_TOP - ggtt_start;
+
 	} else {
 		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
 		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
@@ -419,33 +471,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		}
 	}
 
-	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
-	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
-		ggtt->flags |= XE_GGTT_FLAGS_64K;
-
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
-	if (GRAPHICS_VERx100(xe) >= 1270)
-		ggtt->pt_ops =
-			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
-			(ggtt->tile->primary_gt && XE_GT_WA(ggtt->tile->primary_gt, 22019338487)) ?
-			&xelpg_pt_wa_ops : &xelpg_pt_ops;
-	else
-		ggtt->pt_ops = &xelp_pt_ops;
-
-	ggtt->wq = alloc_workqueue("xe-ggtt-wq", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
-	if (!ggtt->wq)
-		return -ENOMEM;
-
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
-
-	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
-	if (err)
-		return err;
-
-	ggtt->flags |= XE_GGTT_FLAGS_ONLINE;
-	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
+	return __xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
 }
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
-- 
2.47.1

