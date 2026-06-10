Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF58CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 14:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4721F10E9F1;
	Wed, 10 Jun 2026 14:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="piaj78gN";
	dkim-atps=neutral
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E886210E6E4
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 03:56:30 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6608c1a4215so7089007d50.0
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Jun 2026 20:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781063790; cv=none;
 d=google.com; s=arc-20240605;
 b=DES8JQnyyuHFaZ1Wy4PQai5/1kUv3auoFg2p5b5nTp78NhsoLlQJqb0vwIkQik/30S
 7IUlHdlIcCGYM6W76W0EN0o8X1b+0Yb/uSwdjSfZC/Q8w76urNrrlh+jopqyYLxArCm4
 YWicwvgewaSWDUCdWiCCvreUWOKDhjJrgg4/Sx2PIESiF0O92iI4i3mPxuizYhmquLIC
 etnS+jlwTOqP0APtarrFUXqnmiYlrrzuM8Wg2vemNTBSaHOVYo6XP988hySLLRi06EJU
 HN+VCuRzy+D+du5O0lbF7pLM5zop1qTY3UYMObj4+rEiuvvCknwjv5/SxPQF6Ea0OTVu
 irjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o2Y71ur2j8AWeXxKEtF9d/8FWw9ai/UzloR6wLp7LdY=;
 fh=G+mNqrmfs08wGzFSoceF72W9z4HOyKuzQdgPo2B8YQ0=;
 b=VDPL1yElFq2rlAHrRZI7TJ/eyx0HX/QTwqJXlSzCmsLUXXiGSNdVFDpSyHHHcWicBa
 J39ESb+5+zI2VIgLd9yim7aokgDVOX5/USxsGgpayCK9B9nFezv1CAOAHQh4EHKAfDRe
 jwJGr21o+NA0C4ycQj+hY92gY6teqatX9Lx2sDFnm+vUYop3ol32jkIDEvbPDnozTr3o
 XDcEW6r6AwUghsYeiL6gTgILZxkQ41FYsq3c/5rDO3+kp0ChpxDywhEYCCu6Oy4sM1z2
 3SY8lTV4BBiJdPsdA92PrD4pR9zyOsuYVM/uQCeuYgZtMugCLqsBZ935jy3/tS8TCysU
 9xkQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781063790; x=1781668590; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o2Y71ur2j8AWeXxKEtF9d/8FWw9ai/UzloR6wLp7LdY=;
 b=piaj78gN/m1udGdPA7m5mJ0YXW6DHfKJlv0xm9gvVSnWxdmN9JjitVR0BAqFq8to77
 qlu4xGCfX8LoFwecNxVRqU19hdi2pHOQH/8iBOd6+ci856yvU75S7bESdrPSstnjtryd
 SiFmZIjaL4s4czco/1tBIHlwJxcHBCY6HfEYpVDHht95K7AR6XM65zdrax6ifUqoW0v5
 bUO0kshUyHwAzVtZwMNz3lO9GK/odbayPzjQM8TQZOfZyvBHPW9r3qPVQUPH0pU02Qbc
 XMb++xOqrzKZdvXOyV50zvHzdleQbJ2+3uT68r7HhEsU8teMo6ybAnQ1JHON6vWsLyVW
 mJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781063790; x=1781668590;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2Y71ur2j8AWeXxKEtF9d/8FWw9ai/UzloR6wLp7LdY=;
 b=HytgeYz0vUrNmYimW3LvskMZvlV3w1Ts08unFQSX4Rbm+unXOlkGFD9qpFduhCsxGE
 xcaT5hz28dnIssV/ppHGl3wV3Z6vFHsW6RcyBAkTQAs00HbYz6i4jIXJGEtMQndrfNbU
 Lz8G9jji453OWtHptT0AZRWGBcRDr9oWSxbJZ17jZ+U0cdcevTL3M5msZ8v6CE7PiHDg
 2KQybVp4xligBXCMC+aA4bJOiE3Zjrqi/wF1GdNc2ZbEiAa5/fj5vOJPyVSUWaotTYJT
 lrZxXg7TNqte9qTz7qC8Y5ta2gdwOxs0vNTedsLfZj2uhsvunVU43TtIrXHPVZMnuKJ8
 Iq8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ95EzsaftyJEbAVnVnkYjpsZma8LcYFHlYTbZ4QLG2rxLPTSniAzPyUTD9VSdizArg3RtGorLFOCA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYPgMGco89KGu1wA/1YeVs2+/Yff11jV0+jIqEuNNp3oaLWPf7
 BtTPF/UaKCPWp+XO4Btx9xSVrJi/zEq14j1UXB/byf+iqkibodc2+p7IBOHXQzPxk4HUbP878Fw
 FGHgBGHwx+NTf4NnEfF/yR38lj83l5Kw=
