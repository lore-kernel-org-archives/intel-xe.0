Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F5AC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 10:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6FE10E386;
	Mon, 29 Jul 2024 10:08:02 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4E10E386
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 10:08:00 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6519528f44fso17469557b3.1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 03:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722247679; x=1722852479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwTfVYSGl0qov4UkTwnmIUGjC6ZGnXwHCwIWbd4QwcU=;
 b=Izm3c+jUvhX+8zOiJbo0CLXP5+kFXz0KrpaMtwrzg+8gUAThd7yYIB54/rOnShLaDq
 e6cDDbSMVjMREQTEbMu83y7tPiJuZWXv0F+IT3nfa41yzKe5oT7bUFIsOE18je1ldq5y
 pOc3Pgr4Ej8d9Pfbi6z03kT2g9YW2mQY5C/dKaH1cl+22VnKSbpAU3588SaBOOlm+5TK
 6ilzbRer89ONmrV/jeq9wiZ1nds7Gz/ZnBIxL+jV9R+g9fc9nyXQVnYHkKjA1KKZ0Tw5
 LLkLTS45f/BxAb1xIYQ18KWWYF7SDd1SEPYNqmZRkDyG5d2xoNN6MrRD+eyBpBT/VGpU
 NrRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQsYQLELADa0lhDBPioPVNhLjRh8l1MoZ95gRhs58oq1QHCIM6ontWeBuXqT0VwHOd8Hl5mJuziMu1p0sjJAPoYr6/XP2diFLi1uXI8IM=
X-Gm-Message-State: AOJu0Yz80O4jtwy0IFvXch7l6vOxadQc14IZq2GW4Fs1EoA6tXTkgh//
 kUGf4uNIu/TwW4LDwxY/Qmw4SoP3DBGfis8YSG/DOQdMs4ZU1Vr7xJ7B79RE
X-Google-Smtp-Source: AGHT+IEavbES/mqGbcJOthWLBzftI7CDIYzSDut4ZooS1gwtgyw4yZAdM1rEBudqe4Ki9CtVZ7GGoQ==
X-Received: by 2002:a05:690c:a96:b0:64b:f86:b7a8 with SMTP id
 00721157ae682-67a06158d2amr88222357b3.10.1722247679086; 
 Mon, 29 Jul 2024 03:07:59 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6756bc9ec37sm19629467b3.106.2024.07.29.03.07.58
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 03:07:58 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6694b50a937so21588857b3.0
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 03:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUW5y9mt4wk0yVS1xYPyyI93VszlViyT7nz7ZdrAB3B0NUKv6k8m/ER9OX82NzNxBgQqJdA1MBdNAgbHzoHewdsZumnjzrtv+MHELf4z4U=
X-Received: by 2002:a05:690c:6203:b0:664:7b3d:a53f with SMTP id
 00721157ae682-67a0a7fba7cmr91084297b3.45.1722247678607; Mon, 29 Jul 2024
 03:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiyNokz0d3b=GRORij=mGvwoYHy=+bv6m2Hu_VqNdg66g@mail.gmail.com>
 <20240729092807.2235937-1-geert@linux-m68k.org>
 <bd4e9928-17b3-9257-8ba7-6b7f9bbb639a@linux-m68k.org>
 <502ee081-8e09-422a-a1f9-be40aeaa84fb@app.fastmail.com>
In-Reply-To: <502ee081-8e09-422a-a1f9-be40aeaa84fb@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 12:07:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUepTM9v7Oyakv6XQg9iw7t08ggGX=K90zRXxm4Ffpjg@mail.gmail.com>
Message-ID: <CAMuHMdUUepTM9v7Oyakv6XQg9iw7t08ggGX=K90zRXxm4Ffpjg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.11-rc1
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, 
 dm-devel@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-btrfs@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-hexagon@vger.kernel.org
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

Hi Arnd,

On Mon, Jul 29, 2024 at 11:55=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Mon, Jul 29, 2024, at 11:35, Geert Uytterhoeven wrote:
> >>  + /kisskb/src/kernel/fork.c: error: #warning clone3() entry point is =
missing, please fix [-Werror=3Dcpp]:  =3D> 3072:2
> >
> > sh4-gcc13/se{7619,7750}_defconfig
> > sh4-gcc13/sh-all{mod,no,yes}config
> > sh4-gcc13/sh-defconfig
> > sparc64-gcc5/sparc-allnoconfig
> > sparc64-gcc{5,13}/sparc32_defconfig
> > sparc64-gcc{5,13}/sparc64-{allno,def}config
> > sparc64-gcc13/sparc-all{mod,no}config
> > sparc64-gcc13/sparc64-allmodconfig
>
> Hexagon and NIOS2 as well, but this is expected. I really just
> moved the warning into the actual implementation, the warning
> is the same as before. hexagon and sh look like they should be
> trivial, it's just that nobody seems to care. I'm sure the
> patches were posted before and never applied.
>
> sparc and nios2 do need some real work to write and test
> the wrappers.
>
> It does look like CONFIG_WERROR did not fail the build before
> 505d66d1abfb ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
> as it probably was intended.

Indeed. The actual regression is that this turned into a fatal error
with -Werror.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
