Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659CC369D6
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 12:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500BF10E814;
	Wed, 25 Sep 2024 12:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M71gPzaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAF310E814
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727265693; x=1758801693;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IDLEByzOqG5v1O84Il+KZI6lpuuO7DfCjY2hhE+cTgs=;
 b=M71gPzaacygdEmarWY8W5VEpxZAxGddKyTElOxkXGJC5Ekde70Uzz8KX
 z5XjoE08gQJvpin8wBWOibtHTFtzQeIHHLnOzCwprFYT+pp85sYo55u9u
 RD9O+G5+hICc7Dp3HEsH9u3xQagtYBQDlv1gDUlvM0nkgZyYAwuLs0hED
 khO2Exq2sBTfAZoW0IHgrrT/+jEvGTqFDo5n/aoFs7By55OEUo2eCXvdA
 KckUnvWoC2q6b+JPOcIfPnyCt/HuVuCN3jbEKWA7IkuWothDrifa20U5u
 +MZlmwT0CkOT1rHsZz+ScHNtlWAmOrWukhHGD2eTjFWEwFeSvT2fedNxD w==;
X-CSE-ConnectionGUID: ljRs4cIYQ7m27zKqRo/sEg==
X-CSE-MsgGUID: xeFcgABuSQ+xKOYSYQpAgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37448910"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="37448910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:01:32 -0700
X-CSE-ConnectionGUID: VgCeYkl+Sc2fPyrh99q3dA==
X-CSE-MsgGUID: 1CwLhKCqSIyP8OBu17jCoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76678890"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 25 Sep 2024 05:01:31 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2BB9A28197;
 Wed, 25 Sep 2024 13:01:28 +0100 (IST)
Message-ID: <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
Date: Wed, 25 Sep 2024 14:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
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



On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a domain awake request, do not
> increment the reference count for the domain. This ensures that
> subsequent _get calls do not incorrectly assume the domain is awake. The
> return value is a mask of domains whose reference counts were
> incremented, and these domains need to be released using
> xe_force_wake_put.
> 
> The caller needs to compare the return value with the input domains to
> determine the success or failure of the operation and decide whether to
> continue or return accordingly.
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
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>  2 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..d190aa93be90 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
> + * they are asleep.

nit: likely we should also add the note that one shall call the
xe_force_wake_put() function to decrease refcounts

> + *
> + * Return: mask of refcount increased domains. 

do we really need to expose implementation detail to the caller?

can't we just treat the returned value as opaque data that just needs to
be passed to the matching xe_force_wake_put(fw, ref) call ?

> If the return value is
> + * equal to the input parameter @domains, the operation is considered
> + * successful. 

sorry, but I'm still little uncomfortable with such approach, due to a
mismatch between input parameter type that is enum xe_force_wake_domains
and return type which is unsigned int, as IMO forcing the user to
compare two different types seems wrong

can't we just say that if returned value is zero then no domains were
waken (which would provide definite answer if single domain was requested) ?

and for the xe_force_wake_get(fw, ALL_DOMAINS) case, we can provide
helper function that will check if specified domain is really awake:

	ref = xe_force_wake_put(fw, ALL_DOMAIN)

	if (ref) {
		xe_force_wake_is_awake(fw, SINGLE_DOMAIN)

		xe_force_wake_put(fw, ref)
	}

> Otherwise, the operation is considered a failure, and
> + * the caller should handle the failure case, potentially returning
> + * -ETIMEDOUT.
> + */
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>  	unsigned long flags;
> -	int ret = 0;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>  		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>  			domain_wake(gt, domain);
>  		}
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
> +	ret = (domains & ~awake_failed);
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> +	xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to acknowledgment awake\n",
> +		   str_plural(hweight_long(awake_failed)), awake_failed);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..6c1ade39139b 100644
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

