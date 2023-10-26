Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D06C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 10:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2F10E79A;
	Thu, 26 Oct 2023 10:04:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3C10E79A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698314654; x=1729850654;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2skR46/b58oC8jYk0G2LxvCadrY2xxwuu0hc0toLrdU=;
 b=aLgD2yJ0y+7j9QUPtkTNb3x67Aue3MO+ffGVILCjsl8RRR3AEfO/U6Do
 CK1BZcVk5snijX1aLdFdx1byc5OYoUOd4/f/vZtZaTdqQofYaAmXrAFhM
 Tca0Ho+VrF5uSSuYOgPqq2FeradRZ6kIiu7IGSAQIPi0RLINe9X1cRpn9
 QnJ4t0i7mmXZtvQY/K4E5K6ZdwOyBgnlG4onxcxLNXbOpSoUUmMkTkI49
 eIeiekKmhL/ESV+nLRvumn8NnJZhF6YbAdqqGYZAzTGiWZPbvGcDDCinq
 nb3vOxIn1D9XpeWPPvMnE85seza6zAEv4G19rojl8gGfi2juaWcbx5CYm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372552944"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="372552944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 03:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="6878153"
Received: from andrewmu-mobl.ger.corp.intel.com (HELO [10.252.1.237])
 ([10.252.1.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 03:02:52 -0700
Message-ID: <5116fab6-5dcb-be90-09ce-c5dca76a79bd@intel.com>
Date: Thu, 26 Oct 2023 11:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-7-matthew.auld@intel.com>
 <ZTmDR54qHxBlXPtm@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZTmDR54qHxBlXPtm@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/bo: consider dma-resv fences for
 clear job
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

On 25/10/2023 22:06, Matthew Brost wrote:
> On Wed, Oct 25, 2023 at 06:39:40PM +0100, Matthew Auld wrote:
>> There could be active fences already in the dma-resv for the object
>> prior to clearing. Make sure to input them as dependencies for the clear
>> job.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 009d728af762..896a6d8398ea 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -980,8 +980,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   
>>   		size -= clear_L0;
>>   
>> -		/* TODO: Add dependencies here */
>> -
>>   		/* Preemption is enabled again by the ring ops. */
>>   		if (!clear_vram) {
>>   			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
>> @@ -1010,6 +1008,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		}
>>   
>>   		xe_sched_job_add_migrate_flush(job, flush_flags);
>> +		if (!fence) {
>> +			err = job_add_deps(job, bo->ttm.base.resv,
>> +					   DMA_RESV_USAGE_BOOKKEEP);
> 
> Hmm, so if the BO is private to the VM new memory allocations for VRAM
> (triggers clears) are now staged behind the entire VM being idle (e.g.
> no execs, no binds inflight) and since this is a kernel operation all
> new VM operations are stage behind this clear. This seems very, very
> expensive. If there not another way around this?

Can make this USAGE_KERNEL I think. It's just the move fences we need 
worry about and not the userspace stuff since it hasn't gotten past the 
initial clear, I think.

I don't think we evict between tiles, but rather just VRAM -> TT. If we 
can guarantee that all copy and clear jobs happen with the same queue, 
and the order we add jobs is the order they will appear in the ring and 
the queue is always tied to one tile/VRAM manager, then I think we can 
drop this, and add big block comment here instead? But I do think adding 
USAGE_KERNEL here is a good idea in general.

> 
> Also on compute VMs this would trigger preempt fences which would not be
> ideal.
> 
> Matt
> 
>> +			if (err)
>> +				goto err_job;
>> +		}
>>   
>>   		xe_sched_job_arm(job);
>>   		dma_fence_put(fence);
>> @@ -1024,6 +1028,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>   		xe_bb_free(bb, fence);
>>   		continue;
>>   
>> +err_job:
>> +		xe_sched_job_put(job);
>>   err:
>>   		mutex_unlock(&m->job_mutex);
>>   		xe_bb_free(bb, NULL);
>> -- 
>> 2.41.0
>>
