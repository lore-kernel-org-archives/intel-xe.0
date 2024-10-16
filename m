Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DAD2A520
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8210E0A6;
	Wed, 16 Oct 2024 15:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDWrw/LU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EA810E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729090900; x=1760626900;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YMmrOWLkZSht715ZW1dPulnyJOPx+/CzogzfHMGZAb4=;
 b=XDWrw/LU9H2o/JvGld12oPUs/QL5+m2mFdVcTodQS3fM59acJM9USfh8
 4MfgNjchiJm1wO7GGfHiV0Fp71gUSIqsQKLw+GvhOIDLXHtdUK/eqCzd9
 8QU1Ybixux03J/sVCv/xDblngngJL2E1sdOgkQFCd791QiS0tvHr+/r20
 igZbuGQ7hMO1RYWYHX58B7d3Unr6pRb2bOpY09Xud99E+rNYygnNtQhEn
 biKlP9kqxs15Bf4LlkYxDBGGCYf9MOTaTmPiwQojfEsauQgn75Z/TXQpQ
 g2T153aaqBcQsz3toFp3NrHE6a3lNyU/Pjychhvy6KqsKYyt3Vkx5/mIn A==;
X-CSE-ConnectionGUID: m3F9V+toS0qq7opkJm2gQQ==
X-CSE-MsgGUID: zikRbOpqSpiPIVqyNzWzPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39171932"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="39171932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:01:40 -0700
X-CSE-ConnectionGUID: wzygAggzT5+23CUCKoJaJQ==
X-CSE-MsgGUID: D2LhUrsfRU+gL7h0PrJw6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78296062"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:01:39 -0700
Message-ID: <0fc813cb-e076-4431-830d-0f7508cea0e7@intel.com>
Date: Wed, 16 Oct 2024 16:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add caller info to xe_gt_reset_async
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20241016141717.881143-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241016141717.881143-1-nirmoy.das@intel.com>
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

On 16/10/2024 15:17, Nirmoy Das wrote:
> Add caller info to the xe_gt_reset_async() to help debug issues.
> 
> v2: s/%pS/%ps(Matt)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2874
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1c79660fb086..df2fe4005d85 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -834,7 +834,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   void xe_gt_reset_async(struct xe_gt *gt)
>   {
> -	xe_gt_info(gt, "trying reset\n");
> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
