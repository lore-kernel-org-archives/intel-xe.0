Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3FCD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 14:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B74B10E309;
	Sat, 23 May 2026 14:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FFfgHPm+";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E0A10E30F
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 14:49:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-672645dbfeaso10394575a12.0
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 07:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779547741; cv=none;
 d=google.com; s=arc-20240605;
 b=eQRNWVfr5bKbJ4lClvdluw6XpB+S9g2/1WjpYTGyupPdUvDh/USSX2ioDpEWdiotij
 +PtMynWte6EW2nwOWSZ4a3kkhvSyvZXpOSuT46qJ5fz9mzyqvNsXEDu9AN7o+uD93Egy
 /UlO4qCqZ6peMiKeJ3zHTxNrjXU071SAg5yI7ItafZ2jzmjOkax9G/noYGeb2+gU+5yP
 Wk/BrlKkDGoUGPrtBzyrAsfJjPK6XqehQouxbs0dyrLZFojACeAhUwU+mUfPyumb6Vge
 DEotUD+9prQY+GbJf9DUA2z/Tgq9bFhN3/DU0Bft/brC7B3LrOsSVji9MilgzdUCBM2B
 bP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dJ6anXWxKYMTLL9fyM/A3M4Ad1F60HO0HgpiKzYTKao=;
 fh=oYG3vrqoOrrXoe7KFLHbJLSq/XM5LwEijNSCb897fBw=;
 b=Zo61P3MktVTqppzAGBERldLcA57BcFAX6JbruJgDwB01dkboVJ8GRl/TCyFdBcZvSH
 1EOEPIy906OVJYBuPnNI/MXlQZRWOI8tcNU6m8+7UB4bCbX+R+7ZOoUa2igkU76H8rAn
 E9+jp8j75QiUFS2oyorK6blQdp3sHcscU5WtNHcBgbanOQzgML1Er1c9uRbkGGNhxlgF
 hq7oGnDUAy6trVQDtL5AyNWtI0YMtoE8NsSsWIsxnNrtStLQJSTPErxrTUlqmnChOSVt
 sHmILNBrEibAwmseyT59Yj82SFHsyWu3yevb6nZ93zmPI+HtznoVVKH0nuDFmfgrjOdU
 OY0A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1779547741; x=1780152541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ6anXWxKYMTLL9fyM/A3M4Ad1F60HO0HgpiKzYTKao=;
 b=FFfgHPm+7rJJioapygUO3msk76fcq2W/uffDMpNx6v99ojYH4BOTVzigIg8d9p8Mvf
 DmOAHu3xMUiz1NyrsMgdG6hf+OvrDOvuaXGAxVRFTMYQJxGI9QgVX+h4rIWgWUVfKrZl
 AL1EkJMTWah7DT3F9Xm7QHpp5UhUiyNXR0XyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779547741; x=1780152541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dJ6anXWxKYMTLL9fyM/A3M4Ad1F60HO0HgpiKzYTKao=;
 b=QDQNMsEH4buso+HVQJmivZKpjunqfJY8MRpPAjDomrlIQyHTqjup1Oet73JgdN5LGB
 ggdQ1j2u0Z4iT/SDVNXw9PNK579QU6guAr4aKPQIw/E48S3zf3JbYYDg4h+RtwbA6Rl8
 ArBsINTzkMmTPGyONYDr7D+XiDzez6ArYvEHYJgEnUIjSvCbKvz8Z5A7JIlKdiU9c1eG
 uQ0pkBTkmpMl57NSeUS2vePB6tQs0jnOlU/Z2w8RwTbupJglvdniqAyVSQ1uXBv77tDY
 Tkxs8rDHqpdspRh0QWnR1T3VhSuZgGxlelXGCV63Ux7ubjnzIqJ7mTzJyGvgg9wVwRD0
 8oDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KV6O4pAF8ODq7eQkVmFcAJ7joldXDQbdoj+TBUYAxfrs8FZypDinJTXGx0F642epsDuWwbirRHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuOCwgZ9kPCArjui8c7GnCTWDRLgKUSVTbNEXSomQOmxNcRo15
 ASqBhrz3N6qJwuN7+SSK9xjN5O1MSDVIE/jEhrqMtQ7m3RvvR4+2c20MAlVICePqNMW5SIIjsf4
 4pjEvhEOotZ9F435Gd9XgxeqfEgF63Q7JP8ZB7ZC0Xe1UZbUk5tZEu2M=
X-Gm-Gg: Acq92OELYUqkmb8pd8pkCCfgiJI7qQm5L+FQyCcYPKlCF5uAyoW6KF9koYCbEd8EQKM
 IshvCKWuJQ11DE9DvI4k8fsE7jk+MgTfhTHItuKvXHYlfAFlbx2xDcKER+dpiefRrfd/sAsB87w
 jG1b+U5dK2SQz1aF7Vs8D5hD5sZKh65toby7W9Ly4hN67SKQmzB1eMPmByimglXNoFB14WN9L7+
 lpJmFdB/MHB/I76r4S1vMSv7a559qRK3PmE249H72GBDbZSlUoR3w4b9Dqomar8eXrpSTn9U5EN
 sX9yOWGsGX6EeY+9is3aDtmG/x3RvU7fmhwllZHe/j66mLOtMA==
X-Received: by 2002:a05:6402:43c5:b0:676:9c6d:5c59 with SMTP id
 4fb4d7f45d1cf-6889c406c91mr4037615a12.2.1779547741254; Sat, 23 May 2026
 07:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
In-Reply-To: <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 23 May 2026 07:48:49 -0700
X-Gm-Features: AVHnY4KEVEpp75kX8G4Rhk0bsk3iMbWvcHaEkzBiByL61-bRiRVSFHCy-rN0x5w
Message-ID: <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, May 23, 2026 at 1:29=E2=80=AFAM Maarten Lankhorst <dev@lankhorst.se=
> wrote:
>
> Does it happen more frequently when loading VRAM intensive programs?

Well, "more frequently" is hard to say since it's happened twice, but
this time it certainly happened when launching a new program.

This time it was a markdown viewer.

I wouldn't expect that to be particularly VRAM-intensive, but hey,
since I run with two 6k monitors, I suspect *anything* with big
windows will chew up a few hundred megs of VRAM just for the frame
buffer side.

It's a B50 Pro, so it's a discrete card with 16GB on card.

I have no memory of what it might have been back a few months ago. But
I would expect it to be all the usual stuff - ten terminals, a web
browser with a dozen tabs, and whatever gnome and wayland do, and then
the occasional random other thing.

             Linus
