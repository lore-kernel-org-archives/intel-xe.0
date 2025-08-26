Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06083CA0FE7
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 14:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72A010E66B;
	Tue, 26 Aug 2025 14:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="EsPQ4CNw";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4810E66C
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 14:21:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-45b627ea685so14163475e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1756218079; x=1756822879; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I+VWRhdnTUjnI3XomDtbZckS18oyRmRBoSQJRcxV7jQ=;
 b=EsPQ4CNwmgivz2cMabnO/0Uq2W4IfWNfWjpOIX6CD8FjklSSF9ESBAyFvoZr314766
 xTyjOPSSoe1JzM/XZM243imGUdIStZ56XNt80c7HXtFeyNr9LxxzuOMUXXeNSvXB6VuP
 mP2e/lvJ1gJK2wc3uCi9h7Sc2RJ4tDnH10QHloUKc1U3Qns29UbcqTPLet+7ujpAyQOm
 Mn1x6OtUGZyY7gUfYqVG1zBEcEvsa746eoXfkshdPZvhS64HJ0NIXSlE25ZE9il0QG7f
 DdOkWd8uZLzz58CN80SOr8XOp2Ggf8TXuiFKQnwLoMCySLwgveuaSEWz8jfrvk6snm46
 ttvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756218079; x=1756822879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+VWRhdnTUjnI3XomDtbZckS18oyRmRBoSQJRcxV7jQ=;
 b=Q8+vb81Kg0REKaGdZ989Tlb7mlOB2WQlL/9aPU12rjzvXO3zg+neAGZAqRvTKzMc5p
 N+lEoeau4PM2DNelu4HnZ9pqAYhDsyEz8PKTxoqd6KiKQl90lGy9cD/8qaoE6Ljdu7V5
 RdHeTiu9d07qDA8Uan4yI6gUak9s+8FAbTxHWPVl2gj+lPqoSnoQU+KVBMNJzEQxXlf3
 HujcxM1zfViCZi0wp+TwH2ONXPbKwILSGqoCVNdy1xDufgYeVjHCxo9rXnXaP+FDIv3Z
 sfiV6mkSvfv2eQ4Cjni0vGsWXmQ8d0HU/dLOW94HJIRg/SVzo8bfuPzcXtGsqlM2BPnZ
 D7qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP2LQzzdB8LHMtyLgTBfwYBcBsp5TfUFFVtSW1CNbyac/5kMoIzj0pjaO7QSUddhupTMbaNBiHTg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrV2tMv6ZsoC1E08P12R8nBy9Ov2X1j4hcLMhbENB7lPTAqJci
 iSaEC0u727ddzi4yYiwz3hPzxNIme8DTNqmIxSTKKgYzUrj93iJf2STU5btcPkApPSM=
X-Gm-Gg: ASbGncsRlSYczrgGzPcqidZ8MFQP83WGiMpIEGpY7svknnJ3gBbhE/EMoLlN+YKhctI
 XPFEPT9oY0QA88E2Dc//9kZ5lM941J/NssA9cU5zjMpp4XvGA94ksPn6w4LRZkY3sdByi07Knmg
 r9g4AGDwRgsrjmWg5RkpAgERplRTqwd6R+6oPHoK+AJD2o9txoYWh4SfWYTYn1CQ4JienJSzOrS
 Zdl7B5L/S6lvPpa+yHYl/1EqJ7voW6Yx5Z2Ja+DuXPPl41VcPM76WiHmIlOwDgWjuJ0o22Rgdll
 KKbMxhevzIykb+9TfFD+/qvBBJzTjftmW7OG5gDYPqCDySLHbEWY8tKMkzlFjrYFB5NXXeG3JHy
 cY6ld8oNdKQ9OfAuHpgyoFVFtgAR4iDxm09Ys23Zy9aCOkZLVTZqHIQ==
X-Google-Smtp-Source: AGHT+IF1onmcmCLINy+0Rdj3SUnLle5wvn3JPSHU/RzbuH+Mf9JjVWxvuwon82t0M3+JcME7Da8B9g==
X-Received: by 2002:a05:6000:24c9:b0:3b7:93d3:f478 with SMTP id
 ffacd0b85a97d-3c5dce01212mr13313281f8f.51.1756218079134; 
 Tue, 26 Aug 2025 07:21:19 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32760f2686dsm377332a91.0.2025.08.26.07.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 07:21:18 -0700 (PDT)
Date: Tue, 26 Aug 2025 16:20:58 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 'Thomas =?utf-8?Q?Hellstr=C3=B6m'?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Hocko <mhocko@suse.com>,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
Message-ID: <qd3ioegpvmrrrwdy2qntxznyrnwq3bhe74lmuxio7sy4sjggtt@tm6nqds3pyvj>
References: <20250819114932.597600-5-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n4nu53c6pb6rlauk"
Content-Disposition: inline
In-Reply-To: <20250819114932.597600-5-dev@lankhorst.se>
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


--n4nu53c6pb6rlauk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
MIME-Version: 1.0

Hello Maarten.

On Tue, Aug 19, 2025 at 01:49:33PM +0200, Maarten Lankhorst <dev@lankhorst.=
se> wrote:
> Implementation details:
>=20
> For each cgroup up until the root cgroup, the 'min' limit is checked
> against currently effectively pinned value. If the value will go above
> 'min', the pinning attempt is rejected.

How is pinning different from setting a 'min' limit (from a user
perspective)?

>=20
> Pinned memory is handled slightly different and affects calculating
> effective min/low values. Pinned memory is subtracted from both,
> and needs to be added afterwards when calculating.
>=20
> This is because increasing the amount of pinned memory, the amount of
> free min/low memory decreases for all cgroups that are part of the
> hierarchy.

What is supposed to happen with pinned memory after cgroup removal?
I find the page_counter changes little bit complex without understanding
of the difference between min and pinned. Should this be conceptually
similar to memory.stat:unevictable? Or rather mlock(2)? So far neither
of those needed interaction with min/low values (in memcg).

Thanks,
Michal

--n4nu53c6pb6rlauk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaK3CyBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgF3wD/T7sV0i+cdg06NdkqMGry
p4ywSWT/m1ixLxww8iCRQjcBAIu13/A09vj6nD3AYjTurMoAlJUuSFWDZE0IA9G4
7jEP
=0oC5
-----END PGP SIGNATURE-----

--n4nu53c6pb6rlauk--
