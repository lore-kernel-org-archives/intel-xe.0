Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B9FCF855E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 07:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7810E7A5;
	Thu,  3 Oct 2024 07:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtHdKCMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5BE10E7A5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727939188; x=1759475188;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4X/9c3FfiTD8qm4viq7oimejpDwAHW5za0FG/5/G04Y=;
 b=MtHdKCMg/nsWtFJ+noYOXLKR0+gIPTE9HuB/8MLf4bISMwJ+8UhL3Orp
 uN+iKTVXEwxjTTIet9yYq3wPfMGMXc6zGCxpE7I27jJa1vpdmIlihad4x
 HyeqLE64bBW/SuVeFGsLYRYZyDYkUR6znAsc+cNG7/oY97CjRshfz/wKe
 AdMWhsQdTMlXZnxTXI7KzNcACeh8xI8agdPZb0/hkjGQbVFfLt5b0W5tm
 L4PJQuzOYXm0TcaO72HDOZs7iBKB6t07wId7FEKilqpQxScNTtSZHg1Mv
 cvXeI7YiU5r3ra4YwyL/rFqxbUoGujzV9MbW/xYD5TTbOsWbFlSlXAFjo w==;
X-CSE-ConnectionGUID: yzuZuAy3R+uXjA3PQmN94g==
X-CSE-MsgGUID: rBkaCrJPS02RKqHz2kgqzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38506171"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38506171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 00:06:27 -0700
X-CSE-ConnectionGUID: q2WceXr7TFGHcCZtQ8M9fw==
X-CSE-MsgGUID: D9N4+sOPTcSBqU2RBPdp3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78683288"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.147])
 ([10.245.244.147])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 00:06:26 -0700
Message-ID: <45633fc3-b1d8-4a64-b8db-0fda93ca79a5@intel.com>
Date: Thu, 3 Oct 2024 08:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Don't free job in TDR
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
References: <20241003001657.3517883-1-matthew.brost@intel.com>
 <20241003001657.3517883-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241003001657.3517883-3-matthew.brost@intel.com>
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

On 03/10/2024 01:16, Matthew Brost wrote:
> Freeing job in TDR is not safe as TDR can pass the run_job thread
> resulting in UAF. It is only safe for free job to naturally be called by
> the scheduler. Rather free job in TDR, add to pending list.

s/Rather free/Rather than free/
?

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> Cc: Matthew Auld <matthew.auld@intel.com>
> Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I think we still have the other issue with fence signalling in run_job.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..9ecd1661c1b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1106,10 +1106,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> -	 * immediately closed after last fence signaled.
> +	 * immediately closed after last fence signaled. Add back to pending
> +	 * list so job can be freed and kick scheduler ensuring free job is not
> +	 * lost.
>   	 */
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		guc_exec_queue_free_job(drm_job);
> +		xe_sched_add_pending_job(sched, job);
> +		xe_sched_submission_start(sched);
>   
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
