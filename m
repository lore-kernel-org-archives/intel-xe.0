Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018DC4707C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE0410E41B;
	Tue,  9 Jan 2024 11:24:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6810E41B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704799478; x=1736335478;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rUmwhj7Z7pA6+QXb9M/OIu5tmKMrMSSxGlX60SV7Fl0=;
 b=EUDBKohF7/rlyXs3gqzf8f0LDtIXR9oYvV8QtS1LTXOSnog76ClIgE7u
 8JGckb4H36b9Pm2eR0M6PSSZon6RBCukhmMTXIzeHQKa4V/I3HAakhY3m
 TtfBRjhBpYh6VWGnUTswyyeYI4+KPiEqh4XYaWlNOGoRvvuzszs3IkEXO
 RS+URCtO0YHAZxuimYxdlpG8cmlwdvwFEBPuVAvgOW54dQnmEyjKwptoj
 hb5J7EvK/qKMn2GSit8VawXmkvbjoeTlgNvPnOqLU9bWyqMqwnv6cKwHQ
 pNSoNa9/zjPgqjnPms0wGzlt3ziUfzQBhYPyekoIcU+q95RWEGJ7ND6B5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16759987"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="16759987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="815939516"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="815939516"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:24:37 -0800
Message-ID: <11d0bf86-c011-4761-895f-8cce0a7e071c@intel.com>
Date: Tue, 9 Jan 2024 11:24:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/20] drm/xe: Runtime PM wake on every exec
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-9-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-9-rodrigo.vivi@intel.com>
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> Let's ensure our PCI device is awaken on every GT execution to
> the end of the execution.
> Let's increase the runtime_pm protection and start moving
> that to the outer bounds.
> 
> Let's also remove the unnecessary mem_access get/put.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 01106a1156ad8..0b30ec77fc5ad 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -15,6 +15,7 @@
>   #include "xe_hw_fence.h"
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> @@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
>   	struct xe_exec_queue *q = job->q;
>   	bool is_migration = xe_sched_job_is_migration(q);
>   
> +	xe_pm_runtime_put(gt_to_xe(q->gt));
> +
>   	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
>   			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
>   }
> @@ -86,6 +89,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   	int i, j;
>   	u32 width;
>   
> +	xe_pm_runtime_get(gt_to_xe(q->gt));
> +

This seems way too deep in the call chain. If this actually wakes up the 
device we will end up with all of the same d3cold deadlock issues. Like 
here we are for sure holding stuff like dma-resv, but the rpm callbacks 
also want to grab it. IMO this needs to be something like 
runtime_get_if_active(), with the upper layers already ensuring device 
is awake (like ioctl), so here we are just keeping it awake until the 
job is done. Or maybe this is how it is by the end of the series?

>   	/* only a kernel context can submit a vm-less job */
>   	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>   
> @@ -155,9 +160,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   	for (i = 0; i < width; ++i)
>   		job->batch_addr[i] = batch_addr[i];
>   
> -	/* All other jobs require a VM to be open which has a ref */
> -	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_get(job_to_xe(job));
>   	xe_device_assert_mem_access(job_to_xe(job));
>   
>   	trace_xe_sched_job_create(job);
> @@ -189,8 +191,6 @@ void xe_sched_job_destroy(struct kref *ref)
>   	struct xe_sched_job *job =
>   		container_of(ref, struct xe_sched_job, refcount);
>   
> -	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_put(job_to_xe(job));
>   	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
