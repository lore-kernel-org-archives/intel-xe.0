Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFB0C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 03:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618310E7AE;
	Fri,  1 Dec 2023 03:34:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752F810E7AE
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701401666; x=1732937666;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=+WqHYYJy4HrwniCxRisg34qjLG8hsE8Ql0mw4En2eJo=;
 b=VayQFlBd5zsenIA7mnntevQRgu1P7E4z7SwiYjQvwrQNWupIPGoUn6YB
 n7JMK05S/6ejlT9VqQPf0tCoicr7Yi47hyOXK/9ReIazYjcbko/IZFtwp
 4fwxFyJMJHVj0lJmHfuYOUmXCtSHyQjlZBDYSMBMqN9Ptg/mSg8nDGGxV
 wy1iGiy2N7cwhqSRsTCtq0ZwdSRwGti8gufm9eXldoVoh4L+JJNN9YwvW
 WysPm/v9g1eXNdR01zXkyn/pY7M630y+08wbsr6k4/3sAyH9zAyXhnSRe
 IKX4WMZMAba8hU9/LLDxrtFelotdzZt3VYfxVF+ksh/c92AjoNHo50ptl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6706883"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="6706883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 19:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="11016182"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 19:34:25 -0800
Message-ID: <6b424aa5-a7d6-4cf1-8ee9-0b0833b8940c@linux.intel.com>
Date: Fri, 1 Dec 2023 09:07:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231124064408.1800646-1-aravind.iddamsetty@linux.intel.com>
 <ZWBOc5WgvgDLUBqG@intel.com>
 <2b803ed4-80f9-49da-b528-9c2938bda7ad@linux.intel.com>
 <ZWBgySP7nSmGbfAd@intel.com>
 <38943a25-d38f-4753-b2fb-6e5034d868ab@linux.intel.com>
In-Reply-To: <38943a25-d38f-4753-b2fb-6e5034d868ab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
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


On 11/28/23 14:00, Aravind Iddamsetty wrote:
> On 11/24/23 14:07, Ville Syrjälä wrote:
>> On Fri, Nov 24, 2023 at 02:01:27PM +0530, Aravind Iddamsetty wrote:
>>> On 11/24/23 12:49, Ville Syrjälä wrote:
>>>> On Fri, Nov 24, 2023 at 12:14:08PM +0530, Aravind Iddamsetty wrote:
>>>>> Introduce atomic version for xe_force_wake calls which uses spin_lock
>>>>> while the non atomic version uses spin_lock_irq
>>>>>
>>>>> Fix for below:
>>>>> [13994.811263] ========================================================
>>>>> [13994.811295] WARNING: possible irq lock inversion dependency detected
>>>>> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
>>>>> [13994.811358] --------------------------------------------------------
>>>>> [13994.811388] swapper/0/0 just changed the state of lock:
>>>>> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
>>>>> __perf_event_read+0xb7/0x3a0
>>>>> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
>>>>> past:
>>>>> [13994.811528]  (&fw->lock){+.+.}-{2:2}
>>>>> [13994.811544]
>>>>>
>>>>>                and interrupts could create inverse lock ordering between
>>>>> them.
>>>>>
>>>>> [13994.811606]
>>>>>                other info that might help us debug this:
>>>>> [13994.811636]  Possible interrupt unsafe locking scenario:
>>>>>
>>>>> [13994.811667]        CPU0                    CPU1
>>>>> [13994.811691]        ----                    ----
>>>>> [13994.811715]   lock(&fw->lock);
>>>>> [13994.811744]                                local_irq_disable();
>>>>> [13994.811773]                                lock(&cpuctx_lock);
>>>>> [13994.811810]                                lock(&fw->lock);
>>>>> [13994.811846]   <Interrupt>
>>>>> [13994.811865]     lock(&cpuctx_lock);
>>>>> [13994.811895]
>>>>>                 *** DEADLOCK ***
>>>>>
>>>>> v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
>>>>> context (Matthew Brost)
>>>> No idea what this "atomic context" means, but looks like
>>>> you just want to use spin_lock_irqsave() & co.
>>> atomic context: where sleeping is not allowed.
>> That has nothing to do with your lockdep spew. Also spinlocks don't
>> sleep by definition (if we ignore the RT spinlock->mutex magic).
>>
>>> Well that is what I had in
>>> v1 and Matt suggested we should explicitly know from where we are calling
>>> force wake and depending on it use spin_lock or spin_lock_irq versions.
>> Duplicating tons of code for that is silly. I seriously doubt someone
>> benchmarked this and saw a meaningful improvement from skipping the
>> save/restore.
> @Matt any thoughts ?


for now I'll revert back to V1 of the series which uses save/restore calls. if we
see any performance issues we can come back to this again.

Thanks,
Aravind.
>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_force_wake.c | 62 +++++++++++++++++++++++++++++-
>>>>>  drivers/gpu/drm/xe/xe_force_wake.h |  4 ++
>>>>>  drivers/gpu/drm/xe/xe_pmu.c        |  4 +-
>>>>>  3 files changed, 66 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> index 32d6c4dd2807..1693097f72d3 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>> @@ -147,7 +147,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>  	enum xe_force_wake_domains tmp, woken = 0;
>>>>>  	int ret, ret2 = 0;
>>>>>  
>>>>> -	spin_lock(&fw->lock);
>>>>> +	spin_lock_irq(&fw->lock);
>>>>>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>  		if (!domain->ref++) {
>>>>>  			woken |= BIT(domain->id);
>>>>> @@ -162,7 +162,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>  				   domain->id, ret);
>>>>>  	}
>>>>>  	fw->awake_domains |= woken;
>>>>> -	spin_unlock(&fw->lock);
>>>>> +	spin_unlock_irq(&fw->lock);
>>>>>  
>>>>>  	return ret2;
>>>>>  }
>>>>> @@ -176,6 +176,64 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>  	enum xe_force_wake_domains tmp, sleep = 0;
>>>>>  	int ret, ret2 = 0;
>>>>>  
>>>>> +	spin_lock_irq(&fw->lock);
>>>>> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>> +		if (!--domain->ref) {
>>>>> +			sleep |= BIT(domain->id);
>>>>> +			domain_sleep(gt, domain);
>>>>> +		}
>>>>> +	}
>>>>> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>>>>> +		ret = domain_sleep_wait(gt, domain);
>>>> Why on earth are we waiting here?
>>>>
>>>> Why is this all this stuff called "sleep something"?
>>> to my knowledge the HW can take sometime to ack the forcewake request
>> We are *releasing* the forcewake here, not acquiring it.
> ya I meant forcewake request to get and put.
>
> Thanks,
> Aravind.
>>> that is why we have a wait, regarding the naming it was existing from before
>>> may be Matt can answer that.
>>>
>>>
>>> Thanks,
>>> Aravind.
