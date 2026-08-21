Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D032C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 16:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA510F397;
	Fri, 21 Aug 2026 16:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xxv25+wG";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4789710E328
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 16:48:14 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6a1a546a6bbso2377795a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787330892; x=1787935692;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7nSISwZ9zbCTnY56GQRDO+Ws9ZqBOePjZHKrCvOrhT0=;
 b=Xxv25+wGqDyjrnK7Sldti0OwI4weUYuMS+H/taalE3eK8Eu9Wu8DYrQ888SMB5LgHk
 RqaViTevHdXnoqQY3ThHqVf6N3PmQNHN/dSXDqxVcnSpa3IH41I0EN4YNVCB4TsFEBMd
 kUmYEtNCJ3kKMHOGRt9EsmaDYezHwJt+1PPYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330892; x=1787935692;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7nSISwZ9zbCTnY56GQRDO+Ws9ZqBOePjZHKrCvOrhT0=;
 b=rmRiQ5FaoNRr1pU+P3CEjXoS8Qka2fcilLeG+ZckZCGXu2c0al8kAxXlTuWd/dD9ux
 6UCp2sYGCqMfBf1QQgq3XMGn3tmOymWzcfvRjzy+yUIqf5OltjL38NP7hgSGi0SyDp5m
 RCPFlACSEOXS2TvYk/SpqcoWDaq8duzylGGsbOc9Yc6LbhpxVOktSC5IHCcdXJAzshXB
 JZNZYopn5usExpUVTtEkaNqgKK6Af49n8AYnvDde+EYI0TSKBPjiErnpQTuehtUkTTMl
 LImzotjaOOcCMRtfV4oJPYKlR+mP7wEYowoAXAOmDJRBf4VmQcG8PFbvC5+s0kDZPL+a
 cBNA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrkrb+WMrbb41FoxwChcQTqbFcZT8aPq73gRPbhRlQQFZImTQjNXVbnd4tWhuFM3VQrx2X93YNuBg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nz1x6aYXHB0hL3Q4XwF/OELWcB5tfFzV92vCIKIqYpxkyN4AMt
 dOPVE81M1K6l1Sfrd7TDj19nQMNBjwjKcSMJc322jt+FbON74Xs+pE1gy98lvSjoB4/i1l3Ue6E
 A3RoIgFolhw==
X-Gm-Gg: AR+sD12tgJovjzMW0+2A1mDk313GQfVGke/xkUfszLd4wyGOJ42nnZOsxbgrZ8l0VuV
 uH+gBFkLJx4Gf5N2sb02nId+3xJQVVcXbSxTBXcGWR7tpNwq9zKPs4U1Hkfk2GCbNhihmUHHJc7
 Q30fFO/v0UQ5WO1dplq7NU0LSpzKsHa6DtKaEqpesYGGLryt9tmOX2DPuBVEo4ppcFRj2trBzpw
 f18a81nGSUoUFMV5KMH0lQ6chfl3GRZLdseLfgh7SRn3GJ32ftgDFMcHgJZQ/Pvz7eVH3rzfWkU
 cCix75IW3+Vkoos8n5JXtRTaFi4uY1F3KZe1GaYXdWLT0AIFa7wEgRZ3HI0qEG6NmGFXQCXlrGv
 FIT18jJdI0Bo+RFbZ/syH1PDYmjOo14fxsq+hPktAcrh/5W8g/wSX1VVIOtvxSKNQC8i/XopuB/
 8DnAtIoiSu4jqdcn6HyNHVApcOePLCvriNmSZoZSSVA1Wz/A1vM7TfiBv5+/7K2GypKDwfaQoWv
 2k0PB/MGLruLnI8uFqHojvlNUy5WEbURSJuVA==
X-Received: by 2002:a05:6402:528f:b0:69f:b347:a681 with SMTP id
 4fb4d7f45d1cf-6a42f10d1aamr8954067a12.4.1787330892413; 
 Fri, 21 Aug 2026 09:48:12 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff16c3bbsm7845477a12.24.2026.08.21.09.48.10
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 09:48:11 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6a1a546a6bbso2377725a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rqao5l13Wyk80h/IpIeBOiSHbZQf8lCPvRPMcgF0a9A8/UsjTUfZfhfaP0VJZ0icYmpbNmCmzqx1w==@lists.freedesktop.org
X-Received: by 2002:a05:6402:44d3:b0:69f:aca0:3b9f with SMTP id
 4fb4d7f45d1cf-6a42f1ec0b8mr7153935a12.15.1787330890367; Fri, 21 Aug 2026
 09:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
 <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
 <CAHk-=wjJJH-1q6TK45=z0poSE92mp77JLsF3jHeWXibEtJu7EQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjJJH-1q6TK45=z0poSE92mp77JLsF3jHeWXibEtJu7EQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Aug 2026 09:47:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZbz8v3M+qtzdPvDSshRX=2Krg=ByHyWOW9g+uLQgVkw@mail.gmail.com>
X-Gm-Features: AcwNN1U_08wqJRUkq37hZNlwYCBBtBhEMFoUPFfGtS4vdx8kzYilDETtJ4qKXNI
Message-ID: <CAHk-=wjZbz8v3M+qtzdPvDSshRX=2Krg=ByHyWOW9g+uLQgVkw@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 20 Aug 2026 at 20:50, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I committed the fix as commit 818bebeb63dd ("drm/xe: Don't hand out
> the flat CCS storage as usable VRAM").

Note: that is most definitely a real fix, but it's not necessarily the
*right* fix.

For example, I do not understand the old 128kB alignment at all. It
not only was definitely the wrong way around, but it made no sense in
the first place.

The comment for it said "SW must round up to nearest 128K" and the
original broken commit seems to imply that thatt comes from some
hardware document.

But the result isn't actually *used* for any hardware state, as far as
I can tell. It's just used for "vram_size" (called "usable_size" in
xe_vram_probe, which as far as I could tell is only used by the driver
for the allocator.

So the whole thing was just complete garbage, and I don't understand
*why*. I may be missing something, but yesterday I was so fed up with
the experience of spending 10+ hours debugging what ended up being a
one-liner that I just committed it as-is.

Now I'm back after a night's sleep, bright-eyed and bushy-tailed, and
still not really wanting to look at it, but at least wanting to tie
down some loose ends.

So I just want somebody who actually knows the Xe driver to look at
that thing. I only round down by 4k, not 128k. I think the 128k was
simply wrong and nonsensical. But that number came from *somewhere*.

I claim that the old 128kB number cannot be sane for another reason:
the other side of that

        if (GRAPHICS_VER(xe) >= 20) {

will return an offset that is at a 64k granularity, because that's
apparently the hardware field definition.

But the point is that the return value of get_flat_ccs_offset()
clearly is *not* 128kB-aligned and never was, so not only was the
alignment done in the wrong direction, it was always entirely
nonsensical. It cannot possibly be something that the allocator code
then depends on.

Anyway. It all now works for me, and apparently reliably. But the
keyword is "for me". I committed that thing because the old code was
clearly garbage, and the new code worked.

But the new code may be garbage too - for some reason that I simply
don't know about - so somebody competent needs to look at it.

                 Linus
