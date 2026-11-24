Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BB9606A326
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VCVjLQ+D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6171510E864;
	Tue, 24 Nov 2026 13:07:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2437410E864;
 Tue, 24 Nov 2026 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795525624; x=1827061624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Te4AmTY9SNn131H6ENr5PVBO/axCNZkwfoJKkzYGjTs=;
 b=VCVjLQ+DHJEdP67oMTODJLn3/3/vesfNkVsGzTwBRKdtFR2qAoIJgcQ+
 7cEYipajidf9f8HGPgnA0QmnA3jknxDUonG2NB+8UOAfOM70sYFA2jIpd
 kbhtQhTypEP1Lo4VQ54yF8u9evmhvyAKQawT6N+gCwYW+UNTekMHa9T+I
 1FAOGGeV5gPbYW4wi/97HDP/JY503Hu4rOvAVN9sfUM1/TLLV+DC32eKT
 oqVd9sxJuV0sp6+oQpI39Mj2F8v5zigIKidUGK+mJLSyObHIjuEAQS12Z
 v6AdeeuJrLxh68tW/X19ou1O/AMJPFg6D6J6NoVute1mFQ6GJG57W9e/2 g==;
X-CSE-ConnectionGUID: nx9IkiwESVm9vc8rKGoB3Q==
X-CSE-MsgGUID: G8fUSWwsTnOVeAGlaME56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4413903"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4413903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:04 -0800
X-CSE-ConnectionGUID: 4YtgsVJdS8qiO91lLP01TA==
X-CSE-MsgGUID: iMP6K+SgSly5DqkK2je4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="12002056"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:01 -0800
Date: Tue, 24 Nov 2026 15:06:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imre.deak@intel.com, mika.kahola@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/pps: Don't steal VDD from another eDP port
 sharing the PPS
Message-ID: <awWL8jQGrCxadBMt@intel.com>
References: <20261123050422.3130438-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123050422.3130438-1-suraj.kandpal@intel.com>
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

On Mon, Nov 23, 2026 at 10:34:23AM +0530, Suraj Kandpal wrote:
> Some VBTs declare an unpopulated eDP port next to the real panel and
> assign both the same PPS. The ghost port adopts the VDD bit the real
> port turned on, and when its DPCD read fails it clears EDP_FORCE_VDD
> underneath the real port. The real port's VDD reference is then never
> released, leaking an AUX power domain reference and a runtime PM
> wakelock:
> 
>   drm_WARN_ON(intel_dp->pps.vdd_wakeref)
>   i915 raw-wakerefs=1 wakelocks=1 on cleanup
> 
> Don't adopt or turn off VDD owned by another eDP port on the same PPS.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17232
> Cc: stable@vger.kernel.org # v6.15+
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pps.c | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index 442b00491a88..653b8bf7ec6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -570,6 +570,30 @@ static bool edp_have_panel_vdd(struct intel_dp *intel_dp)
>  	return intel_de_read(display, _pp_ctrl_reg(intel_dp)) & EDP_FORCE_VDD;
>  }
>  
> +static bool pps_vdd_owned_by_other_port(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct intel_encoder *encoder;
> +
> +	lockdep_assert_held(&display->pps.mutex);
> +
> +	if (display->platform.valleyview || display->platform.cherryview)
> +		return false;
> +
> +	for_each_intel_dp(display->drm, encoder) {
> +		struct intel_dp *dp = enc_to_intel_dp(encoder);
> +
> +		if (dp == intel_dp || encoder->type != INTEL_OUTPUT_EDP)
> +			continue;
> +
> +		if (dp->pps.pps_idx == intel_dp->pps.pps_idx &&
> +		    dp->pps.vdd_wakeref)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void intel_pps_check_power_unlocked(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
> @@ -839,6 +863,9 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
>  	if (!edp_have_panel_vdd(intel_dp))
>  		return;
>  
> +	if (!intel_dp->pps.vdd_wakeref && pps_vdd_owned_by_other_port(intel_dp))
> +		return;
> +
>  	drm_dbg_kms(display->drm, "[ENCODER:%d:%s] %s turning VDD off\n",
>  		    dig_port->base.base.base.id, dig_port->base.base.name,
>  		    pps_name(intel_dp));
> @@ -1334,6 +1361,14 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
>  	if (!edp_have_panel_vdd(intel_dp))
>  		return;
>  
> +	if (pps_vdd_owned_by_other_port(intel_dp)) {
> +		drm_dbg_kms(display->drm,
> +			    "[ENCODER:%d:%s] %s VDD owned by another eDP port, not adopting it\n",
> +			    dig_port->base.base.base.id, dig_port->base.base.name,
> +			    pps_name(intel_dp));
> +		return;
> +	}

If someone else already owns the PPS then we should stop the probe
of the current port right here. So I think this belongs in
pps_initial_setup(). And it should not look at the wakeref,
pps_idx alone should be sufficient to figure out who owns what.
That will also avoid racing with the delayed VDD off from a
previously probed port.

I think the proper solution for this PPS init mess should be
something along the lines of:
- extract the PPS tracking out from intel_dp into its' own per PPS
  object, and have each intel_dp just point to the right one.
  VLV/CHV with their screwed up PPS hardware would probably be the
  hardest thing to handle here.
- never turn VDD off during until connector probing is fully done
- if multiple encoders are trying to use the same PPS let the first
  one to successfully probe own it, don't even probe the remaining ones
- after all connectors are probed turn off all PPSs that aren't in
  use, and schedule the delayed off for the ones that are in use

but that's a lot of work, so we do probably want a less refined
stopgap first.

> +
>  	/*
>  	 * The VDD bit needs a power domain reference, so if the bit is
>  	 * already enabled when we boot or resume, grab this reference and
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
