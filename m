Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377A9C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 08:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3CB112F0E;
	Tue, 23 Apr 2024 08:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="roHUVJHe";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60883112F0E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 08:45:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34b029296f5so2050850f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713861899; x=1714466699;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2O6H1QJx5RyCrqYM1RB/pIAWRlJZSK4hRF6JSEmy6gk=;
 b=roHUVJHeXT6jvyX2cCHRxoxOZw7R8z7Iv9s9ICL7h76xEgQudTQX9GOnI62Pzuiyzk
 +YAFqLLAa/YWoMet+3qK1+4UucN0blrXuLRQKzPhcInbhazg770GtKry/s8CcdF2HK2u
 96R8YhykRYZ4KdHLQ8huoPniOT1QaBfbH9NDfWbfsYxJYk+KYritqGANOpTHaDWaJJdD
 pfiH2Bn7U7UCWD+ii7N00t/RvKVWrNjCQ5LNfWOc+kjFcx02Rit1vGL9fPrcP9DK3tQa
 j2GGNY9NJQEf74wRYJnR7AZ1rxRJ2GvCBGdbbcVUK50o6PTuVRbSd01HvfoJjzJPfzvt
 7GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713861899; x=1714466699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2O6H1QJx5RyCrqYM1RB/pIAWRlJZSK4hRF6JSEmy6gk=;
 b=RCloNXRuR5Axmof6VRW9u8nkUVMsGJvHmbqxT5W4SA4jl9YCQJqi/n4L+QUCIaYvVX
 d94mXOuorqhqmeYp2wKjGLT3vv6Z3OopLWsPxETNnqpNseH+X/PpqIcvkRG0b3bk1ZOR
 XjXD2hEJNsuGTQ/8tPba+qbt40H0o08CTMzAMfz3qjOUxcljAcmGpDZTyne1v2ucEXsD
 M6fkSwHmS919ynEseQGfj6uxIL2LGi/d0/doNjF6Lmw/gs0idKQxGfIjFmmcDS4iR+Bz
 eE0RLEmcIdnUgw34Lo/F/S2AwSZY30796CMh2wmw4RNQ/WOyTavqGf8/AK5Xw9KgoGZR
 mDCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1a/DKu8YmtWEF30pyOknZZhHgzBD9htdVT0/vXidiDAHnRtdnzLieND/4KxKIjKi5Lb+vkadADy77m/kdZmRN6YRZV9FIeCvfQf/yNm0=
X-Gm-Message-State: AOJu0YzJOaul9FcS193ADSCT7g6QoT0imtm987xNxn2vBF6TwMs3MzLj
 LIYn7A+2oQcaA8rPgXGTzc2SYHuAKDXEZlBB9fhszjYpCFzrWOWxereJdj1xOQ4=
X-Google-Smtp-Source: AGHT+IExh5+B9f1fHXq3SI6cPD+oXCJhZrBga0KXZOyU6yMJaGynDUo5mylsNak2bHHCvQlO6vSg3Q==
X-Received: by 2002:a05:6000:10c:b0:34a:4b5b:a3d with SMTP id
 o12-20020a056000010c00b0034a4b5b0a3dmr9895458wrx.7.1713861899118; 
 Tue, 23 Apr 2024 01:44:59 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adffd50000000b00346d3a626b8sm14167232wrs.3.2024.04.23.01.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 01:44:58 -0700 (PDT)
Message-ID: <cdf9e1c5-5418-4bb7-8ff0-75e34b55273b@ursulin.net>
Date: Tue, 23 Apr 2024 09:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Content-Language: en-GB
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
 <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
 <ZiAyUcuQtQ25xnWw@orsosgc001>
 <6ib4borj4paiuj5l6digeoc7mgnabtji6vtvdtvcafi64y3j3n@vqid357khkai>
 <c47f5e70-e09f-41e1-bc0a-b547475e17a1@ursulin.net>
 <ZiMDh2ddSsx+t+Qv@orsosgc001>
 <a8234a4b-df87-498f-b414-5f6a34fc9223@ursulin.net>
 <ZiabxU10TpNGzUgU@orsosgc001>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <ZiabxU10TpNGzUgU@orsosgc001>
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


