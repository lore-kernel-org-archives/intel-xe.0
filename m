Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A821BD1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25010E79D;
	Thu,  8 Jan 2026 16:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="G6CswSjd";
	dkim-atps=neutral
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4553210E79D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:54:12 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-59b6f04cae6so1878196e87.2
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767891251; x=1768496051; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tFEi7D1Ny0FGyhvAd0NOx+lhbZg2wFDhqn24TA+o7I=;
 b=G6CswSjdFRBoeUK0S8LcMQk3lz0jMJKokxLUqFCUzfL0boWFWBZpy2Ie8gXkjDRupp
 orouDH0QfHLXGTdz5gRUQwMOTzJ3l57oIcLu5VT3MTMus9umdU3m5J2VBPnFsUgy59qf
 5fSDfsnzjx1yw167+/6ihzUSQp5hbOnHKu9VHiSL/mvK6z1njn66KppkFIklj6aZpys6
 cJN84fx1xKXJwthCMRkVHQM2muNmuo61z+MT3DeVavPrG3K87z0kgf+iBodVxoP1DoDi
 yTjQefVixl7a4SFER7hIWyeYIPyA7zAC8uFHPfABUUICSxseHW0lhXBs5igD+0FGKEEs
 OZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767891251; x=1768496051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5tFEi7D1Ny0FGyhvAd0NOx+lhbZg2wFDhqn24TA+o7I=;
 b=gTxjMzYvj8JM9qAauQeq8r/fKbeU+ovz0z3YCaBL1/MSsfk1TwG5CeldDE4kEeedzi
 zxGyo0OSMiXr6Z3ThZpZhWNEIaq/NEin9gfXSU0BjRK7ouzGbFAeOmtaivinqVfSBXx2
 trMiQJLyMyett1UKksxL5N9r9BgDiSMTtybjlREEyqXqrqqABMhYOwuq6PCr52I8FTqv
 B9GnVbzSRTkgSuwjX4Uhfpfqj+jYwczY3F/HAHvd9GIpPIk28t4Ux3BdfG9Mtea2kzP/
 5n5SQ/uZ619vsjzwXPcdchpcLPodxnIu4RHTjdYGXwK6d+l7GBhB0irrIxHovLgaCZi5
 v37Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpJHv1dbeGrcI4moXReTHM0Sy+lWHcwVD91WTl/RHu4RR5HTmdlBkInMpo/IW/pB8ewjGqBwJ4IQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtkSlK9a1P4AEvXlTbT/DHcHc4xooePZPJBhzntFRLJ2CRiz4Z
 MVC6DD9F/tLvviAbxpwrWnlI4o0Y9XPoEJZQTDAPd8cqoAwaFJVX251gL3cowitcwyX6n3M0+xV
 e73mOXL9XSjq2Erf4NP2wGHy0vpPPTg32tXty9gmFwg==
X-Gm-Gg: AY/fxX5sVaDVEVjUqt7E5i4ba/BYY7QBjyZOLOPxgdLmb3w80pCSbfo2652yb/1nmGV
 MGXhILfV66fbMhgmuoLJiNiUkXUsJ1iNZa7h2Pp44vIXxThLPS0m0V4PUQqoVDBC0RqabPUUR59
 FjkHXtWDy4+Sw8hihXhQAlk8yoROo6wm8XQ2Be65SsV2GHmy5lROojB3FLwD6oK/D9/zWy6vzaV
 RHgJ2ZGWUDMb2j8VWdq6o9pLxG/2j3yMbGKX5+wB1r7jCgGkTJbIdVtPLGXl98bi+35jn0aXlqg
 NxM9bD6fpJ5trr3aNsf7nvYj1U5F
X-Google-Smtp-Source: AGHT+IHcaq3Iod3MNNgnnvFFNIpcziSsOqmmFlOGlQ74iUyxAGstEgFcIYPH3qVrmLUpnmc350OzASEAfdSgs1QHSkM=
X-Received: by 2002:a05:6512:10cf:b0:598:de74:7a66 with SMTP id
 2adb3069b0e04-59b6f023bc8mr2163410e87.26.1767891247505; Thu, 08 Jan 2026
 08:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20251103170604.310895-1-marco.crivellari@suse.com>
 <20251103170604.310895-3-marco.crivellari@suse.com>
In-Reply-To: <20251103170604.310895-3-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 8 Jan 2026 17:53:56 +0100
X-Gm-Features: AQt7F2oYFLywsT6cVyy-Fw18Te-lDh35_yrTBGDJ2XEJK1ILpY0zCAOBMCVlL-4
Message-ID: <CAAofZF5iwRcEg9813aZf+Bib36u3K9MSjCwt478rzxuKW97gcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/xe: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Hi,

I realized something in the meantime, looking manually at the patch,
while preparing the v3.
There is a bug in the alloc_workqueue() line in xe_ggtt_init_early():

On Mon, Nov 3, 2025 at 6:06=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5edc0cad47e2..566163ab96ae 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -291,7 +291,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>         else
>                 ggtt->pt_ops =3D &xelp_pt_ops;
>
> -       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> +       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", WQ_PERCPU, WQ_MEM_RECL=
AIM);
>         if (!ggtt->wq)
>                 return -ENOMEM;

> -       ggtt->wq =3D alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);

The workqueue flag is the 2nd parameter, not the 3rd. The 3rd is max_active=
.

I will send a patch in order to fix this before proceeding with this
entire series.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
