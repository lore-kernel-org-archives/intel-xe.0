Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B62C3ABA9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 09:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467410E300;
	Tue, 29 Apr 2025 09:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYTnC2Da";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DE610E300
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745920697; x=1777456697;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PG/LDnkD892c7fSpIKFu9X2LRR1ldrwVaBrnDLc9Oxk=;
 b=ZYTnC2Dayd5C+fP4h/ca5XvbQY64FHQ2rOXo98Ppi8aJ8pYz/QJYvBqQ
 +oy6U3l0ybNSgSv9Rd//qOmeJqvK4FnPo9fx50w5xmI2a7IXRidQIbMxR
 a78r4XZN1TENxS+QuAlQxd6X0+Zx6njfHzZG/jpwppK8RE3EA1H8bHqb7
 or2Ko1+PplDf5PhgjQX2ud7tMAbatYXmyzs5HaAihed3gI0K5zt/nyooe
 TdZM7dtkH3nHCyJ3KNmxQXiggQK1bITYKN/ooUDDsTcB4h+frQXRffKyS
 Dw8/FKyz8fMFzkjLiS+xlI2dRRF3CG+KaWaIMKoTgPgWabdkR7GdoHOyA Q==;
X-CSE-ConnectionGUID: gCTDybgiQTKpqPNfBI02WA==
X-CSE-MsgGUID: AgWRn86XTYm7SKgSyOUm3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58905581"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58905581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:58:16 -0700
X-CSE-ConnectionGUID: du9HUo/9QS2qhodTPFTNHg==
X-CSE-MsgGUID: R82z30AuTLW5w73ZaEsteg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="133669003"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.224])
 ([10.245.244.224])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:58:16 -0700
Message-ID: <8b7eeb7b-f12c-4f5b-81a2-e9b629697111@intel.com>
Date: Tue, 29 Apr 2025 10:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not print timedout job message on killed exec
 queues
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20250428175505.935694-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250428175505.935694-1-matthew.brost@intel.com>
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

On 28/04/2025 18:55, Matthew Brost wrote:
> If a user ctrl-c an app while something is running on the GPU, jobs are
> expected to timeout. Do not spam dmesg with timedout job messages in
> this case.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 813c3c0bb250..369be36f7dc5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1179,9 +1179,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		process_name = q->vm->xef->process_name;
>   		pid = q->vm->xef->pid;
>   	}
> -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		     q->guc->id, q->flags, process_name, pid);
> +
> +	if (!exec_queue_killed(q))
> +		xe_gt_notice(guc_to_gt(guc),
> +			     "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> +			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +			     q->guc->id, q->flags, process_name, pid);
>   
>   	trace_xe_sched_job_timedout(job);
>   

