Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA22C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 16:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AE710EC62;
	Thu,  6 Apr 2023 16:28:53 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D3610EC62
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680798531; x=1712334531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xSgHJEB2xj6AWJjWnTHyuTRaNaJh9gKN5CV0S1y6yW8=;
 b=JUWMJTyEfzEOoahGW/KDJkbiyzTDtjyOyy/jeqdTMGNPxAR4HQEAhDdh
 DQqGdNw8X9VY9p4eaU2ffXM8SqrQulaZSFQXgnTA0zcXpsciw6PVkSt2C
 f+ESf170nd83DsQiUSZC/7f4v9lExRhh4SYE1Ns/HVubpEF8v0T8Ct4SO
 1tcrFjhXDweTI09HsXZbjAj+sDJiG/VRvsekTLjm+dEUptuFf/PS9Bzsm
 4CrhQsuZu/rlRWkF2NoSXp/GCIOcV+fFrtUn41uc3uuWtuBM1+SV87c+S
 YWkIT6YgTXilDEWTMi5fu0l2qDEzODxz+n4B9u2wf4GgkS1G/9bO9B9RI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340272333"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="340272333"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 09:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664529870"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="664529870"
Received: from tpyra-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 09:28:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 17:26:24 +0100
Message-Id: <20230406162625.320387-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/sched_job: prefer dma_fence_is_later
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

Doesn't look like we are accounting for seqno wrap. Just use
__dma_fence_is_later() like we already do for xe_hw_fence_signaled().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 2985caa6097b..ed0b69ef449c 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -229,7 +229,9 @@ bool xe_sched_job_started(struct xe_sched_job *job)
 {
 	struct xe_lrc *lrc = job->engine->lrc;
 
-	return xe_lrc_start_seqno(lrc) >= xe_sched_job_seqno(job);
+	return !__dma_fence_is_later(xe_sched_job_seqno(job),
+				     xe_lrc_start_seqno(lrc),
+				     job->fence->ops);
 }
 
 bool xe_sched_job_completed(struct xe_sched_job *job)
@@ -241,7 +243,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 	 * parallel handshake is done.
 	 */
 
-	return xe_lrc_seqno(lrc) >= xe_sched_job_seqno(job);
+	return !__dma_fence_is_later(xe_sched_job_seqno(job), xe_lrc_seqno(lrc),
+				     job->fence->ops);
 }
 
 void xe_sched_job_arm(struct xe_sched_job *job)
-- 
2.39.2

