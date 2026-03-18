Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF08F483C9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320110E01F;
	Mon, 23 Mar 2026 16:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hls9sLPd";
	dkim-atps=neutral
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83310E731
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 18:57:27 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2c0e158158eso6614eec.3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 11:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860247; cv=none;
 d=google.com; s=arc-20240605;
 b=Hpwpg3wxMPLqtMl1/ASuXSLz1sJW4eYiE14buE5TMvSJdXwa1j2hzTeh2oHf0EJ6+K
 LLkSVrNTBBAN3UqQn5ZOAL5NoIPkTfdN/y3ebSrysdss42M5mq1G9zUzbOPaHCtbh9ZT
 WxzesOoJpjsSZIBeF7uyUGSVYNSSeUSIsAkHt9PA5LzAoXLdtCHgb0aKjG43tCXT8HRn
 nz11TBCWCwYhkwuDiGMVggBtH8c83lqhnrHBHxuU8msQd8vLVCKm3PEYjhud0ces3q1j
 3pgKYoivPLmA0IGV4OLCuxRB/xJI3QKQE3q6QDObInQkSQ+dA2j4WBtAHOu0HpwGISqO
 ShRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
 fh=e0KzGfWvearmwr1DWZ9caqVKCPEdeDretrekRRw8gTA=;
 b=Ffi6xRjO3OYYVUuONQpPme7ErrtIhjMU2kIN9Ze7B+CaN2rRfa5K+os6LnHboGSR/2
 9d1vVjAd/VyYgmb/P1V3HFKDyAB0AWGiTxavgq7ncWFCRWV3yPoelml7QFRvHXfjay+O
 3XVhRxa5Hn4TgYoJb2syWvV1SzXzELvcqamO6+yohzlHgMLG0gCzWSBGqg5tb3Q1TNF8
 H45G87k3MmQqLTZmtSS0qi/uPc6ytykcRjl/u8aBuJRXAxKQeNk7fi8OcYVBhvr88pPS
 TuPhYw1+mMnnBHs+DUbbgWlhLwZ+rmKqgibESxCrKEEFaTBjySAdLJAMfTYjm8zE03LC
 i2xw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773860247; x=1774465047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
 b=hls9sLPdPRx7gKm2di3aMw2U4eOoEz7UL1WQuwlgmSVnwttmdt5y3dmL6ifcOEIPm6
 vrrOEbeNXy3TVfnEm89bUrAf2dQ2n2Hg7X5bICkUMdC1wuJgnDVthMzkTACUH0dki0Pa
 ba8a7Yr0Qd5tu4BFRsVH/vFH95M2ttgA5ZlLadSrmsZTog02L1DjqGm1IKAk9IyBp3Kf
 7pq9Uem0z0W1RHuHX3+FZyMXfWHEcl04Ue1fqTnqdjs3o4ftWaGArAH66masDZ8xzSm/
 4ZPs2eD8zzbFGTW5Tgn7LwbRB+LF5nwVfebtJzIv6vm3rVID9I5dt03Z0uautMoxF6oh
 DK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773860247; x=1774465047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
 b=lTb0mBb7dH7A/rrsH4edIGbNBOg7rQSJSPWTbbW7sMGBz+YBqiLlrikdio+3QakLFg
 wStTCdFtBMSRqAHNaiBIcItscF8RDdwkl3hnYcW0a9sgjS02Fb7taxhXXlYs1VXLAaq4
 P2Vngfr4knrYX/pSqitPNbpK2tDPRhVA2ElgemSchInbq51JhAnXj1Py2sgwQQXOJJPP
 a70PkM6Y6N7RI/RxnYdTo4iFjkNnWLPyjSSZiwISxLfoTHkBWqg0BqwXAJnO3KUMPyK2
 ys3mc4y9iiNuCDy1dd2s2dkHWVstd/24ix4N+LnXK9LaKnn2ZWo4OjFZb3FVxCSBNiMS
 hpAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4RTrwkxLKjV7n2TF5hiET/hdoN+CbbjrVTTFH/DcAqfjMabnTKFh3TS38AEzTe7NpPnq9WfA/1Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIce2BwpVejG1hOdqpZueli9Aq9PUzt1c3+JZwUCSSFpbktu8q
 2+JSOLc2tjFClOmahmOY0Y+9gJB2PYer1c/5xkEK6nrl7a3MuSamhjHhi8m56VwDy1ueQQGl4Ic
 DT92kUF2aQ6aRMOETGoRZszk+OMlqmMA=
X-Gm-Gg: ATEYQzyMDrtMZf+zuIcwHBNQ1A9QZ54TGeNR6UlxaJt4mC2r4PCS0/wtcHPzdluisnM
 5+B5PomKakt0DMAgefqNsHfsAo+hSHFtn8MrbD6bGosBz5DBKmUMOCy6zephgePskaN1kDu1gwn
 Iv91xO3tLfcdtT1jE6RecTUvKnRyTH5dkjuuIhFwhDke5T14Qr89kCwyU35S53u7DUhvDd+ag6w
 ZcsrLEKooS4voKmQkbuc5DA3Hqs3tkj47gZXQ5oLdRqJDm4y9i7mdmdNowHpiweSh1HHsMQ0bad
 +BmaKUHK+cBZaNQ3ZoetyIU2iEMKvZzib6VRsZVF0vj2Y2c+gk/WPfgJ1BtPhIuemewk5gOdNZU
 u+bXfyb47ecY7f6qRVp3PIbg=
X-Received: by 2002:a05:7300:f191:b0:2be:9886:d4ff with SMTP id
 5a478bee46e88-2c0e50fefe8mr982481eec.2.1773860246896; Wed, 18 Mar 2026
 11:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com>
 <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
In-Reply-To: <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:14 +0100
X-Gm-Features: AaiRm52hIUr0vzgoavDmbzyJmg3hgU_AUfgRxMfUiR8zNc5S5daML4wMbNTdaCA
Message-ID: <CANiq72nZKx7pw_rZK2mHHvR=TaeGvMRvg5GTHOd58X17oyxieg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Joel Fernandes <joelagnelf@nvidia.com>,
 =?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
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
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
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

On Wed, Mar 18, 2026 at 7:31=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Anyway, the fix is simple, just need to do // SAFETY*: as Miguel suggests
> here, instead of // SAFETY:
> https://lore.kernel.org/all/CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid=
89LExw@mail.gmail.com/

So, to clarify, I suggested it as a temporary thing we could do if we
want to use that "fake `unsafe` block in macro matcher" pattern more
and more.

i.e. if we plan to use the pattern more, then I am happy to ask
upstream if it would make sense for Clippy to recognize it (or perhaps
it is just a false negative instead of a false positive, given
`impl_device_context_deref`), so that we don't need a hacked safety
tag (Cc'ing Alejandra).

But if we could put it outside, then we wouldn't need any of that.
Unsafe macros support could help perhaps here, which I have had it in
our wishlist too (https://github.com/Rust-for-Linux/linux/issues/354),
but I guess the fake block could still be useful to make only certain
macro arms unsafe? (Perhaps Rust could allow `unsafe` just at the
start of each arm for that...).

Cheers,
Miguel
