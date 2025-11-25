Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE374CFD364
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CF410E35F;
	Tue, 25 Nov 2025 07:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQqIQrT/";
	dkim-atps=neutral
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449FC10E362
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:49:29 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8a479c772cfso324897485a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 23:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764056968; x=1764661768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYXQ1uyTYiQp5l0EOSTj3X1iUi+LYOARqqBvPXETpmQ=;
 b=ZQqIQrT/iYzzWE5uBmcADmXoZZb+H5YBVGQCkLgyglYDr55EYVA/WgSyUCv2Q9i4EB
 wt3G1hLuGbjqdKSBe3q/w2X5GxX7Iir3J/WDVRulYzxJKyH7MtjHPAUA+jNK4VDJi1th
 XU2rU2QazDAWgpB4FrxOW9THu1RLuRxDJMxXnPdGErqpT3ZsF7E8d38THQ2ehBVQ7wvr
 0s94crMdtgbnf6qq/vXKrPwJw8mkT3QOKN3gQOkekxqAqrDqcQUfmFdDQ/BjqvG7eSyJ
 s85vdl9scq9QBJQDwPNZ4DRgQPash4yAg8nGisBYS+M2wPzlvxkxADO0xk61gw+NaY8e
 Nk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764056968; x=1764661768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dYXQ1uyTYiQp5l0EOSTj3X1iUi+LYOARqqBvPXETpmQ=;
 b=mlgFJFEwB8b+93Wgk/xb3ADo8zFIGah10YMNwZEBGgNbWQF9skgeE1On7e7FiLbRS/
 hAHRI+9xKLNS2rk9Cx7X6Na7O2N00cj8JzbXtaZsbmMWWsm5XynpcW9wGGjexF+r+OJs
 GldCRuQUDkt4N4PGhgaCOZfItlWX99jYxqYUZygqO5BIkdxYYnTzNvS9ijWrL5kuLae4
 XAYiFPYvE2Fkuq2b8XulJEwPbKtk0Zh6i+HoKoun3Q61OO5ucVFih/d+LYIRtgPBijkY
 ZZapEb0KNlC0aQfXFigpy4SSW4t6QPFWKuM+6nhzCdmsIA/rh74WTttPglr3mzch0bDg
 z9kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCHbGxbPY7oNHd7+jpqtiY/jIb2OitLROPdU0xbSNIDNtMsX5ikxGKDd/6b6CJUW5Ih49NXu/SMA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRTB5NOkihaaOVCq+ublhCRsKxNW87FjlcQaX3cBPRFz5AmVMs
 G64/xfpdC0+H+inBwLkPCRPu2NXFcpGXf020LDgOIYzPkXtrsMe6hnVRTkwK++FOjT74LNMTLSt
 6MSmWc2B+u1/O/O0qJBsJvmgKNoIy5xU=
X-Gm-Gg: ASbGncsR4NB6nl9T/DoDAqmXH0C8h2vd1WvdKpLqEUql+xXtpriGtuXEDDz3xa1wMme
 U39nOylgaBcyz6hw93CpDSY1drT9fIIaAhi9oPGE9MObHtRTQoFW9YXTKq7FPeW9jPFqo2zGJgJ
 Y475/4YZatrYqPB78/KPsV+4CK+ok8AwnNUrTDTvG4bx0G+o1w2yhvCvjnkEvcC/AE6b6FsTqEC
 7JrLnuI8tbV6bzgzMew5nZf231pn9W6OKGu+zLN7Vsd8T9+5ZIQi08uUJQBDXsBlytq1Q==
X-Google-Smtp-Source: AGHT+IEtXPDouByPiT/qxibkQ8ULLGq/MTP3sJn0d1xkeYQ9cq7USFxzR7YMrVKLhlsOLhXx4WZEKVrsh8lyXL+gyvM=
X-Received: by 2002:a05:620a:708a:b0:8b2:6ac5:bce1 with SMTP id
 af79cd13be357-8b4ebd9ec27mr242566785a.52.1764056968048; Mon, 24 Nov 2025
 23:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
In-Reply-To: <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Nov 2025 17:49:16 +1000
X-Gm-Features: AWmQ_bnwzbjWb8lRQT1DDgpaZ85N7NFNJhUwspjg107_d0wU8nUTSe73G0Ayj_8
Message-ID: <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
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

On Tue, 25 Nov 2025 at 17:45, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/25/25 00:44, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API=
.
> >
> > The commit cannot be split due to bissectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
>
> Well such a change needs to be part of the patch set which actually start=
s to use it outside of drivers/gpu/drm.

I'm not sure it really makes sense yet to force that for this, since
the next patch would be just adding rust bindings to it, then a patch
to nova-core would be needed to use it, I'd rather not merge something
like this via the rust or nova trees as it breaks the principle of
least surprise.

Maybe this + rust bindings might be enough to justify it, but it
should be reviewable as a standalone idea.

Dave.
