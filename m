Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED33CC0218C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 23:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8610E647;
	Tue, 21 Jan 2025 23:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YLO4JiTt";
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5D10E645
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 23:15:29 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so12204879a12.2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 15:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1737501327; x=1738106127;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3CzgTo91p2JzpEW+JctKkaLkKIND/CdJFB7oWX/HWBA=;
 b=YLO4JiTtvrBCwWaTfU11QpnFvDD4pKoAbMxFnIMcgiEzFiiTkRkgG6W6W/Iw5rLYqU
 j1ogchRDOYqFQJip9bVu47XocAGe/R1mB+2BMniFAlW0PK+jgJpRHoCdt3C5z31yZWZ4
 9A8hrRpKhLX5lUzLx2yWO5Ylat6XjmBEvLGxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737501327; x=1738106127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3CzgTo91p2JzpEW+JctKkaLkKIND/CdJFB7oWX/HWBA=;
 b=SFoA9AUUEYekacT8h5oSrg/3vGlOTwfdSfTU5WgsZND8+xIfy4jhdn1zyjbECQmzoo
 O+v97TIwMnyR8/LXQ+DEQ+PShjYz/yfrY8z6GXDeik6eq3AebkhQhn9NHw7ex0NyDPLM
 z8PbcmR5TOIJd2HljLvKQkBfDaXGi11SStAuLOLeYgompFewsEXBPBokAGELxTZfcPVe
 OfNv//zsiZ+H3UXS11Isr5rvIrfs76iV76snfNAs9UQEcB9r2nOkmErJQ2E8fShqhDZy
 /hJJnxTVKz5n6rpPkl0A3k6El20GZPZFbfTf+qiKfBnLfCsNS3MtjY1mmck/Sdkzn2mb
 RVUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2W4n744AYgQMBEyq5LEN7BkxCmfOY3L38QkLJpwweFNbHHrhLzJ+KoevgrBf/PvYmAOpqyQIabg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx63LMlZ93tGPQgDnVfu6RSDgffQXSrdvYWXsoFgPm/b9Ibtr8
 eOR1OSpGrErDkModokPgP5r9D7vLl/jBrLBl6/CzhNthjJH5N6pKmiWSXWcMj94qqTNq4NslDkz
 TX7I=
X-Gm-Gg: ASbGncsOgbpDDX+SDWFfGZmpUvynEOGKGbgiwcM7GqSVG3FXy3Km2tLopeGHzXyS6HC
 vATqgXvl0I7cVarU0+Lj8yrWs6DCGnqr/wFFw4+RKFIAVfr+5154b5iKjPlE/ktIM7wBsyXjkk9
 yxpWPZkZqZAQT4oF6OH2CpmwfL4gEAztfZ3zGJ8S0TjDemKJ/d/EN+7P9QmDVyTdaTZkyBFqIHX
 e395MqOQEagrc0uSZKiCbfxF9tZaCR5TQXmMQ1URI1mRk7iFyfSbNDkI7+5sBonFuARcqIVxgu2
 nTEJzxLFgzj3aHGl2Cvan0sE0xJ5QLKTujj/9LpDB7Sd
X-Google-Smtp-Source: AGHT+IEHkgit/JO83IZ81Awh+3li8V5Ppyqw12Rn4iikK7beAFgnts+mAo6qvshQbz7Yq2om0pDqWA==
X-Received: by 2002:a17:907:da1:b0:aa6:2a17:b54c with SMTP id
 a640c23a62f3a-ab38b0b90cemr1610362066b.6.1737501327467; 
 Tue, 21 Jan 2025 15:15:27 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab63b66ce19sm173415966b.174.2025.01.21.15.15.25
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 15:15:25 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so1221505966b.3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 15:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXw4BmnGkQNJrKiA7Zz86YDmSVGZkrLbfeFfZd4ioZ09EXK4y4o1MyCXFLn+5aXx6EKGQfPvi9StA==@lists.freedesktop.org
X-Received: by 2002:a17:907:7f03:b0:ab2:d96d:6364 with SMTP id
 a640c23a62f3a-ab38b10ade0mr1648380366b.18.1737501325402; Tue, 21 Jan 2025
 15:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
In-Reply-To: <Z5AmlJ8stVQ4L5jS@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Jan 2025 15:15:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
X-Gm-Features: AbW1kvYKV26mhyqOrtUvp86nodxXf2uwO8fs5mpSdjqoyzGKlqO6hShDhX9VCRY
Message-ID: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, David Laight <david.laight.linux@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> I'm pushing this soon to drm-intel-next, unless Linus want to take
> this one directly to his tree

Let's just go through the proper channels and go through the drm tree.

Unless I've issed something, I think this is only an active issue on
parisc (and only with certain compiler versions at that), so it isn't
some super-urgent thing that needs to be expedited.

Thanks,
            Linus
