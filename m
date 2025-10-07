Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7E1CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2878210E622;
	Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4nS9rM9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56610E18C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842311; x=1791378311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Tth4pmQOOuZ1kS8fkc55shB9Ih/zWjq11xWWn9bdDeA=;
 b=j4nS9rM9NXOFVGkcw5QNMKL5PpKlZCxzBrjL7TKjCV8PVPV25DaLzsgs
 +y0+yGa4sEK4JxPNOrlexlPK1qvF3XtNHIaE87kYSOfMyahXcB41zfOuz
 /liNFysNit0LJk6j5/G4+qw76CAY0EZlD2WMRmxLY4RkWCVnDh820tAyT
 wNa0joSs803dufDRv8MXLaOjDZTO2QqHlvlN4NWa/u/Lv/YFgBwij/bTU
 lm+oq5M6jvf2fi3jTNxWyFpgc99YU6mx9P/bXJ4Slu3mgmPVEoquQoq7F
 wRvw+NsKH1UJPNjgylTZOrHFeewWsxIqRnGEI1b6C7W11ldQVMyIWhR62 A==;
X-CSE-ConnectionGUID: C9sFss/VR6mOg+eNk/Q1HQ==
X-CSE-MsgGUID: vSNsL/uXT4+jma5tzX0KKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639824"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:11 -0700
X-CSE-ConnectionGUID: conxPchkRhOUumDqAPTnDQ==
X-CSE-MsgGUID: t0gHtiOVRZybV2qE4Lmoxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576924"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 05/33] drm/xe: Return first unsignaled job first pending
 job helper
Date: Tue,  7 Oct 2025 06:04:37 -0700
Message-Id: <20251007130505.2694829-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

