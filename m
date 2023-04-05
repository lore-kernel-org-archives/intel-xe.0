Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F168FC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B6C10E5C4;
	Wed,  5 Apr 2023 22:12:46 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEDF10E5C4
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:12:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-947f54f67acso7790166b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 15:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680732763; x=1683324763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JPbLgkVjw/MR2xQbipjIjkRpIDp1Zwi+KbhZRaU1l1c=;
 b=Xaj+dwtLrWWmXXl6Sq9YyrvLhkgAN1IZLnK5hqPBDh4o5WnqJnYU+7i+9VhGZmGPPL
 4y3TfmUugqWIM0pMaYomoTxrXNsW1CYLYz/2NPWcxqmLubp1jTiYUIHn0pIA1r+gR6jJ
 DN/Pl4zcup870ZTzgtVm96vFpWbCBChP2zK84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680732763; x=1683324763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPbLgkVjw/MR2xQbipjIjkRpIDp1Zwi+KbhZRaU1l1c=;
 b=Gho3YuMaMiGmbsP9pQeYkwtRtFVOho8lwv7Z/DOoc2M0R2noXFsMebEhCB4hVmsgUg
 /kP+/Jr3ivkOdtqlAZi20onId1nKPM5QU1SlKSCNN6fI3Dn4MT6ZYum439YVsawXQmBv
 ADoZArlPnJI2QMW1xg6aLq58ATR25qJJeNMeKm3XRCyYvGuG7qJtuBpnUET7DFqPuhNu
 Esgv67Ninw6GrdxQ6vHqIpTjkrn8+xWZNun23KnGDPOOhdWceNdQg2E7V+oc8S0ratce
 NAYJmfvtE61TvrLPZ9aq5sD7BEdrNYqlQQYYpRDuVGlAXDJJulD4aapKT+7ln8ScuTX/
 p3OA==
X-Gm-Message-State: AAQBX9cxbX+vOSNXM3m5HdgdUWhPy5mUvFBI+eZcTMp9HcahFSMFZT05
 uQX47Q5XV4tOkJiBHlnS0Gm2EA==
X-Google-Smtp-Source: AKy350YhOCJAiklL96IbyGawGmzRS6zBffyFXXfnJ1qyBBZHx4OJ8EKlU76n5iS0lcJ2LrP7SG9bSQ==
X-Received: by 2002:a17:906:51cd:b0:931:5145:c51f with SMTP id
 v13-20020a17090651cd00b009315145c51fmr2781350ejk.4.1680732763060; 
 Wed, 05 Apr 2023 15:12:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ae14-20020a17090725ce00b00947a939f6e0sm7564328ejc.77.2023.04.05.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:12:42 -0700 (PDT)
Date: Thu, 6 Apr 2023 00:12:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZC3yWN1FSl+dPciF@phenom.ffwll.local>
References: <20230405153920.926583-1-jani.nikula@intel.com>
 <87mt3mz5v5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt3mz5v5.fsf@intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: tvrtko.ursulin@linux.intel.com, joonas.lahtinen@linux.intel.com,
 lucas.demarchi@intel.com, daniel@ffwll.ch, rodrigo.vivi@intel.com,
 Dave Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 06:49:34PM +0300, Jani Nikula wrote:
> On Wed, 05 Apr 2023, Jani Nikula <jani.nikula@intel.com> wrote:
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
> To this end, would like to get up front acks for the approach from drm
> maintainers and my fellow i915 maintainers.
> 
> Are the drm/i915 patches (i.e. all the ones that are not fixups) in the
> series okay by you for the xe and i915 display integration?

Ack on these patches. I think for the overall approach of compiling
i915/display twice there might be some risk with having duplicated
symbols. Did you try to build-in both drivers and see what all breaks?

Since we shouldn't have EXPORT_SYMBOL on gen12+ anymore but only
component.c and aux-bus to glue things together across devices/drivers I
dont see an issue at least with modules. The gen5 ips stuff is I think the
only EXPORT_SYMBOL/get_symbol horror show.
-Daniel

> 
> If yes, would you also be okay with merging them to upstream i915 before
> xe is actually submitted upstream, or only as part of the xe (display)
> submission?
> 
> 
> Thanks,
> Jani.
> 
> 
> >
> > BR,
> > Jani.
> >
> >
> >
> > Jani Nikula (21):
> >   fixup! drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe
> >   drm/i915: define I915 during i915 driver build
> >   drm/i915/display: add I915 conditional build to intel_lvds.h
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to hsw_ips.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to i9xx_plane.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_lpe_audio.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_pch_refclk.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   drm/i915/display: add I915 conditional build to intel_pch_display.h
> >   drm/i915/display: add I915 conditional build to intel_sprite.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >   drm/i915/display: add I915 conditional build to intel_overlay.h
> >   fixup! drm/i915/display: Remaining changes to make xe compile
> >   fixup! drm/xe/display: Implement display support
> >
> >  drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++++++
> >  drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++++
> >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
> >  drivers/gpu/drm/i915/display/intel_crtc.c     |  6 +-
> >  drivers/gpu/drm/i915/display/intel_display.c  | 15 +----
> >  .../gpu/drm/i915/display/intel_lpe_audio.h    | 20 ++++--
> >  drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++++
> >  drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++++++
> >  .../gpu/drm/i915/display/intel_pch_display.h  | 63 +++++++++++++++----
> >  .../gpu/drm/i915/display/intel_pch_refclk.h   | 25 ++++++--
> >  drivers/gpu/drm/i915/display/intel_sprite.c   | 20 +-----
> >  drivers/gpu/drm/i915/display/intel_sprite.h   |  8 +++
> >  drivers/gpu/drm/xe/Makefile                   |  2 -
> >  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  7 +--
> >  14 files changed, 211 insertions(+), 71 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
