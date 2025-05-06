Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0CAC3ABC0
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 10:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D1A10E64E;
	Tue,  6 May 2025 10:11:15 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79710E64A;
 Tue,  6 May 2025 10:11:14 +0000 (UTC)
Received: from 91-155-254-19.elisa-laajakaista.fi ([91.155.254.19]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uCFGa-000000076XM-3cyQ; Tue, 06 May 2025 13:11:13 +0300
Message-ID: <402156dc09c89facfa0b395777a0f041e12c2c35.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 13:11:11 +0300
In-Reply-To: <20250428133135.3396080-7-imre.deak@intel.com>
References: <20250428133135.3396080-1-imre.deak@intel.com>
 <20250428133135.3396080-7-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 06/12] drm/i915/dp_mst: Simplify computing the
 min/max compressed bpp limits
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

On Mon, 2025-04-28 at 16:31 +0300, Imre Deak wrote:
> Adjusting the compressed bpp range min/max limits in
> intel_dp_dsc_nearest_valid_bpp() is unnecessary:
>=20
> - The source/sink min/max values are enforced already by the
>   link_config_limits::min_bpp_x16/max_bpp_x16 values computed early in
>   intel_dp_compute_config_link_bpp_limits().
> - The fixed set of valid bpps are enforced already - for all bpps in the
>   min .. max range by intel_dp_dsc_valid_compressed_bpp() called from
>   intel_dp_mtp_tu_compute_config().
>=20
> The only thing needed is limiting max compressed bpp below the
> uncompressed pipe bpp, do that one thing only instead of calling
> intel_dp_dsc_nearest_valid_bpp().
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp.h     | 2 --
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 +-----
>  3 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 5c206faadf93a..42b45598a0134 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -846,7 +846,7 @@ small_joiner_ram_size_bits(struct intel_display *disp=
lay)
>  		return 6144 * 8;
>  }
> =20
> -u32 intel_dp_dsc_nearest_valid_bpp(struct intel_display *display, u32 bp=
p, u32 pipe_bpp)
> +static u32 intel_dp_dsc_nearest_valid_bpp(struct intel_display *display,=
 u32 bpp, u32 pipe_bpp)
>  {
>  	u32 bits_per_pixel =3D bpp;
>  	int i;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index a9dd9ed1afc9d..3206c86adaba6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -174,8 +174,6 @@ bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
>  			   const struct intel_connector *connector,
>  			   const struct intel_crtc_state *crtc_state);
> =20
> -u32 intel_dp_dsc_nearest_valid_bpp(struct intel_display *display, u32 bp=
p, u32 pipe_bpp);
> -
>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
>  			   struct intel_encoder *encoder,
>  			   const struct intel_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 77acac8963e27..23bb9aa554fc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -513,11 +513,7 @@ static int mst_stream_dsc_compute_link_config(struct=
 intel_dp *intel_dp,
>  	drm_dbg_kms(display->drm, "DSC Sink supported compressed min bpp %d com=
pressed max bpp %d\n",
>  		    min_compressed_bpp, max_compressed_bpp);
> =20
> -	/* Align compressed bpps according to our own constraints */
> -	max_compressed_bpp =3D intel_dp_dsc_nearest_valid_bpp(display, max_comp=
ressed_bpp,
> -							    crtc_state->pipe_bpp);
> -	min_compressed_bpp =3D intel_dp_dsc_nearest_valid_bpp(display, min_comp=
ressed_bpp,
> -							    crtc_state->pipe_bpp);
> +	max_compressed_bpp =3D min(max_compressed_bpp, crtc_state->pipe_bpp - 1=
);
> =20
>  	crtc_state->lane_count =3D limits->max_lane_count;
>  	crtc_state->port_clock =3D limits->max_rate;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
