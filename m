Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9BBC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 17:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC3D10E070;
	Fri, 11 Aug 2023 17:39:04 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB5C10E070
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 17:39:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bc73a2b0easo17099905ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691775542; x=1692380342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pBxZqhLFDgx9jdj7Bo68P7j0kzMWZCpQXwu/t6+x3tM=;
 b=akFJY1vAD90NRDQPgLUy/M1acHfhdaX3UxcWqMEhiA89JJEmEv/uKwCuimwIgI5Fdf
 FEyzfz1rZEua3dWY9R+TK8Nw9GdqsMT/hj7PnvIixTtj8qNETFQScKI+imivP+pDKYbX
 J2pT2UdFK/6FqiQm5MntaOMwH5o3gTqxYL52jyq/odRfSOQLmH9jdu5vOf2yxfWChRov
 iOfjnDhyWdHM9g8l6Sy5MwQCE2M0s1kcbS5GgFjSKlVXhGOUTW/cgQvxMyuSLe327Mc5
 2Z/hLMDPcnfOH9KiB5shg5VE3LV+4siGmdfKQq/LNNFcQ7n6WKVWKznZuoUkJgDAg0sA
 p7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691775542; x=1692380342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBxZqhLFDgx9jdj7Bo68P7j0kzMWZCpQXwu/t6+x3tM=;
 b=fztB11ITb2ctGMWN4G+EyLfhE5hMQjcRurB+FT8gKEmhN+YlDK9Hn205snS3pDPqD3
 qvG4EjBROjSA8ILIYr1gBhxpbrRnfJzVKOUtHltORyt8GfL4VIBb2m3itp1I1YM54g1h
 46eOWjdiJCUXPEyFv/Zv2YSetMD9G9+u6NZqAiS3RomfVXsOvvxcJbdI2iimhKSvy5ct
 MN1dqbVLfJtLu542SPRDkMfQK5s51a2J9qOSiKqdpR1isqqruezYxC2u8aqO8XH+ZWeo
 HsdVWpP8m6aYxNUWyOdXqx117NWqW7y+sb5KviQBqQtoolErE3to3Ufy829uXfJXI3QN
 6PNg==
X-Gm-Message-State: AOJu0YzpLpR9Jx6QgtaaEQQBNgrNzIr2J3RvAu9GJCJZGmnELUPmNbMT
 bot8e+u1qvcUYaP/zWsPSFg=
X-Google-Smtp-Source: AGHT+IFkCCeBDsPjCeNIKKG5KuSYK+RYYrj+51Znzhx5eeX/c4SYldRlGI+xRe9kfhs23zGz2lkuEQ==
X-Received: by 2002:a17:903:2c5:b0:1b5:4679:568f with SMTP id
 s5-20020a17090302c500b001b54679568fmr2140809plk.45.1691775541857; 
 Fri, 11 Aug 2023 10:39:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a170902d4c500b001bb9bc8d232sm4189887plg.61.2023.08.11.10.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 10:39:01 -0700 (PDT)
