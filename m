Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A0C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 12:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1733410E021;
	Fri,  8 Aug 2025 12:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AxHJ8C85";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9B10E04D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 12:20:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5f438523d6fso7865a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 08 Aug 2025 05:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754655634; x=1755260434;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rzYVptOKE6RcZ0qvjvmsPnga1215NKTSv+ot9kbgm8=;
 b=AxHJ8C85rnvxZh/AJ6EKIHo22yjfjCsXfqVEI/ZPAPscFlys3wYzoTPWSSe9zDO0ob
 5yirFi5FU4jnbg4Q/pRT1rBnkAw5srtpec6ScyNLmOffl7IT6oGlTPhulSnpvXMNth3i
 iim9az5cvQDoQoVLQ0Nj3IQPgIN12UaUapesQHpi5R/J5j0OZiDCRzb/WRQuu/V5IY1t
 xi2MoEZ85uHaD3zT/vUkDcnHwxM5jNkclfHwkkC65GKyG8GYwj1sCHlnlFhuVu/Eq0fa
 8Y5OTeQeZkaTvq9wSr1F0pqjmX4QqvC1/15AUZUNdrSpLSfnxirNx/z8wagV91KkZ4/a
 KVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754655634; x=1755260434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rzYVptOKE6RcZ0qvjvmsPnga1215NKTSv+ot9kbgm8=;
 b=OAgtmO1v95HtaRg7hSI4c8AakDRM+tmpjIzhVlyR/JNYVh9fIIq0EIPQ7y3v7pFxlo
 BXuD3PoxDoNkO5khDh/ZMsqIh7hq00z/JzB1hgkpBVcS+IaFRrUd6v8SEqa7sZgZfM+R
 PvrbDD1CQ5fG6LvX9Tu/AfIBuCX8kd2WhuuTo7KCXkO4hrbuw/3aY8XSwC26uMl2m3Fa
 vkQ+J+baYz2Y3mpQpsY75XfQCzkjvWzzYv7M+dgc5ljvNhIC31MsBv5iyUNTxwnn4DHz
 xHe9N6i5mgXEe62HUJ014il1dR8VfUdY4Elltr/0FHdIkaBxKyx8AMCnzZHfo1cXx313
 Ha9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjsf8Foh3JedjjeHkab/r2J37Bp/cBpSuVZjUPOwyYxKXBfjnHMiRA6Ut+TRix3Ahrr2N68M7ZVw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsxYN1xaZduhS787Rzxx3L9t9sevuBj/RKJW0JppV/ll8cLXxt
 kgpYCx+h/ajO6d9H7Cw0KKbU/bBaLjsSielwFtlBTvIeQxCdh4q7Guwffvh2g/weyESPNq5IxkI
 UEYPelBPKLgK5k5SWkqN0WHyFO4j2fMYdlZztae0B
X-Gm-Gg: ASbGncv4gTOlEX17bsYpWhqSAbZgV2qbGig8su5H3YQTg19QCgYuxMZ4yl6OQBW7zOa
 DMxb7Jg7OH26ODNfQM5OCrzNGSvCXao0hnIZyb0UZwOtJT98MyjrQm6PwoTTUkT4dHWH/DNuKHD
 tWIxqkZPJnKJH2rtRq24ypb35X5Coh5kN+vtlyUpNWUAuO8EBN6Ug6PvwLKOsf5rORqcaAkhCdG
 hiXPZZ/
X-Google-Smtp-Source: AGHT+IG4063AzftLr2nNg6LP2eisixxrOm1cn9iuvLVn3oLVwkWGVefZC3UWEn6Yr/d0q/zLPSnZ+hF/HN7uvjRhvSY=
X-Received: by 2002:a50:9351:0:b0:615:60d2:c013 with SMTP id
 4fb4d7f45d1cf-617e48ffd8cmr60281a12.3.1754655633629; Fri, 08 Aug 2025
 05:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-2-marievic@google.com>
 <CA+GJov4BQ1mRa-JaHoML+gF7rk=XY=hCRL+Shag6Aj6VbUgUeg@mail.gmail.com>
