Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C9CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0128710F219;
	Thu, 21 May 2026 06:47:58 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B628110E0E0;
 Thu, 21 May 2026 06:47:56 +0000 (UTC)
Received: from 91-152-155-144.elisa-laajakaista.fi ([91.152.155.144]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wPxCA-00000005NAR-0npe; Thu, 21 May 2026 09:47:52 +0300
Message-ID: <2bb5651ead8635bde0af9a1a1883b9cd0051689a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 May 2026 09:47:49 +0300
In-Reply-To: <44b3a002fbba80bdafd440fcbb8c912bb1243765@intel.com>
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
 <20260519112243.1454375-2-luciano.coelho@intel.com>
 <44b3a002fbba80bdafd440fcbb8c912bb1243765@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] drm/i915/display: harden masks in
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

On Tue, 2026-05-19 at 14:49 +0300, Jani Nikula wrote:
> On Tue, 19 May 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> > TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
> > value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> > valid here.
> >=20
> > This is not a problem with the current implementation, because trans
> > is always valid when these macros are called, but it's more robust to
> > mask the index to the low 2 bits so the shift is always well-defined.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_audio_regs.h | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_audio_regs.h b/drivers/=
gpu/drm/i915/display/intel_audio_regs.h
> > index 4c31844d21df..25df7af4f67f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_audio_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_audio_regs.h
> > @@ -109,12 +109,20 @@
> >  #define _HSW_AUD_EDID_DATA_B		0x65150
> >  #define HSW_AUD_EDID_DATA(trans)	_MMIO_TRANS(trans, _HSW_AUD_EDID_DATA=
_A, _HSW_AUD_EDID_DATA_B)
> > =20
> > +/*
> > + * HSW_AUD_PIN_ELD_CP_VLD has a 4-bit field per transcoder for
> > + * TRANSCODER_A..TRANSCODER_D only (bits 0..15).  Any other transcoder
> > + * value (TRANSCODER_EDP, TRANSCODER_DSI_*, INVALID_TRANSCODER) is not
> > + * valid here.  Mask the index to the low 2 bits so the shift is
> > + * always well-defined.
> > + */
> >  #define HSW_AUD_PIPE_CONV_CFG		_MMIO(0x6507c)
> >  #define HSW_AUD_PIN_ELD_CP_VLD		_MMIO(0x650c0)
> > -#define   AUDIO_INACTIVE(trans)		((1 << 3) << ((trans) * 4))
> > -#define   AUDIO_OUTPUT_ENABLE(trans)	((1 << 2) << ((trans) * 4))
> > -#define   AUDIO_CP_READY(trans)		((1 << 1) << ((trans) * 4))
> > -#define   AUDIO_ELD_VALID(trans)	((1 << 0) << ((trans) * 4))
> > +#define   __AUDIO_MASK_TRANS(trans)	(((unsigned int)(trans) & 0x3) * 4=
)
> > +#define   AUDIO_INACTIVE(trans)		((u32)BIT(3) << __AUDIO_MASK_TRANS(tr=
ans))
> > +#define   AUDIO_OUTPUT_ENABLE(trans)	((u32)BIT(2) << __AUDIO_MASK_TRAN=
S(trans))
> > +#define   AUDIO_CP_READY(trans)		((u32)BIT(1) << __AUDIO_MASK_TRANS(tr=
ans))
> > +#define   AUDIO_ELD_VALID(trans)	((u32)BIT(0) << __AUDIO_MASK_TRANS(tr=
ans))
>=20
> Please use REG_BIT() instead of (u32)BIT().

Yeah, looks much nicer, thanks.  I converted it to use REG_BIT().


> All of this would be cleaner with the REG_GENMASK() stuff too.

I don't see how REG_GENMASK() could be used here.  We're handling
single-bits only, with a shift to get it in the proper place, so it's
not really a mask.

--
Cheers,
Luca.
