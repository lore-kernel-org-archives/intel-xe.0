Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB91C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 09:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25A10E77C;
	Fri, 22 Dec 2023 09:41:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7591210E763
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 09:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703238109; x=1734774109;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w0SZiGICZmAEm2M6xq/SK/8/pZ0PHobSw8ADDzcD8gA=;
 b=H12p+lL6sov483ANgJ1CcE0e24SZKTlHWpnsk86tA3tdAxr+pvQOztp2
 sNknmIqNq69YFjG1pXLO9Or0aOzE6WbiQ+SdTGcWrvXW6vP+SJABM6//J
 opnrQxOfp+FVix/SSETCk3RegWMdi1CjkQwuZr9owChh2T8tkAHFd9hwi
 90CDz41jqnLMV7/CLhG4/wfGpe/JUzUCfyi8X0KHWUQgspxhDoyAXzCLx
 DUP4nvEMWg561XCR/z8udXPdVhD3K9+kbMHdp/GjzFzgDqU1uaxLkkbA+
 2Pwy/Z/MDMkBGpmAnCfe+ncK7k4j1VnznBlrQBtirt9S9s22RFc8QYVyQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="395837779"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="395837779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 01:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900376205"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="900376205"
Received: from rajvende-mobl1.ger.corp.intel.com (HELO [10.213.219.31])
 ([10.213.219.31])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 01:41:47 -0800
Message-ID: <78064135-b8d6-4394-a3d5-379803463cbd@linux.intel.com>
Date: Fri, 22 Dec 2023 09:41:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Engine Busyness
Content-Language: en-US
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
 <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
 <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
 <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
 <ZYN/mkkRT+oFJLSo@unerlige-ril>
 <ebcec5e0-236c-4cd9-b676-d7ca7d46cb10@linux.intel.com>
 <B7964DAC-797C-4E73-9140-A1DEE800389B@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <B7964DAC-797C-4E73-9140-A1DEE800389B@intel.com>
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 21/12/2023 13:17, Nerlige Ramappa, Umesh wrote:
>> On Dec 21, 2023, at 1:36 AM, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> ﻿
>>> On 20/12/2023 23:58, Umesh Nerlige Ramappa wrote:
>>>> On Wed, Dec 20, 2023 at 09:00:34AM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 20/12/2023 05:36, Umesh Nerlige Ramappa wrote:
>>>>> On Thu, Dec 14, 2023 at 08:06:46AM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
>>>>>>> On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 07/12/2023 12:57, Riana Tauro wrote:
>>>>>>>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>>>>>>>> as clock ticks. These counters are maintained in a
>>>>>>>>> shared memory buffer and internally updated on a continuous basis.
>>>>>>>>>
>>>>>>>>> GuC also provides a periodically total active ticks that GT has been
>>>>>>>>> active for. This counter is exposed to the user such that busyness can
>>>>>>>>> be calculated as a percentage using
>>>>>>>>>
>>>>>>>>> busyness % = (engine active ticks/total active ticks) * 100.
>>>>>>>>
>>>>>>>> I think I've asked this before but don't remember it was clarified - what are the semantics of "active" with total active ticks? In other words considering activity timelines like:
>>>>>>>>
>>>>>>>> 1)
>>>>>>>>      0          1s
>>>>>>>> rcs0 |xxxxx-----|
>>>>>>>> bcs0 |-----xxxxx|
>>>>>>>>
>>>>>>>> 2)
>>>>>>>>      0          1s
>>>>>>>> rcs0 |xxxxx-----|
>>>>>>>> bcs0 |xxxxx-----|
>>>>>>>>
>>>>>>>> Assuming 1s sampling, would the above formula correctly say 50% for both engines in both cases?
>>>>>>>
>>>>>>> Yes. What is the significance of case 2? Are you saying rcs and bcs are executing in parallel?
>>>>>>
>>>>>> In parallel yes. Complete overlap, no overlap, or any overlap of activity in between the two.
>>>>>
>>>>> GuC accumulates this on context switches, so the overlap does not matter.
>>>>>
>>>>>>
>>>>>>> Either ways, when total active ticks is queried it would provide the latest value of the active time (does not depend on gt park/unpark since the value is either obtained on demand from GuC or is a value that is frequently updated by GuC.
>>>>>>>
>>>>>>> The duration of context (in to out) is accumulated for the each engine.
>>>>>>
>>>>>> But why is the total *active* tick moving during the 0.5s - 1s time of the 2nd diagram though? What does it mean by "active" if nothing was active during that period?
>>>>>
>>>>> VF was still using it's allotted time and hence was active.
>>>>
>>>> And if we leave SR-IOV out for a moment?
>>> Then it is just a periodically sampled (by GuC) value of GT ticks. The period being 100ms.
>>>>
>>>> "GuC also provides a periodically total active ticks that GT has been active for."
>>>>
>>>> How many time worth of total GT active ticks does GuC report in diagram 2 above?
>>> Every 100ms we would see an updated value. For the duration of 0.5s, it would be 500ms. Sampled at 1s, it will be 1000ms. Until 0.5s it should be 100% busyness but there is an error margin of 100ms. From then on, the busyness % will decrease as time progresses. The error margin is more pronounced for very short workloads, so IGTs were changed to use 2s batch durations rather than 500ms. Haven't checked if IGTs have been posted yet though.
>>
>> Sorry somehow it is still not clear to me. :)
>>
>> GuC updates the GT total active ticks _constantly_? With a 100ms sampling so like:
>>
>> a)
>>
>> while (true)
>>    if (gt_active)
>>       gt_total_active += 100ms
>>    sleep(100ms)
>>
>> Or b):
>>
>> while (true)
>>    gt_total_active += 100ms
>>    sleep(100ms)
>>
>>
>> ?
>>
>> If a) then diagram 2) above would show 50% rcs0, no? (When sampled at T=0 and T=1s and deltas calculated.)
>>
>> If b) then "...total active ticks that GT has been active for." uses a different definition of "GT active" than I am assuming? Like no relation to whether any of the engines is used, just the fact GuC is loaded and running?
> 
> it's (b). Correct, maybe the comment should be changed to reflect this.

Ah cool then and yes, possibly not call it "gt active time" but simply 
some sort of a clock. Is it a GT or GuC clock and when it resets would 
determine the exact best naming.

Regards,

Tvrtko

> 
> Regards,
> Umesh
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Regards,
>>> Umesh
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>> Regards,
>>>>> Umesh
>>>>>
>>>>>>
>>>>>>>> I am also curious if there are plans to add support to intel_gpu_top in which case please copy me on the required refactorings.
>>>>>>>>
>>>>>>>
>>>>>>> Certainly. It's in the works.
>>>>>>
>>>>>> Cool.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
