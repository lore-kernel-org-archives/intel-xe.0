Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F38ACFC503
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8FC10E3CE;
	Mon, 14 Oct 2024 08:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4qqEFKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8F510E3CE
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728894740; x=1760430740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L9RN6LRYKCwaI+4NwouTQA85GlbHsi85+LQjJMTa8ww=;
 b=D4qqEFKoOYL5dcGG7T29o3H6kucWZvXNlu2+FuBVUJH+wqnfnfKe3o1m
 qoC/b4O2zgF8MM4rwkoo5wv1q9z+JbsweFGTtGbW22BsNVJ45m09fm7K0
 JgM3+9E0vs784M2WZpzxqtY8lUqWyPM4KLkwDN63fGQ29yEUDgDc6qp3V
 P8gCXaxBp75fs1wbxuFgw8po5KGbHNkZIPxVBTDaS3Agz2CX9ZcY0lQ3d
 0H53VKdtQr8s/bbvnHY57MPvLvFSEHWAqloDbxIGZ3Jh08G4Gk3GYvlZT
 3wgdhKYUODnTFKdt4lpcTGXyzty5JXdAyfupRvR89gRwtNIChYjZ2HLix g==;
X-CSE-ConnectionGUID: qIMnh6yNQmWqADzgTuZiRw==
X-CSE-MsgGUID: vpKqJSWFQKG1gmU2cqQmOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28313875"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28313875"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:32:20 -0700
X-CSE-ConnectionGUID: yMa4QswqQjqvPVkTBm5/Ig==
X-CSE-MsgGUID: wUqiL88HRUaQoWLsgQBwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77693222"
Received: from nerrera-mobl1.ger.corp.intel.com (HELO [10.245.177.190])
 ([10.245.177.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:32:16 -0700
Message-ID: <59d97ff2-43dc-46f6-8858-04735186cd43@linux.intel.com>
Date: Mon, 14 Oct 2024 10:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/26] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-5-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-5-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
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
> v9
> - Update kernel-doc and simplify conditions (Michal)
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

I am bit too late to this party :)
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 52 +++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_force_wake.h       |  4 +-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
>  3 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index ac0419da7173..d36ed4f8bdbe 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -154,29 +154,61 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
> + * This function wakes up @domains if they are asleep and takes references.
> + * If requested domain is XE_FORCEWAKE_ALL then only applicable/initialized
> + * domains will be considered for refcount and it is a caller responsibility
> + * to check returned ref if it includes any specific domain by using
> + * xe_force_wake_ref_has_domain() function. Caller must call
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
>  
> +	xe_gt_assert(gt, is_power_of_2(domains));
> +	xe_gt_assert(gt, domains <= XE_FORCEWAKE_ALL);
> +	xe_gt_assert(gt, domains == XE_FORCEWAKE_ALL || fw->initialized_domains & domains);
> +
> +	ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw->initialized_domains : domains;
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
> +	if (domains == XE_FORCEWAKE_ALL && ref_incr == fw->initialized_domains)
> +		ref_incr |= XE_FORCEWAKE_ALL;
> +
> +	return ref_incr;
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
