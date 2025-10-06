Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEDDCAC5BB
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 03:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE35310E044;
	Mon,  6 Oct 2025 03:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZs1byUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66910E044
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 03:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759720154; x=1791256154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVyT2le4dxIUcaiw1piEP7Mw1NrbwMLxHqEtrvI2TG0=;
 b=gZs1byUjvupnlvmCG3b22be0eSBAcXs4t38ubzyhUNyhPRXYuCg3Qiia
 zQs/QgWCf1Z6VQpHxmXeR0XPLHdbVcPRWJQolAvxBoDKUeiXOxNKNU6cS
 /wwcz2HNJsDlakn+Ct8imkKh26VMcYC9B7aAEFPrqvOdg41MiksMd+uUw
 rDg/8iWKfjI2GTcRgz2RguUM7eVf/yXMzBEAjptK+kUOxX+IpcvptX2TY
 GQuXU/mGPUBzUMnxyx4StE1SN8HUs5qv4QPEnx/AStqhu1UhiOyH9cDJR
 zlujLdAH0UQdw4va45dcQNG6mBClCtPzl90GQojzCYjrH5+OZvUW3STsP A==;
X-CSE-ConnectionGUID: 7fhBwF/hR/iA8K0+U8lm4Q==
X-CSE-MsgGUID: hqoSnwxVRc26wrXBcsAW1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="87358334"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="87358334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 20:09:13 -0700
X-CSE-ConnectionGUID: dWNC87sQQmW4MqyOaTyeYg==
X-CSE-MsgGUID: FwY8s2rbTa2T5ifsdx5nYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216871147"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 20:09:11 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [v6,4/4] drm/xe: Don't change LRC ring head on job resubmission
Date: Mon,  6 Oct 2025 08:39:03 +0530
Message-ID: <20251006030903.2844511-1-varun.gupta@intel.com>
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
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Varun Gupta <varun.gupta@intel.com>

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
