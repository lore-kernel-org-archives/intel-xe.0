Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A811FED2F0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38E310EA28;
	Thu, 12 Mar 2026 08:48:20 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A0610EA28;
 Thu, 12 Mar 2026 08:48:19 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1w0biH-00000003G7Z-21YF; Thu, 12 Mar 2026 10:48:15 +0200
Message-ID: <96514ac2339ed51716c709e8f735aa7ffa3c6d72.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Mar 2026 10:48:12 +0200
In-Reply-To: <a7361eb05a3162ccd24d87b0ad77f8702ae0bfb1@intel.com>
References: <20260312081647.1083777-1-luciano.coelho@intel.com>
 <a7361eb05a3162ccd24d87b0ad77f8702ae0bfb1@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/display: fail compilation on
 intel_display_wa() with invalid enums
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

On Thu, 2026-03-12 at 10:33 +0200, Jani Nikula wrote:
> On Thu, 12 Mar 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > In a previous commit, the intel_display_wa() was changed so it
> > wouldn't receive an integer as the workaround number, but the enum
> > value itself.  This caused compilation not to fail anymore when the
> > enum passed didn't exist.
> >=20
> > Bring this back by using BUILD_BUG_ON() to check that the enum passed
> > sits within the range of defined enums.
> >=20
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_wa.h | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/=
gpu/drm/i915/display/intel_display_wa.h
> > index 15fec843f15e..4239e4295ec7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > @@ -60,11 +60,14 @@ enum intel_display_wa {
> >  	INTEL_DISPLAY_WA_22012358565,
> >  	INTEL_DISPLAY_WA_22014263786,
> >  	INTEL_DISPLAY_WA_22021048059,
> > +
> > +	INTEL_DISPLAY_WA_COUNT
> >  };
> > =20
> >  bool __intel_display_wa(struct intel_display *display, enum intel_disp=
lay_wa wa, const char *name);
> > =20
> > -#define intel_display_wa(__display, __wa) \
> > -	__intel_display_wa((__display), __wa, __stringify(__wa))
> > -
> > +#define intel_display_wa(__display, __wa) ({				  \
> > +		BUILD_BUG_ON(__wa >=3D INTEL_DISPLAY_WA_COUNT);		  \
> > +		__intel_display_wa((__display), __wa, __stringify(__wa)); \
> > +	})
> >  #endif
>=20
> I'm not sure if this is worth it to be honest. We'll get the runtime
> warn anyway.

Yeah, I'm not sure either.  But you commented, I implemented. :)

I made some test with bloat-o-meter and, removing only the const char
*name argument as you suggested, doesn't help much, we only gain 2
bytes somehow.

But, with this patch, I can remove the warn at runtime (because it
wouldn't even compile then) and we can gain 49 bytes total. LOL

Anyway, nice exercise.  It's your call, if you want I can send the
patch to remove the const char and the warn at runtime to go on top of
this one.

--
Cheers,
Luca.
