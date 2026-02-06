Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E03BECD9AA
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 01:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9CA10E218;
	Fri,  6 Feb 2026 01:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="axMNipv9";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B73410E224
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 01:07:25 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-88a2e3bd3cdso21544726d6.0
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Feb 2026 17:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340044; cv=none;
 d=google.com; s=arc-20240605;
 b=NwN30Qpe2J0uUG3fwJ6aO2woEv4S6UEMLOJ/AqlDyM9lHcOOdpEXCnoFK8PcbcpCqL
 GE1QHwH0XR2nKwogM3IqOe98hA+aBPzfytIJ2Vw6phDlIgA95k+zBoT3U0UXgoQBrVOP
 t8vJI78Sus7jPy7FIyQeNXE5wEcNefxzMKay/STJ/2mA3KJaSHb9Gj/DOyZYLFk3Uj0P
 jLhCXu7U3ZfQR+Jful5Uqy6KZtX7ICZwV4WlhhSu4nHfRA2a3elEVVwmrzH/zrk9aAxA
 KPr6VXFXBgbvBAShrQEdItKyjdg0ygE4t851hApl4A9MkLeXL6foVWi1dYxoCJGCP68+
 47lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
 fh=gbhx9WnS8tnW5hgMKNUPwK3q1kdxJ0k2/LZLg9BCf7U=;
 b=UNGabPMTsnsUbsxUfCwsmc69XsgY755ytw7bS6mukEGcEkJOSSGV/Pv8lydjY8luRi
 30RJAfbYaXiqk4NuUcClPcU1qrpjZXEYt31IHWigZs/QEXmPSBAaYAdy1Ob1eRD6ONRb
 jqYbPlDpu3NXaV4O9ePWk+M2t7IOrtj3kXCpR6yhDt1djgxBkDnlq04LzyDovz2PtkSx
 fDUUvoczVwGt8D8nmejJSpGNL5aW9Krblr7A5DgygjYSMpAxCHMKsjNDzYejkzQtCWlC
 2rNr2gBvLLQ+Q1C0sP6Wy72+ZgMHQJs3XgbGprY6+1NN5q5hrYpynQC3/aVN5KpdVxiX
 N57g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770340044; x=1770944844; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
 b=axMNipv9rCDoUnNKM22DGe0DqtfDa83qsjEcdokLVq5/zC/acXS2L1e8iL6zs2QsUr
 OwtvKrLTjw1nPqsIVRh+01IwLqcB0crmhg2X8hj3erorBR4JTraNWSP9kPG9rb38HNsS
 bmhqt0dOmQ7aIpLzXey0UuPwxy6PRlGBwTEZMZp8wsrLgFPE97LxOnbXrHRMhQfkIT01
 pmJ48CFbKrxH3bWw1KihhKMlKJkctJgJ1BqJGTmBcA48E7O9cbmCtRsaQRKzVwPEdI03
 mQRMqe4HDSDgGXtINaXq+fL44ITjOEuT5BoL7jJm9jWRCTGXvqS5HjUYBLlay7quYIRT
 hNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770340044; x=1770944844;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
 b=A4ptywzs36IKaSQctfVFSexKsqSAyTe5SiLN5TRim+cbryyT0eW+Vh/gWM/7t+R36J
 aBm40e6w2xIy8zyQNKtwCobLnmOC4UxqOmcJSvQCJgXbKARpuCmEoMHwCALbO7HW2EYL
 TOo9oXDOEMSHVaBqFmfqbYHNrQEjF239vv1CIPuntiG5w/dBGILNGJDkybMwaZVMR2o5
 /n14bVf5j5K9WMcnFlVM22A7g8CmTdscB4rn47rWXQQR2dBMjxXBK8nEAxmn8LCCBexw
 GDTBlLC6wj4wGxtcByOu6OCm0/4Zgj2L4DszNfQI91ansXqgFJcr+65Dc0HSVneAJMf7
 /XRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGmbJIq8fzxXUzJRszlYdP9dPf2MP2a315ln8h0IWxi/5xuBYC17ah7wFTt3SA9xVjEoSwz6sPPQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEDnXlip1jQLLw35nyl9biP1dF7Pdu2dGze8lBRl1wz36eGuL6
 7w4rksscjjy6joHNJcfiOvEYqhb4OzpOgZLgZb+2ha54eNt3iuv5Z34pumYvUks9+R5rNbNekMx
 3mmJORUMm5NKv+Z+C/akGGEPah3rILEQ=
X-Gm-Gg: AZuq6aLALrtTGZxAv0cnVOMf0k6YdrjBU1LGlDas3jUb/IQTack+fIg5er0De+jZsk6
 ImRh9mhUuzMMab3sFyRbGE2mODM8j/dbzZgGDN4vwBxFYeIhRQ3kpA3zyJYz5X0KbHZrikc8M0s
 NhfZcw+xfzmxW9KgGHTmfFhow90YO9gL735x8K0c2Ix4w5nPAC18BYYqJ9jpcrTM4GrKmOXeLH6
 jOchU0vZTRWvRsQG3zjWckNdafRyoWZJj3iXZ3HPBfGQPNQwRScrZGI5KJ+bXVmZ+7zLTp1Ruax
 ydykIQ/G7TpxG91EXnWrW1GiS8Pn3nHp5+oaAw/rx93LOAoOosn+mRE=
X-Received: by 2002:a05:6214:c29:b0:88a:44c8:fe30 with SMTP id
 6a1803df08f44-8953000350fmr75404466d6.10.1770340043910; Thu, 05 Feb 2026
 17:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-3-joelagnelf@nvidia.com>
 <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
 <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
In-Reply-To: <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:07:12 +1000
X-Gm-Features: AZwV_QjEIAozPEFJ7NdCW81HEOLtXZUhxCZzFmSJOZbp-SMcdPX-QLYah3tkGzE
Message-ID: <CAPM=9tzafj_-L+ia8q=tL5DBWZU9PdSq9vaCAD7ituoMR+CaQg@mail.gmail.com>
Subject: Re: [PATCH RFC v6 02/26] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
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

On Fri, 6 Feb 2026 at 11:04, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 3:55 PM, Dave Airlie wrote:
> > On Wed, 21 Jan 2026 at 06:44, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >>
> >> Move the DRM buddy allocator one level up so that it can be used by GPU
> >> drivers (example, nova-core) that have usecases other than DRM (such as
> >> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> >> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >>
> >> The commit cannot be split due to bisectability, however no functional
> >> change is intended. Verified by running K-UNIT tests and build tested
> >> various configurations.
> >>
> >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >
> > I suggested this and think it's a good idea.
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> Thanks, Dave!

I'm going to apply this to drm-misc-next today but I'll move some of it around.

Dave.
