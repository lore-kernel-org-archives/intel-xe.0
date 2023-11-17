Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45771C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 08:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5F10E2F0;
	Fri, 17 Nov 2023 08:45:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA61C10E2F0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700210717; x=1731746717;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6ayGzWifuiz5Whtr4J4KOeObsbU2ivZ2sWhhk+hlRsk=;
 b=M2YixtnohyQyKRQn6lPeNIB0+ili0APSDoMCVG/CfNQmZsl1+9qhcV6E
 Iyh6UjnWR1junFRhYreUCDk78u5iWV+Uii5hwf0Xor+FlmY3oTIp1Y2Zu
 YUO3bq6Z12iU4LNB1pUdWmTMHfJz/3nVxJ+snGANqfTRlyR02Ul1neVKK
 z2TNShwfbtVilemxA5upV4krPU5nEYH7l4kyMrm6h36Zf0sexOhlLKRTW
 20Aha90tudQboxKfXGGcM7BoH2nLF0qtsKrDoIKu+7HEj6KPeKCIc3rOg
 d6zmcdQe3lhQyGThCxYMGUWEEnlkZJdRNvwsyt7fKiKf+EL9ujQ05Bvmy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12807270"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="12807270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="909375164"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="909375164"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:45:15 -0800
Message-ID: <37cb2bd7-dfbb-c96d-c5d7-8a318a20dd70@linux.intel.com>
Date: Fri, 17 Nov 2023 14:18:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20231110062907.3604598-1-aravind.iddamsetty@linux.intel.com>
 <ZU4tWZXqWSlIG7GZ@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZU4tWZXqWSlIG7GZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 10/11/23 18:47, Matthew Brost wrote:
> On Fri, Nov 10, 2023 at 11:59:07AM +0530, Aravind Iddamsetty wrote:
>> Use spin_lock_irqsave, spin_unlock_irqrestore
>>
>> Fix for below:
>> [13994.811263] ========================================================
>> [13994.811295] WARNING: possible irq lock inversion dependency detected
>> [13994.811326] 6.6.0-rc3-xe #2 Tainted: G     U
>> [13994.811358] --------------------------------------------------------
>> [13994.811388] swapper/0/0 just changed the state of lock:
>> [13994.811416] ffff895c7e044db8 (&cpuctx_lock){-...}-{2:2}, at:
>> __perf_event_read+0xb7/0x3a0
>> [13994.811494] but this lock took another, HARDIRQ-unsafe lock in the
>> past:
>> [13994.811528]  (&fw->lock){+.+.}-{2:2}
>> [13994.811544]
>>
>>                and interrupts could create inverse lock ordering between
>> them.
>>
>> [13994.811606]
>>                other info that might help us debug this:
>> [13994.811636]  Possible interrupt unsafe locking scenario:
>>
>> [13994.811667]        CPU0                    CPU1
>> [13994.811691]        ----                    ----
>> [13994.811715]   lock(&fw->lock);
>> [13994.811744]                                local_irq_disable();
>> [13994.811773]                                lock(&cpuctx_lock);
>> [13994.811810]                                lock(&fw->lock);
>> [13994.811846]   <Interrupt>
>> [13994.811865]     lock(&cpuctx_lock);
>> [13994.811895]
>>                 *** DEADLOCK ***
>>
Hi Matt,

Firstly thanks for your comment and sorry for the late response was OOO on sick the entire week.

> I don't personally like this. Where in an irq context do we grab this
> lock? FW probably shouldn't ever be grabbed from an irq context. I see
> this was changed from a mutex to spin lock in which is pretty suspect
> IMO.
with the PMU interface "drm/xe/pmu: Enable PMU interface" we are exposing engine busyness
counters and the registers fall under GT domain and needed forcewake as PMU is atomic context
so had to change the forcewake to use spinlock. But other than this i do not think forcewake
is being called from any irq context, AFAIU lockdep is predicting a scenario and hence the
warning. which subsided by use of spin_lock_irqsave.


>
> 'drm/xe: Use spinlock in forcewake instead of mutex'  
>
> If this really needs to be a spin lock I'd rather have versions of
> xe_force_wake_get/put that called from non-atomic contexts (e.g. use
> spin_lock_irq) and atomic contexts (e.g. use spin_lock) rather than
> using spin_lock_irqsave.

I somehow doubt if lockdep be able to recognize such a use and not warn again.

Thanks,
Aravind.
>
> Matt
>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_force_wake.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 32d6c4dd2807..9bbe8a5040da 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -145,9 +145,10 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>  	struct xe_gt *gt = fw_to_gt(fw);
>>  	struct xe_force_wake_domain *domain;
>>  	enum xe_force_wake_domains tmp, woken = 0;
>> +	unsigned long flags;
>>  	int ret, ret2 = 0;
>>  
>> -	spin_lock(&fw->lock);
>> +	spin_lock_irqsave(&fw->lock, flags);
>>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>  		if (!domain->ref++) {
>>  			woken |= BIT(domain->id);
>> @@ -162,7 +163,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>>  				   domain->id, ret);
>>  	}
>>  	fw->awake_domains |= woken;
>> -	spin_unlock(&fw->lock);
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>>  
>>  	return ret2;
>>  }
>> @@ -174,9 +175,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>  	struct xe_gt *gt = fw_to_gt(fw);
>>  	struct xe_force_wake_domain *domain;
>>  	enum xe_force_wake_domains tmp, sleep = 0;
>> +	unsigned long flags;
>>  	int ret, ret2 = 0;
>>  
>> -	spin_lock(&fw->lock);
>> +	spin_lock_irqsave(&fw->lock, flags);
>>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>  		if (!--domain->ref) {
>>  			sleep |= BIT(domain->id);
>> @@ -191,7 +193,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>  				   domain->id, ret);
>>  	}
>>  	fw->awake_domains &= ~sleep;
>> -	spin_unlock(&fw->lock);
>> +	spin_unlock_irqrestore(&fw->lock, flags);
>>  
>>  	return ret2;
>>  }
>> -- 
>> 2.25.1
>>
