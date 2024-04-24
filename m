Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449B4C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 04:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490110FBA4;
	Wed, 24 Apr 2024 04:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKKRQCk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B341010FBA4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713931513; x=1745467513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2cxpkcw2QMKId9Dix2YEx2U9u/EPOpCM86CjZRNdSSc=;
 b=YKKRQCk3VTjh/lop/KkNJ8RvMbT2iQMEaNIm9nu7CQrLX/Dvk4q78N6r
 yFad9IiZS8Ghfw+WCitgqDiBUhhaxAGooCA/Gn8IfxPYs66dMh8EUO2r4
 jgUPrmGet+yr/Qdoc1RrmgOkCP1meMBa0FbHOcxC603cKizJrpeXGh56q
 Dtgh10muc2k58ePEAPWWE6DIjHLVl2r7RcmAhhRFto0bQSvcEf9n/r0xc
 y6JEKsLyk2eO0HIEQYj79C2htkWJuG0gqWqp/T4Y7SgxJ6Isv7845QtEo
 3xHztiB2DztqIt0vLKoC2nCj6b0ZS8O2qGMwG98fO9IHfwT3CepctABbS g==;
X-CSE-ConnectionGUID: 2jG7dgydTlmNvR4QEqT/2w==
X-CSE-MsgGUID: GM2Ekdc8QOaNmhK7otcHrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9411165"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9411165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 21:05:13 -0700
X-CSE-ConnectionGUID: KoMhf9YCQTqyy6Iny8UUxg==
X-CSE-MsgGUID: Gm9sAsUGRHi+VV1nBZU9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24580795"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 21:05:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Change xe_guc_submit_stop return to void
Date: Wed, 24 Apr 2024 09:49:11 +0530
Message-Id: <20240424041911.2184868-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

The function xe_guc_submit_stop consistently returns 0 without an error
state, prompting the caller to verify it, which is redundant.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  4 +---
 drivers/gpu/drm/xe/xe_guc.c        | 10 ++--------
 drivers/gpu/drm/xe/xe_guc.h        |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 +--
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 +-
 drivers/gpu/drm/xe/xe_uc.c         | 12 ++++--------
 drivers/gpu/drm/xe/xe_uc.h         |  2 +-
 7 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 491d0413de15..1c661dadd12c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -655,9 +655,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
 
-	err = xe_uc_stop(&gt->uc);
-	if (err)
-		goto err_out;
+	xe_uc_stop(&gt->uc);
 
 	xe_gt_tlb_invalidation_reset(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 240e7a4bbff1..4822bf8565b4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -891,17 +891,11 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
 }
 
-int xe_guc_stop(struct xe_guc *guc)
+void xe_guc_stop(struct xe_guc *guc)
 {
-	int ret;
-
 	xe_guc_ct_stop(&guc->ct);
 
-	ret = xe_guc_submit_stop(guc);
-	if (ret)
-		return ret;
-
-	return 0;
+	xe_guc_submit_stop(guc);
 }
 
 int xe_guc_start(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 94f2dc5f6f90..a3c92b74a3d5 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,7 +35,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
 int xe_guc_reset_prepare(struct xe_guc *guc);
 void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
-int xe_guc_stop(struct xe_guc *guc);
+void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
 bool xe_guc_in_reset(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..a0968e3204be 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1458,7 +1458,7 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc)
 	wait_event(guc->ct.wq, !guc_read_stopped(guc));
 }
 
-int xe_guc_submit_stop(struct xe_guc *guc)
+void xe_guc_submit_stop(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -1478,7 +1478,6 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 	 * creation which is protected by guc->submission_state.lock.
 	 */
 
-	return 0;
 }
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fad0421ead36..4275b7da9df5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -16,7 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
-int xe_guc_submit_stop(struct xe_guc *guc);
+void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 4feb35c95a1c..0f6cfe06e635 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -215,13 +215,13 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
 	xe_guc_stop_prepare(&uc->guc);
 }
 
-int xe_uc_stop(struct xe_uc *uc)
+void xe_uc_stop(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		return;
 
-	return xe_guc_stop(&uc->guc);
+	xe_guc_stop(&uc->guc);
 }
 
 int xe_uc_start(struct xe_uc *uc)
@@ -247,17 +247,13 @@ static void uc_reset_wait(struct xe_uc *uc)
 
 int xe_uc_suspend(struct xe_uc *uc)
 {
-	int ret;
-
 	/* GuC submission not enabled, nothing to do */
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	uc_reset_wait(uc);
 
-	ret = xe_uc_stop(uc);
-	if (ret)
-		return ret;
+	xe_uc_stop(uc);
 
 	return xe_guc_suspend(&uc->guc);
 }
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index e4d4e3c99f0e..5dfa7725483d 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -16,7 +16,7 @@ int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
-int xe_uc_stop(struct xe_uc *uc);
+void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
-- 
2.25.1

