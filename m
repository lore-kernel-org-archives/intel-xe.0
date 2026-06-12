Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3A0CD98D8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 13:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FDB10F4AF;
	Fri, 12 Jun 2026 13:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJdse7YB";
	dkim-atps=neutral
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD5010F20F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 03:42:39 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-6604176b575so465670d50.1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 20:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781235759; cv=none;
 d=google.com; s=arc-20240605;
 b=N9tIzqCGhYbED0ZD360XyZub42cIpWVrMqrJAm0/lhsmJX+g0SfHjVSonhac5VxbU6
 c7Kru02I6eW22GHScajWyORB4BbwZpkeBWKYm0JkLKqdPP6CqYZ1jUg134ej1pqBfbIP
 zW1oW08g6ZL3H+mbiGnqN1Ff5MJpUjgx7TFwB2dqNK3fXbAf6k3GHPq+Q/hASpMe5iC0
 5hjikqxT9v1ngWUoy2ZvqVwIn+mKtRNpIn1R8Jj3j0/MPrvW1waUmrJXPCSmovh6+X7h
 53pWZnRz+FSmdip4A5CbGlvaPkwjamOlhRx2IvH0dgcwfpzebPpgvtc5GAOxdPIXiQa1
 8fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=F2b1FbuAbMKG8c113cKqrJ2bKBY8pM/9wTcVdHGIxkg=;
 fh=LbeBJm7aFsi+1SxVdPV2wJCiLOSU28I8XbYFVjXQlTY=;
 b=NME3FB5LCWEFG0QxkfQN2wwyyLXmXCdfM2izHzPwWTpAjdAgXAQ6gY4gMp2ZvBekWR
 e0xm2hUJuWjaam46Cf5BLQagBihOr1zM6B86Wb+bXxrOyEdaDeE1F3pKeXL4zvLVz2ie
 P+PhrwnCDpT4VckYOWfD1XBiPbONDlyAWR1qsEqeMCGP13dHTGTmJS9i5oGnmcOtShUx
 jWMvTQfNdsxpEHSwFoPX21laEmCkMpLJzhUPH7bSSzoC9K84M/M8CaX9U1vGSHJTob0X
 CrsCEw4pJllRM4FCSIDW3WPuZtv64IcKzaYnTg2mc4M5YwVdGmGrNXbvjNkpwTqbwJG7
 9lJw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781235759; x=1781840559; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F2b1FbuAbMKG8c113cKqrJ2bKBY8pM/9wTcVdHGIxkg=;
 b=ZJdse7YBljmIvcc0E2mphwxVGYoXeHNjWkGOYCkU77UWG3u7xkyVsUzXQL4lrZFXPw
 ExTSrPrOaOpD2G8VEsmFlWOAxHAIU2WTpThODNd0cBkY9jHiIbEBig6XXbAexrEfWBkg
 gZ77RV62FSkob0hnoVWErhLK/AkRgcahGlE7EJ1B/EL6oS2VBGiJAoLJXlMEcKelcMGP
 CrbBcKmFXZMuxsQnFXcrunnBOZiOWCJN85G/OteQZx9vGw98UT1sHIpsJ9DhtXvVl78Z
 noOdt4gGtbSmn2+QS65/zmsn3zQDLZADFMAtOWcBsGVhIfkuCi2Ppyxktqh4kFboNbVj
 ubtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781235759; x=1781840559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2b1FbuAbMKG8c113cKqrJ2bKBY8pM/9wTcVdHGIxkg=;
 b=pXDO1jQ4YnD3s6TAuJjxe3VI47CVCPcgrmGABTtpIVy0bHtvyURycYAQ16Sv6HzPwI
 1fYprlE2teiPnK0MSe1KFjx+fy/qTPDfGMGauO+oDzYGlKa2YdSkQUjpgs6f/R4YKRh1
 og8v3vgapEY2FRcfEHouuX66rqRgUCarbyTNPob0XsUwyjd/Oo9hGo3WhYeE26bpbtA/
 a0sfg96/hUWtwlYAuhb6u9XJsHfwr4sWDiQBsFLJi3oTo4BKucQJ/Drom4a+NX3sy/ES
 +JOLCxhjvaqy2PMNmd6VT574EPU4pkjXsUTBy+fx3B3oB0J/PJBULGlaNX4t7luDRmLR
 xn3g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nH3HLcPSOx1a6lfqBWsTJPcSt/Qt03JtPSXzHi2sFO+BDwAqrTmhGqcdNV2pvGyUPvAUuUSBPng==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweOWzS4W5zBimFkm88DshwpTPjyrX3pxh1jyr03aFnTgXhntjg
 Wfaqc1CUa1FW8cjx4gd1E73oWtljE6DXUIM9Q44gwLH+6YFOmgWZNzUD8Ja9zjHgQ2+jX90a0IP
 c0BsDVEuMS7hwfQtshr2mgaQSDWoKZ8g=
