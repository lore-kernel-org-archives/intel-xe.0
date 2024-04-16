Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DC0C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 14:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628A8112CE9;
	Tue, 16 Apr 2024 14:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="P4W5lwgc";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271EE112CDF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 14:22:23 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so3235674f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713277342; x=1713882142;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8GaZ2s7Xp3hTIuPjKYWRFeW9bcGHm/MfGcbmjYXf18=;
 b=P4W5lwgcfHp2Xf8J+rMJEXeZY7aolEJ9DeWPArFNyfibVZXm4lP1Q8f+57ZiTU4XfR
 xRKrAwbqsGyJMoR+kzZcGyrV7SXsCp249eF0YOihccBiTrWDHWAfPxSTYTPciQjR5aE5
 hHFQzZh8NyDZG0TAG8Jfu5TYiURrW0CPDz7XOJMIIvTp65RWyraOuFFkj+gdQuzf2ruq
 bdQzaMq3EVZjZtnIKvKoB0UOyi7ah5YRWjdE9vnlkUUGWNvZFLqBIJyqtJ3sPkj2kUJJ
 P4rDB5iBTYwloJw0+kHz/pCktfbi4Vjik0HV7X5q0knuxIWDK9hORKm1cp15iLFTI8Dz
 yg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277342; x=1713882142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8GaZ2s7Xp3hTIuPjKYWRFeW9bcGHm/MfGcbmjYXf18=;
 b=XVS5GOuoeSb+JFcMzMvHyMMglvR/GPVikPF+6DaU3d51/vFwvWze2XXRjFOZf+C6ph
 5earq/PA7YSB9vxe5AnyVyvvqKxo+9x4rOGsRokSjRzJ4nsfZjRspgLViL/UUlIgVlJy
 xrZbpFz/ac5m7XOQReRQH0K9UInlVhZU7AOT3EMrwSJHq/XkLS3jKEa+kXR+m6VtloJ5
 4tfgVou/i5IJLIYTH4/1/M78plzR+wagEMkZggFcly5mVDBhU6exIJ+rrWVKCkEaEhUI
 PhfWS9X/gEhTX7l2uTlae3DuFzSRFbsBPBIsp2YUuV+Ptm06MbWJvpwf7EZ1ZvnnCyq3
 K2Dw==
X-Gm-Message-State: AOJu0YwQJvNFejdzQV7ZWwJilITNekIS3bcSSkcSyeKVMg2SDh56VIl8
 ULfYYJnl0a7s4aTgyujuEf13ojBRn0lyewbPk0ULLwRd/lLOwN2MWUaPhTS+/G0=
X-Google-Smtp-Source: AGHT+IEulNvN6FBa053zLKxFDZrEQrxvuX+FTCN1fBoXy/CkkCMzpBXcPycz4mUdDJ4Xykz/SgTW1A==
X-Received: by 2002:a5d:6d84:0:b0:347:1cb4:f94 with SMTP id
 l4-20020a5d6d84000000b003471cb40f94mr10610020wrs.4.1713277342107; 
 Tue, 16 Apr 2024 07:22:22 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 r26-20020adfb1da000000b0033e745b8bcfsm15207822wra.88.2024.04.16.07.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 07:22:21 -0700 (PDT)
Message-ID: <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
Date: Tue, 16 Apr 2024 15:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
 <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 16/04/2024 14:51, Lucas De Marchi wrote:
> Forgot to Cc Michal, doing now.
> 
> Lucas De Marchi
> 
> On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>> On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>> Add per-client usage statistics to xe. This ports xe to use the common
>>>> method in drm to export the usage to userspace per client (where 1
>>>> client == 1 drm fd open).
>>>>
>>>> However insted of using the current format, this creates a new one with
>>>> the unit "ticks". The intention here is not to mix the GPU clock domain
>>>> with the CPU clock. It allows to cover a few more use cases without
>>>> extra complications.
>>>>
>>>> Last patch was a quick implemenation of a gputop-like tool in python.
>>>> I ended doing it to cross check the gputop implementation. I's not
>>>> really meant to be applied here.
>>>>
>>>> I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>> (in a gnome session), but it would be good to soak this under more
>>>> tests. The biggest goal for this patch series right now is to get
>>>> consensus on the new UAPI.
>>>>
>>>> TODO: Add documentation on top with the new interface.
>>>
>>> Yeah a drm-usage-stats.rst patch would be nice to have in the RFC so 
>>> one does not have to look into the driver implementation to discuss 
>>> the proposed uapi.
>>>
>>> Nevertheless I understand the proposal is to add this:
>>>
>>> drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>
>> yes, the gputop patch was more explicit about this. Should had added in
>> the kernel patch series too.
>>
>>>
>>> That's two values per key. I guess "one key value pair for per one 
>>> line of text" does not get strictly broken and that you propose a 
>>> heuristics in parsing to detect that the <RUNTIME> cannot be 
>>> mis-interpreted as the unit?
>>
>> the current format is
>>
>>     drm-engine-<class>: <RUNTIME> ns
>>
>> the "ns" in the end should be parsed by userspace to know
>> what it is about.

