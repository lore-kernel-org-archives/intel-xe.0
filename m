Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA2D12D60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 13:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37010E7E3;
	Wed,  3 Dec 2025 13:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="seIqWJ6Z";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B426B10E7E3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 13:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A3EF6019D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 13:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB51BC4AF0B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764769262;
 bh=WgeCBu7yk+EAa6yjfYBdefiJzHhmgcwaJ/PwZrzocL4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=seIqWJ6Z236TfaiWifLkufCSkhJaCtuFSV7kzMmfS3Wntg0m9xoggeiduBV9GySKc
 OlAPWE69Liys69SXhCf0itYtw0kKZq2EO5Jir3DgjXqWsq8G1WKjpsIJMnVNKBqIa5
 8X+bbbXaEdyGYrAyYMegW9U7pKuvtcvKaUYA9pyYoYrsYh9fetgaitUgD1wCVidmkq
 8AdnQSI1t3wnXhxzqq0DVgGg0BPB6m3rJaQgOAuUtPWiqD6ehT/DJK2JFYw67KwcYG
 G+G6U4tU89ZYKmUdp6WTC1+olc5PgbdyGcYDm/WP5LyIQIlpGB9M8C/RmhvJUwC5x0
 3nXhZ4DpnwPKQ==
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7c7aee74dceso2159878a34.2
 for <intel-xe@lists.freedesktop.org>; Wed, 03 Dec 2025 05:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXWV48Fa6Dd+pIWDCmnIkliAzuDX3/Cfbc6hx9Yc+ttqiv/3VA7sVsIl0Fvkp7W0Us+qDaKcSoPxg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUcfwFw0V2kn6OkxMpYrko9Ljxpz0Y3nYonMhdIoWu1UYq5krG
 sFr97623VisVrToBGBZVL/4OfN2k3NzObw1fh/vAOzU6vhuYscH5F5UF+mlWrOzsXDhHdEjRNA+
 5kP0DrrmvReC2Um5WWMmYUH+w88w0v5U=
X-Google-Smtp-Source: AGHT+IHGJHeqVkEM2pfPZ2VCgrRsv4aUtjBFxweid51gvGR4ZmOw13QuuV1jRxSVUTQScHlkpe5V8vcP4Q1fSMqF9xI=
X-Received: by 2002:a05:6830:909:b0:7c5:2e2a:d386 with SMTP id
 46e09a7af769-7c94dc0ba4cmr1300869a34.21.1764769261795; Wed, 03 Dec 2025
 05:41:01 -0800 (PST)
MIME-Version: 1.0
References: <03c013c0-be12-42ab-91d1-f87395c890e3@intel.com>
 <c711e3ac455a552c130851d7a45916a3ac992390@intel.com>
 <51f6228d8bb6df524995b5ad4c49cbdfcbafb952@intel.com>
In-Reply-To: <51f6228d8bb6df524995b5ad4c49cbdfcbafb952@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Dec 2025 14:40:49 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hw_zUUf1Ns_tvq8zC06T0NKzUrqKrN25VFwaFs5rJPNQ@mail.gmail.com>
X-Gm-Features: AWmQ_blBYlpsZxQ2SlxK-jH9v9TrW3GjxfOR6u6X98onqzEikEtr68AEj2gajoo
Message-ID: <CAJZ5v0hw_zUUf1Ns_tvq8zC06T0NKzUrqKrN25VFwaFs5rJPNQ@mail.gmail.com>
Subject: Re: BISECTED REGRESSION on v6.18 (was: REGRESSION on drm-tip)
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 brauner@kernel.org, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
 Thorsten Leemhuis <regressions@leemhuis.info>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Dec 3, 2025 at 2:36=E2=80=AFPM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Wed, 03 Dec 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Thu, 27 Nov 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@in=
tel.com> wrote:
> >> Hello Christian,
> >>
> >> This is Chaitanya (again!).
> >>
> >> This mail is regarding another regression we are seeing in our CI
> >> runs[1] on drm-tip (with both xe and i915).
> >
> > Referring to drm-tip is downplaying the problem. The bisected regressio=
n
> > is in v6.18 release. It's breaking suspend/resume across a lot of
> > platforms on two drivers, i915 and xe.
> >
> > a3f8f8662771 ("power: always freeze efivarfs")
> >
> > As far as regressions go, it's pretty bad. Please prioritize.
>
> Added some missing Cc's.

This should fix it:

https://lore.kernel.org/linux-pm/12788397.O9o76ZdvQC@rafael.j.wysocki/
