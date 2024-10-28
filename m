Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175CD339A8
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 17:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07410E00E;
	Mon, 28 Oct 2024 17:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2uQ53IJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA74810E00E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 17:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730136211; x=1761672211;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A/d6P2HrM3uoGGtUs2hU0Eo08dUmJHWX+CCMJM0e3m8=;
 b=Z2uQ53IJ/gnTlihZMIDdVen+y9Nz2xx9apY+f+DlZE3AWxUdvjieebe9
 3vlLMBDZdk4zgabWXn59U6SRn1q4uFLYYldLl/wLiK2XrGEUNCq8+SjY7
 hewSlz+DeKaUrIF1+YXZcQ98DkpiDLpPaqbQCObk/Kopfg4py/6s70Vhe
 kEBdSUssT3fpAj3tRKZftTMcXJXeO42PiAo6amsFdhwz+V5zQJhUMIO72
 VN+HMOjmGwg3HDpP3MRJcgpCe8w25DDB9SEztxNuNetPdTOKlfA0xypi5
 7/S+4WuMEGzRlMLwEOzSTL5VH38Rnz/DjFNIB1BVvRH6db36yqJAaeYen w==;
X-CSE-ConnectionGUID: N5gOuwttQWCn/vyX0oOjgw==
X-CSE-MsgGUID: vHJ9W0GKQs6Yn/yL4BNApA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33538188"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="33538188"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 10:23:30 -0700
X-CSE-ConnectionGUID: e94VxQ8WSKaFab8c15C+qg==
X-CSE-MsgGUID: iVup4QOMSj+ILPXVVsVq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="82497719"
Received: from levylira-mobl1.ger.corp.intel.com (HELO [10.245.145.107])
 ([10.245.145.107])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 10:23:29 -0700
Message-ID: <d2ac9d9a-76d2-483e-bdb0-2e81954549d0@linux.intel.com>
Date: Mon, 28 Oct 2024 18:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Stop accumulating LRC timestamp on job_free
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-5-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241026170952.94670-5-lucas.demarchi@intel.com>
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


On 10/26/2024 7:08 PM, Lucas De Marchi wrote:
> The exec queue timestamp is only really useful when it's being queried
> through the fdinfo. There's no need to update it so often, on every
> job_free. Tracing a simple app like vkcube running shows an update
> rate of ~ 120Hz.
>
> The update on job_free() is used to cover a gap: if exec
> queue is created and destroyed rapidily, before a new query, the
> timestamp still needs to be accumulated and accounted on the xef.
> Initial implementation in commit 6109f24f87d7 ("drm/xe: Add helper to
> accumulate exec queue runtime") couldn't do it on the exec_queue_fini
> since the xef could be gone at that point. However since commit
> ce8c161cbad4 ("drm/xe: Add ref counting for xe_file") the xef is
> refcounted and the exec queue has a reference.
>
> Improve the fix in commit 2149ded63079 ("drm/xe: Fix use after free when
> client stats are captured") by reducing the frequency in which the
> update is needed.
>
> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b15ca84b2422..bc2fc917e0de 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -260,8 +260,14 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
>  
> +	/*
> +	 * Before releasing our ref to lrc and xef, accumulate our run ticks
> +	 */
> +	xe_exec_queue_update_run_ticks(q);
> +
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_put(q->lrc[i]);
> +
>  	__xe_exec_queue_free(q);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e5d7c767a744..ebe4665d9159 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -747,8 +747,6 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  
> -	xe_exec_queue_update_run_ticks(job->q);
> -
>  	trace_xe_sched_job_free(job);
>  	xe_sched_job_put(job);
>  }
