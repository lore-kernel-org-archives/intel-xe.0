Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA1DC5478A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 20:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ADA10E7EE;
	Wed, 21 Feb 2024 20:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Do6tnqkO";
	dkim-atps=neutral
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2010E7F2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:30:15 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-607d9c4fa90so73886887b3.2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708547414; x=1709152214; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=66B5lNp4yjRK1cO3QunmxwT8ngO+zkQK07F7H5Y6E9A=;
 b=Do6tnqkO3SkQDsiruvEKuXAap+fbzpWetjJmBwm9EUmCVQooPszzPGGUQr84dt8yoK
 Cgw3iT7GCh5BcccFt+QEjz10NUJ9kwyVK7ANJTFrLCjUCn5HP5J4FeNS4urFylGRC6Me
 2ZVvyDuZ2JIp/ZKh1NQZiB9gxk17htjE+4JcjAU21erOCt0Nua4+67Nmd0TKPJlNQfwU
 4wYysZxfesSCjgX6IE22pPDc9rIScCHc+UuINbp1a6xVoB6wu63NuQo06xghWTesXSkh
 lx04lLywkhKVAHls+PE3A7kSF50uPCxQ/9LbYIc0zRWVsqGpwW1jPi/4H16xVNksLgPu
 NitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547414; x=1709152214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=66B5lNp4yjRK1cO3QunmxwT8ngO+zkQK07F7H5Y6E9A=;
 b=wiO/Vnvb3AT0MVEYp0GItMxOEHaLFPDxcvMf0MTsUMKHrkk/z0Sg248rK8uvfYvg0o
 mW26fkUU4uwrW4cNBVyXAsBx2DUq6QJVt4ttdvjsSoFupHYKNmB2toH3K9X01axO4h0b
 3tiT/f5jGiINXpJ0rrDnT8wTjdtux/bNz2cXqjJ8zJOL7zi1Ik0K6YA3BljizWw8XIIg
 i1g4ut1p9Y/yBdgJBf10gHjcOWATIdpunZYifRUqdxhR9LvJTOHEIKpEh7moNmC+PMVV
 gMgvumBHl8TEMnJH/iZVufphi0Z9ZK7rFgoDu3qOo7S7fDsaxTMcfIVV9L9uKZGwAx29
 xo0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/edw6QU69BFjEalPC0FeOd0wvza2aYYQn6sSvt5KVmwLzEBRkRG/IDTuZxQM41qXtHVUDvza5R+KO92uitvciWLkZ3x2H9f3IOeGX6B8=
X-Gm-Message-State: AOJu0YxFhC8CWADKCKlwA++gYnzmisJbJIgZ8Qz+iuzXeDtIH9Jc/r+M
 LfZYlcYB7brfsxsv3X0BBD5ADszGGc+uOkjfiOh99pWcOkyUHE5mD3OSe3ybVdHuNukmGCCGEyM
 M0aUymF1ivNxXbxgWX+9fOjXvtJZCzN5NqJzY5w==
X-Google-Smtp-Source: AGHT+IEBJ9EDSOCDzcvz7VBrxp74vTA+LiZnGpzF2He2gzOhDMIin/sW0TGoX6jQApCBgxyOafwrV0IfLSI9PYFqSYU=
X-Received: by 2002:a0d:d88b:0:b0:604:92e1:14fd with SMTP id
 a133-20020a0dd88b000000b0060492e114fdmr17320806ywe.45.1708547414408; Wed, 21
 Feb 2024 12:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
In-Reply-To: <20240208074521.577076-2-lucas.demarchi@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 22:30:02 +0200
Message-ID: <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
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

