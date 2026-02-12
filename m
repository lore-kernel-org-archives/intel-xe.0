Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566D7EDF04A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 06:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA9210E6DB;
	Thu, 12 Feb 2026 06:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJBBiZdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9C10E6DB
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 06:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770876994; x=1802412994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+JpjD//iw9Q6w8UqQlsLkMex+OlVohRJsX7YfIud3ys=;
 b=cJBBiZdR0AxW1h4tLBXz4l0kjiU8/51qtNWgYFYE5h0zxXcEKHTSssf1
 iinlY0t2o5i+QzmIndu6r5dYkeGRNzfRE/bK13AIkHwd3R76ilAR0+q+K
 Toj/U6MiqFu1dOolf6Zns1Tdo1drqO/IJLKyweVR69LUWe991OHNRF4jL
 zZKR4+YiBPwyd5Y8y5fGMLvE8TVidDIxeA0CQpjHw9BWaqu2ZURrH2/v7
 iE6h5KecVYfN7ZnWrc8lCWFe26/1ydCdN2GGIMDxVVJsmF9cShVoBwKDM
 YGTFih2ch5z8xlGwXaRBmhQtWBMekguF8yHRy39owN6UCvCkP7hKJnr+Z g==;
X-CSE-ConnectionGUID: heAIwDlORbag0tA7AUURdA==
X-CSE-MsgGUID: wGlgs70rRQCfp+kTwsOSrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75666945"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75666945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:16:34 -0800
X-CSE-ConnectionGUID: WS2wJ+DXRRqJhlbvGH94Zg==
X-CSE-MsgGUID: lDkeWW7iSuy9iBHPxLbqyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212587533"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:16:32 -0800
Date: Thu, 12 Feb 2026 07:16:29 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lukasz.laguna@intel.com
Subject: Re: [PATCH v1] drm/xe: Update xe_device_declare_wedged() error log
Message-ID: <aY1wPW9SUUTeSwFW@black.igk.intel.com>
References: <20260205113424.1629204-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205113424.1629204-1-raag.jadav@intel.com>
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

On Thu, Feb 05, 2026 at 05:04:24PM +0530, Raag Jadav wrote:
> Since the introduction of DRM wedged event, there are now a few different
> procedures to recover the device depending on selected recovery method.
> Update the error log to reflect this and point the user to correct
> documentation for it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Ping.

Raag

>  drivers/gpu/drm/xe/xe_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 815f0b0c9dfd..e59555896471 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1317,7 +1317,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
>  			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
> +			"IOCTLs and executions are blocked.\n"
> +			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
>  	}
> -- 
> 2.43.0
> 
