Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9462EEE266
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA010E950;
	Thu, 12 Sep 2024 21:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IllGYGHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DF610E950
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726176859; x=1757712859;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m5NGDSf5+BnAih73ookYzmKDG8PxfjqCLWxpOdddJUE=;
 b=IllGYGHlyNeyjySYEwq7XTgMvLKHObEP3Okw6vjrwvf0ZxAZAHKQ+DKG
 1sQvY2viO7fQIhay5JGWaNXgVG8vDSoTOB3FGFoXZpskvjH8KPJUCVVdq
 gzSAm44FQWDADgc+MvHMLntKVijeezrJBQZ6xjN4Pzk2rLqz3axioq5S5
 Pz12Fzn7ZAB9CHldv+hLAz6xfhh0TdeyfxdvtMtocIdz00+5L34518/r/
 IxBXegTe7OFvYFySEzl+mxsRSetVB235rvvZhZal501oQhnHJ+pjDVg9B
 U3PVwXqqt/r7j6ZhVagrpVF5skboOblS2mdW7vWCM/+ndjNLOmKolEzx/ g==;
X-CSE-ConnectionGUID: a3gYl8jWRsuYgNc8xFb4Gw==
X-CSE-MsgGUID: lcP1/htpQRyaigzwwFIiig==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35630092"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35630092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:34:18 -0700
X-CSE-ConnectionGUID: SH6Lc96hSQ+hHfIgjgMBig==
X-CSE-MsgGUID: yZanl+z7Tj6UwxhsNUYhug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68139818"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 14:34:16 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 426422877A;
 Thu, 12 Sep 2024 22:34:14 +0100 (IST)
Message-ID: <7e1c52ad-bf20-43c7-bd41-efb28713a6e2@intel.com>
Date: Thu, 12 Sep 2024 23:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912191603.194964-3-himal.prasad.ghimiray@intel.com>
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



On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
> Instead of calling xe_force_wake_put on all domains that were input to
> xe_force_wake_get, call _put only on the domains whose reference counts
> were successfully incremented by the _get call. Since the return value
> of _get can be a mask that does not match any specific value in the enum
> xe_force_wake_domains, change the input parameter of _put to int.
> 
> Add kernel-doc for the xe_force_wake_put()
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 24 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index fa42d652d23f..e91bbcbddb8b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -198,8 +198,21 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	return ret;
>  }
>  
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @domains_mask: forcewake domain mask to put reference
> + *
> + * This function reduces the reference counts for specified domain mask. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within specified timeout.
> + * Ensure this function is always called with return of xe_force_wake_get() as
> + * @domains_mask.
> + *
> + * Returns 0 in case of success or non-zero in case of timeout of ack

what's the expectation for the caller when this function returns an
error? if just WARN() then maybe this can be done inside this function
and we can make it void ?

> + */
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      int domains_mask)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> @@ -207,8 +220,15 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	unsigned long flags;
>  	int ret = 0;
>  
> +	/*
> +	 * Avoid unnecessary lock and unlock when the function is called
> +	 * in error path of individual domains.
> +	 */
> +	if (!domains_mask)
> +		return 0;
> +
>  	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>  		if (!--domain->ref) {
>  			sleep |= BIT(domain->id);
>  			domain_sleep(gt, domain);
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..e2bb6b03e495 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +		      int domains_mask);
>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,
