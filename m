Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4490C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 23:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2483B10E752;
	Tue, 27 Feb 2024 23:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bi1OtN8I";
	dkim-atps=neutral
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416EE10E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 23:25:01 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-365b413549eso910225ab.1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709076300; x=1709681100;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
 b=Bi1OtN8INlkdVTSjEjQdkc8psGelgn6Zmfr+wfYMQTn5zA99aVdfFv03Tqu05U/5Qc
 TuAES6c+svcNPVUfvlWDuzsQntnCaq9NkqNq9/9GET1WYhtSKQy7WLhveeWmJWugxqsI
 o5tMW8VEsbv05uoA6e4NSOw7AcHZhfl6EvtzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709076300; x=1709681100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvIY3k15tE0HcJm4Yzmaclwism7ZYGDgLaZ5F1IOoes=;
 b=sin+m0Xb3hohx50+ZBN6vUg5AVSHtLnDY07Q1h/sAj/d+h3Ny4ayl+8WQiySpqgmg/
 9FMMBny3OaC80fp+KkxtaAk4E785X+T6B+zZlRlahXy4PjTOjVaba8etmkHgvuq/vC02
 QyWIp7brZ/X9EDYmVYnGzVwI/bIskmwoSJGRfpmJmqkQiIsItRMRg88+c9iXRuDj+xJL
 yriTvCz9DxUrBi1pntZmzOsI4utn35U8id2Mw2DTUMKUu51QPlAMDuzbahgkfToE/P4L
 X+OPdMc03HvBOWaYv9WlbuSUn6H+iyBviggj6vwVIupP45lzyvkzlfiuayAOH9oGFbvd
 MuRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjF8xpiJYxhEw80sqhjj+juF/qnLJhWWuGE7BJxhhkKROnDUrmpVU4Q1y+v+mGab7Aiv4tQUgyrWKNx2tSGzspSpzVQkbJsj0DAEwUgLM=
X-Gm-Message-State: AOJu0YwrKhdWXoGeND7xBm3i6qlc/Yqvmr8oKdQ1eSue/FSd25rT9l2F
 nF8eBkeh+37+iZl5g7+/uuqjZQTEQNkaZvM9D9nKryAM/DE14dSGb07DSa0ifQ4=
X-Google-Smtp-Source: AGHT+IH7h7vSS9kJq/Hsu1hvzmsVL1Hoh2ZLb1ktpG8OlizpzOEJEClNfjMsljDl+J9cw2Cp6ZyxBA==
X-Received: by 2002:a05:6602:38d:b0:7c7:8933:2fec with SMTP id
 f13-20020a056602038d00b007c789332fecmr10945119iov.2.1709076300126; 
 Tue, 27 Feb 2024 15:25:00 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a02cf0a000000b004743021012asm1964451jar.2.2024.02.27.15.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 15:24:59 -0800 (PST)
Message-ID: <ba023321-dd6e-4163-8924-092c87aa17fc@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Content-Language: en-US
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Justin Stitt <justinstitt@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
 <20240221212952.bqw4rdz2i2yf3now@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221212952.bqw4rdz2i2yf3now@google.com>
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

On 2/21/24 14:29, Justin Stitt wrote:
> Hi,
> 
> On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
>> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
>> which was then updated to be an 'unsigned long' to avoid 64-bit
>> multiplication division helpers.
>>
>> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
>> '%d' or '%llu' format specifiers, the former of which is always wrong,
>> and the latter is no longer correct now that ps is no longer a u64. Fix
>> these to all use '%lu'.
>>
>> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
>> message. gcc warns if a printf format string is empty (apparently), so
> 
> clang does too; under -Wformat-zero-length
> 
>> give these some more detailed error messages, which should be more
>> useful anyway.
>>
>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
>> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
>> Signed-off-by: David Gow <davidgow@google.com>
> 
> Reviewed-by: Justin Stitt <justinstitt@google.com>

David,

Please send this on top of Linux 6.9-rc6 - this one doesn't
apply as is due to conflict between this one and fca7526b7d89

I think if we can fix this here - we won't problems during pull
request merge.

thanks,
-- Shuah


