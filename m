Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32167C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437D10E02D;
	Wed, 19 Aug 2026 19:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NL257vv3";
	dkim-atps=neutral
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D3110E094
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:31:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-69c108fee7fso2233151a12.3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787167884; x=1787772684;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZvM++zWE35JZ0EuwwCczeFEIRqyaMO3WW3zX3kGMupw=;
 b=NL257vv3d+DlH6HvTJhp0JpyT65mbPA+TTdXCgMCCGCiX19omuKD+k+AZwlBdSkMFD
 pY5IlsW2yU8YE0q7ZhfGuWBmEt/+RxwzgFJIoG7U2fCAHp7rpHVBdgh+Guh3r25NMCXA
 KVp2F/xi3ttuLjbjTEn3WmNPaSZo+uPPpfHrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787167884; x=1787772684;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZvM++zWE35JZ0EuwwCczeFEIRqyaMO3WW3zX3kGMupw=;
 b=KwFBeIRDZPS+3eK4gJ8ED9GfalKE+Elg/meSl2abU8Xlt7ht4iHSCSgeyvufUzxqdM
 jqf4KQJlyRWSRtK3Y3tx0ePKyVv1w1+b1+LmEB5R23tpn/1k9QYnfqr0RLRcUEHa3V6d
 ImtrqGh75RDZkjG5zKp4snIrQfXAuZ6uCwrirD2KVSupxKruC9rX/0pf3FnXiYxuKGJ2
 rKBmrPUEC9M3WN3+Y1bYJK/dpFTV+25jl8uKWreAOHG9ZUMXlOF4xA8ox0eNiOfQvkK/
 te2YBTJ5HHFhO/ocTkw03jOlmInhRCJujVEfhIB6lyH0TrX/SMdEB2/50tbhkgZrhyvu
 pkxA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpa1p2w8I4FOosz2Qrjle5G6271mhbrlWtmyJnduicPsfyl9BQH+zhCF0lf9CzBizbQRv2Nee1yww==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyENqm4Oa6tr1iendRmgtCSuIlxpqah1xssiylOWq34ADBJVFA+
 uMAQpwIn/pa8MBQGV6ozDLeqHQ9Tt7bp1yFSeQRnu45wLSVGsEWtAANEX+GS2MYyylrOIdcGfcc
 t0iQTQpk=
X-Gm-Gg: AR+sD10VgtOH7RO0Q1SF83EA3YDimmtJy1tI7FvwdJGsT9bfZlvqZOSKYXGE6lCjMvy
 p/Bgc0HBrL30VHQO7e0K//TCNY5Ssc8AZgQXTNso8CcVJ3aT0pYQ0FFKtlhEHBiNK8j2X1DCUxe
 ldr+JBqVmEWxNkwRM4CENwMHa6ZqvzpHIVroWkUgH8/EToVJ7DJrhTFyXAhz+9+dVT8WuPkQFuU
 5XTuv23V4vBfniKiSW/ZHN1ZwXRgphGkIyslJ6JKXURpkyf9puUM8JeDDYx2DkNLXExcXrsdUdZ
 LeGKgq5BJf3ZCBhPvwR85bA4w2yG47qV4R0vRPvBA601rwRu/kjTNqZsUatiYauXnjMW4pGIWBx
 z3+3FUO1XZo0Xo9b3b98hoBbYXqJRaC8iqo7yvxuy14Jy6yONWBbXcbno8DFgVZ690ykHMdn3z2
 Trgt2hJ+Q7qrSurXEJmF7FdrshuRXzWbe130KdJXDDkCVJCUSFyPpq4pR0UoQAAVByySCCZvYzV
 1KO7tJomV22DQ5BVXSxVSeFV6dFGLT0iJiQ3w==
X-Received: by 2002:a17:907:c789:b0:c1f:29ce:76a1 with SMTP id
 a640c23a62f3a-c23f93018a9mr533003866b.19.1787167884331; 
 Wed, 19 Aug 2026 12:31:24 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c243c78a484sm119616266b.26.2026.08.19.12.31.23
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 12:31:24 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so193489666b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 12:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqT9cgtLjletpMj4IIrkA79FrzZhHdseiCZWHju3hwMjuU/NI5BoML+JVZjRwAR6Ybmw8ftkaBLdw==@lists.freedesktop.org
X-Received: by 2002:a17:906:ef0e:b0:c1c:5aa1:de57 with SMTP id
 a640c23a62f3a-c23f92c35edmr510964966b.13.1787167882929; Wed, 19 Aug 2026
 12:31:22 -0700 (PDT)
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
 <aoWHKmz17HQo2uy5@gsse-cloud1.jf.intel.com>
 <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
 <CAHk-=whskfzdWdUs3NwYm+e9py91xdiG5mLfYf=g_6QLpdaP4g@mail.gmail.com>
 <CAHk-=wjr-6qT89G6TLAPPYpzPbq-JYS0C5e4i_KAUXwNzeStzQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjr-6qT89G6TLAPPYpzPbq-JYS0C5e4i_KAUXwNzeStzQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Aug 2026 12:31:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wij8MOxRrWqeCWzAaFr=zcDxOiXu_2jwAwagBxyN35Ekw@mail.gmail.com>
X-Gm-Features: AcwNN1XhQOXFxxzSI0Z1whZuW1PyyMF-vSEMPXVZhrPSBP5oHt9tD_ds6YZfnMo
Message-ID: <CAHk-=wij8MOxRrWqeCWzAaFr=zcDxOiXu_2jwAwagBxyN35Ekw@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
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

On Wed, 19 Aug 2026 at 10:25, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Update: with a single 6k monitor and no rotation, it works.
>
> In fact, it seems to work ok with a single 6k monitor and rotation
> (orientation: "Portrait left").

Ok, that was not true.

It's the rotation. I can change the rotation dynamically, but then
gnome - or gdm, or whatever - remembers it, and the next time I log in
it will hang at login.

So even a single-monitor setup breaks in the landscape left setting.

                      Linus