On 22/04/2024 18:17, Umesh Nerlige Ramappa wrote:
> On Mon, Apr 22, 2024 at 11:40:33AM +0100, Tvrtko Ursulin wrote:
>>
>> On 20/04/2024 00:51, Umesh Nerlige Ramappa wrote:
>>> On Fri, Apr 19, 2024 at 11:44:46AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 18/04/2024 00:19, Lucas De Marchi wrote:
>>>>> On Wed, Apr 17, 2024 at 01:35:29PM GMT, Umesh Nerlige Ramappa wrote:
>>>>>> On Wed, Apr 17, 2024 at 02:05:40PM -0500, Lucas De Marchi wrote:
>>>>>>> On Wed, Apr 17, 2024 at 09:51:42AM GMT, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> On 16/04/2024 19:29, Lucas De Marchi wrote:
>>>>>>>>> On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>>
>>>>>>>>>> On 16/04/2024 14:51, Lucas De Marchi wrote:
>>>>>>>>>>> Forgot to Cc Michal, doing now.
>>>>>>>>>>>
>>>>>>>>>>> Lucas De Marchi
>>>>>>>>>>>
>>>>>>>>>>> On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>>>>>>>>>> On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>>>>>>>>>> Add per-client usage statistics to xe. This ports xe to 
>>>>>>>>>>>>>> use the common
>>>>>>>>>>>>>> method in drm to export the usage to userspace per client 
>>>>>>>>>>>>>> (where 1
>>>>>>>>>>>>>> client == 1 drm fd open).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> However insted of using the current format, this creates a 
>>>>>>>>>>>>>> new one with
>>>>>>>>>>>>>> the unit "ticks". The intention here is not to mix the GPU 
>>>>>>>>>>>>>> clock domain
>>>>>>>>>>>>>> with the CPU clock. It allows to cover a few more use 
>>>>>>>>>>>>>> cases without
>>>>>>>>>>>>>> extra complications.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Last patch was a quick implemenation of a gputop-like tool 
>>>>>>>>>>>>>> in python.
>>>>>>>>>>>>>> I ended doing it to cross check the gputop implementation. 
>>>>>>>>>>>>>> I's not
>>>>>>>>>>>>>> really meant to be applied here.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I tested this on DG2 and TGL with kmscube (console-only) 
>>>>>>>>>>>>>> and vkcube
>>>>>>>>>>>>>> (in a gnome session), but it would be good to soak this 
>>>>>>>>>>>>>> under more
>>>>>>>>>>>>>> tests. The biggest goal for this patch series right now is 
>>>>>>>>>>>>>> to get
>>>>>>>>>>>>>> consensus on the new UAPI.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> TODO: Add documentation on top with the new interface.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yeah a drm-usage-stats.rst patch would be nice to have in 
>>>>>>>>>>>>> the RFC so one does not have to look into the driver 
>>>>>>>>>>>>> implementation to discuss the proposed uapi.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Nevertheless I understand the proposal is to add this:
>>>>>>>>>>>>>
>>>>>>>>>>>>> drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>>>>>>>>>
>>>>>>>>>>>> yes, the gputop patch was more explicit about this. Should 
>>>>>>>>>>>> had added in
>>>>>>>>>>>> the kernel patch series too.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> That's two values per key. I guess "one key value pair for 
>>>>>>>>>>>>> per one line of text" does not get strictly broken and that 
>>>>>>>>>>>>> you propose a heuristics in parsing to detect that the 
>>>>>>>>>>>>> <RUNTIME> cannot be mis-interpreted as the unit?
>>>>>>>>>>>>
>>>>>>>>>>>> the current format is
>>>>>>>>>>>>
>>>>>>>>>>>>     drm-engine-<class>: <RUNTIME> ns
>>>>>>>>>>>>
>>>>>>>>>>>> the "ns" in the end should be parsed by userspace to know
>>>>>>>>>>>> what it is about.
>>>>>>>>>>
>>>>>>>>>> Right.
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Not sure it is a good idea though. If you instead added a 
>>>>>>>>>>>>> new key for the gpu time what would be the downside in your 
>>>>>>>>>>>>> view? Like:
>>>>>>>>>>>>>
>>>>>>>>>>>>> drm-engine-<class>: <uint> ticks
>>>>>>>>>>>>> drm-ticks-<class>: <uint>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Or maybe even obsfuscate/generalise as:
>>>>>>>>>>>>>
>>>>>>>>>>>>> drm-engine-<class>: <uint> gpu-time
>>>>>>>>>>>>> drm-gpu-time-<class>: <uint>
>>>>>>>>>>>>
>>>>>>>>>>>> I think both work, but I fail to see the advantage. This 
>>>>>>>>>>>> alternative is
>>>>>>>>>>>> slightly heavier on the parsing side since you have to 
>>>>>>>>>>>> correlate the
>>>>>>>>>>>> values from 2 keys, possibly dealing with them appearing in 
>>>>>>>>>>>> different
>>>>>>>>>>>> order. The only possible breakage remains with this 
>>>>>>>>>>>> alternative: if
>>>>>>>>>>>> userspace didn't parse the unit before. I checked nvtop and 
>>>>>>>>>>>> htop and
>>>>>>>>>>>> they were doing the right thing. I sent a fix to igt a few 
>>>>>>>>>>>> weeks back
>>>>>>>>>>>> for it to consider the unit:
>>>>>>>>>>>> https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>>>>>>>>>
>>>>>>>>>> Advantages are that "drm-engine-something: 1234 5678 ticks" 
>>>>>>>>>> isn't self-explanatory (intuitively humanly readable) and that 
>>>>>>>>>> it doesn't
>>>>>>>>>
>>>>>>>>> maybe I have a different expectation from procfs. When I do e.g.
>>>>>>>>>
>>>>>>>>> # cat /proc/self/stat
>>>>>>>>> 3861283 (cat) R 3861233 3861283 3861231 34816 3861283 4194304 
>>>>>>>>> 90 0 0 0 0 0 0 0 20 0 1 0 1321348797 8560640 384 
>>>>>>>>> 18446744073709551615 93979016876032 93979016892449 
>>>>>>>>> 140720658378704 0 0 0 0 0 0 0 0 0 17 51 0 0 0 0 0 
>>>>>>>>> 93979016907440 93979016908904 93979037196288 140720658380605 
>>>>>>>>> 140720658380625 140720658380625 140720658382827 0
>>>>>>>>>
>>>>>>>>> it doesn't seem to me "intuitively humanly readable" was the first
>>>>>>>>> concern for people adding files in procfs :)... I'd rather 
>>>>>>>>> think "machine
>>>>>>>>> readable" was more important.
>>>>>>>>
>>>>>>>> I think you are pushing the argument a bit now :) since IMO we 
>>>>>>>> should evaluate drm-usage-stats.rst proposal more in the context 
>>>>>>>> of drm-usage-stats and other fdinfo files, rather than the whole 
>>>>>>>> of procfs. In other words if there isn't a strong reason to 
>>>>>>>> regress this particular file lets not do it.
>>>>>>>
>>>>>>> :) I like pushing arguments if it helps revisit decisions (human vs
>>>>>>> machine readable for things in procfs). I'm not
>>>>>>> trying to push the 2 counter approaches though. I think other 
>>>>>>> reasons
>>>>>>> like discussed below are enough to consider the other keys.
>>>>>>>
>>>>>>> TBH I was reluctant at first to add a separate uapi rather than 
>>>>>>> re-using
>>>>>>> drm-engine- without realizing there was already a second one (not
>>>>>>> implemented in gputop).
>>>>>>>
>>>>>>> So AFAICS i915 and amdgpu use drm-engine-. msm and panfrost use
>>>>>>> drm-cycles + drm-maxfreq.  And none of them seem suitable to xe.
>>>>>>>
>>>>>>>>
>>>>>>>>>> diverge from the one value per key plus unit format. Latter we 
>>>>>>>>>> would then document clearly.
>>>>>>>>>>
>>>>>>>>>> Different keys potentially appearing in different order does 
>>>>>>>>>> not matter since userspace already has to handle that.
>>>>>>>>>>
>>>>>>>>>>>>> Potentially could also add a key saying how much wall time 
>>>>>>>>>>>>> is one unit of GPU time.
>>>>>>>>>>>>
>>>>>>>>>>>> I wouldn't add it really as it may not make sense depending 
>>>>>>>>>>>> on the
>>>>>>>>>>>> vendor and or usage. Examples: the gpu time may be different 
>>>>>>>>>>>> for
>>>>>>>>>>>> different engines depending on where they are located 
>>>>>>>>>>>> (tile/gt). The
>>>>>>>>>>>> correlation with CPU time is different when running in VF 
>>>>>>>>>>>> mode, and may
>>>>>>>>>>>> change in runtime depending on the number of VFs. +Michal.
>>>>>>>>>>
>>>>>>>>>> Yes, that's why I said "potentially", which was supposed to 
>>>>>>>>>> mean if and where it makes sense and perhaps adds value.
>>>>>>>>>>
>>>>>>>>>>>> Also, if the userspace side really wants to know (why would 
>>>>>>>>>>>> it?)
>>>>>>>>>>>> it could be just calculate from 2 samples (possibly repeated 
>>>>>>>>>>>> a few
>>>>>>>>>>>> times as it updates the output).
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Or.. would even the existing drm-cycles, plus abuse of 
>>>>>>>>>>>>> drm-maxfreq, work? Ticks == cycles, maxfreq == ticks per 
>>>>>>>>>>>>> wall second.
>>>>>>>>>>>>
>>>>>>>>>>>> I think it'd be up to gpu vendor what clock backs this time. 
>>>>>>>>>>>> For the
>>>>>>>>>>>> current Intel cards, it's the refclock and it doesn't vary the
>>>>>>>>>>>> frequency.
>>>>>>>>>>
>>>>>>>>>> Right, but that doesn't matter. What I was saying is that if 
>>>>>>>>>> you exposed ticks in drm-cycles and tick frequency in 
>>>>>>>>>> drm-maxfreq it would even work, no? (Assuming support for 
>>>>>>>>>> those two was actually in igt_drm_fdinfo/clients/gputop and 
>>>>>>>>>> could be used as fallback to time based stats.)
>>>>>>>>>
>>>>>>>>> oh... I was looking at the output for i915 and missed that we had
>>>>>>>>> drm-cycles as currently i915 doesn't use it. It seems to be a 
>>>>>>>>> similar
>>>>>>>>> thing. I agree the drm-maxfreq- is unfortunate and that we don't
>>>>>>>>> actually have support for that in gputop.
>>>>>>>>>
>>>>>>>>> So, instead of the 2 numbers + different unit, I can adapt this to
>>>>>>>>> rather use drm-cycles. However for maxfreq, it doesn't seem to be
>>>>>>>>> what we need since it doesn't scale for VF. It brings back the 
>>>>>>>>> cpu clock
>>>>>>>>> domain this series is trying to avoid. The difference is that 
>>>>>>>>> using
>>>>>>>>> drm-cycles- and drm-maxfreq- you are expecting the userspace to do
>>>>>>>>> (let me know if I interpreted the docs wrong):
>>>>>>>>>
>>>>>>>>>     s1 = sample()
>>>>>>>>>     sleep(period)
>>>>>>>>>     s2 = sample()
>>>>>>>>>     engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) - 
>>>>>>>>> (s1.drm_cycles * s1.drm_max_freq)) / period
>>>>>>>>>
>>>>>>>>> ... considering the drm_max_freq may change from one call to 
>>>>>>>>> the other.
>>>>>>>>> if we simplify it and assume it doesn't change:
>>>>>>>>>
>>>>>>>>>     engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * 
>>>>>>>>> drm_max_freq) / period
>>>>>>>>>
>>>>>>>>> we'd need different drm_max_freq reported on VF driver that 
>>>>>>>>> would need
>>>>>>>>> to know the number of VFs enabled to scaled it correctly. Maybe 
>>>>>>>>> this is
>>>>>>>>> abusing the "drm-maxfreq" a little bit?
>>>>>>>>
>>>>>>>> Yes it would be bad if the observed VF GPU clock will be 
>>>>>>>> variable since maxfreq is supposed to be static.
>>>>>>>>
>>>>>>>> So on VFs would reported GPU clock moves by the VF "used" quanta?
>>>>>>>
>>>>>>> s/used/available/. That's my understanding, yes. Each VF has a 
>>>>>>> quanta
>>>>>>> and the gpu clock moves according to that quanta.  Note that as I 
>>>>>>> said,
>>>>>>> this is not the case right now (we are just reading 
>>>>>>> RING_TIMESTAMP), but
>>>>>>> the intention is to have the UAPI side ready so it's already 
>>>>>>> prepared
>>>>>>> for that.
>>>>>>>
>>>>>>>> Where "used" is defined as time given by the GuC, not 
>>>>>>>> necessarily used
>>>>>>>
>>>>>>> s/used/available/ as above
>>>>>>>
>>>>>>>> GPU time. For instance 16ms quanta, VF GPU clock would move by 
>>>>>>>> 16ms if the GuC decides not to switch out the idle VF? Or it 
>>>>>>>> could move by less than 16ms if it switched it out earlier.
>>>>>>>
>>>>>>> no, afaiu it's 16ms, not less. But the quanta depends on the 
>>>>>>> number of
>>>>>>> VFs enabled, which may change in runtime.
>>>>>>>
>>>>>>> I'm not 100% certain and people in Cc may correct me.
>>>>>>>
>>>>>>>>
>>>>>>>>> What if we had
>>>>>>>>>
>>>>>>>>> drm-cycles-<keystr>: <uint>
>>>>>>>>> drm-total-cycles-<keystr>: <uint>
>>>>>>>>>
>>>>>>>>> Then the utilization can be done:
>>>>>>>>>
>>>>>>>>>     s1 = sample()
>>>>>>>>>     sleep(period)
>>>>>>>>>     s2 = sample()
>>>>>>>>>     engine_utilization = (s2.cycles - s1.cycles) / \
>>>>>>>>>                  (s2.total_cycles - s1.total_cycles + 1);
>>>>>>>>>
>>>>>>>>> Capacity still to be added above, but we'd need to clarify if
>>>>>>>>> drm-total-cycles-<keystr> already accounts for it.
>>>>>>>>>
>>>>>>>>> Here instead of the conversion to cpu clock, I'm expecting to read
>>>>>>>>> "total_cycles" from HW and that being different (slower) for VF.
>>>>>>>>> AFAICS this is not the case with this current polling 
>>>>>>>>> implementation
>>>>>>>>> since we are simply reading the RING_TIMESTAMP, but there are 
>>>>>>>>> planned
>>>>>>>>> changes to get it from GuC. Umesh/Michal Cc'ed may know better.
>>>>>>>>
>>>>>>>> I think this works and is clean.
>>>>>>>>
>>>>>>>> Although I have some doubts about the usefulness on VFs, if the 
>>>>>>>> clock movements are at the mercy of the GuC scheduler. Like what 
>>>>>>>> does 100% mean for a VF? Maybe it was full quanta, or maybe it 
>>>>>>>> was half a quanta if GuC decided to switch it out early, either 
>>>>>>>> due going idle or due some other scheduling decision.
>>>>>>>
>>>>>>> in the scenario you described above the quanta could change 
>>>>>>> according to
>>>>>>> the scheduler and 100% wouldn't mean much. That's not my 
>>>>>>> understanding.
>>>>>>> 100% always mean the VF used all the allocated time. I see this line
>>>>>>> potentially getting blurred a little bit if the scheduler tries to
>>>>>>> maximize the HW usage and distribute quanta unevenly, but I think 
>>>>>>> the
>>>>>>> interface already contemplates that.
>>>>>>>
>>>>>>> Another case is the VF not being able to reach 100% because the 
>>>>>>> PF is
>>>>>>> submitting high prio work. But I still think the current 
>>>>>>> interface is
>>>>>>> sufficient and it's the implementation by GuC/HW that could be 
>>>>>>> improved
>>>>>>> (e.g. adapting the gpu time reported).
>>>>>>>
>>>>>>> Michal / Umesh, please chime in if that is not accurate.
>>>>>>>
>>>>>>
>>>>>> Irrespective of how much quanta a VF used, all calculations will 
>>>>>> be based on the quanta that it was allocated. That way the VF 
>>>>>> would know that it could have better utilized the allotted time if 
>>>>>> busyness is less than 100. This does result in more than 100% 
>>>>>> usage for a VF that was resource hungry and scheduling policies 
>>>>>> allowed it to run more than the allotted quanta, but this is a 
>>>>>> known limitation of the solution provided by GuC. When looking at 
>>>>>> the overall system (say from a PF), the usage should still add up 
>>>>>> to 100%.
>>>>>>
>>>>>>>
>>>>>>> Thinking out loud: IFF the execution quanta is available for VF 
>>>>>>> to query
>>>>>>
>>>>>> For the VF, GuC intends to provide a factor that can be used to 
>>>>>> scale the wall time and deduce the VF quanta. This scaled value is 
>>>>>> used as the second counter in a VF.
>>>>>>> and we are ok with just scaling drm-maxfreq, then maybe we could 
>>>>>>> even
>>>>>>> just use the current interface instead of adding a third one. 
>>>>>>> Although
>>>>>>> it could be confusing to have a that freq changing.
>>>>>>
>>>>>> Assuming you are talking about using the drm-cycles and 
>>>>>> drm-max-freq. One of the concerns when supporting VFs was that we 
>>>>>> cannot actually export busyness in absolute time units to the user 
>>>>>> because the GPU is shared across VFs. If we scale the busyness 
>>>>>> such that it is stretched across CPU time, then it helps get the 
>>>>>> right busyness % relative to CPU time, but the value of busyness 
>>>>>> in time units itself is false. This was the primary reason to use 
>>>>>> 2 "unitless" counters.
>>>>>>
>>>>>> fwiu, I think by using the drm-maxfreq, you are going to bring the 
>>>>>> same concept back in the discussion - exporting busyness in time 
>>>>>> units. Not sure if that's a good idea. Let me know if I got that 
>>>>>> wrong.
>>>>>
>>>>> no, but I think it would still work if we can scale the freq 
>>>>> according to
>>>>> the quanta.  But that's probably abusing the interface.
>>>>>
>>>>> Anyway I think we are settling on
>>>>>
>>>>>     drm-cycles-<engineclass>
>>>>>     drm-total-cycles-<engineclass>
>>>>>
>>>>> so I will start changing the patches and igt while checking this for
>>>>> more feedback if any.
>>>> Another option came to mind - expose a quanta ratio as a new key. 
>>>> Given it has no security implications and is to be used only for 
>>>> calculating real VFs GPU utilisation. Like:
>>>>
>>>> drm-engine-*: <uint> ns
>>>> drm-engine-time-ratio-*: <float>
>>>>
>>>> Unit would be a ratio of time over quanta, for instance 1000ms / 
>>>> 100ms = 10. Which would mean scale down reported time by 10 when 
>>>> comparing against wall time.
>>>>
>>>> New key would only appear on VFs. Otherwise assumed 1.
>>>>
>>>> Or could be avoided per engine and just have single global:
>>>>
>>>> drm-gpu-time-ratio: <float>
>>>>
>>>> Am I missing something or that could work? It would have the same 
>>>> problem as above mentioned "could go over 100%" is one. I mean this 
>>>> comment:
>>>
>>> I am hesitant to expose the quanta ratio at this level. We get that 
>>> from GuC and that interface could potentially change. If that 
>>> happens, I'd prefer that the uApi is unaffected.
>>
>> FWIW this idea was simply a time scale factor and I don't think it 
>> should have a connection to any GuC implementation details. In other 
>> words the observable result of time*scale/elapsed-time vs 
>> ticks/total-ticks should be the same. At least with the semantics that 
>> were discussed in this thread.
>>
> 
> For the drm client busyness that we are discussing here, the VF specific 
> interface is still wip. The quanta ratio is more of a engine busyness 
> concept (see below) that I presume will be used here as well.

