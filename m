Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DC9F94CAB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 20:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8977B10ED7A;
	Tue, 21 Apr 2026 20:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bK70RxBA";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B7410E1E3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 20:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776801956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
 b=bK70RxBAjBkXkA/jCCxLxAxUcUlK/cU1o8zYiiDVRJwdYgSHOdBB96Ocpuz6fIFNNZBarG
 8Wd1MX+3Ecpqhp1HIOo/bosx8gq1yxxpoAGZ1jaXxQtxZ3GmbjMIAt3H25TgrmE3cn+kZg
 H8p/1DlVS00p20rrF/LCdIkww9ZeQbE=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-M8yHP_2bPve37QIR7k45uQ-1; Tue, 21 Apr 2026 16:05:54 -0400
X-MC-Unique: M8yHP_2bPve37QIR7k45uQ-1
X-Mimecast-MFC-AGG-ID: M8yHP_2bPve37QIR7k45uQ_1776801953
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-12c4305f490so530129c88.1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 13:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776801953; x=1777406753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XeHr6DVVipYM8wZRZ3joTJjeppE08pl393d8VJrbaO8=;
 b=jZPCZOTEYKT24ie/ZAispdaiE+gnSArJmX2ySnUCIuBPcT1C+Ep3kEbd/Ea2lB+JgY
 tFgnEZmAcDwv+LgUUImKdlXIRS67igSQ7cvmt1i9q+9APbGrtkoc+s0KjGt94EWOWEpa
 Nh1c3moMK16ZlwJa8jb+dwH2MX39O5pUkKPDQ0rasMlTS7EVMI5ty8Tt/Crbo31VVrk7
 Wog+GE5BtRsxKALA7Ug37cYsWbg4aTMnTIhKtPs86zUKcmZMJsz+Dp9LceLdRivQaD+M
 hTmfdFgvp+ym/saSxDF4gc9mz1tB7glFtE5rZoH+WIP1mL76PkiL6UDB1D0UOPB1DGTd
 r1oA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vR4XLL9t4HfSHX6nIpGHdCUYnJtXDe121PrYAhCM55qjo647/FQdrPC7Arb2yRsgjiGVOAiRxrQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypreHBduXtH4AfpuO2q2wR+9b/U2rfYL8KqNnS0VqEJT67b0iu
 jCvoux4SmLJPUoVNJVeM6YOq2KD3/ya77Uv+RHSguZ6bH32BC+qysSS+7OEKen/7ObchuJhUnZG
 /uCJ3U0PZFCrHn6M/YbsoFABzAIzqM2A+Xt2dyngO41mi+1jEWg9IjB9pbyjiT82PmkFHbLaw3h
 gzp7xDMB0a0rc4MUxZlE0GtxL6jUtYiBuPVNKgrlHn2M0=
X-Gm-Gg: AeBDiev/3MjdgAUawNcmfbIz4zqU4XZdD9RdVvD9foEUiCFBgoutFWhtRSKqfbIxinI
 13IDNyKAUfuwzGme1tjYpYV7ggjRoM/i0cSDBCro9HuyMlqMePQc6yzvQUp/TdmDA8czQDN3Qvy
 JrdxNy+ILF5XM7Wcsp5eSxkjRFNCSP6MTlMrmjf0nxKcI01tPpfOehI3l55ohETaoIwTegfwB7p
 AZsNpLoLKYEf+a3ONvFFtZ3wckCA9J55W1E/U617/44kUc=
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id
 a92af1059eb24-12db2caab80mr2009950c88.8.1776801952709; 
 Tue, 21 Apr 2026 13:05:52 -0700 (PDT)
X-Received: by 2002:a05:7022:e985:b0:12d:b2ca:a9e9 with SMTP id
 a92af1059eb24-12db2caab80mr2009922c88.8.1776801952185; Tue, 21 Apr 2026
 13:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
 <20260415210548.3776595-2-joelagnelf@nvidia.com>
 <b0c5267d-ea77-41c5-94d4-39c651761b3c@nvidia.com>
 <20260421145521.GA51176@joelbox2>
In-Reply-To: <20260421145521.GA51176@joelbox2>
From: David Airlie <airlied@redhat.com>
Date: Wed, 22 Apr 2026 06:05:41 +1000
X-Gm-Features: AQROBzAsZiSzIuFbaTfYEhScUqQNnqcYEoqTT_Ur4O9PkcMB0Af7pJH5n1PBSF4
Message-ID: <CAMwc25o2qmaYnfsh-cW4M4PEbmpYb_1x4qg1_2155P0orzCnOQ@mail.gmail.com>
Subject: Re: [PATCH v11 02/20] gpu: nova-core: gsp: Extract usable FB region
 from GSP
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, 
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 alexeyi@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DHOE7eBqWpBF3z8_TiAwLjo-A3bqxXau2mBjHQjiuk0_1776801953
X-Mimecast-Originator: redhat.com
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

On Wed, Apr 22, 2026 at 12:55=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>
> On Thu, Apr 16, 2026 at 04:26:48PM -0700, John Hubbard wrote:
> > On 4/15/26 2:05 PM, Joel Fernandes wrote:
> > ...
> >
> > Apologies, I found one more minor thing, while looking at a
> > subsequent patch in this series:
> >
> > >  impl MessageFromGsp for GetGspStaticInfoReply {
> > >      const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
> > >      type Message =3D GspStaticConfigInfo;
> > > -    type InitError =3D Infallible;
> > > +    type InitError =3D Error;
> > >
> > >      fn read(
> > >          msg: &Self::Message,
> > > @@ -205,6 +209,7 @@ fn read(
> > >      ) -> Result<Self, Self::InitError> {
> > >          Ok(GetGspStaticInfoReply {
> > >              gpu_name: msg.gpu_name_str(),
> > > +            usable_fb_region: msg.first_usable_fb_region().ok_or(ENO=
DEV)?,
> >
> > OK, failing out is correct here. But in addition, we should also
> > log this at dev_err!() level. This is rare, surprising, and actionable,
> > so perfect for that level of logging.
>
> Sure, that works for me. Will add it in for v12.

Just fyi when we get to spark later this will not matter, we will have
no usable_fb_region, though maybe it could just return 0s in that
case.

Dave.

