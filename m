Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A3EECE586
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36210E54D;
	Mon,  9 Sep 2024 12:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="kfCVBj2+";
	dkim-atps=neutral
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31910EA92
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:08:20 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so4917181a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Sep 2024 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725635299; x=1726240099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8bMi8neSlk0H33MBuzRIDN5M+I0beTdNpKiekVDuiU=;
 b=kfCVBj2+x8fhqIqPEk/bLW1ElOcvkuJtXNTC2L8bmGc1LI58bDPg4JxSUSq/Settso
 Z+L7IYIff2le1T+mJJ7GcatQiNRM7ID+LDMI0F6HXLRWnRR5Kfl9pX3ymV/v1FI5uqEq
 A/GO6cQ481nCCpPiGkacChTc7V4yb5DRrnc/+ubTlYwrm5mZLhgq4IjusacokCfjpx06
 E4MGHhku2FGV0EloV8pMgdXiqsZhnlrdDaMiSvqxCGUExl4eMo8y8SEwKkfZfbSOyq9A
 JwNcs8n1F8W36+bzs+eCZ9Hj/F+OOylhHj+ScZxjVqWPtF8eRI+8wga/5esB8h5KSMn9
 k/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725635299; x=1726240099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8bMi8neSlk0H33MBuzRIDN5M+I0beTdNpKiekVDuiU=;
 b=s9F94t2vEBg41jBQPkXmOut1809HkQovE9w0oeAt0iHt1Bir4xSZO07kAsCBExvmtM
 BX5m7JbVUNPn42S/HLvtIcfG3W7fAVucvgCb7odiEQy+V6EYMUbk0A6ah2OrqxGTfu2T
 7MOy7X6Cm6U5J3oswTryPuqkodBPumCvh0Ynqjb3V5/uxLsYTU/dsxZy5NqUaHL0VefB
 2Otb8NfxBANZyXCaXQByNJOq5KZ8eA2h8jT2qx4HrnYItVzqEONTjlpXlk67uNU17YJE
 JVycT9MwNFb1yYYDflJ2Mv4ZyLnyoScy6rwqnGwokmLYVNd+/zzoTcFvpHjz40OBSGC3
 QDrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZEA9G1iS/bLXyQnE0IeK4sQjm81sXzpaWtoj/TjP5DFazb+ohcF3nLazuQxGRqei+HtxFAQZplw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjyKFi5dCSZsaqs3+Qcx9Q3a6C/2iZq7HA0qAH5q5r6SDD331j
 GZd1V+KD0cmxgY71TwOy7qJZC2Axv5F+xyOyEp2zPYFM9Ec4I5aKrdgA226+4Y6SDamDVLnL1dV
 VSVuK8cBHkh8kHtIAmkQy6bMlv2Wkq7uj9k/mqg==
X-Google-Smtp-Source: AGHT+IGUA1wnLPvaqVG65cpWb2qjjv+ZYvS15NsPxrxeFhQA7Z9cxOvMhyKovH+37PHRvGwnr/HounhIwA1d4bXQ4q8=
X-Received: by 2002:a17:907:ea7:b0:a7d:89ac:9539 with SMTP id
 a640c23a62f3a-a8a42f8af35mr889231466b.7.1725635298533; Fri, 06 Sep 2024
 08:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
 <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
In-Reply-To: <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 6 Sep 2024 17:07:52 +0200
Message-ID: <CABj0suDY3duFeZx8ghEJm3vTuJvcVuoYZ6BpYn9SCaHetw3oNA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] selinux: do not include <linux/*.h> headers from
 host programs
To: Paul Moore <paul@paul-moore.com>
Cc: da.gomez@samsung.com, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Sep 2024 12:37:17 +0000
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

On Fri, Sep 6, 2024 at 4:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
> > scripts/selinux") is not the right thing to do.
> >
> > It is clear from the warning in include/uapi/linux/types.h:
> >
> >   #ifndef __EXPORTED_HEADERS__
> >   #warning "Attempt to use kernel headers from user space, see https://=
kernelnewbies.org/KernelHeaders"
> >   #endif /* __EXPORTED_HEADERS__ */
> >
> > If you are inclined to define __EXPORTED_HEADERS__, you are likely doin=
g
> > wrong.
> >
> > Adding the comment:
> >
> >   /* NOTE: we really do want to use the kernel headers here */
> >
> > does not justify the hack in any way.
> >
> > Currently, <linux/*.h> headers are included for the following purposes:
> >
> >  - <linux/capability.h> is included to check CAP_LAST_CAP
> >  - <linux/socket.h> in included to check PF_MAX
> >
> > We can skip these checks when building host programs, as they will
> > be eventually tested when building the kernel space.
> >
> > I got rid of <linux/stddef.h> from initial_sid_to_string.h because
> > it is likely that NULL is already defined. If you insist on making
> > it self-contained, you can add the following:
> >
> >   #ifdef __KERNEL__
> >   #include <linux/stddef.h>
> >   #else
> >   #include <stddef.h>
> >   #endif
> >
> > scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
> > also discouraged and should be fixed by a follow-up refactoring.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  scripts/selinux/genheaders/Makefile              |  4 +---
> >  scripts/selinux/genheaders/genheaders.c          |  3 ---
> >  scripts/selinux/mdp/Makefile                     |  2 +-
> >  scripts/selinux/mdp/mdp.c                        |  4 ----
> >  security/selinux/include/classmap.h              | 19 ++++++++++++----=
---
> >  security/selinux/include/initial_sid_to_string.h |  2 --
> >  6 files changed, 14 insertions(+), 20 deletions(-)
>
> Similar to patch 7/8, please read my comments on your previous posting
> of this patch, it doesn't appear that you've made any of the changes I
> asked for in your previous posting.

Sorry for the noise, Paul. I=E2=80=99ll review this one as well.

>
> https://lore.kernel.org/selinux/317c7d20ab8a72975571cb554589522b@paul-moo=
re.com
>
> --
> paul-moore.com