X-Gm-Gg: Acq92OGEX4l/qcNGdf+yno8SIn/AXLatYkmd0lHwRglM+jXmJMJw6x4zlE+SfsRXBGo
 jnbuh4QQ6r4kDETMIP1sUTUGOfx9CbiE/tsKh9OQKFb/ollWBoniMZi7SoFmTcg0xVV/Omyfgue
 0aaWIk1h7zCTuPD9qk2LWjWkuC5Tk9aQzKs98YSal8z/OcYDYnJ7/12zE96DccVvx/j8uQ+PMRX
 aLh5q23mtE38T3yDkX+7So3YUEZmYZv6KozcGMzzzoDhPVFt8zw/LlDrnzB6PEcnrBZkmeMBFa2
 V4j+jG1m
X-Received: by 2002:a05:690e:191b:b0:651:bd70:161b with SMTP id
 956f58d0204a3-66277f4c797mr925128d50.1.1781235758651; Thu, 11 Jun 2026
 20:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260610035419.1596963-1-lgs201920130244@gmail.com>
 <ail6r13cZSN5EPLx@ideak-desk.lan>
In-Reply-To: <ail6r13cZSN5EPLx@ideak-desk.lan>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 12 Jun 2026 11:42:19 +0800
X-Gm-Features: AVVi8Ce4po4Dg0d4OZSFYJGTZQPPjfgeS2QsqZx_6UblnVFzZSwcDHWE8ndszHg
Message-ID: <CANUHTR84uSy15DCdXYr2DWPoJcx_0vnG3LfFb2x9Yt978K5tgA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: clear CRTC color blob pointers after
 dropping refs
To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 12 Jun 2026 13:05:53 +0000
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

On Wed, 10 Jun 2026 at 22:54, Imre Deak <imre.deak@intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 11:54:19AM +0800, Guangshuo Li wrote:
> > intel_crtc_free_hw_state() drops the CRTC color blob references, but
> > leaves the corresponding pointers unchanged.
> >
> > This can matter in intel_crtc_prepare_cleared_state(), which frees the
> > old CRTC hw state before calling intel_dp_tunnel_atomic_clear_stream_bw().
> > The latter can fail while looking up the DP tunnel group state, for
> > example with -EDEADLK.
> >
> > If that happens, the function returns without completing the cleared
> > state preparation. The failed atomic state will then be cleared by the
> > atomic core and intel_crtc_free_hw_state() can be called again for the
> > same state, dropping the same blob references again.
> >
> > Clear the blob pointers after dropping the references so repeated cleanup
> > of the same CRTC hw state is safe.
> >
> > Fixes: fb69d0076e68 ("drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state")
> > Suggested-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Keep the original ordering in intel_crtc_prepare_cleared_state().
> >   - Clear the blob reference pointers in intel_crtc_free_hw_state(), as
> >     suggested by Imre.
> >
> >  drivers/gpu/drm/i915/display/intel_atomic.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> > index 71b7325917b6..0cdae87e4bfc 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> > @@ -294,6 +294,12 @@ static void intel_crtc_put_color_blobs(struct intel_crtc_state *crtc_state)
> >  void intel_crtc_free_hw_state(struct intel_crtc_state *crtc_state)
> >  {
> >       intel_crtc_put_color_blobs(crtc_state);
> > +
> > +     crtc_state->hw.degamma_lut = NULL;
> > +     crtc_state->hw.gamma_lut = NULL;
> > +     crtc_state->hw.ctm = NULL;
> > +     crtc_state->pre_csc_lut = NULL;
> > +     crtc_state->post_csc_lut = NULL;
> >  }
>
> Could you still move the clearing closer where the refs are dropped, to
> the end of intel_crtc_put_color_blobs()? Otherwise this looks ok to me.
>
> >
> >  /**
> > --
> > 2.43.0
> >

Sure, I'll move the pointer clearing to the end of
intel_crtc_put_color_blobs() and send a v3.

Best regards,
Guangshuo
