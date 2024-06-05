Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D4EC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 05:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA84E10E68F;
	Wed,  5 Jun 2024 05:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gny6gcxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D877610E68E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 05:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717566611; x=1749102611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xEbwUDp6Rs+RXyJDcewwHUZrl2H5f7kia2NkJW1XDs=;
 b=Gny6gcxp3AZB1/crIJ80Lc79klwj37/YG/7EmXGogWLhWzTHlVHitoi4
 LYOWJUAR0iItNdGwuxv1+/7V/8nuOePbJC1vcGbTp7l0xnuwsncdzAyNS
 pIaxJomEHXpPktv7zAwJJ6RxxC/z+D45+6QS0i/ZKpIC6Kiy2OLU4IPbU
 SUpmgHo0dA6SLHTOOoMyrt85yIhPxIPtVpQM4bRiCI1IwyWQAMj/pw6Hn
 I/V5pi1pLfvmj7t0SLfsPnJyyWzs6IO4Q8H2tycY0jtpP4/E6yHlH91Ql
 N1os74UgxJL7Hagh9ju+jSavK0htjMz85J5LqE8sH5Ei0tBGx3sZ0ANFE Q==;
X-CSE-ConnectionGUID: JlDAwpsTTjyzZZppR3EySA==
X-CSE-MsgGUID: gWXNq3ujT4qUj4PW7CGSDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13989894"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="13989894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 22:50:10 -0700
X-CSE-ConnectionGUID: sRBPfHlIQ5etTwQMUxE4uw==
X-CSE-MsgGUID: 7g82SHsYQcSk8wSSgVUMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="41899564"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 22:50:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Do not dereference NULL job->fence in trace points
Date: Tue,  4 Jun 2024 22:50:41 -0700
Message-Id: <20240605055041.2082074-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

job->fence is not assigned until xe_sched_job_arm(), check for
job->fence in xe_sched_job_seqno() so any usage of this function (trace
points) do not result in NULL ptr dereference. Also check job->fence
before assigning error in job trace points.

Fixes: 0ac7a2c745e8 drm/xe: ("Don't initialize fences at xe_sched_job_create()")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
 drivers/gpu/drm/xe/xe_trace.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 002c3b5c0a5c..f362e28455db 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
 
 static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
 {
-	return job->fence->seqno;
+	return job->fence ? job->fence->seqno : 0;
 }
 
 static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 450f407c66e8..e4cba64474e6 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->guc_state =
 			   atomic_read(&job->q->guc->state);
 			   __entry->flags = job->q->flags;
-			   __entry->error = job->fence->error;
+			   __entry->error = job->fence ? job->fence->error : 0;
 			   __entry->fence = job->fence;
 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
 			   ),
-- 
2.34.1

