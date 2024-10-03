Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C798FCF854A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 00:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9488710E07D;
	Thu,  3 Oct 2024 00:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKlXltpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A4A10E05D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727914567; x=1759450567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7sxgME89h1HJBcR8UWqaazWW1ResAM6RjdAXefV/n+o=;
 b=mKlXltpxl4Lw1ZoGBOE5vTTUmybuI45WDLa4swzn4+uUnO5N2CvXOxK0
 OXPlL7Ofh8zxGnqyhkr93rXZc0U0hbrMZBLN3tRRbVLYW/jNm3vxmZx65
 35bcKJFOjbF/G+qfk4VuEPjV3Z7Kvb/yatByQhxWLn746BL90PuJgR2mj
 edeGRomdAmNls4kUsm68ayth4cpeUpWdh9PqNew4t8H7lkkPDUf4J8Sl7
 jAK+r/6pw67zAOL06kE/e8MXAqjpiTZI7T6JkDk1JPN++rzbAZCDtmo/E
 qPEXptdunBlqjs+PakV29bbSP7TWGJjlEzfOMX5WN/DC0zi4yMOtlqKON Q==;
X-CSE-ConnectionGUID: F9BqxN4bSTywiqVlDteLXg==
X-CSE-MsgGUID: djGjZ0ifTuaqKkOd4k9CCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30983003"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="30983003"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:16:07 -0700
X-CSE-ConnectionGUID: oKNprvmXS9iCzldB//K5oQ==
X-CSE-MsgGUID: ty87s726TNuvxlERMbOYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78195123"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 17:15:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com,
	matthew.auld@intel.com
Subject: [PATCH 1/2] drm/xe: Take job list lock in xe_sched_add_pending_job
Date: Wed,  2 Oct 2024 17:16:56 -0700
Message-Id: <20241003001657.3517883-2-matthew.brost@intel.com>
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

A fragile micro optimization in xe_sched_add_pending_job relied on both
the GPU scheduler being stopped and fence signaling stopped to safely
add a job to the pending list without the job list lock in
xe_sched_add_pending_job. Remove this optimization and just take the job
list lock.

Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2822
Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 5ad5629a6c60..64b2ae6839db 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,9 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
 static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 					    struct xe_sched_job *job)
 {
+	spin_lock(&sched->base.job_list_lock);
 	list_add(&job->drm.list, &sched->base.pending_list);
+	spin_unlock(&sched->base.job_list_lock);
 }
 
 static inline
-- 
2.34.1

