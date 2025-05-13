Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7D3C3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 11:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F9B10E36B;
	Tue, 13 May 2025 11:52:23 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4D410E36B;
 Tue, 13 May 2025 11:52:22 +0000 (UTC)
Received: from 91-155-254-65.elisa-laajakaista.fi ([91.155.254.65]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uEoBH-00000007MfL-2cMD; Tue, 13 May 2025 14:52:20 +0300
Message-ID: <25432c6de18fd4b397fa3e1793545a7d6ac1c766.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 14:52:18 +0300
In-Reply-To: <20250512103358.15724-7-ville.syrjala@linux.intel.com>
References: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
 <20250512103358.15724-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] drm/i915/dmc: Extract is_event_handler()
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

On Mon, 2025-05-12 at 13:33 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Extract the helper to determine if the mmio reg+data are the
> event handler register (DMC_EVT_CTL) for a specific event.
> We'll have another use for this for runtime event handler
> enable/disable.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 238f3cda400c..d758032d1af6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -564,6 +564,15 @@ static bool is_dmc_evt_htp_reg(struct intel_display =
*display,
>  	return offset >=3D start && offset < end;
>  }
> =20
> +static bool is_event_handler(struct intel_display *display,
> +			     enum intel_dmc_id dmc_id,
> +			     unsigned int event_id,
> +			     i915_reg_t reg, u32 data)
> +{
> +	return is_dmc_evt_ctl_reg(display, dmc_id, reg) &&
> +		REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) =3D=3D event_id;
> +}
> +

I'm not sure we're getting much with this change in terms of
readability.  Are you really going to be using this many more times
later?

The amount of arguments you pass to this function for these simple
checks seems to add almost as much clutter as the original, no?

If the goal is really readability, maybe a macro would be better.


>  /**
>   * intel_dmc_block_pkgc() - block PKG C-state
>   * @display: display instance
> @@ -622,12 +631,12 @@ static bool disable_dmc_evt(struct intel_display *d=
isplay,
> =20
>  	/* also disable the flip queue event on the main DMC on TGL */
>  	if (display->platform.tigerlake &&
> -	    REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) =3D=3D MAINDMC_EVENT=
_CLK_MSEC)
> +	    is_event_handler(display, dmc_id, MAINDMC_EVENT_CLK_MSEC, reg, data=
))
>  		return true;
> =20
>  	/* also disable the HRR event on the main DMC on TGL/ADLS */
>  	if ((display->platform.tigerlake || display->platform.alderlake_s) &&
> -	    REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) =3D=3D MAINDMC_EVENT=
_VBLANK_A)
> +	    is_event_handler(display, dmc_id, MAINDMC_EVENT_VBLANK_A, reg, data=
))
>  		return true;
> =20
>  	return false;

--
Cheers,
Luca.
