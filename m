Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF21CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 08:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495BF10E446;
	Fri, 12 Sep 2025 08:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCGgt8TQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E8510E446
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757665301; x=1789201301;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yDPuxLtTkLQHmwSzP2WYGkRrB4nOJnKcBTOCKhjWIFQ=;
 b=fCGgt8TQSZMLyC1FfOzngvQ3AAE3bHYMJp3yAFL4Wt0YqY7T7eJmGp8C
 H1ojO92Xul6ib8KMQ3kUPL04MWAnYqQgDC/RyZkN7NDSbSobNczEH8uiF
 SRua/rp93QsuV6IhCC3cTDoIAcm+L8OtEQa/ixQfWJZz/awwRcdM1P5vx
 YHwKCmLvtzfDyxPpEODl2pevitDtDBwp8iQAJgyyduSgwpeFFAQ55FkYL
 BzQr37s2Q6pInnSBvIJnNS5afN4FUz/JRKRdqqNezRp1HwyQgOE6CHRTS
 RknxE7nE8l6QlkcHnQ2Xg1EZDUter+plgSjZYwX6kgWDRAD3tLwSmI0Ek A==;
X-CSE-ConnectionGUID: +f51HkgAQYiKR0uX856/yA==
X-CSE-MsgGUID: z25tMjBBQu+wrI32GeezMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82596332"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82596332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:21:40 -0700
X-CSE-ConnectionGUID: oxJzmKqiQNiq9WzB7KP+kA==
X-CSE-MsgGUID: da/RgX5hTNqiE5SKrQDxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174297083"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 01:21:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/display: Add definition for wcl as
 subplatform
In-Reply-To: <20250911210514.389014-3-dnyaneshwar.bhadane@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250911210514.389014-1-dnyaneshwar.bhadane@intel.com>
 <20250911210514.389014-3-dnyaneshwar.bhadane@intel.com>
Date: Fri, 12 Sep 2025 11:21:35 +0300
Message-ID: <84fc10ec3b82b3436b521811589067ad0850eacd@intel.com>
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

On Fri, 12 Sep 2025, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com> wrote:
> Update the device definition structs for adding wildcat lake as
> subplatfrom of pantherlake.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_display_device.h |  4 +++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index 65f0efc35bb7..1b9c921290e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1379,6 +1379,11 @@ static const u16 mtl_u_ids[] = {
>  	0
>  };
>  
> +static const u16 wcl_ids[] = {
> +	INTEL_WCL_IDS(ID),
> +	0
> +};
> +
>  /*
>   * Do not initialize the .info member of the platform desc for GMD ID based
>   * platforms. Their display will be probed automatically based on the IP version
> @@ -1406,6 +1411,13 @@ static const struct platform_desc bmg_desc = {
>  
>  static const struct platform_desc ptl_desc = {
>  	PLATFORM(pantherlake),
> +	.subplatforms = (const struct subplatform_desc[]) {
> +		{
> +			SUBPLATFORM(pantherlake, wildcatlake),
> +			.pciidlist = wcl_ids,
> +		},
> +		{},
> +	}
>  };
>  
>  __diag_pop();
> @@ -1482,6 +1494,7 @@ static const struct {
>  	INTEL_LNL_IDS(INTEL_DISPLAY_DEVICE, &lnl_desc),
>  	INTEL_BMG_IDS(INTEL_DISPLAY_DEVICE, &bmg_desc),
>  	INTEL_PTL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),
> +	INTEL_WCL_IDS(INTEL_DISPLAY_DEVICE, &ptl_desc),

Right, so this part belongs in the previous patch. Otherwise the series
breaks bisect.

>  };
>  
>  static const struct {
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 6e87b763fe7c..dcc010caa423 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -101,7 +101,9 @@ struct pci_dev;
>  	/* Display ver 14.1 (based on GMD ID) */ \
>  	func(battlemage) \
>  	/* Display ver 30 (based on GMD ID) */ \
> -	func(pantherlake)
> +	func(pantherlake) \
> +	func(pantherlake_wildcatlake)
> +
>  
>  #define __MEMBER(name) unsigned long name:1;
>  #define __COUNT(x) 1 +

-- 
Jani Nikula, Intel
