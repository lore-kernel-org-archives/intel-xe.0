Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1413E743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985D210E0DD;
	Fri, 29 Sep 2023 05:52:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3F710E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695966744; x=1727502744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p9DbfTqIFTyvr2aNgVWpq1fJYOwRMi2KLNzZc39jbzQ=;
 b=WJ4n7cNTa+vf/4hGrPwnlPwI7olB3kURWSmNFjfQ/DoAQIWiqEg9KmzZ
 i0zurKM7wiFd7xGKD12lRevtxC9nnKVUkaEvzIMym1BLmgZMo2Uv4yERk
 ej0BiAqd4oFs/M5jV6mN1w8Kia3kg56l5R4sh64/qUMKRtgZMBl6pfLJI
 Ah3dNgEZQFIn52jTlbGN3MWM1oajdoV3RPmDloX4CMGmn/8Hl60/03g3D
 97EVpxiMMWtDJOTgHKECj+aqOXS//Awc+b2bYMSepAuJko7MvljDVIq+j
 oNBuIBRdRzXASrHzaJyeirk5RqnMRYaUrnVMpxk1deZPxsKoHMTQRApXl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="361615259"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="361615259"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080816977"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="1080816977"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:52:22 -0700
Message-ID: <42fe2e87-c59c-6bfe-c86a-79b3b91521fd@linux.intel.com>
Date: Fri, 29 Sep 2023 11:25:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230925144359.192835-1-tejas.upadhyay@intel.com>
 <20230925144359.192835-2-tejas.upadhyay@intel.com>
 <543afa35-9987-a7da-f520-055af327c2fc@linux.intel.com>
 <SJ1PR11MB62040D3991E67B0DD1ABC94281C2A@SJ1PR11MB6204.namprd11.prod.outlook.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <SJ1PR11MB62040D3991E67B0DD1ABC94281C2A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH V3 1/2] drm/xe: Indroduce low level driver
 error counting APIs
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 27/09/23 19:03, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Sent: Wednesday, September 27, 2023 3:29 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: Re: [Intel-xe] [PATCH V3 1/2] drm/xe: Indroduce low level driver error
>> counting APIs
>>
>>
>> On 25/09/23 20:13, Tejas Upadhyay wrote:
>>> Low level driver error that might have power or performance impact on
>>> the system, we are adding a new error counter to GT and tile and
>>> increment on each occurrance. Lets introduce APIs to define and
>>> increment each error type counter.
>>>
>>> V3:
>>>   - correct #define max value
>>> V2:
>>>   - Move some code to its related patch - Michal
>>>   - Renaming if API and enum - Michal
>>>   - GUC errors are moved per GT - Michal
>>>   - Some nits - Michal
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.h       |  2 ++
>>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>>>  drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_gt.h           |  3 +++
>>>  drivers/gpu/drm/xe/xe_gt_types.h     | 10 ++++++++++
>>>  drivers/gpu/drm/xe/xe_tile.c         | 18 ++++++++++++++++++
>>>  6 files changed, 60 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>> b/drivers/gpu/drm/xe/xe_device.h index c4232de40ae0..b44c91d1cec9
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -159,5 +159,7 @@ static inline bool xe_device_has_flat_ccs(struct
>>> xe_device *xe)  }
>>>
>>>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>> +void xe_tile_report_driver_error(struct xe_tile *tile,
>>> +				 const enum xe_tile_drv_err_type err);
>>>
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 32ab0fea04ee..a28e140f9e64 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -57,6 +57,12 @@ struct xe_ggtt;
>>>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),
>> 	\
>>>  		 struct xe_tile * : (tile__)->xe)
>>>
>>> +#define XE_TILE_DRV_ERR_MAX	2
>> this shall be part of below enum no need to define separately
>>> +enum xe_tile_drv_err_type {
>>> +	XE_TILE_DRV_ERR_GGTT,
>>> +	XE_TILE_DRV_ERR_INTR
>>> +};
> Hi Aravind, it was done same way in previous version, but Michal's comment was if someone passes " XE_TILE_DRV_ERR_MAX" then compiler wont throw an error. So better to define outside which I don’t think is bad idea.

in that case do like this, so one would not accidentally miss updating the max when enum is updated.

