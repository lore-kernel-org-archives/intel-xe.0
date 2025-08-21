Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D95CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 20:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F3010E298;
	Thu, 21 Aug 2025 20:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0DSVqN+V";
	dkim-atps=neutral
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F031910E298
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 20:17:25 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-70a928ad710so11895606d6.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755807445; x=1756412245;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GKHhIYUvXm1eR7uJDOLbFAeZmD/aNr9e42yLSZS5GE=;
 b=0DSVqN+VVEJ8kqAZTyMkMrjGnEFdelVOOuz1m55b1LD2xZs9oKR8jJ9Kn7+IfFnzMG
 CB+ZtgyNDxBdtLzfxX6o14GAD2J5ixtkOmMG1c+GXuFw/vVo6ho0cHf9jVfQ3YCUayvd
 UiY6wL/qhYoBiXHlNf//YAH9TLM2NAKQrZmtyibDzJfyKOYf6Xv4wf/LMoY7Ilm1s/ka
 p3h0IO/4Q+CNW0OmOo63zF+u1nDydi3n1fIMNd+f3Hqma8i5i1qi1NBTshZNeuK33mG6
 01G43yNjzUwZwj5Htt+tHUO0D0rEWiOzZCopbMa2tdE4ffv5RHaG+fOBuZg/CkEDrCiX
 EgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755807445; x=1756412245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GKHhIYUvXm1eR7uJDOLbFAeZmD/aNr9e42yLSZS5GE=;
 b=BzypJB65UoVNETZxRnBmqpr/S7KyWnct/oe4JwPAdUG5/NOiCUiL0KsMYrkpkqbjJF
 eOn76mijXyW1Zh8iWBO3kgqE5klmRhQVra23LoRysPHMtmvs4z7Yx16M/PwRrARuAGgc
 ChOSEaTGcW5p+ZsmziBX2jzJOHa3jeRYNIkXru9CzKfT89wu8tf9KvRcD7kiru8rz3Jz
 KzEeTLrRar5fFHtKnMQ1t35SZWVHXD40ObN1kIZ69NM5AlbO9WvkzzxCXSYhBcFQY6Cz
 OgxOR10EwAa0fvV92DgEAyovHQ6N+RaUC7Hl4UmwxGC6rgUq4hjL8fyGhegBLk48plc6
 wSwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXck0b/8m97Df0ukK0hiZkWvZdoO16C0GUDTNfw/jDmtAwq6SQ6YF5tPPL18+4UnAPV6BRLdrYvCw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylidyxwroMB4XWwttrRPJ+elGPXDFz5rRo91xFhztPENRHNfdk
 z+nk/Dg5H5cjZCZSS08u4/65Akc3PgbUwSOdLPel6NHJGv+sKKQjo8MaTKbf8EEj4Mq3E814eeQ
 5tGx0dEug/44f3eF4GXjA7OpXs0UiykxwWp3DAsOU
X-Gm-Gg: ASbGncuE8i+ScrzZ1uuKSH1RPMwmpHGGN1EkHTyTM1ingUh4/GNFhhcPZfAtQShwIhh
 m0SjzHPLaceXC4iqQ7n/OhaG0Thl2osHXSm/MeM7OZl6dpvXL5O9ifcGiL7+urKMi+7E8BKjqkJ
 bUjLNtTePGlEpAOcLdge8+ey9cEzo98WMrs6UTxkTp2zOEliloR0lALgMGNokdOO0xZY+3KPSZ8
 tQr5mgERtnamFlA6AbjaA==
X-Google-Smtp-Source: AGHT+IGN0/BKeoJadYh8tmDP+tf3R8FRAkNUVR/N8DJ2awKLzORsivwfWeWkC8Id+Bb5jHCi6rQ5iDwDGbl3EhLh2sY=
X-Received: by 2002:a05:6214:76b:b0:70a:3792:71b3 with SMTP id
 6a1803df08f44-70d971f6148mr10899826d6.8.1755807444690; Thu, 21 Aug 2025
 13:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250821135447.1618942-1-davidgow@google.com>
 <20250821135447.1618942-2-davidgow@google.com>
In-Reply-To: <20250821135447.1618942-2-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 21 Aug 2025 15:17:13 -0500
X-Gm-Features: Ac12FXypXIH5pWAL85l1vEigtMRAVThNuoz79IEYMnKkvcTSXQyQlGmdixyUb9I
Message-ID: <CA+GJov7kyZLFccSyJ9VON_GpE2kvgF9jav8FP7d94amHQQkDmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kunit: Only output a test plan if we're using
 kunit_array_gen_params
To: David Gow <davidgow@google.com>
Cc: Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Aug 21, 2025 at 8:54=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> In 6a2a027e254b ("kunit: Enable direct registration of parameter arrays t=
o a KUnit test"),
> we now output a test plan for parameterised tests which use parameter
> arrays. This uses the size of the array (via the ARRAY_SIZE macro) to
> determine the number of subtests, which otherwise was indeterminate.
>
> However some tests (particularly xe_pci.check_platform_gt_count) use
> their own gen_params function which further filters the array, resulting
> in the test plan being inaccurate (and hence kunit.py failing).
>
> For now, only print the test plan line if the gen_params function is the
> provided kunit_array_gen_params. Unfortunately, this catches a lot of
> tests which would work, but at least makes sure we don't regress
> anything until we can rework how some of these macros function.
>
> Fixes: 6a2a027e254b ("kunit: Enable direct registration of parameter arra=
ys to a KUnit test")
> Signed-off-by: David Gow <davidgow@google.com>


Hello!

This makes sense to me. Maybe we can work on this feature in the future. Th=
anks!

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>
> No changes since v1:
> https://lore.kernel.org/linux-kselftest/20250819073434.1411114-2-davidgow=
@google.com/
>
> (The change was in patch 1.)
>
> ---
>  lib/kunit/test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index b661407ad0a3..bb66ea1a3eac 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -732,10 +732,12 @@ int kunit_run_tests(struct kunit_suite *suite)
>                                   "KTAP version 1\n");
>                         kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT =
KUNIT_SUBTEST_INDENT
>                                   "# Subtest: %s", test_case->name);
> -                       if (test.params_array.params)
> +                       if (test.params_array.params &&
> +                           test_case->generate_params =3D=3D kunit_array=
_gen_params) {
>                                 kunit_log(KERN_INFO, &test, KUNIT_SUBTEST=
_INDENT
>                                           KUNIT_SUBTEST_INDENT "1..%zd\n"=
,
>                                           test.params_array.num_params);
> +                       }
>
>                         while (curr_param) {
>                                 struct kunit param_test =3D {
> --
> 2.51.0.rc2.233.g662b1ed5c5-goog
>
