Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537AFCD342F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 01:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB1110E4BE;
	Wed,  6 May 2026 01:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T6BuRyxC";
	dkim-atps=neutral
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0F10E4C0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 01:42:26 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8ea8563c693so663265085a.2
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 18:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778031745; cv=none;
 d=google.com; s=arc-20240605;
 b=hUCv6BLiWGZ5E7+X4Aoi94rrruziGKyWobI72UA1Oci8LX3p8RGu5bwgYdzDc5cBnx
 n3/SrS9tM/xqpqEJaJww6vJgXJdLvgpydqH5NY01TyzgMr+ODnig0gClszvg3KFvRGwA
 NXXN99qpZFGEaG7T0jOZu4IwIN5HN7qGQ0fbkQP7fk80XAKTow7Anr2Q7+5T4xyIszNj
 e+ZfI9igbfERd0G+sJDhFUhRhEdC6x0DA3pzidGg3+uqRbwwNDRYOLUzZfJnSLkvUbtO
 nhYD2aFGdj3pX/kZFVZd9d6t5GjOCuf7xYN4yixuwC+3SzTllUsSFQ/uJLsUGpHxZeU6
 1ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
 fh=SQ0TvJbX3Sah0gdBAdfUeMudt1oFgQFn8xsWX7jRyqY=;
 b=JgbHabDfuCEKdtB28rFSEpNW8iR7byouTu+VozqwrTbbYamDocsvMAC1+p67P+aAsA
 9xoTyo6/GPCjFylV+TTpf78huRh/XdksJ/AdNDDaJ/lWhchUOLmnF/qTznnmu9TPW7BN
 vDBSSajYIkP30XrYAa4Gq8S+dxJlLgYyEwO5RjpZ8yPHTpBUY5wiOVe3/fJbraYOSTf0
 XHofv+WqMAiDpLnXcTZfloAsBZIWDj/bvgWWokkYbsU6WRyiMdHv7ku+0wNrZhrj7BXg
 FnxHlDjYbNSzNUmOraRz0M6pwXuajV39RAsRmnA5mhee/uTg2OijUbxjxyaA2lIu1fm8
 SDag==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778031745; x=1778636545; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
 b=T6BuRyxCgtkqnPrxwymxZunOs3Z7e4P7XatenSTt0c2+lGfOZVS5afar5btJFtyQEl
 v3JQHGM1AViu7c/VO1JP9+eJnQ5jWjesJ/wBQ0LlJAg7oAb8pcZt8ygyRKdL86jM5Ez5
 jJeSR5QZKGEnpzCkoLvcnQlXCLKT0dFz2YWOPUoxUxRCldYpMCHzdue/3piCQCwfm3OR
 1e6N/CiFMEWGLQSzAZXG8magwN8HXdkL5a0zRsGCFx+MBwrUecFw+ob6ap9c1BPlNZUw
 rUlukJmJxekLIX77qMoqhqRI9VLVWnxzLJXKtsnJTrSk3lQeINYXTjO2eL4sov7ebCIE
 eymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778031745; x=1778636545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN3POji8Ptv8pq9FbWY1N6uNRjXtcQOLJtybMOZu3UA=;
 b=q8+/YuyxKMd/Rt5RIEC75Wx1oWgWdWacX9ZGKOp1jqz2NXNzAH4L4NTTdL7Y+Z4O/i
 7wCLamRKBAQ2KJ9oxyZwknvg5dQFPBgh99buHNE7SASciQJbzI6WxYEzuy6AmkoUkpzE
 1YwaY6kCEvr4V9FpRv8Kuunb3tT7wH1UgJhtR24VlJHDBzP/Q29wfSpJPYNzG7SjQZot
 i15+t7+HVlIP4MLQ7Oj0P1jjfqrnMbxQShpRccs7xYXxSIxPzFrZ8P5Xe9dbIYG65FKz
 pqKwNeEe1lpgThwJAs6AZXP1Oap535YNEVZefz8kY/vljBpEnrW/txjmwHhoa9odf28u
 X5og==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+3RaDlJzUc5PABQaTwyWPmCNEHAH6gipln8nsEbSwz/zzFf5T30OGRau8gUX2rfEN/wj6k+tXKA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYjyKWtVkNdytNqV5a7AIsDKbJ5po6+sSYgOX1XhrtExsdKMwx
 rD/SyRljIzkwhL3ssXg4sSt6Dm48BRMquB9EbtXLxo7fQzmDsyR9Fhq2CCFKfLq4iQZ77WY17mO
 Vl/9C/PeEx9UMiNadDA0HZt+9C/q1Lcs=
