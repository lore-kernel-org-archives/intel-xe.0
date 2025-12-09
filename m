Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A70AD1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 12:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696D10E53E;
	Tue,  9 Dec 2025 12:51:40 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DFC10E17C;
 Tue,  9 Dec 2025 12:51:39 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vSxBn-00000000gqi-21ru; Tue, 09 Dec 2025 14:51:36 +0200
Message-ID: <b967463275a13f0d13eca704851856bab6b563a5.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 14:51:34 +0200
In-Reply-To: <20251127175023.1522538-6-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-6-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
Subject: Re: [PATCH 05/50] drm/i915/dp: Use a mode's crtc_clock vs. clock
 during state computation
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

On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> The encoder state computation should use the
> drm_display_mode::crtc_clock member, instead of the clock member, the
> former one possibly having a necessary adjustment wrt. to the latter
> due to driver specific constraints. In practice the two values should
> not differ at spots changed in this patch, since only MSO and 3D modes
> would make them different, neither MSO or 3D relevant here, but still
> use the expected crtc_clock version for consistency.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index beda340d05923..d70cb35cf68bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2050,7 +2050,8 @@ static int dsc_compute_link_config(struct intel_dp =
*intel_dp,
>  					continue;
>  			} else {
>  				if (!is_bw_sufficient_for_dsc_config(dsc_bpp_x16, link_rate,
> -								     lane_count, adjusted_mode->clock,
> +								     lane_count,
> +								     adjusted_mode->crtc_clock,
>  								     pipe_config->output_format,
>  								     timeslots))
>  					continue;
> @@ -2211,7 +2212,7 @@ static int dsc_compute_compressed_bpp(struct intel_=
dp *intel_dp,
>  	int bpp_x16;
>  	int ret;
> =20
> -	dsc_joiner_max_bpp =3D get_max_compressed_bpp_with_joiner(display, adju=
sted_mode->clock,
> +	dsc_joiner_max_bpp =3D get_max_compressed_bpp_with_joiner(display, adju=
sted_mode->crtc_clock,
>  								adjusted_mode->hdisplay,
>  								num_joined_pipes);
>  	max_bpp_x16 =3D min(fxp_q4_from_int(dsc_joiner_max_bpp), limits->link.m=
ax_bpp_x16);

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
