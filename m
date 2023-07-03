Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB4EB64DD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 02:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC0310E081;
	Mon,  3 Jul 2023 02:37:16 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC1910E081
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 02:37:14 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b5cf23b9fcso3431778a34.0
 for <intel-xe@lists.freedesktop.org>; Sun, 02 Jul 2023 19:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688351833; x=1690943833;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDiG+CPbhtFJghCNWRmO2+RA3sajkkk6Da/IYBHKlec=;
 b=Zuh/p2B6VeBCCPeLtFH1lmRL2LI8gk3RZW+24QRpp/5RTSKcsMTVf7sFgEyHn53y7/
 xOaRNmexVatysb1UMJBGbZgshe4jPJFCihWzSsL2GAyC/XLA5dp+EySydVBUWRs4piT2
 95ZEnEhsntcFUG5iTF+wNau4f3kgeQvIaKU1Gua95kTIZ7VN8y0Cu1slCGGK8TwPkUVX
 E/7R7bsQZRMl7r6B0vb0uAm7Y7vWsP7bdWx19GqGpkn/uo7aAN9XQ49ikgZeOId/hwCK
 6Ymvgi0UoBepXjLm/dQenYscpz0iy74NmhPdzvzyrgF6ZTDiJOqPAE/V9wAMmb4e49gv
 7lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688351833; x=1690943833;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDiG+CPbhtFJghCNWRmO2+RA3sajkkk6Da/IYBHKlec=;
 b=YLJlixcuzMMDCU6+3si6KO2y0/1tkxgCxNeY6TXFFnX8d5UmG79k6sDNDtRtMe1o1j
 Gwjctpp8DNObGlkmt6AMy23eIpvmV4TX8YSkggo1ESyve2UQlQMgvpPak/cg5wWqoVHq
 IbZpnbDD7M9qWNAgx+XcKGp2Idx4lGa/XWrEj5fbGllAKPEgUc6SLWgqDaFa86HdxP2T
 +1bDOb4I3eC++C3JlS7cbrfRFIK42uI0y2jW+ost+NQGgiSPtwb2fLJjmhG7pFBJh9pQ
 kO+XxEJJw6kZOFtd+oiBC0RlCpIcwm7M8kZBtx0LVMk6J4iWYV8FQfInaKd5lxVmhCq+
 wAUw==
X-Gm-Message-State: AC+VfDwhh+Pbc5qkbRbLw72jrvrnTrbvZ/n3N5NV4VVj44EX5c1HEw6B
 oIlGTB2fRGcC7TVmTesEdRw=
X-Google-Smtp-Source: ACHHUZ44L6R7+SNVvscbxcPfCQgULnZFcVMDXA58+YY/Jd/auHQYMeb4RHAbZe/1fZSeiVaNY/LIRg==
X-Received: by 2002:a05:6830:1d54:b0:6b8:9a3a:ea12 with SMTP id
 p20-20020a0568301d5400b006b89a3aea12mr8814916oth.12.1688351833199; 
 Sun, 02 Jul 2023 19:37:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a001200b002610468d738sm15563939pja.19.2023.07.02.19.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 19:37:12 -0700 (PDT)
Message-ID: <83220aa1-5456-fcd4-a4c4-17e5c54f148b@roeck-us.net>
Date: Sun, 2 Jul 2023 19:37:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <873526dpl3.wl-ashutosh.dixit@intel.com>
 <4b71ba43-4cbb-0840-a46a-3fe4518254d0@roeck-us.net>
 <871qhpepej.wl-ashutosh.dixit@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <871qhpepej.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 7/2/23 18:48, Dixit, Ashutosh wrote:
> On Sun, 02 Jul 2023 13:51:40 -0700, Guenter Roeck wrote:
>>
>> On 7/2/23 13:29, Dixit, Ashutosh wrote:
>>
>>> Of course people might have been abusing the deprecated API's (or NULL chip
>>> parameter) but to me it seems there is also some legitimate use for them.
>>>
>>
>> You still neglect to explain what you think that legitimate use would be.
> 
> To me "drivers/gpu/drm/amd/pm/amdgpu_pm.c" is a legitimate use case which
> doesn't use chip_info (both standard and custom hwmon attributes are
> defined without using chip_info). "drivers/gpu/drm/i915/i915_hwmon.c" has

In new code, standard hwmon attributes MUST be defined using chip_info.
Declaring the use of a deprecated API as "legitimate use case" and use it
as example for new code is never appropriate.

> all this extra code related to chip_info/channel_info which is not
> needed. i915 could well move to the amdgpu model and that would reduce i915

Yes, and the proposed i915 code _doesn't_ have all the extra code that would
otherwise be needed to generate and read/write sysfs attributes directly.

> code. That is what I was originally proposing for this new patch series.
> 

This is wrong. Using chip_info _always_ reduces code size for standard
hwmon attributes, because the code can concentrate on reading and
writing values from/to the chip and doesn't have to bother with sysfs
attribute handling. Convert drivers/gpu/drm/amd/pm/amdgpu_pm.c to use
the with_info API and you'll see.

Guenter

