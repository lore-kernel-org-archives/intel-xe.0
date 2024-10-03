Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65BECF8547
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DBE10E05D;
	Thu,  3 Oct 2024 00:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccuWQWwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406B10E073
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727914568; x=1759450568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BO3UNLMA5y4EiPqkqMgbVJiYGsTGmIUgLBDrG6CHP2k=;
 b=ccuWQWwtOHrvV310p+4TkzWOCR9DtNPwfHS4h6RxlMYiVHQ+3n3csdpO
 wv+cfTW+wIaAZemMASIDyboVr9creqmqYSaIiMrvxS5xRHxT0EBO/dMcR
 1iBefSq7BRIJAInBuJNW09YVOKdGtQ2GWgkvAnkMXeItYx/zOYIKYMVqH
 ijetc3lfk2dRznJPi0zDQDyRw0pR5lbAdd8GizsfRDLKEoM4op8W38g7v
 FIrb1E7w3JdgSGr4mn6cKNsCbPZCe0r68Dy+84Fa+SvPlGLTgX5HyMoa3
 OETZCzsi/Qucles2f65cqSX1hiVIyLPNJKgPylZwLWIkmge2sF5cjfOLD g==;
X-CSE-ConnectionGUID: PCuQx69UQkGro+MLnQcXjA==
X-CSE-MsgGUID: yfHJJxo1QrymRc4bXDRIew==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30983000"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="30983000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:16:07 -0700
X-CSE-ConnectionGUID: v7rhMJxrReWDrMSgZGw8cg==
X-CSE-MsgGUID: ZIMWV63yTNaUJXhCf2Lwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78195126"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:15:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com,
	matthew.auld@intel.com
Subject: [PATCH 2/2] drm/xe: Don't free job in TDR
Date: Wed,  2 Oct 2024 17:16:57 -0700
Message-Id: <20241003001657.3517883-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003001657.3517883-1-matthew.brost@intel.com>
References: <20241003001657.3517883-1-matthew.brost@intel.com>
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

Freeing job in TDR is not safe as TDR can pass the run_job thread
resulting in UAF. It is only safe for free job to naturally be called by
the scheduler. Rather free job in TDR, add to pending list.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
Cc: Matthew Auld <matthew.auld@intel.com>
Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80062e1d3f66..9ecd1661c1b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1106,10 +1106,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
-	 * immediately closed after last fence signaled.
+	 * immediately closed after last fence signaled. Add back to pending
+	 * list so job can be freed and kick scheduler ensuring free job is not
+	 * lost.
 	 */
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		guc_exec_queue_free_job(drm_job);
+		xe_sched_add_pending_job(sched, job);
+		xe_sched_submission_start(sched);
 
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
-- 
2.34.1