enum xe_tile_drv_err_type {
    XE_TILE_DRV_ERR_GGTT,
    XE_TILE_DRV_ERR_INTR
    __XE_TILE_DRV_ERR_MAX
};

#define XE_TILE_DRV_ERR_MAX __XE_TILE_DRV_ERR_MAX

Thanks,
Aravind.
>
> Thanks,
> Tejas
>>> +
>>>  /**
>>>   * struct xe_mem_region - memory region structure
>>>   * This is used to describe a memory region in xe @@ -173,6 +179,9 @@
>>> struct xe_tile {
>>>
>>>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>>>  	struct kobject *sysfs;
>>> +
>>> +	/** @drv_err_cnt: driver error counter for this tile */
>>> +	u32 drv_err_cnt[XE_TILE_DRV_ERR_MAX];
>>>  };
>>>
>>>  /**
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 1aa44d4f9ac1..a1a0eb59ecc5 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -47,6 +47,24 @@
>>>  #include "xe_wa.h"
>>>  #include "xe_wopcm.h"
>>>
>>> +/**
>>> + * xe_gt_report_driver_error - Count driver err for gt
>> %s/err/error/g
>>> + * @gt: GT to count error for
>>> + * @err: enum error type
>>> + *
>>> + * Increment the driver error counter in respective error
>>> + * category for this GT.
>>> + *
>>> + * Returns void.
>>> + */
>>> +void xe_gt_report_driver_error(struct xe_gt *gt,
>>> +			       const enum xe_gt_drv_err_type err) {
>>> +	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
>>> +	WRITE_ONCE(gt->drv_err_cnt[err],
>>> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1); }
>>> +
>>>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)  {
>>>  	struct xe_gt *gt;
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index caded203a8a0..9442d615042f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt,
>> struct xe_hw_engine *hwe)
>>>  		hwe->instance == gt->usm.reserved_bcs_instance;  }
>>>
>>> +void xe_gt_report_driver_error(struct xe_gt *gt,
>>> +			       const enum xe_gt_drv_err_type err);
>>> +
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> index d4310be3e1e7..4645ea9b7893 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> @@ -24,6 +24,13 @@ enum xe_gt_type {
>>>  	XE_GT_TYPE_MEDIA,
>>>  };
>>>
>>> +#define XE_GT_DRV_ERR_MAX	3
>> same here add to below enum
>>> +enum xe_gt_drv_err_type {
>>> +	XE_GT_DRV_ERR_GUC_COMM,
>>> +	XE_GT_DRV_ERR_ENGINE,
>>> +	XE_GT_DRV_ERR_OTHERS
>>> +};
>>> +
>>>  #define XE_MAX_DSS_FUSE_REGS	3
>>>  #define XE_MAX_EU_FUSE_REGS	1
>>>
>>> @@ -347,6 +354,9 @@ struct xe_gt {
>>>  		/** @oob: bitmap with active OOB workaroudns */
>>>  		unsigned long *oob;
>>>  	} wa_active;
>>> +
>>> +	/** @drv_err_cnt: driver error counter for this GT */
>>> +	u32 drv_err_cnt[XE_GT_DRV_ERR_MAX];
>>>  };
>>>
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_tile.c
>>> b/drivers/gpu/drm/xe/xe_tile.c index 131752a57f65..4090798aff4c 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>>> @@ -71,6 +71,24 @@
>>>   *  - MOCS and PAT programming
>>>   */
>>>
>>> +/**
>>> + * xe_tile_report_driver_error - Count driver err for tile
>> %s/err/error/g
>>> + * @tile: Tile to count error for
>>> + * @err: enum error type
>>> + *
>>> + * Increment the driver error counter in respective error
>>> + * category for this tile.
>>> + *
>>> + * Returns void.
>>> + */
>>> +void xe_tile_report_driver_error(struct xe_tile *tile,
>>> +				 const enum xe_tile_drv_err_type err) {
>>> +	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
>>> +	WRITE_ONCE(tile->drv_err_cnt[err],
>>> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1); }
>>> +
>>>  /**
>>>   * xe_tile_alloc - Perform per-tile memory allocation
>>>   * @tile: Tile to perform allocations for
>> Thanks,
>> Aravind.
