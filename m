Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49737606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUphz+fP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A2610E3D7;
	Tue, 27 Oct 2026 11:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0CE10E3D7;
 Tue, 27 Oct 2026 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793099647; x=1824635647;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rnJgpl18H4ft8HQSkOlCbVsnvjmcHbWBA1hWnQg+8Gk=;
 b=TUphz+fP1OvDFzCVlxhGC52BlKvzdIdNJ00O2rjXARjBf8fH1oEXn4Q9
 WeFuwo+9bL1JPAS+sjrhNeX2k/xByjeyL+t0Ls2TiZy7ZFMQ9EzcJ344S
 IwJPVL4iUcwSQu9LNPDFceGX3gUq318rH1Bw+GcdkXTFVeiKX7yRvHKS+
 204NxqpWimqzFtXI1IcT4ijIyNlJFp1QQV6s5ZF8xjx9udCeE+HE1hr0A
 NA1CX2QsMU13I0HPYhQxx8uAtZx9RPPisKqDPNgFIFxv7iFsxXjO8a/mF
 nIBV8RNRVsOPfDF6MswEfUn17xZSf74lNZo15uWQdBmvAGYoNRxArDrSH A==;
X-CSE-ConnectionGUID: smMBBK7ETnK6Wk4OPP7VKQ==
X-CSE-MsgGUID: PXEvfydjSdyuaItl5xpH8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1672140"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1672140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 04:14:07 -0700
X-CSE-ConnectionGUID: 4QG66X9jSZiK6xkUQzufkg==
X-CSE-MsgGUID: m5oadfNWQkWMQQJtVrDPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4619102"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 04:14:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com, Vidya Srinivas
 <vidya.srinivas@intel.com>, Charlton Lin <charlton.lin@intel.com>
Subject: Re: [PATCH v3] drm/i915/display: Limit scaler count and disable
 pipe joiner on WCL
In-Reply-To: <20261027043335.1906466-1-vidya.srinivas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
 <20261027043335.1906466-1-vidya.srinivas@intel.com>
Date: Tue, 27 Oct 2026 13:14:02 +0200
Message-ID: <4ce16eb36f580b8e1f7b71d9555bf6c0cbd8a3bd@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026, Vidya Srinivas <vidya.srinivas@intel.com> wrote:
> Pipe joining is not supported in the WCL display configuration.
> Modes that would require joining are rejected, matching the
> 4k 60Hz maximum resolution documented for the platform.
>
> Also, WCL support single pipe scaler instead of two.

One change per patch, please. The changes are functionally unrelated.

> Bspec: 74286

Git commit trailers go together with no blank lines in between...

> v2: Rebase onto latest upstream

...and certainly not the changelog in between. And v3 changes are
missing.

> Suggested-by: Charlton Lin <charlton.lin@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
>  drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index f17fc2c68472..c74256359c25 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1813,7 +1813,10 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
>  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
>  		for_each_pipe(display, pipe)
>  			display_runtime->num_scalers[pipe] = 0;
> -	else if (DISPLAY_VER(display) >= 11) {
> +	else if (DISPLAY_VERx100(display) == 3002) {
> +		for_each_pipe(display, pipe)
> +			display_runtime->num_scalers[pipe] = 1;
> +	} else if (DISPLAY_VER(display) >= 11) {
>  		for_each_pipe(display, pipe)
>  			display_runtime->num_scalers[pipe] = 2;
>  	} else if (DISPLAY_VER(display) >= 9) {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 00e02e019d25..ef164a797618 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -485,9 +485,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
>  			return false;
>  	}
>  
> -	return DISPLAY_VER(display) >= 12 ||
> +	return ((DISPLAY_VER(display) >= 12 && DISPLAY_VERx100(display) != 3002) ||
>  		(DISPLAY_VER(display) == 11 &&
> -		 encoder->port != PORT_A);
> +		 encoder->port != PORT_A));
>  }
>  
>  static int dg2_max_source_rate(struct intel_dp *intel_dp)

-- 
Jani Nikula, Intel
