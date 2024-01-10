Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B8AC47077
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7010E010;
	Wed, 10 Jan 2024 01:42:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0C310E010
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704850954; x=1736386954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZDq2d4GCJC3k1JfPYG0hX9z0Savo0nYjf7krfExuDtw=;
 b=EZuAc9kLeukEwCV+mo2/PzMdBrzEz/s8pRB3QDKJIay7E7jZy04wqqpx
 ujgXoBdT2m1LLwHNFLeyEPjt/MVA9kooFNQ4QDk8B9IRK8jkPLtgXRLl0
 mJiYT+q6qN2oN4ZUGyLGvATGqYNG2F/DO/TOwLTXsGgNA67gx0tcSWfEk
 1QxOtL0252Iyiun/u+5adfVlosAmRBwxZW6zFszunCf/LlJ97GDepXXl5
 5/lLdbbPB+HC3pXfu2HIzCmHeOFtOQE6IRBblRNmWoF2cEhrBPNWL7aOM
 lkQkxG5HI8/8fcvyHv35RUWcNkc+TYkx/WNzyzro7gYh70u48olSMmFCD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19876428"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="19876428"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775055228"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775055228"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:42:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Fix xe_assert usage when jobs timeout
Date: Tue,  9 Jan 2024 17:43:06 -0800
Message-Id: <20240110014306.1406523-1-matthew.brost@intel.com>
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

Both kernel and vm jobs should not timeout but it is possible if the
hardware encounters an error. Do not use asserts in the case rather a
warn as hardware issues should not result in an assert crashing the
kernel.

Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54ffcfcdd41f..751b822c23da 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -928,8 +928,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
-		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
+		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
+		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
 
 		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			   xe_sched_job_seqno(job), q->guc->id, q->flags);
-- 
2.34.1

