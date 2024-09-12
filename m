Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7948FC6182
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945A510EDA8;
	Fri, 13 Sep 2024 21:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="GYnPQS/V";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3A110E8A9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 10:56:07 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so6462915e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1726138566; x=1726743366;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nt9opV20XXsOa5z/RzMwdzRNoh6hR/E6GTyAUXLI6Is=;
 b=GYnPQS/V5PSvitV3+TJ99AI9CBqKMeRDHsRwjGsS9YTAv0/iUoHjM8cy+Uf4puYcid
 z4E+yT79sReHbXkFs9/EsmBN0TpKIof6vbKjkhgrEy01ZDFRsktDY4MotAMEvfoLzuzu
 dYBZS0+66KWLm4XQ7j1njQ3C0xJlMD5F0fFhxBXPWqJ52ONk3JxJjCW6T+fvwLSxUbzg
 GiE90JPbYkY5A6foTB/fu35Ig/TD+Zha8eIQdjMtsLsfVEsUVa8BOQS1m/Lxv62mJON3
 N8GbRTXvNv5Ds8I2Q/lZS717QP96o9ZKFP/VYO4+Ur2uESkg71cp1ehwA1Hc8uXTmeAc
 q8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726138566; x=1726743366;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nt9opV20XXsOa5z/RzMwdzRNoh6hR/E6GTyAUXLI6Is=;
 b=HB0j/qT3lxTMhQ/iKifCxSmYZ3Mmm2qa0a2sA+gcWwe3CiUsxFmEOxAdsqWQedDuxz
 MvPwYBiBpEn2jChVdfFQvTqsL7AK3dlhI78sGySVIfYmZSU+MBrKjG2D1AeuwL+YF0Y4
 ji/hM+NOHfKH9Hzz80DXiI8C4mIK+y/xJToXoDxx1a0E39dgW0LCMceKduA+NjrbudkE
 6I5nPpXeAY8igpqyE0xaMdoeTVpuCeGFRicgQopDwgB+1ms5Xv8sblLayMtIdXhJPkSH
 k66TC/jIocysJMMAeX+90hZLKxdu/PIY1IUsQ0monRxytjslgPvoPZdadguR1TmSx86f
 7oqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPzfYTHu8eKIohYtHqsYwLCdFdE6w9Q0YpVoJZn1w+qd4NczgkL8/mRtcA8rl2NUxLgOS0NdEumw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2ew6t/Drg/CDOSCr3wCFyAcv0vufCuQnWoQ2NQuMtu16VS8nh
 9DR1PDzT3BHLIaWDGfAPR5U9+WnQq02pPLt3Vf7q+MzOvYeBv1UTUEZTNV/Rge4=
X-Google-Smtp-Source: AGHT+IE9+wQX/1J2KsVADvG1QVUpPXoig/hsO7v0VZ7xjkRspuEnpc2g7y3vNOnUaSl7AMnmsynS5Q==
X-Received: by 2002:adf:ef4a:0:b0:368:31c7:19dd with SMTP id
 ffacd0b85a97d-378c2cd3ae1mr1221292f8f.5.1726138565430; 
 Thu, 12 Sep 2024 03:56:05 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956e8a98sm14084691f8f.117.2024.09.12.03.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:56:04 -0700 (PDT)
Message-ID: <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
Date: Thu, 12 Sep 2024 12:56:04 +0200
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <878qvyjxpg.fsf@intel.com>
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

On 11/09/2024 12:23, Jani Nikula wrote:
> On Tue, 10 Sep 2024, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>>>
>>>> Building with clang and and W=1 leads to warning about unused
>>>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>>>
>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>>>> inline functions for W=1 build").
>>>>
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> I think this function can be dropped. Marc, your call, as an author of
>>> the patch?
>>
>> ( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )
> 
> Whoops, a typo.
> 
>>> For the record, Arnaud is the driver's author.
>>
>> pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
>> in a commented code block which was later removed.
>>
>> Thus, yes, it is safe to completely delete the unused function.
>> I'm surprised gcc didn't catch that...
> 
> Thanks, I'll change this to drop the function.
> 
> GCC doesn't catch unused static inlines, while Clang does.

It makes no sense to me that adding "inline" would prevent
GCC from diagnosing the issue... GCC should simply ignore
the "inline" keyword when definition is not in a header file
(maybe they don't store "origin").

Regards

