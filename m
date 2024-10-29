Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C29AD2AB1D
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 10:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394BC10E253;
	Tue, 29 Oct 2024 10:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jwn1BWYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540EA10E253
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730199552; x=1761735552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D4x0LW2X773aTtiklWD6zcs30iEW3uOTvFhsGYQ/xTM=;
 b=Jwn1BWYssOEPOKDrZJFN8x7/R3l/lSFJNh8rMRrbMaSdopcZS8OEEq5A
 tR83hgTtY4QWOaHpYQDBDNp+VvZILC1l5l1PQmzrRKPTjxs2bpHI6c4/H
 oOaP0bsIkilZ8feKpj7+2PbYzrt4By9+8avVcjSWD5qE2ubMoWKKNjhWy
 +x1Pilf7+58qwFzPXpcBy3q6eU7Ed1PD3UAFM9gmt8srD+G/b/sDdRjAf
 1q8WKnEWOJL2462VLimaXveEBh17JDnzkOXwIufVaA7CKGcx/F+rFo98H
 WOXm4wGMC7WEaglFLiDEXYoKhHdUbiWB5jK41/96Z0ZlIR0FG9vU+7xv7 Q==;
X-CSE-ConnectionGUID: DZ1XOkCeT0eXHBBgqBh/OA==
X-CSE-MsgGUID: 7dFfOZxpRNeBCQc6G/5Suw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="17466067"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17466067"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 03:59:12 -0700
X-CSE-ConnectionGUID: mXaZVkVTR7+sEWVgmdKucg==
X-CSE-MsgGUID: gG0dogHoQFWFIXyYOzXJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="86535921"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 03:59:10 -0700
Message-ID: <b50daa2b-45b7-434b-88e9-d5f40bcc6542@intel.com>
Date: Tue, 29 Oct 2024 10:59:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/guc/tlb: Flush g2h worker in case of tlb
 timeout
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
References: <20241029095416.3919218-1-nirmoy.das@intel.com>
 <20241029095416.3919218-3-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029095416.3919218-3-nirmoy.das@intel.com>
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

On 29/10/2024 09:54, Nirmoy Das wrote:
> Flush the g2h worker explicitly if TLB timeout happens which is
> observed on LNL and that points to the recent scheduling issue with
> E-cores on LNL.
> 
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> v2: Add platform check(Himal)
> v3: Remove gfx platform check as the issue related to cpu
>      platform(John)
>      Use the common WA macro(John) and print when the flush
>      resolves timeout(Matt B)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 773de1f08db9..0bdb3ba5220a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -81,6 +81,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt))
>   			break;
>   
> +		LNL_FLUSH_WORK(&gt->uc.guc.ct.g2h_worker);

I think here we are holding the pending lock, and g2h worker also wants 
to grab that same lock so this smells like potential deadlock. Also 
flush_work can sleep so I don't think is allowed under spinlock.

> +		since_inval_ms = ktime_ms_delta(ktime_get(),
> +						fence->invalidation_time);

I think invalidation_time is rather when we sent off the invalidation 
req, and we already check that above so if we get here then we know the 
timeout has expired for this fence, so checking again after the flush 
doesn't really help AFAICT.

I think we can just move the flush to before the loop and outside the 
lock, and then if the fence(s) gets signalled they will be removed from 
the list and then also won't be considered for timeout?

> +		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt)) {
> +			xe_gt_dbg(gt, "LNL_FLUSH_WORK resolved TLB invalidation fence timeout, seqno=%d recv=%d",
> +				  fence->seqno, gt->tlb_invalidation.seqno_recv);
> +			break;
> +		}
> +
>   		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
>   		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
>   			  fence->seqno, gt->tlb_invalidation.seqno_recv);
