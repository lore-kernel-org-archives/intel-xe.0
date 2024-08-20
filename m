Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4584C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5B10E237;
	Tue, 20 Aug 2024 20:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANkd0UXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220D710E237
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185334; x=1755721334;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cpEXrAZr41wJQ5sGOWBaZQ8sG4pktXEf6XpzPVqXiQ=;
 b=ANkd0UXTtCvlyJMQlPshRtZhCVujb9ufJQqpICElGi2I8DhIvRuOKtGA
 fiG5oekP0isoVfeydeEKxcB98Mj0wbRUC+RYO8dD6xSLJPNs9mTTHuD0O
 oOJDoAN7HRehm/KDLPkJcFd54TMSNNT3pZnYKn/fg+QhhymGSvXzXbIaG
 oeUEkIKHuUssA2UZjhR85AV8/UkRcCdMplRS5NihY3ff8L2pGZWvQK/Me
 UZ7y7yym262orx2vqGbT51ie7dkICyfSb4O6AEpOEhVCcFVs7+9S8gX+w
 142p8xjtLS7Hs4wHdGKTENq1cgFVtR2VtyDhAENPZR4DuYiJcouvpQs4T g==;
X-CSE-ConnectionGUID: A2is753bRGewoD0+fDGC7Q==
X-CSE-MsgGUID: RqnH9i39RW+oQQ8TZRH+BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22044575"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22044575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:22:13 -0700
X-CSE-ConnectionGUID: gvnBYchBT/+XMfXtcsG4rg==
X-CSE-MsgGUID: YtvEkem3S7WahPW7GLw2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60553025"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:22:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Free job before xe_exec_queue_put
Date: Tue, 20 Aug 2024 13:23:09 -0700
Message-Id: <20240820202309.1260755-1-matthew.brost@intel.com>
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

Free job depends on job->vm being valid, the last xe_exec_queue_put can
destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 44d534e362cd..9628f9deb3c0 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -171,12 +171,13 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
 	struct xe_device *xe = job_to_xe(job);
+	struct xe_exec_queue *q = job->q;
 
 	xe_sched_job_free_fences(job);
-	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
+	xe_exec_queue_put(q);
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

