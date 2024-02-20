Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A2DC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 13:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87010E3F7;
	Tue, 20 Feb 2024 13:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+NzOYo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF79010E3F7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708436205; x=1739972205;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ov5jtn5O3eFx6mlFN5w6Nqgeau6AmtFfvRbmCZ3XO1E=;
 b=K+NzOYo3tB3KsorHzMrlqLQDjpplOUcJwAYgRCZRtueYWQ4ybVDpHINE
 teMO0bQvygDKrd5IgQ6KdgnL/78oO+p1L7D7CiZ6eGaRNOoULtr8dTQqO
 Y1rwoGz4k4106/Y8ktdnWHTjjbTW18S/2IrhPqUbWGO9186p0hFkQlVxn
 rtZNNrlzp2BDVQZrJhKTB1SAOZ7kVApjtFvw5ABZYorq7uWyy/wfIxOlY
 dUC+vwb9bO6RdXU+rSgEVuIBXN1AmGCiCq2JkkPkmW9zMXQvh0mivwdef
 rp6Jmy6fVLKo+jvMVbdcSIcrfNXTFkSEFkLHyxJjDTempqGd1cTU6r+d7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="5493963"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5493963"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 05:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936453679"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="936453679"
Received: from isyrjala-mobl1.ger.corp.intel.com (HELO [10.252.46.79])
 ([10.252.46.79])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 05:36:41 -0800
Message-ID: <9b60604a-d703-48d6-b69d-4d9058ceaf5b@linux.intel.com>
Date: Tue, 20 Feb 2024 14:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe: Implement VM snapshot support for BO's and
 userptr
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240213145239.359679-1-maarten.lankhorst@linux.intel.com>
 <20240213145239.359679-4-maarten.lankhorst@linux.intel.com>
 <7886cf58fbe2a6aa2f25f079ecd6c676e5b81d79.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <7886cf58fbe2a6aa2f25f079ecd6c676e5b81d79.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 2024-02-16 18:43, Souza, Jose wrote:
> On Tue, 2024-02-13 at 15:52 +0100, Maarten Lankhorst wrote:
>> Since we cannot immediately capture the BO's and userptr, perform it in
>> 2 stages. The immediate stage takes a reference to each BO and userptr,
>> while a delayed worker captures the contents and then frees the
>> reference.
>>
>> This is required because in signaling context, no locks can be taken, no
>> memory can be allocated, and no waits on userspace can be performed.
>>
>> With the delayed worker, all of this can be performed very easily,
>> without having to resort to hacks.
>>
>> Changes since v1:
>> - Fix crash on NULL captured vm.
>> - Use ascii85_encode to capture BO contents and save some space.
>> - Add length to coredump output for each captured area.
>> Changes since v2:
>> - Dump each mapping on their own line, to simplify tooling.
>> - Fix null pointer deref in xe_vm_snapshot_free.
>> Changes since v3:
>> - Don't add uninitialized value to snap->ofs. (Souza)
>> - Use kernel types for u32 and u64.
>> - Move snap_mutex destruction to final vm destruction. (Souza)
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       |  33 ++++-
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 +
>>   drivers/gpu/drm/xe/xe_vm.c                | 169 +++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_vm.h                |   5 +
>>   4 files changed, 211 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 08d3f6cb72292..3e863e51b9d4d 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_guc_submit.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_sched_job.h"
>> +#include "xe_vm.h"
>>   
>>   /**
>>    * DOC: Xe device coredump
>> @@ -59,12 +60,22 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>>   	return &q->gt->uc.guc;
>>   }
>>   
>> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>> +{
>> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>> +
>> +	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +	if (ss->vm)
>> +		xe_vm_snapshot_capture_delayed(ss->vm);
>> +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
>> +}
>> +
>>   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   				   size_t count, void *data, size_t datalen)
>>   {
>>   	struct xe_devcoredump *coredump = data;
>>   	struct xe_device *xe = coredump_to_xe(coredump);
>> -	struct xe_devcoredump_snapshot *ss;
>> +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>>   	struct drm_printer p;
>>   	struct drm_print_iterator iter;
>>   	struct timespec64 ts;
>> @@ -74,12 +85,14 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   	if (!data || !coredump_to_xe(coredump))
>>   		return -ENODEV;
>>   
>> +	/* Ensure delayed work is captured before continuing */
>> +	flush_work(&ss->work);
>> +
>>   	iter.data = buffer;
>>   	iter.offset = 0;
>>   	iter.start = offset;
>>   	iter.remain = count;
>>   
>> -	ss = &coredump->snapshot;
>>   	p = drm_coredump_printer(&iter);
>>   
>>   	drm_printf(&p, "**** Xe Device Coredump ****\n");
>> @@ -104,6 +117,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   		if (coredump->snapshot.hwe[i])
>>   			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
>>   						    &p);
>> +	if (coredump->snapshot.vm) {
>> +		drm_printf(&p, "\n**** VM state ****\n");
>> +		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
>> +	}
>>   
>>   	return count - iter.remain;
>>   }
>> @@ -117,12 +134,16 @@ static void xe_devcoredump_free(void *data)
>>   	if (!data || !coredump_to_xe(coredump))
>>   		return;
>>   
>> +	cancel_work_sync(&coredump->snapshot.work);
>> +
>>   	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
>>   	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
>>   	xe_sched_job_snapshot_free(coredump->snapshot.job);
>>   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
>>   		if (coredump->snapshot.hwe[i])
>>   			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
>> +	xe_vm_snapshot_free(coredump->snapshot.vm);
>> +	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
> 
> why this memset()?
I wanted to ensure next snapshot starts at the same state as the first, 
the snapshot is not freed here and struct is re-used.

Cheers,
~Maarten
