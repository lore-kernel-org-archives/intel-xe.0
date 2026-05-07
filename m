Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44243CD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 09:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C0F10EFE3;
	Thu,  7 May 2026 09:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuIWHBEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66B310EFE3
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778147395; x=1809683395;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ScmP1JQWwaBDwuMZ5MlAH2OdSivLurKq4BHpDVQ7SA8=;
 b=cuIWHBEVNKiHSmKDZgWhFyrbv+rggdHf12X03MwlU+UwFkdv2CT2KaBT
 Yy0Oi1zC0uOgsQYUWLbigAm9C5xT1caSgoieIp1p54WSWwqZhpBQZpgj0
 faVFM5C8ZZ/3bbfIPNDMIjsayS2xjl8IFvq17TL8RmTpvfQcuYWOpN4+a
 3eZvmpQZOuyG0xHbmZ971gtb192AKQRpRCfdDXI9y5IhdZYbv+Olml1D6
 5sNF0kmf57bz2Q87oQZXoFlSG10HcaaE7Z9SXrWZjpm2WTxSF0j4VQ+Aa
 X1g3Z7N4z8DaURwurdBshnlvXhI0+N+FLYdgYplSGwT5OHdu9eM4tU70f A==;
X-CSE-ConnectionGUID: +YatzrGISfuvTCdk4Wpxyg==
X-CSE-MsgGUID: VQMryE4tR4mSiOiABNquYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79084762"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79084762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:49:48 -0700
X-CSE-ConnectionGUID: QNuSoHaJTruDx483Cghicg==
X-CSE-MsgGUID: wHwJijGAQjeyFxRkocqVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="259845550"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.139])
 ([10.245.245.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:49:43 -0700
Message-ID: <8885adcc-1560-46c8-90b5-7a2c00d542f1@intel.com>
Date: Thu, 7 May 2026 10:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V7 10/10] drm/xe/cri: Add sysfs interface for bad gpu
 vram pages
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-22-tejas.upadhyay@intel.com>
 <03f64ea2-5626-49d5-8ef9-afa7311ee697@intel.com>
 <DS0PR11MB87189655103B8C7C9C81A7BD81312@DS0PR11MB8718.namprd11.prod.outlook.com>
 <21811e89-5f7a-48bd-b0bf-76065cee6bcc@intel.com>
 <DS0PR11MB871832818742B56736EC2920813C2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DS0PR11MB871832818742B56736EC2920813C2@DS0PR11MB8718.namprd11.prod.outlook.com>
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

On 07/05/2026 08:37, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 05 May 2026 14:14
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>;
>> thomas.hellstrom@linux.intel.com; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: Re: [RFC PATCH V7 10/10] drm/xe/cri: Add sysfs interface for bad gpu
>> vram pages
>>
>> On 04/05/2026 10:02, Upadhyay, Tejas wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: 30 April 2026 19:23
>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>> xe@lists.freedesktop.org
>>>> Cc: Brost, Matthew <matthew.brost@intel.com>;
>>>> thomas.hellstrom@linux.intel.com; Ghimiray, Himal Prasad
>>>> <himal.prasad.ghimiray@intel.com>
>>>> Subject: Re: [RFC PATCH V7 10/10] drm/xe/cri: Add sysfs interface for
>>>> bad gpu vram pages
>>>>
>>>> On 16/04/2026 08:49, Tejas Upadhyay wrote:
>>>>> Starting CRI, Include a sysfs interface designed to expose
>>>>> information about bad VRAM pages—those identified as having hardware
>>>>> faults (e.g., ECC errors). This interface allows userspace tools and
>>>>> administrators to monitor the health of the GPU's local memory and
>>>>> track the status of page retirement.To get details on bad gpu vram
>>>>> pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.
>>>>>
>>>>> Where The format is, pfn : gpu page size : flags
>>>>
>>>> With "gpu page size" this is really just the min block size?
>>>> gpu-page-size is normally interpreted as GTT page size, which is a
>>>> different thing. But is that not always 4K here? Since that is the
>>>> granularity of the addr reservation? Is it useful to print that? Is
>>>> knowing that pfn x is offlined not enough?
>>>
>>> I think you are right, its always 4K. But I will check with Aravind as for what
>> reason design doc is saying format to be  "pfn : gpu page size : flags". Adding
>> him in cc.
>>>
>>>>
>>>> Also what is the story if you have multiple VRAM instances here?
>>>> There is only one vram_bad_pages file? Would this treat VRAM as one giant
>> unified thing?
>>>
>>> This is targeted for CRI, thus single VRAM is in reference right now. We can
>> extend in future if need be or may be it will single huge thing only in future for
>> multiple vram.
>>
>> Since this is uapi, I think would be good to be forward looking and make sure
>> we don't need to complety re-design if now asked to support multiple VRAM
>> instances. I think one flat unfied thing listing all the pfns, should work, but I
>> guess depends on the consumer of this and how they are going to use this.
> 
> I discussed with Aravind, it is intended for one big thing only not per VRAM, no such requirement. Also the gpu_page_size could be 4K now but for future compatibility, like we had in PVC for some cases we had 64K page size, we kept it in format.

The PVC 64K page (and some early BMG), was a GTT page thing, so from 
allocator pov you could still allocate 4K, and I think we did exactly 
that for memory that was never touched via GTT. If the FW gives 64K 
addresses then I think makes sense.

Also just realised we might get some funny behaviour with CPU PAGE_SIZE 
!= 4K, since allocator chunk_size will currently match the CPU 
PAGE_SIZE. Driver doesn't yet support that fully, but might in the future.

Perhaps just "PFN size: <>" at the top, instead of repeating on every 
line? AFAICT it should always be the same, on that machine?

> 
> Tejas
>>
>>>
>>> Tejas
>>>>
>>>>>
>>>>> flags:
>>>>> R: reserved, this gpu page is reserved.
>>>>> P: pending for reserve, this gpu page is marked as bad, will be reserved
>>>>>       in next window of page_reserve.
>>>>> F: unable to reserve. this gpu page can’t be reserved due to some reasons.
>>>>>
>>>>> For example if you read using cat
>>>>> /sys/bus/pci/devices/bdf/vram_bad_pages,
>>>>> max_pages : 10000
>>>>> 0x00000000 : 0x00001000 : R
>>>>> 0x00001234 : 0x00001000 : P
>>>>>
>>>>> v3:
>>>>> - Move FW communication in RAS code
>>>>> v2:
>>>>> - Add max_pages info as per updated design doc
>>>>> - Rebase
>>>>>
>>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_device_sysfs.c       |  7 ++
>>>>>     drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 79
>>>> ++++++++++++++++++++++
>>>>>     drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  1 +
>>>>>     drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>>>>>     4 files changed, 89 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> index a73e0e957cb0..47c5be4180fe 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>>> @@ -8,12 +8,14 @@
>>>>>     #include <linux/pci.h>
>>>>>     #include <linux/sysfs.h>
>>>>>
>>>>> +#include "xe_configfs.h"
>>>>>     #include "xe_device.h"
>>>>>     #include "xe_device_sysfs.h"
>>>>>     #include "xe_mmio.h"
>>>>>     #include "xe_pcode_api.h"
>>>>>     #include "xe_pcode.h"
>>>>>     #include "xe_pm.h"
>>>>> +#include "xe_ttm_vram_mgr.h"
>>>>>
>>>>>     /**
>>>>>      * DOC: Xe device sysfs
>>>>> @@ -267,6 +269,7 @@ static const struct attribute_group
>>>> auto_link_downgrade_attr_group = {
>>>>>     int xe_device_sysfs_init(struct xe_device *xe)
>>>>>     {
>>>>>     	struct device *dev = xe->drm.dev;
>>>>> +	bool policy;
>>>>>     	int ret;
>>>>>
>>>>>     	if (xe->d3cold.capable) {
>>>>> @@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>>>     			return ret;
>>>>>     	}
>>>>>
>>>>> +	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
>>>>> +	if (xe->info.platform == XE_CRESCENTISLAND && policy)
>>>>> +		xe_ttm_vram_sysfs_init(xe);
>>>>> +
>>>>>     	return 0;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> index 7f58e7e8c3e1..611d945c9eb4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> @@ -760,3 +760,82 @@ int xe_ttm_vram_handle_addr_fault(struct
>>>> xe_device *xe, unsigned long addr)
>>>>>     	return ret;
>>>>>     }
>>>>>     EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>>>>> +
>>>>> +static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct
>>>>> +xe_ttm_vram_mgr *mgr) {
>>>>> +	const unsigned int element_size = sizeof("0xabcdabcd : 0x12345678 :
>>>> R\n") - 1;
>>>>> +	const unsigned int maxpage_size = sizeof("max_pages: 10000\n") - 1;
>>>>> +	struct xe_ttm_vram_offline_resource *pos, *n;
>>>>> +	struct gpu_buddy_block *block;
>>>>> +	ssize_t s = 0;
>>>>> +
>>>>> +	mutex_lock(&mgr->lock);
>>>>> +	s += scnprintf(&buf[s], maxpage_size + 1, "max_pages: %d\n", mgr-
>>>>> max_pages);
>>>>> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages,
>>>>> +offlined_link)
>>>> {
>>>>> +		block = list_first_entry(&pos->blocks,
>>>>> +					 struct gpu_buddy_block,
>>>>> +					 link);
>>>>> +		s += scnprintf(&buf[s], element_size + 1,
>>>>> +			       "0x%08llx : 0x%08llx : %1s\n",
>>>>> +			       gpu_buddy_block_offset(block) >> PAGE_SHIFT,
>>>>> +			       gpu_buddy_block_size(&mgr->mm, block),
>>>>> +			       "R");
>>>>> +	}
>>>>> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link)
>>>> {
>>>>> +		block = list_first_entry(&pos->blocks,
>>>>> +					 struct gpu_buddy_block,
>>>>> +					 link);
>>>>> +		s += scnprintf(&buf[s], element_size + 1,
>>>>> +			       "0x%08llx : 0x%08llx : %1s\n",
>>>>> +			       gpu_buddy_block_offset(block) >> PAGE_SHIFT,
>>>>> +			       gpu_buddy_block_size(&mgr->mm, block),
>>>>> +			       pos->status ? "P" : "F");
>>>>> +	}
>>>>> +	mutex_unlock(&mgr->lock);
>>>>> +}
>>>>> +
>>>>> +static ssize_t vram_bad_pages_show(struct device *dev, struct
>>>>> +device_attribute *attr, char *buf) {
>>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> +	struct ttm_resource_manager *man;
>>>>> +	struct xe_ttm_vram_mgr *mgr;
>>>>> +
>>>>> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
>>>>> +	if (man) {
>>>>> +		mgr = to_xe_ttm_vram_mgr(man);
>>>>> +		xe_ttm_vram_dump_bad_pages_info(buf, mgr);
>>>>> +	}
>>>>> +
>>>>> +	return sysfs_emit(buf, "%s\n", buf); } static
>>>>> +DEVICE_ATTR_RO(vram_bad_pages);
>>>>> +
>>>>> +static void xe_ttm_vram_sysfs_fini(void *arg) {
>>>>> +	struct xe_device *xe = arg;
>>>>> +
>>>>> +	device_remove_file(xe->drm.dev, &dev_attr_vram_bad_pages); }
>>>>> +
>>>>> +/**
>>>>> + * xe_ttm_vram_sysfs_init - Initialize vram sysfs component
>>>>> + * @tile: Xe Tile object
>>>>> + *
>>>>> + * It needs to be initialized after the main tile component is
>>>>> +ready
>>>>> + *
>>>>> + * Returns: 0 on success, negative error code on error.
>>>>> + */
>>>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe) {
>>>>> +	int err;
>>>>> +
>>>>> +	err = device_create_file(xe->drm.dev, &dev_attr_vram_bad_pages);
>>>>> +	if (err) {
>>>>> +		dev_err(xe->drm.dev, "Failed to create vram_bad_pages sysfs
>>>> file: %d\n", err);
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	return devm_add_action_or_reset(xe->drm.dev,
>>>> xe_ttm_vram_sysfs_fini,
>>>>> +xe); } EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>>> index 8ef06d9d44f7..c33e1a8d9217 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>>> @@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct
>>>> ttm_resource_manager *man,
>>>>>     			  u64 *used, u64 *used_visible);
>>>>>
>>>>>     int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned
>>>>> long addr);
>>>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
>>>>>     static inline struct xe_ttm_vram_mgr_resource *
>>>>>     to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>>>>>     {
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>>>> index 07ed88b47e04..b23796066a1a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>>>> @@ -39,6 +39,8 @@ struct xe_ttm_vram_mgr {
>>>>>     	u32 mem_type;
>>>>>     	/** @offline_mode: debugfs hook for setting page offline mode */
>>>>>     	u64 offline_mode;
>>>>> +	/** @max_pages: max pages that can be in offline queue retrieved
>>>> from FW */
>>>>> +	u16 max_pages;
>>>>>     };
>>>>>
>>>>>     /**
>>>
> 

