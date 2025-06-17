Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF1C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 14:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907710E727;
	Tue, 17 Jun 2025 14:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1ilEhpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527B210E727
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750171685; x=1781707685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ctyqdif5DbbGKs6dkX943S7f0Wb1YkNrGEvV92KoYMY=;
 b=m1ilEhpU7CO11nXscp6bbF7hUTBgPyPL+vUzZAEE7dWX6fhaN7sRCPwA
 OI0u9jBuOm5vgD5ijScL3+h1x4r/by8DcB1EZT9BT4PhqSupi4ExPDZbU
 1VsvGDGC1abIXeRs8JYC5H6JMOXZUZ9AtfyuXYtblq7yGqLGZTtP4Lzve
 4fO408Zn2C6psPnCkpo/WPPYQGfHz1Yr8TvOvM95RjxxE86FsJ0vdL6zh
 nLycGwzC/Yeo2csR1NnIqtFpNCVvzoPV9Sdr+cQIZELy5Nmt7FsZKxPVu
 NMw5O2EIipJQDpse7HAr5dROKozd90SYKIeMgvMzF989TCDBqikEPxGV5 w==;
X-CSE-ConnectionGUID: Rd3KM/xRQwG1nE2oKv/29g==
X-CSE-MsgGUID: N8zgLMgcTpyjcLql2wpjPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52492497"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52492497"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:48:04 -0700
X-CSE-ConnectionGUID: D9vVpSYqQW6eI1iznLIvNQ==
X-CSE-MsgGUID: EdeoTgwtSAqldEsZXU51aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154091983"
Received: from unknown (HELO tejasupa-desk..) ([10.190.239.37])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:48:04 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Grab pending job list lock before resubmit
Date: Tue, 17 Jun 2025 20:17:53 +0530
Message-Id: <20250617144753.3177952-1-tejas.upadhyay@intel.com>
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

Pending job list is protected by pending job lock to
avoid any racing thus grab pending job list lock before
resubmitting jobs.

Fixes: 38fafa9f392f ("drm/xe/sched: stop re-submitting signalled jobs")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 308061f0cf37..dfdb409da6ba 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -53,6 +53,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
 
+	spin_lock(&sched->base.job_list_lock);
 	list_for_each_entry(s_job, &sched->base.pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job->s_fence;
 		struct dma_fence *hw_fence = s_fence->parent;
@@ -60,6 +61,7 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 		if (hw_fence && !dma_fence_is_signaled(hw_fence))
 			sched->base.ops->run_job(s_job);
 	}
+	spin_unlock(&sched->base.job_list_lock);
 }
 
 static inline bool
-- 
2.34.1

