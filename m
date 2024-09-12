Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F41FC6184
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057810EDA6;
	Fri, 13 Sep 2024 21:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="rEcYcWkY";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1DF10E96A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 12:50:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so7453705e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726145406; x=1726750206;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFPOQU3GMjuvWQcs4H70Wo/maeGnFNSIqsgef5XY/WE=;
 b=rEcYcWkY334zE0tA7AlQta0Tkf0DAirlQVF7RIMRfDg72q61LMqF3BzrieimAIhK4k
 Q+aTtORwvXve88a8pg1aZVbtqhKRvMftE2o890d8zxqDsbB7lcY7LFm0i7j+dWUBO077
 MHJV8JSLxiKomaWno3mhz4VtXKZei3goTnvCX5H7pl3PYMYMbYzbv3pnjqzbUNoWVWUo
 mocJun/NPsAtHtXgW6+cZWjpL5xW+Sgr6EW3gJbbfsbik0uXKWAjTziPojZ0S4IgLewJ
 UnHnS0V+oCXXHWCKjwJJbbBldtYWv5h9IPBdfidCoSiJEr34+LpuH5v/Nlw3ALvI/reY
 VbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726145406; x=1726750206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFPOQU3GMjuvWQcs4H70Wo/maeGnFNSIqsgef5XY/WE=;
 b=UOjOSBUCHW4EkFn27m0tne63NdZTu3Ub+b8yLxl6YFtJHDn/3xTyd0SU9jZwPmMFjH
 225Cr2CrlxwetcTO3UT1GPuTDrVD0MQc64xANWxD4V0oXwICNJlyDY40Lq22bOMjdpER
 GZ4z7rpsCvVvTawt/qQMIssEHdYYchItsp3i7YkxV2EDo4UlYiy9WqAl0tjwSWOpre3f
 42SiZmA8719vLeHMq1YMQxH7nzFKZVigwFn1+8sWs7LNOoyhTaQ6SU49SstFioxxpQ6f
 AJyTwx4A+F/gOM5W66icLCmB54Ipnzn6pFfj5NCSqqlzBXyO2Gl3+wJSPP0nl2uDg3R9
 18og==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3eGwzdKxQ5ZYBuJTkWRJhB1qWgQMMbGJc4NVrC0vZWPqTFJCCr3wC8WJ7diXC+VtgopLGBfP30w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5DbS73QEFUAMbZrUSXdDIXaCNe3/FmakSAFpO5C2kc/9Z9CEM
 jjy0CruiCyEsxUC9H4xVInVZYDAUtuNRLqO8mM8d2l4CFonW5rs7cpIUfRCvdkE=
X-Google-Smtp-Source: AGHT+IE0mdXYD9UBDthqRnMkDX45dIfhIqhZHWCpb6Dv2rSoMAuL/MFQWuMEruuop+ZMck3cJiPsMw==
X-Received: by 2002:a05:600c:3510:b0:426:6eac:8314 with SMTP id
 5b1f17b1804b1-42cdb4fbcdbmr22565915e9.1.1726145405296; 
 Thu, 12 Sep 2024 05:50:05 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caf016a08sm172076905e9.16.2024.09.12.05.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:50:04 -0700 (PDT)
Message-ID: <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
Date: Thu, 12 Sep 2024 14:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr> <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr> <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
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

On 12/09/2024 14:28, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
>> On 12/09/2024 13:15, Jani Nikula wrote:
>>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
>>>> On 11/09/2024 12:23, Jani Nikula wrote:
>>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
>>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>>>>>> inline functions for W=1 build").
>>>
>>> [snip]
>>>
>>>>> GCC doesn't catch unused static inlines, while Clang does.
>>>>
>>>> It makes no sense to me that adding "inline" would prevent
>>>> GCC from diagnosing the issue... GCC should simply ignore
>>>> the "inline" keyword when definition is not in a header file
>>>> (maybe they don't store "origin").
>>>
>>> Please just read the commit message for the commit I reference above for
>>> details. There's not much more I could say about it.
>>
>> OK, I read 6863f5643dd7.
>>
>> My remark still stands.
>>
>> GCC's decision to not warn for unused static inline functions
>> in source files (not headers) is questionable at best.
> 
> What's the difference between source file and a header after the CPP
> run?

That question is moot, since the source file / header file
convention exists only _before_ the preprocessor runs.

If you meant to ask
"How is the implementation supposed to track the origin",
then I would hand wave and say "internal annotations".

