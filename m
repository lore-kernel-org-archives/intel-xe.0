Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A9AC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 20:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4832210EA82;
	Thu, 22 Feb 2024 20:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ukk/Gg6u";
	dkim-atps=neutral
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC210EA8A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 20:59:07 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-42e2507c6e1so82301cf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708635546; x=1709240346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
 b=ukk/Gg6uNVqNsmOWXogD8S2wq1BP/6Okxs0rBJvOsUkDAo/w0HfkJ9KypDiC5AJAzg
 Sn0zFckCDvaEpZm3goHaDNQrgMRrmlnQBtne1xQmbw+QI+pBc1LwLXKB3EAJivuDXtMD
 yXSy3PgH4TECu503IhaZM9/2DBY+wTNVBlLjl1lKlR6HRgM8OlakIzBXWffox6D9dBXT
 Sf7+jTczkKeGrS5Sn7TI3KT4DZjkhC99bEqscQ3m2G4NGcpAEntIJQoTNpyq550KQl+m
 YRayHyTHKJFJLSnq9mEcZAznwaIplRnTRtF6Bgvz/6E62WXS7HZQFkKrcDT6G1AvwrHy
 OiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708635546; x=1709240346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
 b=uA5bE8X5RZGxRT4QscVvM8DvsDzMmgLGwS9mMfgJsKpdlh856f70TW/cGKqXusj/7c
 1dKecNgeIj8tgpBgt4hV8MzOZfldmH/VohAVfXiHbod/0JcB8Sq2hQAnSsNcNlcvGgu2
 FZyUUw3MsaFdDYjM6rMwyWFhzljujP3a6xOCfH9ZmdKU6r4kKvN3j+JkPbapjnyMesjT
 /xq8PL8HZKUnspzVHLN15diDRAjtWWZD6Wd++wq9ZQsLYriu42A+tPUSeOcl7T9t+nwU
 Zj/L/VNef5M62ZdCt1/kAdGCXRu6TD6nmMbYrxAWa4ITyYBbH9Gmuwk45qlkumL8p+MW
 XfGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0QbEY2CoTLLf2TuVRVW4OYR1Zezdp6nvop/K2hIxkFOfg9uRfs2hFggfAL0jN2Dbzs7UydRVkDvLjnZ3c0a+1R8dE8wfUSEzAL/mBk4=
X-Gm-Message-State: AOJu0YzUjwkDXTapAVy/MFC3jaBTiyeD57HY6YFoUOjDt0Vc7KIJHN2Q
 flvqUQHQkCvW+3b4pE5tsY6+R22fHM3LB+vYwxhO7Dwvhb1UKQ1acUmzoR1uyZFDx6oxK2jUltB
 gbOCxaNpqmNqis+CVq/8/JieVGx2DOU+dmnj6
X-Google-Smtp-Source: AGHT+IFSpfaLdIKihK3iEVOja+3Eqku3dKQtV6o3yrUl8zcXbBHUkfm22S3h1VkUJApYDgRUGbJE0TXcXoTj3FcGfX4=
X-Received: by 2002:ac8:7643:0:b0:42e:1260:c4e6 with SMTP id
 i3-20020ac87643000000b0042e1260c4e6mr732606qtr.10.1708635546371; Thu, 22 Feb
 2024 12:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 22 Feb 2024 15:58:54 -0500
Message-ID: <CA+GJov6GyU0t0D5quhroCgEQOJgk0PCjVn5LROifBcNMx-ovcQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Wed, Feb 21, 2024 at 4:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.
>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Hello!

This change looks good to me. Thanks for fixing this mistake.

Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>

> ---
>  lib/kunit/executor_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index 22d4ee86dbed..3f7f967e3688 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test=
)
>                         GFP_KERNEL);
>         for (j =3D 0; j < filter_count; j++) {
>                 parsed_filters[j] =3D kunit_next_attr_filter(&filter, &er=
r);
> -               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 '%s'", filters[j]);
> +               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 from '%s'", filters);
>         }
>
>         KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]=
), "speed");
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
