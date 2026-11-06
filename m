Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29CA606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fhbR9rLV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F182112DB8;
	Fri,  6 Nov 2026 15:25:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6C5112BF5;
 Fri,  6 Nov 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793978709; x=1825514709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d1/Y5G9+5zVvePFZ8Hs1aZF6AphgwiBGZuVZUCXXyBA=;
 b=fhbR9rLVK35aagVCNpWMg8+2+uysigjthYWXvOEaa3L1J7iUPRo5ym0D
 IxEvyljNexnUdKo3fdzt/zIlkce/lV1/568bvEjlGmR1Tarm3Vz1XuE8N
 GK6BpsHHVfsbyx400VxlWXQH8hEzVK2DPWw2rv0xWMaFPzQtCjURrBYR3
 ag++bwNKXSNhGdylMlAcgIg6MH3doFEJps82cdKaol6nnF1YQNAcXW/JQ
 cmZodIOA5fFUm4m/hFZhotSnO+xPcIDRROuOl42DIfVXi8KFxGOegeGZC
 82jY1BwgvxwAUcbtPsHhNerW/1sXdjE5XYWeExEGBE5DntLjD+pBKrFRy Q==;
X-CSE-ConnectionGUID: +wKyK+6hTJKseWfCvbryzA==
X-CSE-MsgGUID: 5rK50uKjTrmjV0oknETEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2671554"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2671554"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:25:08 -0800
X-CSE-ConnectionGUID: lWzr2PeeQsqM2vo46KyDTQ==
X-CSE-MsgGUID: e0eLURlNTeqXdltqpmPYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7137679"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:25:07 -0800
Date: Fri, 6 Nov 2026 17:25:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Limit the eDP joiner to the pipe A and
 B pair
Message-ID: <au3xT5fiaiEdpIN-@intel.com>
References: <20261106094113.2917630-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261106094113.2917630-1-mika.kahola@intel.com>
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

On Fri, Nov 06, 2026 at 09:41:13AM +0000, Mika Kahola wrote:
> eDP only works joined as the pipe A and B pair, other consecutive pairs
> fail to come up.

There is no such restriction. Just tried it on a PTL here and it works
just fine.

> Keep the eDP joiner primary on pipe A. DP and unjoined
> eDP are unaffected.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ef164a797618..b359a66a018f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1362,16 +1362,27 @@ static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
>  	return pixel_clock / intel_dp->mso_link_count;
>  }
>  
> +/* eDP can only be joined as the pipe A and B pair. */
> +static u8 intel_dp_joiner_valid_primary_pipe_mask(struct intel_dp *intel_dp,
> +						  int num_joined_pipes)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	u8 pipe_mask = intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
> +
> +	if (num_joined_pipes > 1 && intel_dp_is_edp(intel_dp))
> +		pipe_mask &= BIT(PIPE_A);
> +
> +	return pipe_mask;
> +}
> +
>  static
>  bool intel_dp_can_join(struct intel_dp *intel_dp,
>  		       int num_joined_pipes)
>  {
> -	struct intel_display *display = to_intel_display(intel_dp);
> -
>  	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
>  		return false;
>  
> -	return intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
> +	return intel_dp_joiner_valid_primary_pipe_mask(intel_dp, num_joined_pipes);
>  }
>  
>  bool intel_dp_dotclk_valid(struct intel_display *display,
> @@ -3083,7 +3094,6 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>  			     struct drm_connector_state *conn_state,
>  			     bool respect_downstream_limits)
>  {
> -	struct intel_display *display = to_intel_display(encoder);
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	struct intel_connector *connector =
>  		to_intel_connector(conn_state->connector);
> @@ -3099,7 +3109,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>  
>  	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
>  		/* If the pipe can't be a joiner primary, skip early. */
> -		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
> +		if (!(intel_dp_joiner_valid_primary_pipe_mask(intel_dp, num_joined_pipes) &
> +		      BIT(crtc->pipe)))
>  			continue;
>  
>  		/*
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
