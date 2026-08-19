Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BAEC5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 17:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1431910E81B;
	Wed, 19 Aug 2026 17:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B4Sm1BPn";
	dkim-atps=neutral
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5E10E81B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 17:28:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a0de062db5so2399933a12.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787160536; x=1787765336;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JsZDOLFQ5v+IFbwO/zd7yRV9FVC6FQBQ7GYql46OtHg=;
 b=B4Sm1BPnUsnls7Dj7ycD6tj2QwKptDBeZUAmpyMicAD8kj6qEQK6N4uCfIe5zi0kDS
 VG+GTsiVz86SDYDKsWr6nfBIzpBaeUr7dItM7tj+hZzt4PhxihFwdwwOijCC9A+u7d6m
 t8FPXMdDeitCoqGUOEjzM1o5PMm4WpzXd24UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787160536; x=1787765336;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JsZDOLFQ5v+IFbwO/zd7yRV9FVC6FQBQ7GYql46OtHg=;
 b=Od2p36+eAQnIq0f/GajZYrSSAVBkDeo1CZXAOir2+Cr+A8AbpS5UEg0LCOsruMcK/2
 GlesFpUgzsyEu4bsOzNjCUlpcNUibOMPF2Tsr3vTmJCexRH2rLh/lY/acnMP79ZpGRX9
 EQPLVntDj4lG3ow+iQWnAjOZ6RHvUWqsW+ZtyJ+Su6XZGOOdrfRbqQsSyg2ZzUO+6i3P
 CmkWPs2dzoOnfocsA9d4IWS3yVcu3tODFQvO8X8CgPrr82fgzyFWkyuQ/LyLtczfOVrL
 oa9JeJZzwD2br9eh/ZWPQFDkoUVYjGFmxUwEaMuveXu8zthmsVzpx+ODU0iMu8NhcU6L
 xPeg==
X-Forwarded-Encrypted: i=1;
 AHgh+RomseEoyNpEFqvl6aVH8F4EqaFhrwj3MUOwunMLBJgqGu6dxbR6ByKtbZJOv1/v7CkR3704xxnO1g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyolk4t7WAy4bxW9e91z/IFKLV7E2dHahxZNQ0CVbCBH8sOGJys
 T9vddLsx7oa2T+0siqWYFm1hfexV1lAD7X4Oy01dicHB6f1OKXjZZeUQMv2XntXoqKMdc6+q3KE
 McRmA1SM=
X-Gm-Gg: AR+sD10qyvNfpCLLArJGu+wQkV8j6Yj78eggRGcWVDWKivHv7LGl2+lSuhes9KXnUKu
 zcTyfKLiCQxALSk7rj9fzqwrk3u8V1guBf7FTv5+YFZbkCqzjlTTeg08vETCrKX1mtMSTZcjIRR
 /ZFY6PHOccDwRicO+4v+LKmnATtJ3T5S5x6pFvDcdxXdLci4hrY7IpviR7584ODT1Nc1Ea3tkIH
 sX2H+TA0cZ4yrG4jKvlShz7Uz2WIGA5bo1Li0dtfdY8GSEg9YvEsLTUvqIbDEg6SE+t+ppRGBHo
 99lHvqvTnR47w57q7V07d9c4nsOinu5mvPeB4ssFRO4tLH6FX6B+DsNV3oGdl2X4D8WTOsRYv6X
 wH7Nwge12XNq3mxOKAHd6M7TVjpDDSIwxc52+C5wgrbwBXqesHNdSpglN70Vk1cTkS1IrQL/JEc
 CMzjeEBWPvFHYBKdIGd55IO3rx3OkGWKX9ZrpJcY4iZoqEFrxUVf3xMdJhyWLvG5fONZgqrfR+W
 vW7NhTVB1Ae/FAET2d1KxXvbZX0dg+cUF11GA==
X-Received: by 2002:a17:907:c788:b0:c20:5798:7b9f with SMTP id
 a640c23a62f3a-c23f975f17amr469995866b.10.1787160536469; 
 Wed, 19 Aug 2026 10:28:56 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c243c277ba8sm112222766b.56.2026.08.19.10.28.55
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 10:28:55 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c197eaaab00so230589866b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:28:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3uNwjhNax/tG4pyPGe51Y6Tbd3MFtnLugfG1cGRs+dkkdlOXYYUiu5YigVHOYI5rZWQD4JyoaeA==@lists.freedesktop.org
X-Received: by 2002:a17:906:9fc1:b0:c21:1b58:fa96 with SMTP id
 a640c23a62f3a-c23f93177b0mr382367766b.3.1787160535026; Wed, 19 Aug 2026
 10:28:55 -0700 (PDT)
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
Date: Wed, 19 Aug 2026 10:28:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiioVSTWh3Q2889p+6y8C3-SrANxSLaBn6W5MBM+ddMbg@mail.gmail.com>
X-Gm-Features: AcwNN1VnqZvZU7mUOFRPyt8O_mCs4mVbHHiaZyNefQ3LWySeSDyadeAkFCuEcag
Message-ID: <CAHk-=wiioVSTWh3Q2889p+6y8C3-SrANxSLaBn6W5MBM+ddMbg@mail.gmail.com>
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
> So the problem is triggered by my insane setup.
>
> But I'd really like it back, because I'm a little spoiled princess.

Oh - it might be triggered by fractional scaling too. The thing that
is now working for me is the 100% unscaled mode, because with just a
single monitor I end up wanting all those pixels to do all the work
they can, instead of giving me nicer looking and slightly bigger text.

I think my old config that caused problems was using 150% scaling.

Did I mention that I'm spoiled?

               Linus
