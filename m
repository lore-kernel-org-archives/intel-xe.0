Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5772BC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEA410E6AB;
	Tue,  5 Aug 2025 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OH7sYpQu";
	dkim-atps=neutral
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E610E6AB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 15:18:08 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-70744e8ed6eso45429486d6.2
 for <intel-xe@lists.freedesktop.org>; Tue, 05 Aug 2025 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407088; x=1755011888;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5NeMlJwLZpcXV2DV2TdKHI4G5bE2z72dogFrH06R5c=;
 b=OH7sYpQueMuqWlhgIdDpIyrS/iCZgWmHdaFcNOiYtxIWbOs+guMw398Kjvvy7P0xIN
 6nu70V96i17//B5ZrxP7D0A459Gb5hkLA0nBF5LKE5bGb2vh3pwKUiIYM4C8y9hq4A32
 RgLnDCOUMLGRF9Po7aBcg2TcscAbUgAMeXsLAGKpm7IdsmA2FNBxpdpjWGXiapnQpxDr
 9fMWo7pfGk6mEFO1et/CY5WNVnMSlKmIsmHv5J/plKfvGfvTXk20fIbeut9EP9cuADMC
 pRx8hpM+SXQhhAAPfM4YUHZp4tGj91zM3PDMIj8CUGUWXGl+YBI8J0T/tI+aSFhWo7g7
 jNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407088; x=1755011888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5NeMlJwLZpcXV2DV2TdKHI4G5bE2z72dogFrH06R5c=;
 b=qN7iegH2sW2/JKW8cy3bgWemK5ZvsyFhio96HsDo07Rf4gB3tlX/duhP7fr81z0Ts0
 xBrkgZDDBC8zWiuFjPX1+dcHiVCwo72Efl5wip8SEGjR47Ebyi0Ve1NqvkjMpwlH3Jy8
 oh90dAW+kOa0AIbbnd6Ais81SJd5lIlMwcmJxLVcr74U0qsGnaQNFEK2aCEVanH9LcZJ
 5R7fUoEZ35KzcBhNPAWxIs0yquILoUE5EpxuuAQhc4yzqYX8RhByTeUUQLc4A3YUIuKC
 1pWzLXxlXP632dtyUqR90gKdPkTyV0uvRj8yTVGmkKQJaNLOx9Z6jQSnzrvv7ONgCvvU
 U4LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQqhtLvVTNSv0udSTLvFN4bz7Zetn4gfIeitOLzFZKN4MvY0N9nFXMLXCpyCMxjTnrnp9uOG1/Xw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweDGqeuB0HKs6wPFI5WKikryGuZ7MfOCHYV5Oj5f5kjEuXUOaK
 hXj7d8kSriDD+8Npe+dZZpF3uCtgfjJURB6HheVkZWsJahxv5HOD0PDhHOcZVpKZWBHc574opXC
 sRdPErN5ENV9irhJd09JvJqa79lfnlWgPJvsH2Nbj
X-Gm-Gg: ASbGncs37EF58oZ28HHLUgpn7QfyXoqEP7iZ2GnnCuTMOy6OuntYTomwCUYfUU6yFVT
 2eEFaBJMWkxVrbSLFW04vCtp+8Ilwq2WtrtyY1Xz07sWRAbAlHPI3vj7HFvw43CiddOfTPE/Hc8
 dr/a2FpkXSbTpt2jE9NEDV7/2hB6UNTfkVt0na3xyY4LVqMuqAGa/8dJ9iqJ0BkWlqGQS3NMXmq
 ylIq19nRgIOKFp5PzmiKRM1Am00B+mh/Oespy+ijA==
X-Google-Smtp-Source: AGHT+IFgVlVyuOTgBHr5ZibdC4zIqIoj0067boT/gP+RbouLeHb9KxxIGx3arB0XYTNB1GFLPCjifldGrKcnexUF0Ys=
X-Received: by 2002:ad4:5ca3:0:b0:705:1647:6dfa with SMTP id
 6a1803df08f44-70935f7eda4mr211485656d6.17.1754407087029; Tue, 05 Aug 2025
 08:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-3-marievic@google.com>
