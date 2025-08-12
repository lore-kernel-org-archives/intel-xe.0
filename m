Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D591CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 22:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F9310E027;
	Tue, 12 Aug 2025 22:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JvsxTsGW";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C6610E185
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 22:22:17 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-70749d4c598so48005066d6.0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755037337; x=1755642137;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWuryeMFKkS3RAr2vCbtx7LOWzlUOf1ahWxEl9iGYmQ=;
 b=JvsxTsGWKyhdoYLpZUKHVaLiAonprfHC6+dSNx/02r8pXGFTwksT3OEBJ7jV0RODhU
 PjdIn0uBjJ/dm3KaqYIiyfTSexbrDmKkszi7JKHW7kMM2rPclAczvFjdfLoPiAHv+djg
 Rud6VPvmDC8UB0pZ5ECpTHDBmTnA3D+cxrgEdWsfrxwsmJROsCKu/qsSlv/Q2UrjlUUk
 WD6B9tRpu9b8omrR0ehwr+PHbUQXwoKk0Ln5M+Ey7ICUbzmp/1uJknjtndiEEJi1hG3x
 NbS/76rfjOuTUz+BOw/eP14XBlSdcE85CH1IfBXPGB+ogWyLMKE+i52Rovx2JE7rF5Q0
 Yqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755037337; x=1755642137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWuryeMFKkS3RAr2vCbtx7LOWzlUOf1ahWxEl9iGYmQ=;
 b=SpgNab/A949P9AXPJbtqwdM3gmsvYDiYqvL4onhIP51xajbfsm6WEWK1a4fHjOd3cQ
 l/Nq6aBtK4apJ9j2FZaQa5djHyG7j/Sw/A+1onqLnNcEGky99e3LAoSb9+KrdNfkg21h
 DlqCXsHSQo+RLoIozBTSW4I6UE6mcqCRIK9uncvc9kzVbJeUCEJu17dH9xPYDB1bRh0/
 m3xLu/k8fjPj+ioyiQZhRrnj06W+QSql8UqrWCIfnxdgSIrJntzxmJLry0QDr991alxN
 ebrJHTeqVNEPYVcnOhyfG3FFNM+6O1d4yD4P42yKRmpO7NJoTA9ofi0MyJ+VHsYmzLcr
 BtcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvh5pNVIoR0haIFf4nBmC0lVoUliAVBG6x8OzZTxSsDBEkRhB8XGvdSw3flyBUfh5o6Xd5bqG21w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2lmob9U2g6NBhblehUqJDIM7OjL3qWQQM2QeyrqPA6qhHdU5T
 THnkfEr71CQXqud7f7/petsshfQjC+IM5yqFZenJCROsYrWQsKWNh8SatO/Kt9v1ru4VOLpOW6K
 3RBQUS0vSPnxgdcnGAQ0l6rrZp3KDOzOb7F4SAkxm
X-Gm-Gg: ASbGncs2z4wXwGfcrCee3F+0uV5ph2vgktpGSBhkRQA2c2S0omOhDxEdutVjJmTgh/C
 DJIwR1c2sPbathIpsHreBUY/g6JiN1QD0PVYMjCqUSjmBabWjaZGUIPmmn9QZjhqcxaZpGsYaS5
 xmDuWlxlTJZ4YVyhHnhWuAMd6Buf+TgQY0l2DimN+2csSLbZAIx96oFOsK2qrrB6cmq4eU7CBM2
 WwRZeB4+rFjcr8N/WtaZGzPcfE=
X-Google-Smtp-Source: AGHT+IEadRB7taAvJL3meXl06djQ3Xt2tF79cuy40DLQCj2PV7nyTVommhLIfxsMSiSB57BjHwmxI3MbCeBYuqIhz/o=
X-Received: by 2002:a05:6214:dc6:b0:704:7df6:44b4 with SMTP id
 6a1803df08f44-709e893bab1mr14144146d6.23.1755037336426; Tue, 12 Aug 2025
 15:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-2-marievic@google.com>
In-Reply-To: <20250811221739.2694336-2-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 12 Aug 2025 18:22:05 -0400
X-Gm-Features: Ac12FXy4odiVUbmTVSv_FQj3XmTzKCP2JeRGz1wZpwmC4BzXnA3qMhak1o8tSGs
Message-ID: <CA+GJov6aVg70yjXF3=3teg26AKhcOwLEOgGT8by61nMJvB15jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] kunit: Add parent kunit for parameterized test
 context
