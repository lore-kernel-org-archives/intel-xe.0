Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AD1C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 20:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5110E339;
	Wed, 21 Feb 2024 20:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="w6Cd/P1a";
	dkim-atps=neutral
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C18210E339
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:36:52 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3650be5157fso1105ab.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708547811; x=1709152611;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
 b=w6Cd/P1a7eAns9UWdW50BIqHRQ6JuRSOUGvQkNSBdGCAY4TIqAWZtyEAkd2SJ6gc+1
 3TzxfOJdM5FWlf6acIGxCLjfVWuSFFoTL/Ime1uyj7cojhdhaRfyLIS30K/MxPj/eyL8
 n1nIRVSxAkp3+7/Cfk12VqNuTLit9YAFi9A4btKnj7lWe2ilJMM5qeD5Q5ZtTHDX5ldH
 yf4PaPvwXMiKSbAuX8K6iShVAPExivE2QYm6HYkdN9TLYpVvDVT5eQPe/RwAV1iEy0em
 mQCb7czPOFicXiweLp/WVpLyRfhoa3uNjaa/p8ssVXN1YRVklwjDM5cg1gmwREo6+pLf
 uQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547811; x=1709152611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
 b=X4zKwO2dNT653Pa49lEVVNh3eJhaezBlw12Y2Ddq+gMQcfrH047MKbNX9TRvQurnyK
 W53w0iRV7qLcxsZaodHxgupe6WWXZ1qkgZ4HRl8mcMHG9gke/rHpcvQmqrJ4tMBgNHm2
 pKL9vfKAuEKPkE9dnnamdLgnJ+guwWV4o1468mg9e4pqLsa5dgIA2covMuVqJB+hPR4e
 ffarxsbgY4oDxh2bX4iObH4ZjmRqAIJ4BcG8rFsasYe8ZDLePf9L7HSLladnSA0MYhDf
 yATzODCCnfxLwsVIMKh8++FgqAom3cNI3Fy1CK9LQtGhrneHpf5vtWXTiPj3GQnT7x/H
 x69A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr30PxR9sGvNWtk5O96/dcAjXFPbYCQbkOev3gL834qv/jgS55/koBxFEcPjJFSsI+S/TAbIASN+jgvFIcLV+zXIhAgAhdegOqQ097/vo=
X-Gm-Message-State: AOJu0Yw3I9laoI5m0LPDF0sWWkwlkxsjVq2HZ5T0JpqkCN5dfOpfIcm3
 v2kPyLtItwopkopsYWXsbVfP+2IUhj0MjX2H+1UwW+epmUuTEFIsFDwKpZBQhDgVtzX+XLUiTF2
 wYD2MZO4JLUl0QvkbP7RyvKtSbOJgWmRkfvPJX9U3nwHgR/Hqdw==
X-Google-Smtp-Source: AGHT+IHkUH8682wBjX2MlXCiKDKRKTZ78A7IDkSZwKh62FAeHimOB2zWqCHjoUmuvZXD72aiFX0+O0WGwp10g7NziwQ=
X-Received: by 2002:ac8:4907:0:b0:42e:660:eb8d with SMTP id
 e7-20020ac84907000000b0042e0660eb8dmr285459qtq.5.1708547393077; Wed, 21 Feb
 2024 12:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 21 Feb 2024 12:29:38 -0800
Message-ID: <CAGS_qxpyNVqigHB+kS-1xqzR4BAOQXoMSNS+d5khkLYrkpmOgA@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
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

On Wed, Feb 21, 2024 at 1:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.

Note: it's worse than that, afaict.

It's printing from a random bit of memory.
I was curious about this, so I found under UML, the string I got was
always "efault)" if I make it fail for j=3D0.

>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

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

note: if there is a v2, it might be nice to include `j` in the message.
