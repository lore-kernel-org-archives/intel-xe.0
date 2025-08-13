Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9123ECA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 09:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3709010E6BC;
	Wed, 13 Aug 2025 09:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EuLPHygw";
	dkim-atps=neutral
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B300E10E6BF
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 09:18:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-7074710a809so55402526d6.1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755076696; x=1755681496;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j4DfQnUk+TiV+Sw+vN/uSQTBoAAD/5sIpiqpUQXhCr8=;
 b=EuLPHygwqEEU+Q6AMfRrQBA3BhN9wqZ2jSK0IpXiFZrJ53UMqipgHi9yufKyZ2SYau
 5APxEgY4O8hBrB1+CoMf2jWgDnK/qjftFldr7qAgSqUwG9rGDMmVz6PTn1t3owIbkZj1
 LIwRGnadnarRWYhOE9or+YzsjcQWcR4Xv86x5w+CeESEw7dSIr0AVIgknICByqxB4mxf
 gANsWXmVCH0S3yVzKg6FvU624y9GMXbmKZRxVdN7QT/j3cZjpC5AqK5FfB+kVh6BaXFT
 5V8WkmRyWgXHSvUyzSY7/hyqZQv7RcjKjpWS5KvQCozxmn9e1hLUNZ+kOnBADX0gEveT
 CH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755076696; x=1755681496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4DfQnUk+TiV+Sw+vN/uSQTBoAAD/5sIpiqpUQXhCr8=;
 b=ZkXz5fAy0z+14GcMfRQ6rMpogv250lkabzzOzvzzdamaT75fKjTW9/9jNsKpUJI3W5
 agzjueWqRRCnJwt6EEvQiLZC+9kb6V0O+Xgh5nhHmqQLlUPEV4M/Q533shxSdY2XfN1n
 tV5fMH5+fih6dxTwehRFi5z3Eh72x4WVfLlVMpBj6aO47P/gpdXP87s9qP5WHfhrreEO
 qlPWWe4FLEEsL+6iwJgysYwwIrgePjvDkcFmJ5NciaxuD4iPSaEg9Cf2fUe3mQC4OnUM
 SU/tyHSRr9ytRIQ/vVggwg6xBBwIr2mULGWhnSp52vsEQnp9LAug9esLn+hXrvOZnjmo
 nn/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXX6qBaozJXifShAXkhRoww36uwHBIf3D+ir5v+wPWrgJMDUoN7DTrb9MDs8+rqZ8AP9svOF7+Zw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4YyXaBnp3f+cp7F/wvF09M3MhFyEQCFyHYVQQw6rU4y88I/vj
 OWRZDrl1mbt6moRsaL7MOqTAFMZtAAtyqUkvJB1q/T1iov29g3ppdVExFbBeV+A6svKp/VOKiFa
 yjO1arFCy17oy7euPZ/CEFyq4U7ixEleyXgrtBDyQ
X-Gm-Gg: ASbGncslS/ab604iAoIEsuVWKtuJW9Q8VSOxzPjtTYjWNgDVgNIr+ran2paQf+5yZNl
 Ayb92hu6PRiAcUPqGpUqK+8aoiUrkvYHzRn1dC67Aj/bzsq0xsGWTnTzlMFQz32dqX8zTZvS++m
 GMgncEQmXT7aBlX4gcYUZ/889SUBNAmqa8YB1bPWpUuTcPy58pFV2K4JAp3itL000btPeHZ/Fup
 SA7rU002wcjQxEeuLs=
X-Google-Smtp-Source: AGHT+IE1s8Xmh0+H3SjknMM+/w0dkTFXcpwhvKn/43GkRFbSgZQ4vUCtVyVEJeJCwaoAk8ZdMrOGLrmULWYw1imE2z8=
X-Received: by 2002:a05:6214:496:b0:707:63b8:3d46 with SMTP id
 6a1803df08f44-709e8916ee5mr22468956d6.30.1755076694615; Wed, 13 Aug 2025
 02:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
 <20250811221739.2694336-7-marievic@google.com>
In-Reply-To: <20250811221739.2694336-7-marievic@google.com>
From: David Gow <davidgow@google.com>
Date: Wed, 13 Aug 2025 17:18:02 +0800
X-Gm-Features: Ac12FXzT0IXItoqBO7bxGPm35Rf7lQ6ZUodJe1rnl9ooiyOl6MihEh9wNgqeeJE
Message-ID: <CABVgOSkz9LPXYv4Mfuf3Mo+65LzNeFd0kepBsALo2dm9MSc_7w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] kunit: Add example parameterized test with direct
 dynamic parameter array setup
To: Marie Zhussupova <marievic@google.com>
Cc: rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev, 
 mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000071cfa063c3ba31d"
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

