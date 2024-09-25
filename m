Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A8CCF9C6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 14:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D021910E836;
	Wed, 25 Sep 2024 14:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIbpIhtL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CDE10E836
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727272996; x=1758808996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zWOkA4FjQya7Dzr67XCiqDXAD/8stsgzqpuNNMQpPEs=;
 b=RIbpIhtLqgI8tp2fuqXBUVE8NdVgRSXuYrVSFoLG92EMwHCSUTLg52Yu
 Jcu2WeAc9eC2I4zhNCbqva/+nURZxF6kP+bkJ9rslBka0JzNjMWxumbJL
 Uz1zg0s/iGDjtuycOifPrdb3Xa65gPso9lcvelNpcXzumOFGnmBOBefK7
 kW+9qPZ6CZJfe7E6+IgjTWCCEf33jU8HItUDzWRR9ZKp+7gKJd75Az0+Y
 JpNmQsAg96nCtdJUh75lOGcdPksn/vq87zoLiU/BoI4LV/BKPQdnm4i9x
 Yn9MIFKkUfRwyDqq1pubPftO2OxzBGYjErLSFHRCtJObbof75br5YO8EG w==;
X-CSE-ConnectionGUID: jrowGN3XSLq8nph7i8K9aQ==
X-CSE-MsgGUID: MD6jv9rwSD6HEfiLdOIqAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36903122"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36903122"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 07:03:16 -0700
X-CSE-ConnectionGUID: 5bsw0VmzTveZyxNbcacg6A==
X-CSE-MsgGUID: 13jhwQajSb2PC5tvW5uCkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="75891853"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2024 07:03:14 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3E75D284FE;
 Wed, 25 Sep 2024 15:03:13 +0100 (IST)
Message-ID: <e9a4259b-0e24-483d-822b-6bb2478075e0@intel.com>
Date: Wed, 25 Sep 2024 16:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240924121641.1045763-3-himal.prasad.ghimiray@intel.com>
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
> Instead of calling xe_force_wake_put on all domains that were input to
> xe_force_wake_get, call _put only on the domains whose reference counts
> were successfully incremented by the _get call. Since the return value
> of _get can be a mask that does not match any specific value in the enum
> xe_force_wake_domains, change the input parameter of _put to xe_wakeref_t.
> 
> v3
> - Move WARN to this patch (Badal)
> - use xe_gt_WARN instead of XE_WARN (Michal)
> - Stop using xe_force_wake_domains for non enum values.
> - Remove kernel-doc from this patch (Badal)
> 
> -v5
> - Fix global awake_domain
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 21 ++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d190aa93be90..c805214bc348 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -197,26 +197,37 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      unsigned int domains_mask)

it seems that in whole series you're using "fw_ref" as var name to hold
return value from the xe_force_wake_get() so maybe the same name should
be used here for the parameter instead "domain_mask" ?

>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned int tmp, sleep = 0;
>  	unsigned long flags;
>  	int ret = 0;

in patch 23/23 (which personally I would squash into this one) you're
changing return type to void, so keeping the local var named "ret" is
questionable

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
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret |= domain_sleep_wait(gt, domain);
> +		if (domain_sleep_wait(gt, domain) == 0)
> +			fw->awake_domains &= ~BIT(domain->id);
> +		else
> +			ret |= BIT(domain->id);
>  	}
> -	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> +	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
> +		   str_plural(hweight_long(ret)), ret);
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 6c1ade39139b..731a9a5a29a4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  			       enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +		      unsigned int domains_mask);
>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,

