Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C759CC6B3A
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCEB10F0A5;
	Thu, 15 Oct 2026 13:49:45 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4910EBF4;
 Thu, 15 Oct 2026 13:49:45 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHLps-00000004PCI-1RjG; Thu, 15 Oct 2026 16:49:42 +0300
Message-ID: <a5bb2eb90deec5e5b1726ac357e836c8b9d6f834.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 16:49:45 +0300
In-Reply-To: <20261014120542.29675-3-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] drm/i915: Modernize PIPEFRAMEHIGH/PIPEFRAMEPIXEL bits
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
> Define the contents of PIPEFRAMEHIGH/PIPEFRAMEPIXEL using
> the modern REG_GENMASK() stuff.
>=20
> For the actual frame counter read we combine the registers
> into a single 64bit value and then extract the frame
> counter value from it, so we also need a combined 64bit
> PIPE_FRAME_MASK definition as well.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_regs.h | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_vblank.c       |  9 ++++++---
>  2 files changed, 12 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/=
gpu/drm/i915/display/intel_display_regs.h
> index c868a71a5c9b..2f509bd06557 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1090,15 +1090,15 @@
>   */
>  #define _PIPEAFRAMEHIGH          0x70040
>  #define PIPEFRAMEHIGH(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPEA=
FRAMEHIGH)
> -#define   PIPE_FRAME_HIGH_MASK    0x0000ffff
> -#define   PIPE_FRAME_HIGH_SHIFT   0
> +#define   PIPE_FRAME_HIGH_MASK	REG_GENMASK(15, 0)
> =20
>  #define _PIPEAFRAMEPIXEL         0x70044
>  #define PIPEFRAMEPIXEL(dev_priv, pipe)	_MMIO_PIPE2(dev_priv, pipe, _PIPE=
AFRAMEPIXEL)
> -#define   PIPE_FRAME_LOW_MASK     0xff000000
> -#define   PIPE_FRAME_LOW_SHIFT    24
> -#define   PIPE_PIXEL_MASK         0x00ffffff
> -#define   PIPE_PIXEL_SHIFT        0
> +#define   PIPE_FRAME_LOW_MASK	REG_GENMASK(31, 24)
> +#define   PIPE_PIXEL_MASK	REG_GENMASK(23, 0)
> +
> +/* frame counter mask for a combined 64bit value */
> +#define   PIPE_FRAME_MASK	((u64)PIPE_FRAME_HIGH_MASK << 32 | PIPE_FRAME_=
LOW_MASK)
> =20
>  /* GM45+ just has to be different */
>  #define _PIPEA_FRMCOUNT_G4X	0x70040
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index f16988cd5321..a01be2e34bc9 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -112,8 +112,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
>  	frame =3D intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display=
, pipe),
>  					      PIPEFRAMEHIGH(display, pipe));
> =20
> -	pixel =3D frame & PIPE_PIXEL_MASK;
> -	frame =3D (frame >> PIPE_FRAME_LOW_SHIFT) & 0xffffff;
> +	pixel =3D REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
> +	frame =3D REG_FIELD_GET64(PIPE_FRAME_MASK, frame);
> =20
>  	/*
>  	 * The frame counter increments at beginning of active.
> @@ -388,12 +388,15 @@ static bool i915_get_crtc_scanoutpos(struct drm_crt=
c *_crtc,
>  		 */
>  		position =3D __intel_get_crtc_scanline(crtc);
>  	} else {
> +		u32 val;
> +
>  		/*
>  		 * Have access to pixelcount since start of frame.
>  		 * We can split this into vertical and horizontal
>  		 * scanout position.
>  		 */
> -		position =3D (intel_de_read_fw(display, PIPEFRAMEPIXEL(display, pipe))=
 & PIPE_PIXEL_MASK) >> PIPE_PIXEL_SHIFT;
> +		val =3D intel_de_read_fw(display, PIPEFRAMEPIXEL(display, pipe));
> +		position =3D REG_FIELD_GET(PIPE_PIXEL_MASK, val);
> =20
>  		/* convert to pixel counts */
>  		vbl_start *=3D htotal;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
