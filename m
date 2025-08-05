Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7393C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B45110E6B2;
	Tue,  5 Aug 2025 15:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UFNBbPUV";
	dkim-atps=neutral
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27F10E6B5
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 15:19:29 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-88bb987d8fbso2993693241.3
 for <intel-xe@lists.freedesktop.org>; Tue, 05 Aug 2025 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754407168; x=1755011968;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/M4EHqiBN5lPxOAQu9DhSS4CshVThGJ9tZazXfyjBo=;
 b=UFNBbPUVyMN5GnGS27GHRsk0/jtRLbfLNeXeBPt0moyR2Aa9T0XCza/vtV5kGUYD/G
 tlBVrXDCCNARZLnDP7vO/UHdFj5fM3MusADhODCvoQpPOtfZaZnDEl9bzlaEPU9cD+gt
 abHnWYQI7D1J2+4RA2aACaNeAMJaF4irNIkPAzQx/m4m1mz4mp++A934LXIgkF0SWZod
 GrLCBQwyWO/mD7R82BuwSohA6N9n9//UK/v+K2Nzbj2izO7LDCudrCuSFThL00uwGQgb
 HpqYhAEalyF2cOK3+2Gs/uC9c1ujYMCRmo0DynutWplmYPnTEheFXTFp/bNFyO3dPJRy
 Q4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407168; x=1755011968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/M4EHqiBN5lPxOAQu9DhSS4CshVThGJ9tZazXfyjBo=;
 b=CDEKZ//d6r9vsfaUtzBtSjL4hWJKdnD5oQKRdCYQ41NvX5cpa/x1QDmAipN7zYWb1W
 kKiFitYGv/WEBmOVpzyoMnHNeNVcE8tHady5xMbGPbcZvIDZ/TPBm9wWTYqxazNn0zoU
 tpmybOLCBosblvGn6JanKYM8h2Az6+YQQNSOTR1nLAUdDKZA1pBbhvaBjAkYrbOWPe2O
 RZizWl/G0qJLBAfFACBnj/jAtnmxCdVAGCK4zpSfPxdqUO+QFf67XtzNYqDA7+vyjyUc
 v2E7+yHq4r8guTTnFOzVtEwEYpfknNPLxv2U5eZvZvG4Qpw3xpR/NoMzgV/BAwHg6nzv
 TXEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBwTF3QTN55h98Yc3q2IkblFjsJ7xElorcmAIpyJP4cuJh9trtB2i6c+vNr1TpIeW8Tb1WBX5/LQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb1k1C45eH1C93EH4eiG7FWXovMn+5xlKU9ZgnfaSr1yCijd8y
 PRtH7U0E2lOuLyC9+vkJ/gbMuxYXqDSsTDeYkTmoRtiWdsJFwrbKBliFwLZZ2RNuuwuEkUdfuZJ
 oYJprEp252pMj6e99Aga5vruX1Uk5T6aCAw1+VLZI
X-Gm-Gg: ASbGnctfMjWa8wF18cjwnpP7bvHElZmQ/tRNDjc+3g0ajODgtsp6ILSIIgsRiouil/m
 G0OX3W9ZP8DTvd9NYbxuo/JGDTJAGvSj2LrWHT2+F3C8MY4A3IAVAcDNXLM+XV7I+vJjS6yKdfU
 jayuAFP9uG4rCzQjHp1eD8KgtEBOBAplyYWEYLEOo9MwocRtdQ+q8wTZ38ztD6ZZEXzNd7GoOti
 z9HA4AbDoUo/Ff1t1nujyWgkQTltmcs03Ym3UmYdQ==
X-Google-Smtp-Source: AGHT+IHjJEw8sVdTHte54J+p7uJGtRguCx8AzAoiQ6fVM5yxU1E8YQ+6+xI4HY35yRy2zOsQxlr1JCh0pO85w5p+dko=
X-Received: by 2002:a05:6102:5ccb:b0:4e5:9380:9c20 with SMTP id
 ada2fe7eead31-4fdc1b4ebdbmr6328940137.2.1754407168016; Tue, 05 Aug 2025
 08:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
 <20250729193647.3410634-9-marievic@google.com>
In-Reply-To: <20250729193647.3410634-9-marievic@google.com>
From: Rae Moar <rmoar@google.com>
Date: Tue, 5 Aug 2025 11:19:16 -0400
X-Gm-Features: Ac12FXyMmUl4gu7cWRijQYgUuECjdwsoCyIrsthniHfiJ52BVbgwKDdOONRK8UA
Message-ID: <CA+GJov6Xcn_X8iDz9wQhpSo_O+v4DyaqYfW8heQ_+q-DxdOK9Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] kunit: Add example parameterized test with direct
 dynamic parameter array setup
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
> Introduce `example_params_test_with_init_dynamic_arr`. This new
> KUnit test demonstrates directly assigning a dynamic parameter
> array using the `kunit_register_params_array` macro. It highlights the
> use of `param_init` and `param_exit` for proper initialization and
> cleanup, and their registration to the test with
> `KUNIT_CASE_PARAM_WITH_INIT`.
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>

