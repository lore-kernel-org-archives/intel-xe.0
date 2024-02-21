Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A72C54788
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61B10E94C;
	Thu, 22 Feb 2024 14:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="j36+iw98";
	dkim-atps=neutral
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB1610E7EB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 20:10:12 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c454e7ed25so5185139f.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708546212; x=1709151012;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M5Z0SZna9UOg1Ona+bZVgLrYz4/0TkaS32NjeJUhFJg=;
 b=j36+iw98hzcgFSX6SUib1RQBRPLgVhedvNa0Wy00g0sJk6Y82qOuvBNeJUyX+9d+E/
 dLSajVEuMNPjvwjVZF80oHC8wae7fbQzVzbtcYO5MNjUMGqs6yXMRB/1nSRgzdRgLOz6
 nZfFdpoAumugE4R4XrGo1kQxYaazlUxlYPKFz/+r+iTn2joBlhori8oBXqttEgUJoCQm
 pVrpxcfhLsDdM2XluFzTLPUSI6KolGq7vyBbcUYXYdJgkR31vl5nY2ow5vgbIH8b+Kou
 kBnbJn4UM95KYyR9T+Uzir4MMbx49i8W7tmRahyRoqAYN4df7jyW5mYyOpXa795sXnbE
 7bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708546212; x=1709151012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5Z0SZna9UOg1Ona+bZVgLrYz4/0TkaS32NjeJUhFJg=;
 b=Xv93VaVg7xjer8dLymzYi4DdzK2h6Xhn6PJB8Nruit6iOo/jUvWWgM8Wh/puH9NA34
 ENVo79BXQ6eu7q4M/W43Uido1Cep3sBPdTLrbZCww31jo0Ug7EjIE4XuGbZwZfvQVRRx
 XHNRzZkSjxhz/z3XCNpbDvamtapyjC0LvhiYUbkqKc4xvC0+WD54YlTZPhWHre4b3WGz
 68Q2d2+OvAGGdGeXFGdzFe4axuHjhrI7JsS79VPl/Rx+XtFp6JOmi9PBKHtEbt+EudHG
 y25+BxCxioI0Th2+WsST61dUpn3OZLPxuUZqaW/zghiZJBun/NcIFCUHUjBB89xYEIwi
 wjWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kgBS2j+u0YdZT7zO55Ysfxw5Q/3vKMg4+Lzzud24xknaG97QyvCAALfPr/o0sYSpWGs529o5ws/dTCRscAIWuIOM+1QyUUYgKGoqP9o=
X-Gm-Message-State: AOJu0Yxh+NOWeVzdRIXF4XYNS1QXLN7cVgpmX0e5S/b9/c/JRmb/kcVr
 9kFWcCme2a8RakKIuMe/CxJr+TzWYXHKQa3KGkpZmYTDylw2R18ORTtABIo5AQ==
X-Google-Smtp-Source: AGHT+IH9AMuXPl3EZJ7hQlp6VCclDdr80TZvmeM7CdT+Wyei5omqYzpG9JNSpVS4vNSKPPCjP6+45g==
X-Received: by 2002:a05:6e02:1a0e:b0:365:249c:690 with SMTP id
 s14-20020a056e021a0e00b00365249c0690mr505292ild.9.1708546212041; 
 Wed, 21 Feb 2024 12:10:12 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 t18-20020a028792000000b004715e8aaea2sm2842840jai.102.2024.02.21.12.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 12:10:11 -0800 (PST)
Date: Wed, 21 Feb 2024 20:10:08 +0000
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
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
Message-ID: <20240221201008.ez5tu7xvkedtln3o@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-3-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-3-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:15PM +0800, David Gow wrote:
> The correct format specifier for p - n (both p and n are pointers) is
> %td, as the type should be ptrdiff_t.

I think %tu is better. d specifies a signed type. I don't doubt that the
warning is fixed but I think %tu represents the type semantics here.

>
> This was discovered by annotating KUnit assertion macros with gcc's
> printf specifier, but note that gcc incorrectly suggested a %d or %ld
> specifier (depending on the pointer size of the architecture being
> built).
>
> Fixes: 0ea09083116d ("lib/cmdline: Allow get_options() to take 0 to validate the input")
> Signed-off-by: David Gow <davidgow@google.com>


> ---
>  lib/cmdline_kunit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
> index d4572dbc9145..705b82736be0 100644
> --- a/lib/cmdline_kunit.c
> +++ b/lib/cmdline_kunit.c
> @@ -124,7 +124,7 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
>  			    n, e[0], r[0]);
>
>  	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> -	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %u out of bound", n, p - r);
> +	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %td out of bound", n, p - r);
>  }
>
>  static void cmdline_test_range(struct kunit *test)
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
