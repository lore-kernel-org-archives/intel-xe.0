Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC3FF483C6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4085E10E56C;
	Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C/o80Yno";
	dkim-atps=neutral
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1807910E1CD
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 19:41:39 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1277863a912so494723c88.0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 12:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773776498; cv=none;
 d=google.com; s=arc-20240605;
 b=i7t3J2Kca/6v98w/22IomcUe4sMrMoYUxoy2FHDvW0pG3BDiCcs3c0cEq/blwbKgg0
 6DnHeyyagI7nGEHmwqtbZmEsDj9toH4/O6NcKj//p3JzIpR25hnILJWFd+c+HT2cJLIf
 wTRp4SIddKZvCSCtLdz3efXTDZf05sSbkL7yZa7hJYIYWWZX2M3uW/HRqK7dWoffpLLr
 EV0fF2BGK+oVla/Bkwgh8jbN1oprZ0RkzK9L7y1YjJ9kmwBZrhLLVeY6/Hy9VHtSEQbv
 tIFfwQs+Yc5JWEnTj5qVeYzmNiQ96Skn5asU1LpFeHTz1tb2zn9VQ/6nbkYy+UlsjTsc
 x4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
 fh=yxFrEGkhk+8OoaYapaERnPNAwFfTz/VDePolT5VeGzU=;
 b=UkqPu1idT8LzSX0uEhycCBCzo2/79FxgJvfpCjnL7kWd9E6+s6zD7a/1IptASgldff
 PZ73ICRowuTDDaRPPpuBm9bKZ+h24xnPbZXQ+bRlS1YDw4bNfBMpnttjHNyv4Phs26WL
 LDtqtLjTBxBL17IuklDGh7fA5+Ll4QpC2Rh6v+CyQNnJ+CpSAm7R/aPEPFRnfZUXRphg
 1/xi1W6Iy9UvMBGuLRNynu2IXWcyym0e+AXbr0lf9EYZuXPziFyLZAEQ3zfS09XQCzLe
 ReIPmUxgeyfxdzEhCH4aFOmYzuaInCqhtZCeuL41tht1w3qciCVxD58ICBEOoXaYiM44
 /4Gg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773776498; x=1774381298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
 b=C/o80YnoVsKEcghoy3LfrSG48rHjFCA1DRi02BzMgMRuw3YrRfPj/LIt9WlUrHtJVc
 JHzYzjD+Agrn/akzS3eBqn4rEqQvwK5Xy+I4Q3afh8W5eGKPD+74OiSbzfopb1g7/Gb9
 PxMgcGXezJtx5PYPSXTQKJE0g2ByxOItDN37uQTrGwUCiRX5kRYqDM0Hlz1haVkKwOds
 NEcPTRf9ZXmikk1x6chX55gYHZAiMgPiZ7cz7GVCZQRTw2847mm63TLmsj6gC4f8dtPW
 Q8adLeepG5of7y8qtj7aKY4gVSekLg6Z/hRRjyppB3HYEbbbfbHYk0c5Eljmozuqnhga
 HzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773776498; x=1774381298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
 b=g3DNELKfbD4zB49LOtLMn11xm4J95nNKn2lkjdz+HXaAp3lsRz08SBdk0DACOXVWjg
 /XXJuWGI0mrYhbmoh4KLGkt5IMSY9fQYfida49qMEIORwvXiHGSbL4T0uo48gCXEetcE
 TQYMXHn2nWvECxCm5lBasJd81pbNhfE/neh31gzcPkkKIoOk/yrWYW+2PXjpmqOjRJBL
 sGb0CCqbPH2xEGM4GJE1mUSp6sM75DMz/AXl8M5OLv4keWsN0xK3xUL/yqU1Jod7mprK
 BQW6qde+0u3K2vLrV5CP9Ti5TFGu51k9pHswwBQeiG5k7koCvFw6U5t2GfZN1Cj7nCBM
 8T3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLbyjyd9nNq4txjnsTfsnrJnEPHSd5CRCS24OnepzCaahfA5+W3/YFleoYZdNHHtJygYst3bAs4A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBKSJWgx53u8oD0XIsbTgJ9G8rydSmfUwK37GGkidrYCsmhQzD
 u97zbZoGtDaG3pjuQ1jfbfwhJ639Q5lfngXMkpDh4svyHqnSAkZBZIqeHJF1tV+0hqMEeJaeY1t
 vMi45hD+1yoQhR+FnoODBERd1m0XP9AU=
X-Gm-Gg: ATEYQzxDAQD2kKbcGcb8/+1Jjkk/2MvjXG0D1Zon2U3OEZMUD+Mk5h+RoqlnMG/G0Tb
 bjS4xLwe4gdLaHjQIXtiXoXfCIa7D/zfVSvaF+qgEEK3Ai1wIOJ34j+qT9S4QI2rZoDV3qthhnr
 aba0Jp++kT/WgMbxWbQuqLtD74K3BrOif0leL/U6BbuBF9uWD9//ld4qYYRzyR1Ba+qYygrtDMt
 ZMhNhZPNBOzv/mTHImOnWqXNDzfR/v2a5qw5MnGDKew8Np8CkD9eQEMe9SH3APRT3JwNIxXSAIr
 7UZ8e27ZBAm59wzCYwEpO0YjsFHo7w0xWZYcXTC4suLJeiKCZ0H4Z7kVRuSgompINtRGm245Ikw
 1CFXeWE/Av3JZ36oF78AkB9o=
X-Received: by 2002:a05:7300:dc8f:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2c0e5267586mr145307eec.6.1773776498156; Tue, 17 Mar 2026
 12:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com>
 <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
 <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
 <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com>
In-Reply-To: <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 20:41:24 +0100
X-Gm-Features: AaiRm53yINyatDJ_WJZjRpETpmBvLRs2cRRQIisdD6TKDINCtuP52WidZCuGK0o
Message-ID: <CANiq72=gHArzFS=SkiZyPpEfSL+0AcU3ifKRnwfEyet42662PA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
 Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

On Tue, Mar 17, 2026 at 9:27=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> I hate cut off in thteads.
>
> I get it =E2=80=94 you=E2=80=99re a Rust zealot.

Cut off? Zealot?

Look, I got the email in my inbox, so I skimmed it to understand why I
got it and why the Rust list was Cc'd. I happened to notice your
(quite surprising) claims about Rust, so I decided to reply to a
couple of those, since I proposed Rust for the kernel.

How is that a cut off and how does that make a maintainer a zealot?

Anyway, my understanding is that we agreed that the cleanup attribute
in C doesn't enforce much of anything. We also agreed that it is
important to think about ownership and lifetimes and to enforce the
rules and to be disciplined. All good so far.

Now, what I said is simply that Rust fundamentally improves the
situation -- C "RAII" not doing so is not comparable. For instance,
that statically enforcing things is a meaningful improvement over
runtime approaches (which generally require to trigger an issue, and
which in some cases are not suitable for production settings).

Really, I just said Rust would help with things you already stated you
care about. And nobody claims "Rust solves everything" as you stated.
So I don't see zealots here, and insulting others doesn't help your
argument.

Cheers,
Miguel
