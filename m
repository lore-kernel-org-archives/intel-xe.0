Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D6C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 11:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBF310E0FC;
	Tue, 28 May 2024 11:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWgtDhMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA810E6DF
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716896134; x=1748432134;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QpC4quqXcx4z6z9i0lNhTdj0z9tJ1SM6B1np8SMIz/A=;
 b=GWgtDhMjWrM7iJwb4cdc5sGy2/x1fe7ZDoiPESOU6wH7S+OzJHx1C/YT
 JNLPqLx3+leqii/bNY1SaDrox341lHLuKyzs5tGicG5oiND9UfaJ1u2sH
 8koNWIXlwPmCa+tUAHMvLTHBnhzcyZ73hdD39RBF/MEmuIihlHBHkSSnw
 +BJSk9XGD4POV73Y3NWSwcLmGohtvZIfQBbXKUvYJiS5KSwQ5Nd/eNn6w
 q4ayKsy/ndux+ssXnl6YjB4AI6F2qeIpBsBfyYu9J+Yn17/3CLc/wpYh3
 naOvyTHr33PmE+tuTuk36N+RpGv6RaONvXAiKoPT1/ED0qf2G0jzn0Ee6 w==;
X-CSE-ConnectionGUID: N5LwffMCTEWPXCrz4axeZg==
X-CSE-MsgGUID: JrGYerYmSACKP9DFO2qthg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23898965"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="23898965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:35:33 -0700
X-CSE-ConnectionGUID: 65PuZfgvSs662UUBvtyU7A==
X-CSE-MsgGUID: NP0JjfS6Qty0a4RKSFKwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35034695"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:35:31 -0700
Message-ID: <03a44fa0-c187-4c8a-95c7-1dd6e1f14eab@intel.com>
Date: Tue, 28 May 2024 13:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
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

On 22.05.2024 09:27, Andrzej Hajda wrote:
> Tests show that user fence signalling requires kind of write barrier,
> otherwise not all writes performed by the workload will be available
> to userspace. It is already done for render and compute, we need it
> also for the rest: video, gsc, copy.
> 
> v2: added gsc and copy engines, added fixes and r-b tags
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---

Gently ping.
The patch is reviewed, needs just merging :)

Regards
Andrzej

> Changes in v2:
> - Added fixes and r-b tags
> - Link to v1: https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
> ---
> Matthew,
> 
> I have extended patch to copy and gsc engines. I have kept your r-b,
> since the change is similar, I hope it is OK.
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a3ca718456f6..a46a1257a24f 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>   
>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>   
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> +
>   	if (job->user_fence.used)
>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>   						job->user_fence.value,
>   						dw, i);
>   
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> -
>   	i = emit_user_interrupt(dw, i);
>   
>   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>   
>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>   
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> +
>   	if (job->user_fence.used)
>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>   						job->user_fence.value,
>   						dw, i);
>   
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
> -
>   	i = emit_user_interrupt(dw, i);
>   
>   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> 
> ---
> base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
> 
> Best regards,

