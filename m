Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED136C5DF73
	for <intel-xe@archiver.kernel.org>; Sun, 22 Feb 2026 05:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737BC10E0D8;
	Sun, 22 Feb 2026 05:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSOS8/ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147C810E0D8
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Feb 2026 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771738394; x=1803274394;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=npzo5+daYP+3JHmRyNYFZe2JavWXFFIKTnho2tSPBJg=;
 b=lSOS8/obfL6LnrMPFGkVaESu6svSVQHGZys5mFYlclX/LXbQy9WUas7f
 ymps1uLrsPAdv4duuxAtY1uH1YvlNDJSo510XQwjcHAKFsL8TO5eUavI5
 qBbWnbe7qIuwSRv18bAEZkSBng7+/5XOcUuhyxuafaYaXb9/1JpTON7pX
 eWruLuaACpkM04RT2Q+h88ROW62wnb7s96AHnf8TMdADE3Rz89KxWjNd7
 kw2beFlj4IBlifGJouIaSaGMYSisS1Qj9u+zRTeluM0BRTSuyrv+SYaI2
 Fmh0l8LCaDSj5Ukj1ljeCEE5PDp/YjTyp1lG00KUY1Wvpe35Ziji4EaEz Q==;
X-CSE-ConnectionGUID: I8d+28R4T2CpnnaKf8r1kw==
X-CSE-MsgGUID: xDI2K21nQ8S879OYVWYoNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72673741"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="72673741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 21:33:13 -0800
X-CSE-ConnectionGUID: 1DDZjWBMQFG+u7LovWTKRQ==
X-CSE-MsgGUID: +9gNGzcNQjylXCO8u7a8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="219742881"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.15.206])
 ([10.247.15.206])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 21:33:11 -0800
Message-ID: <b9935489-ddef-4cb7-8563-ed1d4fcadb88@linux.intel.com>
Date: Sun, 22 Feb 2026 11:02:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface
 for bad gpu vram pages
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
 <20260213092552.1527799-14-tejas.upadhyay@intel.com>
 <aZUJy5baVacPxGM9@intel.com>
 <0ba5c665-e37b-41b5-9692-9f02f30682de@linux.intel.com>
 <943a10ec67eb0de1d050bb90eda30f0826587b1b.camel@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <943a10ec67eb0de1d050bb90eda30f0826587b1b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 20-02-2026 20:22, Vivi, Rodrigo wrote:
> On Fri, 2026-02-20 at 16:48 +0530, Aravind Iddamsetty wrote:
>> On 18-02-2026 06:07, Rodrigo Vivi wrote:
>>> On Fri, Feb 13, 2026 at 02:55:59PM +0530, Tejas Upadhyay wrote:
>>>> Starting CRI, Include a sysfs interface designed to expose
>>>> information
>>>> about bad VRAM pages—those identified as having hardware faults
>>>> (e.g., ECC errors). This interface allows userspace tools and
>>>> administrators to monitor the health of the GPU's local memory
>>>> and
>>>> track the status of page retirement.To get details on bad gpu
>>>> vram
>>>> pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.
>>>>
>>>> Where The format is, pfn : gpu page size : flags
>>>>
>>>> flags:
>>>> R: reserved, this gpu page is reserved.
>>>> P: pending for reserve, this gpu page is marked as bad, will be
>>>> reserved in next window of page_reserve.
>>>> F: unable to reserve. this gpu page can’t be reserved due to some
>>>> reasons.
>>>>
>>>> For example if you read using cat
>>>> /sys/bus/pci/devices/bdf/vram_bad_pages,
>>>> 0x00000000 : 0x00001000 : R
>>>> 0x00001234 : 0x00001000 : P
>>> Riana, Raag, Aravind, a good new use case for the drm-ras no?!
>>> Thoughts?
>> In general the feature can be supported via drm-ras framework, but is
>> the motivation to move all error related info to drm-ras, also any
>> gpu
>> hang data, health etc..,
> No, the motivation is not to move everything there.
> I was thinking on the lines of avoiding sysfs. But well, it is only
> one sysfs and I don't believe we would need any notification upon
> new pages marked as bad, or do we?

I do not see a requirement to have any additional notification, as there
would already be a notification for an uncorrectable error.

