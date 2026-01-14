Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDDDD3900B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 18:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6D110E15D;
	Wed, 14 Jan 2026 18:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuO4e6mq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BAC10E15D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768416550; x=1799952550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YUsjWkLOeW88fT/JlacbPf+qkAmxe46yzcPtET7EjRU=;
 b=cuO4e6mqGFpWjQonVeBBCqIaqBmWE8aECMUznZsSvNVNDMilztYKu+w+
 kKHpTyMP4wlXMDmno58AWsfG1asEP/cZAJu6aO47qoPe7V3hfnmkG0/5I
 VpPgnA9CPI0a9LvSj5bEvkyp0CjE4ZU4gbiz47eu4BdP9IyF+zun0pW4O
 WMwB0BGHxSWkKEWrcAUA7WZOhpYaIBydFKCK3tnbAtvSZLpNJJGivuxa5
 qnN4b1H2iwTVrnfPEAo7JN9P1kttvLFW39mCp2vcwRwxUr0Ua0TSGRMPp
 M9ooRa1JEvA3cEz3VJZNWjtCExeNsSBqVOXtEKR4pdxBqGSBCKGGWtl2R Q==;
X-CSE-ConnectionGUID: wNXOQ3QOQZK+rXIKjXVvrw==
X-CSE-MsgGUID: 7GnuqQ6YQBKlPndYJKEqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72306709"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="72306709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 10:49:09 -0800
X-CSE-ConnectionGUID: oDs7+3u3QRmH7+BDKkUUMw==
X-CSE-MsgGUID: KK+X/FBLRLa24fbjHGu+xQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 10:49:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to notice
Date: Wed, 14 Jan 2026 10:49:05 -0800
Message-Id: <20260114184905.4189026-1-matthew.brost@intel.com>
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

An LRC timestamp getting stuck is a somewhat normal occurrence. If a
single VF submits a job that does not get timesliced, the LRC timestamp
will not increment. Reduce the LRC timestamp stuck message on VFs to
notice (same log level as job timeout) to avoid false CI bugs in tests
where a VF submits a job that does not get timesliced.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7032
Fixes: bb63e7257e63 ("drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR")
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..0311c89107f9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1319,9 +1319,14 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 
 	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
 	if (ctx_timestamp == job->sample_timestamp) {
-		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
-			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-			   q->guc->id);
+		if (IS_SRIOV_VF(gt_to_xe(gt)))
+			xe_gt_notice(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+				     xe_sched_job_seqno(job),
+				     xe_sched_job_lrc_seqno(job), q->guc->id);
+		else
+			xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+				   xe_sched_job_seqno(job),
+				   xe_sched_job_lrc_seqno(job), q->guc->id);
 
 		return xe_sched_invalidate_job(job, 0);
 	}
-- 
2.34.1

