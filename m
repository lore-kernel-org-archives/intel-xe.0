Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323BBC46CCD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 09:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FAD10E1D4;
	Wed, 20 Dec 2023 09:00:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00B010E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 09:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703062836; x=1734598836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VEBTyAQcxQsNbyLnk8ohz5KMUla+tRVn4Gv0EnShsnA=;
 b=lxI/cLmIoVO1tu8cragZwvubhdSpqSIscil9BX+x+VUnn8JoJMGocGug
 z1y4rarlbeo3CBd88ePlFwGV6/Kjq/eaw1c6n9hY7DfXZ7UlWny97gQhQ
 mEHuSKGKXeKryEX05IIX7vnaARCf1ozLTV8yOOCNjkO2zY59hsVAcMJLH
 WdCdTII9QX0MKdzTCT6fWQv6/wLzOegn00IhV5m0jv1Eb63t4kWUcajBo
 axw2RM30LFGrzuz32WmCDi6sphAoYjMyziLnetHrplgd94hUJjg+eGAoL
 rQkezz1bxciVX3sFqGYuzMbmMQ/mYPiyZKHpJN1N1/f/rx+bh7AIObvHj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="462236248"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="462236248"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 01:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769519603"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="769519603"
Received: from avancaux-mobl.ger.corp.intel.com (HELO [10.213.219.17])
 ([10.213.219.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 01:00:36 -0800
Message-ID: <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
Date: Wed, 20 Dec 2023 09:00:34 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
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


On 20/12/2023 05:36, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 14, 2023 at 08:06:46AM +0000, Tvrtko Ursulin wrote:
>>
>> On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
>>> On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 07/12/2023 12:57, Riana Tauro wrote:
>>>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>>>> as clock ticks. These counters are maintained in a
>>>>> shared memory buffer and internally updated on a continuous basis.
>>>>>
>>>>> GuC also provides a periodically total active ticks that GT has been
>>>>> active for. This counter is exposed to the user such that busyness can
>>>>> be calculated as a percentage using
>>>>>
>>>>> busyness % = (engine active ticks/total active ticks) * 100.
>>>>
>>>> I think I've asked this before but don't remember it was clarified - 
>>>> what are the semantics of "active" with total active ticks? In other 
>>>> words considering activity timelines like:
>>>>
>>>> 1)
>>>>     0          1s
>>>> rcs0 |xxxxx-----|
>>>> bcs0 |-----xxxxx|
>>>>
>>>> 2)
>>>>     0          1s
>>>> rcs0 |xxxxx-----|
>>>> bcs0 |xxxxx-----|
>>>>
>>>> Assuming 1s sampling, would the above formula correctly say 50% for 
>>>> both engines in both cases?
>>>
>>> Yes. What is the significance of case 2? Are you saying rcs and bcs 
>>> are executing in parallel?
>>
>> In parallel yes. Complete overlap, no overlap, or any overlap of 
>> activity in between the two.
> 
> GuC accumulates this on context switches, so the overlap does not matter.
> 
>>
>>> Either ways, when total active ticks is queried it would provide the 
>>> latest value of the active time (does not depend on gt park/unpark 
>>> since the value is either obtained on demand from GuC or is a value 
>>> that is frequently updated by GuC.
>>>
>>> The duration of context (in to out) is accumulated for the each engine.
>>
>> But why is the total *active* tick moving during the 0.5s - 1s time of 
>> the 2nd diagram though? What does it mean by "active" if nothing was 
>> active during that period?
> 
> VF was still using it's allotted time and hence was active.

And if we leave SR-IOV out for a moment?

"GuC also provides a periodically total active ticks that GT has been 
active for."

How many time worth of total GT active ticks does GuC report in diagram 
2 above?

Regards,

Tvrtko

> 
> Regards,
> Umesh
> 
>>
>>>> I am also curious if there are plans to add support to intel_gpu_top 
>>>> in which case please copy me on the required refactorings.
>>>>
>>>
>>> Certainly. It's in the works.
>>
>> Cool.
>>
>> Regards,
>>
>> Tvrtko
