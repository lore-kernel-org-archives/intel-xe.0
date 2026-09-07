Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F3EC79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D3E10E462;
	Mon,  7 Sep 2026 08:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yoi1sdVg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A6110E436
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770170; x=1820306170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5XRWFKp2j3CTLjt88bA42oNOTdbjd7Y2slLhVNRGJB0=;
 b=Yoi1sdVgJkz3s5xTR8yPeoOpyStrpSOA+iuRfUTWVkvyil3AHOeHXEkA
 DaDq4oMuBicjMyWHcPbd/gBuy/jF7OWBBa4g2qdinUqYHGaKCq4XBHqJ+
 RHxmAEWja5rTt+5NZ9r9DrrSnYPfucdD7JpySZxoFODxJAJyBzGt0plmn
 CL2Co41tnoAQK6cN+O8h1IEb8AWtDGsaDJnuVCPRcFRtAUyzod/bYbhja
 1pkE0XQ52x6vDDj9+Df/y0ESElaOC1xb87fR0Xczxsk4p0+VYTyUjEGQb
 DJwODngkN38uHLzzGfvJy4+ADa3Wgw+BA/0x+UJNiDe80hiTg29Hsgjjs g==;
X-CSE-ConnectionGUID: tWUZGtJdQY2+vaNRy9demQ==
X-CSE-MsgGUID: OCDWpojUQZKL9DoBSMOxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76725970"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="76725970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:10 -0700
X-CSE-ConnectionGUID: 738cotOwQmW4yRai51WtxQ==
X-CSE-MsgGUID: nrpT8w49T22tccWMEsxixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274451015"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 01:36:08 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 1/5] drm/xe/gt: Use GT ordered workqueue for wedging
Date: Mon,  7 Sep 2026 14:04:36 +0530
Message-ID: <20260907083541.2194747-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907083541.2194747-1-raag.jadav@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
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
teardown synchronously. This can result in tdr timeout in cases where
the device is declared wedged while jobs are still in-flight.

Introduce a worker for GT specific wedge handling and queue the teardown
on GT ordered workqueue, so we don't disrupt the scheduler while jobs
are still in-flight.

Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Split fixes into separate patches (Rodrigo, Michal)
---
 drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 478e047031f4..200e34331c19 100644
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
@@ -1195,6 +1207,7 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
-	xe_uc_declare_wedged(&gt->uc);
-	xe_tlb_inval_reset(&gt->tlb_inval);
+	/* Prevent queueing uninitialized worker if hit during probe */
+	if (gt->wedge.worker.func)
+		queue_work(gt->ordered_wq, &gt->wedge.worker);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 628911346455..b11ac52b0ab7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -233,6 +233,12 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
+	/** @wedge: state for GT wedge */
+	struct {
+		/** @wedge.worker: worker for GT wedge to be done async */
+		struct work_struct worker;
+	} wedge;
+
 	/** @tlb_inval: TLB invalidation state */
 	struct xe_tlb_inval tlb_inval;
 
-- 
2.43.0