Right.

>>
>>>
>>> Not sure it is a good idea though. If you instead added a new key for 
>>> the gpu time what would be the downside in your view? Like:
>>>
>>> drm-engine-<class>: <uint> ticks
>>> drm-ticks-<class>: <uint>
>>>
>>> Or maybe even obsfuscate/generalise as:
>>>
>>> drm-engine-<class>: <uint> gpu-time
>>> drm-gpu-time-<class>: <uint>
>>
>> I think both work, but I fail to see the advantage. This alternative is
>> slightly heavier on the parsing side since you have to correlate the
>> values from 2 keys, possibly dealing with them appearing in different
>> order. The only possible breakage remains with this alternative: if
>> userspace didn't parse the unit before. I checked nvtop and htop and
>> they were doing the right thing. I sent a fix to igt a few weeks back
>> for it to consider the unit:
>> https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/

Advantages are that "drm-engine-something: 1234 5678 ticks" isn't 
self-explanatory (intuitively humanly readable) and that it doesn't 
diverge from the one value per key plus unit format. Latter we would 
then document clearly.

Different keys potentially appearing in different order does not matter 
since userspace already has to handle that.

>>> Potentially could also add a key saying how much wall time is one 
>>> unit of GPU time.
>>
>> I wouldn't add it really as it may not make sense depending on the
>> vendor and or usage. Examples: the gpu time may be different for
>> different engines depending on where they are located (tile/gt). The
>> correlation with CPU time is different when running in VF mode, and may
>> change in runtime depending on the number of VFs. +Michal.

Yes, that's why I said "potentially", which was supposed to mean if and 
where it makes sense and perhaps adds value.

>> Also, if the userspace side really wants to know (why would it?)
>> it could be just calculate from 2 samples (possibly repeated a few
>> times as it updates the output).
>>
>>>
>>> Or.. would even the existing drm-cycles, plus abuse of drm-maxfreq, 
>>> work? Ticks == cycles, maxfreq == ticks per wall second.
>>
>> I think it'd be up to gpu vendor what clock backs this time. For the
>> current Intel cards, it's the refclock and it doesn't vary the
>> frequency.

Right, but that doesn't matter. What I was saying is that if you exposed 
ticks in drm-cycles and tick frequency in drm-maxfreq it would even 
work, no? (Assuming support for those two was actually in 
igt_drm_fdinfo/clients/gputop and could be used as fallback to time 
based stats.)

Only problem is the name maxfreq is not really an exact fit, which is 
why I am not convinced we should go this route. Perhaps could add 
drm-cycle-frequency and then drm-cycles would fit.

>>> Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
>>> definitely breaks the format spec and in my view should be worked 
>>> around in the driver:
>>>
>>> """
>>> Values are not required to be constantly monotonic if it makes the 
>>> driver
>>> implementation easier, but are required to catch up with the 
>>> previously reported
>>> larger value within a reasonable period. Upon observing a value lower 
>>> than what
>>> was previously read, userspace is expected to stay with that larger 
>>> previous
>>> value until a monotonic update is seen.
>>> """
>>
>> but this is the behavior for dealing with "ns", not with "ticks". We can

Applies to drm-cycles- too.

>> add a worker to run every so often.  When I got the original patches
>> from Umesh, we had this worker implemented, but dealing with that was
>> complex and wasting a lot of cycles since it was always running (except
>> if we didn't have any exec_queue). Here is my tentative to simplify it
>> since I don't really see the need to account for a ~25s wrap around.

At the moment I don't think diverging like that would be user friendly. 
Apart from diverging it would only make the output useful to tools which 
know to keep polling with a small enough period.

The tools with support a configurable polling period such as 
intel_gpu_top could even inadvertently fail. Or would need to start 
embedding knowledge about maximum periods per driver/backend/whatever. 
Or new fdinfo keys to signal that.

Sticking with the same monotic scheme sounds preferrable to me.

And if wrap is 25-30 seconds why it was wasting that many cycles? Some 
worker only needs to run once every 20 seconds or so and that is it, no?

Regards,

Tvrtko
