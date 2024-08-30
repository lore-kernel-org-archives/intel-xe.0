Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5946BCA0EE5
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148FE10E80E;
	Fri, 30 Aug 2024 06:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkK7f/LR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9FC10E80E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724999851; x=1756535851;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=I9KRszf2tKIUqPhV31GWGfHaPvJScsblXwBQeQavrW0=;
 b=mkK7f/LRXbFX3XsLHmq6z1CP6Htu/rtBN/JZrdQBidjJOcsKcydXJOkj
 ye24/Dni0i91woBAEihS34XRPClFNN1WTv9ZGkoX3wYYZKXs/XVoCsxcj
 TQPf95GJegOEry4+uvf6Hfv8QjC/RxiFuOaLul42vDm5O403+SWkj4bnm
 96TeSiJpHixnfHnGwiiCL8I2irXGVgvQAjHT+tDB2HaROiG+8BIWRRJCM
 gnzEk5yfJHT4mJ7pDxLJgkfsbopNVsd8cAiz6/rMj+JrF2+AC0R4JX82w
 wIJEtVloTjECcp7BaH8VrWtwUxMjuGQMhs1CoQz36UUoRPTKif9dfxiwQ g==;
X-CSE-ConnectionGUID: JRcqQp2ISt219Bw1MRUF6Q==
X-CSE-MsgGUID: vM7WudlbT2qQHpLFzrfMvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="13293218"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="13293218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:37:31 -0700
X-CSE-ConnectionGUID: pwr6nOgqREyXWInCIAO4nA==
X-CSE-MsgGUID: GpfIVJUkRWaKz7LMOEMZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68471316"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.88])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:37:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
In-Reply-To: <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
Date: Fri, 30 Aug 2024 09:37:22 +0300
Message-ID: <8734mmwm71.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 30 Aug 2024, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> If an acknowledgment timeout occurs for a domain awake request, put to
> sleep all domains awakened by the caller and decrease the reference
> count for all requested domains. This prevents xe_force_wake_get() from
> leaving an unhandled reference count in case of failure.
> While at it, add simple kernel-doc for xe_force_wake_get() and
> xe_force_wake_put() functions.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b263fff15273..8aa8d9b41052 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  					 (ffs(tmp__) - 1))) && \
>  					 domain__->reg_ctl.addr)
>  
> +/**
> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * Increment refcount for the force-wake domain. If the domain is
> + * asleep, awaken it and wait for acknowledgment within the specified
> + * timeout. If a timeout occurs, decrement the refcount and put the
> + * caller awaken domains to sleep.
> + *
> + * Return: 0 on success or 1 on ack timeout from domains.

Please stick to conventions on error returns, i.e. please use defined
negative error values instead of magic 1.

> + */
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>  	unsigned long flags;
>  	int ret = 0;
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
> +		if (domain_wake_wait(gt, domain) == 0)
> +			awake_ack |= BIT(domain->id);
> +	}
> +
> +	ret = (awake_ack == awake_rqst) ? 0 : 1;
> +
> +	/*
> +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
> +	 * for any domain, decrease the reference count and put the awake
> +	 * domains to sleep. For individual domains, just decrement the
> +	 * reference count.
> +	 */
> +	if (ret) {
> +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
> +				domain_sleep(gt, domain);
> +		}
> +		awake_ack = 0;
>  	}
> -	fw->awake_domains |= woken;
> +
> +	fw->awake_domains |= awake_ack;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @domains: forcewake domains to put reference
> + *
> + * This function reduces the reference counts for specified domains. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within specified timeout.
> + * Ensure this function is called only in case of successful xe_force_wake_get().
> + *
> + * Returns 0 in case of success or non-zero in case of timeout of ack
> + */
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {

-- 
Jani Nikula, Intel
