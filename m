Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41998CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EFE10ED35;
	Mon,  5 Oct 2026 14:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="hJBdoebZ";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69210ED55
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:01:18 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com
 [74.125.230.169]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 03591336768
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 15:01:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1791208877; bh=8HJxRxBpXrcbzqs3kEuPtFXZ96yDimqagGTowPB3l58=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hJBdoebZFKMwnSRRoA5K6Su/bhv6mNKcJZnfVrSzHwvop6t9eBldMaIvPgv171Fnr
 TuXqT09Srwa3XFDDlYw8QW95bd0WLWH6VWTML57I5xmSh7ovX29xKJo9WqVfJ4nBwQ
 3bcSkh4RP6eBmcit7/idsdO1ccEQZoEaK4IPQspgRlp2+VahykbnEcIQyJfjHtJY8u
 DdtEjucF0WIBEp61XnEDwQ0VVg0sfjfEFZ+5hsDXydYQ7MQuqb0gcLI7WN0E7vHqR/
 Ve61OfCzA+yVfFzwAcXYxahe3R9Iy49+zfQCGxqAG08CGKIdOgfEuXAw2Mw9HWCAil
 hLl8m+jehh2JQ==
Received: by mail-qv2-f41.google.com with SMTP id
 6a1803df08f44-9179750d44eso18969936d6.0
 for <intel-xe@lists.freedesktop.org>; Mon, 05 Oct 2026 07:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwRM2XKrC/AJCaDQcrQCDI+PCfgmC283sqDw7C5UTnukAEt6IqfGSzVhZu7Po4BGMClTHQ0gM0J6A==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lfAFvDwgJEbReYpjU+danPifUOm8faJMhuRX7zsMtzwAp13c+s
 tyBddCtESD2GV+qGsmK2hUAO1lbzqYQmW2nUip3Kx0EQ+MFTq8OgRtAUmRYDHs/04uakIFHF8LN
 VLGn7OomEWu6Sk6VPzgR8imLJw9pQIKY=
X-Received: by 2002:a05:6214:5196:b0:917:a1ca:e0cf with SMTP id
 6a1803df08f44-917c006ce63mr210844256d6.19.1791208866309; Mon, 05 Oct 2026
 07:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-atomic-v11-0-6a1df7ec5af8@intel.com>
 <20260331-atomic-v11-1-6a1df7ec5af8@intel.com>
 <e9be1ef8-9884-4117-9eed-ba179248ffc6@suse.de>
 <CAFZQkGzSkUZTodjUudhLsYtset=EqviZeqrfv6gj6XmG+ZJOPQ@mail.gmail.com>
 <636a3dc2-fe17-463e-806a-056818656692@suse.de>
In-Reply-To: <636a3dc2-fe17-463e-806a-056818656692@suse.de>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Mon, 5 Oct 2026 16:00:54 +0200
X-Gmail-Original-Message-ID: <CAFZQkGxYm_zBe69ecsOwhL7ftXVSPkTz5EUR_iXsAgLBVPd9NA@mail.gmail.com>
X-Gm-Features: AclHuK9cCVoEfzsEABuVzYuQ4ViN0b-8gs7MSGf7t2AoSkmh4Jx4LbVcpu4xd2E
Message-ID: <CAFZQkGxYm_zBe69ecsOwhL7ftXVSPkTz5EUR_iXsAgLBVPd9NA@mail.gmail.com>
Subject: Re: [PATCH v11 1/7] drm: Define user readable error codes for atomic
 ioctl
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

> That's not a policy decision. User space is free to do what ever it
> wants.  What I have in mind is a hint from the kernel what to do next.
There's a lot of different ways a commit could be fixed, and telling
the compositor things like "turn off this plane" wouldn't give the
compositor any actionable choices except giving up or exactly
following the hint.

If you meant much higher level things like
- reduce scanout bandwidth
- reduce connector bandwidth on this connector
- do a modeset

that's exactly what the proposed API does.

I don't think there's a middle ground between the two, KMS is too
complex for that.

> >>> + * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
> >>> + *                                  enabled, invalid falg, page_flip event
> >>> + *                                  with test-only, etc)
> >> I've seen this being used in the i915 patch for a async flip.  Could
> >> mean anything there (format, driver specifics).
> > Its purpose is to catch anything that the compositor is supposed to
> > know it can't do - using unsupported formats, invalid combinations of
> > properties (crtc active=1 without a connector), that sort of thing. It
> > should never be anything driver specific though.
>
> I don't see how this could be useful except for the prototype that come
> with this series.  It's so broad in meaning that it's almost meaningless.
It's useful because it tells the compositor that the failure is caused
by an implementation error in the compositor, instead of some driver
or hardware limitation. It doesn't need to be meaningful outside of
that, a developer later debugging what went wrong can use the error
string to figure it out.

> And error codes don't have to be driver specific to be meaningful. I
> already brought up DRM's mode-status code as example. They are not
> specific to any mode, display or hardware. Yet they clearly state what
> went wrong with the mode.
I think that only works because the mode isn't specific to any display
or hardware. Atomic commit failures are often specific to some
combination of driver, GPU and display.

> You could to this with detailed and precise error codes plus the object
> on which it failed.
They can never be detailed enough to exactly pinpoint specific edge
cases, unless you give literally every single return path in every
driver an individual error code. I don't think that is feasible (and
then that error code would be uAPI).

> Filename + line is even worse.  None of this is even close to stable.
> I'll nak this as much as possible.
That's the point? It's supposed to be not stable, so it doesn't become uAPI.

> I also don't buy the argument about diving through kernel sources. Not
> doing that should be the goal here because it is what we currently do.
I don't think that's something you can ever fully get around. Just the
very hardware specific error cases alone make it impossible.

- Xaver
