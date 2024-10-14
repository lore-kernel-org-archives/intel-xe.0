Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F94CFC503
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 08:53:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D1D10E3D7;
	Mon, 14 Oct 2024 08:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQxhj88+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAA010E3D7
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728895982; x=1760431982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0gBkXajfsM9Bsucg8nNxfS7BlGYjxmIgjtsCnR1zJq8=;
 b=iQxhj88+KnOQ/uNjLhFpvdEusVIYw8s0+XSLcxt24vkBSlKQYczMewCz
 wM62RADNO/omEdSVe1KVKMOAdeXSFRJm0Ni60Rb6cfsICU7neizJ0avOY
 yvYbeac8IkSuVJ0+6wuH/NIMbvYIe0Pr60ydunThsa9nQ5lN32+BE8kAG
 Jv7B1MtRsknWmKNfx65N+xwt8rmxziml4yo7zgWunnROUukwGOe36EG3V
 b7D7OhMVhwzP+XlLPRF7Zla/RpZDg31e1jec3wY4vGF3sOlR274x1TU80
 8anncwsRoWUwx1gv8NPfC5HXttUAISiHXM56h9rtLsw9UI43RV2ErQcDN A==;
X-CSE-ConnectionGUID: /pkAJ21qTQCHtoehmld8mA==
X-CSE-MsgGUID: Hwpgk06HTfCmd4bb/rWexw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38876463"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="38876463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:52:51 -0700
X-CSE-ConnectionGUID: OtQvGXTOSNayEpF7yzuFxg==
X-CSE-MsgGUID: O+hr6XJMSrCzGwXoMWnH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="100845388"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.190])
 ([10.245.177.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 01:52:49 -0700
Message-ID: <55198ad3-c91d-4270-9a0e-8e99e812125b@linux.intel.com>
Date: Mon, 14 Oct 2024 10:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/26] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-6-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-6-himal.prasad.ghimiray@intel.com>
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
> -v9
> - Add assert condition.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 30 +++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d36ed4f8bdbe..7f285dbe6e2c 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -212,26 +212,42 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +		      unsigned int fw_ref)

nit: I think it make sense to mark it as const.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

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
> +	if (xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		fw_ref = fw->initialized_domains;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
> -	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
> +		xe_gt_assert(gt, domain->ref);
> +
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
