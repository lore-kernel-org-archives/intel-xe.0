Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76BFC001DF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 00:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ACA10E1BE;
	Thu,  3 Aug 2023 00:06:04 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136010E1BE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 00:06:02 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso3314785ad.2
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Aug 2023 17:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691021162; x=1691625962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=grmkJDN/0GasEHyO1WVplU4u2nlUGNLeHBx8s3alU3I=;
 b=WlttW27JC6vrkQm61HlAGn7WwB6U5l0njVsNePtCWTNW7k4sPX8a/xubA+5rEuaKgi
 NEzOvVaHKYqyGNEb0Cvxr4AN7oGMXyXoh0NtG0NghRcQXr9Tu4M0qQAsnaGFSgzIuF+3
 skCv+8JdHgTj6RI8K6PbmIQejW8XXqMqcWlW2tUif6+C2/vhwje4KfRdnCZW9Kijf+E5
 Vg20kqSXtQvBH74BgKp+TJTmVBzqka531gFVSSZZu8l0atcP8Bgy9cfRmc8aTvakpxt5
 mA0tdoVNvzQlHr9UQHDsPu6I2xN84fWsHDEdv/Ouv+Z2c8GKJ/xPWNSBIHH/lZ2wKmKz
 Pihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691021162; x=1691625962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=grmkJDN/0GasEHyO1WVplU4u2nlUGNLeHBx8s3alU3I=;
 b=U/w/SPcStPCh6Jd3traNUV7io13RWiANdW5nb+Q2qRFxfwy006f67dYxg5fKmW82yw
 vOrdSjI7H5BK7tNMIBMIxFTVL8r6PkUpDesT7dh7vUsGWgknD9FEU1O6Tfy+UaT5BPJo
 PE2VLKzaf0WCbgh9I8FWxHrWKzzVAR3II/nri6KQmdWD8WAangCDYk/SkI//h+NtWAkN
 L+rFR6dXqxY5F6dckozSNAhiEKKidURo76h+dpzLMpsOZmoFhQJ648nzfpleNDFzubZO
 baUr8nC45EOYz+btzqlzUaCbps26pMNo3GXPUVvn0YCQ8Gw5fVOMXLPOO1sLZ6F0mlqR
 U6vA==
X-Gm-Message-State: ABy/qLaWwZcLQ8ljngXCJApejVm2aK5OmiaaYC3Nu0HkfdTnzOtO58xI
 l46tGYgjrmT6RVa9hXPJ6qc=
X-Google-Smtp-Source: APBJJlFeQk/58/lrEwKheMm9/V7nF/pPWdthMmgFj+BbmiigOP0qgzXxCQSBhRzgoaYqsbiLDV3V2Q==
X-Received: by 2002:a17:902:d506:b0:1b8:9044:b8ae with SMTP id
 b6-20020a170902d50600b001b89044b8aemr17589681plg.11.1691021162250; 
 Wed, 02 Aug 2023 17:06:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001ab39cd875csm12946322plb.133.2023.08.02.17.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 17:06:01 -0700 (PDT)
Message-ID: <ca20b318-f3c8-cfb9-2ff6-8bdc9bb014b2@roeck-us.net>
Date: Wed, 2 Aug 2023 17:06:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
 <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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

On 8/2/23 16:34, Andi Shyti wrote:
> Hi Guenter,
> 
> [...]
> 
>>>> +static const struct hwmon_channel_info *hwmon_info[] = {
>>>> +	NULL
>>>> +};
>>>
>>> just:
>>>
>>>     static const struct hwmon_channel_info *hwmon_info[] = { };
>>>
>>> would do.
>>>
>>
>> What would be the point ? This is just a placeholder, and we need
>> a NULL entry at the end.
> 
> right... this series needs to be read from the end to the
> beginning :)
> 

Or applied completely, review the result, and then dig back to
the individual patches to provide feedback. I got severely confused
when trying to review the series. I am not really sure if the split
into multiple patches is really making the review easier; it seems
to me it does the opposite.

Guenter

