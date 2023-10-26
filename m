Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5763C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 09:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E78A10E10F;
	Thu, 26 Oct 2023 09:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFEC10E10F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698311843; x=1729847843;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3fLELanjGle1Rb6oPv18XyCfgV+v72Je8dpeCbwSFDE=;
 b=ijbnYE1rKJnyqF/yKhrSgk6ToIdl7L8uAE5lAQNpfHulxwk5qkjuPQYx
 ez/oyjnK/sSLq94gYdRFO6A6dhjjPIcC3uSIUpj2lUBHUQsccQ/Wp7CF7
 0HNDaKeOh3fLGj6IGgWCJP78PLlNqq+Z4DoACvenol92jWMZGFubBUOS5
 hnDh3VZI7QxeVIOvOwMjh+ctucowyNEKKvOXGyw8KEzCuvmIKeDelbW9i
 LiC723HvQ3vQQjk2YlogVK8elXHLtjA0s8o9U4RkfT4/wPTpCJq2PI3cu
 lWXMYsoX27ZBVnCk+ERRjYvpgNG6ZURizs9who9wM520Z0AmZW0psNGZx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367708260"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="367708260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="6865279"
Received: from andrewmu-mobl.ger.corp.intel.com (HELO [10.252.1.237])
 ([10.252.1.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:16:00 -0700
Message-ID: <bfa98ab2-0fb1-5cf1-6c7c-fe7a9962aa86@intel.com>
Date: Thu, 26 Oct 2023 10:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: Matthew Brost <matthew.brost@intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-8-matthew.auld@intel.com>
 <ZTmCBBn11tCzpT6Z@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZTmCBBn11tCzpT6Z@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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

On 25/10/2023 22:00, Matthew Brost wrote:
> On Wed, Oct 25, 2023 at 06:39:41PM +0100, Matthew Auld wrote:
>> With things like pipelined evictions, VRAM pages can be marked as free
>> and yet still have some active kernel fences, with the idea that the
>> next caller to allocate the memory will respect them. However it looks
>> like we are missing synchronisation for KMD internal buffers, like
>> page-tables, lrc etc. For userspace objects we should already have the
>> required serialisation for CPU access via the fault handler, and
>> likewise for GPU access when vm_binding them.
>>
>> To fix this serialise against any kernel fences for all KMD objects at
>> creation. This seems to resolve some severe corruption seen during
>> evictions.
>>
>> Closes: ?
>> Testcase: igt@xe-evict-ccs
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..26a103aa5d48 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1272,6 +1272,16 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	else
>>   		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>>   
>> +	/*
>> +	 * TTM can give us VRAM that still has active fences i.e GPU might still
>> +	 * be accessing it. To keep things simple just sync any kernel fences
>> +	 * here, if the buffer is KMD internal. For normal userspace objects we
>> +	 * should already have the required pipelining or sync waiting.
>> +	 */
>> +	if (type == ttm_bo_type_kernel)
>> +		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
>> +				      false, MAX_SCHEDULE_TIMEOUT);
>> +
> 
> So this is the case where we create a kernel BO within a VM (e.g. memory
> for page tables) and the memory we received is also within the same VM
> (bo->ttm.base.resv == VM resv object)? The memory we received could
> still be being used thus we need to wait for the memory to be idle? Is
> that right? Also how did you arrive at the DMA_RESV_USAGE_KERNEL slot to
> determine idle?

Yeah, if the BO dma-resv is the same as the vm, then waiting on the vm 
dma-resv would also work, or using the KERNEL fences inside as 
dependencies if we want to pipeline it.

In TTM when evicting VRAM it can be done async. When TTM finds 
appropriate BO(s) to evict we don't need to sync wait on any fences 
(like for userspace job etc). In our xe_bo_move() callback when handed 
some object to evict, we just keep the pipeline going, and schedule the 
move from VRAM -> TT, using the dma-resv fences as input dependencies 
for the copy job (if any). At the end of xe_bo_move() we call 
ttm_bo_move_accel_cleanup(), passing in the final fence for the copy 
job. TTM then adds that fence as USAGE_KERNEL into the dma-resv of the 
object being evicted. The other important step is attaching that same 
fence onto the actual VRAM resource manager, as per 
ttm_bo_move_pipeline_evict(). With the fence attached to the VRAM 
manager the buddy allocator blocks are all freed, even though the memory 
ranges they represent are potentially still being accessed by the GPU. 
The next users that come along allocating memory from the VRAM manager, 
will get the copy job fence that was attached added to their dma-resv 
with USAGE_KERNEL. See ttm_bo_mem_space()/ttm_bo_mem_force_space() -> 
ttm_bo_add_move_fence().

So with all that waiting for DMA_RESV_USAGE_KERNEL here for KMD internal 
stuff should be enough.

> 
> Matt
> 
>>   	return bo;
>>   }
>>   
>> -- 
>> 2.41.0
>>
