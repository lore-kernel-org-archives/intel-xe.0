Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD5C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 20:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBF610E7EE;
	Wed, 21 Feb 2024 20:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MW3BaCSG";
	dkim-atps=neutral
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B7C10E7FF
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:37:42 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso7479585276.2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708547861; x=1709152661; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LemITai8o2S9gTBYLEbvTlpnnxm99PXeiUxZksmifiI=;
 b=MW3BaCSG1xJycU3CXmFF8V5hsgTBS/IeZLlfi2xaRiemx4T6Crd3PecUl9/6MGlAeB
 a3fz/wvpHhxj9b3HTJWj5iGHeiH/jeg7seu4kXppQXMUnLKlUGRIb5KlQW6yLBBvhoti
 byM/LaCAgbduSp4Q2AgVkELeZFeFXJOqUUYDHAP5Nzq62a7l38pvScg6i1+cOdiZ+ATN
 aii4VrgxcrfKb96FP54xPulgyHQkUmgX5yYVyKN89d7Q9sNgm6JB1JLiKv/4a1rAFKBs
 do5PAcNc59ivVGHi2OYAqvwYlaFxHthzyXxd4KOcXKolJzuqFrVHx4Mcem7QNvrH+47/
 92ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547861; x=1709152661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LemITai8o2S9gTBYLEbvTlpnnxm99PXeiUxZksmifiI=;
 b=liCrvgFz62ybjzCpkPG7Ubw8NfYTCQiCrSq8GHxFTD48QXzPNJUSfq90PKEt6A6Jws
 vT7twpkOCIl/oup1Z+8PskrNxQBPqZJS20Ih/Bi5oE3t8/OZpT2QgR3e/tSzl0GkBaTA
 AMRJYrQMW11EQoDZ0TI23Fkf/v7mYK5hPsMf/SqCi9WXLCfmuMsR3N9aefUHhyrQFnve
 h9MwcnOZHGm+4I/4wAaxw3vR8wt4B3kg20b7S654Q9XFVxn4wCitY32jRjglultZOATt
 z0A+7WTt6jGziWWNp91YG0d6I5u4IGc66CXuejz9LB3R0U7CIagyYUvUNdX8pPZECkPb
 3lAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvyAHoQgAj40tZ/hwokYjHUkpGFVVT5nu6MuL5Lay1X36IPIn5JwPeiNs0xYcyl/qOnrJ5XEVFHcZGqE8LA28LGIJvfXifXJYB+YHw2Rs=
X-Gm-Message-State: AOJu0YwZmB+P/uvesEkCmy5vOb1Lya5RM5vLBeRiMU6WzE3iibyuc+FE
 8mStegjNdmSMCV5JYooFnHbrhCy29TIbvvTdny1Hy2cylT4z8HQmMYDlM+KfvAYf8GEKY0azYc6
 98pfpswj2iIerbSRr0upFzXfZvW0kbWuk+oMFuQ==
X-Google-Smtp-Source: AGHT+IFZW2SlpqZKS+bsh9fUf4n7GPXvOVLb2xZm8a4atZsgzNMR1d1NSXbs7oSUZw1hV+0Ouk8g+4nF8tRyZ9kGFUY=
X-Received: by 2002:a5b:d09:0:b0:dc7:4367:2527 with SMTP id
 y9-20020a5b0d09000000b00dc743672527mr420992ybp.49.1708547861221; Wed, 21 Feb
 2024 12:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
In-Reply-To: <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 22:37:30 +0200
Message-ID: <CAA8EJpo3X5Ljdf5w8pj+WPQZaqab4mD53VXdAxfLFqsU4mNoPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
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

