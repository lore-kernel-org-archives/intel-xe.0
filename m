Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71424CDE024
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 17:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CC10EBBE;
	Thu, 26 Sep 2024 17:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVX2RmAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6888A10EBBE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727371527; x=1758907527;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Yk2MCe9l4bA12Jk4OJP6nLhTSpZfCs266nFsxFWr+vE=;
 b=dVX2RmArIDL4mXMASIpiHFvC1XfMDswxex71mLDYBibEneB5pkEYcfbl
 Ir6rXagL1kDsjiBlQgIJxIMJORDn9GMOSoOvBjeIxabPjWSEWbX1PHAQ8
 BM8cyzs6wuTMY1//DZvRp44QXm2+Mf/3atEfuCBd6vsLXC8W4cn0VQ3Ye
 +8Sy3hfwgbElMpphSy7+UDv4TIjTHmppdvsmOOyJiL9qaO4A5oirNWDP9
 LHsIyl9Ep1f30CWhxmGpNKhbLvDb5MWXG7pt0ogzNz4hbOXUzrlqfSjkY
 aHisldjuuPKfuMby8/YYYI5bHzL9YrgXmaX3Lc9KpEgxrbiLt2S8UZ6tB Q==;
X-CSE-ConnectionGUID: yNBG4TeORJa6OXSfBF1QDQ==
X-CSE-MsgGUID: ub1iDLhRQUiYL6jaHcyn6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26649533"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26649533"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:25:27 -0700
X-CSE-ConnectionGUID: of3uk0nQRb2Ts03QgceJSw==
X-CSE-MsgGUID: /DpfbbE7SPKnNNdg9abV/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72388712"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.194.204])
 ([10.245.194.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 10:25:26 -0700
Message-ID: <3a332ca8-fef1-4cbc-b82b-c8eb1090a318@linux.intel.com>
Date: Thu, 26 Sep 2024 19:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Resume TDR after GT reset
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240724235919.1917216-1-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240724235919.1917216-1-matthew.brost@intel.com>
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


On 7/25/2024 1:59 AM, Matthew Brost wrote:
> Not starting the TDR after GT reset on exec queue which have been
> restarted can lead to jobs being able to be run forever. Fix this by
> restarting the TDR.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 5 +++++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 1 +
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index e4ad1d6ce1d5..7f24e58cc992 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -90,6 +90,11 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
>  	cancel_work_sync(&sched->work_process_msg);
>  }
>  
> +void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
> +{
> +	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
> +}
> +
>  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..6aac7fe68673 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -22,6 +22,8 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>  void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
>  
> +void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
> +
>  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>  		      struct xe_sched_msg *msg);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 460808507947..2327e11ae311 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1768,6 +1768,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>  	}
>  
>  	xe_sched_submission_start(sched);
> +	xe_sched_submission_resume_tdr(sched);
>  }
>  
>  int xe_guc_submit_start(struct xe_guc *guc)
