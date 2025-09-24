Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D3ECAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 03:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D7E10E21B;
	Wed, 24 Sep 2025 03:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMqb9HoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536E510E21B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758684378; x=1790220378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yo88LBre+EgtlZsVxQ1iEmPiNi5DcMN6x7Q8X+En8n8=;
 b=bMqb9HoPEFBer8G/gE/a8Fb6hY/91PC4F6PVKm8vsQWIoTPy9paFrppo
 07z1ep+Fb8vdjHQt4dDIyK5623jTaQia52RbMdth3Nwi7+PpNRFFQb7B1
 ErFPn7NJxhfM83p9utQcGJadRZ0Z6Q+6qpNYCfvgbYTQPvaZgOukw/6Z1
 bWN4rQgzw7Sn2ANEFwT8p+mUSzGwt/R2IjGriG7cq2Koa/1TZQaBW61+8
 xRWxq05hiJYUVvW2V1CU5aK3TF0YE46JX0TXn0ldP/8acNc8srvLXo/y+
 TYHZbzrMlcCarR4EaclabvxUY/tnl7QycL4I15b6j2YJo2jypMgY2KpVB w==;
X-CSE-ConnectionGUID: SAc0k3fASoiXrMpXE3D90Q==
X-CSE-MsgGUID: nWj5GGVnQ2ew6UU0GUZImg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72079199"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="72079199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 20:26:17 -0700
X-CSE-ConnectionGUID: +9r94d1TTfCPfb7Y/uM7Kg==
X-CSE-MsgGUID: C1vG3AO4TIG3miBEoLkaRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="176865338"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 20:26:15 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [v6,4/4] drm/xe: Don't change LRC ring head on job resubmission
Date: Wed, 24 Sep 2025 08:56:09 +0530
Message-ID: <20250924032609.2009740-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904024749.1849710-5-matthew.brost@intel.com>
References: <20250904024749.1849710-5-matthew.brost@intel.com>
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

>v6:
> - Also set LRC tail to head so queue is idle coming out of reset

>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 69ed3c159d10..3fb394f65c3e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> 
> 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
>+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> 		int i;
> 
> 		trace_xe_exec_queue_resubmit(q);
>-		for (i = 0; i < q->width; ++i)
>-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
>+		if (job) {
>+			for (i = 0; i < q->width; ++i) {
>+				q->lrc[i]->ring.tail = job->ptrs[i].head;
>+				xe_lrc_set_ring_tail(q->lrc[i],
>+						     xe_lrc_ring_head(q->lrc[i]));
>+			}
>+		}
> 		xe_sched_resubmit_jobs(sched);
> 	}
LGTM
