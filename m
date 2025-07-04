Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF508C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD010E9F3;
	Fri,  4 Jul 2025 10:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oV+csNSn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9810E9F3
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uo7p2K8jyyuG/GexWeVYeLwsJPmGxArDXE9YgeBX8gw=; b=oV+csNSnIOvI/L19hX/gYmswto
 U0WSUcBdbLzRIB+hbL5vZsuyLT/nYH7OTrjxM0B4Fq4uXMYZKL8N81eQ6K+raiTAtTyAoykhhmktK
 3A6oLM2yxp6J7K4/NXKAMt5W+ac0w6/PQ0J9N5p6KZYUPRWRafJ4mJTK/h3eh74T+BzFtaO7ww7xp
 Am0zwMH35KpFuvX2OJW5nvXH1wAWjS0d0dNm8sxbQF9L1mULh+7X8kXY5ecZ49JTXRbdXjfBEQclH
 mNAVYfp5mXiZ0DYP2q0ZYElXSoESjd0AbjNxdFIXmPzD2geV340Ow9qwBoinrGe0uljH+U91gK/TZ
 O0NLXfLQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXdl0-00CODg-TK; Fri, 04 Jul 2025 12:35:02 +0200
Message-ID: <b1ed4d6b-5970-4ea2-8c46-7593cfc627e3@igalia.com>
Date: Fri, 4 Jul 2025 11:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/xe/gt: Extract emit_job_sync()
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-3-6aa22f174041@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250703-lrc-refactors-v1-3-6aa22f174041@intel.com>
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


On 03/07/2025 23:41, Lucas De Marchi wrote:
> Both the nop and wa jobs are going through the same boiler plate calls
> to emit the job with a timeout and handling error for both bb and job.
> Extract emit_job_sync() so those functions create the bb, handling
> possible errors and delegate the part about really emitting the job
> and waiting for its completion.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 59 +++++++++++++++++++---------------------------
>   1 file changed, 24 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a926f560f2e36..67425e37c2187 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -146,30 +146,23 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   
>   static void gt_reset_worker(struct work_struct *w);
>   
> -static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> +static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> +			 long timeout_jiffies)
>   {
>   	struct xe_sched_job *job;
> -	struct xe_bb *bb;
>   	struct dma_fence *fence;
>   	long timeout;
>   
> -	bb = xe_bb_new(gt, 4, false);
> -	if (IS_ERR(bb))
> -		return PTR_ERR(bb);
> -
>   	job = xe_bb_create_job(q, bb);
> -	if (IS_ERR(job)) {
> -		xe_bb_free(bb, NULL);
> +	if (IS_ERR(job))
>   		return PTR_ERR(job);
> -	}
>   
>   	xe_sched_job_arm(job);
>   	fence = dma_fence_get(&job->drm.s_fence->finished);
>   	xe_sched_job_push(job);
>   
> -	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	timeout = dma_fence_wait_timeout(fence, false, timeout_jiffies);
>   	dma_fence_put(fence);
> -	xe_bb_free(bb, NULL);
>   	if (timeout < 0)
>   		return timeout;
>   	else if (!timeout)
> @@ -178,17 +171,28 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   	return 0;
>   }
>   
> +static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
> +{
> +	struct xe_bb *bb;
> +	int ret;
> +
> +	bb = xe_bb_new(gt, 4, false);
> +	if (IS_ERR(bb))
> +		return PTR_ERR(bb);
> +
> +	ret = emit_job_sync(q, bb, HZ);
> +	xe_bb_free(bb, NULL);
> +
> +	return ret;
> +}
> +
>   static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   {
>   	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
>   	struct xe_reg_sr_entry *entry;
> +	int count_rmw = 0, count = 0, ret;

Nit - might as well width sort the declarations while touching. Up to you.

>   	unsigned long idx;
> -	struct xe_sched_job *job;
>   	struct xe_bb *bb;
> -	struct dma_fence *fence;
> -	long timeout;
> -	int count_rmw = 0;
> -	int count = 0;
>   	size_t bb_len;
>   
>   	/* count RMW registers as those will be handled separately */
> @@ -199,9 +203,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   			++count_rmw;
>   	}
>   
> -	if (count || count_rmw)
> -		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
> -
>   	bb_len = count * 2;
>   	if (count_rmw)
>   		bb_len += count_rmw * 20 + 7;
> @@ -292,25 +293,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>   
>   	xe_lrc_emit_hwe_state_instructions(q, bb);
>   
> -	job = xe_bb_create_job(q, bb);
> -	if (IS_ERR(job)) {
> -		xe_bb_free(bb, NULL);
> -		return PTR_ERR(job);
> -	}
> +	if (bb->len)
> +		xe_gt_dbg(gt, "LRC WA %s save-restore batch: %u dw", sr->name, bb->len);
>   
> -	xe_sched_job_arm(job);
> -	fence = dma_fence_get(&job->drm.s_fence->finished);
> -	xe_sched_job_push(job);
> -
> -	timeout = dma_fence_wait_timeout(fence, false, HZ);
> -	dma_fence_put(fence);
> +	ret = emit_job_sync(q, bb, HZ);
>   	xe_bb_free(bb, NULL);
> -	if (timeout < 0)
> -		return timeout;
> -	else if (!timeout)
> -		return -ETIME;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   int xe_gt_record_default_lrcs(struct xe_gt *gt)
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

