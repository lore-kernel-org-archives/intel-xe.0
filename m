Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A8606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Na35lenq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB5C10FFBD;
	Thu, 12 Nov 2026 09:48:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9DA10E1AF;
 Thu, 12 Nov 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794476928; x=1826012928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+GR/dSv68czyfOrYp6bbGg0NrfRsl+ptzb/0Uc0kOn4=;
 b=Na35lenqBZnBT2rfMcCG354kI0L8CcYCCPRfbB7f0zdhr7cU+xzKOlBY
 DIaHbOtvAcxniUbCw+Kxw5lgDlBnotf/IQBYOEsQoA8n1bOl5JipgVJbu
 7tcaIwTBJXV13APdGD4mwiql1Y51Gai0NSShXRcH20e2FSoNcizhxvH2m
 Nfa6q3xVUKByCzMbVkcS9jFGxtle4UN7mx0eIMbIDhzm23oDab4Pk+SGW
 99Q6vRyBHnvzGnMB159yXlX4mIHIeyihI4Vwl3OkmjW0JQjb12cynOFUW
 3A/ynMCjB87Uvm0WydXMPeJ97qKbVJvaSaUPrcUD+PPq+Uo5gBGZY2uQw g==;
X-CSE-ConnectionGUID: 47FgFTZTQu+70B/MfZooAA==
X-CSE-MsgGUID: GCuB6bzxTEeUUTwHZ5rMcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3155337"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3155337"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:48:47 -0800
X-CSE-ConnectionGUID: Xd+vA4w4Rgmd2Me3fbMniA==
X-CSE-MsgGUID: hpvgRS0iTqO1eDsfV4tGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10505268"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:48:39 -0800
Date: Thu, 12 Nov 2026 10:48:33 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 15/15] drm/i915/pfit: Allow downscaling on i966+
Message-ID: <v7agf7wnm4vnw5iwairhdygsw7tm2pwjjikymi72stzmsyymg3@m3wmh3ljt4lj>
References: <20261019135309.23578-16-ville.syrjala@linux.intel.com>
 <20261020184111.5513-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020184111.5513-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 09:41:11PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The i965+ panel fitter supports downscaling. Allow it.
> 
> v2: Limit to <2.0 instead of <=2.0 (sashiko)
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 42d087b406e0..293ec2aae095 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
>  	int hscale, vscale, max_scale;
>  	struct drm_rect src;
>  
> -	max_scale = 0x10000;
> +	if (DISPLAY_VER(display) >= 4)
> +		max_scale = 0x20000 - 1;
> +	else
> +		max_scale = 0x10000;
>  
>  	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
>  
> -- 
> 2.55.0
> 
> 
