Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5290606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6xdsYiD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954F010F627;
	Tue, 27 Oct 2026 15:03:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1BE10F627;
 Tue, 27 Oct 2026 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793113387; x=1824649387;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rwnnC+mpRJvnpcgCWQjHZ9U2vCiFm+jjrP8z1HbfOmQ=;
 b=O6xdsYiDI+4zuXULtdwIQ3hybXmoBMLT9ylEJ+9JwLHodq+yGlDOu9Tm
 EdNwbFlEHgXWLsnTqzOpyN1AfIlP/VC+JYieRaAKtkpqG4Q0YeKtlyN3S
 1HKy6GIzafquj1NQjO6nYHQ9tGbkzawBk7ml476VUSMhDcxwtdnvKBn2i
 wZwruZCSZK6D6XDj3IFeGNTNObuYmyRhum2vLHiOp2YP6x9YYlKk9Ht7H
 BsG6vfvyIQoRTk5Gs74+XsHHNIUnScN9A8FIAPo4JTONqEP3pcHbwGXxg
 fTisvoTPhbp874kEmw/fZtz/L8HuNaZW4If+VlDfQkiFyGZuP4wu1iWZU g==;
X-CSE-ConnectionGUID: RnjYMAioQPCYIcJ8nLOvZQ==
X-CSE-MsgGUID: 7TgCGjgDT5SMk43CwMITzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1701916"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1701916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:03:07 -0700
X-CSE-ConnectionGUID: VCziJyF4SnObpbbii2JOBw==
X-CSE-MsgGUID: REMCwwU6Qre4UE/0xXDm8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4946190"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:03:04 -0700
Date: Tue, 27 Oct 2026 17:03:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?iso-8859-1?Q?Polo-Fran=E7ois?= Poli <polo.code.dev@gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
Message-ID: <auC9JGcyDdZ76yzH@intel.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
 <20260804-cdclk-v1-1-484864b1aafd@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-cdclk-v1-1-484864b1aafd@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Aug 04, 2026 at 02:58:30PM +0530, Arun R Murthy wrote:
> skl_cdclk_init_hw() has a recovery path that runs when skl_sanitize_cdclk()
> has decided the pre-OS CDCLK state is not usable and zeroes
> display->cdclk.hw.
> 
> Seed with the SKU-permitted maximum instead (as read from SKL_DFSM), so
> the recovery path lands on a cdclk that satisfies every pipe on the SKU.
> The very first atomic commit that follows will dial cdclk down to what
> active pipes actually need via the normal skl_modeset_calc_cdclk() path.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Tested-by: Polo-François Poli <polo.code.dev@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 65 +++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index a53d887271778193fd400b9199ad841d5d9730fe..19f3ef8adfcded378428924539db9336834278ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1288,6 +1288,31 @@ static void skl_sanitize_cdclk(struct intel_display *display)
>  	display->cdclk.hw.vco = ~0;
>  }
>  
> +/*
> + * Seed cdclk from the SKU-permitted maximum. Used by skl_cdclk_init_hw()'s
> + * recovery path when skl_sanitize_cdclk() has decided the pre-OS CDCLK state
> + * is not usable and has zeroed display->cdclk.hw.
> + * Seed with the SKU top instead: it is guaranteed to satisfy every pipe on
> + * the platform, and the very first atomic commit will dial cdclk down via
> + * skl_modeset_calc_cdclk() once per-pipe min_cdclk is known.
> + */
> +static int skl_cdclk_init_hw_seed(struct intel_display *display, int vco)
> +{
> +	u32 limit = intel_de_read(display, SKL_DFSM) & SKL_DFSM_CDCLK_LIMIT_MASK;
> +	int max_cdclk;
> +
> +	if (limit == SKL_DFSM_CDCLK_LIMIT_675)
> +		max_cdclk = 617143;
> +	else if (limit == SKL_DFSM_CDCLK_LIMIT_540)
> +		max_cdclk = 540000;
> +	else if (limit == SKL_DFSM_CDCLK_LIMIT_450)
> +		max_cdclk = 432000;
> +	else
> +		max_cdclk = 308571;
> +
> +	return skl_calc_cdclk(max_cdclk, vco);

That's just the max cdclk. We already have it.

> +}
> +
>  static void skl_cdclk_init_hw(struct intel_display *display)
>  {
>  	struct intel_cdclk_config cdclk_config;
> @@ -1311,9 +1336,14 @@ static void skl_cdclk_init_hw(struct intel_display *display)
>  	cdclk_config.vco = display->cdclk.skl_preferred_vco_freq;
>  	if (cdclk_config.vco == 0)
>  		cdclk_config.vco = 8100000;
> -	cdclk_config.cdclk = skl_calc_cdclk(0, cdclk_config.vco);
> +
> +	cdclk_config.cdclk = skl_cdclk_init_hw_seed(display, cdclk_config.vco);

We sanitize to min cdclk on all platforms. Don't add weird differences
between platforms.

>  	cdclk_config.voltage_level = skl_calc_voltage_level(cdclk_config.cdclk);
>  
> +	drm_dbg_kms(display->drm,
> +		    "cdclk: init seed cdclk=%d vco=%d volt=%d (SKU-max, no per-pipe min_cdclk yet)\n",
> +		    cdclk_config.cdclk, cdclk_config.vco, cdclk_config.voltage_level);

What?

> +
>  	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);
>  }
>  
> @@ -4231,6 +4261,39 @@ void intel_cdclk_read_hw(struct intel_display *display)
>  	cdclk_state->logical = display->cdclk.hw;
>  }
>  
> +/**
> + * intel_cdclk_sync_hw_state - Adopt the HW-asserted cdclk into SW state.
> + * @display: display instance
> + * @hw_config: the cdclk configuration as currently read back from HW
> + *
> + * This helper reconciles the SW state to match what HW is currently asserting.
> + * It updates display->cdclk.hw and the committed cdclk_state's actual/logical
> + * so that any following atomic commit sees a truthful baseline and will
> + * naturally attach a cdclk_state (via intel_cdclk_atomic_check()) to raise
> + * cdclk when the workload demands it.
> + */
> +void intel_cdclk_sync_hw_state(struct intel_display *display,
> +			       const struct intel_cdclk_config *hw_config)
> +{
> +	struct intel_cdclk_state *cdclk_state =
> +		to_intel_cdclk_state(display->cdclk.obj.state);
> +
> +	if (!intel_cdclk_clock_changed(&display->cdclk.hw, hw_config))
> +		return;
> +
> +	drm_dbg_kms(display->drm,
> +		    "cdclk: syncing SW state to HW after drift (sw %d/vco %d/ref %d -> hw %d/vco %d/ref %d)\n",
> +		    display->cdclk.hw.cdclk, display->cdclk.hw.vco, display->cdclk.hw.ref,
> +		    hw_config->cdclk, hw_config->vco, hw_config->ref);
> +
> +	display->cdclk.hw.cdclk = hw_config->cdclk;
> +	display->cdclk.hw.vco = hw_config->vco;
> +	display->cdclk.hw.ref = hw_config->ref;
> +
> +	cdclk_state->actual = display->cdclk.hw;
> +	cdclk_state->logical = display->cdclk.hw;

I have no idea what's happening here or why? We already copy the hw
state into the initial sw state somewhere.

> +}
> +
>  static int calc_cdclk(const struct intel_crtc_state *crtc_state, int min_cdclk)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