In-Reply-To: <CA+GJov4BQ1mRa-JaHoML+gF7rk=XY=hCRL+Shag6Aj6VbUgUeg@mail.gmail.com>
From: Marie Zhussupova <marievic@google.com>
Date: Fri, 8 Aug 2025 08:20:20 -0400
X-Gm-Features: Ac12FXxk_i-p3y5IMbqA_cUeg1wd-aJHm01gFGsskeUDN6bJI53lY7PD-TwOzYw
Message-ID: <CAAkQn5JNmbuv=nj3Z5hDQNE0sAzrRNE_rJXrZVN4EqUDikV9=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: Add parent kunit for parameterized test context
To: Rae Moar <rmoar@google.com>
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

On Tue, Aug 5, 2025 at 11:17=E2=80=AFAM Rae Moar <rmoar@google.com> wrote:
>
> On Tue, Jul 29, 2025 at 3:37=E2=80=AFPM Marie Zhussupova <marievic@google=
.com> wrote:
> >
> > Currently, KUnit parameterized tests lack a mechanism
> > to share resources across individual test invocations
> > because the same `struct kunit` instance is reused for
> > each test.
> >
> > This patch refactors kunit_run_tests() to provide each
> > parameterized test with its own `struct kunit` instance.
> > A new parent pointer is added to `struct kunit`, allowing
> > individual parameterized tests to reference a shared
> > parent kunit instance. Resources added to this parent
> > will then be accessible to all individual parameter
> > test executions.
> >
> > Signed-off-by: Marie Zhussupova <marievic@google.com>
>
> Hello!
>
> Thank you so much for sending out this series. I have wanted to see an
> update of our parameterized test framework for a while. I have a few
> comments below for this patch. But otherwise it is looking good.
>
> Reviewed-by: Rae Moar <rmoar@google.com>
>
> Thanks!
> -Rae
>
> > ---
> >  include/kunit/test.h | 12 ++++++++++--
> >  lib/kunit/test.c     | 32 +++++++++++++++++++-------------
> >  2 files changed, 29 insertions(+), 15 deletions(-)
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 39c768f87dc9..a42d0c8cb985 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -268,14 +268,22 @@ struct kunit_suite_set {
> >   *
> >   * @priv: for user to store arbitrary data. Commonly used to pass data
> >   *       created in the init function (see &struct kunit_suite).
> > + * @parent: for user to store data that they want to shared across
> > + *         parameterized tests.
> >   *
>
> As David mentioned, I would also prefer that this provides a more
> general description of the @parent field here. Although this is
> currently only used for parameterized tests, it could have other use
> cases in the future.
>

Will edit this in v2.

> >   * Used to store information about the current context under which the=
 test
> >   * is running. Most of this data is private and should only be accesse=
d
> > - * indirectly via public functions; the one exception is @priv which c=
an be
> > - * used by the test writer to store arbitrary data.
> > + * indirectly via public functions; the two exceptions are @priv and @=
parent
> > + * which can be used by the test writer to store arbitrary data or dat=
a that is
> > + * available to all parameter test executions, respectively.
>
> In addition, I would prefer that the call out to @parent here is also
> changed to a more general description of the @parent field. However,
> feel free to also include the description of the use case for the
> parameterized tests.
>

I will edit this in v2, as well.

> >   */
> >  struct kunit {
> >         void *priv;
> > +       /*
> > +        * Reference to the parent struct kunit for storing shared reso=
urces
> > +        * during parameterized testing.
> > +        */
>
> I am more 50/50 on changing this description. Could change it just to:
> "Reference to the parent struct kunit for storing shared resources."

Thank you for the suggestion! The description would sound good.

>
> > +       struct kunit *parent;
> >
> >         /* private: internal use only. */
> >         const char *name; /* Read only after initialization! */
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index f3c6b11f12b8..4d6a39eb2c80 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
> >         struct kunit_case *test_case;
> >         struct kunit_result_stats suite_stats =3D { 0 };
> >         struct kunit_result_stats total_stats =3D { 0 };
> > +       const void *curr_param;
> >
> >         /* Taint the kernel so we know we've run tests. */
> >         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> > @@ -679,36 +680,39 @@ int kunit_run_tests(struct kunit_suite *suite)
> >                 } else {
> >                         /* Get initial param. */
> >                         param_desc[0] =3D '\0';
> > -                       test.param_value =3D test_case->generate_params=
(NULL, param_desc);
> > +                       /* TODO: Make generate_params try-catch */
> > +                       curr_param =3D test_case->generate_params(NULL,=
 param_desc);
> >                         test_case->status =3D KUNIT_SKIPPED;
> >                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDEN=
T KUNIT_SUBTEST_INDENT
> >                                   "KTAP version 1\n");
> >                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDEN=
T KUNIT_SUBTEST_INDENT
> >                                   "# Subtest: %s", test_case->name);
> >
> > -                       while (test.param_value) {
> > -                               kunit_run_case_catch_errors(suite, test=
_case, &test);
> > +                       while (curr_param) {
> > +                               struct kunit param_test =3D {
> > +                                       .param_value =3D curr_param,
> > +                                       .param_index =3D ++test.param_i=
ndex,
> > +                                       .parent =3D &test,
> > +                               };
> > +                               kunit_init_test(&param_test, test_case-=
>name, test_case->log);
> > +                               kunit_run_case_catch_errors(suite, test=
_case, &param_test);
> >
> >                                 if (param_desc[0] =3D=3D '\0') {
> >                                         snprintf(param_desc, sizeof(par=
am_desc),
> >                                                  "param-%d", test.param=
_index);
>
> This probably doesn't matter too much either way but should this be
> param_test.param_index instead? This would cover the case where the
> param_index is changed during the test run even though it shouldn't.
>

Thank you for catching this!

> >                                 }
> >
> > -                               kunit_print_ok_not_ok(&test, KUNIT_LEVE=
L_CASE_PARAM,
> > -                                                     test.status,
> > -                                                     test.param_index =
+ 1,
> > +                               kunit_print_ok_not_ok(&param_test, KUNI=
T_LEVEL_CASE_PARAM,
> > +                                                     param_test.status=
,
> > +                                                     param_test.param_=
index,
> >                                                       param_desc,
> > -                                                     test.status_comme=
nt);
> > +                                                     param_test.status=
_comment);
> >
> > -                               kunit_update_stats(&param_stats, test.s=
tatus);
> > +                               kunit_update_stats(&param_stats, param_=
test.status);
> >
> >                                 /* Get next param. */
> >                                 param_desc[0] =3D '\0';
> > -                               test.param_value =3D test_case->generat=
e_params(test.param_value, param_desc);
> > -                               test.param_index++;
> > -                               test.status =3D KUNIT_SUCCESS;
> > -                               test.status_comment[0] =3D '\0';
> > -                               test.priv =3D NULL;
> > +                               curr_param =3D test_case->generate_para=
ms(curr_param, param_desc);
> >                         }
> >                 }
> >
> > @@ -723,6 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
> >
> >                 kunit_update_stats(&suite_stats, test_case->status);
> >                 kunit_accumulate_stats(&total_stats, param_stats);
> > +               /* TODO: Put this kunit_cleanup into a try-catch. */
> > +               kunit_cleanup(&test);
>
> I might be missing something here but why not do this cleanup before
> the printing stage and only if the test was a parent param test?
>

Thank you for catching this too, it should be only for the parent param tes=
t.

>
>
> >         }
> >
> >         if (suite->suite_exit)
> > --
> > 2.50.1.552.g942d659e1b-goog
> >
