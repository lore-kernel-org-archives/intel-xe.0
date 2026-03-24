Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5385F54ACE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1410E70E;
	Tue, 24 Mar 2026 15:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGJDnHvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15F10E70E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366646; x=1805902646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cHZX7ePd9XO0tKI6rSJgApDvC1T/To9OehfwEUOS4ig=;
 b=BGJDnHvqriteNcLtyeKi4ejOxdeqXZsyiDzFyOLoHDbtAg5GLRvjiiIR
 zNfYR6Qoiosv9exFOGYcqbm/k4xRMsKBJnjiSCxbOiwZR0vxYhwUvCObO
 dgulE9vo7LEN/J1TT5MjqyHHbthmeQGTwdIDBx5RGHp/IZ0DHnLmYzHvP
 8BpxE8Xe90/mWQ06yvc0RAsMcTn9NC3DpyrHnNSs7mkOVn1Wv5xNGrgDS
 i2wVKwzf3aPIqcC8x4fv4OjcAWulwDL6CmtFmXuglVRMZKhv1IFnL4TLW
 DxPxqGwOdNfhxbeWWuE2w1uVoEXFES3n7KWjgFDRSrV2O2LI6ZiINjNlI A==;
X-CSE-ConnectionGUID: 4C568xg7Tf2YejwfJpL37A==
X-CSE-MsgGUID: jF/gO9r2S1e+HCx8CSwsPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92963475"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="92963475"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:26 -0700
X-CSE-ConnectionGUID: Tq9PyuW2T/ui/Reu5xR+Lw==
X-CSE-MsgGUID: T5BbjLOpQBOLvAwCPorOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="221042302"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.212])
 ([10.245.244.212])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:24 -0700
Message-ID: <8f2a95b6-2a5b-4920-952f-63871fd087bf@intel.com>
Date: Tue, 24 Mar 2026 15:37:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Drop dma mappings for wedged device
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 matthew.d.roper@intel.com
References: <20260324071529.447319-1-raag.jadav@intel.com>
 <019ee8de-9268-4706-841b-25d9b0818f1a@intel.com>
 <acKqT7SM56hY6Hhd@black.igk.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <acKqT7SM56hY6Hhd@black.igk.intel.com>
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

On 24/03/2026 15:14, Raag Jadav wrote:
> On Tue, Mar 24, 2026 at 12:52:30PM +0000, Matthew Auld wrote:
>> On 24/03/2026 07:13, Raag Jadav wrote:
>>> As per uapi documentation[1], the prerequisite for wedged device is to
>>> drop all dma mappings. Reuse xe_bo_pci_dev_remove_pinned() for this,
>>> which iterates over external bo list and removes all dma mappings.
>>>
>>> [1] Documentation/gpu/drm-uapi.rst
>>
>> Can you point to where it says that? Do you just mean the: "disabling DMA to
>> system memory" ?
>>
>> One other thing that maybe jumps out is:
>>
>> "All existing mmaps should be invalidated and
>> page faults should be redirected to a dummy page"
>>
>> Are we also missing that? We have the dummy page flow, but do we actually
>> force everything to be refaulted?
> 
> I tried this with commit c020fff70d75 but it clearly doesn't cover
> everything.

Ah right. Yeah, in theory if you do something like:

addr = mmap(bo);
addr[0] = 0xdeadbeaf;
igt_assert_eq(addr[0], 0xdeadbeaf);
wedge();
igt_assert_eq(addr[0], 0);

It should fail the second assert, I think. With the below fix in theory 
the access after the wedge will now trigger a new fault which will then 
map your dummy page (which is hopefully all zeroes), which I think is 
what the doc wants.

> 
>> Something like:
>>
>>   /* Clear all CPU mappings pointing to this device */
>>   unmap_mapping_range(dev->anon_inode->i_mapping, 0, 0, 1);
> 
> Sure.
> 
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> PS: This is pretty much uncharted territory for me, so please consider
>>> this an RFC.
>>>
>>>    drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
>>>    drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
>>>    drivers/gpu/drm/xe/xe_device.c   | 2 ++
>>>    3 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
>>> index 7661fca7f278..f741cda50b2d 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>>> @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
>>>    	return ret;
>>>    }
>>> -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>>> +/**
>>> + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
>>> + * @xe: xe device
>>> + *
>>> + * Drop dma mappings of all external pinned bos.
>>> + */
>>> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>>>    {
>>>    	struct xe_tile *tile;
>>>    	unsigned int id;
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
>>> index e8385cb7f5e9..6ce27e272780 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
>>> @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe);
>>>    int xe_bo_restore_early(struct xe_device *xe);
>>>    int xe_bo_restore_late(struct xe_device *xe);
>>> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
>>>    void xe_bo_pci_dev_remove_all(struct xe_device *xe);
>>>    int xe_bo_pinned_init(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 207ad2eea412..ac51b04560df 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -1351,6 +1351,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>    	for_each_gt(gt, xe, id)
>>>    		xe_gt_declare_wedged(gt);
>>> +	xe_bo_pci_dev_remove_pinned(xe);
>>
>> AFAIK this just removes the iommu mappings for kernel BOs (small subset of
>> BOs), if there are any. Also if you are not using iommu, then dma between
>> GPU and system memory is still possible. And for userspace BOs nothing
>> changes. But I guess this is still better than nothing and will maybe catch
>> some misuse?
> 
> Yeah, I just floated this to start the discussion. Thanks for the pointers,
> will explore this.
> 
> Raag
> 
>>>    	if (xe_device_wedged(xe)) {
>>>    		/*
>>>    		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
>>