I did not follow you here.

Current proposal for withing a VF per client view settled at drm-cycles 
and drm-total-cycles, where the latter was explained will move by the 
amount of GPU ticks in the VFs assigned quanta and be static.

I was just mentioning one idea for an alternative which is time based 
and AFAICT behaves the same.

Doesn't matter much since in both cases we are talking about one new 
key, but may be handy if you start with the elapsed time based key for a 
PF and then later, for VF support, just add one new key 
(drm-gpu-time-ratio), instead of VF using a different pair 
(cyles+total-cycles) than the PF (drm-engine-*).

>>>> """
>>>> Irrespective of how much quanta a VF used, all calculations will be
>>>> based on the quanta that it was allocated.
>>>> ...
>>>> This does result in more than 100% usage for a VF that
>>>> was resource hungry and scheduling policies allowed it to run more
>>>> than the allotted quanta,
>>>> """
>>>>
>>>> I read that as total-ticks would never be reported as above the 
>>>> configure quanta - always equal.
>>>
>>> Correct
>>>
>>>> Maybe I misunderstood?
>>>>
>>>> Second topic - are there any plans to allow the PF to monitor VF GPU 
>>>> utilisation? That wouldn't work via fdinfo aggregation since VF 
>>>> clients will not be visibible in a PF. But it sounds like a basic 
>>>> and important use case.
>>>
>>> wip. Engine utilization will be available per-VF from PF.
>>
>> How it will be exposed out of curiosity?
> 
> This would be supported only at the engine level granularity. Client 
> level, like you mention, is not possible.
> 
> Like here, the % engine busyness is exposed as 2 counters - 
> engine_runtime (how long the engine ran) and total_ticks (how long the 
> PF/VF ran).  Internally GuC provides the engine_runtime in ticks and KMD 
> derives total_ticks from quanta_ratio and elapsed_cpu_time.
> 
> That information is available to PF as an array of functions that can be 
> indexed using function index.
> 
> A global busyness is also available (aggregate of all functions).
> 
> Reg: KMD<->UMD interface,
> 
> 1) 2 counters are exported via the PMU interface.
> 2) Function index will be part of the config bitmap used with the 
> perf_event_open.
> 
> I don't know yet if we will end up using kernel perf interface for this 
> on XE (separate topic though).

Right, it is the PMU or not PMU part I was most interested it. I think 
be careful with the choice since at the moment as you know we have a 
known unfixed bug in the i915 PMU and driver unbind. Until we can fix 
that somehow it would be questionable to add a new driver with that 
known weakness.

Regards,

Tvrtko
