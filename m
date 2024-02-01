Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78192C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 20:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD5210E91A;
	Thu,  1 Feb 2024 20:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wa/TLzBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4E10E91A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817617; x=1738353617;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2o2UjhjwKaB8Ts3XReA7OgEP/LnBtJiQOZBsSh1oF+A=;
 b=Wa/TLzBB+7qbZMpO6lD34dIF0YQ8iRPhhx4WAuHqOft3zKpdXGcvUh8K
 Fx5TEgtYOnUNcYnldZE/xNmugZ33K3wzbfuLHdsZeyMXinTunIs4EX2V6
 q5thv/6bIl2ohDEHmIuT6QPoxUW6wUbtOl3S6UDxnJCfUWQsoz/jfgpgN
 +Gta/2kz+p7tIavtlSm55YmfdykgUtgk7OIVEKs/LcZYbQEqNQcge8uTv
 b6tgqkqqw8KJ+qS5I20cY50bvnBQiDbk1sSY05kfdhkjJOfNRwIJFIMt5
 LCEP6hd5qESJ+XeUZuJFN/14Of6QiM25bNtjeoFfimpXiNAq3SK6Vl+qB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="25454324"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="25454324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="93499"
Received: from lhuot-mobl.amr.corp.intel.com (HELO [10.252.59.167])
 ([10.252.59.167])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:00:17 -0800
Message-ID: <3914d37b-2f89-41bc-bf20-4f255d96d217@linux.intel.com>
Date: Thu, 1 Feb 2024 21:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Pick correct userptr VMA to repin on REMAP op
 failure
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240201004849.2219558-1-matthew.brost@intel.com>
 <20240201004849.2219558-3-matthew.brost@intel.com>
 <265682a3-b813-4f1f-8031-1d500c3d89af@linux.intel.com>
 <ZbvwWn84IXdbLjIU@DUT025-TGLU.fm.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZbvwWn84IXdbLjIU@DUT025-TGLU.fm.intel.com>
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

Hey,

On 2024-02-01 20:26, Matthew Brost wrote:
> On Thu, Feb 01, 2024 at 08:18:52PM +0100, Maarten Lankhorst wrote:
>>
>>
>> On 2024-02-01 01:48, Matthew Brost wrote:
>>> A REMAP op is composed of 3 VMA's - unmap, prev map, and next map. When
>>> op_execute fails with -EAGAIN we need to update the local VMA pointer to
>>> the current op state and then repin the VMA if it is a userptr.
>>>
>>> Fixes a failure seen in xe_vm.munmap-style-unbind-userptr-one-partial.
>>>
>>> Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++++++-----
>>>    1 file changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index e55161136490..2ab863fe7d0a 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2506,13 +2506,25 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>>    	}
>>>    	drm_exec_fini(&exec);
>>> -	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>>> +	if (err == -EAGAIN) {
>>>    		lockdep_assert_held_write(&vm->lock);
>>> -		err = xe_vma_userptr_pin_pages(vma);
>>> -		if (!err)
>>> -			goto retry_userptr;
>>> -		trace_xe_vma_fail(vma);
>>> +		if (op->base.op == DRM_GPUVA_OP_REMAP) {
>>> +			if (!op->remap.unmap_done)
>>> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
>>> +			else if (op->remap.prev)
>>> +				vma = op->remap.prev;
>>> +			else
>>> +				vma = op->remap.next;
>>> +		}
>> I see this same vma picking in handling of DRM_GPUVA_OP_REMAP.
>>
>> Could the switch in xe_vma_op_execute() be moved to a separate pick_vma
>> function instead, called from this place too?
>>
>> It might make the code slightly more readable.
>>
> 
> I would agree if this code wasn't going get rewritten shortly in [1]. We
> are transiting to 1 job per VM bind IOCTL in [1]. I currently am
> reworking on rebasing that code and found a few bugs in the current
> code. I want to stablize the code quickly so I czn reliably test my
> larger changes.
> 
> Would it help if I added comment here saying this code is temporary?
Oh that gives some context. The infinite loop fix in one patch is caused 
by the first patch in that series.

I'd personally choose to fix it here, then when r ebasing put a revert 
before 21/27 and squash?

Cheers,
~Maarten
