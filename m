Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293EBCEFC39
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FC310E23A;
	Tue,  8 Oct 2024 18:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLaE9RpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98BC10E23A
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728411517; x=1759947517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vh9KvZYtoHtscGr3G2mxguce15rnL3TiBA3MOMEFIP8=;
 b=RLaE9RpNMI9bpOqefakn3H63Pg8il+exzF1+gFcCDxNeLEkss/Roi6wA
 JUoNoQjw1+2JfBZX/sYHc5Wlsn8P6VrovDDQte8tIOPOUZMlOpUhsA+B2
 iTvU3kYI4zBG1zXQwl6UFh4hQZBP8MMpTEopAQiOxN1QCPEZaUzXtz0AG
 JFCK0o8nYFyE6qq38kvkeQiG+2hwos1f27rEO75vMQqDVZkLC4ybW5LdU
 D6DoHR5itzozPyo6VgPF7M0a4XJsT4NCNPlIUileZX1FX0lu8rDx46ffF
 EJqKvZOES7+2TtX7pYe+oPTvaYvbz9Kzek71cYg58CUJweKGJSO4e8cZx g==;
X-CSE-ConnectionGUID: fsE9n6syRg+WK+9xqNepMw==
X-CSE-MsgGUID: 5/r/ltqBTJ2uzBQt3lDocg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31338682"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31338682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:18:37 -0700
X-CSE-ConnectionGUID: XTt38F/aS+aCvgI0oGPXLQ==
X-CSE-MsgGUID: cOIjWUMjRLymM9v+1JS5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75897963"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 08 Oct 2024 11:18:35 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 494D72FC5D;
 Tue,  8 Oct 2024 19:18:33 +0100 (IST)
Message-ID: <5a2d20a3-692c-476d-90c5-ea10c376b9d3@intel.com>
Date: Tue, 8 Oct 2024 20:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/26] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-6-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-6-himal.prasad.ghimiray@intel.com>
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
> Instead of calling xe_force_wake_put on all domains that were input to
> xe_force_wake_get, call _put only on the domains whose reference counts
> were successfully incremented by the _get call. Since the return value
> of _get can be a mask that does not match any specific value in the enum
> xe_force_wake_domains, change the input parameter of _put to unsigned int.
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
> -v6
> - put all initialized domains in case of FORCEWAKE_ALL.
> - Modify ret variable name (Michal)
> - Modify input var name (Michal)
> - Modify commit message and warn (Badal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>  2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index bfba276c48ac..7ff2588a8c47 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -213,26 +213,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      unsigned int fw_ref)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, sleep = 0;
> +	unsigned int tmp, sleep = 0;
>  	unsigned long flags;
> -	int ret = 0;
> +	int ack_fail = 0;
> +
> +	/*
> +	 * Avoid unnecessary lock and unlock when the function is called
> +	 * in error path of individual domains.
> +	 */
> +	if (!fw_ref)
> +		return 0;
> +
> +	if (fw_ref == XE_FORCEWAKE_ALL)
> +		fw_ref = fw->initialized_domains;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>  		if (!--domain->ref) {

shouldn't we assert that ref is non zero?

but otherwise LGTM so,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  			sleep |= BIT(domain->id);
>  			domain_sleep(gt, domain);
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret |= domain_sleep_wait(gt, domain);
> +		if (domain_sleep_wait(gt, domain) == 0)
> +			fw->awake_domains &= ~BIT(domain->id);
> +		else
> +			ack_fail |= BIT(domain->id);
>  	}
> -	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	return ret;
> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> +		   str_plural(hweight_long(ack_fail)), ack_fail);
> +	return ack_fail;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 75fa1a19797c..f0b27dbe7581 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  			       enum xe_force_wake_domains domains);
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +		      unsigned int fw_ref);
>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,

