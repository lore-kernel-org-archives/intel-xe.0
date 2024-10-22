Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59A7D2C57C
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 23:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B44510E283;
	Tue, 22 Oct 2024 23:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXJFFggP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92510E283
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 23:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729639652; x=1761175652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LFQa3jhPK2H88vpDM0nmeYe+DBgvszgepM/BHsGrYIk=;
 b=NXJFFggPrAuB4bTFwbMox0aRD7yC8QxWzvXWsOItVmkaqZipe32BCtAb
 MyVc8zd/K636wsJrfkpmOpZnBd4nzSidJrCzd7hU12GUW90OTwYUii75q
 MUySD5pM/JoMf9VckJ65VT8EgzM5DcuqtAjquc4crTG1bUFgqHqzs3Shw
 lrFj94AdrPWNhHHmI2ps3DASAcK+G7iuTqdvJ4fNfSXcef6eR2czNlghF
 2CB54aT4fiH/rs3gW7jBOnHzv53R+4rqNxZfe4GVI4oM1j2WrB+6CbOs2
 qVPpZd3gSNGfGf3l7jjV6QB40azMO9QJmKnngKKAcp4mpQx2X9C20ZKx5 Q==;
X-CSE-ConnectionGUID: qPVXPlL6TQiwlWmqnQLLwA==
X-CSE-MsgGUID: B5xn8WdSRVmPIKEBuV3S1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33129163"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="33129163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 16:27:30 -0700
X-CSE-ConnectionGUID: ez2uVNONR9G/BOJvvFaHbg==
X-CSE-MsgGUID: 6JWjXd8PQAOs9IlL4fqVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80434197"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 16:27:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Date: Tue, 22 Oct 2024 16:27:56 -0700
Message-Id: <20241022232756.1769013-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022232756.1769013-1-matthew.brost@intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
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

Short circuiting TDR on jobs not started is an optimization which is not
required. On LNL we are facing an issue where jobs do not get scheduled
by the GuC for an unknown reason. Removing this optimization allows jobs
to get scheduled after TDR fire once which is a big improvement. Remove
this optimization for now while root causing job scheduling issue on
LNL.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..25ab675e9c7d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1052,10 +1052,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		exec_queue_killed_or_banned_or_wedged(q) ||
 		exec_queue_destroyed(q);
 
-	/* Job hasn't started, can't be timed out */
-	if (!skip_timeout_check && !xe_sched_job_started(job))
-		goto rearm;
-
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
-- 
2.34.1