X-Gm-Gg: AeBDietotwf7MSN8vtjgCHZYaeJuCn3pna/Q9nhi8hzPm5dgAfansxP2CPTfn6SujmB
 E9W1KZsdi92R1uYm1Sp+9gfnCHHbquYSAa+CvIPP32wUJMWs9zlBcx94Mak/7+JCVuv7o3v5nGz
 2gKj5fBLZHDBJitnK73P60zZpkV+kWcGtvQG4wRCZ51JaV/lcC4HS+xPo98MJ0aqVRjr846O9ny
 3Q7vAAWrgHmqLM73KDbmaFvuEsg/c5m6EGrCIGUIgFOFTcD75qZ/BQX6pR8p/uPWf2NYChvODEZ
 PHpwlANBokj5B3wOaoviHbFGfmfvVYevWJcOICgoaa77OzqRuAnZ2OEZ/MoR5kscIhn9jGLQtlI
 teA==
X-Received: by 2002:a05:620a:4594:b0:8f8:8860:fb8b with SMTP id
 af79cd13be357-904d69d9e87mr244631885a.52.1778031745287; Tue, 05 May 2026
 18:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org>
In-Reply-To: <c36e7dfb-cf62-4d21-a3b1-f54cb43e0832@infradead.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 May 2026 11:42:13 +1000
X-Gm-Features: AVHnY4J4iD5smXrIpAMHJFcsa01tqBk4AJ9BDVgb7geE_sA9sedvb_-AQbfyQag
Message-ID: <CAPM=9txXGY7Pv7ge-x3roA422c=Ycefc7Ens20dEiHuKrKR=3g@mail.gmail.com>
Subject: Re: does DRM_GPUSVM require hugepages?
To: Randy Dunlap <rdunlap@infradead.org>,
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Simona Vetter <simona@ffwll.ch>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>
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

On Sun, 3 May 2026 at 10:03, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> In linux-next-20260430, I'm seeing build errors on some ARCHes when
> DRM_XE=m (probably just "is set") but HAVE_ARCH_TRANSPARENT_HUGEPAGE
> is not set (not selected) by the ARCH.

I'm seeing this locally on my arm32 builds, Matthew, Thomas?

Dave.

>
> Does drm_gpusvm.c require hugepages?
> Or possibly DRM_XE needs some kind of restriction?
>
> I see build failures on ARCH=alpha, ARCH=openrisc, ARCH=mips (32-bit
> or 64-bit), and ARCH=arm (without ARM_LPAE set).
>
> Example:
> ../drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_get_pages':
> ./../include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_361' declared with attribute error: BUILD_BUG failed
>   699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> ./../include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
>   680 |                         prefix ## suffix();                             \
>       |                         ^~~~~~
> ./../include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
>   699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>    40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>       |                     ^~~~~~~~~~~~~~~~
> ../include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
>   113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>       |                            ^~~~~~~~~
> ../include/linux/huge_mm.h:120:35: note: in expansion of macro 'HPAGE_PMD_SHIFT'
>   120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
>       |                                   ^~~~~~~~~~~~~~~
> ../drivers/gpu/drm/drm_gpusvm.c:1560:52: note: in expansion of macro 'HPAGE_PMD_SIZE'
>  1560 |                                                    HPAGE_PMD_SIZE ?
>       |                                                    ^~~~~~~~~~~~~~
> make[6]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/drm_gpusvm.o] Error 1
>
> where include/linux/huge_mm.h:113: says:
>
> #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> #define HPAGE_PMD_SHIFT PMD_SHIFT
> #define HPAGE_PUD_SHIFT PUD_SHIFT
> #else
> #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; }) <<<<<<<<<<<<<<<<<< line 113
> #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
> #endif
>
> --
> ~Randy
>
