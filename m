Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455CEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 14:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EECF10E12D;
	Thu, 29 Jun 2023 14:40:12 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AF810E12D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688049611; x=1719585611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+6e4TPP25yZ9diKxZwARg0PGmdK5h0zQDfDb8R5WbtM=;
 b=LgqLn0OS/4weLCPfwpoSp8Z7vTF43gA2mvZwZCdV6LjLCiU4HnVpkwvt
 NDMNr7xIM589Za4hEMzX1Nqv3Tp5uHKL5AzxRpjN9wry6MW7ORJBp+cMq
 Uwcb3f+93TbheQJkRBm+t2ZkE5k7yNKa6KdzYdVHF7UXGPs8vAONMYEPw
 HuZM/JdceElWBnwnFbgXEGqDOtmZGhl9LgkcdIkll18EXgN0UPpXgosJx
 DyfqFfPT/uEoRaQ38XR9BQa77kN+b3UMYfpbkLW967FpKK7UVl7sXKeTz
 q3GcGsuJtz7OyM2gIj/bOugE+dK6pjkPnNJeiC2wknszJ9cPvRSomNLKl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359608611"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="359608611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="694658873"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="694658873"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:40:04 -0700
Date: Thu, 29 Jun 2023 16:40:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZJ2XwFlgq4DUTrZr@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-4-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-4-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/hwmon: Expose card reactive
 critical power
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> This is port from i915 hwmon.

Should this, then be a more generic framework for more gpu
drivers? Now we are having some code duplication.

[...]

>  hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>  {
>  	u32 reg_val;
> +	u32 uval;
>  
>  	switch (attr) {
>  	case hwmon_power_max:
> @@ -248,6 +274,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
>  	case hwmon_power_rated_max:
>  		return process_hwmon_reg(ddat, pkg_power_sku,
>  					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

I like better the form below, with

	err = hwm_pcode_read...()
	if (!err)
		return 0;
	
	return !(uval & ....

>  	default:
>  		return 0;

[...]

> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

this is a pattern that is repeated quite often, should this be a
separate function, maybe?

Andi

[...]
