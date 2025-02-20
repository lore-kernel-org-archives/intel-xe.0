Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23900C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 12:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE75310E0E0;
	Thu, 20 Feb 2025 12:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/Ca/wYZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC7D10E0E0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054739; x=1771590739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=teX+gqqBDPFpZu54J5LJfevpZ8i/jiHTTuJrHLEr/Yk=;
 b=B/Ca/wYZboKHPPj4V7Z92vs7g0lVB1RVqn4cV0UCDHboxrwd3DyoM56P
 vvm3DxFc2yC0Un7cQAIT/y6/rZ7DNjM8lRNPcJKDOXY26YNLmLS+XpByW
 iDz3vPcUkaP/Orz2EC3UeFdbsCpEQJeE9QUSl8Ez00Pdd0I0j+VZKeLXA
 0cPgSz5H0sQ+GEbtPBqhNofBf/CseSQSKJnNQo8dzhm8qZ/Y/iZtEJQHN
 b9mgbPjdMD8KdO1zjPhIgwSZ6iR6UiXO4t+N3WDYBHl+Hmd3oIt8ELKPx
 02/ink/Se/DrgADS9ypodgKAHkAexkgg6Uju2O0Sd/NZDfKtvAuhJn3UU g==;
X-CSE-ConnectionGUID: /0SVaFQdRSO2a5iRtO8bHg==
X-CSE-MsgGUID: fdWoX1wsR7WW91TCIGVQSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51472010"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51472010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:32:18 -0800
X-CSE-ConnectionGUID: sEvDnQJgQn6hMzt2KO4Mdg==
X-CSE-MsgGUID: dlI2p9quSGmc59TnhFW94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="115006229"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:32:16 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, badal.nilawar@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Make sure scheduler is ready before submission
Date: Thu, 20 Feb 2025 18:08:59 +0530
Message-Id: <20250220123859.291523-1-tejas.upadhyay@intel.com>
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

Async call to __guc_exec_queue_fini_async frees scheduler
while some scheduler submission would have already started.
To handle such small window race case, submission should only
start when scheduler is ready.

It will help to solve below which is not easily reproducible,
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 50361b4638f9..42ca3c4a299a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
 
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
 {
+	/* Async call to __guc_exec_queue_fini_async frees scheduler
+	 * while some scheduler submission would have already started.
+	 * To handle such small window race case, submission should only
+	 * start when scheduler is ready.
+	 */
+	if (!drm_sched_wqueue_ready(&sched->base))
+		return;
+
 	drm_sched_wqueue_start(&sched->base);
 	queue_work(sched->base.submit_wq, &sched->work_process_msg);
 }
-- 
2.34.1

