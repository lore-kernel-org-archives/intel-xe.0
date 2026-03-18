Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69496103E162
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 10:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DF410E7C6;
	Wed, 18 Mar 2026 10:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="M2DQgzVr";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E462C10E7CA
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 10:59:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so7612690f8f.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773831573; cv=none;
 d=google.com; s=arc-20240605;
 b=WdbzevvffGuoE0aikDD2k5G40oNAwcKwnrMo7zub4d0pdtN6O7NNE65yxSIcFsKhf1
 ZxHJeZ4W4d0lvv14OobPsbPaN9PXWATd54pMHdlf0wkSHKWZgCTJWeImlfzC4ERn6dVc
 cJMf25NdyQ83fwxfJiaxjvDqNTpq/ToiHPwBayNSwv2/oH/BX5xLTRi+0PQHk8JQSxgY
 gtJkVW8e8OtwN7OVR6tgwxbUhOA4htqIyB1d2855Ywp9tF/bbdwwKw4yXmONxnyF45sZ
 sSmwghjQpPNjm8nrBhKqHMfYnnq4jY/Tlqzd9nRK3YGHFtbpSMhpR1AN4IifzLQOpmWM
 9c2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
 fh=MB7CN+h+RlYJn4amj19T84mbDOOBUYlgz4qRMhfoWRY=;
 b=OsaNrHgaf1QaEQsyDnqg7t7UN+7yG8v0xbwaW0802/qjcJd7/3Vj5DFrMZVnIF51Na
 mQ72E+NyNoaIUtxrEPc1U5w8fEqo97Sbped+UD4UBBqye80PE/67olkzTg6J7u2naydq
 +bGPAUUYJTLbZGFuZwyX/trju6EpYLlI6JZDGBUoj/JoKneFsWg2vAoTCu2E+Zr2qdTl
 IF0QqoE1S0rlbz97n5BnrcJVdw4U+eGf+YkCD+gT9n3LcB+ziCYItDsHfFqfUZ9BMNfO
 u25q/NhU0Us2j2j8+On+SwIkEoQ9ibziOIESbuHMMIrHqXuQVQWiotMN09eSvwGvBdIb
 BebA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773831573; x=1774436373;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
 b=M2DQgzVr84yXEVMqD7m1rOy1PmrZSyfCJ6pUcIW1kXgVziu748Qx017IGOnlWeDiVj
 6zwtaSX9bHnbLh0cK39Vaza0wwoO0Ybxpcky0D7mqK4A1/QjxUVeEnURpP/HPnRDgd4h
 q1ow0Nkf+2DTbD9FvwzS/lOMk98M0o+P2O3/UZ/Qzjg1DQIHD6ea1xrZsbRE6IVg0vMV
 c11uH4eYuyqQIN6bei/j/4D2NoKWBpy/WlmDK5Yj89SX5u8HoObVIE8KbYvs2+dIU31a
 bZRes96np7tOlq+UhKk4jSQmkY48DeJvZIcvzFpv2idx/S7c0C9GK2iY/be7+Ht1dvUp
 YxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773831573; x=1774436373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
 b=on6/F1cd64yPj3kkoVc4GZluCt+2kdyjGlO2rxruY+xr0QsbRIf4tuNoKpUXnqqwu8
 sf/4IP3BX/yUpG6UZOhQLdJv334frEXutYouFaQMR3qo+jrSoHDimT6MkTMnVV5UqYjB
 p2UHmqN2M0cGVpo8wEn1II/Tqk9kaqU8ONJbsTk1eyZBRGHn5OoLIzE4f5Rmas6A2vnN
 FM/pdbZ4sOcafqKWxQMucdmKHHfFq0nyqA7YXI13sPDLGT1H4I908Sr8LH23Bn0F899u
 +XWUKtl+QHztXY1kQoUYyCr/CVgQVKqvq8WhHhRF1J7LpXIdKfmIHKuf2+SO3xCBLxWd
 bpbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXunIkkeR9f80KKZIarTY0prN3zOsgLX3Vo4tlIp422vpRClVFMqg/8ph/yyXRAQxpABt4BD93kFw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAKc5h0XJmqtY3eqUOzrhvMUZYwOYR7TQ7Xai5wZ7PHWUSwhM1
 kcjKjVJNLNSM3YtiPaEdLwjcFh8XDJQ8pQiJiE6jZCYBCNm063KTExj95qgzgCPeRIh2RJWLoCW
 QyH4YrCNsJXEHcrSBOcanct+A8YLeaUFktLgKDiyD
