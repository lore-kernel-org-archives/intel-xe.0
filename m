Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C1C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 08:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03510E4EF;
	Wed, 24 Jul 2024 08:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw1beJOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB410E549
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721810005; x=1753346005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YFvYOlip2dXTW66n9VgwRZ+Qex3fpYBEmSIvSDjaQ74=;
 b=Gw1beJOBcyMghcb3bE9Dch6B3DRIjbJx549xHlLuwHthVtQyE36fPDZy
 ArQ4acnoHBO8nDeuKg1l904V26oHSaC3LfVxpmlfcxBShLQ1TpCGFIQFe
 SZ/fHpFJZZ0SmdcznM3vJFbrTC+HZXE+pKVTdD8aTmw8DgaKtWwDL71Cg
 pWdCUOtAShNX9882o4MT0UvXj55XBzGgMHdfSQbC43ihCggRsS+ccivir
 i8tMY8GSbU7+VWWJXGgsNrgOGkySWyeS2sd/t0t4EZZ7p55gsXILQARA+
 2WJ3cSsiXct2uk44/9RuAKLhGfIqC11/ODmMf15xFe11In6JoKjtCbkOJ Q==;
X-CSE-ConnectionGUID: kXMD52QyS0C8m0FY/f+7Vg==
X-CSE-MsgGUID: HpsXFP7vRaWaCMBMsf2KTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="42001910"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="42001910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 01:33:25 -0700
X-CSE-ConnectionGUID: 9ZSxdVuiT8iXfna1NAKHnw==
X-CSE-MsgGUID: TUzsQofhTaibj3GOHCbtpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="89977902"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.186])
 ([10.94.250.186])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 01:33:23 -0700
Message-ID: <1119d480-49bc-498c-8f75-a6c3f63a5438@linux.intel.com>
Date: Wed, 24 Jul 2024 10:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove fence check from send_tlb_invalidation
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dan.carpenter@linaro.org
References: <20240723190714.1744653-1-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240723190714.1744653-1-matthew.brost@intel.com>
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


On 7/23/2024 9:07 PM, Matthew Brost wrote:
> 'fence' argument in send_tlb_invalidation cannot be NULL, remove
> non-NULL check from send_tlb_invalidation.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/
> Fixes: 61ac035361ae ("drm/xe: Drop xe_gt_tlb_invalidation_wait")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 481d83d07367..87cb76a8718c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -182,7 +182,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   	action[1] = seqno;
>   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> -	if (!ret && fence) {
> +	if (!ret) {
>   		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>   		/*
>   		 * We haven't actually published the TLB fence as per
> @@ -203,7 +203,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   						   tlb_timeout_jiffies(gt));
>   		}
>   		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> -	} else if (ret < 0 && fence) {
> +	} else if (ret < 0) {
>   		__invalidation_fence_signal(xe, fence);
>   	}
>   	if (!ret) {
