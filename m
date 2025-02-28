Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A78C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 12:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215210E2A8;
	Fri, 28 Feb 2025 12:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPXpBfH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9E10E297
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740745697; x=1772281697;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CV/lOqrsY4H10qreJIQevQ9nrF1vSyzKCDFOQFydneI=;
 b=LPXpBfH6wHJUGV5ISKet1YJ55/e+tUgC5L79gsnzxubzlH+9Cn3ePlWc
 +YrUGeft/brY+aqB2itjGByOdOGubVDJQkGyDe9Ncu2gUCbN1ONeasFLu
 LcWf2JpYtIjLLhI08f55Z5fHa0XT74hsrH4eZ+gMNsIFqwoEkZHgKleZS
 M/7FhhAwINaIcZojqHMPhz7RrlS/UQz4RRPSw8iSdtvqsnwr4DfuTVoGR
 AcROpuV0q86HwnZ8pqB2tokI8MksDr1UwkQkn1ZkVv1m2YU4YTC3sYWfp
 w4sAP2MIaxuUYzsjwmZX3pNoNZPPuXocoDQCvdWCgQSymOsbCZduWmmMt Q==;
X-CSE-ConnectionGUID: VGlXlMYeT/e9OEHx2KKs8g==
X-CSE-MsgGUID: xldHTtK+Rie+q16W8Y14Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53082940"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="53082940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:28:17 -0800
X-CSE-ConnectionGUID: TLyExw/LRdile87Z5fQ+sQ==
X-CSE-MsgGUID: RAvgUhBFS72LPk+REr3UvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122338321"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:28:14 -0800
Message-ID: <1bb4be8a-8058-4066-b447-1af29cbb46c0@intel.com>
Date: Fri, 28 Feb 2025 12:28:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Bhatia, Aradhya" <aradhya.bhatia@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
 <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
 <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
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

Hi,

On 28/02/2025 11:11, Hellstrom, Thomas wrote:
> Hi, Matthew
> 
> On Fri, 2025-02-28 at 10:21 +0000, Matthew Auld wrote:
>> On 28/02/2025 06:52, Aradhya Bhatia wrote:
>>> Change the scope of the migrate subsystem to be dev managed instead
>>> of
>>> drm managed.
>>>
>>> The parent pci struct &device, that the xe struct &drm_device is a
>>> part
>>> of, gets removed when a hot unplug is triggered, which causes the
>>> underlying iommu group to get destroyed as well.
>>
>> Nice find. But if that's the case then the migrate BO here is just
>> one
>> of many where we will see this. Basically all system memory BO can
>> suffer from this AFAICT, including userspace owned. So I think we
>> need
>> to rather solve this for all, and I don't think we can really tie the
>> lifetime of all BOs to devm, so likely need a different approach.
>>
>> I think we might instead need to teardown all dma mappings when
>> removing
>> the device, leaving the BO intact. It looks like there is already a
>> helper for this, so maybe something roughly like this:
>>
>> @@ -980,6 +980,8 @@ void xe_device_remove(struct xe_device *xe)
>>
>>           drm_dev_unplug(&xe->drm);
>>
>> +       ttm_device_clear_dma_mappings(&xe->ttm);
>> +
>>           xe_display_driver_remove(xe);
>>
>>           xe_heci_gsc_fini(xe);
>>
>> But I don't think userptr will be covered by that, just all BOs, so
>> likely need an extra step to also nuke all usersptr dma mappings
>> somewhere.
> 
> I have been discussing this a bit with Aradhya, and the problem is a
> bit complex.
> 
> Really if the PCI device goes away, we need to move *all* bos to
> system. That should clear out any dma mappings, since we map dma when
> moving to TT. Also VRAM bos should be moved to system which will also
> handle things like SVM migration.

My thinking is that from userspace pov, the buffers are about to be lost 
anyway, so going through the trouble of moving stuff seems like a waste? 
Once the device is unplugged all ioctls are rejected for that instance 
and we should have stopped touching the hw, so all that is left is to 
close stuff and open up a new instance. VRAM is basically just some 
state tracking at this point (for this driver instance), and actual 
memory footprint is small. If we move to system memory we might be using 
actual system pages for stuff that should really just be thrown away, 
and will be once the driver instance goes away AFAIK. And for stuff that 
has an actual populated ttm_tt, we just discard with something like 
ttm_device_clear_dma_mappings() during remove.

> 
> But that doesn't really help with pinned bos. So IMO subsystems that

I think ttm_device_clear_dma_mappings() also handles pinned BO, AFAICT.

I believe the pinned BO are tracked via bdev->unevictable, so in theory 
it will nuke the dma mapping there also and discard the pages.

> allocate pinned bos need to be devm managed, and this is a step in that
> direction. But we probably need to deal with some fallout. For example
> when we take down the vram managers using drmmm_ they'd want to call
> evict_all() and the migrate subsystem is already down.
> 
> So I think a natural place to deal with such fallouts is the remove()
> callback, while subsystems with pinned bos use devm_
> 
> But admittedly to me it's not really clear how to *best* handle this
> situation. I suspect if we really stress-test device unbinding on a
> running app we're going to hit a lot of problems.

Yes, there are lots of open issues here, but our testing is still lacking :)

> 
> As for the userptrs, I just posted a series that introduces a per-
> userptr dedicated unmap function. We could probably put them on a
> device list or something similar that calls that function (or just
> general userptr invalidation) for all userptrs.

Sounds good.

> 
> /Thomas
> 
> 
> 
> 
> 
>>
>>>
>>> The migrate subsystem, which handles the lifetime of the page-table
>>> tree
>>> (pt) BO, doesn't get a chance to keep the BO back during the hot
>>> unplug,
>>> as all the references to DRM haven't been put back.
>>> When all the references to DRM are indeed put back later, the
>>> migrate
>>> subsystem tries to put back the pt BO. Since the underlying iommu
>>> group
>>> has been already destroyed, a kernel NULL ptr dereference takes
>>> place
>>> while attempting to keep back the pt BO.
>>>
>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>> index 278bc96cf593..4e23adfa208a 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -97,7 +97,7 @@ struct xe_exec_queue
>>> *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>>>    	return tile->migrate->q;
>>>    }
>>>    
>>> -static void xe_migrate_fini(struct drm_device *dev, void *arg)
>>> +static void xe_migrate_fini(void *arg)
>>>    {
>>>    	struct xe_migrate *m = arg;
>>>    
>>> @@ -401,7 +401,7 @@ struct xe_migrate *xe_migrate_init(struct
>>> xe_tile *tile)
>>>    	struct xe_vm *vm;
>>>    	int err;
>>>    
>>> -	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
>>> +	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
>>>    	if (!m)
>>>    		return ERR_PTR(-ENOMEM);
>>>    
>>> @@ -455,7 +455,7 @@ struct xe_migrate *xe_migrate_init(struct
>>> xe_tile *tile)
>>>    	might_lock(&m->job_mutex);
>>>    	fs_reclaim_release(GFP_KERNEL);
>>>    
>>> -	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini,
>>> m);
>>> +	err = devm_add_action_or_reset(xe->drm.dev,
>>> xe_migrate_fini, m);
>>>    	if (err)
>>>    		return ERR_PTR(err);
>>>    
>>
> 

