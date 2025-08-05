Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E47C87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B665E10E6AD;
	Tue,  5 Aug 2025 15:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MT4lr8pY";
	dkim-atps=neutral
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91910E6AB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 15:18:25 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4aeb2f73fc0so53780471cf.2
 for <intel-xe@lists.freedesktop.org>; Tue, 05 Aug 2025 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407104; x=1755011904;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei2suQoiKM6jZ+vrvxUS6sJAz8bgwy+vg3WdcqYInd4=;
 b=MT4lr8pYt4RXuhXHIknaKgQN93FlL+DLSoo7tpxSIOceBztgb0eBijvHmxq5DmUVz7
 V8HYOFEMOgkXO7SQS1Qgq1Pz6uL6oJkF6eoYoGC+Ka5yBn1FSXusDiKD3lkwaSn2VjYv
 MbAKlBvs/ghkYDKsUhLtgwDgnqonAbMZiRvUlptLGB/nCDHjTqcRMhK+R6skCGGVWI7W
 mSHJrP6wEBffE8oFab4JqXVw1CjM7147EQ1dlV36RG8hH/KyTN/Ps1jAMILSOtjaUpTE
 ALeKzO8JHyJ/E1nLm21hIUcFXSzi7zojp0yx1Fa4mSkfSL4ryc9SbIVs53bOZxiybV0O
 zdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407104; x=1755011904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ei2suQoiKM6jZ+vrvxUS6sJAz8bgwy+vg3WdcqYInd4=;
 b=WMHU03lZ+5SqfK5szveWZifZZHc86F5VagN2MWm4xK/BoI75WO6doRhN6luAJrMMV6
 NqNfCPEsBcat3LOmZuhGBwczFlN9j0GYob2A/+NcLZWb+gpF4zN2KDu8ArmPEKtuxYbg
 c7jCLcC+bAulN1bV4vADJcvWbN6+ka5lv0rF6uoipqd/SozVXEV41wmqjYBtB/GPIYD9
 bxkGFvyUr5V/CTpAiyGkMG0y3CxKF++E7pIHXVw/Hn9udihOCKhcVMtepYpLnGe8Brgd
 PHLQqRUgy6myxghG4Zj18F77IRo7x/+mEshVgwMiXhQSIpuNwuBeXAtc63ELmRx+cHS7
 jSpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/2kLX787/FzRytKLOKz9Z5u31kCejJmsKMxhd1vTWT8FtwqR+lqSNTSXu0LouRxgASQLxo4Larg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQIbwYPmxYyAJewh4BtN/Bq5Mu601LO+ZSXaQRE9gNZp5ycBiH
 cs/GxqHFq38oIZ1DpIk+TL7iGX3pntwgoT4LBvA8+16sryMAfC8NGEsK9WUlZipP4WRVz/V0U4z
 j4M2P0pCKiz6RAYGcKs5SEkJLiFpsEVVLEyzFc23n
X-Gm-Gg: ASbGncune5qUFC+YjpzqaOUiII8KY2F+SNCZJal6bEEnCaSOGxerU9JFCSNArKuaTpG
 b2xjrnqziMl7nKk1RrMGQfi8dSc7Oy3G15BRh1lpp7sPofPqRy36F/2ePdJlL2xcnQha45CysQg
 QAySfNsj2LYJC5sZIKf8ghr43GRzVkYuETL8vzUWq2n/wtzQJZOTcsP5aq1hP5vVcycvAEy1VMk
 x8ydAPCLJw5gJ0EYH6F25MgVQ+5wQDJESs/PxxG+g==
X-Google-Smtp-Source: AGHT+IGlWdT5T+vrtEukolYStRP1zGethFLAlqa7L7jsXqEu+52gbiouMhUNWLt2Xp/Xbd7hHUETokSfoCGI9lBDsso=
X-Received: by 2002:ad4:5c62:0:b0:707:6302:90aa with SMTP id
 6a1803df08f44-7093626d773mr195026586d6.27.1754407103617; Tue, 05 Aug 2025
 08:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-4-marievic@google.com>
