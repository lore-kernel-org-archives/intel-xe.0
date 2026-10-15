Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D42CC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646B11122C4;
	Thu, 15 Oct 2026 10:37:19 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D1410E5A5;
 Thu, 15 Oct 2026 10:37:18 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHIpZ-00000004Os3-1be6; Thu, 15 Oct 2026 13:37:14 +0300
Message-ID: <a8f42bbd323a95b7a6857ab036cd4d66136e4330.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 13:37:14 +0300
In-Reply-To: <20261014120542.29675-2-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] drm/i915: s/PIPEFRAME/PIPEFRAMEHIGH/
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

On Wed, 2026-10-14 at 15:05 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Rename PIPEFRAME to PIPEFRAMEHIGH to match the spec, and
> better convey what the register contains.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 2 +-
>  drivers/gpu/drm/i915/display/intel_vblank.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index 8251ec15190b..c868a71a5c9b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1089,7 +1089,7 @@
>   *  frame =3D (high1 << 8) | low1;
>   */
>  #define _PIPEAFRAMEHIGH          0x70040
> -#define PIPEFRAME(dev_priv, pipe)		_MMIO_PIPE2(dev_priv, pipe, _PIPEAFRA=
MEHIGH)
> +#define PIPEFRAMEHIGH(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPEA=
FRAMEHIGH)
>  #define   PIPE_FRAME_HIGH_MASK    0x0000ffff
>  #define   PIPE_FRAME_HIGH_SHIFT   0
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 28d81199792e..f16988cd5321 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -110,7 +110,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
>  	 * register.
>  	 */
>  	frame =3D intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display=
, pipe),
> -					      PIPEFRAME(display, pipe));
> +					      PIPEFRAMEHIGH(display, pipe));
> =20
>  	pixel =3D frame & PIPE_PIXEL_MASK;
>  	frame =3D (frame >> PIPE_FRAME_LOW_SHIFT) & 0xffffff;


Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
