Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA4FC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 22:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8281A10E104;
	Tue,  8 Aug 2023 22:07:48 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA10210E104
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 22:07:46 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so219248939f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Aug 2023 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691532466; x=1692137266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=nAl9mXlCAoqJmbkSyh7LvdK1vER3jiX0bR73EtdOQiE=;
 b=JMT9fRCboNXWP/Hg6eDM5J9QJ5hZug2fXEbSJH5Fwwn+S99peoRNaGJ8zbioN5JWMo
 UaUBpnN7oTXWbOE6YfLLdMpS6I1un3X6qzcoxW7DaajbKbG0LELwAm6EcreOSQ8/YnuD
 bMHRTNJnVjVg0HJ4T3cCxG7FSImyLXwgAv5XNUlB2aYFFLD520RPcY31cqJ/4OU2o+i1
 FSitRHy28c3UXFu9P+woJYxpsDMN39gOli5lb7lEf2114tclurFNbjhUqm/sPe38Hm5W
 MFdDQPvjV648L3cFqDJm4E7vuOy28wYoiMkgQrZsMUreWjcbx03ENGDp/J45KQqu7Le2
 rtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691532466; x=1692137266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAl9mXlCAoqJmbkSyh7LvdK1vER3jiX0bR73EtdOQiE=;
 b=ZZgF3AMiU6tr/RML3CODUiUZ2s0knrHPaFw3kPPHnuC80E1d9Ju/liC3ntP9Jk1SFX
 fncTmbZUlN3YLMJhVxXGp0RIfC0wlO3dtqPZr4v2tgqLtCnWw/E1r7ka4hLwPwCElhTG
 98qaSDSqrQ6mluBHnjaGprbPzMhYEGdQyeIenYJapC4izfLtZe96UIbkSF0Cwva6K/8b
 apLAjsnZn7LWKAb6G8m4HIgWOzIv+0szoxwz41jNlnN0gL53MkM4M0YVGXULqtzjlHVd
 di4UpjsiclwKsmWDQflAjEpDfCPEp/d75y5IdvfoL/pw5BHh5sFc5BaaoW4REKGYPH78
 JKDw==
X-Gm-Message-State: AOJu0YxIo7oSOUYT4g2xNYtynnOAL4zLdTnfi/H4WkdNXILrOsdptepX
 hQGrio+EzxBKDDeTCjribdA=
X-Google-Smtp-Source: AGHT+IGHv9R5kUFE+6e1/2lIdq35xjKyn2Re57/28+kYA7Ez1mJyEFP8S8naFFtoLYVLdXBvKjlMOg==
X-Received: by 2002:a05:6602:3358:b0:786:e612:72f8 with SMTP id
 c24-20020a056602335800b00786e61272f8mr900675ioz.21.1691532465969; 
 Tue, 08 Aug 2023 15:07:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a056638120c00b004302370a169sm3444261jas.157.2023.08.08.15.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 15:07:45 -0700 (PDT)
Message-ID: <a95b0703-b3cd-23ae-7ba7-40aab960320a@roeck-us.net>
Date: Tue, 8 Aug 2023 15:07:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
 <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com> <ZNK0NzoBlGt6chs2@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZNK0NzoBlGt6chs2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/8/23 14:31, Rodrigo Vivi wrote:
> On Fri, Aug 04, 2023 at 08:06:22PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 04-08-2023 19:56, Guenter Roeck wrote:
>>> On 8/4/23 06:19, Nilawar, Badal wrote:
>>>>
>>>> Hi Guenter,
>>>> On 03-08-2023 04:42, Guenter Roeck wrote:
>>>>> On 8/2/23 15:40, Andi Shyti wrote:
>>>>>> Hi Badal,
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +struct xe_hwmon_data {
>>>>>>> +    struct device *hwmon_dev;
>>>>>>> +    struct xe_gt *gt;
>>>>>>> +    char name[12];
>>>>>>> +};
>>>>>>> +
>>>>>>> +struct xe_hwmon {
>>>>>>> +    struct xe_hwmon_data ddat;
>>>>>>> +    struct mutex hwmon_lock;
>>>>>>> +};
>>>>>>
>>>>>> why do we need two structures here? Can we merge them?
>>>>>>
>>>>>
>>>>> A later patch adds multiple hwmon devices which makes use of it.
>>>>> I think that is flawed, and I am not inclined to accept it.
>>>> Is there any obvious reason that there shouldn't be multiple
>>>> devices? In i915 we are doing the same.
>>>> https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
>>>>
>>>
>>> Technically you can do whatever you like as long as the code doesn't reside
>>> in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
>>> either. i915 shouldn't do it, but I didn't realize what they are doing
>>> at the time. Other drivers doing it wrong is not an argument. You can't
>>> argue that you may drive faster than the speed limit because others do it
>>> or because police didn't stop you last time you did either.
>>>
>>> One chip, one hwmon device. Do you have separate parent devices for
>>> all your hwmon devices ? If yes, you can argue that having multiple hwmon
>>> devices make sense. If not, you can't.
>> Thanks for clarification. There is only one parent device. So will try to
>> accommodate single hwmon device.
> 
> Well, it is one PCI device, but under 1 pci device we can have multiple "tiles"
> that can duplicate many components. Inside each tile we can even have multiple
> "gt"s.
> 
> But back to the tile, each tile has its own metrics. It's own power delivery,
> own sensors and all. They can even be seen as independent devices from this
> angle.
> 
> I'm afraid that the attempt to put everything as one device, but all the
> entries duplicated per tile/gt we might end up with a messed api.
> 

Your argument does not make sense. I am not asking to duplicate anything.

Guenter

