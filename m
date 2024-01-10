Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52920C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0784110E634;
	Wed, 10 Jan 2024 20:22:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2973810E634
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704918146; x=1736454146;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mrKxMbxtP/fsoFLfElWUFtVu2y3hOytnz3IKWbJdl/Q=;
 b=BeHRLilpebW7qGWJF+hlT6swDNbf7DiCbFx/dBu4yaBGi4UdkaxHP/a+
 j2XsYMadvNviVVio85D7eNxHk4j6fPDqaEYxUSUCXpBms3F2NR54z07/L
 c4ENqJiJgSLThD2GnEanVMVqSP2BsICmUnLkEqPsSm+gUW/H2+XKpvlNo
 Sf/1lR199IeI/K0SfeB6cHMCeSVWvhHbSdqR/jNuyyCYubeg4HyM9/wtC
 wnH553JV7Gdnh07bJUbUz9FfYwY8KgtONm9h9yVQLaQHYultcVwa+sP3z
 F+xAx8oh4y11p/yVPdqUGLDObSjX/vOK0Bacq5nthV8iOFqXAO7q2eCWn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="395787796"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395787796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="24074213"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 10 Jan 2024 12:22:23 -0800
Received: from [10.249.134.210] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.210])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A66BBB4393;
 Wed, 10 Jan 2024 20:22:21 +0000 (GMT)
Message-ID: <a807c30a-3a78-47d2-8fa6-c75a3003354b@intel.com>
Date: Wed, 10 Jan 2024 21:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_assert usage when jobs timeout
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240110014306.1406523-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240110014306.1406523-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 10.01.2024 02:43, Matthew Brost wrote:
> Both kernel and vm jobs should not timeout but it is possible if the
> hardware encounters an error. Do not use asserts in the case rather a
> warn as hardware issues should not result in an assert crashing the
> kernel.

what kind of crash was it ?

xe_assert() uses drm_WARN() which in turn uses WARN()
and XE_WARN_ON() at the end also translates to WARN()

is it due use of xe or xe->drm in xe_assert()?
but then drm_notice() below will also crash

> 
> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 54ffcfcdd41f..751b822c23da 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -928,8 +928,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	int i = 0;
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> -		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> -		xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)));
> +		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
> +		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
>  
>  		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			   xe_sched_job_seqno(job), q->guc->id, q->flags);