To: Marie Zhussupova <marievic@google.com>
Cc: davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Aug 11, 2025 at 6:17=E2=80=AFPM Marie Zhussupova <marievic@google.c=
om> wrote:
>
> Currently, KUnit parameterized tests lack a mechanism
> to share resources across parameter runs because the
> same `struct kunit` instance is cleaned up and
> reused for each run.
>
> This patch introduces parameterized test context,
> enabling test users to share resources between
> parameter runs. It also allows setting up resources
> that need to be available for all parameter runs only once,
> which is helpful in cases where setup is expensive.
>
> To establish a parameterized test context, this
> patch adds a parent pointer field to `struct kunit`.
> This allows resources added to the parent `struct kunit`
> to be shared and accessible across all parameter runs.
>
> In kunit_run_tests(), the default `struct kunit`
> created is now designated to act as the parameterized
> test context whenever a test is parameterized.
>
> Subsequently, a new `struct kunit` is made
> for each parameter run, and its parent pointer is
> set to the `struct kunit` that holds the
> parameterized test context.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---
>
> Changes in v2:
>
> - Descriptions of the parent pointer in `struct kunit`
>   were changed to be more general, as it could be
>   used to share resources not only between parameter
>   runs but also between test cases in the future.
> - When printing parameter descriptions using
>   test.param_index was changed to param_test.param_index.
> - kunit_cleanup(&test) in kunit_run_tests() was moved
>   inside the parameterized test check.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.

Hello!

Thanks for making these changes! I really like the change to the new
terminology for parameterized tests, as well as the description change
for "parent".

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae


>
> ---
>  include/kunit/test.h |  8 ++++++--
>  lib/kunit/test.c     | 34 ++++++++++++++++++++--------------
>  2 files changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 39c768f87dc9..b47b9a3102f3 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -268,14 +268,18 @@ struct kunit_suite_set {
>   *
>   * @priv: for user to store arbitrary data. Commonly used to pass data
>   *       created in the init function (see &struct kunit_suite).
> + * @parent: reference to the parent context of type struct kunit that ca=
n
> + *         be used for storing shared resources.
>   *
>   * Used to store information about the current context under which the t=
est
>   * is running. Most of this data is private and should only be accessed
> - * indirectly via public functions; the one exception is @priv which can=
 be
> - * used by the test writer to store arbitrary data.
> + * indirectly via public functions; the two exceptions are @priv and @pa=
rent
> + * which can be used by the test writer to store arbitrary data and acce=
ss the
> + * parent context, respectively.
>   */
>  struct kunit {
>         void *priv;
> +       struct kunit *parent;
>
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index f3c6b11f12b8..14a8bd846939 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
>         struct kunit_case *test_case;
>         struct kunit_result_stats suite_stats =3D { 0 };
>         struct kunit_result_stats total_stats =3D { 0 };
> +       const void *curr_param;
>
>         /* Taint the kernel so we know we've run tests. */
>         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -679,37 +680,42 @@ int kunit_run_tests(struct kunit_suite *suite)
>                 } else {
>                         /* Get initial param. */
>                         param_desc[0] =3D '\0';
> -                       test.param_value =3D test_case->generate_params(N=
ULL, param_desc);
> +                       /* TODO: Make generate_params try-catch */
> +                       curr_param =3D test_case->generate_params(NULL, p=
aram_desc);
>                         test_case->status =3D KUNIT_SKIPPED;
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "KTAP version 1\n");
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "# Subtest: %s", test_case->name);
>
> -                       while (test.param_value) {
> -                               kunit_run_case_catch_errors(suite, test_c=
ase, &test);
> +                       while (curr_param) {
> +                               struct kunit param_test =3D {
> +                                       .param_value =3D curr_param,
> +                                       .param_index =3D ++test.param_ind=
ex,
> +                                       .parent =3D &test,
> +                               };
> +                               kunit_init_test(&param_test, test_case->n=
ame, test_case->log);
> +                               kunit_run_case_catch_errors(suite, test_c=
ase, &param_test);
>
>                                 if (param_desc[0] =3D=3D '\0') {
>                                         snprintf(param_desc, sizeof(param=
_desc),
> -                                                "param-%d", test.param_i=
ndex);
> +                                                "param-%d", param_test.p=
aram_index);
>                                 }
>
> -                               kunit_print_ok_not_ok(&test, KUNIT_LEVEL_=
CASE_PARAM,
> -                                                     test.status,
> -                                                     test.param_index + =
1,
> +                               kunit_print_ok_not_ok(&param_test, KUNIT_=
LEVEL_CASE_PARAM,
> +                                                     param_test.status,
> +                                                     param_test.param_in=
dex,
>                                                       param_desc,
> -                                                     test.status_comment=
);
> +                                                     param_test.status_c=
omment);
>
> -                               kunit_update_stats(&param_stats, test.sta=
tus);
> +                               kunit_update_stats(&param_stats, param_te=
st.status);
>
>                                 /* Get next param. */
>                                 param_desc[0] =3D '\0';
> -                               test.param_value =3D test_case->generate_=
params(test.param_value, param_desc);
> -                               test.param_index++;
> -                               test.status =3D KUNIT_SUCCESS;
> -                               test.status_comment[0] =3D '\0';
> -                               test.priv =3D NULL;
> +                               curr_param =3D test_case->generate_params=
(curr_param, param_desc);
>                         }
> +                       /* TODO: Put this kunit_cleanup into a try-catch.=
 */
> +                       kunit_cleanup(&test);
>                 }
>
>                 kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CAS=
E);
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>
