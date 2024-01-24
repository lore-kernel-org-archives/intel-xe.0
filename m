Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73378C47E49
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 21:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE510EA85;
	Wed, 24 Jan 2024 21:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93FC10EA85;
 Wed, 24 Jan 2024 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706130455; x=1737666455;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dB4f0pDY1s15SvQtL3fiprEgd4+G3arZGgic7zjjLec=;
 b=Ae6hpFRv6cuAWdkRywb82R41NIO1W7+KvAI8y5QKL3INnokj8blj6Fsq
 d4flbapEOWft1nnvlkTyMlERuDlYdkdbn/qnx+T+X1qogOjyubAZw01pg
 k3hY8p/NbDziVMP724r8pMu+1A5VxuWSOPYSaAfAoYUkA5QhsRUv+7/7r
 AAPv59qSLAotEaGIe8Arn3UA2hOcdcBOzK1rSA4n1jHkZhoztIvmbNQqz
 kZlDqRR0CNWg4LihtYgGqUcFqJQcvJFAWSrT+IN68Slx0tVlW8+o1hs1R
 IYbXQzUiVgj80CCzKEDkxf/HoQefCRo10AN4mJdY9p6LPmKdhV/B+Mnt4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1865185"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1865185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 13:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820583390"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820583390"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 13:07:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
Date: Wed, 24 Jan 2024 13:08:11 -0800
Message-Id: <20240124210811.1639040-1-matthew.brost@intel.com>
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
Cc: ltuikov89@gmail.com, Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 christian.koenig@amd.com, Vlastimil Babka <vbabka@suse.cz>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All entities must be drained in the DRM scheduler run job worker to
avoid the following case. An entity found that is ready, no job found
ready on entity, and run job worker goes idle with other entities + jobs
ready. Draining all ready entities (i.e. loop over all ready entities)
in the run job worker ensures all job that are ready will be scheduled.

Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
Reported-by: Vlastimil Babka <vbabka@suse.cz>
Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 550492a7a031..85f082396d42 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	struct drm_sched_entity *entity;
 	struct dma_fence *fence;
 	struct drm_sched_fence *s_fence;
-	struct drm_sched_job *sched_job;
+	struct drm_sched_job *sched_job = NULL;
 	int r;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	entity = drm_sched_select_entity(sched);
+	/* Find entity with a ready job */
+	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
+		sched_job = drm_sched_entity_pop_job(entity);
+		if (!sched_job)
+			complete_all(&entity->entity_idle);
+	}
 	if (!entity)
-		return;
-
-	sched_job = drm_sched_entity_pop_job(entity);
-	if (!sched_job) {
-		complete_all(&entity->entity_idle);
 		return;	/* No more work */
-	}
 
 	s_fence = sched_job->s_fence;
 
-- 
2.34.1

