Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CBDCA0ECE
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 02:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B710E379;
	Tue, 12 Sep 2023 02:17:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEC610E268;
 Tue, 12 Sep 2023 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485041; x=1726021041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YDlLvjboEFv7OcjCM8X+lD7IGdlcILYYdlPfF6mvXfc=;
 b=lQB4oSFffHf+iYxGbMFu+K7kIDt5XH7TDC9cmKiwXSJvrCpf7P/jNPZp
 MhS29O4ihKs1ud/dGDnqRzUkjVbcCYUcnZj25IVCbyu9Q/94I4556/4vc
 KA1z+ZQzBOEglE+nVOvojE5GoZlejI52TpwBjDyA8aCIV/vMtBo4NTEDX
 f1+2h05uPxHRm3wiNZg99YNp7r/aQcFr90u8cw4GBUk2WQAzb0xJstccw
 9uxdLgpsIcixQEvYP/Vgz1JG7/f5oDk9pflwe/5XJMpZ2PP1KoEbrmROC
 6GOpcJxxRWO+IRKjHjjKY2BIFYSPtb1H/KxJxTj1w5Jv6UjTLxb7qYLtt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172571"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172571"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255578"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255578"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Mon, 11 Sep 2023 19:16:10 -0700
Message-Id: <20230912021615.2086698-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 08/13] drm/sched: Start run wq before TDR in
 drm_sched_start
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 frank.binns@imgtec.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 daniel@ffwll.ch, boris.brezillon@collabora.com, airlied@gmail.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If the TDR is set to a very small value it can fire before the run wq is
started in the function drm_sched_start. The run wq is expected to
running when the TDR fires, fix this ordering so this expectation is
always met.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bc080e09d9ed..c627d3e6494a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -665,10 +665,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
+	drm_sched_submit_start(sched);
+
 	if (full_recovery)
 		drm_sched_start_timeout_unlocked(sched);
-
-	drm_sched_submit_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
-- 
2.34.1