In-Reply-To: <20250729193647.3410634-4-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:18:12 -0400
X-Gm-Features: Ac12FXz9W5TjaYltj_nslVN8LL6euuV8WCMgJLzVdBjdaff9DG8lUm24r6Pqnn8
Message-ID: <CA+GJov5Faik_aBzDO6QY3Rj_ycq=A6ZqOsuP-m6G1n3jtpNCYg@mail.gmail.com>
Subject: Re: [PATCH 3/9] kunit: Pass additional context to generate_params for
 parameterized testing
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> To enable more complex parameterized test scenarios,
> the `generate_params` function sometimes needs additional
> context beyond just the previously generated parameter.
> This patch modifies the `generate_params` function signature
> to include an extra `struct kunit *test` argument, giving
> users access to the parent kunit test's context when
> generating subsequent parameters.
>
> The `struct kunit *test` argument was added as the first parameter
> to the function signature as it aligns with the convention
> of other KUnit functions that accept `struct kunit *test` first.
> This also mirrors the "this" or "self" reference found
> in object-oriented programming languages.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

Extremely happy about this change. This will provide us much more
flexibility when defining test parameters. Thank you for this
implementation!

Reviewed-by: Rae Moar <rmoar@google.com>


-Rae

> ---
>  include/kunit/test.h | 9 ++++++---
>  lib/kunit/test.c     | 5 +++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index d8dac7efd745..4ba65dc35710 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -128,7 +128,8 @@ struct kunit_attributes {
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> -       const void* (*generate_params)(const void *prev, char *desc);
> +       const void* (*generate_params)(struct kunit *test,
> +                                      const void *prev, char *desc);
>         struct kunit_attributes attr;
>
>         /*
> @@ -1701,7 +1702,8 @@ do {                                               =
                              \
>   * Define function @name_gen_params which uses @array to generate parame=
ters.
>   */
>  #define KUNIT_ARRAY_PARAM(name, array, get_desc)                        =
                       \
> -       static const void *name##_gen_params(const void *prev, char *desc=
)                      \
> +       static const void *name##_gen_params(struct kunit *test,         =
                       \
> +                                            const void *prev, char *desc=
)                      \
>         {                                                                =
                       \
>                 typeof((array)[0]) *__next =3D prev ? ((typeof(__next)) p=
rev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {            =
                       \
> @@ -1722,7 +1724,8 @@ do {                                               =
                              \
>   * Define function @name_gen_params which uses @array to generate parame=
ters.
>   */
>  #define KUNIT_ARRAY_PARAM_DESC(name, array, desc_member)                =
                       \
> -       static const void *name##_gen_params(const void *prev, char *desc=
)                      \
> +       static const void *name##_gen_params(struct kunit *test,         =
                       \
> +                                            const void *prev, char *desc=
)                      \
>         {                                                                =
                       \
>                 typeof((array)[0]) *__next =3D prev ? ((typeof(__next)) p=
rev) + 1 : (array);      \
>                 if (__next - (array) < ARRAY_SIZE((array))) {            =
                       \
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index d80b5990d85d..f50ef82179c4 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -696,7 +696,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
>                         /* TODO: Make generate_params try-catch */
> -                       curr_param =3D test_case->generate_params(NULL, p=
aram_desc);
> +                       curr_param =3D test_case->generate_params(&test, =
NULL, param_desc);
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
> @@ -727,7 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                                 /* Get next param. */
>                                 param_desc[0] =3D '\0';
> -                               curr_param =3D test_case->generate_params=
(curr_param, param_desc);
> +                               curr_param =3D test_case->generate_params=
(&test, curr_param,
> +                                                                       p=
aram_desc);
>                         }
>                 }
>
> --
> 2.50.1.552.g942d659e1b-goog
>
