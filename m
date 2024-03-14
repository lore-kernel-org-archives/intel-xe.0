Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2EC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552510F89A;
	Thu, 14 Mar 2024 03:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs4VibMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5510F89C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710387022; x=1741923022;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=LV+wyK8bDgjsFqlYCHacXiu7V+3SRwC1WaWmq6pEJvw=;
 b=Cs4VibMQmYhthc/x1Ynq2IsQvhv0fxzef7dOrjsFgRI1wQPtv0P0PXps
 g1KO5WvWVXfv6Lr4zHRvaEa90ocPKMb/8AtTAFykoWedUnYR31YospP3r
 jhG/PusoWoMkywiEDP5PdfGOnBUVvBjrqbGXld9glRTrysXCOU1+6iGWi
 ZUaDG5wXvqAofeGkBzKWrqAy4YNIv1XC2Ynj9WqkU+wNdGpHf0ujMv+eW
 sYycS+qyQ+BmXCJeVRfzJxMktgJZFNmb3UMRmfFzw0i9g3Yq2grpVTceo
 9tutoi0TK9CUoSGjg/BaDlFvF7n4vHJWitIGEld2O9aM0FJwMVImbdz+9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="9005756"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="9005756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="49590967"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:30:20 -0700
Message-ID: <ebc3280e-ef66-48a3-b307-9eb9d4760b9d@linux.intel.com>
Date: Thu, 14 Mar 2024 09:03:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple wedged state
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <8609d8ba-7a7f-4513-9cda-ad5029f6cccf@linux.intel.com>
In-Reply-To: <8609d8ba-7a7f-4513-9cda-ad5029f6cccf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 14/03/24 07:10, Aravind Iddamsetty wrote:
> On 14/03/24 01:24, Rodrigo Vivi wrote:
>
> Hi Rodrigo,
>
>> Introduce a very simple 'wedged' state where any attempt
>> to access the GPU is entirely blocked.
>>
>> On some critical cases, like on gt_reset failure, we need to
>> block any other attempt to use the GPU. Otherwise we are at
>> a risk of reaching cases that would force us to reboot the machine.
>>
>> So, when this cases are identified we corner and block any GPU
>> access. No IOCTL and not even another GT reset should be attempted.
>>
>> The 'wedged' state in Xe is an end state with no way back.
>> Only a module reload can restore the GPU access.
> I believe we should also expose this wedged state to userspace so that
> any admin can take action, typically sysman is interested to know that.
>
> A sysfs at the pci device level?
>
> Thanks,
> Aravind.
Also, I feel at this point we can reintroduce the RESET_REQUIRED uevent
when GT reset fails, which we dropped for realignment purpose.

Thanks,

Aravind.
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>>  drivers/gpu/drm/xe/xe_device.h       | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>>  drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
>>  drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
>>  5 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 919ad88f0495..5f0a2bdb7c24 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>>  	long ret;
>>  
>> +	if (xe_device_wedged(xe))
>> +		return -ECANCELED;
>> +
>>  	ret = xe_pm_runtime_get_ioctl(xe);
>>  	if (ret >= 0)
>>  		ret = drm_ioctl(file, cmd, arg);
>> @@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>>  	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
>>  	long ret;
>>  
>> +	if (xe_device_wedged(xe))
>> +		return -ECANCELED;
>> +
>>  	ret = xe_pm_runtime_get_ioctl(xe);
>>  	if (ret >= 0)
>>  		ret = drm_compat_ioctl(file, cmd, arg);
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 14be34d9f543..d10664d32f7f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -176,4 +176,15 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>>  
>> +static inline bool xe_device_wedged(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->wedged);
>> +}
>> +
>> +static inline void xe_device_declare_wedged(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->wedged, 1);
>> +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>> +}
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 9785eef2e5a4..13971eb2334f 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -455,6 +455,12 @@ struct xe_device {
>>  	/** @needs_flr_on_fini: requests function-reset on fini */
>>  	bool needs_flr_on_fini;
>>  
>> +	/**
>> +	 * @wedged: Xe device faced a critical error and is now blocked.
>> +	 * It cannot return to life without a module reload.
>> +	 */
>> +	atomic_t wedged;
>> +
>>  	/* private: */
>>  
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 85408e7a932b..972c0c6d0608 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
>>  {
>>  	int err;
>>  
>> +	if (xe_device_wedged(gt_to_xe(gt)))
>> +	    return -ECANCELED;
>> +
>>  	/* We only support GT resets with GuC submission */
>>  	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>>  		return -ENODEV;
>> @@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
>>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>>  
>>  	gt_to_xe(gt)->needs_flr_on_fini = true;
>> +	xe_device_declare_wedged(gt_to_xe(gt));
>>  
>>  	return err;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index ee1bb938c493..5b2eeb2048b5 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>>  		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>>  	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>>  
>> +	if (xe_device_wedged(xe))
>> +	    return ERR_PTR(-ECANCELED);
>> +
>>  	/* Copying CCS between two different BOs is not supported yet. */
>>  	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
>>  		return ERR_PTR(-EINVAL);
>> @@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>  	int err;
>>  	int pass = 0;
>>  
>> +	if (xe_device_wedged(xe))
>> +	    return ERR_PTR(-ECANCELED);
>> +
>>  	if (!clear_vram)
>>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
>>  	else
