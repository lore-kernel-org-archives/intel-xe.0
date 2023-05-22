Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A93C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 11:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4665D10E2DC;
	Mon, 22 May 2023 11:47:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EBA10E2DC
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684756058; x=1716292058;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ms+LnFrdfLSr+nj5Cmqm4m88ZzH+VjaKYmTPJzM9Bmo=;
 b=Q/YAii6khJyft9Qwm6jV6Ax1FsWA9vhrEc+1H9sIf2ViQejtGcGe3dvD
 bmY7ES3/2yALKZTz18r49PShU9wfzBeret+FsVgHGU5nQmfteKcMOk3qI
 s+hN4t/x8GYQb4zIypTaIi87sG33+P+5Y+t06QwPwQYutcmAtU7aqECCc
 DAITegbuUMH9IoRsWr6e/xZl9wjSJf1rMgI2Rr0X85uhhqMEh1CeURR58
 /+c6W+IMeRBNAsYEkwwUe5AGnT+hryqf9CzMU4BLhNUixwTNJSaitvmYq
 Qvh0A9FQQ8+o4H9Iov+7J32iG4XQk+NEy9YB7xbAmh7wSR2yW0w+g22PT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="342349147"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="342349147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="706509513"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="706509513"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.40.98])
 ([10.249.40.98])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:47:37 -0700
Message-ID: <566806c4-3f63-0282-e134-65568c2e624c@linux.intel.com>
Date: Mon, 22 May 2023 13:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-27-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230519231827.3572452-27-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 26/30] drm/xe/tlb: Obtain forcewake when
 doing GGTT TLB invalidations
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/20/2023 1:18 AM, Matt Roper wrote:
> Updates to the GGTT can happen when there are no in-flight jobs keeping
> the hardware awake.  If the GT is powered down when invalidation is
> requested, we will not be able to communicate with the GuC (or MMIO) and
> the invalidation request will go missing.  Explicitly grab GT forcewake
> to ensure the GT and GuC are powered up during the TLB invalidation.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 31f958613c2f..8f8d0f6a82cd 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -193,6 +193,13 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>   	if (!gt)
>   		return;
>   
> +	/*
> +	 * Invalidation can happen when there's no in-flight work keeping the
> +	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> +	 * and GuC are accessible.
> +	 */
> +	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +
>   	/* TODO: vfunc for GuC vs. non-GuC */
>   
>   	if (gt->uc.guc.submission_state.enabled) {
> @@ -214,6 +221,8 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>   			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>   					GUC_TLB_INV_CR_INVALIDATE);
>   	}
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   }
>   
>   void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
