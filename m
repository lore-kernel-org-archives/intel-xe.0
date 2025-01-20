Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380FCC02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 19:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F170110E204;
	Mon, 20 Jan 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BwhBirzx";
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4CB10E204
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 19:15:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so8400400a12.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1737400501; x=1738005301;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2A1SxqaKC9E04yxtcM0gBjhhzV82aFBvHScpwEZ6wwo=;
 b=BwhBirzx1O8zqZAVtvF/NFIBCx50oZdbSxfghdo2DY1d86Chf129oSDE6odOhldSlK
 BQxAvA6/GSymhaXnYdSR74bBnZCD39k4kKfolWoOKPG3IHcxchoUVtNKtWRDnPxY9u2g
 +j9iyNHABo1grR6OmoZnmf4kRjj8fxfr6Mi0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737400501; x=1738005301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2A1SxqaKC9E04yxtcM0gBjhhzV82aFBvHScpwEZ6wwo=;
 b=iY0yj+i8sjczHSNxvQA53zO274xWJh5Lop7Yy5oymomCzdypFpa2psAHB2+gKRIuk7
 wY8RQZcSnsCh6N/qsp0zsIUMpdbkaCeEqCaa4EMLxSMbkMeGiw9jr5YHZihOkdFSsGZg
 C78slwKaiDnQGUFpNekmU9EPrEX9YBzIM9wsohLw7R6vyNdxZiANGGVKZTFzOUjRRF7a
 T23iLbL0xxe1sCURw+V0dV48ACkCaRTCX2BpXm0aZhXi1BbUkWYa1/6kKVDMZg7Sm+8A
 nLYIetJRHnF0mkTgKIeCu6GDX7DFLTjgaMzO6RI2xTZAw4RzjJI2X9wpQWsEw4k5ooLo
 mUrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe9vRNGxsod4IeM7UA80b4uq5Vo4VVLH2UAlfoY+hiNufr8qwa1p5A55njrf4jGThYFjVTmXm/+A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykbJPavHNpQOkglSS+pu3aWIOpo8C7zsJD0+8DpdD/rw/+Yv3S
 HyOTaow9D9rnja1N/j7Sk3yyv2ff5NYOKJd7DfIvxNo01Xoa4/0t5R2jetOCcgHmfUuajToYIKE
 b3nE=
X-Gm-Gg: ASbGnctkLuVwGd5i8iVC7fZDzVACFNUjPQyZ2qGf6GQLwY/RAy7PCaQfWadTAy6ghW6
 Wb07nPwJMhb1vbqJWN2LeNDDz/cn7t1NF1kiHBe1RcLUkdBKyNTWdUz9kUF2TpmCdJ3lQZlvtue
 wuY/clzl6CI6kJbU2wnuYv5HNmW0guIO0WnawIydMp+g6Dk47cKWcdZDhN31uT3zsMWYViVli3H
 IR97scllQhJ7M1g5LAt2lKs6lYOMJ9578VLJOghAKTP/VALb0ZkjTuaCLZZVEwQAw5YjytsnFwe
 2BebJWSOAcbI1bf89gtOhdcr4ldIRwsJC2zkKDVzMdm7
X-Google-Smtp-Source: AGHT+IGBKvZqJ/mFtOLMFbGcgv2HLXsKSPJSKBHVBzM929KBb5rIySKV+Hc7t38DHPZj6B2s93g4Mg==
X-Received: by 2002:a17:906:1ec5:b0:ab6:37c3:381d with SMTP id
 a640c23a62f3a-ab637c344e2mr74520266b.24.1737400500841; 
 Mon, 20 Jan 2025 11:15:00 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab5e04c024asm84471266b.148.2025.01.20.11.14.58
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 11:14:58 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1030179866b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 11:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhJJSQbnydEX3c4Awku+okv/m93n+uBUhYgw4EDBkb0jecG4HSMgdmlrS6bOcoGzuipmwjV8iouw==@lists.freedesktop.org
X-Received: by 2002:a17:907:d1b:b0:ab2:dc73:34bd with SMTP id
 a640c23a62f3a-ab38b3cce0dmr1178261766b.48.1737400498031; Mon, 20 Jan 2025
 11:14:58 -0800 (PST)
MIME-Version: 1.0
References: <29ef57a1-e4dd-4d5d-8726-f1f79c698b66@roeck-us.net>
 <CAHk-=whAxUvW-APU42yWfCKHF5NhPLoTida9Jo=A9ZGGgjb18Q@mail.gmail.com>
 <20250118221123.5bb65e64@pumpkin>
 <f3939490-0f55-410f-81fe-0e9f03874546@roeck-us.net>
 <20250119090935.7c690f85@pumpkin> <87ed0xrcb8.fsf@intel.com>
 <20250120111551.435176c4@pumpkin> <878qr5ras2.fsf@intel.com>
 <0a65de6c-74d5-4d3e-be75-0aa9ecc82da1@roeck-us.net>
 <20250120184143.47615b21@pumpkin>
 <Z46cJiyntl9eyXTI@smile.fi.intel.com>
In-Reply-To: <Z46cJiyntl9eyXTI@smile.fi.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 20 Jan 2025 11:14:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYPBhMvCJHFVo=dr=2RhVxKwEf+SLQEBVhANoY_bUk2A@mail.gmail.com>
X-Gm-Features: AbW1kvanWbjjXlxUu-fz3APSBsTAMsHDuCb6rdyKw8tJpJDrImEOFs20uKWXbAw
Message-ID: <CAHk-=wgYPBhMvCJHFVo=dr=2RhVxKwEf+SLQEBVhANoY_bUk2A@mail.gmail.com>
Subject: Re: Buiild error in i915/xe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jens Axboe <axboe@kernel.dk>, 
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "pedro.falcato@gmail.com" <pedro.falcato@gmail.com>, 
 Mateusz Guzik <mjguzik@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Mon, 20 Jan 2025 at 10:55, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Excuse me if I am missing something, but clamp() has a warning inside it, correct?
> Why do we need an additional warning on top of that?

Note: the warning in clamp() only finds compile-time obvious wrong uses.

It's really meant to notice the trivial case where you clam with
constants and just got the order wrong, so you do something silly like

    res = clamp(in, 15, 1);

but it does also end up catching slightly more complex things where
the compiler can figure out the range of the clamping.

The build problem then comes from the compiler doing various *other*
code movem,ent and optimization too, and - like in this case - finds
an error path where the clamping is done "wrong".

I think the real issue in the i915 driver is that it does that
WARN_ON(), but then it just happily continues anyway.

So if the i915 driver instead did

        if (WARN_ON(..)) return invalid value;

none of this would ever have happened.

                Linus
