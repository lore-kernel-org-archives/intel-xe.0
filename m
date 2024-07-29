Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05257C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 08:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E9F10E0D3;
	Mon, 29 Jul 2024 08:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BewShpNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642110E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722242871; x=1753778871;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ge6BXhhkSSHtaKoGzStEtvOf7gjeAaoFTQqe8bZrh3I=;
 b=BewShpNcrlBVz/85SjUtuJEo5+3j5ytgTWHQBsyGS/J5rkN7bgLXJUvJ
 rrrVYHaZQL7sAR70GjDI2jAbPc4P3YShue9x+ZUUCXHO9Lgn9SHLtexeS
 cokOr/lESE0MsqA3qfyluJIbfwdAjvRZJqo0HVzuks9IQkMYCiZE7Lmw8
 BBuQ2/jhWy2CXWLWa/wa1IxjR8lAUMxXuyO1tOS4mAKwxWxsT92vEwdhh
 sWMlV15tIemQPxZZRPYCAtk5wPPUMEurSM7qTXXPyANcX+mo2Mxf/DHs7
 IPtjgbeN/tkdVRcKKBGo9HgTna9wz1qGyPfOskwzb3RXfQ5JT9e2wW+e+ w==;
X-CSE-ConnectionGUID: FCajtLZWT9m+lIQCSG3rYw==
X-CSE-MsgGUID: 9wEru49eSMiO71Wj2bFTDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19783970"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="19783970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:47:50 -0700
X-CSE-ConnectionGUID: 18khxWeBRPGlG0N4sYDq9g==
X-CSE-MsgGUID: pFj307c7SdWgDlBs1Go3zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="91382412"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.245.175]) ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:47:50 -0700
Message-ID: <abcc60c6-acdc-45f2-8b30-fa30bfd19461@linux.intel.com>
Date: Mon, 29 Jul 2024 10:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Faster devcoredump
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20240726052101.2069493-1-matthew.brost@intel.com>
 <7783452aa26ca547e2ac80fca1ac752574c49f2d.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <7783452aa26ca547e2ac80fca1ac752574c49f2d.camel@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

I like speed, so great to have it fixed!

Den 2024-07-27 kl. 00:01, skrev Zanoni, Paulo R:
> On Thu, 2024-07-25 at 22:21 -0700, Matthew Brost wrote:
>> The current algorithm to read out devcoredump is O(N*N) where N is the
>> size of coredump due to usage of the drm_coredump_printer in
>> xe_devcoredump_read. Switch to a O(N) algorithm which prints the
>> devcoredump into a readable format in snapshot work and update
>> xe_devcoredump_read to memcpy from the readable format directly.
> 
> I just tested this:
> 
> root@martianriver:~# time cp /sys/class/drm/card0/device/devcoredump/data gpu-hang.data
> 
> real	0m0.313s
> user	0m0.008s
> sys	0m0.298s
> root@martianriver:~# ls -lh gpu-hang.data 
> -rw------- 1 root root 221M Jul 26 14:47 gpu-hang.data
> 
> Going from an estimated 221 minutes to 0.3 seconds, I'd say it's an improvement.
> 
>>
>> v2:
>>  - Fix double free on devcoredump removal (Testing)
>>  - Set read_data_size after snap work flush
>>  - Adjust remaining in iterator upon realloc (Testing)
>>  - Set read_data upon realloc (Testing)
>>
>> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_devcoredump.c       | 140 +++++++++++++++++-----
>>  drivers/gpu/drm/xe/xe_devcoredump.h       |  13 ++
>>  drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
>>  drivers/gpu/drm/xe/xe_vm.c                |   9 +-
>>  drivers/gpu/drm/xe/xe_vm.h                |   4 +-
>>  5 files changed, 136 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index d8d8ca2c19d3..6af161250a9e 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>  	return &q->gt->uc.guc;
>>  }
>>  
>> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> +static void __xe_devcoredump_read(char *buffer, size_t count,
>> +				  struct xe_devcoredump *coredump)
>>  {
>> -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>> -
>> -	/* keep going if fw fails as we still want to save the memory and SW data */
>> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>> -	xe_vm_snapshot_capture_delayed(ss->vm);
>> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
Should this put be conditional?

>> -}
>> -
>> -static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>> -				   size_t count, void *data, size_t datalen)
>> -{
>> -	struct xe_devcoredump *coredump = data;
>>  	struct xe_device *xe;
>>  	struct xe_devcoredump_snapshot *ss;
>>  	struct drm_printer p;
>> @@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>  	struct timespec64 ts;
>>  	int i;
>>  
>> -	if (!coredump)
>> -		return -ENODEV;
>> -
>>  	xe = coredump_to_xe(coredump);
>>  	ss = &coredump->snapshot;
>>  
>> -	/* Ensure delayed work is captured before continuing */
>> -	flush_work(&ss->work);
>> -
>>  	iter.data = buffer;
>>  	iter.offset = 0;
>> -	iter.start = offset;
>> +	iter.start = 0;
>>  	iter.remain = count;
>>  
>>  	p = drm_coredump_printer(&iter);
>> @@ -129,15 +110,86 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>  			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
>>  						    &p);
>>  	drm_printf(&p, "\n**** VM state ****\n");
>> -	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
>> +	xe_vm_snapshot_print(ss, coredump->snapshot.vm, &p);
>>  
>> -	return count - iter.remain;
>> +	ss->read_data_size = iter.offset;
>> +}
>> +
>> +static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>> +{
>> +	int i;
>> +
>> +	xe_guc_ct_snapshot_free(ss->ct);
>> +	ss->ct = NULL;
>> +
>> +	xe_guc_exec_queue_snapshot_free(ss->ge);
>> +	ss->ge = NULL;
>> +
>> +	xe_sched_job_snapshot_free(ss->job);
>> +	ss->job = NULL;
>> +
>> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>> +		if (ss->hwe[i]) {
>> +			xe_hw_engine_snapshot_free(ss->hwe[i]);
>> +			ss->hwe[i] = NULL;
>> +		}
>> +
>> +	xe_vm_snapshot_free(ss->vm);
>> +	ss->vm = NULL;
>> +}
>> +
>> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> +{
>> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>> +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
>> +
>> +	/* keep going if fw fails as we still want to save the memory and SW data */
>> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
>> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>> +	xe_vm_snapshot_capture_delayed(ss->vm);
>> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>> +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +
>> +	ss->read_data = kvmalloc(SZ_16M, GFP_USER);
>> +	if (!ss->read_data)
>> +		return;
>> +
>> +	ss->read_data_size = SZ_16M;
Shouldn't it be easy to actually make a reasonable approximation of the size, instead of reallocating all the time?
Or run twice, returning size on first attempt, and data on second.

In any case,

ss->read_data_size = some const + VM_DUMP_SIZE * some other const

This approach is likely too fragile, but we should be able to change the code to dump twice to get the accurate number.

Cheers,
~Maarten
