Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112C1C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 08:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3DB1132F4;
	Wed, 17 Apr 2024 08:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="R1zhvPnW";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8181132F4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 08:51:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so47040215e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713343903; x=1713948703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mkbg9wuEy8YO40tgc7L2bXiIsaeZQu4hwJqM/qM2lJc=;
 b=R1zhvPnWd5i0BfMWECO6awv//F2wYcEj0e+H2N5EQUlPFiWYp9koBz396nW/o84NW5
 PdMX0XWwaqOEuef5mDSxmXfkY7T/4+NgwjDONWG4qbSKLAw1jQkKBskCYOAFOZVA6nPR
 IpUGyqAN2yiQ+njWxQ+0MqEDuNPMrFwcBsrbylVP2Ot/frSGjGHM05FtJ/fTUXcuTQuc
 Y7R634o5kN5AevEYz1v1BP5IERRvrP0hEHSFCD9+Rl625yV4ja1eWMYRHz8NJFJxb900
 gp99YP0jEktKLMklC0EZI3ChK8klLDozxv7rWtYZUKRUtpKGvffEkJqwj2/jkLFiAHbx
 5Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713343903; x=1713948703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mkbg9wuEy8YO40tgc7L2bXiIsaeZQu4hwJqM/qM2lJc=;
 b=FC+L08J7lhkK+Bvv4tQ+tis1yNVjdGNjsFF10nhGeNyYDTE4HVuUnxDMBJLeLfC3AQ
 BZMty3xQYm+9CaPsA5D/e2NBB/FqFaRCeyYzeUZQgow0WZ0MN7y9jfApvcs2iDE7y4bd
 lV8gSYZqG5jNuzOaiMwe114Up0WDWgWZDtkzff1BQvZRpmiGaCVy0PQl6B2UUeoD9G7k
 oWRgr8ZZQuEQqXnpliberdJ0aL2eyXpZ81uvhj9fs2oRM7U3OWPw4snsYGsPS/3/GCNf
 ZebP+kG1YPv6P2bLAVVOzBYygebkDHkdZqmiqNFfVZoNLS7Cwqy2aNaqtHdJBSRRzdFc
 9xLQ==
X-Gm-Message-State: AOJu0YwQcq92rBmfhf0LPaWTz2fTbTFxde3odyOZ0b1yr8cIHXTPMfsy
 Kmdao+PDt2gjkmo4Ohzv6Meo19SQZZZOME/Bd45y8gJecdbxbs6QW3ajZc/4OH8=
X-Google-Smtp-Source: AGHT+IGAStDym8ENH/vvdldhHkspp7YP1FbKLxgEzMIWTCSONZSwpNtsMsI79G2u1iAU9TZHrYjukw==
X-Received: by 2002:a05:600c:46cb:b0:416:6b95:c631 with SMTP id
 q11-20020a05600c46cb00b004166b95c631mr14269003wmo.6.1713343903294; 
 Wed, 17 Apr 2024 01:51:43 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b004181c91d1dcsm1923668wmb.18.2024.04.17.01.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 01:51:42 -0700 (PDT)
Message-ID: <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
Date: Wed, 17 Apr 2024 09:51:42 +0100
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
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
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