In-Reply-To: <20250729193647.3410634-3-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:17:55 -0400
X-Gm-Features: Ac12FXyu_BxZIwtuZLWYceoYjDhyP0_a9ARxyqnnkXvZy9hY9vlbesfxKuU3reI
Message-ID: <CA+GJov5R2GnBfxXR=28vS3F4b1E-=WLDXpgdJo0SpKAXb1dpsw@mail.gmail.com>
Subject: Re: [PATCH 2/9] kunit: Introduce param_init/exit for parameterized
 test shared context management
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
> Add `param_init` and `param_exit` function pointers to
> `struct kunit_case`. Users will be able to set them
> via the new `KUNIT_CASE_PARAM_WITH_INIT` macro.

Hello!

Very intrigued by this idea to add an init and exit function for
parameterized tests. In a way, this allows parameterized test series
to act more like suites. Either way I am happy to see more flexibility
being brought to the parameterized test framework.

I have a few comments below that I would like to discuss before a
final review. But this patch is looking good.

Thanks!
-Rae

>
> These functions are invoked by kunit_run_tests() once before
> and once after the entire parameterized test series, respectively.

This is a philosophical question but should we refer to a group of
parameterized tests as a parameterized test series or a parameterized
test suite? In the KTAP, the appearance is identical to a suite but in
the running of the tests it acts distinct to a test case or suite.
Curious on David's opinion here.