X-Gm-Gg: Acq92OFz191WW+fuZNqd9zjR2+aDJScXfvkFFIPJKHMwivXL5QRBmJEwjVtkAAwOBH4
 7EK2AvivYEMtb1slmrcTtKPSL5KK5Ndarf3pmwCqWaAflquNskJ5A37c9HbCcES917PGbDEYZb2
 0wjV94fj15phDdqdVyxMz/VgENXhvW8abGCOFIb4shRTI4tEBCvWyczEzXSSQ9N4A7zom8IVbHQ
 DgtG3led/JvoMghazAlVl8TLrNPJ0nctfBykfslqtAQIMz94BWeJkkG6m1pfEczLmCt+2IQN207
 Kl+o5Q33OOzfAVm4+cvRDcnabe4s7A==
X-Received: by 2002:a05:690e:1242:b0:660:431b:8a5c with SMTP id
 956f58d0204a3-6610a624fa8mr15634436d50.4.1781063789814; Tue, 09 Jun 2026
 20:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260605060527.1443552-1-lgs201920130244@gmail.com>
 <aiLe61REFDPGvZWM@ideak-desk.lan>
In-Reply-To: <aiLe61REFDPGvZWM@ideak-desk.lan>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 10 Jun 2026 11:56:16 +0800
X-Gm-Features: AVVi8Cdl7bjaaSoyIcwbk4y7y4tCXUvPuwgUj1XqVjclggrW4JUWxHkR6dTt11A
Message-ID: <CANUHTR-gdPwagMqGbH+GfPVqWN2ygP6b-GTaUQe_AxZsi5RHfg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp_tunnel: fix CRTC hw state cleanup ordering
To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Jun 2026 14:42:31 +0000
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

Hi Imre,

Thanks for the review.

On Fri, 5 Jun 2026 at 22:36, Imre Deak <imre.deak@intel.com> wrote:
>
> On Fri, Jun 05, 2026 at 02:05:27PM +0800, Guangshuo Li wrote:
> > intel_crtc_prepare_cleared_state() frees the old CRTC hw state before
> > calling intel_dp_tunnel_atomic_clear_stream_bw(). The latter can fail
> > while looking up the DP tunnel group state, for example with -EDEADLK.
> >
> > If that happens, the function returns without completing the cleared
> > state preparation, leaving the duplicated CRTC state with its hw color
> > blob references already dropped. The failed atomic state will then be
> > cleared by the atomic core, which can drop the same references again.
> >
> > Move the hw state release after the DP tunnel stream BW clear has
> > succeeded. Keep the temporary state allocation before the failable DP
> > tunnel operation so an allocation failure cannot happen after the stream
> > BW has already been cleared.
> >
> > Fixes: fb69d0076e68 ("drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index ad2fe10b6b1f..0c015bc6c9fd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -4646,9 +4646,6 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
> >       if (!saved_state)
> >               return -ENOMEM;
> >
> > -     /* free the old crtc_state->hw members */
> > -     intel_crtc_free_hw_state(crtc_state);
>
> The fix is valid, however I think instead of this change it'd be better
> to clear the blob reference pointers in intel_crtc_free_hw_state().
>
> > -
> >       err = intel_dp_tunnel_atomic_clear_stream_bw(state, crtc_state);
> >       if (err) {
> >               kfree(saved_state);
> > @@ -4656,6 +4653,9 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
> >               return err;
> >       }
> >
> > +     /* free the old crtc_state->hw members */
> > +     intel_crtc_free_hw_state(crtc_state);
> > +
> >       /* FIXME: before the switch to atomic started, a new pipe_config was
> >        * kzalloc'd. Code that depends on any field being zero should be
> >        * fixed, so that the crtc_state can be safely duplicated. For now,
> > --
> > 2.43.0
> >

Agreed, clearing the blob reference pointers in
intel_crtc_free_hw_state() makes the cleanup safe against repeated calls
and avoids changing the ordering in intel_crtc_prepare_cleared_state().

I'll send a v2 with that change.

Best regards,
Guangshuo
