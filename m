Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6F2CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3B710E7EB;
	Thu,  2 Oct 2025 14:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXRzAYxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839F10E7EB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759414517; x=1790950517;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MslXj0JO2vcfJ76DHuMytRBu3xy83KT+EPJ8CVg34V4=;
 b=LXRzAYxJkGip2s3rDfW3smjs3JTTAjqS4Sac3jxY6t9Zdulbsj9u/5FZ
 A93+66uCqHzT6YuMEf5C6H7++8N+AO9FpCHBoxd4i14NSyrUZlFDu/QfK
 gsKIEanKUD0K81NQQ6d+q9dmuBdTRbRROBiZW9IJzFSWJIIwIH+0xnPqx
 ABC5/Hr26jCXHF8/DJz14NyQpO1Y7r4NUriOMUhRqZMfmJhkn2smNF6NY
 d+hv02Y7kkOLkF4sENSbh3/jG4cen8M8BmfH1WdYYmYmqsjk+AwHbC1q2
 8TkyB+Uad8gLVGe9VIzczalNmNhtTMSfX4Y3SiHv0Zb6BNTDammatJmaO g==;
X-CSE-ConnectionGUID: p2gUCx0rTn+0QAn2GJvZTA==
X-CSE-MsgGUID: y7DhCXq+QQCtA5TzqvOcFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="87148340"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="87148340"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:15:17 -0700
X-CSE-ConnectionGUID: vh6NSvlySz2vJ4JI6sTK9Q==
X-CSE-MsgGUID: /G+yvZWwQYqsgjdFJm/1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="209751164"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218])
 ([10.245.245.218])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:15:16 -0700
Message-ID: <0f7ae66b-1272-4164-9b41-faac00f42f73@intel.com>
Date: Thu, 2 Oct 2025 15:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-9-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251002055402.1865880-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 02/10/2025 06:53, Matthew Brost wrote:
> Now that we save the job's head during submission, it's no longer
> necessary to adjust the LRC ring head during resubmission. Instead, a
> software-based adjustment of the tail will overwrite the old jobs in
> place. For some odd reason, adjusting the LRC ring head didn't work on
> parallel queues, which was causing issues in our CI.
> 
> v6:
>   - Also set LRC tail to head so queue is idle coming out of reset
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3a534d93505f..70306f902ba5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>   		int i;
>   
>   		trace_xe_exec_queue_resubmit(q);
> -		for (i = 0; i < q->width; ++i)
> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> +		if (job) {
> +			for (i = 0; i < q->width; ++i) {
> +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> +				xe_lrc_set_ring_tail(q->lrc[i],
> +						     xe_lrc_ring_head(q->lrc[i]));

IIRC the sched pending_list stuff can also give back pending jobs that 
have completed on the hw, but are still kept pending until the final 
free_job()?

Suppose we have a pending_list like:

[pending/complete, pending/complete, actual pending kernel job that 
never completed/ran]

IIUC the sw ring.tail will actually go backwards to the first pending 
free/complete job head in the pending_list, with the hw tail being reset 
to the current hw head here. But on the next submit the sw ring.tail is 
where the commands are emitted to, and on the next update
of the hw tail it will be synced to the sw ring.tail? But if that 
happens won't we get hw tail < hw head (since we used the head of an 
already complete job for the sw tail), which will make the hw think 
there is a massive ring wrap, so it will execute garbage until it wraps 
back around to tail?

> +			}
> +		}
>   		xe_sched_resubmit_jobs(sched);
>   	}
>   