On 16/04/2024 19:29, Lucas De Marchi wrote:
> On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>
>> On 16/04/2024 14:51, Lucas De Marchi wrote:
>>> Forgot to Cc Michal, doing now.
>>>
>>> Lucas De Marchi
>>>
>>> On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>> On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>> Add per-client usage statistics to xe. This ports xe to use the 
>>>>>> common
>>>>>> method in drm to export the usage to userspace per client (where 1
>>>>>> client == 1 drm fd open).
>>>>>>
>>>>>> However insted of using the current format, this creates a new one 
>>>>>> with
>>>>>> the unit "ticks". The intention here is not to mix the GPU clock 
>>>>>> domain
>>>>>> with the CPU clock. It allows to cover a few more use cases without
>>>>>> extra complications.
>>>>>>
>>>>>> Last patch was a quick implemenation of a gputop-like tool in python.
>>>>>> I ended doing it to cross check the gputop implementation. I's not
>>>>>> really meant to be applied here.
>>>>>>
>>>>>> I tested this on DG2 and TGL with kmscube (console-only) and vkcube
>>>>>> (in a gnome session), but it would be good to soak this under more
>>>>>> tests. The biggest goal for this patch series right now is to get
>>>>>> consensus on the new UAPI.
>>>>>>
>>>>>> TODO: Add documentation on top with the new interface.
>>>>>
>>>>> Yeah a drm-usage-stats.rst patch would be nice to have in the RFC 
>>>>> so one does not have to look into the driver implementation to 
>>>>> discuss the proposed uapi.
>>>>>
>>>>> Nevertheless I understand the proposal is to add this:
>>>>>
>>>>> drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>
>>>> yes, the gputop patch was more explicit about this. Should had added in
>>>> the kernel patch series too.
>>>>
>>>>>
>>>>> That's two values per key. I guess "one key value pair for per one 
>>>>> line of text" does not get strictly broken and that you propose a 
>>>>> heuristics in parsing to detect that the <RUNTIME> cannot be 
>>>>> mis-interpreted as the unit?
>>>>
>>>> the current format is
>>>>
>>>>     drm-engine-<class>: <RUNTIME> ns
>>>>
>>>> the "ns" in the end should be parsed by userspace to know
>>>> what it is about.
>>
>> Right.
>>
>>>>
>>>>>
>>>>> Not sure it is a good idea though. If you instead added a new key 
>>>>> for the gpu time what would be the downside in your view? Like:
>>>>>
>>>>> drm-engine-<class>: <uint> ticks
>>>>> drm-ticks-<class>: <uint>
>>>>>
>>>>> Or maybe even obsfuscate/generalise as:
>>>>>
>>>>> drm-engine-<class>: <uint> gpu-time
>>>>> drm-gpu-time-<class>: <uint>
>>>>
>>>> I think both work, but I fail to see the advantage. This alternative is
>>>> slightly heavier on the parsing side since you have to correlate the
>>>> values from 2 keys, possibly dealing with them appearing in different
>>>> order. The only possible breakage remains with this alternative: if
>>>> userspace didn't parse the unit before. I checked nvtop and htop and
>>>> they were doing the right thing. I sent a fix to igt a few weeks back
>>>> for it to consider the unit:
>>>> https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>
>> Advantages are that "drm-engine-something: 1234 5678 ticks" isn't 
>> self-explanatory (intuitively humanly readable) and that it doesn't 
> 
> maybe I have a different expectation from procfs. When I do e.g.
> 
> # cat /proc/self/stat
> 3861283 (cat) R 3861233 3861283 3861231 34816 3861283 4194304 90 0 0 0 0 
> 0 0 0 20 0 1 0 1321348797 8560640 384 18446744073709551615 
> 93979016876032 93979016892449 140720658378704 0 0 0 0 0 0 0 0 0 17 51 0 
> 0 0 0 0 93979016907440 93979016908904 93979037196288 140720658380605 
> 140720658380625 140720658380625 140720658382827 0
> 
> it doesn't seem to me "intuitively humanly readable" was the first
> concern for people adding files in procfs :)... I'd rather think "machine
> readable" was more important.

I think you are pushing the argument a bit now :) since IMO we should 
evaluate drm-usage-stats.rst proposal more in the context of 
drm-usage-stats and other fdinfo files, rather than the whole of procfs. 
In other words if there isn't a strong reason to regress this particular 
file lets not do it.

>> diverge from the one value per key plus unit format. Latter we would 
>> then document clearly.
>>
>> Different keys potentially appearing in different order does not 
>> matter since userspace already has to handle that.
>>
>>>>> Potentially could also add a key saying how much wall time is one 
>>>>> unit of GPU time.
>>>>
>>>> I wouldn't add it really as it may not make sense depending on the
>>>> vendor and or usage. Examples: the gpu time may be different for
>>>> different engines depending on where they are located (tile/gt). The
>>>> correlation with CPU time is different when running in VF mode, and may
>>>> change in runtime depending on the number of VFs. +Michal.
>>
>> Yes, that's why I said "potentially", which was supposed to mean if 
>> and where it makes sense and perhaps adds value.
>>
>>>> Also, if the userspace side really wants to know (why would it?)
>>>> it could be just calculate from 2 samples (possibly repeated a few
>>>> times as it updates the output).
>>>>
>>>>>
>>>>> Or.. would even the existing drm-cycles, plus abuse of drm-maxfreq, 
>>>>> work? Ticks == cycles, maxfreq == ticks per wall second.
>>>>
>>>> I think it'd be up to gpu vendor what clock backs this time. For the
>>>> current Intel cards, it's the refclock and it doesn't vary the
>>>> frequency.
>>
>> Right, but that doesn't matter. What I was saying is that if you 
>> exposed ticks in drm-cycles and tick frequency in drm-maxfreq it would 
>> even work, no? (Assuming support for those two was actually in 
>> igt_drm_fdinfo/clients/gputop and could be used as fallback to time 
>> based stats.)
> 
> oh... I was looking at the output for i915 and missed that we had
> drm-cycles as currently i915 doesn't use it. It seems to be a similar
> thing. I agree the drm-maxfreq- is unfortunate and that we don't
> actually have support for that in gputop.
> 
> So, instead of the 2 numbers + different unit, I can adapt this to
> rather use drm-cycles. However for maxfreq, it doesn't seem to be
> what we need since it doesn't scale for VF. It brings back the cpu clock
> domain this series is trying to avoid. The difference is that using
> drm-cycles- and drm-maxfreq- you are expecting the userspace to do
> (let me know if I interpreted the docs wrong):
> 
>      s1 = sample()
>      sleep(period)
>      s2 = sample()
>      engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) - 
> (s1.drm_cycles * s1.drm_max_freq)) / period
> 
> ... considering the drm_max_freq may change from one call to the other.
> if we simplify it and assume it doesn't change:
> 
>      engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * 
> drm_max_freq) / period
> 
> we'd need different drm_max_freq reported on VF driver that would need
> to know the number of VFs enabled to scaled it correctly. Maybe this is
> abusing the "drm-maxfreq" a little bit?

