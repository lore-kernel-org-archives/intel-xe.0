Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F077FC77B6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 13:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F4D10E365;
	Thu, 13 Apr 2023 13:08:43 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B6910E342
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 13:08:41 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bl22so27840887oib.11
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681391320; x=1683983320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uzA1KGNdFxgOos0lWgTFw5KZ9QFrUKh/vKqu4VdkT5Y=;
 b=fw57w4BkNLn5uWEdi4e6O0IBMr3njghz18gx5iG5Ef28UudSil8mZnnM0bgYtGR5iU
 sJdQpfB3tZ6fsBIKeyuj8XnT/CqFY+x+czpGTw1KXBKhTe+gy37DH5ix64Vd/LYsb8u6
 XgMS8RB3ccHM27FQrC2jcsTHQL85zT4sXSqTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681391320; x=1683983320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzA1KGNdFxgOos0lWgTFw5KZ9QFrUKh/vKqu4VdkT5Y=;
 b=FBO9cPYIkiKBy2ZVivkkNlDGBGViLkEuedxbbeJ/QfCabRhdPqrr+BGbGOl+vDpW99
 fZl5AOBcko5eBazKzJEtmzU1M7/cOfkctbu2oj1+NpvDS0TuE1AIjEVt19ZRHv3jWmZ6
 0v71elYzyMV7HFkyOEwNk5CFT0mWZuam7O/43XWNc5NbteLbKSndb1Bcjol19AELCMXk
 sjabK0PHZyFT0YAi6DZf0AQKPH8bZ9yhcNqpT+KXg/AaYhMfrXJfV/si/HA2JklPOb0Q
 kfWJ9meqNVGAWtREzr9MTnNmG0Z4CB3Osi7O9VlxD6nVAZvXXra3dB1RMQKwCX/y9Vhf
 5VDQ==
X-Gm-Message-State: AAQBX9cCpwWjkMoLzzu132arp4sp3wUL7+bI59ZcptbSr+p5gBgHkS9B
 7ogEGK7xAZ+duWBuJRT7ICIkPH3GknuKzqFJc6C/wg==
X-Google-Smtp-Source: AKy350azl9AUU8U7Sl69543OfFPon7d0hOZjcps7XYHtf5YsDRKdFW+oUQP3hO5Jhc2NiOERx5aaAVs9+nZ2XQz+zjU=
X-Received: by 2002:aca:120c:0:b0:38b:f7fa:40ac with SMTP id
 12-20020aca120c000000b0038bf7fa40acmr475274ois.8.1681391320405; Thu, 13 Apr
 2023 06:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230405153920.926583-1-jani.nikula@intel.com>
 <c83e776a-4621-3b4f-384e-4bd43fa41473@linux.intel.com>
In-Reply-To: <c83e776a-4621-3b4f-384e-4bd43fa41473@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Apr 2023 15:08:29 +0200
Message-ID: <CAKMK7uFgjT5w0ykG_wBgv7iwiML1ouAs=EEzRa=3-V=2EXwy-w@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 00/21] xe & i915 display integration ifdef
 cleanups
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
Cc: Jani Nikula <jani.nikula@intel.com>, joonas.lahtinen@linux.intel.com,
 lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023 at 14:20, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 05/04/2023 16:38, Jani Nikula wrote:
> > Hey all, here's my first batch of #ifdef cleanups for xe and i915
> > display integration.
> >
> > Many of the patches in this series break the build, and will get fixed
> > by subsequent changes. It's pretty much unavoidable as many of the
> > changes are standalone to i915, and others are fixups.
> >
> > This is pretty straightforward stuff for starters, really. The idea is
> > that in the next rebase, the drm/i915 changes here go *before* any of
> > the current i915 changes.
> >
> > Adding the static inline stubs for xe build in i915 (the !I915 parts) is
> > very helpful in not sprinkling #ifdefs all over the place. A lot of the
> > time, the compiler is able to just compile out lots and lots of
> > unreachable static functions and data without explicitly conditionally
> > building them out. We can leave a lot of it out from "drm/i915/display:
> > Remaining changes to make xe compile". This is crucial especially while
> > upstreaming by keeping the changes to i915 minimal.
> >
> > Also, I think the conditional build and stubs in headers is the least
> > intrusive way of going about this before xe is actually upstream, and it
> > also follows the usual patterns for CONFIG_FOO=n code paths, albeit I915
> > is defined in the Makefile, not in kconfig.
>
> I think the sheer amount of static inline dummies is not nice at all and
> I certainly wouldn't support it for the long term, or proper solution.
> Not to mention it is catering for out of tree code which is quite an
> atypical accommodation.
>
> So sadly no ack from me but given DRM maintainers approve this approach
> I don't intend to attempt to block it either. FWIW and for the record only.

The big difference we tend to make (inconsistently at that) is whether
it's prep work for code that everyone expects to land, or is there
just no way it'll ever land.

So like prep work for all the compute/hpc stuff for i915-gem is
no-way, because there's no path to upstream for that.

But prep work for display to reuse i915-display in xe is fine, because
the expectation is that xe (at least for client, I'm not very
optimistic about hpc tbf) will land in upstream. Even if it's a year
or something like that, we've done that before for various reasons.
Even if it's more than a year (I'm still trying to get at least one
vendor to upstream their pre-si infra, no one's biting thus far for
the kernel, mesa otoh has quite a few sim layers already), when it's
really something that makes sense long-term for the overall
community/ecosystem.

Hence my question: Do you think this is also no-go once xe is merged,
and what should it look like instead to make it not no-go?

Cheers, Daniel

> Regards,
>
> Tvrtko
>
> >
> > BR,
> > Jani.
> >
> >
> >
> > Jani Nikula (21):
> >    fixup! drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe
> >    drm/i915: define I915 during i915 driver build
> >    drm/i915/display: add I915 conditional build to intel_lvds.h
> >    fixup! drm/xe/display: Implement display support
> >    drm/i915/display: add I915 conditional build to hsw_ips.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    fixup! drm/xe/display: Implement display support
> >    drm/i915/display: add I915 conditional build to i9xx_plane.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    drm/i915/display: add I915 conditional build to intel_lpe_audio.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    drm/i915/display: add I915 conditional build to intel_pch_refclk.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    drm/i915/display: add I915 conditional build to intel_pch_display.h
> >    drm/i915/display: add I915 conditional build to intel_sprite.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    fixup! drm/xe/display: Implement display support
> >    drm/i915/display: add I915 conditional build to intel_overlay.h
> >    fixup! drm/i915/display: Remaining changes to make xe compile
> >    fixup! drm/xe/display: Implement display support
> >
> >   drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++++++
> >   drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++++
> >   drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
> >   drivers/gpu/drm/i915/display/intel_crtc.c     |  6 +-
> >   drivers/gpu/drm/i915/display/intel_display.c  | 15 +----
> >   .../gpu/drm/i915/display/intel_lpe_audio.h    | 20 ++++--
> >   drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++++
> >   drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++++++
> >   .../gpu/drm/i915/display/intel_pch_display.h  | 63 +++++++++++++++----
> >   .../gpu/drm/i915/display/intel_pch_refclk.h   | 25 ++++++--
> >   drivers/gpu/drm/i915/display/intel_sprite.c   | 20 +-----
> >   drivers/gpu/drm/i915/display/intel_sprite.h   |  8 +++
> >   drivers/gpu/drm/xe/Makefile                   |  2 -
> >   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  7 +--
> >   14 files changed, 211 insertions(+), 71 deletions(-)
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
