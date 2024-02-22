Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C023C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 06:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07910E874;
	Thu, 22 Feb 2024 06:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PNS3u6Y/";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381410E871
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 06:00:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512d6bcd696so500395e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 22:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1708581609; x=1709186409;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
 b=PNS3u6Y/mQpUg+4aby7DSoe78BtCCui8vc3S/w7BaP3RL+GM+k75qotvQ98zk195+Q
 Z7y6FLV4U2xYW4yPa6MXYgSCWB77LtCyT8E/8NU3vKX28wV4QHOVD/jqnk+sqz9HIk9W
 crstrh5V1xkdG0WZhTFKy9xA9n4bLIdl0EzWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708581609; x=1709186409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrfADjbK9wBe+Anypf28Boz5+FV1y2DabiZpnaLd2+Y=;
 b=gSQFl6J31CehBbTA01WsW0t0RuzZYa2tkHQW+JICZ6aU1vMOY6y7SlQfJcC9OhZgk9
 8J4VKQdnT532ksxrnX0vsGHpXO0bnd+/NEIMnj/Zx+sAp90BetczMeIcj8Ge2CT1cuLV
 A62vz0DIo32whHpDm8nZcH1kudR20N8JOGgCDhnMwpTNHbbxv+XL7gH2aUkqrqA5TpLj
 Xqs1szJ52iULDUPeErhXHB+0wfb2Vaj7OpuAh9MVjrPB7rXGAtOz0curEwz3h2frJB3D
 g2JTCa7LU73x3WGCcUwDYk7Cwrty/1077XilVJ3TVceZb5hIVcnhNhA1zKJ1pVqFscOa
 1MSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ3QLFAhbmwFoe87PwV1FQifiSwfYv3g2lHX8JNQXNnwoPfPdhfQ0ypbZqHj/7Bg9Ls3gYnV5YCa+fz05BoGi9Y76CgpNepvc0xQEiHiM=
X-Gm-Message-State: AOJu0YyPkEhCBc/gciJ6NFzmWH/0O+XBPZ5IHUS0BXD0d1Wa1Fmc/znY
 YkkSyn3oerC/Rd1pbe1UsyOq5e/3fvmUZfT6nkB25gTtlzE5q6QKfW5bbpWO6A9ecuWPBxAWZO8
 Jja4eSQ==
X-Google-Smtp-Source: AGHT+IGFzs2ikIorWoid11H0nRat8h+DalS9DnuZnbLoCRCOHPr+nJpnSLU9V5A+UWi5Scad9kfyDA==
X-Received: by 2002:a05:6512:23a0:b0:512:da75:8288 with SMTP id
 c32-20020a05651223a000b00512da758288mr670100lfv.21.1708581609611; 
 Wed, 21 Feb 2024 22:00:09 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 r7-20020ac252a7000000b00512d89466c2sm288982lfm.135.2024.02.21.22.00.08
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 22:00:08 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d2628e81b8so1377421fa.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 22:00:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkTueLkQ2PPBzudU8yMY9lEVZv7I3HNflqS6MIB1IVNAwAP7DHCWuexOl2//qYp6Z7ILw1wEPMaKRM2q2RQqecCFX2go+PnK+iEN/VUZU=
X-Received: by 2002:a17:906:f0c4:b0:a3e:719b:c049 with SMTP id
 dk4-20020a170906f0c400b00a3e719bc049mr1321213ejb.28.1708581587292; Wed, 21
 Feb 2024 21:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-9-davidgow@google.com>
 <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
In-Reply-To: <anz6qjyb2oqkz6wdy4ehnlpoujy4rz2itohpglgfqzadtonxtj@ljakgnqmfxxh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Feb 2024 21:59:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Message-ID: <CAHk-=wgafXXX17eKx9wH_uHg=UgvXkngxGhPcZwhpj7Uz=_0Pw@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm/xe/tests: Fix printf format specifiers in
 xe_migrate test
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Wed, 21 Feb 2024 at 21:05, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> this has a potential to cause conflicts with upcoming work, so I think
> it's better to apply this through drm-xe-next. Let me know if you agree.

I disagree. Violently.

For this to be fixed, we need to have the printf format checking enabled.

And we can't enable it until all the problems have been fixed.

Which means that we should *not* have to wait for [N] different trees
to fix their issues separately.

This should get fixed in the Kunit tree, so that the Kunit tree can
just send a pull request to me to enable format checking for the KUnit
tests, together with all the fixes.  Trying to spread those fixes out
to different git branches will only result in pain and pointless
dependencies between different trees.

Honestly, the reason I noticed the problem in the first place was that
the drm tree had a separate bug, that had been apparently noted in
linux-next, and *despite* that it made it into a pull request to me
and caused new build failures in rc5.

So as things are, I am not IN THE LEAST interested in some kind of
"let us fix this in the drm tree separately" garbage.  We're not
making things worse by trying to fix this in different trees.

We're fixing this in the Kunit tree, and I do not want to get *more*
problems from the drm side. I've had enough.

               Linus
