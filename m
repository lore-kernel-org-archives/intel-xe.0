Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578A8CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0D110E5AA;
	Thu, 15 Oct 2026 13:56:37 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE671122BE;
 Thu, 15 Oct 2026 13:56:35 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHLwf-00000004PF2-19A3; Thu, 15 Oct 2026 16:56:33 +0300
Message-ID: <a2c1aaf71fbb09e1a406de7ee67039e416bea703.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 16:56:46 +0300
In-Reply-To: <20261014120542.29675-7-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] drm/xe: Remove unused uncore wrappers
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
> intel_uncore_read64_2x32(), intel_uncore_posting_read(),
> and intel_uncore_rmw() are no longer used by the display code.
> Nuke the wrappers.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../drm/xe/compat-i915-headers/intel_uncore.h | 35 -------------------
>  1 file changed, 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/driv=
ers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> index b8ea8f5b22d1..2f198e2e2fec 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> @@ -55,33 +55,6 @@ static inline u16 intel_uncore_read16(struct intel_unc=
ore *uncore,
>  	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
>  }
> =20
> -static inline u64
> -intel_uncore_read64_2x32(struct intel_uncore *uncore,
> -			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
> -{
> -	struct xe_reg lower_reg =3D XE_REG(i915_mmio_reg_offset(i915_lower_reg)=
);
> -	struct xe_reg upper_reg =3D XE_REG(i915_mmio_reg_offset(i915_upper_reg)=
);
> -	u32 upper, lower, old_upper;
> -	int loop =3D 0;
> -
> -	upper =3D xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
> -	do {
> -		old_upper =3D upper;
> -		lower =3D xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
> -		upper =3D xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
> -	} while (upper !=3D old_upper && loop++ < 2);
> -
> -	return (u64)upper << 32 | lower;
> -}
> -
> -static inline void intel_uncore_posting_read(struct intel_uncore *uncore=
,
> -					     i915_reg_t i915_reg)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
> -}
> -
>  static inline void intel_uncore_write(struct intel_uncore *uncore,
>  				      i915_reg_t i915_reg, u32 val)
>  {
> @@ -90,14 +63,6 @@ static inline void intel_uncore_write(struct intel_unc=
ore *uncore,
>  	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
>  }
> =20
> -static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
> -				   i915_reg_t i915_reg, u32 clear, u32 set)
> -{
> -	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> -
> -	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
> -}
> -
>  static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
>  				       i915_reg_t i915_reg)
>  {


Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
