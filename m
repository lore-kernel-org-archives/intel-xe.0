Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF8C001DB
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 20:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696310E239;
	Thu,  3 Aug 2023 20:59:14 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759D210E239
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 20:57:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe32ec7201so7765e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Aug 2023 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691096274; x=1691701074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ofH5Ap+npATtmlPdgXvqsVXZejSyesTvHQo0nsoVn0=;
 b=F3+oc/PifQtBQW1MWoCSD0Te/F47iIDr17mmLNFUtx5yQORT+eKAQ3TSD6YGmupbFx
 MIHMZ4cXNcfxM76/R0yxe+1uODOYG/ZftO8kQ2rmm9LHDywYxVO5ow4X3PLF5JBdFPUP
 IRChlDHWhtT1mnJL/ljAGGZgFNqEd1eBTtTPEH+D0HHofBW4fRy/dgInc81cYAPKZ6t8
 55K1le2e+ht7nHovTmTj2ND8KwfXnrAsdEyBV17p/xhHuu1nhN0dB6WtaVewteoXJAYQ
 o8xxghWACIQBS9XTvZgl0WB7AEqy82Qv/8Es3rf+6ghiEYSxIlDTStH6iaqDLjPJJgWA
 dKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691096274; x=1691701074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ofH5Ap+npATtmlPdgXvqsVXZejSyesTvHQo0nsoVn0=;
 b=J8bq12gr3ke00tdmRCeVovllpWK2bm1eN5VCkrG4/WvPmUlyyY4ZpDlLqwfFCe2Nuq
 IrVttd66Y9EYhYjj4t9yMy5Hv+6tUfKz0R6Cv7HZqJAIAqtZvp7Ihhi6W7AXu3g2UBTJ
 6PGTv+niTLr2Yu8NSObc91uSkjosUSWheyc2EZp1Xge1ZFfzfMFCyR0BFIYd412OZN/b
 P3bAp1VmVJWQEvZtJp/Sn1tVeCttAz8WYLUBK8RpTJgsttxWBdYFRh1nfzzMIMbP7l5S
 OXcOlxS/fDnLR+a2vO3FIaA1F+hih2UYUul8WN7SgKXArkzlDGWPGsiUrs+vGOi6CCZB
 pmLA==
X-Gm-Message-State: AOJu0Yyo3jZd9NZxRLG/YX3sP3EkOt1/fyRWH0V/Qx2oHRb4FJ0RdHG2
 BW8wA7BBFxSJ0X9mg/WEzscqNRiPsKDgMBC4G2x4wQ==
X-Google-Smtp-Source: AGHT+IH0LDzbq4mBhb6+V8+vKGGS4Jwp5flyTLhrxiOBk8c6t4hKgAVe7039h26B5BggqWFzo3z6NGN6iwc2YYqAG1Y=
X-Received: by 2002:a05:600c:4583:b0:3f1:6fe9:4a95 with SMTP id
 r3-20020a05600c458300b003f16fe94a95mr17322wmo.4.1691096273798; Thu, 03 Aug
 2023 13:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
 <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230731141021.2854827-6-janusz.krzysztofik@linux.intel.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 3 Aug 2023 16:57:43 -0400
Message-ID: <CA+GJov5G_JWJM3Rw14O-CTioEoB_aTf4SyM-G+tCKEP_txc8yw@mail.gmail.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 03 Aug 2023 20:59:13 +0000
Subject: Re: [Intel-xe] [PATCH v3 1/3] kunit: Report the count of test
 suites in a module
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
Cc: David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org,
 igt-dev@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 10:12=E2=80=AFAM Janusz Krzysztofik
<janusz.krzysztofik@linux.intel.com> wrote:
>
> According to KTAP specification[1], results should always start from a
> header that provides a TAP protocol version, followed by a test plan with
> a count of items to be executed.  That pattern should be followed at each
> nesting level.  In the current implementation of the top-most, i.e., test
> suite level, those rules apply only for test suites built into the kernel=
,
> executed and reported on boot.  Results submitted to dmesg from kunit tes=
t
> modules loaded later are missing those top-level headers.
>
> As a consequence, if a kunit test module provides more than one test suit=
e
> then, without the top level test plan, external tools that are parsing
> dmesg for kunit test output are not able to tell how many test suites
> should be expected and whether to continue parsing after complete output
> from the first test suite is collected.
>
> Submit the top-level headers also from the kunit test module notifier
> initialization callback.
>
> [1] https://docs.kernel.org/dev-tools/ktap.html#
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---

Hi!

I think this is a really great idea to improve the KTAP compatibility
for module output. I do agree with Mauro and I wonder if this could be
replaced with using kunit_exec_run_tests. However, if the output of
1..0 for a module with no KUnit tests run is not wanted, I am ok with
this change as is.

LGTM.

Tested-by: Rae Moar <rmoar@google.com>

-Rae

>  lib/kunit/test.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 84e4666555c94..a29ca1acc4d81 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
>  #ifdef CONFIG_MODULES
>  static void kunit_module_init(struct module *mod)
>  {
> +       if (mod->num_kunit_suites > 0) {
> +               pr_info("KTAP version 1\n");
> +               pr_info("1..%d\n", mod->num_kunit_suites);
> +       }
> +
>         __kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites=
);
>  }
>
> --
> 2.41.0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20230731141021.2854827-6-janusz.krzysztofik%40linux.intel.com.