> They will receive the parent kunit test instance, allowing users
> to register and manage shared resources. Resources added to this
> parent kunit test will be accessible to all individual parameterized
> tests, facilitating init and exit for shared state.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>  include/kunit/test.h | 33 ++++++++++++++++++++++++++++++++-
>  lib/kunit/test.c     | 23 ++++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index a42d0c8cb985..d8dac7efd745 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -92,6 +92,8 @@ struct kunit_attributes {
>   * @name:     the name of the test case.
>   * @generate_params: the generator function for parameterized tests.
>   * @attr:     the attributes associated with the test
> + * @param_init: The init function to run before parameterized tests.
> + * @param_exit: The exit function to run after parameterized tests.

If we decide on a terminology for the parameterized test group, it
might be clearer to label these "The init function to run before
parameterized test [suite/series]." and same for the exit function.

>   *
>   * A test case is a function with the signature,
>   * ``void (*)(struct kunit *)``
> @@ -129,6 +131,13 @@ struct kunit_case {
>         const void* (*generate_params)(const void *prev, char *desc);
>         struct kunit_attributes attr;
>
> +       /*
> +        * Optional user-defined functions: one to register shared resour=
ces once
> +        * before the parameterized test series, and another to release t=
hem after.
> +        */
> +       int (*param_init)(struct kunit *test);
> +       void (*param_exit)(struct kunit *test);
> +
>         /* private: internal use only. */
>         enum kunit_status status;
>         char *module_name;
> @@ -218,6 +227,27 @@ static inline char *kunit_status_to_ok_not_ok(enum k=
unit_status status)
>                   .generate_params =3D gen_params,                       =
         \
>                   .attr =3D attributes, .module_name =3D KBUILD_MODNAME}
>
> +/**
> + * KUNIT_CASE_PARAM_WITH_INIT() - Define a parameterized KUnit test case=
 with custom
> + * init and exit functions.
> + * @test_name: The function implementing the test case.
> + * @gen_params: The function to generate parameters for the test case.
> + * @init: The init function to run before parameterized tests.
> + * @exit: The exit function to run after parameterized tests.

If we do change the description above of param_init/param_exit, it
might be nice to change it here too.

> + *
> + * Provides the option to register init and exit functions that take in =
the
> + * parent of the parameterized tests and run once before and once after =
the
> + * parameterized test series. The init function can be used to add any r=
esources
> + * to share between the parameterized tests or to pass parameter arrays.=
 The
> + * exit function can be used to clean up any resources that are not mana=
ged by
> + * the test.
> + */
> +#define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)   =
       \
> +               { .run_case =3D test_name, .name =3D #test_name,         =
           \
> +                 .generate_params =3D gen_params,                       =
         \
> +                 .param_init =3D init, .param_exit =3D exit,            =
           \
> +                 .module_name =3D KBUILD_MODNAME}
> +
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_=
case
>   *
> @@ -269,7 +299,8 @@ struct kunit_suite_set {
>   * @priv: for user to store arbitrary data. Commonly used to pass data
>   *       created in the init function (see &struct kunit_suite).
>   * @parent: for user to store data that they want to shared across
> - *         parameterized tests.
> + *         parameterized tests. Typically, the data is provided in
> + *         the param_init function (see &struct kunit_case).
>   *
>   * Used to store information about the current context under which the t=
est
>   * is running. Most of this data is private and should only be accessed
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 4d6a39eb2c80..d80b5990d85d 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -641,6 +641,19 @@ static void kunit_accumulate_stats(struct kunit_resu=
lt_stats *total,
>         total->total +=3D add.total;
>  }
>
> +static void __kunit_init_parent_test(struct kunit_case *test_case, struc=
t kunit *test)

It would be nice to include "param" in this function name. Currently
it sounds more like you are initializing the @parent field of struct
kunit *test.

> +{
> +       if (test_case->param_init) {
> +               int err =3D test_case->param_init(test);
> +
> +               if (err) {
> +                       kunit_err(test_case, KUNIT_SUBTEST_INDENT KUNIT_S=
UBTEST_INDENT
> +                               "# failed to initialize parent parameter =
test.");
> +                       test_case->status =3D KUNIT_FAILURE;
> +               }
> +       }
> +}
> +
>  int kunit_run_tests(struct kunit_suite *suite)
>  {
>         char param_desc[KUNIT_PARAM_DESC_SIZE];
> @@ -668,6 +681,8 @@ int kunit_run_tests(struct kunit_suite *suite)
>                 struct kunit_result_stats param_stats =3D { 0 };
>
>                 kunit_init_test(&test, test_case->name, test_case->log);
> +               __kunit_init_parent_test(test_case, &test);
> +

Is it possible to move this so this function is only called when it is
a parameterized test? I see the check for KUNIT_FAILURE is useful but
I think I would still prefer this within the section for parameterized
tests.

>                 if (test_case->status =3D=3D KUNIT_SKIPPED) {
>                         /* Test marked as skip */
>                         test.status =3D KUNIT_SKIPPED;
> @@ -677,7 +692,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_run_case_catch_errors(suite, test_case, &te=
st);
>                         kunit_update_stats(&param_stats, test.status);
> -               } else {
> +               } else if (test_case->status !=3D KUNIT_FAILURE) {
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
>                         /* TODO: Make generate_params try-catch */
> @@ -727,6 +742,12 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>                 kunit_update_stats(&suite_stats, test_case->status);
>                 kunit_accumulate_stats(&total_stats, param_stats);
> +               /*
> +                * TODO: Put into a try catch. Since we don't need suite-=
>exit
> +                * for it we can't reuse kunit_try_run_cleanup for this y=
et.
> +                */
> +               if (test_case->param_exit)
> +                       test_case->param_exit(&test);

Also here I am not sure why this is done outside of the check for if
the test is parameterized? Either way this should definitely be done
before the test stats and ok/not ok line are printed because if there
is any log output during the param_exit function it is necessary to
print that before the status line to identify that that log
corresponds with that test.

Also just curious why you chose to implement a function to perform the
param_init but not the param_exit?



>                 /* TODO: Put this kunit_cleanup into a try-catch. */
>                 kunit_cleanup(&test);
>         }
> --
> 2.50.1.552.g942d659e1b-goog
>
