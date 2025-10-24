Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CF1CCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 08:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D0010E240;
	Fri, 24 Oct 2025 08:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THwTshWc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7E610E240
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294896; x=1792830896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4wQfr/4gzCxd7A7DQ7GvCknVjO/1e7VHSbNbef8oT4s=;
 b=THwTshWc7ahFIKgUjocmkuFJTXjK5zTkK3/n3T/Apk32q+u3qwu2P2tR
 1GIx1AyHYoBJ2yfLuvLC/ovBOTypIT91a+J9M6WSIR2ZsHpBOx2vdkqZI
 DrVGq2Mvh/rNMBGhl5LCGpN/di9RPOZyZvsTdQ6ZR5jYQ9hB+ago6JRcc
 yjMEIkuiQcQdlf7cDc/9x1jEoy/c0aZPWJq/riV9OD80nJX8JpqSObI1H
 poLdcd5OCr9NTVZs1S4iClHg8i+KKW35B3ucgGipI6Wu0hS13IJuGMj4B
 D6QpBxsTJhzjo80Y6/GsDfZS64D4d1dIcSATM+3VfTS4oS3kDb2JkFG46 w==;
X-CSE-ConnectionGUID: mIps8EaSRJyrE7U42L9dTw==
X-CSE-MsgGUID: aKJiIybySSKAOtbs6T06lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66091007"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="66091007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:34:56 -0700
X-CSE-ConnectionGUID: Jiq68b1bTP6rCuaoUR4BnQ==
X-CSE-MsgGUID: 5MXPMkgcTPmZYkyTxmJH5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184754780"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:34:55 -0700
Date: Fri, 24 Oct 2025 10:34:53 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/xe/gt_throttle: Tidy up attribute definition
Message-ID: <aPs6LRyRxJzwn_qj@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-5-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-gt-throttle-cri-v1-5-9f36f3c8861c@intel.com>
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

On Thu, Oct 23, 2025 at 09:56:58AM -0700, Lucas De Marchi wrote:
> Move the attribute definitions to be grouped together rather than near
> the show() function: checkpatch keeps complaining about the missing
> newline when defining new attributes and it reads better to group
> everything, which should match e.g. the xe_pmu.c style.
> 
> While grouping them, also define a THROTTLE_ATTR_RO(), similar to
> DEVICE_ATTR_RO(), and use it to define all attributes. This makes it
> shorter and with a familiar syntax.
> 
> Finally, during the cri_throttle_attrs[] array definition, also
> highlight what's coming from common attributes and what is CRI-specific.
> 
> These 3 things could be done as separate commits, but they are all about
> the same thing: reduce the attribute definition verbosity and are very
> simple and mechanical.

...

> @@ -271,19 +265,33 @@ static struct attribute *throttle_attrs[] = {
>  	NULL
>  };
>  
> +static THROTTLE_ATTR_RO(reason_soc_thermal);
> +
> +static THROTTLE_ATTR_RO(reason_soc_avg_thermal);
> +static THROTTLE_ATTR_RO(reason_fastvmode);
> +static THROTTLE_ATTR_RO(reason_mem_thermal);
> +static THROTTLE_ATTR_RO(reason_vr_thermal);
> +static THROTTLE_ATTR_RO(reason_iccmax);
> +static THROTTLE_ATTR_RO(reason_psys_pl1);
> +static THROTTLE_ATTR_RO(reason_psys_pl2);
> +static THROTTLE_ATTR_RO(reason_p0_freq);
> +static THROTTLE_ATTR_RO(reason_psys_crit);

I'd make the ordering consistent with cri_throttle_attrs[] or the other way
around, whichever makes more sense.
With that perhaps you won't even need the blank line above.

Raag

>  static struct attribute *cri_throttle_attrs[] = {
> +	/* Common */
>  	&attr_status.attr,
> +	&attr_reason_pl1.attr,
> +	&attr_reason_pl2.attr,
> +	&attr_reason_pl4.attr,
>  	&attr_reason_prochot.attr,
> +	&attr_reason_ratl.attr,
> +	/* CRI */
> +	&attr_reason_vr_thermal.attr,
>  	&attr_reason_soc_thermal.attr,
>  	&attr_reason_mem_thermal.attr,
> -	&attr_reason_vr_thermal.attr,
>  	&attr_reason_iccmax.attr,
> -	&attr_reason_ratl.attr,
>  	&attr_reason_soc_avg_thermal.attr,
>  	&attr_reason_fastvmode.attr,
> -	&attr_reason_pl4.attr,
> -	&attr_reason_pl1.attr,
> -	&attr_reason_pl2.attr,
>  	&attr_reason_psys_pl1.attr,
>  	&attr_reason_psys_pl2.attr,
>  	&attr_reason_p0_freq.attr,
> 
> -- 
> 2.51.0
> 
