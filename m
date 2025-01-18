Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE661C02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 21:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C6510E128;
	Sat, 18 Jan 2025 21:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DrGMDYXL";
	dkim-atps=neutral
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4110E128
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 21:30:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so5572166a12.0
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 13:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1737235777; x=1737840577;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3rmAmF4zRJmZR9DRaShKjbljcGEH0rs0PBNSPxquwxM=;
 b=DrGMDYXL8MO2wNBviOwe3bNd8ZHgW2UFyfOysv7ThIAWYUUOXNL8qyxE6buLqQeqRU
 LurkyDRLKZ8/nR/53maspO8amHRuK7Uvj6fa/R0sQB1hb+ha8dB+y9sBtgO94Ln1ofjg
 WWCq9xXAHIsDHWrTfx4A+HychGb1KT17QkmeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737235777; x=1737840577;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rmAmF4zRJmZR9DRaShKjbljcGEH0rs0PBNSPxquwxM=;
 b=uRcFVODB7hoIEEtWr1QXCHFRnJk4X/66UG9jqSObdG+/mXKXzKY+cPs7+A86opoT1y
 yPN/k5TmuctcwJ0+3msRWsPTklZAJU/+AnHkAPZFBSoIdIWD0x4NlnWaluV3IF7Uh9Tt
 sKTpr5k6PUnMD7cCWrpyHb6M+PUA9QBfVTwziFGyMqVK3R34jKsI3UuMcs7x/YE8X1Fh
 EREU0cYnfjuVcO6e5dWJ6nrE5ZUpAQfX3R3xr249eeavu9zGvp1Lc20z02lgcquaKWPq
 8gN/OAKzw+tNqlDITNWDGsbWiMvtkvpBgwILosHkFtIZ3OafNc3bvq8Or9z2K2/3ajzs
 kuDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+OuQH28+ScJtwXbq+2Ev/otiNCJvkmIT8xmERL16PA31EWjfkUFiTc58qHv0Fd82TGTQ7UUjVEw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu6GsKmNU/4j1ZSZ+Q13sQRbgHTzC6EcxLwX3zYeX1cZcdS/Ly
 /t0zmDcvJyv2v3V7La0Bgfl3fE05RQLfz/g02f0gbelO5qmbpb38yInsRzf2LqJEjiiSeSOWdLy
 egWI=
X-Gm-Gg: ASbGnct8tFD8oXbKIGjFNTDa1TGnIJ3LMYBHdoda8zdpDTorAPlduBz7sdVW7LESHKo
 lPATroVNUx7B/Et1SSGc9EmwVPEA8HWC3fqbGYA0xAmdcTYqBVxhy38Kbx+OKRMZAuLYDz4DLwf
 R2zJUDS+yhc6U9W769KCEOwH1sSiY/vAa7G8nUzvVpZkHHojBEiT9iBw08YUZalEDiIybKTX8X6
 mtXeJcwiyYrXO00Gg5IIVb4micq8snhitsvX49n+kjIezvT2K4jJUP59ASF17cvApXbz2Xb4kV/
 xl3FpdAixKYoqq5r/InxeFkMpIgko5NWaGBJjAH7I/qV
X-Google-Smtp-Source: AGHT+IGrEaBvghVMThGj7dMsPYbpOwfG49+j/4KMlnm01D6SL6pjqNTGMNcKV0WiGchNjnJOaFYt9w==
X-Received: by 2002:a05:6402:4308:b0:5d3:d917:dd90 with SMTP id
 4fb4d7f45d1cf-5db7d2ec11fmr8088455a12.6.1737235776768; 
 Sat, 18 Jan 2025 13:29:36 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73edcacesm3558343a12.67.2025.01.18.13.29.35
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2025 13:29:36 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so233818966b.3
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 13:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU4fr/AsWNXX5FrYxvaciGxSCfO2FrkMlrMRdhZ1x0cwx75CH7kLJ+YB8cAl77FkubBp1lhtlXCmg==@lists.freedesktop.org
X-Received: by 2002:a17:907:7e93:b0:aa6:6ea7:e5a7 with SMTP id
 a640c23a62f3a-ab38b190f6dmr725958666b.28.1737235315191; Sat, 18 Jan 2025
 13:21:55 -0800 (PST)
MIME-Version: 1.0
References: <c50365d214e04f9ba256d417c8bebbc0@AcuMS.aculab.com>
 <34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com>
 <ce600782-1012-47e3-ba3d-41c5a4b7a7b7@roeck-us.net>
 <20250118170959.3aa56f4d@pumpkin>
 <29ef57a1-e4dd-4d5d-8726-f1f79c698b66@roeck-us.net>
In-Reply-To: <29ef57a1-e4dd-4d5d-8726-f1f79c698b66@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Jan 2025 13:21:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAxUvW-APU42yWfCKHF5NhPLoTida9Jo=A9ZGGgjb18Q@mail.gmail.com>
X-Gm-Features: AbW1kvYv-hMWPkhbpIj1M-_2IHkjo_-SJWP7s5FFXlSWPKQ3TuGFR5sriOZzFKI
Message-ID: <CAHk-=whAxUvW-APU42yWfCKHF5NhPLoTida9Jo=A9ZGGgjb18Q@mail.gmail.com>
Subject: Re: Buiild error in i915/xe (was: [PATCH next 4/7] minmax.h: Use
 BUILD_BUG_ON_MSG() for the lo < hi test in clamp())
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

On Sat, 18 Jan 2025 at 09:49, Guenter Roeck <linux@roeck-us.net> wrote:
>
> No idea why the compiler would know that the values are invalid.

It's not that the compiler knows tat they are invalid, but I bet what
happens is in scale() (and possibly other places that do similar
checks), which does this:

        WARN_ON(source_min > source_max);
        ...
        source_val = clamp(source_val, source_min, source_max);

and the compiler notices that the ordering comparison in the first
WARN_ON() is the same as the one in clamp(), so it basically converts
the logic to

        if (source_min > source_max) {
                WARN(..);
                /* Do the clamp() knowing that source_min > source_max */
                source_val = clamp(source_val, source_min, source_max);
        } else {
                /* Do the clamp knowing that source_min <= source_max */
                source_val = clamp(source_val, source_min, source_max);
        }

(obviously I dropped the other WARN_ON in the conversion, it wasn't
relevant for this case).

And now that first clamp() case is done with source_min > source_max,
and it triggers that build error because that's invalid.

So the condition is not statically true in the *source* code, but in
the "I have moved code around to combine tests" case it now *is*
statically true as far as the compiler is concerned.

              Linus
