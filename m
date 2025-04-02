Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ECAC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8D10E72E;
	Wed,  2 Apr 2025 10:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dSgR8S/V";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FDD10E72E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:19:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D73443C98
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77087C4CEE9
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743589163;
 bh=wDJ4uFc258eiDge4h/uScSjW9E6MwIkHrUlsrfzS+IY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dSgR8S/V9MwSexJ3+UubaNuWX37HBGArAGyKnon2hFh78IkjZO9ADJQySYfKxbNFe
 k6l1Xo3Pi7FjqECr7JvlrObttBqEGYYgXhZdxGvApQBDphAM4fjYfxdHz9/Mmjid2a
 UAGKwNPxJSRx2rHbfYuJITSzEoP7Of/XIuuaV2wVJZKfNj/y/WZ/GXGCvwU6jPK5rG
 7KCVC8IeLrzcE2FDQvzX1T79hrwgush0OYeuM4y9gnI3/uToHr1vTp5ZERSmNfLHOL
 M/Wqbj6WmGCsqwXliSTC50YFue0Uhn3DOp5FvQFom0Y6FjuOkxuo2JEO/DfgC3+BUa
 xdjBoM2o1jbKw==
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-603f54a6cb5so601057eaf.0
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 03:19:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWWhl7+x8SsAK8X+CV+pX9a/lXRmCh/1WMBGEqLewHGAuBnxleFhPFPw2UmUF8/Z9umR3b43nML8g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3se+0gDUp1AYaTAQ9wGeoBaCm7WG8Nm0fI8CApS16zTxsrY6Z
 PG1/Rn/LQswZdH0YZuTiDkhMn1zLldGsDDgHOx++1lRQ0h5O9buZf6KggZQtRWv12Byta+O8owk
 cUpxx07i9O6FYDL+0uR3SY1PPo40=
X-Google-Smtp-Source: AGHT+IE7zvgeWqX/8wBcQDMYiYv60jtT97u1ovrrIe0xIvpCZ7noyeyQHsETjwOdSu6zUyrLpfoYEkhapMERTzNH/3I=
X-Received: by 2002:a05:6870:d10a:b0:296:5928:7a42 with SMTP id
 586e51a60fabf-2cc3809cbb5mr3522906fac.22.1743589162731; Wed, 02 Apr 2025
 03:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
 <Z-znv8D3qIcVX-p1@black.fi.intel.com>
In-Reply-To: <Z-znv8D3qIcVX-p1@black.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Apr 2025 12:19:11 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h-xkApZjr9d1+13-gmvVeQPiASF7QGRetkwm_dATMKyg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq9kcLtGOkeQHsFd4lKxJbDmyq0CfIgxF3DWAmagYduMmcRyv12CDtuUFs
Message-ID: <CAJZ5v0h-xkApZjr9d1+13-gmvVeQPiASF7QGRetkwm_dATMKyg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: Raag Jadav <raag.jadav@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org, 
 anshuman.gupta@intel.com
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

On Wed, Apr 2, 2025 at 9:31=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:
>
> On Tue, Apr 01, 2025 at 09:35:49PM +0200, Rafael J. Wysocki wrote:
> > On Tue, Apr 1, 2025 at 7:53=E2=80=AFPM Raag Jadav <raag.jadav@intel.com=
> wrote:
>

[skip]

>
> I'm still trying to wrap my head around the total suspend duration argume=
nt.
> Do you mean the time taken by xe_pci_suspend() itself can change with
> ->suspend_late()?

No, I don't think so.

> Or are there any other side-effects to it?

Yes, there are.

So currently in the mainline xe_pci_suspend() runs in parallel with
other drivers' ->suspend() callbacks, so the total time taken by all
of them is roughly equal to the time taken by the slowest one.

If xe_pci_suspend() is made run in a different phase of the
transition, it will not run in parallel with all of the other
callbacks, so the time taken by it will become a separate component of
the total suspend time.