Hello!

This test is interesting and complex. I am very happy to see this test
accepted. I think it is a good demonstration of the new parameterized
test features.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae

> ---
>  lib/kunit/kunit-example-test.c | 95 ++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-tes=
t.c
> index 5bf559e243f6..3ab121d81bf6 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -387,6 +387,98 @@ static void example_params_test_with_init(struct kun=
it *test)
>         kunit_put_resource(res);
>  }
>
> +/*
> + * Helper function to create a parameter array of Fibonacci numbers. Thi=
s example
> + * highlights a parameter generation scenario that is:
> + * 1. Not feasible to fully pre-generate at compile time.
> + * 2. Challenging to implement with a standard 'generate_params' functio=
n,
> + * as it typically only provides the immediately 'prev' parameter, while
> + * Fibonacci requires access to two preceding values for calculation.
> + */
> +static void *make_fibonacci_params(int seq_size)
> +{
> +       int *seq;
> +
> +       if (seq_size <=3D 0)
> +               return NULL;
> +
> +       seq =3D kmalloc_array(seq_size, sizeof(int), GFP_KERNEL);
> +
> +       if (!seq)
> +               return NULL;
> +
> +       if (seq_size >=3D 1)
> +               seq[0] =3D 0;
> +       if (seq_size >=3D 2)
> +               seq[1] =3D 1;
> +       for (int i =3D 2; i < seq_size; i++)
> +               seq[i] =3D seq[i - 1] + seq[i - 2];
> +       return seq;
> +}
> +
> +/*
> + * This is an example of a function that provides a description for each=
 of the
> + * parameters.
> + */
> +static void example_param_dynamic_arr_get_desc(const void *p, char *desc=
)
> +{
> +       const int *fib_num =3D p;
> +
> +       snprintf(desc, KUNIT_PARAM_DESC_SIZE, "fibonacci param: %d", *fib=
_num);
> +}
> +
> +/*
> + * Example of a parameterized test init function that registers a dynami=
c array.
> + */
> +static int example_param_init_dynamic_arr(struct kunit *test)
> +{
> +       int seq_size =3D 6;
> +       int *fibonacci_params =3D make_fibonacci_params(seq_size);
> +
> +       if (!fibonacci_params)
> +               return -ENOMEM;
> +
> +       /*
> +        * Passes the dynamic parameter array information to the parent s=
truct kunit.
> +        * The array and its metadata will be stored in test->parent->par=
ams_data.
> +        * The array itself will be located in params_data.params.
> +        */
> +       kunit_register_params_array(test, fibonacci_params, seq_size,
> +                                   example_param_dynamic_arr_get_desc);
> +       return 0;
> +}
> +
> +/**
> + * Function to clean up the parameterized test's parent kunit struct if
> + * there were custom allocations.
> + */
> +static void example_param_exit_dynamic_arr(struct kunit *test)
> +{
> +       /*
> +        * We allocated this array, so we need to free it.
> +        * Since the parent parameter instance is passed here,
> +        * we can directly access the array via `test->params_data.params=
`
> +        * instead of `test->parent->params_data.params`.
> +        */
> +       kfree(test->params_data.params);
> +}
> +
> +/*
> + * Example of test that uses the registered dynamic array to perform ass=
ertions
> + * and expectations.
> + */
> +static void example_params_test_with_init_dynamic_arr(struct kunit *test=
)
> +{
> +       const int *param =3D test->param_value;
> +       int param_val;
> +
> +       /* By design, param pointer will not be NULL. */
> +       KUNIT_ASSERT_NOT_NULL(test, param);
> +
> +       param_val =3D *param;
> +       KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
> +}
> +
>  /*
>   * Here we make a list of all the test cases we want to add to the test =
suite
>   * below.
> @@ -408,6 +500,9 @@ static struct kunit_case example_test_cases[] =3D {
>         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
>         KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, NULL,
>                                    example_param_init, NULL),
> +       KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_=
arr, NULL,
> +                                  example_param_init_dynamic_arr,
> +                                  example_param_exit_dynamic_arr),
>         KUNIT_CASE_SLOW(example_slow_test),
>         {}
>  };
> --
> 2.50.1.552.g942d659e1b-goog
>
