Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E209C02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 22:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025C510E272;
	Sat, 18 Jan 2025 22:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gH3cAqdA";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1147F10E272
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 22:05:31 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab34a170526so461635666b.0
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1737237869; x=1737842669;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YB1GEf0GoTBVoPvw06gl5EWzQu13P/vkVxbv6WO+xeE=;
 b=gH3cAqdA34MH84d1cZ2I/pcxLA5F5ypp6puLoHBXfR3lG/NYjGCY5GKTkqIgc95R+2
 rRHrxD9da7wkvEQoh5+ozRySmnSu4rSOmWdXSDQ9NJhdfOPA/mosDJKcNcc3DBfSscH+
 Qzs3stwB7DLlEh8UaitpwD70p1Tp3nvioThXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737237869; x=1737842669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YB1GEf0GoTBVoPvw06gl5EWzQu13P/vkVxbv6WO+xeE=;
 b=uq/1lVSEawjJLOhWo+e/0LQYuRWuo5UyS1n0uWtLqjBemxM2IwoMvXrpKH4gKY9Eku
 RXIF1X6MehLhkJujW/OuPtARAX4kr7QK7Cb1AIzYsLWlmPbKzXg4CynKk0rGesYgr70/
 ggTfz8IIE6F6zNyNDfD3rahyWuWaQvTHrMpY1pVaFBYy1Bkwozh+szNJSEhou7Vrop0W
 QI8MYioKmFbvue4d6qAZUBXK78hkW1q+/rsHpsgWWSlbzPBeZx9b2MYt7ZU6222cK3wj
 Q4GNLwTJb6Cg8Xco6vRm+YSAsKzs8G2rCN7fWE1OeEkb9ju7Dc6kMKzra6JCAzK8rTXw
 bNTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmKbKJJ9XvpOVfULYROdgRShISHSyEaYnikHQlS/32hWeMSVPrES832l1MAaROAFM+pbJXI9qsmA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIaWrB0jcHVb87zuPUooU4LHoqJs8SasSBaJEDeff7BPhT1oIU
 84hxnaAI9s5MqXHlkRc/RNLlGOipIggKlMsfGQzHon/Bj8mM/sSwXpXy9prifz0qmsmSE3kzqWJ
 HFPk=
X-Gm-Gg: ASbGncsck59Ll+dYZi4oUn4Zp7PJXWrC1RnK24xCPGJrmpEiBxWUeKFqsB2wVP5AnKs
 8tDh/G5iW8pTmLoQMoB9eoxuDvNZS2hrZPBGoap0Q458bxbGelGgw5DtGYA4D6HzSqXhH1aDGBH
 kRRBn1MEAAkuoci+f6PY3TtjRnSgrwZJCtMhK1ZuQRTNNXid3KbQLSbnVaTUWuUQPRE5cl7j7nZ
 x1ZYwDU7t/0IF4Ar+6LYD45DNkieqxDHboFKk3nP/EnHMbb8oduvIwAxMkfHdswnPff2+t4m1SP
 h4+a+VApzAuKh57CgYMtItJ95LA/IGUWFXTeIq61j4/d
X-Google-Smtp-Source: AGHT+IEhPDjYguMQD2gq2mbAYWCD6+1W6lRTZQms9QP2vpstwaHwX7XPxG1kXDDGqxOhcq74HcGOwQ==
X-Received: by 2002:a17:906:79a:b0:ab3:a0ad:17a9 with SMTP id
 a640c23a62f3a-ab3a0ad203cmr356612866b.24.1737237869421; 
 Sat, 18 Jan 2025 14:04:29 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f86e4bsm398424066b.145.2025.01.18.14.04.26
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2025 14:04:27 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso554585666b.3
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 14:04:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXi7ugr07FBTAa6Fe37LRyOQfU7D43zEWI5fV0McwVgPm4sAmiZtllK++x8rTqHvl09908zlmsrg==@lists.freedesktop.org
X-Received: by 2002:a17:907:3602:b0:aa6:7220:f12f with SMTP id
 a640c23a62f3a-ab38b10cefdmr665797766b.18.1737237866493; Sat, 18 Jan 2025
 14:04:26 -0800 (PST)
MIME-Version: 1.0
References: <c50365d214e04f9ba256d417c8bebbc0@AcuMS.aculab.com>
 <34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com>
 <ce600782-1012-47e3-ba3d-41c5a4b7a7b7@roeck-us.net>
 <20250118170959.3aa56f4d@pumpkin>
 <29ef57a1-e4dd-4d5d-8726-f1f79c698b66@roeck-us.net>
 <CAHk-=whAxUvW-APU42yWfCKHF5NhPLoTida9Jo=A9ZGGgjb18Q@mail.gmail.com>
 <0f28a0b7-c24d-47d8-92f0-8957207ea309@roeck-us.net>
In-Reply-To: <0f28a0b7-c24d-47d8-92f0-8957207ea309@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Jan 2025 14:04:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLV3vk5TanOci16txzuQfQgxZHaGZjTWudLf2hKHZB=w@mail.gmail.com>
X-Gm-Features: AbW1kvZhcxgIQAYPCZcf728Ps39d9XCiTSxU-oFml2GX2TTEJHO14LUZUSWwEWU
Message-ID: <CAHk-=wgLV3vk5TanOci16txzuQfQgxZHaGZjTWudLf2hKHZB=w@mail.gmail.com>
Subject: Re: Buiild error in i915/xe
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Laight <david.laight.linux@gmail.com>,
 David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, 
 "pedro.falcato@gmail.com" <pedro.falcato@gmail.com>,
 Mateusz Guzik <mjguzik@gmail.com>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Sat, 18 Jan 2025 at 13:59, Guenter Roeck <linux@roeck-us.net> wrote:
>
> I am not sure what to do here. That kind of problem seems difficult
> to avoid, and I am sure we will hit it again elsewhere. Should I declare
> gcc 13.x off limits for parisc builds ?

No, I'm sure it can happen on other architectures too.

I think the only thing that makes parisc trigger this is that its
WARN_ON() is slightly different from others, and uses the
"__ret_warn_on" a few more times, and that just happens to make the
compiler decide to simplify all those tests.

Or something like that.

           Linus
