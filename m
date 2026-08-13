Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7411C5AC67
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8DC10E282;
	Thu, 13 Aug 2026 08:20:59 +0000 (UTC)
X-Greylist: delayed 2645 seconds by postgrey-1.36 at gabe;
 Thu, 13 Aug 2026 08:20:58 UTC
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7EE10E282;
 Thu, 13 Aug 2026 08:20:58 +0000 (UTC)
Received: from 37-136-223-217.rev.dnainternet.fi ([37.136.223.217]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wuPzc-00000002ZHe-3gwD; Thu, 13 Aug 2026 10:36:50 +0300
Message-ID: <abbd77d7c4a814759f69fcf8d8681e4ff88ea903.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: =?UTF-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 10:36:47 +0300
In-Reply-To: <3d6e60c1-9c28-d4cc-f0a6-e06f61b65a6c@intel.com>
References: <20260609095525.570614-2-luciano.coelho@intel.com>
 <3d6e60c1-9c28-d4cc-f0a6-e06f61b65a6c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [v6, 1/4] drm/i915/display: harden masks in
 HSW_AUD_PIN_ELD_CP_VLD macros
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

Hi Micha=C5=82,

Thanks for the review and sorry for the delay in responding.

On Wed, 2026-07-01 at 20:31 +0200, Micha=C5=82 Grzelak wrote:
> On Tue, 9 Jun 2026, Luca Coelho wrote:
> > HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> > TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
>=20
> nasty nit: double space sign: s/  / /

As we discussed offline, this is intentional, it's just a different
type-setting style that some of us old farts still use.  I'll keep
them. ;)


> > value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> > valid here.
> >=20
> > This is not a problem with the current implementation, because trans
> > is always valid when these macros are called, but it's more robust to
> > mask the index to the low 2 bits so the shift is always well-defined.
> >=20
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_audio_regs.h | 16 ++++++++++++----
> > 1 file changed, 12 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_audio_regs.h b/drivers/=
gpu/drm/i915/display/intel_audio_regs.h
> > index 4c31844d21df..f3d2a99c03d0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_audio_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> > @@ -109,12 +109,20 @@
> > #define _HSW_AUD_EDID_DATA_B		0x65150
> > #define HSW_AUD_EDID_DATA(trans)	_MMIO_TRANS(trans, _HSW_AUD_EDID_DATA_=
A, _HSW_AUD_EDID_DATA_B)
> >=20
> > +/*
> > + * HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> > + * TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
>=20
> double space: s/  / /
>=20
> > + * value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> > + * valid here.  Mask the index to the low 2 bits so the shift is
>=20
> double space: s/  / /
>=20
> > + * always well-defined.
> > + */
> > #define HSW_AUD_PIPE_CONV_CFG		_MMIO(0x6507c)
> > #define HSW_AUD_PIN_ELD_CP_VLD		_MMIO(0x650c0)
> > -#define   AUDIO_INACTIVE(trans)		((1 << 3) << ((trans) * 4))
> > -#define   AUDIO_OUTPUT_ENABLE(trans)	((1 << 2) << ((trans) * 4))
> > -#define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
> > -#define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
> > +#define   __AUDIO_TRANS_SHIFT(trans)	(((trans) & 0x3) * 4)
> > +#define   AUDIO_INACTIVE(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + =
3)
> > +#define   AUDIO_OUTPUT_ENABLE(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans=
) + 2)
> > +#define   AUDIO_CP_READY(trans)		REG_BIT(__AUDIO_TRANS_SHIFT(trans) + =
1)
> > +#define   AUDIO_ELD_VALID(trans)	REG_BIT(__AUDIO_TRANS_SHIFT(trans))
>=20
> I'm thinking about something like:
>=20
> #define AUDIO_TRANS_MASK 		REG_GENMASK(1, 0)
> #define __AUDIO_TRANS(trans, bit) 	(REG_FIELD_GET(AUDIO_TRANS_MASK, trans=
) * 4 + (bit))
> #define   AUDIO_INACTIVE(trans) 	REG_BIT(__AUDIO_TRANS(trans, 3))
> #define   AUDIO_OUTPUT_ENABLE(trans) 	REG_BIT(__AUDIO_TRANS(trans, 2))
> #define   AUDIO_CP_READY(trans) 	REG_BIT(__AUDIO_TRANS(trans, 1))
> #define   AUDIO_ELD_VALID(trans) 	REG_BIT(__AUDIO_TRANS(trans, 0))
>=20
> or, on a second thought, maybe even:
>=20
> #define AUDIO_TRANS_MASK 		REG_GENMASK(3, 2)
> #define __AUDIO_TRANS_SHIFT(trans)	(trans << 2)
> #define __AUDIO_TRANS(trans, bit) 	(REG_FIELD_GET(AUDIO_TRANS_MASK, __AUD=
IO_TRANS_SHIFT(trans)) + (bit))
> ...
>=20
> since multiplying by 4 should be effectively left-shifting by 2,=20
> and it shouldn't matter whether we first do the left-shift or bitwise
> AND.
>=20
> But no idea if it makes any sense. Anyways:

Neither of these are actually equivalent to the ones I implemented.  I
went through a few different implementations, but then settled on the
one I sent.  Especially the REG_GENMASK() you proposed doesn't work as
intuitively as it seems.


> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thanks!

--
Cheers,
Luca.
