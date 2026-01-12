Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F885C9EC99
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 16:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F231D10E411;
	Mon, 12 Jan 2026 16:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="m7YOWKh9";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE9A10E40C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 16:04:00 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id C50A33316DE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 16:03:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1768233838; bh=hr2la+8/JBfPcYjUwUtbWIuE339Cr77t3Ej9auuplwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m7YOWKh9Ctc5Xv+QcttfB+FX/pr1De3t7mdV7SdlUEqrhZYYMUJHN3LdpNCBGd3Y2
 ZjIKf7y7JQDoWtiydd7Sc+drNjjonB5N3J5PTmSw/lFLnKE9j/zq5KYy2neM/hbSwF
 drF2HqtzSlWXqmc52YmiczEqKVdKgSt4VwFFwA5U8n22Qv8XWfyS+vblWUVC78d0MR
 6f8iWJ92+7B8XtsLAJ2IxG/W4H5zC7LRRIErv/5sLiqsUUoBwjHhafRmUUujNnVMB3
 s/HmyJyAXEpAiM8BNo5x3y4Zbpl6KPXgFuJewNK1xHQI6pNzU0MJhZrUBg7ckQeEqJ
 RBwB/2dRdXFAA==
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-792768a0cd3so16139437b3.1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 08:03:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXhC8lv0zMkVLv78ePY71h3lsp74ZghqPcC/MDNUOC6nYfZwggzKlkarw/x/mOc+lINHE7H0kgdeQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeW2rjd8KKT0V4fcBJwPu6eiLsJ/5cgiEYIaD803Zjz8Xg/7al
 memrvp4vM78icBS+LmjX1XRCPFzn/kSEdDvylIEZbjwIUmRgZ2mFMuhH9TaWyoNuys9HdtBBM5Z
 VVrqQNE31AYDUOyInsxI+YyoE0vtdaRo=
X-Google-Smtp-Source: AGHT+IEhESDidL9ipWyioVB98E0jff2u4z7/bM7Ubxstme7Bh1kkDw05miCNdkOT9ec3RpZmQlooAES9QRtdTG4sTE0=
X-Received: by 2002:a05:690e:1c07:b0:644:2e1b:c8bb with SMTP id
 956f58d0204a3-64716c58c47mr14446417d50.59.1768233837397; Mon, 12 Jan 2026
 08:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
 <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
 <702511b9-28bc-4ea0-809c-f14135a80af1@mailbox.org>
 <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
In-Reply-To: <63c2c8b1-d695-454b-ada1-b79d61018bd6@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Mon, 12 Jan 2026 17:03:46 +0100
X-Gmail-Original-Message-ID: <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
X-Gm-Features: AZwV_QiS6uAS3cm2nJoqLpeAb3FcK1vPpWaMcJpsefkzkTvrPaAofwG-GcaXOKY
Message-ID: <CAFZQkGw5GTsebz_7vp48zkwtfNfu1uRU3p=nhibY8+WxgeEBOQ@mail.gmail.com>
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar,
 Naveen1" <naveen1.kumar@intel.com>, 
 "Syrjala, Ville" <ville.syrjala@intel.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
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

> > I see no request for being able to mix sync & async plane updates in a single commit.
> >
> Sorry maybe I might be creating more confusion or my words are not
> giving clarity.
>
> Let me try to put it in simple words.
> The
> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2857640)
> from Xaver says that disabling of cursor plane along with a sync flip
> should work.
> Uma in the
> comment(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2863599)
> has acknowledged the changes.
That's about a plane that was previously already disabled by a
non-async atomic commit. The issue is about the async commit failing
in a sequence like this:
- disable cursor plane in sync commit
- disable cursor plane in async commit + flip on the primary plane

I would *in general* like to be able to use the cursor plane while
doing async flips on the primary one, but I think doing that requires
more discussion on the high level API design first.

- Xaver