--000000000000071cfa063c3ba31d
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 06:18, Marie Zhussupova <marievic@google.com> wrote:
>
> Introduce example_params_test_with_init_dynamic_arr(). This new
> KUnit test demonstrates directly assigning a dynamic parameter
> array, using the kunit_register_params_array() macro, to a
> parameterized test context.
>
> It highlights the use of param_init() and param_exit() for
> initialization and exit of a parameterized test, and their
> registration to the test case with KUNIT_CASE_PARAM_WITH_INIT().
>
> Signed-off-by: Marie Zhussupova <marievic@google.com>
> ---

I really like this example now. Thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>
> Changes in v2:
>
> - kunit_array_gen_params() is now explicitly passed to
>   KUNIT_CASE_PARAM_WITH_INIT() to be consistent with
>   the parameterized test being defined by the existence
>   of the generate_params() function.
> - param_init() was changed to output a log at the start
>   of a parameterized test.
> - The parameter array was changed to be allocated
>   using kunit_kmalloc_array(), a KUnit memory allocation
>   API, as that would be the preferred/easier method. To
>   still demonstrate a use of param_exit(), it now outputs
>   a log at the end of the parameterized test.
> - The comments and the commit message were changed to
>   reflect the parameterized testing terminology. See
>   the patch series cover letter change log for the
>   definitions.
>
> ---
>  lib/kunit/kunit-example-test.c | 104 +++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
> index f2819ee58965..ff21511889a4 100644
> --- a/lib/kunit/kunit-example-test.c
> +++ b/lib/kunit/kunit-example-test.c
> @@ -393,6 +393,107 @@ static void example_params_test_with_init(struct kunit *test)
>         kunit_put_resource(res);
>  }
>
> +/*
> + * Helper function to create a parameter array of Fibonacci numbers. This example
> + * highlights a parameter generation scenario that is:
> + * 1. Not feasible to fully pre-generate at compile time.
> + * 2. Challenging to implement with a standard generate_params() function,
> + * as it only provides the previous parameter, while Fibonacci requires
> + * access to two preceding values for calculation.
> + */
> +static void *make_fibonacci_params(struct kunit *test, size_t seq_size)
> +{
> +       int *seq;
> +
> +       if (seq_size <= 0)
> +               return NULL;
> +       /*
> +        * Using kunit_kmalloc_array here ties the lifetime of the array to
> +        * the parameterized test i.e. it will get automatically cleaned up
> +        * by KUnit after the parameterized test finishes.
> +        */
> +       seq = kunit_kmalloc_array(test, seq_size, sizeof(int), GFP_KERNEL);
> +
> +       if (!seq)
> +               return NULL;
> +       if (seq_size >= 1)
> +               seq[0] = 0;
> +       if (seq_size >= 2)
> +               seq[1] = 1;
> +       for (int i = 2; i < seq_size; i++)
> +               seq[i] = seq[i - 1] + seq[i - 2];
> +       return seq;
> +}
> +
> +/*
> + * This is an example of a function that provides a description for each of the
> + * parameters.
> + */
> +static void example_param_dynamic_arr_get_desc(struct kunit *test, const void *p, char *desc)
> +{
> +       const int *fib_num = p;
> +
> +       snprintf(desc, KUNIT_PARAM_DESC_SIZE, "fibonacci param: %d", *fib_num);
> +}
> +
> +/*
> + * Example of a parameterized test param_init() function that registers a dynamic
> + * array of parameters.
> + */
> +static int example_param_init_dynamic_arr(struct kunit *test)
> +{
> +       size_t seq_size;
> +       int *fibonacci_params;
> +
> +       kunit_info(test, "initializing parameterized test\n");
> +
> +       seq_size = 6;
> +       fibonacci_params = make_fibonacci_params(test, seq_size);
> +
> +       if (!fibonacci_params)
> +               return -ENOMEM;
> +
> +       /*
> +        * Passes the dynamic parameter array information to the parameterized test
> +        * context struct kunit. The array and its metadata will be stored in
> +        * test->parent->params_array. The array itself will be located in
> +        * params_data.params.
> +        *
> +        * Note that you will need to pass kunit_array_gen_params() as the
> +        * generator function to KUNIT_CASE_PARAM_WITH_INIT() when registering
> +        * a parameter array this route.
> +        */
> +       kunit_register_params_array(test, fibonacci_params, seq_size,
> +                                   example_param_dynamic_arr_get_desc);
> +       return 0;
> +}
> +
> +/*
> + * Example of a parameterized test param_exit() function that outputs a log
> + * at the end of the parameterized test. It could also be used for any other
> + * teardown logic.
> + */
> +static void example_param_exit_dynamic_arr(struct kunit *test)
> +{
> +       kunit_info(test, "exiting parameterized test\n");
> +}
> +
> +/*
> + * Example of test that uses the registered dynamic array to perform assertions
> + * and expectations.
> + */
> +static void example_params_test_with_init_dynamic_arr(struct kunit *test)
> +{
> +       const int *param = test->param_value;
> +       int param_val;
> +
> +       /* By design, param pointer will not be NULL. */
> +       KUNIT_ASSERT_NOT_NULL(test, param);
> +
> +       param_val = *param;
> +       KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
> +}
> +
>  /*
>   * Here we make a list of all the test cases we want to add to the test suite
>   * below.
> @@ -414,6 +515,9 @@ static struct kunit_case example_test_cases[] = {
>         KUNIT_CASE_PARAM(example_params_test, example_gen_params),
>         KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
>                                    example_param_init, NULL),
> +       KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_arr,
> +                                  kunit_array_gen_params, example_param_init_dynamic_arr,
> +                                  example_param_exit_dynamic_arr),
>         KUNIT_CASE_SLOW(example_slow_test),
>         {}
>  };
> --
> 2.51.0.rc0.205.g4a044479a3-goog
>

--000000000000071cfa063c3ba31d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAFFwOy5zrkc9g75Fk3jHNEw
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNTA2MDEwODEx
MTdaFw0yNTExMjgwODExMTdaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqxNhYGgWa19wqmZKM9x36vX1Yeody+Yaf
r0MV27/mVFHsaMmnN5CpyyGgxplvPa4qPwrBj+5kp3o7syLcqCX0s8cUb24uZ/k1hPhDdkkLbb9+
2Tplkji3loSQxuBhbxlMC75AhqT+sDo8iEX7F4BZW76cQBvDLyRr/7VG5BrviT5zFsfi0N62WlXj
XMaUjt0G6uloszFPOWkl6GBRRVOwgLAcggqUjKiLjFGcQB5GuyDPFPyTR0uQvg8zwSOph7TNTb/F
jyics8WBCAj6iSmMX96uJ3Q7sdtW3TWUVDkHXB3Mk+9E2P2mRw3mS5q0VhNLQpFrox4/gXbgvsji
jmkLAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFBp5bTxrTm/d
WMmRETO8lNkA4c7fMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBF
tO3/N2l9hTaij/K0xCpLwIlrqpNo0nMAvvG5LPQQjSeHnTh06tWTgsPCOJ65GX+bqWRDwGTu8WTq
c5ihCNOikBs25j82yeLkfdbeN/tzRGUb2RD+8n9I3CnyMSG49U2s0ZdncsrIVFh47KW2TpHTF7R8
N1dri01wPg8hw4u0+XoczR2TiBrBOISKmAlkAi+P9ivT31gSHdbopoL4x0V2Ow9IOp0chrQQUZtP
KBytLhzUzd9wIsE0QMNDbw6jeG8+a4sd17zpXSbBywIGw7sEvPtnBjMaf5ib3kznlOne6tuDVx4y
QFExTCSrP3OTMUkNbpIdgzg2CHQ2aB8i8YsTZ8Q8Q8ztPJ+xDNsqBUeYxILLjTjxQQovToqipB3f
6IMyk+lWCdDS+iCLYZULV1BTHSdwp1NM3t4jZ8TMlV+JzAyRqz4lzSl8ptkFhKBJ7w2tDrZ3BEXB
8ASUByRxeh+pC1Z5/HhqfiWMVPjaWmlRRJVlRk+ObKIv2CblwxMYlo2Mn8rrbEDyfum1RTMW55Z6
Vumvw5QTHe29TYxSiusovM6OD5y0I+4zaIaYDx/AtF0mMOFXb1MDyynf1CDxhtkgnrBUseHSOU2e
MYs7IqzRap5xsgpJS+t7cp/P8fdlCNvsXss9zZa279tKwaxR0U2IzGxRGsWKGxDysn1HT6pqMDGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAUXA7LnOuRz2DvkWTeMc
0TANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgLQoiu5MVHkhLfMyYCVY4t3/KGEVZ
oaw8srlSTLlko9kwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
ODEzMDkxODE2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAOOAfQ8jkkydd1Kyh7WxfrjJwjlM43/JItFE1hrT7ubxgRCuBp0Q8M/cK+H3i5Exa
vJw5zWP5XwdMjkQDtMajappY0XUFZw14olhYMEzqNidZ6RPOI2EbJriUFckBeJKH4rtOJNWaQUnH
AGh79Cj9X7pQBvYnrEUVscdwBiH0MuJibrYi6YKOTO1OzDLrQQfxloxp+CbyWuenGB56M9EQSJ/T
LoIiTSvy8V4m2f9b9s0SZs+y7knUvPw74Ji/dGml+bxmmHP1oypQXPEu2lwFhYiK2Ova0vIz4ho7
Qk4WWgTFVbDeDdVEJoFhPUEv814b2+2G/cyJUiphRxSVOBPoZg==
--000000000000071cfa063c3ba31d--