Message-ID: <ebe68c94-65ed-dfa2-13d5-10c06661601b@roeck-us.net>
Date: Fri, 11 Aug 2023 10:39:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
 <436c15bf-c031-9f72-c4cc-c7ff1600fdbf@intel.com>
 <55da1781-3ea7-b3bc-05f8-8af25e5ea143@roeck-us.net>
 <710b7d67-2882-a077-cbd8-ab42c41aa3ca@intel.com> <ZNK0NzoBlGt6chs2@intel.com>
 <a95b0703-b3cd-23ae-7ba7-40aab960320a@roeck-us.net>
 <ZNZbY0OAa2GvETUd@rdvivi-mobl4>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZNZbY0OAa2GvETUd@rdvivi-mobl4>
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 8/11/23 09:01, Rodrigo Vivi wrote:
> On Tue, Aug 08, 2023 at 03:07:43PM -0700, Guenter Roeck wrote:
>> On 8/8/23 14:31, Rodrigo Vivi wrote:
>>> On Fri, Aug 04, 2023 at 08:06:22PM +0530, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 04-08-2023 19:56, Guenter Roeck wrote:
>>>>> On 8/4/23 06:19, Nilawar, Badal wrote:
>>>>>>
>>>>>> Hi Guenter,
>>>>>> On 03-08-2023 04:42, Guenter Roeck wrote:
>>>>>>> On 8/2/23 15:40, Andi Shyti wrote:
>>>>>>>> Hi Badal,
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +struct xe_hwmon_data {
>>>>>>>>> +    struct device *hwmon_dev;
>>>>>>>>> +    struct xe_gt *gt;
>>>>>>>>> +    char name[12];
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +struct xe_hwmon {
>>>>>>>>> +    struct xe_hwmon_data ddat;
>>>>>>>>> +    struct mutex hwmon_lock;
>>>>>>>>> +};
>>>>>>>>
>>>>>>>> why do we need two structures here? Can we merge them?
>>>>>>>>
>>>>>>>
>>>>>>> A later patch adds multiple hwmon devices which makes use of it.
>>>>>>> I think that is flawed, and I am not inclined to accept it.
>>>>>> Is there any obvious reason that there shouldn't be multiple
>>>>>> devices? In i915 we are doing the same.
>>>>>> https://patchwork.freedesktop.org/patch/497324/?series=104278&rev=3
>>>>>>
>>>>>
>>>>> Technically you can do whatever you like as long as the code doesn't reside
>>>>> in drivers/hwmon. I won't NACK it, but I won't give it a Reviewed-by:
>>>>> either. i915 shouldn't do it, but I didn't realize what they are doing
>>>>> at the time. Other drivers doing it wrong is not an argument. You can't
>>>>> argue that you may drive faster than the speed limit because others do it
>>>>> or because police didn't stop you last time you did either.
>>>>>
>>>>> One chip, one hwmon device. Do you have separate parent devices for
>>>>> all your hwmon devices ? If yes, you can argue that having multiple hwmon
>>>>> devices make sense. If not, you can't.
>>>> Thanks for clarification. There is only one parent device. So will try to
>>>> accommodate single hwmon device.
>>>
>>> Well, it is one PCI device, but under 1 pci device we can have multiple "tiles"
>>> that can duplicate many components. Inside each tile we can even have multiple
>>> "gt"s.
>>>
>>> But back to the tile, each tile has its own metrics. It's own power delivery,
>>> own sensors and all. They can even be seen as independent devices from this
>>> angle.
>>>
>>> I'm afraid that the attempt to put everything as one device, but all the
>>> entries duplicated per tile/gt we might end up with a messed api.
>>>
>>
>> Your argument does not make sense. I am not asking to duplicate anything.
> 
> Okay, I'm sorry, maybe 'duplication' was a bad choice of words from my part.
> 
> You had told that having multiple hwmon device for a single chip was not
> acceptable.
> 
> But I'm trying to explain that we have a hardware architecture where the graphics
> is duplicated in 'tiles' inside the same PCI card. Each tile with its
> own sensors and monitoring systems. And also an extra sensors monitoring the
> entire 'package' that includes the tiles and the SoC.
> So 1 hwmon device per gt-tile and package sound the appropriated way to me.
> 

No, it isn't. Next you are going to tell me to split CPU temperature devices
in the same way because they are split in "tiles" on the same CPU core.

> Your lines had convinced Badal to get them all and merge in a single hwmon
> device. If we do this, the API will get messed up.
> 
> And this is what I meant by 'messed up':
> quoting Badal:
> """
> With single device energy entries will look like hwmonxx/energy1_input,
> energy2_input, energy3_input.
> To identify which entry for what need to expose additional entry energyX_lable
> which will contain ("package", "gtN")

So what is the problem with that ? That is a description and not "messed up".

Guenter

