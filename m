Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3AA10ED674
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 15:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1A310E275;
	Fri, 27 Mar 2026 15:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zl7T0Z4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976AF10E275
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774623801; x=1806159801;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jZkrwuWUoMwOAhRj2tOZDVJ3vYN3+VFPu17GzYt4+co=;
 b=Zl7T0Z4RAPx2jssun5S+vR1LHQsoAnQu4R+4Nbm3ZYReZGX7G/e56lnG
 9ydILy5raNsrVvJTTrU8p0qysLuTeXUc9K5RU4qnh8IYpkSwUOCvUWezy
 j+DNbBEn8WuYCkrqT8xjq9dluzWYgivan66lM6DlW0c/YKQRq9uR0yxKc
 IUhUd28bGrWOKURTRn3/dewZU8Wp3hOn0XkTVmOD8W2UvQycR0Bs4q0Eu
 G17QfehdV7WU+s4bT/Pmp0dBPu0fQpdLok+AppygSZ0AqjrXBA9jU5BXh
 b7K9m+tjLgx0dvTb/dEE4vxC3F8WcKTI0UALqFGw0Z7x/S0bv6NiluOMd Q==;
X-CSE-ConnectionGUID: gA68ApzSTc+nMKZGJdn4sA==
X-CSE-MsgGUID: wJ8l3roHQ+qbA18BEErLmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79604270"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="79604270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 08:03:21 -0700
X-CSE-ConnectionGUID: shEIIEHlQMSCUNMHxAgZAg==
X-CSE-MsgGUID: X7qO2jhET+aaTmm9Hyih6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224380687"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.176])
 ([10.245.244.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 08:03:19 -0700
Message-ID: <156d287e-117f-4575-a90c-3aaa233ed670@intel.com>
Date: Fri, 27 Mar 2026 15:03:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Drop all mappings for wedged device
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.d.roper@intel.com
References: <20260326132816.739363-1-raag.jadav@intel.com>
 <acWi1gL2SI+KLWgP@gsse-cloud1.jf.intel.com>
 <9099f0ef-87a9-42f6-888f-57bb73f6d6ae@intel.com>
 <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <2759679af38d84c75e43b19ef5a93681f789ff28.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 27/03/2026 10:41, Thomas Hellström wrote:
> On Fri, 2026-03-27 at 10:18 +0000, Matthew Auld wrote:
>> On 26/03/2026 21:19, Matthew Brost wrote:
>>> On Thu, Mar 26, 2026 at 06:58:16PM +0530, Raag Jadav wrote:
>>>> As per uapi documentation[1], the prerequisite for wedged device
>>>> is to
>>>> drop all memory mappings. Follow it.
>>>>
>>>> [1] Documentation/gpu/drm-uapi.rst
>>>>
>>>> v2: Also drop CPU mappings (Matthew Auld)
>>>>
>>>> Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo_evict.c | 8 +++++++-
>>>>    drivers/gpu/drm/xe/xe_bo_evict.h | 1 +
>>>>    drivers/gpu/drm/xe/xe_device.c   | 5 +++++
>>>>    3 files changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
>>>> b/drivers/gpu/drm/xe/xe_bo_evict.c
>>>> index 7661fca7f278..f741cda50b2d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>>>> @@ -270,7 +270,13 @@ int xe_bo_restore_late(struct xe_device *xe)
>>>>    	return ret;
>>>>    }
>>>>    
>>>> -static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>>>> +/**
>>>> + * xe_bo_pci_dev_remove_pinned() - Unmap external bos
>>>> + * @xe: xe device
>>>> + *
>>>> + * Drop dma mappings of all external pinned bos.
>>>> + */
>>>> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
>>>>    {
>>>>    	struct xe_tile *tile;
>>>>    	unsigned int id;
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
>>>> b/drivers/gpu/drm/xe/xe_bo_evict.h
>>>> index e8385cb7f5e9..6ce27e272780 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo_evict.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
>>>> @@ -15,6 +15,7 @@ void xe_bo_notifier_unprepare_all_pinned(struct
>>>> xe_device *xe);
>>>>    int xe_bo_restore_early(struct xe_device *xe);
>>>>    int xe_bo_restore_late(struct xe_device *xe);
>>>>    
>>>> +void xe_bo_pci_dev_remove_pinned(struct xe_device *xe);
>>>>    void xe_bo_pci_dev_remove_all(struct xe_device *xe);
>>>>    
>>>>    int xe_bo_pinned_init(struct xe_device *xe);
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index b17d4a878686..4c0097f3aefb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -1347,6 +1347,11 @@ void xe_device_declare_wedged(struct
>>>> xe_device *xe)
>>>>    	for_each_gt(gt, xe, id)
>>>>    		xe_gt_declare_wedged(gt);
>>>>    
>>>> +	/* Drop dma mappings of external bos */
>>>> +	xe_bo_pci_dev_remove_pinned(xe);
>>>
>>> Do we even need the part above? unmap_mapping_range() should drop
>>> all
>>> DMA mappings for the device being wedged, right? In other words,
>>> the device
>>> should no longer be able to access system memory or other devices’
>>> memory
>>> via PCIe P2P. I'm not 100% sure about this, though.
>>
>> AFAIK unmap_mapping_range() is just for the CPU mmap side. It should
>> ensure ~everything is refaulted on the next CPU access, so we can
>> point
>> to dummy page.
>>
>> For dma mapping side, I'm still not completely sure what the best
>> approach is. On the one hand, device is wedged so we should not
>> really
>> be doing new GPU access? Ioctls are all blocked, and with below, CPU
>> access will be re-directed to dummy page. So perhaps doing nothing
>> for
>> dma mapping side is OK? If we want to actually remove all dma
>> mappings
>> for extra safety, I think closest thing is maybe purge all BOs?
>> Similar
>> to what we do for an unplug.
> 
> It sounds like, when the device is wedged beyond recovery, not even the
> unplug / pcie device unbind path should be doing any hwardware
> accesses. So if that path is fixed up to avoid that, then perhaps we
> can just unbind the pcie device just after wedging? That is, of course
> if it's acceptable that the drm_device <-> pcie device association is
> broken.

Yeah, it does seem kind of similar to the unplug flow, just that device 
is potentially inaccessible through that. All of the devm cleanup, plus 
already nuking CPU mapppings and the purge stuff is relevant for wedge, 
I think.

Do we know if coredump is maybe interesting after wedge? Maybe that is 
one potential issue, since it looks like that is attached to the 
physical device? AFAICT that would currently get nuked on unbind/unplug? 
Perhaps if we get into a wedge state, the user might want to collect any 
logs/coredump first, assuming there are some?

Also thinking some more, there is also the dma-buf exported to another 
device edgecase, like with VRAM? With unplug, I think we move it to 
system memory and notify the importer. But here, if device is cooked, we 
maybe can't actually move it with hw? Do we know if this is handled in 
some way already?

> 
> /Thomas
> 
> 
> 
>>
>> So perhaps xe_bo_pci_dev_remove_all() is better here? Also I guess
>> would
>> need:
>>
>> @@ -349,7 +349,8 @@ static void xe_evict_flags(struct
>> ttm_buffer_object
>> *tbo,
>>                   return;
>>           }
>>
>> -       if (device_unplugged && !tbo->base.dma_buf) {
>> +       if ((device_unplugged || xe_device_wedged(xe)) &&
>> +           !tbo->base.dma_buf) {
>>                   *placement = purge_placement;
>>                   return;
>>           }
>>
>>>
>>> Matt
>>>
>>>> +	/* Drop all CPU mappings pointing to this device */
>>>> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0,
>>>> 1);
>>>> +
>>>>    	if (xe_device_wedged(xe)) {
>>>>    		/*
>>>>    		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is
>>>> intended for debugging
>>>> -- 
>>>> 2.43.0
>>>>

