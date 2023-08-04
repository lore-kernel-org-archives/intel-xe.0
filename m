Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2DFC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 08:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2617F10E143;
	Fri,  4 Aug 2023 08:48:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E410E143
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691138916; x=1722674916;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ChEiBeBrDgV2Hf5q1YPF1HyBOYZFdlAOYm+bVMZj8as=;
 b=MBH3MfEeMfYp5TgkAbJJUextEJAXbZu9tBCKF1wSN+bauqubJxEcnzA2
 KYAWNsDUCPSdL5nxyof2RZmcET/0EHVWpMc7EzTy5zb10hv7Uu5ys1ixl
 kMU1MwkkimXPpvI6WZz0OYCZA1Z87CvT3oSIPZiVQOkFtDo2iv13+NRhW
 qr9Ucw5yFBptSu9mBwFSrDVwQbLIAODiDro0LcjjH3aQabnY984IB2z+V
 hgxig3z3UD/4LcksLYNu7sEFmntAklG/lMsiOnoZm40afFKdlx/57KI2X
 Cn9vV9XfBNs8NbK6nAs0WY5yu0smZJ3TkoGBQy5PVKt2kKaIKkdyZovAw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456478863"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="456478863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 01:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="765018619"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="765018619"
Received: from sophiedx-mobl3.ger.corp.intel.com (HELO [10.252.1.10])
 ([10.252.1.10])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 01:48:32 -0700
Message-ID: <61193ecb-9f6a-500c-d084-cb9df4ddd4db@intel.com>
Date: Fri, 4 Aug 2023 09:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230803173849.285599-3-matthew.auld@intel.com>
 <20230803173849.285599-4-matthew.auld@intel.com>
 <ZMvytzGNetQxODNL@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZMvytzGNetQxODNL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/guc_submit: fixup deregister
 in job timeout
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

On 03/08/2023 19:32, Matthew Brost wrote:
> On Thu, Aug 03, 2023 at 06:38:51PM +0100, Matthew Auld wrote:
>> Rather check if the engine is still registered before proceeding with
>> deregister steps. Also the engine being marked as disabled doesn't mean
>> the engine has been disabled or deregistered from GuC pov, and here we
>> are signalling fences so we need to be sure GuC is not still using this
>> context.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index b88bfe7d8470..e499e6540ca5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	}
>>   
>>   	/* Engine state now stable, disable scheduling if needed */
>> -	if (exec_queue_enabled(q)) {
>> +	if (exec_queue_registered(q)) {
>>   		struct xe_guc *guc = exec_queue_to_guc(q);
>>   		int ret;
>>   
>>   		if (exec_queue_reset(q))
>>   			err = -EIO;
>>   		set_exec_queue_banned(q);
>> -		xe_exec_queue_get(q);
>> -		disable_scheduling_deregister(guc, q);
>> +		if (!exec_queue_destroyed(q)) {
>> +			xe_exec_queue_get(q);
>> +			disable_scheduling_deregister(guc, q);
> 
> You could include wait under this if statment too but either way works.

Do you mean move the pending_disable wait under the if? My worry is that 
multiple queued timeout jobs could somehow trigger one after the other 
and the first disable_scheduling_deregister() goes bad triggering a 
timeout for the wait and queuing a GT reset. The GT reset looks to use 
the same ordered wq as the timeout jobs, so it might be that another 
timeout job was queued before the reset job (like when doing the ~5 
second wait). If that happens the second timeout job would see that 
exec_queue_destroyed has been seen and incorrectly not wait for the 
pending_disable state change and then start signalling fences even 
though the GuC might still be using the context. Do you know if that is 
possible?

> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> +		}
>>   
>>   		/*
>>   		 * Must wait for scheduling to be disabled before signalling
>> -- 
>> 2.41.0
>>