Yes it would be bad if the observed VF GPU clock will be variable since 
maxfreq is supposed to be static.

So on VFs would reported GPU clock moves by the VF "used" quanta? Where 
"used" is defined as time given by the GuC, not necessarily used GPU 
time. For instance 16ms quanta, VF GPU clock would move by 16ms if the 
GuC decides not to switch out the idle VF? Or it could move by less than 
16ms if it switched it out earlier.

> What if we had
> 
> drm-cycles-<keystr>: <uint>
> drm-total-cycles-<keystr>: <uint>
> 
> Then the utilization can be done:
> 
>      s1 = sample()
>      sleep(period)
>      s2 = sample()
>      engine_utilization = (s2.cycles - s1.cycles) / \
>                   (s2.total_cycles - s1.total_cycles + 1);
> 
> Capacity still to be added above, but we'd need to clarify if
> drm-total-cycles-<keystr> already accounts for it.
> 
> Here instead of the conversion to cpu clock, I'm expecting to read
> "total_cycles" from HW and that being different (slower) for VF.
> AFAICS this is not the case with this current polling implementation
> since we are simply reading the RING_TIMESTAMP, but there are planned
> changes to get it from GuC. Umesh/Michal Cc'ed may know better.

I think this works and is clean.

Although I have some doubts about the usefulness on VFs, if the clock 
movements are at the mercy of the GuC scheduler. Like what does 100% 
mean for a VF? Maybe it was full quanta, or maybe it was half a quanta 
if GuC decided to switch it out early, either due going idle or due some 
other scheduling decision.

>> Only problem is the name maxfreq is not really an exact fit, which is 
>> why I am not convinced we should go this route. Perhaps could add 
>> drm-cycle-frequency and then drm-cycles would fit.
>>
>>>>> Secondly, wrap behaviour every 25-30 seconds patch 6/7 describes 
>>>>> definitely breaks the format spec and in my view should be worked 
>>>>> around in the driver:
>>>>>
>>>>> """
>>>>> Values are not required to be constantly monotonic if it makes the 
>>>>> driver
>>>>> implementation easier, but are required to catch up with the 
>>>>> previously reported
>>>>> larger value within a reasonable period. Upon observing a value 
>>>>> lower than what
>>>>> was previously read, userspace is expected to stay with that larger 
>>>>> previous
>>>>> value until a monotonic update is seen.
>>>>> """
>>>>
>>>> but this is the behavior for dealing with "ns", not with "ticks". We 
>>>> can
>>
>> Applies to drm-cycles- too.
>>
>>>> add a worker to run every so often.  When I got the original patches
>>>> from Umesh, we had this worker implemented, but dealing with that was
>>>> complex and wasting a lot of cycles since it was always running (except
>>>> if we didn't have any exec_queue). Here is my tentative to simplify it
>>>> since I don't really see the need to account for a ~25s wrap around.
>>
>> At the moment I don't think diverging like that would be user 
>> friendly. Apart from diverging it would only make the output useful to 
>> tools which know to keep polling with a small enough period.
>>
>> The tools with support a configurable polling period such as 
>> intel_gpu_top could even inadvertently fail. Or would need to start 
>> embedding knowledge about maximum periods per driver/backend/whatever. 
>> Or new fdinfo keys to signal that.
>>
>> Sticking with the same monotic scheme sounds preferrable to me.
>>
>> And if wrap is 25-30 seconds why it was wasting that many cycles? Some 
>> worker only needs to run once every 20 seconds or so and that is it, no?
> 
> every 25-30s for every card regardless of having a userspace tool
> quering or not seems wasteful to me.

So what would be the plan for intel_gpu_top -s 60000?

The worker is not rosy I agree. Any ways around it? Like caching the 
last known hw timestamp on park and estimating it until unpark and only 
running the worker while GPU is active?

Think also about the prevent low frequency polling use cases like server 
monitoring tools such as Munin(*). Those typically sample with a like a 
5-15 minute periods and I can imagine a GPU monitoring plugin being 
useful for some data center farms. Yes that is notionally more about 
global than fdinfo, but in the absence of global on xe see how for 
instance nvtop is deriving global from fdinfo on i915.

Regards,

Tvrtko

*) 
http://demo.munin-monitoring.org/munin-monitoring.org/demo.munin-monitoring.org/
