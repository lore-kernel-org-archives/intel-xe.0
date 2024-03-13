Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B3C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 23:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981A810E343;
	Wed, 13 Mar 2024 23:30:31 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA62710E343
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 23:30:29 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rkY3F-00000002O4r-07Y3; Thu, 14 Mar 2024 01:30:26 +0200
Message-ID: <00a2f446a7c2e94327d746de8e958b825272991e.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Date: Thu, 14 Mar 2024 01:30:13 +0200
In-Reply-To: <170844757726.44184.11571357997726792092@gjsousa-mobl2>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-4-luciano.coelho@intel.com>
 <170844757726.44184.11571357997726792092@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] drm/i915/display: use wakelock in register waiting
 functions
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

On Tue, 2024-02-20 at 13:46 -0300, Gustavo Sousa wrote:
> Quoting Luca Coelho (2024-02-07 07:30:04-03:00)
> > Add the wakelock functonality to the functions that help wait for
> > register bits to be set.
>=20
> Same comment goes here and for the next patch regarding the splitting of
> the patches.

Yep, will squash.


> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_de.h | 42 ++++++++++++++++++++++---
> > 1 file changed, 37 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/=
i915/display/intel_de.h
> > index 0bf73b1e1cfe..d8941995808c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > @@ -121,7 +121,15 @@ static inline int
> > intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t=
 reg,
> >                               u32 mask, u32 value, unsigned int timeout=
)
> > {
> > -        return intel_wait_for_register_fw(&i915->uncore, reg, mask, va=
lue, timeout);
> > +        int ret;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        ret =3D intel_wait_for_register_fw(&i915->uncore, reg, mask, v=
alue, timeout);
> > +
> > +        intel_dmc_wl_put(i915, reg);
> > +
> > +        return ret;
> > }
> >=20
> > static inline int
> > @@ -130,22 +138,46 @@ __intel_de_wait_for_register(struct drm_i915_priv=
ate *i915, i915_reg_t reg,
> >                              unsigned int fast_timeout_us,
> >                              unsigned int slow_timeout_ms, u32 *out_val=
ue)
> > {
> > -        return __intel_wait_for_register(&i915->uncore, reg, mask, val=
ue,
> > -                                         fast_timeout_us, slow_timeout=
_ms, out_value);
> > +        int ret;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        ret =3D __intel_wait_for_register(&i915->uncore, reg, mask, va=
lue,
> > +                                        fast_timeout_us, slow_timeout_=
ms, out_value);
> > +
> > +        intel_dmc_wl_put(i915, reg);
> > +
> > +        return ret;
> > }
> >=20
> > static inline int
> > intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
> >                       u32 mask, unsigned int timeout)
> > {
> > -        return intel_de_wait_for_register(i915, reg, mask, mask, timeo=
ut);
> > +        int ret;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        ret =3D intel_de_wait_for_register(i915, reg, mask, mask, time=
out);
>=20
> The wakelock is already grabbed by intel_de_wait_for_register(), we
> could skip it here.
>=20
> > +
> > +        intel_dmc_wl_put(i915, reg);
> > +
> > +        return ret;
> > }
> >=20
> > static inline int
> > intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
> >                         u32 mask, unsigned int timeout)
> > {
> > -        return intel_de_wait_for_register(i915, reg, mask, 0, timeout)=
;
> > +        int ret;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        ret =3D intel_de_wait_for_register(i915, reg, mask, 0, timeout=
);
>=20
> The wakelock is already grabbed by intel_de_wait_for_register(), we
> could skip it here.

Thanks for noticing.  I'll fix this in both places.

--
Cheers,
Luca.
