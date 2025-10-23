Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A56CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 12:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643EF10E3F1;
	Thu, 23 Oct 2025 12:11:53 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6210E3F1;
 Thu, 23 Oct 2025 12:11:52 +0000 (UTC)
Received: from mobile-access-d98cd6-211.dhcp.inet.fi ([217.140.214.211]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vBuAU-00000001lW7-1gh3; Thu, 23 Oct 2025 15:11:48 +0300
Message-ID: <7628ac21165ad1ff73f4e829132cf8136ccf25df.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 23 Oct 2025 15:11:45 +0300
In-Reply-To: <20251017161417.4399-2-ville.syrjala@linux.intel.com>
References: <20251017161417.4399-1-ville.syrjala@linux.intel.com>
 <20251017161417.4399-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] drm/i915/scaler: Don't clobber plane scaler scale
 factors with pfit scale factors
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

On Fri, 2025-10-17 at 19:14 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> When intel_atomic_setup_scaler() is called for a plane scaler
> it first computes the scale factors correctly, and then (if
> pfit is enabled on the pipe) it overwrites them with the pfit
> scale factors.
>=20
> Skip the pfit scaler stuff when intel_atomic_setup_scaler()
> is called for a plane scaler (plane_state !=3D NULL).
>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Fixes: 9217f9aaef62 ("drm/i915/scaler: Compute scaling factors for pipe s=
caler")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/skl_scaler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index d29efcbf2319..640c65818f8a 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -464,7 +464,7 @@ static int intel_atomic_setup_scaler(struct intel_crt=
c_state *crtc_state,
>  		}
>  	}
> =20
> -	if (crtc_state->pch_pfit.enabled) {
> +	if (!plane_state && crtc_state->pch_pfit.enabled) {
>  		struct drm_rect src;
>  		int max_hscale, max_vscale;
> =20
