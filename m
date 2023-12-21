Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BDC35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 09:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F5E10E6C2;
	Thu, 21 Dec 2023 09:36:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CFE10E6B6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703151405; x=1734687405;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZZIsvRlk8VAmwycPJ74vCd6QO4Yh/zBUTWPBgp/xe9c=;
 b=TTnyeA9P+Au6aKmMUWFRUic4equToQZU7qXbq7+FOn9b/dUH6hST2r9V
 khGodtvYtLIP9DCTqRJLAp4ao+k1N59MJ9CEaBwIz7xscJtvMWDOMYapW
 TuIAGO+pCr2W9sEfKH+gC6QWWrrCifxjYZi0IxQdtrrqibbDLyp/lrakU
 Z+aynGQhdCJ7Fgrd4cFYz5DGwYwrZAD7JnW4Qfq2mnBVepOAiwKmTxzLN
 zg+kAYJmsPMbii2E+1JZzAFodV5bCRgAr3SsWzSx2q1c75c48PLGYQ24n
 yae0yZI0WO77A0uyp62HWnen/2kc034QogJ5lS/FRRCk6jMcdPpXINEU5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="394840698"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="394840698"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="847056185"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="847056185"
Received: from amcgui4x-mobl.ger.corp.intel.com (HELO [10.213.235.205])
 ([10.213.235.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:36:43 -0800
Message-ID: <ebcec5e0-236c-4cd9-b676-d7ca7d46cb10@linux.intel.com>
Date: Thu, 21 Dec 2023 09:36:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Engine Busyness
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
 <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
 <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
 <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
 <ZYN/mkkRT+oFJLSo@unerlige-ril>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZYN/mkkRT+oFJLSo@unerlige-ril>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 20/12/2023 23:58, Umesh Nerlige Ramappa wrote:
> On Wed, Dec 20, 2023 at 09:00:34AM +0000, Tvrtko Ursulin wrote:
>>
>> On 20/12/2023 05:36, Umesh Nerlige Ramappa wrote:
>>> On Thu, Dec 14, 2023 at 08:06:46AM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
>>>>> On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 07/12/2023 12:57, Riana Tauro wrote:
>>>>>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>>>>>> as clock ticks. These counters are maintained in a
>>>>>>> shared memory buffer and internally updated on a continuous basis.
>>>>>>>
>>>>>>> GuC also provides a periodically total active ticks that GT has been
>>>>>>> active for. This counter is exposed to the user such that 
>>>>>>> busyness can
>>>>>>> be calculated as a percentage using
>>>>>>>
>>>>>>> busyness % = (engine active ticks/total active ticks) * 100.
>>>>>>
>>>>>> I think I've asked this before but don't remember it was clarified 
>>>>>> - what are the semantics of "active" with total active ticks? In 
>>>>>> other words considering activity timelines like:
>>>>>>
>>>>>> 1)
>>>>>>     0          1s
>>>>>> rcs0 |xxxxx-----|
>>>>>> bcs0 |-----xxxxx|
>>>>>>
>>>>>> 2)
>>>>>>     0          1s
>>>>>> rcs0 |xxxxx-----|
>>>>>> bcs0 |xxxxx-----|
>>>>>>
>>>>>> Assuming 1s sampling, would the above formula correctly say 50% 
>>>>>> for both engines in both cases?
>>>>>
>>>>> Yes. What is the significance of case 2? Are you saying rcs and bcs 
>>>>> are executing in parallel?
>>>>
>>>> In parallel yes. Complete overlap, no overlap, or any overlap of 
>>>> activity in between the two.
>>>
>>> GuC accumulates this on context switches, so the overlap does not 
>>> matter.
>>>
>>>>
>>>>> Either ways, when total active ticks is queried it would provide 
>>>>> the latest value of the active time (does not depend on gt 
>>>>> park/unpark since the value is either obtained on demand from GuC 
>>>>> or is a value that is frequently updated by GuC.
>>>>>
>>>>> The duration of context (in to out) is accumulated for the each 
>>>>> engine.
>>>>
>>>> But why is the total *active* tick moving during the 0.5s - 1s time 
>>>> of the 2nd diagram though? What does it mean by "active" if nothing 
>>>> was active during that period?
>>>
>>> VF was still using it's allotted time and hence was active.
>>
>> And if we leave SR-IOV out for a moment?
> 
> Then it is just a periodically sampled (by GuC) value of GT ticks. The 
> period being 100ms.
> 
>>
>> "GuC also provides a periodically total active ticks that GT has been 
>> active for."
>>
>> How many time worth of total GT active ticks does GuC report in 
>> diagram 2 above?
> 
> Every 100ms we would see an updated value. For the duration of 0.5s, it 
> would be 500ms. Sampled at 1s, it will be 1000ms. Until 0.5s it should 
> be 100% busyness but there is an error margin of 100ms. From then on, 
> the busyness % will decrease as time progresses. The error margin is 
> more pronounced for very short workloads, so IGTs were changed to use 2s 
> batch durations rather than 500ms. Haven't checked if IGTs have been 
> posted yet though.

Sorry somehow it is still not clear to me. :)

GuC updates the GT total active ticks _constantly_? With a 100ms 
sampling so like:

a)

  while (true)
    if (gt_active)
       gt_total_active += 100ms
    sleep(100ms)

Or b):

  while (true)
    gt_total_active += 100ms
    sleep(100ms)


?

If a) then diagram 2) above would show 50% rcs0, no? (When sampled at 
T=0 and T=1s and deltas calculated.)

If b) then "...total active ticks that GT has been active for." uses a 
different definition of "GT active" than I am assuming? Like no relation 
to whether any of the engines is used, just the fact GuC is loaded and 
running?

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
>>>
>>> Regards,
>>> Umesh
>>>
>>>>
>>>>>> I am also curious if there are plans to add support to 
>>>>>> intel_gpu_top in which case please copy me on the required 
>>>>>> refactorings.
>>>>>>
>>>>>
>>>>> Certainly. It's in the works.
>>>>
>>>> Cool.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
