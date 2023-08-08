Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9123DC001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 07:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AED410E3B3;
	Tue,  8 Aug 2023 07:47:47 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFE910E3B4
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 07:47:44 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe32ec7201so42225e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Aug 2023 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691480863; x=1692085663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CpgnDX2dLNx/BOI/4SWAevbS4J+nfKigQXNyf7knd1I=;
 b=MLWmTTvpdMHh5KiaVSLrwFMOZL33F/O2S56auDNXsSqZ+fzHjA9cbEPHPd+Ow9FQZU
 m/GiA8YcEZX1HSPG8zojncMCMO72GtXRRB+GaZeJcjZQbhdWZuVzj0lV1tNeuTCIDKsP
 rWk1Fuvj8VLG6UxbnohhotVSnqUKs+8xBullMewjUB2cekul8g8VGRPkdiOnAbP8Cqea
 D975VOE/sTSK2dKMOswHwIO3XHdgorgzPFFm5b/khQHQJIBmnGME/G3pp/QMX6IcWizY
 R9/eCL1SAwT331IpGBCx7WncPX7hyWIsPDvFrjxY50TNJBFDUfAeachOdBLFDAXr/SnB
 pN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691480863; x=1692085663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpgnDX2dLNx/BOI/4SWAevbS4J+nfKigQXNyf7knd1I=;
 b=ahfHBClbcLQNloIJ28A7SylteECiVzlL2+vmRH41cQlwWnUwZt6B5SanYuIt54JHIC
 tNufMCUD092GNfyGinGkkrZ2hIpjKU33VS1Tgk0zbW4VqVFv+PrL3WGTRbBZxMK/nxBv
 r0dc5xag85y01a1AU72Ofg+covUwONjTU8lrM8KOxYMOD+4NKeWvGH/Vd1DkkLzKgRFz
 GK60RnmFen8WeIqV7XSvDni1FcsQi3HqukwqoNIeZxA7mtJv3udLPM3aqm9BSXA9jL++
 d1pD3lqdx/RfacsgShtoaXggkaHqclAuHALrXGm6nDNnJFGsfZxDNTevOkPZ5YCXEk+k
 Glww==
X-Gm-Message-State: AOJu0YzakHrOV/ZErdo3CGel7au8cxRYb2DJNvTuji6xtMK2V5H6kK+6
 6qCku9f6wZ4HPqkedIXOfHyLVS72OWvg7AySxlMQ4/KvIsKrWunawM0=
X-Google-Smtp-Source: AGHT+IHHBj+JMRoY2Rc9Watos5MOLLYPxXUDuvXezmIXm8xsjK7cEyQWZY3aJlDo3S4nUygwmnrHwro6IdUNtyUdYdk=
X-Received: by 2002:a05:600c:1c97:b0:3f1:9a3d:4f7f with SMTP id
 k23-20020a05600c1c9700b003f19a3d4f7fmr292165wms.1.1691480862959; Tue, 08 Aug
 2023 00:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230807102352.4607-5-janusz.krzysztofik@linux.intel.com>
 <20230807102352.4607-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230807102352.4607-7-janusz.krzysztofik@linux.intel.com>
