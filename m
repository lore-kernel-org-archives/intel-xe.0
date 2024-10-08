Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63828CEFC39
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B1910E23A;
	Tue,  8 Oct 2024 18:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBRljH2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0B10E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728410718; x=1759946718;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yH1ooWvhtRYyZCzbi4jWVkd1s17sqUZyStloMeKr2Lw=;
 b=IBRljH2SsNSN+VUqwIch/6yM8WA7FPr3Tty4U7VpDdbDeUuOq0z0nxbF
 QAjWDqcFfkrlyCYUS2ALyXZmtIOx0kO+u7rgcySOy6GeYkAl4FVYtliQ8
 vFZB57j7Rg5xG7cANk+LUxeNud2hxy+X1AHo6Ze1RjJWEc/9/8CeEp3sc
 h5+FJz/buhBNlhzHHaR/O6IqvcluCBfaRwfdYqogzrTqMgKcZWzA31AJi
 Zc+gq9Km2Qybf3rywj6vTGcW5wlgoN0dvpdB4mnr4v5XH5GaNcT/ZdFLa
 4GT0x4qQO5Q3kKgU4ULOIki3VRXUAWbA/nvvuEWCgawtIfL+drfX7yZDf A==;
X-CSE-ConnectionGUID: MkhN9gKORiKegq3hvDLIBA==
X-CSE-MsgGUID: LSnBrqyLTLWB2uCUaA9A/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27767317"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27767317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:05:18 -0700
X-CSE-ConnectionGUID: RsoECTHvQdO7vOuTUXe7Eg==
X-CSE-MsgGUID: Au8EJ7UqTuyjHgyfetn/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76288132"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 11:05:14 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC4082FC5D;
 Tue,  8 Oct 2024 19:05:12 +0100 (IST)
Message-ID: <07234b5f-4e89-43f2-b978-826e2a4b651e@intel.com>
Date: Tue, 8 Oct 2024 20:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/26] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-5-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-5-himal.prasad.ghimiray@intel.com>
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



On 08.10.2024 09:10, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a forcewake domain awake
> request, do not increment the reference count for the domain. This
> ensures that subsequent _get calls do not incorrectly assume the domain
> is awake. The return value is a mask of domains that got refcounted,
> and these domains need to be provided for subsequent xe_force_wake_put
> call.
> 
> While at it, add simple kernel-doc for xe_force_wake_get()
> 
> v3
> - Use explicit type for mask (Michal/Badal)
> - Improve kernel-doc (Michal)
> - Use unsigned int instead of abusing enum (Michal)
> 
> v5
> - Use unsigned int for return (MattB/Badal/Rodrigo)
> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
> 
> v6
> - Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
> actually refcounted domains in return. (Michal)
> - Modify commit message and warn message (Badal)
> - Remove unnecessary information in kernel-doc (Michal)
> 
> v7
> - Add assert condition for valid input domains (Badal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 53 +++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_force_wake.h       |  4 +-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>  3 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index ac0419da7173..bfba276c48ac 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -154,29 +154,62 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  					 (ffs(tmp__) - 1))) && \
>  					 domain__->reg_ctl.addr)
>  
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +/**
> + * xe_force_wake_get() : Increase the domain refcount
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * This function takes references for the input @domains and wakes them if

hmm, 'taking a reference' is implementation detail compared to the 'wake
up domain from sleep' so I would swap those statements

> + * they are asleep.If requested domain is XE_FORCEWAKE_ALL then only
                     ^
missing space after dot

> + * applicable/initialized domains will be considered for refcount and it is
> + * a caller responsibilty to check returned ref if it includes any specific

typo

> + * domain by using xe_force_wake_ref_has_domain() function. caller must call

s/caller/Caller

> + * xe_force_wake_put() function to decrease incremented refcounts.
> + *
> + * Return: opaque reference to woken domains or zero if none of requested
> + * domains were awake.
> + */
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
> +	unsigned int tmp, ref_rqst;
>  	unsigned long flags;
> -	int ret = 0;
> +
> +	xe_gt_assert(gt, is_power_of_2(domains) && domains <= XE_FORCEWAKE_ALL);

better to split into two asserts to better see which one fails

> +
> +	if (domains != XE_FORCEWAKE_ALL) {
> +		xe_gt_assert(gt, fw->initialized_domains & domains);

can we keep all asserts together at the top of the function as:

xe_gt_assert(gt, domains == XE_FORCEWAKE_ALL ||
	     fw->initialized_domains & domains);

> +		ref_rqst = domains;
> +	} else {
> +		ref_rqst = fw->initialized_domains;
> +	}
>  
>  	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>  		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>  			domain_wake(gt, domain);
>  		}
> +		ref_incr |= BIT(domain->id);
>  	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);
> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0) {
> +			fw->awake_domains |= BIT(domain->id);
> +		} else {
> +			awake_failed |= BIT(domain->id);
> +			--domain->ref;
> +		}
>  	}
> -	fw->awake_domains |= woken;
> +	ref_incr &= ~awake_failed;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	return ret;
> +	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
> +		   str_plural(hweight_long(awake_failed)), awake_failed);
> +
> +	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;

maybe simpler:

	if (ref_incr == fw->initialized_domains)
		ref_incr |= XE_FORCEWAKE_ALL;

	return ref_incr;

>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 1608a55edc84..75fa1a19797c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>  			   struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);
>  
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index fde17dc3d01e..899fbbcb3ea9 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -48,7 +48,7 @@ enum xe_force_wake_domains {
>  	XE_FW_MEDIA_VEBOX2	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
>  	XE_FW_MEDIA_VEBOX3	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
>  	XE_FW_GSC		= BIT(XE_FW_DOMAIN_ID_GSC),
> -	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT) - 1
> +	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>  };
>  
>  /**

but overall LGTM so with above nits fixed,

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

