Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F7FC54E4F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 14:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAF10E959;
	Thu, 22 Feb 2024 14:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0fzx84EN";
	dkim-atps=neutral
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F265E10E80C
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 21:07:03 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-365124888a5so3924245ab.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 13:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708549623; x=1709154423;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AAAZa1jDC6WKP3dR2NzQXLtAyykABKSP5MJcfQiYXKs=;
 b=0fzx84EN1wI7bYOeCYpWkyhupj5YfOuRG8Kr4t0JSJRyaBTYEH+KITJ22ANgVqomGi
 9JAAOUFs66rFBvqxLpYurMG8M1DE+v/nk58EZpuzXW6XEmfCfksfO0k7tNuu8IbhNaFx
 fiBGaxsDIAW9HNDLMoPrWv0DOOHILrvRC0xtu3QoclPiB/tcC36M275z0cu3Ou4oWPE8
 W2saZOf9vDFEYTFw7aO4tkNXtB5ezpLrW0MGtAjbAc66mlv/zPQxyMJks02HhXsutHJD
 isLEQI90ZR0Ak8x5eEu6DH0fG01s1Y5TqhHAK8rtkq2cpa4oyC2IRK51OISRii2GCsCZ
 fOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708549623; x=1709154423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAAZa1jDC6WKP3dR2NzQXLtAyykABKSP5MJcfQiYXKs=;
 b=M2mQwCx+y7lkAciP75A9MMq5o2qDHR9fDTrFVv4jUCEsbnXTmcihE1lcaUxBKdQgs4
 ayX4uAi9G+S9FI2FLv4Mo0Wg0ccTGJsGYoqMJgTHSpEDywxK4l/PCPtFYtC+vBalKJz5
 7ArhyBOf1tfaAW8RNgHtMpBOttpxj49lc8+A4DTVR/v0PKeOtB9ugHNdHY0cntBZk6VT
 iblo105Ca3A6moHe0wjcIMDhQRQeKwA4Cs/keP8km91IxGSfpVFw3y2QFMdi97jpWaeQ
 v+tkvaD0uwMpBiMVkRwnHHqkEbPbrolZMI7z7q0dHbC3TdwPoYsX+4xHwB1CLQQ3oFnp
 Y4CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC8GFzi3e1Ic+kU3W5EcMicpNdfzfRWuIluzikFpXviCw1X64cPKtJ//T4vdXr8pzwnSPEVioINHyRDCe97raT13uw5zdA+iarWQcooJ0=
X-Gm-Message-State: AOJu0YzSXxFGJq6jNda2CpH+TKo0FMkfe9PYrXsxYcCm8jjdE52KzhU2
 nXlA5wfD/gSebvA15ojh/OFwG1yTUJCqS/bNTmGbG1MaFYnE2H/pKdp7BwuHzw==
X-Google-Smtp-Source: AGHT+IGat+ZOlE3TaiF7TUr34C9oDGm5EHv4BN9HXA/+oFvVMsLjUVwjzy0AX0VUmgXwUPrLBRg1OQ==
X-Received: by 2002:a92:d790:0:b0:365:4aa1:8bd5 with SMTP id
 d16-20020a92d790000000b003654aa18bd5mr5504674iln.5.1708549622918; 
 Wed, 21 Feb 2024 13:07:02 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a056e02300600b00363807d5c4esm2799990ilb.13.2024.02.21.13.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:07:02 -0800 (PST)
Date: Wed, 21 Feb 2024 21:06:59 +0000
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
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
Message-ID: <20240221210659.4p6cq4lhmoz3eaqj@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-6-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:18PM +0800, David Gow wrote:
> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
>
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
>
> Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/rtc/lib_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
> index d5caf36c56cd..225c859d6da5 100644
> --- a/drivers/rtc/lib_test.c
> +++ b/drivers/rtc/lib_test.c
> @@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
>
>  		days = div_s64(secs, 86400);
>
> -		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
> +		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
>  			year, month, mday, yday, days
>
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