From: David Gow <davidgow@google.com>
Date: Tue, 8 Aug 2023 15:47:31 +0800
Message-ID: <CABVgOSkKotPU13YJyT6bcerXZyZuc7Vu+1kyatEjXjvcM7fRzg@mail.gmail.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000018c6206026494bf"
Subject: Re: [Intel-xe] [PATCH v5 2/3] kunit: Make 'list' action available
 to kunit test modules
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
Cc: linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 igt-dev@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--000000000000018c6206026494bf
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Aug 2023 at 18:28, Janusz Krzysztofik
<janusz.krzysztofik@linux.intel.com> wrote:
>
> Results from kunit tests reported via dmesg may be interleaved with other
> kernel messages.  When parsing dmesg for modular kunit results in real
> time, external tools, e.g., Intel GPU tools (IGT), may want to insert
> their own test name markers into dmesg at the start of each test, before
> any kernel message related to that test appears there, so existing upper
> level test result parsers have no doubt which test to blame for a specific
> kernel message.  Unfortunately, kunit reports names of tests only at their
> completion (with the exeption of a not standarized "# Subtest: <name>"
> header above a test plan of each test suite or parametrized test).
>
> External tools could be able to insert their own "start of the test"
> markers with test names included if they new those names in advance.
> Test names could be learned from a list if provided by a kunit test
> module.
>
> There exists a feature of listing kunit tests without actually executing
> them, but it is now limited to configurations with the kunit module built
> in and covers only built-in tests, already available at boot time.
> Moreover, switching from list to normal mode requires reboot.  If that
> feature was also available when kunit is built as a module, userspace
> could load the module with action=list parameter, load some kunit test
> modules they are interested in and learn about the list of tests provided
> by those modules, then unload them, reload the kunit module in normal mode
> and execute the tests with their lists already known.
>
> Extend kunit module notifier initialization callback with a processing
> path for only listing the tests provided by a module if the kunit action
> parameter is set to "list" or "list_attr".  For user convenience, make the
> kunit.action parameter visible in sysfs.
>
> v2: Don't use a different format, use kunit_exec_list_tests() (Rae),
>   - refresh on top of new attributes patches, handle newly introduced
>     kunit.action=list_attr case (Rae).
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Rae Moar <rmoar@google.com>
> ---

Looks good, thanks!

Reviewed-by: David Gow <davidgow@google.com>

>  include/kunit/test.h |  2 ++
>  lib/kunit/executor.c | 28 +++++++++++++++++-----------
>  lib/kunit/test.c     | 18 +++++++++++++++---
>  3 files changed, 34 insertions(+), 14 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 3d002e6b252f2..6a338a3267ed5 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -309,6 +309,7 @@ static inline void kunit_set_failure(struct kunit *test)
>  }
>
>  bool kunit_enabled(void);
> +const char *kunit_action(void);
>
>  void kunit_init_test(struct kunit *test, const char *name, char *log);
>
> @@ -324,6 +325,7 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
>  void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
>
>  void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin);
> +void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr);
>
>  #if IS_BUILTIN(CONFIG_KUNIT)
>  int kunit_run_all_tests(void);
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index 5ef90c334eb0f..e877c1f1e75c8 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -13,22 +13,29 @@
>  extern struct kunit_suite * const __kunit_suites_start[];
>  extern struct kunit_suite * const __kunit_suites_end[];
>
> +static char *action_param;
> +
> +module_param_named(action, action_param, charp, 0400);
> +MODULE_PARM_DESC(action,
> +                "Changes KUnit executor behavior, valid values are:\n"
> +                "<none>: run the tests like normal\n"
> +                "'list' to list test names instead of running them.\n"
> +                "'list_attr' to list test names and attributes instead of running them.\n");
> +
> +const char *kunit_action(void)

I'm not _totally_ sold on the name kunit_action() for a function here,
but none of the other options I can think of (kunit_get_action(),
kunit_action_param(), kunit_action_value(), etc) sound better, so
let's go with it.


