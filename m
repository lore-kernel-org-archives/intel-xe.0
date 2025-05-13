Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D0C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 11:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F9D10E0B1;
	Tue, 13 May 2025 11:41:31 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89F210E0B1;
 Tue, 13 May 2025 11:41:30 +0000 (UTC)
Received: from 91-155-254-65.elisa-laajakaista.fi ([91.155.254.65]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uEo0m-00000007MeK-02j2; Tue, 13 May 2025 14:41:28 +0300
Message-ID: <53a74d89ea75dbc6d4c689aee5ef7c0ec08e2310.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 14:41:26 +0300
In-Reply-To: <20250512103358.15724-6-ville.syrjala@linux.intel.com>
References: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
 <20250512103358.15724-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] drm/o915/dmc: Relocate is_dmc_evt_{ctl,htp}_reg()
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
> Move is_dmc_evt_ctl_reg() to a slightly earlier position in the file
> so that we can reuse it in the pkgc workaround code. Also move
> is_dmc_evt_htp_reg() just to keep the two together.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index ec940f837427..238f3cda400c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -544,6 +544,26 @@ static u32 dmc_evt_ctl_disable(void)
>  			       DMC_EVENT_FALSE);
>  }
> =20
> +static bool is_dmc_evt_ctl_reg(struct intel_display *display,
> +			       enum intel_dmc_id dmc_id, i915_reg_t reg)
> +{
> +	u32 offset =3D i915_mmio_reg_offset(reg);
> +	u32 start =3D i915_mmio_reg_offset(DMC_EVT_CTL(display, dmc_id, 0));
> +	u32 end =3D i915_mmio_reg_offset(DMC_EVT_CTL(display, dmc_id, DMC_EVENT=
_HANDLER_COUNT_GEN12));
> +
> +	return offset >=3D start && offset < end;
> +}
> +
> +static bool is_dmc_evt_htp_reg(struct intel_display *display,
> +			       enum intel_dmc_id dmc_id, i915_reg_t reg)
> +{
> +	u32 offset =3D i915_mmio_reg_offset(reg);
> +	u32 start =3D i915_mmio_reg_offset(DMC_EVT_HTP(display, dmc_id, 0));
> +	u32 end =3D i915_mmio_reg_offset(DMC_EVT_HTP(display, dmc_id, DMC_EVENT=
_HANDLER_COUNT_GEN12));
> +
> +	return offset >=3D start && offset < end;
> +}
> +
>  /**
>   * intel_dmc_block_pkgc() - block PKG C-state
>   * @display: display instance
> @@ -589,26 +609,6 @@ void intel_dmc_start_pkgc_exit_at_start_of_undelayed=
_vblank(struct intel_display
>  		       val);
>  }
> =20
> -static bool is_dmc_evt_ctl_reg(struct intel_display *display,
> -			       enum intel_dmc_id dmc_id, i915_reg_t reg)
> -{
> -	u32 offset =3D i915_mmio_reg_offset(reg);
> -	u32 start =3D i915_mmio_reg_offset(DMC_EVT_CTL(display, dmc_id, 0));
> -	u32 end =3D i915_mmio_reg_offset(DMC_EVT_CTL(display, dmc_id, DMC_EVENT=
_HANDLER_COUNT_GEN12));
> -
> -	return offset >=3D start && offset < end;
> -}
> -
> -static bool is_dmc_evt_htp_reg(struct intel_display *display,
> -			       enum intel_dmc_id dmc_id, i915_reg_t reg)
> -{
> -	u32 offset =3D i915_mmio_reg_offset(reg);
> -	u32 start =3D i915_mmio_reg_offset(DMC_EVT_HTP(display, dmc_id, 0));
> -	u32 end =3D i915_mmio_reg_offset(DMC_EVT_HTP(display, dmc_id, DMC_EVENT=
_HANDLER_COUNT_GEN12));
> -
> -	return offset >=3D start && offset < end;
> -}
> -
>  static bool disable_dmc_evt(struct intel_display *display,
>  			    enum intel_dmc_id dmc_id,
>  			    i915_reg_t reg, u32 data)

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers.
Luca.
