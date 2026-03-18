Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2297CF483C8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C490910E58D;
	Mon, 23 Mar 2026 16:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SP3day0O";
	dkim-atps=neutral
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6DD10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 14:03:59 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1273c690e5bso416161c88.2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773842639; cv=none;
 d=google.com; s=arc-20240605;
 b=DwHwsh83eZDDN23AelwpQrT51ZHFDkkBoLOUH53kk3d4eLHgCOUlWwVJ/vYz2Iq+Mb
 GfH/3D4m/hQ4zHLHK34uGF/mXe4qnvl7E3LnMyBBb09AqIYwW9zyllbm+RQmIw3XyzZv
 OXk4yJA6HFuo4x50Zz8C4LZc7gKDF/sQmsx3Oohre1O3BgDUhrcOa+dtHaDqlP+LWVG/
 4G4GE0Z9r359b3n2JFzOXrah9AoRdqNe3RNtQji/tuN53hHkxZZEPA7YTgjLwypXcxhN
 PTUW2U4qW/0rD9wZO2kXXjzdfWzvSrvt4ShP23jVw+xHKoWVWS7bIkd/+L+BxAZ0FuLU
 tb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
 fh=WCg4xWlf3VFofHYq9w0DJ72HI4P/AKH128WTjU0ZCtQ=;
 b=O1kVnfCyfCFKH1/m6WqiVV5GHkIRilknn1LUrwpHSEZd21rBR2QXUvVWZ9mipSNYv2
 RDT+dUtuqKxzF7ln/onr43PZGoQqiZonF0z9SJtwWQvvtpSV2GEVVUAQeqQMc5GoNTnY
 EC3khkRwe7J6kaeAN9hCF3XzTPpCxZxlEmMDucT3KLb3kOi50Ce6resnvLkuCzzKn4Cd
 SZSkh+hGCYx0l5wGRIzm5T85OiDCLqDeDx35cZdZZOuc65N/F+jII4nICACGidB5fJBt
 1h5An9njUlEHQfO0+aonPiGylre2zHlSDqxPHjTqf2G/Mmge6z+LcMp9dZeKBOpB4gPl
 mIXQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773842639; x=1774447439; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
 b=SP3day0Oj1/DjmRsdSyPMUjcp7kcdrq1r2LXRBcppvHqjaVbg2DfE3Tt2aO9sP+SCL
 FlumoOqH/KiCk+ke+0A+w6l4K+3rQA929h8DWAlc98BtNpAYgAM5ST6OUNaoZMfq3apA
 trVFMVqhsG6ESM3trF/LoKrJ1/QvbpZqLyM6iG6yLu4oSWMJnwadH7ovP3j6n7oDDf49
 YDFX1qOuZNNu8rCyHXzZ7857+F1qSq6KrjnCp9mHCnXNjnLWMoK7WT2TN1eg9UpToaiK
 iZosSFEBYX/VOD5d0F++HRFKCfCqz8wGlL8opS1K+hQsXqLQ9HvqwlLUV5JfyihExxX5
 IEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773842639; x=1774447439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
 b=WtjlI86RbgLx5pWNVvFme/LgPqEtwyCZH6mCXLyx3RCUPxc+Ldiuf5rV77UKxTr811
 o03byjS6T0kYzUpnDaO9u76nmmf08BVcYBTRvpVC0HHU9v2VqHAYTwAoJv72dslqsxeG
 DiofOjvqX/RUeXuvlb5mc8MWemaD8Xs8Cm4IPIiPzrK2aAwqrmacnEQiNmyYoA4HuRGN
 gP9X8ZCDAbTX57fXrBQm7OW/lBuy17oAlhign0vBw22Ea+b4kN8APUics6eQ8s658Pbp
 RikON7ybM3VZqrAlDzrxGqqnx/FTsf9TYEHRlVYKf0GJcQm411DkkjnMn6/xMXbYQp6h
 r9/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpn81B/LARt4zLmVrosmI075IjaYER3FKHPSsG1hgIN909av6F52MV2bEksOUOxvha6+iz5QyEUg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbQtkbjNQbMCo2OASlLST/OBluB6M2OFd0K/37nrrl18kpwNH+
 YkAX4G5zXRXUCU0d0ooTdHUekr+A9hcjXIdMjpN60FmJgnIWbZK5tWAde6NSi23smVICD9vD18b
 mB1Gob53NfsMObJ8ZCI8AppkJcMMLb0E=
X-Gm-Gg: ATEYQzya48OidSwc1W/SZJpNkkw1g1j+YZ3zrGbLqsHBujHBjgMe3DbltVj2xWgoqEJ
 /RjEQsWVaMCs6mmgSgvLontvnV4/iz6xSROM3aRMxvpd3vfHeAjYfYL5GA3WHeUosZ7sya4O6Ws
 IWNEzosK198X26m5IIqy4rppG0e3MqAmOiZi7c6mmBjXCjiTUf3LpI+y5P66KadKeGmYJ3O2f1z
 Kw7zNbSWHgZ7ijbef84HQ8eoiV631O2f98B9+BQgbxbyvcQfGDbU+mPmEEX6in8/c/GaUiHSyaY
 LyPcM0hr79ugdfebiBcSVn4qerDEcJYz+YresHXqrjeTTCeOkhvjX8yjBTlPOqU7AveBwXTQb7f
 TRPh7WBt1dU5Gbd7AyMla0p8=
X-Received: by 2002:a05:7301:1e92:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c0e5071063mr859030eec.3.1773842638629; Wed, 18 Mar 2026
 07:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com>
In-Reply-To: <abqdUBqchnVFo7Qk@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:03:46 +0100
X-Gm-Features: AaiRm52jPRFXXf03k9diVYR0ZGnNxGkoAlPwk0mwDAEpyLjxWwYifunzB4OTgFU
Message-ID: <CANiq72koBNCeXFh7uX5GHRJoAu7fyhttDHHN0WZzx9Q74F=mWg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Alice Ryhl <aliceryhl@google.com>
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

On Wed, Mar 18, 2026 at 1:40=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> My build triggers this warning:

I reported that in the previous version -- Joel, you said you used the
workaround I mentioned, but I don't see it here.

Did you decide otherwise and retested and you couldn't reproduce it?

It is fine either way -- I am asking because if we decide to keep and
use that "fake `unsafe` block" pattern, then I should create the issue
to ask Clippy to support it.

Thanks!

Cheers,
Miguel
