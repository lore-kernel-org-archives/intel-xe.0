Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7972CC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 23:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD5B10E752;
	Tue, 27 Feb 2024 23:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X2PyoMKf";
	dkim-atps=neutral
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EAD10E959
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 23:32:12 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7c49c979b5dso98702439f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 15:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709076731; x=1709681531;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=80vE8I00zUuMjb98bapG9u6P0XhLZj80ZGaIUfonjH8=;
 b=X2PyoMKfgLhUNztyS4L8quH6/rG7Y+XUtCuNfkKa62qaabVILjJSzhORPSCgK0eKbU
 wADHL2YI7aKe2DFQgNT9cVmo1ftNULMiMvGQUYOULCnSquJBsjH4s0TzeusWdDhw9oWS
 eH+wwsNNr21AhQJRb+e/ng2d8ksBJeqjojhgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709076731; x=1709681531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=80vE8I00zUuMjb98bapG9u6P0XhLZj80ZGaIUfonjH8=;
 b=mKV5ojv0wp5dWcxAeUey++dvnZLTbCfhEgndO4yOcYHgcCtanlz22yWBbcjURUrUhp
 aUBbcBUcRh7rZmgeqlJx6nTcpxDabV7Q/A0Txxt5fNpVJ99EN4dkCRVWR0D/ljTQF/Ff
 xlDWcLV9XAB3NlZBJw7+PVTKrwvx3WYEy8b1UsRaUzb/XqqKaaf2RAbLA/+YMHwZ7v7N
 7/jvO1nD7rWPgYnaYmXRY6S8QSX7PnC5bFNXgEB8KwpEEfzuRmLFLyh/EtPREs+3uu2l
 qyPqzODnRt5vDQy8VKqvDdNMCSrdc7VtO+sfprm2P9rKYvEmMC4Fw6/DRWzwPklQgSvB
 ithg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy4tcqDTJSpY532wrEHbfcFi6TGqfePOdXbVPgWVu71rVQxnW8Od6W2jZZ2JhuscjBwEc+GIBuK2IzVYnfalF5n4u3paxWhQUP+eRFgPE=
X-Gm-Message-State: AOJu0YwNERiQp+oUEyWARycwecbOH2+w+1ANRH6dFJCcwvZlVMOc0iDP
 79kWGteMuHxjjiTo7z2BS0950kK4l6DYTBGkhMzJr2KnYSK/heF0ki4G0BLYsDA=
X-Google-Smtp-Source: AGHT+IG69oUodDQLtj9TB2lWzXOa+NfkxOjVRrZm5njOmm/xNqu/JAHdlHJH3zfk/5jCzDJ8f9tmVg==
X-Received: by 2002:a05:6602:2195:b0:7c7:ce93:f532 with SMTP id
 b21-20020a056602219500b007c7ce93f532mr5798424iob.1.1709076731281; 
 Tue, 27 Feb 2024 15:32:11 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a6bd314000000b007c45ab3dc34sm1998648iob.29.2024.02.27.15.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 15:32:10 -0800 (PST)
Message-ID: <fd438c6c-87a2-4976-aee1-b706212914c4@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
Content-Language: en-US
To: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240221092728.1281499-1-davidgow@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/21/24 02:27, David Gow wrote:
> KUnit has several macros which accept a log message, which can contain
> printf format specifiers. Some of these (the explicit log macros)
> already use the __printf() gcc attribute to ensure the format specifiers
> are valid, but those which could fail the test, and hence used
> __kunit_do_failed_assertion() behind the scenes, did not.
> 
> These include:
> - KUNIT_EXPECT_*_MSG()
> - KUNIT_ASSERT_*_MSG()
> - KUNIT_FAIL()
> 
> This series adds the __printf() attribute, and fixes all of the issues
> uncovered. (Or, at least, all of those I could find with an x86_64
> allyesconfig, and the default KUnit config on a number of other
> architectures. Please test!)
> 
> The issues in question basically take the following forms:
> - int / long / long long confusion: typically a type being updated, but
>    the format string not.
> - Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
>    or pointer differences (technically ptrdiff_t), which would only work
>    on some architectures.
> - Use of integer format specifiers in combination with PTR_ERR(), where
>    %pe would make more sense.
> - Use of empty messages which, whilst technically not incorrect, are not
>    useful and trigger a gcc warning.
> 
> We'd like to get these (or equivalent) in for 6.9 if possible, so please
> do take a look if possible.
> 
> Thanks,
> -- David
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/
> 
> David Gow (9):
>    kunit: test: Log the correct filter string in executor_test
>    lib/cmdline: Fix an invalid format specifier in an assertion msg
>    lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
>    time: test: Fix incorrect format specifier
>    rtc: test: Fix invalid format specifier.
>    net: test: Fix printf format specifier in skb_segment kunit test
>    drm: tests: Fix invalid printf format specifiers in KUnit tests
>    drm/xe/tests: Fix printf format specifiers in xe_migrate test
>    kunit: Annotate _MSG assertion variants with gnu printf specifiers
> 

Applied all patches in this series except to linux-ksefltest kunit
for linux 6.9-rc1

drm: tests: Fix invalid printf format specifiers in KUnit tests

David, as requtested in 7/9 thread, if you can send me patch on
top pf 6.8-rc6, will apply it

7-9 drm: tests: Fix invalid printf format specifiers in KUnit tests

thanks,
-- Shuah


