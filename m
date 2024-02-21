Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDFDC54E42
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A5D10E953;
	Thu, 22 Feb 2024 14:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cmSN1dEW";
	dkim-atps=neutral
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941EF10E7D6
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:04:25 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso370077139f.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708545865; x=1709150665;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HUxWnozNASldM6mLZUsm3giXihd3A7IaClJa0LXBxNU=;
 b=cmSN1dEWljwoycsZzXbXhVOZm+7ocrzx2YV6doAUdf6/VMahGJYb86Jn9K39JoCxNJ
 45n+8PE1OGA+P/c56DdqgPfvcI+4C4dLJtStz3vA35UwboAmGpAPnh1hsATycCfHBO8Y
 1+5shpqNN1s4nPK6IU1zKjDy+F44aN+/tCqtyaGpgcT2kWisgbsDDDK6Dg1B319QR0AM
 SCgeHRVLQNKek6vi6IMIiJJWl0bkLvkYG6zshZ5bglA+kCmjA7jwibQsRtO9ciGOLqtQ
 f3DQm2ao8T6Dsnuz4hwMGmIp6Oc4bHt0ykLJ8MsVcRNesLKQJjloVp7Yv2ZxQAnWFvfp
 2Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708545865; x=1709150665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUxWnozNASldM6mLZUsm3giXihd3A7IaClJa0LXBxNU=;
 b=Wuj24khBf52hSeTdiBzmQYbNrOJRWpoVUJPkBQIH7IWZVHhRcw/MoR/HsRVTWCwxnb
 cKbUs2bNuqOpwusOWHbSaFIG39XDLJ5jQ+tf3Yb6QFafg/VBbgV/KXL9l0JPhIVd5hoY
 GlMIgtLjD4ZSmDxsdYoyAEcsoNhxscI0XNXNUJ1MnJHNtGpNZjqHX9pdfDWP9eJ0abHI
 q1Y+XaYL/5gINO3QeURc2Y1+2MUuGEmFwR1xCq3G/TaZmOGdfIsYk5rUozCl12ocLBjI
 KkjPPtRksMdNBen0xoPUq7K2msjCqEbQGgHv94GKl+hpEJwRULfrOSfleIzRoQJOxsIs
 HTOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsJMShG8wDEDe6r5mnY6T5kicuOMDgXaf47eP6BVtOjjfCrtxm/Hk3wsA9iwN5liZq9c9oDVJExWpaWwJC7ynUcPyMnyl2bUBi3LP4ns=
X-Gm-Message-State: AOJu0Yzuon1lzf8go2dDgHoo9414sRzUoYUcVJjp/ptyqEferUbIy4aw
 qQsoKucZEQGeeWZA1JwMzgJ53iQ3kf+5f+TspxlCdoKGo+LsEYbGe5L0kiWRBQ==
X-Google-Smtp-Source: AGHT+IERZJoWhG4EWPF6TTNxmVzRySC9KGEbeq7lW206WSkBdenSx9MWqz5eGYR8XIoLVoQASwKcyw==
X-Received: by 2002:a5d:9b10:0:b0:7c7:6e49:2208 with SMTP id
 y16-20020a5d9b10000000b007c76e492208mr4170773ion.13.1708545864703; 
 Wed, 21 Feb 2024 12:04:24 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 dl5-20020a056638278500b004742837424fsm1881404jab.53.2024.02.21.12.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 12:04:23 -0800 (PST)
Date: Wed, 21 Feb 2024 20:04:21 +0000
From: Justin Stitt <justinstitt@google.com>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
Message-ID: <20240221200421.us26bqteeihiwiwu@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
X-Mailman-Approved-At: Thu, 22 Feb 2024 14:01:23 +0000
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

Hi,

On Wed, Feb 21, 2024 at 05:27:14PM +0800, David Gow wrote:
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.
>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  lib/kunit/executor_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index 22d4ee86dbed..3f7f967e3688 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test)
>  			GFP_KERNEL);
>  	for (j = 0; j < filter_count; j++) {
>  		parsed_filters[j] = kunit_next_attr_filter(&filter, &err);
> -		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter '%s'", filters[j]);
> +		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter from '%s'", filters);
>  	}
>
>  	KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]), "speed");
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