On Wed, 21 Feb 2024 at 22:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >
> > From: Yury Norov <yury.norov@gmail.com>
> >
> > Generalize __GENMASK() to support different types, and implement
> > fixed-types versions of GENMASK() based on it. The fixed-type version
> > allows more strict checks to the min/max values accepted, which is
> > useful for defining registers like implemented by i915 and xe drivers
> > with their REG_GENMASK*() macros.
> >
> > The strict checks rely on shift-count-overflow compiler check to
> > fail the build if a number outside of the range allowed is passed.
> > Example:
> >
> >         #define FOO_MASK GENMASK_U32(33, 4)
> >
> > will generate a warning like:
> >
> >         ../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> >            41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> >               |                               ^~
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  include/linux/bitops.h |  1 -
> >  include/linux/bits.h   | 32 ++++++++++++++++++++++----------
> >  2 files changed, 22 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index 2ba557e067fe..1db50c69cfdb 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -15,7 +15,6 @@
> >  #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
> >  #endif
> >
> > -#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
> >  #define BITS_TO_LONGS(nr)      __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
> >  #define BITS_TO_U64(nr)                __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
> >  #define BITS_TO_U32(nr)                __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
> > diff --git a/include/linux/bits.h b/include/linux/bits.h
> > index 7c0cf5031abe..bd56f32de44e 100644
> > --- a/include/linux/bits.h
> > +++ b/include/linux/bits.h
> > @@ -6,6 +6,8 @@
> >  #include <vdso/bits.h>
> >  #include <asm/bitsperlong.h>
> >
> > +#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
> > +
> >  #define BIT_MASK(nr)           (UL(1) << ((nr) % BITS_PER_LONG))
> >  #define BIT_WORD(nr)           ((nr) / BITS_PER_LONG)
> >  #define BIT_ULL_MASK(nr)       (ULL(1) << ((nr) % BITS_PER_LONG_LONG))
> > @@ -30,16 +32,26 @@
> >  #define GENMASK_INPUT_CHECK(h, l) 0
> >  #endif
> >
> > -#define __GENMASK(h, l) \
> > -       (((~UL(0)) - (UL(1) << (l)) + 1) & \
> > -        (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> > -#define GENMASK(h, l) \
> > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> > +/*
> > + * Generate a mask for the specified type @t. Additional checks are made to
> > + * guarantee the value returned fits in that type, relying on
> > + * shift-count-overflow compiler check to detect incompatible arguments.
> > + * For example, all these create build errors or warnings:
> > + *
> > + * - GENMASK(15, 20): wrong argument order
> > + * - GENMASK(72, 15): doesn't fit unsigned long
> > + * - GENMASK_U32(33, 15): doesn't fit in a u32
> > + */
> > +#define __GENMASK(t, h, l) \
> > +       (GENMASK_INPUT_CHECK(h, l) + \
> > +        (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > +        ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
> >
> > -#define __GENMASK_ULL(h, l) \
> > -       (((~ULL(0)) - (ULL(1) << (l)) + 1) & \
> > -        (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> > -#define GENMASK_ULL(h, l) \
> > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> > +#define GENMASK(h, l)          __GENMASK(unsigned long,  h, l)
> > +#define GENMASK_ULL(h, l)      __GENMASK(unsigned long long, h, l)
> > +#define GENMASK_U8(h, l)       __GENMASK(u8,  h, l)
> > +#define GENMASK_U16(h, l)      __GENMASK(u16, h, l)
> > +#define GENMASK_U32(h, l)      __GENMASK(u32, h, l)
> > +#define GENMASK_U64(h, l)      __GENMASK(u64, h, l)
>
> This breaks drm-tip on arm64 architecture:
>

Excuse me, it seems a c&p from gitlab didn't work as expected.

arch/arm64/kernel/entry-fpsimd.S: Assembler messages:
arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:66:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:66:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:66:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:66:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:271: Error: unexpected characters
following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
arch/arm64/kernel/entry-fpsimd.S:66:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:98:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:98:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:98:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
arch/arm64/kernel/entry-fpsimd.S:98:  Info: macro invoked from here
arch/arm64/kernel/entry-fpsimd.S:282: Error: unexpected characters
following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
arch/arm64/kernel/entry-fpsimd.S:98:  Info: macro invoked from here
make[4]: *** [scripts/Makefile.build:361:
arch/arm64/kernel/entry-fpsimd.o] Error 1
make[3]: *** [scripts/Makefile.build:481: arch/arm64/kernel] Error 2
make[2]: *** [scripts/Makefile.build:481: arch/arm64] Error 2
make[2]: *** Waiting for unfinished jobs...


-- 
With best wishes
Dmitry
