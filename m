Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A97C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5362210E9CC;
	Fri,  8 Dec 2023 05:47:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02510E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702014430; x=1733550430;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SMJ5bNJdpmATTHIXTeyFL4TwhGOxjAyPWVfrh7itGRU=;
 b=W6nMdaeflB3B60pP05eEgxk3GVwOXjy0/vEQICM+elihHAcvmKz/1c6G
 uSWSorpa0UxwYtdxcbhbRD8VwXndW+arEo/XbBKkXKf+X9ExGwVTBaIzq
 jaCPl6fM51IeaOdTsPRPbq9Rji4P8tDjI6XGZ9dMfeXjJ9Mizd52sjlTl
 JiG1GMktKwr0SOhd0fc0ENZwrcv8z9ckkYgzLdAh5VHQNcnX4aoh39mew
 BmBYLz2GHxzDG3TYqU/z0xrweMHRWTzpGC3BEv8WF2GmDqq7WO0gVX1ru
 HziMDfqQOp9nHdzkTJ4HtBRhnBsRHIIn1aF1z0zKbFtRkOzZ4NrduiLTP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458673700"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="458673700"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103448278"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1103448278"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:47:08 -0800
Message-ID: <8cc613c4-f4ba-439f-805e-f4677d7d94a1@linux.intel.com>
Date: Fri, 8 Dec 2023 11:19:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix lockdep warning in xe_force_wake
 calls
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231206095318.30326-1-aravind.iddamsetty@linux.intel.com>
 <ZXKm-lm_BbzegovV@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZXKm-lm_BbzegovV@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 12/8/23 10:47, Rodrigo Vivi wrote:
> On Wed, Dec 06, 2023 at 03:23:18PM +0530, Aravind Iddamsetty wrote:
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
>> v2: Use spin_lock in atomic context and spin_lock_irq in a non atomic
>> context (Matthew Brost)
>>
>> v3: just use spin_lock_irqsave/restore
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks Rodrigo.

Regards,
Aravind.
>
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
