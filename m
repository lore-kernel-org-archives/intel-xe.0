Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4829CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AF710E8E9;
	Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bny/v9rT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7104B10E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959941; x=1791495941;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=b9hnqzCCxFYvr/4uEWxzWKW4nZu5GeGTT3Pl41rLoH0=;
 b=bny/v9rTb+x51ki2BeRtRr9q/g1I6vPmoTlIVvHaGm4fKpn40npxo50d
 Yu4W26NydXfbfAwoTBsXk79CYjZ7zT87lOmrJZuRrzWoA3EAOx6+uKVRJ
 dzpCZu9Q/BEJJiz3wZ1AIVT0cKobI7Ap/7Mg3aSPiO9kkpmM5/TwWUiQ3
 HXZ8T0/x41YxYRbHvcQqdcPe0VQrQR1y9hih4+MoeUBlXV1ehK6NaTtkS
 PgKY6cbgZsSjdZf+MOsvwh/cNe9gupY4TXSKC5JbrMmzCTBbpoSDp4+Ii
 7TQnxeQdBnDEAKHdQJBXBpZ/fDjx0uB9sNUv5HWC0+jpSDWiwtrf1OXjs w==;
X-CSE-ConnectionGUID: IRR//0J7Tg+vC20cVkooXA==
X-CSE-MsgGUID: kfqTSPf1SgKzQJjfvHKecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726845"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:39 -0700
X-CSE-ConnectionGUID: 1r2+RZ+nSjSCemrOhIEIbQ==
X-CSE-MsgGUID: XYJy5p1RRvKH0KeHstTHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635184"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 05/34] drm/xe: Return first unsignaled job first pending
 job helper
Date: Wed,  8 Oct 2025 14:45:03 -0700
Message-Id: <20251008214532.3442967-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

In all cases where the first pending job helper is called, we only want
to retrieve the first unsignaled pending job, as this helper is used
exclusively in recovery flows. It is possible for signaled jobs to
remain in the pending list as the scheduler is stopped, so those should
be skipped.

Also, add kernel documentation to clarify this behavior.

v8:
 - Split out into own patch (Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index e548b2aed95a..3a9ff78d9346 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -77,17 +77,30 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 	spin_unlock(&sched->base.job_list_lock);
 }
 
+/**
+ * xe_sched_first_pending_job() - Find first pending job which is unsignaled
+ * @sched: Xe GPU scheduler
+ *
+ * Return first unsignaled job in pending list or NULL
+ */
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	struct xe_sched_job *job;
+	struct xe_sched_job *job, *r_job = NULL;
 
 	spin_lock(&sched->base.job_list_lock);
-	job = list_first_entry_or_null(&sched->base.pending_list,
-				       struct xe_sched_job, drm.list);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		struct drm_sched_fence *s_fence = job->drm.s_fence;
+		struct dma_fence *hw_fence = s_fence->parent;
+
+		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
+			r_job = job;
+			break;
+		}
+	}
 	spin_unlock(&sched->base.job_list_lock);
 
-	return job;
+	return r_job;
 }
 
 static inline int
-- 
2.34.1

