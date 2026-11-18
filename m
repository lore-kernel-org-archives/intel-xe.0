Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE39606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e7ldiXqE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381F10EC38;
	Wed, 18 Nov 2026 16:21:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1B10EC34;
 Wed, 18 Nov 2026 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795018879; x=1826554879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sKepfgK9GiI0BQncKQ5URBoo8la4fKBTg1ZK5fe/OMM=;
 b=e7ldiXqEPbrSeVYRPSGRDVjTa3XkPf2cROvIVpedNv+JQJWlOxRSdkRS
 KcEFOUSXSwob027EOhNqSOnX+Qg/DdAFD1fBjQB30xQRwPZFty8Vloau9
 cqZI9QK8tGlXS3kkoZGbIUGl68Rxa8PAKveON3An8DckJOWCNcKGdVUX/
 voA4agNAmF+jlWXyFjSNOUOelITl0hPu/bR4WeJ2vUPdV+qSHGGxwMpGY
 aXhQ7vbbwzdVqnjfEWrWA6XcN8PM4o3vXwOFA9Hbc6VoLkUhGPeqWtN1C
 brMHI9WftJUbXxpRb/ehhqbXBNnMe/4CEYeXI+nPK+IB6py6WYrFGI5zu Q==;
X-CSE-ConnectionGUID: rhraO1GASzisWz38EpAi8g==
X-CSE-MsgGUID: NmgfrF/PTHu94Z5ckXb2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3936144"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3936144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:21:16 -0800
X-CSE-ConnectionGUID: rtMWtW7ZRj6kDazWjdS2eA==
X-CSE-MsgGUID: Hv7VifPPTLqz//GSYGVJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10447178"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 08:21:12 -0800
Date: Wed, 18 Nov 2026 18:21:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/de: prefer intel_reg_offset() over
 i915_mmio_reg_offset()
Message-ID: <av3QdAbcdznpwqyV@intel.com>
References: <20261118094508.3343569-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118094508.3343569-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Nov 18, 2026 at 11:45:08AM +0200, Jani Nikula wrote:
> intel_reg_offset() should be preferred over i915_mmio_reg_offset() in
> display code. Convert the couple of instances that have crept in.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Sorry about that chief. I have a vague recollection of changing
these, but evidently I either imagined it or lost it accidentally
in some rebase.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> index 9ca5b27eb768..08a0027e7930 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -219,7 +219,7 @@ static void check_unclaimed_mmio_pre(struct intel_display *display,
>  		drm_dbg_kms(display->drm,
>  			    "Unclaimed access detected before %s register 0x%x\n",
>  			    write ? "write to" : "read from",
> -			    i915_mmio_reg_offset(reg));
> +			    intel_reg_offset(reg));
>  }
>  
>  static void check_unclaimed_mmio_post(struct intel_display *display,
> @@ -234,7 +234,7 @@ static void check_unclaimed_mmio_post(struct intel_display *display,
>  		     display->mmio.funcs->check_for_unclaimed_mmio(display),
>  		     "Unclaimed %s register 0x%x\n",
>  		     write ? "write to" : "read from",
> -		     i915_mmio_reg_offset(reg)))
> +		     intel_reg_offset(reg)))
>  		/* Only report the first N failures */
>  		display->params.mmio_debug--;
>  }
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