X-Gm-Gg: ATEYQzwvxxDeZ6TWWikixRm9TLbL9tRcjY0w0dozvZgNR9fXjpIQ+H3CvYUPQti1EFC
 wkyht3/KP+rAkNVNmWh9cwAyo5FfzC+jLYYCr9FJMMnV8/SZmil9idSyJK0S8N4Qq+5xrNs3D39
 6Hg/A1M0x9OH6/4yJMAtejPHV//ZcIFAzMc2wGPQvbWUhJRP5CxLPFLKAMyKCRGoqOEI0f87s2S
 WhrVmw5lxlXBdus07EgYKNKSl8ssemBTkWU494ByjLmHoyJdVZ0R+PYobqTrTfFNdenTFC9zxRs
 DinzpcQzmt6TZI/lD+ooVF8UdABcvozMPAMFc1zrCxbw7ICo2BX/aIOq1PvYUnp4yanrrQ==
X-Received: by 2002:a05:6000:2dc6:b0:439:c62a:6dc2 with SMTP id
 ffacd0b85a97d-43b527c8385mr4835579f8f.41.1773831572498; Wed, 18 Mar 2026
 03:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
In-Reply-To: <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 11:59:20 +0100
X-Gm-Features: AaiRm53Ixe1xgNfLSphN46y2ra7z4xTRu79njkh2iKHrEPi4sPbqBJ9Zi7PRuxY
Message-ID: <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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

On Wed, Mar 18, 2026 at 11:53=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> On Wed Mar 18, 2026 at 5:59 PM JST, Alice Ryhl wrote:
> > On Tue, Mar 17, 2026 at 04:18:46PM -0400, Joel Fernandes wrote:
> >>
> >>
> >> On 3/17/2026 4:17 PM, Joel Fernandes wrote:
> >> > Add a new module `kernel::interop::list` for working with C's doubly
> >> > circular linked lists. Provide low-level iteration over list nodes.
> >> >
> >> > Typed iteration over actual items is provided with a `clist_create`
> >> > macro to assist in creation of the `CList` type.
> >> >
> >> > Cc: Nikola Djukic <ndjukic@nvidia.com>
> >> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> >> > Acked-by: Gary Guo <gary@garyguo.net>
> >> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >> > ---
> >> >  MAINTAINERS                 |   8 +
> >> >  rust/helpers/helpers.c      |   1 +
> >> >  rust/helpers/list.c         |  17 ++
> >> >  rust/kernel/interop.rs      |   9 +
> >> >  rust/kernel/interop/list.rs | 342 +++++++++++++++++++++++++++++++++=
+++
> >> >  rust/kernel/lib.rs          |   2 +
> >> >  6 files changed, 379 insertions(+)
> >> >  create mode 100644 rust/helpers/list.c
> >> >  create mode 100644 rust/kernel/interop.rs
> >> >  create mode 100644 rust/kernel/interop/list.rs
> >> >
> >> > diff --git a/MAINTAINERS b/MAINTAINERS
> >> > index 4bd6b538a51f..e847099efcc2 100644
> >> > --- a/MAINTAINERS
> >> > +++ b/MAINTAINERS
> >> > @@ -23251,6 +23251,14 @@ T:        git https://github.com/Rust-for-L=
inux/linux.git alloc-next
> >> >  F:        rust/kernel/alloc.rs
> >> >  F:        rust/kernel/alloc/
> >> >
> >> > +RUST [INTEROP]
> >> > +M:        Joel Fernandes <joelagnelf@nvidia.com>
> >> > +M:        Alexandre Courbot <acourbot@nvidia.com>
> >> > +L:        rust-for-linux@vger.kernel.org
> >> > +S:        Maintained
> >> > +T:        git https://github.com/Rust-for-Linux/linux.git interop-n=
ext
> >> > +F:        rust/kernel/interop/
> >>
> >> Sorry, I forgot to add an additional F: for the rust/kernel/interop.rs=
 file.
> >> Danilo/Miguel, do you mind adding this when applying?
> >
> > I think you should consider a mod.rs file to avoid this. It's tiny, and
> > just re-exports submodules, so I don't think the "mod.rs name in file
> > view" concern is that big, and IMO having files related to interop/
> > inside the directory is much better than having them outside.
>
> Ah, so there is a rationale for using a `mod.rs` file after all. What
> are the project-wide guidelines re: `foo.rs` vs `foo/mod.rs`?

I'm not sure we have discussed it in detail yet. Both are used in-tree.

Alice
