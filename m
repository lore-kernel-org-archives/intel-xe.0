Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F8FC6172
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7EF10EDA7;
	Fri, 13 Sep 2024 21:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="avRiTdrc";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4EC10EB6A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 12:14:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso8386695e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 05:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726143252; x=1726748052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bORY3HlP0kOQCmx0LKjYAH7NpqjR028coTgUAD9TUQA=;
 b=avRiTdrcqNpS8zTcSOLKtYjBHcXNdnyBJD1EP23r+x61c6V0q13wRw5kVHUqff2oAQ
 u4EWb9+1vlO8k5RXF5zdX1NYiZ8gwrYJYNKYHg7KN7A9WYndfX+qAbYpoj8eXBFgX8Vu
 6IiU910A/+LAeoRKIWvpEWjtq9DiVLvkIGsXN2/w3w+PXuHguNZGoHJfTyq5UabumeXB
 WxDb2ZNGntaeMI2J/WcGsbQsnbhurIK8r9/eBr0KwYpP11PVEPFvI/h3oC5aSI98v/v/
 9P8f4L9MgHasN23MsCpNB0qwwlnQwVfJOM2BtPxcvXp9buPx93c3V3dasyaLvazS/NiV
 BTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726143252; x=1726748052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bORY3HlP0kOQCmx0LKjYAH7NpqjR028coTgUAD9TUQA=;
 b=DDYgoVNmjv3pwcGHnMWLdUBlhOyLzfeukhAiouoN3Wlir9D9aer4FqwEAJmCZ9Qgo9
 PoK5ehvXkXk5VZzOY55VOxa9AFaGzY3GkUMX05p2OWAgdWvrtJ7l2cWSPhHRAdLoFNXq
 BjTHZnNJVnFynwa7V+MCVxOkxnXwZ2fBhZ/9rpELYMnL/5f/sq2cm1Cd7z7ogiUt+emG
 ZibSeqJJ6xnNZc1rdjIt+a2mshFuSfKkJadpY4wll4hR86oxlxrYu4OaKcukiJdJzNtV
 ratRQaUQJJtyaeThg9SSLFovzMLL6GCaJou+THDuRG894GTls3NtGdv63gVn3IsSRGz/
 h+qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY+d9u9rPnypAkNEIOIGb4QQ+cPy/i/JwukP1uZU56ZZs0HOwNYVa1MO54QPar22do6eVRHKCjXw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuny/HCG05faaXF3oeAqz6hs0V86E4fKzU2IuylvugcyFFPaan
 vLEt+lYJeshq9N5fsYH1nkRditAYs16fmjuEh3/dZmNmejoqWlP9iN87mTNuYVI=
X-Google-Smtp-Source: AGHT+IHEBljsXZHgMq2X1DZ+waGkIVs7/2emM2n8fTffmGwuJ7pI0ZvONKQFZiDu5gqGP2V4v0tYJw==
X-Received: by 2002:adf:f3ce:0:b0:374:c621:62a6 with SMTP id
 ffacd0b85a97d-378c2d5b297mr1483853f8f.47.1726143251095; 
 Thu, 12 Sep 2024 05:14:11 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb2a08a1dsm152643165e9.1.2024.09.12.05.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:14:10 -0700 (PDT)
Message-ID: <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
Date: Thu, 12 Sep 2024 14:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr> <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr> <87ed5pgm2i.fsf@intel.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87ed5pgm2i.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 13 Sep 2024 21:02:14 +0000
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

On 12/09/2024 13:15, Jani Nikula wrote:
> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>> On 11/09/2024 12:23, Jani Nikula wrote:
>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>>>> inline functions for W=1 build").
> 
> [snip]
> 
>>> GCC doesn't catch unused static inlines, while Clang does.
>>
>> It makes no sense to me that adding "inline" would prevent
>> GCC from diagnosing the issue... GCC should simply ignore
>> the "inline" keyword when definition is not in a header file
>> (maybe they don't store "origin").
> 
> Please just read the commit message for the commit I reference above for
> details. There's not much more I could say about it.

OK, I read 6863f5643dd7.

My remark still stands.

GCC's decision to not warn for unused static inline functions
in source files (not headers) is questionable at best.

(For the record, I think clang is the devil's spawn.)

Regards

