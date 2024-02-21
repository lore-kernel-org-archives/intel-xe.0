Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E3C54798
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07A10E94B;
	Thu, 22 Feb 2024 14:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WnpOXxYg";
	dkim-atps=neutral
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF40910E381
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 21:05:38 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7c403dbf3adso366424439f.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 13:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708549538; x=1709154338;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ejwz9DMghoUipFK/izgowqt2tzkszOXlq4euAJSl++o=;
 b=WnpOXxYgZIjEbz1nt2xyJvKO5/5rW5gPAsIbZEbMaGID/fnjVr++ppkMVslA7jGn3I
 6Sj6Nr0Ps5sxo7Mz2qHxZUUj0PKdP/CyVVSL8TqFvzOF9W3S8NDEBWk9yteGEi0/h62K
 FV5Ss6JZMJ5B053andzxX49m1NXbW9I9Y1rJJaxRybRL60jSl6vy1yjC7X6YP0x7FRpr
 +Er+fMhqL6WBqlYyrcRXfCpWb+0/vVO5dO46V9mLOVqiW1/f7jruw2xbMU9ZZcganScv
 5JWGMkwVq+ok+Dda8gbxfO1W/v3knId7vgxuoDERy8GOnPJY8fsr/w+PwbSE/g8OjJ7u
 A9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708549538; x=1709154338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejwz9DMghoUipFK/izgowqt2tzkszOXlq4euAJSl++o=;
 b=LmYlJoHCvXbh5THsYPFMFeC3rIhHuW30KTuxCP08S+qYe+rLQhL8gbLGgC03kFDZp/
 U9AfE3TA9Dj0gQESg9RqqVAUDjdN0aeHqJAhGYgJ46kL/x8Gyq1Zl5u32jxSdiTTDGSQ
 7goTFwcraUWxCi1c1wEFjp5gPY3BVJ5CNjqOiN9AURau9Q1EJXKlbV4cn5qqYh+iblet
 XgLsImaKcHq7ID4Gact6cIp6BWHgwt5aq5/baYzl9UMNH4/TtFq7lpUZHHh2E9nIVFLS
 jV1RME92ETz8PnYYNufT1mbsub/YRDtRmTZeh3U/XjDlJ7ETL9tHkTRStz2uyNVFDmoD
 p6Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVWOdQfTfeywaUs9tsTjzJeV+EJtP6pB/sH6uxTMBnrWWTxjbQHPovFEORA2rcM3NEqBL5NIdvnLDUkKolEZTUp2MOR/CoFKa92Pp95/U=
X-Gm-Message-State: AOJu0YxkCavRu2SSHfpwsBMnCAw4RsdQDz7M+YSuhd4M2zsGcI8Y+Zkc
 MGiKM7xfqwpZXjMy4qCXz6brfMe0mfDunzN9ERc3/bBShtmi3055gjBk7M5DcQ==
X-Google-Smtp-Source: AGHT+IF90W1Cze/ZueVDeQCQxFZFa2LEc1oALZbJJ3gj2A8f8YyrfflqUcFHEtIHU8VbMgtFIajcYg==
X-Received: by 2002:a5d:9f41:0:b0:7c4:3ffa:25e9 with SMTP id
 u1-20020a5d9f41000000b007c43ffa25e9mr20859695iot.1.1708549537828; 
 Wed, 21 Feb 2024 13:05:37 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 q1-20020a6bf201000000b007c744e62df3sm2177661ioh.34.2024.02.21.13.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:05:36 -0800 (PST)
Date: Wed, 21 Feb 2024 21:05:34 +0000
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
Subject: Re: [PATCH 3/9] lib: memcpy_kunit: Fix an invalid format specifier
 in an assertion msg
Message-ID: <20240221210534.eeodh3qxopgp3dhy@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-4-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-4-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:16PM +0800, David Gow wrote:
> The 'i' passed as an assertion message is a size_t, so should use '%zu',
> not '%d'.
>
> This was found by annotating the _MSG() variants of KUnit's assertions
> to let gcc validate the format strings.
>
> Fixes: bb95ebbe89a7 ("lib: Introduce CONFIG_MEMCPY_KUNIT_TEST")
> Signed-off-by: David Gow <davidgow@google.com>
> ---

Reviewed-by: Justin Stitt <justinstitt@google.com>
>  lib/memcpy_kunit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
> index 440aee705ccc..30e00ef0bf2e 100644
> --- a/lib/memcpy_kunit.c
> +++ b/lib/memcpy_kunit.c
> @@ -32,7 +32,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
>  	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
>  		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
> -			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
> +			"line %d: '%s' not initialized to 0x%02x @ %zu (saw 0x%02x)\n", \
>  			__LINE__, #instance, v, i, instance.data[i]);	\
>  	}	\
>  } while (0)
> @@ -41,7 +41,7 @@ struct some_bytes {
>  	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
>  	for (size_t i = 0; i < sizeof(one); i++) {	\
>  		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
> -			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
> +			"line %d: %s.data[%zu] (0x%02x) != %s.data[%zu] (0x%02x)\n", \
>  			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
>  	}	\
>  	kunit_info(test, "ok: " TEST_OP "() " name "\n");	\
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
