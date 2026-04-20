Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F29BF5A8B8
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 20:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000FC10EB3B;
	Mon, 20 Apr 2026 20:09:23 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB510EB3B;
 Mon, 20 Apr 2026 20:09:23 +0000 (UTC)
Received: from 88-113-64-214.elisa-laajakaista.fi ([88.113.64.214]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wEuvo-00000004RLY-1S1H; Mon, 20 Apr 2026 23:09:21 +0300
Message-ID: <bf26824b19eb5015841e1cfb2bd5568758308c61.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Date: Mon, 20 Apr 2026 23:09:19 +0300
In-Reply-To: <198b43cfbace2bc2746bee69ca55f2dc2f37e066@intel.com>
References: <20260420103705.3453499-1-luciano.coelho@intel.com>
 <20260420103705.3453499-9-luciano.coelho@intel.com>
 <198b43cfbace2bc2746bee69ca55f2dc2f37e066@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH v3 8/8] drm/i915: remove HAS_PCH_NOP() dependency from
 clock gating
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

On Mon, 2026-04-20 at 15:21 +0300, Jani Nikula wrote:
> On Mon, 20 Apr 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > intel_pch_init_clock_gating() already handles unsupported PCH types,
> > including PCH_NOP, by doing nothing.
> >=20
> > Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
> > path and always call the display helper directly.  This removes one
> > more direct dependency on display-side PCH macros from
> > intel_clock_gating.c.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_clock_gating.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/dr=
m/i915/intel_clock_gating.c
> > index 12559db84cf4..d185199c43b8 100644
> > --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> > +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> > @@ -290,8 +290,7 @@ static void ivb_init_clock_gating(struct drm_i915_p=
rivate *i915)
> >  	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MA=
SK,
> >  			 GEN6_MBC_SNPCR_MED);
> > =20
> > -	if (!HAS_PCH_NOP(display))
> > -		intel_pch_init_clock_gating(display);
> > +	intel_pch_init_clock_gating(display);
>=20
> With this, you could also do
>=20
>  -#include "display/intel_display_core.h"
>  +#include "display/intel_pch.h"

Yes! Good catch.

--
Cheers,
Luca.