Thanks,
Aravind.
>
> If we need notifications then sysfs is bad choice and netlink could
> provide info and notification in a single place.
>
>> Thanks,
>> Aravind.
>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_device_sysfs.c |  2 +
>>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 78
>>>> ++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
>>>>  3 files changed, 81 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> index a73e0e957cb0..e6a017601428 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include "xe_pcode_api.h"
>>>>  #include "xe_pcode.h"
>>>>  #include "xe_pm.h"
>>>> +#include "xe_ttm_vram_mgr.h"
>>>>  
>>>>  /**
>>>>   * DOC: Xe device sysfs
>>>> @@ -284,6 +285,7 @@ int xe_device_sysfs_init(struct xe_device
>>>> *xe)
>>>>  		if (ret)
>>>>  			return ret;
>>>>  	}
>>>> +	xe_ttm_vram_sysfs_init(xe);
>>>>  
>>>>  	return 0;
>>>>  }
>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> index cb3394000e83..c6a81ccaa9d2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> @@ -744,3 +744,81 @@ int xe_ttm_tbo_handle_addr_fault(struct
>>>> xe_tile *tile, unsigned long addr)
>>>>  	return ret;
>>>>  }
>>>>  EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
>>>> +
>>>> +static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct
>>>> xe_ttm_vram_mgr *mgr)
>>>> +{
>>>> +	const unsigned int element_size = sizeof("0xabcdabcd :
>>>> 0x12345678 : R\n") - 1;
>>>> +	struct xe_ttm_offline_resource *pos, *n;
>>>> +	struct drm_buddy_block *block;
>>>> +	ssize_t s = 0;
>>>> +
>>>> +	mutex_lock(&mgr->lock);
>>>> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages,
>>>> offlined_link) {
>>>> +		block = list_first_entry(&pos->blocks,
>>>> +					 struct drm_buddy_block,
>>>> +					 link);
>>>> +		s += scnprintf(&buf[s], element_size + 1,
>>>> +			       "0x%08llx : 0x%08llx : %1s\n",
>>>> +			       drm_buddy_block_offset(block) >>
>>>> PAGE_SHIFT,
>>>> +			       drm_buddy_block_size(&mgr->mm,
>>>> block),
>>>> +			       "R");
>>>> +	}
>>>> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages,
>>>> queued_link) {
>>>> +		block = list_first_entry(&pos->blocks,
>>>> +					 struct drm_buddy_block,
>>>> +					 link);
>>>> +		s += scnprintf(&buf[s], element_size + 1,
>>>> +			       "0x%08llx : 0x%08llx : %1s\n",
>>>> +			       drm_buddy_block_offset(block) >>
>>>> PAGE_SHIFT,
>>>> +			       drm_buddy_block_size(&mgr->mm,
>>>> block),
>>>> +			       "P");
>>>> +	}
>>>> +	mutex_unlock(&mgr->lock);
>>>> +}
>>>> +
>>>> +static ssize_t vram_bad_pages_show(struct device *dev, struct
>>>> device_attribute *attr, char *buf)
>>>> +{
>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	struct ttm_resource_manager *man;
>>>> +	u8 mem_type = XE_PL_VRAM1;
>>>> +
>>>> +	do {
>>>> +		man = ttm_manager_type(&xe->ttm, mem_type);
>>>> +		struct xe_ttm_vram_mgr *mgr =
>>>> to_xe_ttm_vram_mgr(man);
>>>> +
>>>> +		if (man)
>>>> +			xe_ttm_vram_dump_bad_pages_info(buf,
>>>> mgr);
>>>> +		--mem_type;
>>>> +	} while (mem_type >= XE_PL_VRAM0);
>>>> +
>>>> +	return sysfs_emit(buf, "%s\n", buf);
>>>> +}
>>>> +static DEVICE_ATTR_RO(vram_bad_pages);
>>>> +
>>>> +static void xe_ttm_vram_sysfs_fini(void *arg)
>>>> +{
>>>> +	struct xe_device *xe = arg;
>>>> +
>>>> +	device_remove_file(xe->drm.dev,
>>>> &dev_attr_vram_bad_pages);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_ttm_vram_sysfs_init - Initialize vram sysfs component
>>>> + * @tile: Xe Tile object
>>>> + *
>>>> + * It needs to be initialized after the main tile component is
>>>> ready
>>>> + *
>>>> + * Returns: 0 on success, negative error code on error.
>>>> + */
>>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe)
>>>> +{
>>>> +	int err;
>>>> +
>>>> +	err = device_create_file(xe->drm.dev,
>>>> &dev_attr_vram_bad_pages);
>>>> +	if (err)
>>>> +		return 0;
>>>> +
>>>> +	return devm_add_action_or_reset(xe->drm.dev,
>>>> xe_ttm_vram_sysfs_fini, xe);
>>>> +}
>>>> +EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>> index 5872e8b48779..6e69140c0be8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>>> @@ -34,6 +34,7 @@ void xe_ttm_vram_get_used(struct
>>>> ttm_resource_manager *man,
>>>>  int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned
>>>> long addr);
>>>>  void xe_ttm_vram_dump_allocated_blocks(struct drm_device *dev,
>>>> struct drm_buddy *mm,
>>>>  				       struct drm_printer *p);
>>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
>>>>  static inline struct xe_ttm_vram_mgr_resource *
>>>>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>>>>  {
>>>> -- 
>>>> 2.52.0
>>>>
