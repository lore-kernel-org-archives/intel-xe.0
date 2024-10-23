Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A337FD0BB4A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C6710E879;
	Wed, 23 Oct 2024 23:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+TqIXLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8E10E1CD;
 Wed, 23 Oct 2024 23:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729727932; x=1761263932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/YVHzBeDHnXn32bNoEdZ472/KOq5ttreaPrtPOFnfzM=;
 b=d+TqIXLXkMPdJRyuyWPH+mna2uU6CX62AUTUeURdKL+4yUaoeT3N2rzq
 St9lN5Z5IdSwU6XtotF/hvTLpYC54dFDjzEpvl5VOmzZCnwLIyRZLWN6s
 DXf5zJCMMlHPv0QR3149PO9b/riMUnuPBq0SFdqyzerzkZwGseVZZkOP5
 OA0TcvjW3f6A6CbdfHIiNhJQ/P+klwWLt/Fy8gbf1njeUMyeqbW8Lhq9V
 LcUQ4WIUEEhgVTirbEMoeu4uoFaW9j8UJNeg2gZbD1CtO4MFegK54+Btd
 qt1rCFrzQhd5ItXGcGA5APmFFe7qlzQil5M3oaSNxplo5TEgm7LC0GIzz A==;
X-CSE-ConnectionGUID: 4pRq01D2RNGDyyAxfU49fg==
X-CSE-MsgGUID: QOMsMqh1S0Wgj2CN7PElEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29506610"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29506610"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:58:52 -0700
X-CSE-ConnectionGUID: 33Gi5K+PT6eobU6Oy/emqg==
X-CSE-MsgGUID: pWucxhL5Qkq5b3euRwSDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80424237"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:58:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com,
	ltuikov89@gmail.com
Subject: [PATCH v2] drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM
Date: Wed, 23 Oct 2024 16:59:17 -0700
Message-Id: <20241023235917.1836428-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the path
of dma-fences, and dma-fences are in the path of reclaim. Mark scheduler
work queue with WQ_MEM_RECLAIM to ensure forward progress during
reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
progress during reclaim.

v2:
 - Fixes tags (Philipp)
 - Reword commit message (Philipp)

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: stable@vger.kernel.org
Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for submit_wq")
Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 540231e6bac6..df0a5abb1400 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->own_submit_wq = false;
 	} else {
 #ifdef CONFIG_LOCKDEP
-		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
+		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
+								       WQ_MEM_RECLAIM,
 								       &drm_sched_lockdep_map);
 #else
-		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
 #endif
 		if (!sched->submit_wq)
 			return -ENOMEM;
-- 
2.34.1

