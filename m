Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E83CC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 08:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4710E8F8;
	Thu, 14 Dec 2023 08:06:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC4E10E8F4
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702541210; x=1734077210;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iiyYFSVfI2uG6jA5at9R59OBRQqZK41Xf4Wghc6m4ag=;
 b=DtgCVkizQyrk5I458blgEo0r+GbLGmaAcO4BAc/3Uvix3MzT3UcBt1Bc
 wCZ7B7PsZYpAs7X/QM386y1FKDDrTcYK9Db0pjf0ioFOMqiLGPFEHXdsz
 L6jGYXlme+vFaHVsbQHqGHqBhtlRfZcVYzLRriMo5Kvove8hrd2Tntbkk
 eAAKjfhvACRq2alwWBpiNOC58a91pR54mNLEMcwE97t9tXcunnpy9yvip
 J+x976IHfUP/c0ndAdsr1M+1nWscDSFZf9u+86OnDq1qPJZQ1K1FhfFFD
 A2btJh2Vzv4ye+xZf2qA1oE5SW2z9etv1Qq/fF8LVac/LpPDh1IFTUWa2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2239531"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="2239531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 00:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="892351474"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="892351474"
Received: from viveks6x-mobl.ger.corp.intel.com (HELO [10.213.205.47])
 ([10.213.205.47])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 00:06:48 -0800
Message-ID: <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
Date: Thu, 14 Dec 2023 08:06:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Engine Busyness
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZXpgwiRQ7z3cTE3V@unerlige-ril>
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


On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> On 07/12/2023 12:57, Riana Tauro wrote:
>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>> as clock ticks. These counters are maintained in a
>>> shared memory buffer and internally updated on a continuous basis.
>>>
>>> GuC also provides a periodically total active ticks that GT has been
>>> active for. This counter is exposed to the user such that busyness can
>>> be calculated as a percentage using
>>>
>>> busyness % = (engine active ticks/total active ticks) * 100.
>>
>> I think I've asked this before but don't remember it was clarified - 
>> what are the semantics of "active" with total active ticks? In other 
>> words considering activity timelines like:
>>
>> 1)
>>     0          1s
>> rcs0 |xxxxx-----|
>> bcs0 |-----xxxxx|
>>
>> 2)
>>     0          1s
>> rcs0 |xxxxx-----|
>> bcs0 |xxxxx-----|
>>
>> Assuming 1s sampling, would the above formula correctly say 50% for 
>> both engines in both cases?
> 
> Yes. What is the significance of case 2? Are you saying rcs and bcs are 
> executing in parallel?

In parallel yes. Complete overlap, no overlap, or any overlap of 
activity in between the two.

> Either ways, when total active ticks is queried it would provide the 
> latest value of the active time (does not depend on gt park/unpark since 
> the value is either obtained on demand from GuC or is a value that is 
> frequently updated by GuC.
> 
> The duration of context (in to out) is accumulated for the each engine.

But why is the total *active* tick moving during the 0.5s - 1s time of 
the 2nd diagram though? What does it mean by "active" if nothing was 
active during that period?

>> I am also curious if there are plans to add support to intel_gpu_top 
>> in which case please copy me on the required refactorings.
>>
> 
> Certainly. It's in the works.

Cool.

Regards,

Tvrtko
