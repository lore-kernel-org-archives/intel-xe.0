Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47658C001DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 22:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07B10E67C;
	Thu,  3 Aug 2023 22:00:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE7D10E67C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691100038; x=1722636038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=stY8+GDAilVcdKUp1g2CE9asodQhVxHKfiyaBw+/ldA=;
 b=njMeEptclGuDMtjiSzYwPzZxf8VfaaKfkcvQ1DqHdeTkn8N62T3nsU89
 LnwvvkdUPP9MFD8+I+ftpmvxFnDSJp36NvFS5Wgsp5O156BZs8OPNMUQx
 CT0MO4hpvXuvqbNc8dNIcsayQNW9tsICARLWxTdnkVnCAJ/jzOjbRuaZC
 ZGon4yfCvneJzl64F+7LKRsDh9cX6SaAeWEjA9Angd+JuFvZNcBP/GFmN
 KFOGHe8o1kTAqk1KXliJud3CBASfIWGkbEo2e/ZJu372CO/c0NP/aOH+k
 Rz+oAFvAKmtP/tY8ZIlES7jnmFpM+fVlKnB4mRtbXZwt6V32x7u7DGiB1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400963992"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="400963992"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 15:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723387179"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="723387179"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 15:00:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 15:00:29 -0700
Message-ID: <20230803220029.895482-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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

Resets can be caused by userspace (and we do so in our testing),
so we can't print at warning level when they occur.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 193362518a62..60c311079fcc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -843,8 +843,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
 		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
 
-		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
-			 xe_sched_job_seqno(job), q->guc->id, q->flags);
+		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
+			   xe_sched_job_seqno(job), q->guc->id, q->flags);
 		simple_error_capture(q);
 		xe_devcoredump(q);
 	} else {
@@ -1597,7 +1597,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_warn(&xe->drm, "Engine reset: guc_id=%d", guc_id);
+	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
 
 	/* FIXME: Do error capture, most likely async */
 
-- 
2.41.0