> +{
> +       return action_param;
> +}
> +
>  #if IS_BUILTIN(CONFIG_KUNIT)
>
>  static char *filter_glob_param;
> -static char *action_param;
>  static char *filter_param;
>  static char *filter_action_param;
>
>  module_param_named(filter_glob, filter_glob_param, charp, 0);
>  MODULE_PARM_DESC(filter_glob,
>                 "Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
> -module_param_named(action, action_param, charp, 0);
> -MODULE_PARM_DESC(action,
> -                "Changes KUnit executor behavior, valid values are:\n"
> -                "<none>: run the tests like normal\n"
> -                "'list' to list test names instead of running them.\n"
> -                "'list_attr' to list test names and attributes instead of running them.\n");
>  module_param_named(filter, filter_param, charp, 0);
>  MODULE_PARM_DESC(filter,
>                 "Filter which KUnit test suites/tests run at boot-time using attributes, e.g. speed>slow");
> @@ -239,10 +246,7 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
>         __kunit_test_suites_init(suite_set->start, num_suites);
>  }
>
> -#if IS_BUILTIN(CONFIG_KUNIT)
> -
> -static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
> -                                 bool include_attr)
> +void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr)
>  {
>         struct kunit_suite * const *suites;
>         struct kunit_case *test_case;
> @@ -265,6 +269,8 @@ static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
>         }
>  }
>
> +#if IS_BUILTIN(CONFIG_KUNIT)
> +
>  int kunit_run_all_tests(void)
>  {
>         struct kunit_suite_set suite_set = {
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 8b2808068497f..5232a43737826 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -739,13 +739,25 @@ static void kunit_module_init(struct module *mod)
>         struct kunit_suite_set suite_set = {
>                 mod->kunit_suites, mod->kunit_suites + mod->num_kunit_suites,
>         };
> -
> -       kunit_exec_run_tests(&suite_set, false);
> +       const char *action = kunit_action();
> +
> +       if (!action)
> +               kunit_exec_run_tests(&suite_set, false);
> +       else if (!strcmp(action, "list"))
> +               kunit_exec_list_tests(&suite_set, false);
> +       else if (!strcmp(action, "list_attr"))
> +               kunit_exec_list_tests(&suite_set, true);
> +       else
> +               pr_err("kunit: unknown action '%s'\n", action);
>  }
>
>  static void kunit_module_exit(struct module *mod)
>  {
> -       __kunit_test_suites_exit(mod->kunit_suites, mod->num_kunit_suites);
> +       const char *action = kunit_action();
> +
> +       if (!action)
> +               __kunit_test_suites_exit(mod->kunit_suites,
> +                                        mod->num_kunit_suites);
>  }
>
>  static int kunit_module_notify(struct notifier_block *nb, unsigned long val,
> --
> 2.41.0
>

--000000000000018c6206026494bf
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
9IGQSBx2i4m+hGXJpET+MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQCRI3Z4cAidgFcv
Usqdz765x6KMZSfg/WtFrYg8ewsP2NpCxVM2+EhPyyEQ0k0DhtzdtGoI/Ug+jdFDyCKB9P2+EPLh
iMjMnFILp7Zs4r18ECHlvZuDZfH9m0BchXIxu5jLIuQyKUWrCRDZZEDNr510ZhhVfYSFPA8ms1nk
jyzYFOHYQyv5IfML/3IBFKlON5OZa+V8EZYULYcNkp03DdWglafj7SXZ1/XgAbVYrC381UvrsYN8
jndVvoa1GWwe+NVlIIK7Q3uAjV3qLEDQpaNPg1rr0oAn6YmvTccjVMqj2YNwN+RHhKNzgRGxY5ct
FaN+8fXZhRhpv3bVbAWuPZXoMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABAz5xDls09r2CKyYRqnNbMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDA
SZYyZqauVRk78yef0+QxVUv6jrXFKNbmJmZ1ZMFaUTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA4MDgwNzQ3NDNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAmarO2lkeOfe4TFcLH8P3
4kVGaq9zBXggYmiQ8GzGKTcSRb5NuB4uh21QwU4uFy6GdG3cuFnWkr9VQ9b923hUuTSFznjDl6kA
MemFJbOJmV4myrg2DDZ/c9MxbzcStFlgRGzii+s9RaZJ7LhsqCPNVL1nCq6wdT7EL30uRjduluUP
FTzXg8Js67k7rgObhpZuTIGBhglaw7Pzg1VeTcEHJ3wYoudBUN0dHy7e6l+igRrVz4dl/bhxh5Fm
hRzoU4gpepJUkjypp+yYdn7EiwNSXxHJtOoLa+9beORFHEuYN2BFebB4CRjswLOTa5HQalvOFehQ
V3EzWUq1Q6w0EBUyrA==
--000000000000018c6206026494bf--
