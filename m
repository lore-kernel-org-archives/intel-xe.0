Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8F8C001E0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 08:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DFA10E25E;
	Wed,  9 Aug 2023 08:02:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF8910E25E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691568163; x=1723104163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eJNVEHnYV4M9nffVo4CSj6jHVHvvvkAfi+tXNbdYXbI=;
 b=Hh3ejfcz5hbqugNAHr85edWPyJBJdbmkvXQB3hO2IjS/uGaIYgeVgauP
 VW7E4k3JU7CPQNiqjXbn2XAXLykW0jUOCeeWf138OTB/dVxGe6MhvllY2
 i3vDeQAlVMyXVM/B7c26re3joemrCguzxrabVkEAN4329tX2hwrPteTd4
 Kso7e/F43vLpoCMv+/yWfTJoZofskx2IZIzq7y80p8hS6aX7Dzbbhf2hf
 z5rCarwP/TrQtM53ZD7XLfWq+c6fTNiv+xknonodq/XSeuIoJ+5BJByhh
 LkQ4sYvxfRY8Ulut3ylKzlv8kdaOiFGJoDt7FZmOlXO+V27xCvvlXJkFn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368515419"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="368515419"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 01:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801654677"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="801654677"
Received: from cwilso3-mobl.fi.intel.com (HELO [10.252.2.31]) ([10.252.2.31])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 01:02:42 -0700
Message-ID: <ad5976e6-df49-e2f4-9fff-15b1102de529@intel.com>
Date: Wed, 9 Aug 2023 09:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230808091903.114939-2-matthew.auld@intel.com>
 <ZNKE7/NrO6fKlKiP@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZNKE7/NrO6fKlKiP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc_submit: fixup deregister in
 job timeout
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

On 08/08/2023 19:09, Matthew Brost wrote:
> On Tue, Aug 08, 2023 at 10:19:04AM +0100, Matthew Auld wrote:
>> Rather check if the engine is still registered before proceeding with
>> deregister steps. Also the engine being marked as disabled doesn't mean
>> the engine has been disabled or deregistered from GuC pov, and here we
>> are signalling fences so we need to be sure GuC is not still using this
>> context.
>>
>> v2:
>>   - Drop the read_stopped() for this path. Since we are signalling
>>     fences on error here, best play it safe and wait for the GT reset to
>>     mark the engine as disabled, rather than it just being queued.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 52c61f78b083..6126ddf2fdd5 100644
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
>> +		}
>>   
>>   		/*
>>   		 * Must wait for scheduling to be disabled before signalling
>> @@ -901,8 +903,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   		 */
>>   		smp_rmb();
>>   		ret = wait_event_timeout(guc->ct.wq,
>> -					 !exec_queue_pending_disable(q) ||
>> -					 guc_read_stopped(guc), HZ * 5);
> 
> I think we want the guc_read_stopped here as we want to pop out of the
> wait if a GT reset is scheduled.
> 
>> +					 !exec_queue_pending_disable(q),
>> +					 HZ * 5);
>>   		if (!ret) {
> 
> Then here we want the check to be:
> 
> !ret || guc_read_stopped
> 
> As we want delay the signaling of fences behind the GT reset.

OK, that sounds better. Let me try that.

> 
> Matt
> 
>>   			XE_WARN_ON("Schedule disable failed to respond");
>>   			sched->timeout = MIN_SCHED_TIMEOUT;
>> -- 
>> 2.41.0
>>
