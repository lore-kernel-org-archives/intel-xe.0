Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D6AE6B240
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 11:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888D10E9A3;
	Fri,  1 Nov 2024 11:04:28 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4DC10E9A4;
 Fri,  1 Nov 2024 11:04:27 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t6pS3-00000001ENf-3xPw; Fri, 01 Nov 2024 13:04:24 +0200
Message-ID: <9479e5a964c97ab3b3b0a334fb760cf3945f3e22.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Fri, 01 Nov 2024 13:04:22 +0200
In-Reply-To: <172959450980.3700.12071321081236598428@gjsousa-mobl2>
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
 <20241021222744.294371-3-gustavo.sousa@intel.com>
 <87wmi0v5u3.fsf@intel.com>
 <172959450980.3700.12071321081236598428@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 02/13] drm/i915/dmc_wl: Use non-sleeping variant of MMIO
 wait
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

On Tue, 2024-10-22 at 07:55 -0300, Gustavo Sousa wrote:
> Quoting Jani Nikula (2024-10-22 06:34:44-03:00)
> > On Mon, 21 Oct 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> > > Some display MMIO transactions for offsets in the range that requires
> > > the DMC wakelock happen in atomic context (this has been confirmed
> > > during tests on PTL). That means that we need to use a non-sleeping
> > > variant of MMIO waiting function.
> > >=20
> > > Implement __intel_de_wait_for_register_atomic_nowl() and use it when
> > > waiting for acknowledgment of acquire/release.
> > >=20
> > > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_de.h     | 11 +++++++++++
> > >  drivers/gpu/drm/i915/display/intel_dmc_wl.c | 20 ++++++++++++-------=
-
> > >  2 files changed, 23 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/dr=
m/i915/display/intel_de.h
> > > index e017cd4a8168..4116783a62dd 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > > @@ -121,6 +121,17 @@ ____intel_de_wait_for_register_nowl(struct intel=
_display *display,
> > >  }
> > >  #define __intel_de_wait_for_register_nowl(p,...) ____intel_de_wait_f=
or_register_nowl(__to_intel_display(p), __VA_ARGS__)
> > > =20
> > > +static inline int
> > > +____intel_de_wait_for_register_atomic_nowl(struct intel_display *dis=
play,
> > > +                                           i915_reg_t reg,
> > > +                                           u32 mask, u32 value,
> > > +                                           unsigned int fast_timeout=
_us)
> > > +{
> > > +        return __intel_wait_for_register(__to_uncore(display), reg, =
mask,
> > > +                                         value, fast_timeout_us, 0, =
NULL);
> > > +}
> > > +#define __intel_de_wait_for_register_atomic_nowl(p,...) ____intel_de=
_wait_for_register_atomic_nowl(__to_intel_display(p), __VA_ARGS__)
> > > +
> >=20
> > There's no need to add the wrapper when all users pass struct
> > intel_display. And we don't want new users that pass i915.
>=20
> Ah, okay. Thanks.
>=20
> >=20
> > And why are we adding new stuff and users with double underscores?
>=20
> Well, this is a no-wakelock variant and it shouldn't be used broadly. I
> believe that was the motivation of all "__intel_de_*nowl" variants being
> prefixed with the underscores.

Yes, that's exactly the idea in the code I added earlier.  The double
underscore is used for non-locking functions that are called by their
locking versions.  And should only be used elsewhere in very specific
cases.

--
Cheers,
Luca.
