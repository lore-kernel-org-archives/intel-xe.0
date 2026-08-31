Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E1C61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F2C10E25E;
	Mon, 31 Aug 2026 04:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntTu5W9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7596F10E25E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788150414; x=1819686414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sZWegSr6pB1AGiwCvs7diZ+aD0a4eWbrXH4Jx7z3vY=;
 b=ntTu5W9GKRndXs55Hc41+/Yza8k1uqdRmcfIajNitDEGc6jDXsWnor+b
 jAZuLlsls9lGpmcsbtNlBtUXKxfl3KbRk5QsHszX/iZR4+TKLZoXytQ8R
 3ZI3chhVENPNsDq2ARrwavbxzvgWNSveZDHR8rfedWGGmTcWgSFmm2tg5
 34filWTt+QHyYvquobRDmN4lGdBadxWT6ydyEjQIcTS4E9PUMS/hmMjvS
 7e3em8m5w3dIcO2IGz2oll/2l3ZKdRShiUYfw55V9bsSOoZ3QADGNaZkr
 XVU02boF6I9/ReZBt4lwY+N+JiZjjK4kb5dHzNPt+qib2o+80tFVGkJjR g==;
X-CSE-ConnectionGUID: xp8GTxb8RGCvohpAatQEVA==
X-CSE-MsgGUID: 4enboh5WQeyYHMQFHeAy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106072224"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106072224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:26:54 -0700
X-CSE-ConnectionGUID: GWQ/Ha7VQ0G/8hszi0K6dg==
X-CSE-MsgGUID: QyCSRBEdSx+CbopOGbircg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272878091"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 21:26:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Mon, 31 Aug 2026 09:55:49 +0530
Message-ID: <20260831042633.1760474-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831042633.1760474-1-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
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

Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
teardown synchronously. This is problematic in cases where the jobs are
still in-flight when the device is declated wedged.

Introduce a worker for GT specific wedge handling and queue the teardown
on GT ordered workqueue, so we don't disrupt the scheduler while jobs
are still in-flight.

Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 15 +++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 478e047031f4..5c201327a747 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -173,6 +173,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 }
 
 static void gt_reset_worker(struct work_struct *w);
+static void gt_wedge_worker(struct work_struct *w);
 
 static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
 			 long timeout_jiffies, bool force_reset)
@@ -704,6 +705,8 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
+	disable_work_sync(&gt->wedge.worker);
+
 	if (disable_work_sync(&gt->reset.worker))
 		/*
 		 * If gt_reset_worker was halted from executing, take care of
@@ -723,6 +726,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int i;
 
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
+	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
@@ -1005,6 +1009,14 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		xe_pm_runtime_put(xe);
 }
 
+static void gt_wedge_worker(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
+
+	xe_uc_declare_wedged(&gt->uc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
+}
+
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	xe_uc_suspend_prepare(&gt->uc);
@@ -1195,6 +1207,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
-	xe_uc_declare_wedged(&gt->uc);
-	xe_tlb_inval_reset(&gt->tlb_inval);
+	queue_work(gt->ordered_wq, &gt->wedge.worker);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 628911346455..ca1e2f82470d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -233,6 +233,15 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @wedge: state for GT wedge */
+	struct {
+		/**
+		 * @wedge.worker: work so GT wedge to be done async allowing the wedge
+		 * code to safely flush all code paths
+		 */
+		struct work_struct worker;
+	} wedge;
+
 	/** @tlb_inval: TLB invalidation state */
 	struct xe_tlb_inval tlb_inval;
 
-- 
2.43.0

