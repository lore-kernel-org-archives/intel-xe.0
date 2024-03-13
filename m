Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C99CC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 23:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32A610F52E;
	Wed, 13 Mar 2024 23:26:18 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074510F52E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 23:26:17 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rkXzA-00000002O4S-1sB9; Thu, 14 Mar 2024 01:26:14 +0200
Message-ID: <d99c643f608353c8113cebd8686f2a4103d21518.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Date: Thu, 14 Mar 2024 01:26:00 +0200
In-Reply-To: <170844753905.44184.14573630659444462264@gjsousa-mobl2>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-3-luciano.coelho@intel.com>
 <170844753905.44184.14573630659444462264@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] drm/i915/display: use wakelock in the remaining
 read operations
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

On Tue, 2024-02-20 at 13:45 -0300, Gustavo Sousa wrote:
> Quoting Luca Coelho (2024-02-07 07:30:03-03:00)
> > In the patch where the framework is implemented, we only add the
> > wakelock usage in the read-modify-write operations.  This patch brings
> > in the wakelock implementation to the remaining read operations.  The
> > idea is to keep these in separate blocks to ease bisections in case
> > there are any issues.
>=20
> Hm, while I understand the motivation, I can't help but think that we
> are making the first patch somewhat incomplete. For example, if we were
> to pick up the first patch and then have a new one on top enabling the
> DMC Wakelock, we would have code paths in the display code that would
> not grab the wakelock.
>=20
> Furthermore, not sure if we would have bisection really working here
> (without further instrumentation), because the wakelock feature is only
> enabled later on the series.

Yeah, you're totally right.  It seemed to make more sense when I
started the implementation, before moving a lot of stuff around, but
now it should just be squashed.


> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_de.h | 38 +++++++++++++++++++++++--
> > 1 file changed, 35 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/=
i915/display/intel_de.h
> > index ef24748d522d..0bf73b1e1cfe 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > @@ -13,26 +13,58 @@
> > static inline u32
> > intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
> > {
> > -        return intel_uncore_read(&i915->uncore, reg);
> > +        u32 val;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        val =3D intel_uncore_read(&i915->uncore, reg);
> > +
> > +        intel_dmc_wl_put(i915, reg);
> > +
> > +        return val;
> > }
> >=20
> > static inline u8
> > intel_de_read8(struct drm_i915_private *i915, i915_reg_t reg)
> > {
> > -        return intel_uncore_read8(&i915->uncore, reg);
> > +        u8 val;
> > +
> > +        intel_dmc_wl_get(i915, reg);
> > +
> > +        val =3D intel_uncore_read8(&i915->uncore, reg);
> > +
> > +        intel_dmc_wl_put(i915, reg);
> > +
> > +        return val;
> > }
> >=20
> > static inline u64
> > intel_de_read64_2x32(struct drm_i915_private *i915,
> >                      i915_reg_t lower_reg, i915_reg_t upper_reg)
> > {
> > -        return intel_uncore_read64_2x32(&i915->uncore, lower_reg, uppe=
r_reg);
> > +        u64 val;
> > +
> > +        /* Both lower and upper registers will almost certainly be in
> > +         * the same range (and very likely one immediately after the
> > +         * other), so we can check only the lower one.
> > +         */
>=20
> The words "almost certainly" and "very likely" concern me :-)

Okay, my choice of words was too soft, apparently.  In more direct
words, I don't see any reason for two 32-bit reads to be combined into
one 64-bit read, unless  the two 32-bit reads are contiguous. =C2=A0And thi=
s
is the case in the two places where this function is currently used,
namely in i915_get_vblank_counter() and in intel_vrr_get_config().

I also can't see why these two "half-registers" would be in separate
power wells.  But then again, I don't see anything explicitly
forbidding this to happen in the code, so...


> I think it doesn't really hurt to also intel_dmc_wl_get(i915, upper_reg)
> here, since it would actually just bump the refcount, no?

...I'll check the upper reg as you suggest as well. :)

--
Cheers,
Luca.