On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> From: Yury Norov <yury.norov@gmail.com>
>
> Generalize __GENMASK() to support different types, and implement
> fixed-types versions of GENMASK() based on it. The fixed-type version
> allows more strict checks to the min/max values accepted, which is
> useful for defining registers like implemented by i915 and xe drivers
> with their REG_GENMASK*() macros.
>
> The strict checks rely on shift-count-overflow compiler check to
> fail the build if a number outside of the range allowed is passed.
> Example:
>
>         #define FOO_MASK GENMASK_U32(33, 4)
>
> will generate a warning like:
>
>         ../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
>            41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>               |                               ^~
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/linux/bitops.h |  1 -
>  include/linux/bits.h   | 32 ++++++++++++++++++++++----------
>  2 files changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index 2ba557e067fe..1db50c69cfdb 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -15,7 +15,6 @@
>  #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
>  #endif
>
> -#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
>  #define BITS_TO_LONGS(nr)      __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>  #define BITS_TO_U64(nr)                __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
>  #define BITS_TO_U32(nr)                __KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 7c0cf5031abe..bd56f32de44e 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -6,6 +6,8 @@
>  #include <vdso/bits.h>
>  #include <asm/bitsperlong.h>
>
> +#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
> +
>  #define BIT_MASK(nr)           (UL(1) << ((nr) % BITS_PER_LONG))
>  #define BIT_WORD(nr)           ((nr) / BITS_PER_LONG)
>  #define BIT_ULL_MASK(nr)       (ULL(1) << ((nr) % BITS_PER_LONG_LONG))
> @@ -30,16 +32,26 @@
>  #define GENMASK_INPUT_CHECK(h, l) 0
>  #endif
>
> -#define __GENMASK(h, l) \
> -       (((~UL(0)) - (UL(1) << (l)) + 1) & \
> -        (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> -#define GENMASK(h, l) \
> -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> +/*
> + * Generate a mask for the specified type @t. Additional checks are made to
> + * guarantee the value returned fits in that type, relying on
> + * shift-count-overflow compiler check to detect incompatible arguments.
> + * For example, all these create build errors or warnings:
> + *
> + * - GENMASK(15, 20): wrong argument order
> + * - GENMASK(72, 15): doesn't fit unsigned long
> + * - GENMASK_U32(33, 15): doesn't fit in a u32
> + */
> +#define __GENMASK(t, h, l) \
> +       (GENMASK_INPUT_CHECK(h, l) + \
> +        (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> +        ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
>
> -#define __GENMASK_ULL(h, l) \
> -       (((~ULL(0)) - (ULL(1) << (l)) + 1) & \
> -        (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> -#define GENMASK_ULL(h, l) \
> -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> +#define GENMASK(h, l)          __GENMASK(unsigned long,  h, l)
> +#define GENMASK_ULL(h, l)      __GENMASK(unsigned long long, h, l)
> +#define GENMASK_U8(h, l)       __GENMASK(u8,  h, l)
> +#define GENMASK_U16(h, l)      __GENMASK(u16, h, l)
> +#define GENMASK_U32(h, l)      __GENMASK(u32, h, l)
> +#define GENMASK_U64(h, l)      __GENMASK(u64, h, l)

This breaks drm-tip on arm64 architecture:

arch/arm64/kernel/entry-fpsimd.S: Assembler messages:
465arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
466arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
467arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
468arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
469arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
470arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
471arch/arm64/kernel/entry-fpsimd.S:271: Error: found 'l', expected: ')'
472arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
473arch/arm64/kernel/entry-fpsimd.S:271: Error: unexpected characters
following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
474arch/arm64/kernel/entry-fpsimd.S:66: Info: macro invoked from here
475arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
476arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
477arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
478arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
479arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
480arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
481arch/arm64/kernel/entry-fpsimd.S:282: Error: found 'l', expected: ')'
482arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here
483arch/arm64/kernel/entry-fpsimd.S:282: Error: unexpected characters
following instruction at operand 3 -- `bic x2,x1,(0+(((unsigned
long)~0ULL-((unsigned long)(1)<<(0))+1)&((unsigned
long)~0ULL>>((sizeof(unsigned long)*8)-1-(3)))))'
484arch/arm64/kernel/entry-fpsimd.S:98: Info: macro invoked from here

>
>  #endif /* __LINUX_BITS_H */
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
