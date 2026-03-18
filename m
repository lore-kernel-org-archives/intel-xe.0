Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD94F483C8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887F310E52A;
	Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRtVHlls";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DC610E153
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 14:42:00 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2c0c9994199so147932eec.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844920; cv=none;
 d=google.com; s=arc-20240605;
 b=dN2K8TCVgAilzu7ek1SzIN6ZjraeVVFYKFqlifFlSRMD/8t7ST7oYIdabzqFOZvvb+
 LfQzyz7cqlgzPLwH2RUP6t7IOJfxelHBeKKnXab+OpiaHZFl+4I/LXwxG2s4znbsYy1L
 uMfh10VpIryNBJkpJD6cit/1qXNGhr7YUgbucoH0wLqfT4nyM2+p8b/l1/CFza7sDPUy
 Mw7lCF80OWTwK2xGJ1LlCtRdW9QqLZ0NiHjryvWSLal1/CNi27fFHvr0wmU21VwOvv/Y
 qxBbTszJ4B+HfQurYG8u07RMUgTf1AJ+Ju/UG6DEs9lPYesEHg8iFkm/vgvOHyEW11+5
 OCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
 fh=05rnzo1HDHn0/rU5lq7nYBw3ClV4FuuhleKQR9swu9Q=;
 b=Mpciq248M648xylIpsMDuLqssm8bzRQg21+EWzZ0IQThnaV5LiUsab6M+TyS5xpc9c
 NeIMGc1O8N3Dz+M47mL0l3nbgmAO/L5eo+dgRqLXORhzlkq9coMTexnr91HvA+WoXEZZ
 9TGq0ZbHBdplwso7tbsbPV3MjW5+mpTwXdJZWcwsKx5eeJBLv+mUgu2AmZy/+JLX7/jf
 czMATshaQOUIUqDCONrIhVLoWGi1Zv3eQfzIl6u9HdtZEnLp834mlIZbkhDI7igIGLO9
 IjEmdnEUBOmgNT4grKTvwvIoY23Xgx/BGgFYKRpvrdU/VaKWw1WcnPWOX4oH2Wg6zT5/
 wMFg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773844920; x=1774449720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
 b=VRtVHllsYbUfS99x8ZJ5g4p32kEK+wtGik6SRcit90VBBH3EYlfQvrWNK/tzalFF1H
 8wZkA7EkU80PjeueroLcaAIw9QUWh0vkexlBYUyjfR8smumbcQbUg50DdmaGxRhpf1CN
 qmSE+vyb4lIRosAVGh/7tpW5LldPt5aSoI6zTzlzK2nMsVqoIj+/IbT8MbdxkaXcQTgk
 3qNAT1/I1MJyie16WYZrzWbXNgWmd2ksC636kT67MAXZpBaJaYMVQeXoyvqAcdzV+jBo
 emYB/hHO63xnRO7ZqfTZbwbhWeRgeIPbJQ157/IUZqB5lz/o/3g50Ou2B4IvpBx7vlfM
 50SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773844920; x=1774449720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
 b=klhRfbrkOBHNH9CDoXUkjbIgQ7Uom3M4HP921F4LOt2yykx/xK1Afi0uz4sS6MEX46
 xQDuYYJ3z26ZhMYKH4WymFkpzrO3DLumPF8xja8B3oVv27rowLUefSuDIfPYnvKD4WgL
 gJmXDKb4yRM3jLxi6YME4rl8lbTurMgHFSmQxY5NEjJuUJmCuHHXJZVhcvYI8LWMHpej
 RXDjxUMpedx2W5RcnKcmyyG9XuX1jVlbx62LOk9NIvy49/iAn6vibOAJSdNrlrKimU2h
 xJlZ2eFUU96B28W0JoZarkV1B3RhJ3Dqv5gJuCT8j0cLrMOO8dO4KV9u2Bwt0ETDRQBJ
 1egw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjVKLwnVQaVpNuf6i0Boto+Vk9K89yqlxBbd2sNd0dIbyNiFhJgtp8lC5K/1rqjLU34wzi7u35VA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSfgATuTPHDWFwC+iZne0QqppXyYES4GL8Kwnpy8FcpaXf0Bkx
 TYYqcPlHJ52LP4BoNtzx/UXa1A3lf2qC6o3v1YEax0hCV+4XpEIZpZgPpIYeOei2sHylbqyBz3y
 3HOltnNuEpv4cP5+wW6wCwHH8h48zc98=
X-Gm-Gg: ATEYQzym2/mXL1EXqso00t/ve3kdegqFBQ4mxzEcXlfk20+1TVDa0HWObhl8rR1QeI9
 cKUHUdwQzYcbzncT2Hu4/mynnapkQA0ojlHKk5xEqyU4UFHh3UyeTFt2un5MmCUqU8BomMvehnp
 ly1cCJqrgibKVPYfOoR/y6qPbRqB/RswBgMTFI5fcmMsIwPXv/fJA9JvZK+ek8Gkwv0j7ubPxDT
 n55J0N+HMCwXeMcs9dIhReuvuZk+LG2EdZ4xs0d4HdRjbboIIfx4h6sjKEwSDBpqVCcyz5s8cpM
 nvDIuVwWJR8vEdPUumulcz5h7xLvkkArSP9/pTRJoMAjuHPCqiBaLCRuZfLgDzti1daCDbsyIw/
 pfCTHTmML9AzlSXrJ10hEp6Q=
X-Received: by 2002:a05:7300:3724:b0:2be:1f56:ed32 with SMTP id
 5a478bee46e88-2c0e4f79e7amr877942eec.1.1773844919477; Wed, 18 Mar 2026
 07:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
 <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:41:44 +0100
X-Gm-Features: AaiRm52glbQ5k03i38HLvFJrknMe1XNNnKvvWBogM8moiNwsNZDgYGGN20TDKPc
Message-ID: <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Wed, Mar 18, 2026 at 3:31=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> In principle this is possible using
>
> #[path =3D "pci/pci.rs"]
> pub mod pci;

No, I meant supported natively, i.e. without having to write an extra
file everywhere (which could perhaps be simpler as just a symlink
instead).

We could also generate the `mod.rs` on the fly, but that means a clean
tree isn't great for tooling etc.

Cheers,
Miguel
