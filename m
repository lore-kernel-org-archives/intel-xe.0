Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5203DC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 13:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A455112C9B;
	Tue, 16 Apr 2024 13:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7CC6NJI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552B6112C9D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713274328; x=1744810328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jTPA7Okv9mf4euGY5QQnmyiWzP0LOvoJhysxoDzU110=;
 b=c7CC6NJIkiSRtiPn+3GgDE8vamE9pfo8eg7OElwISjx0iDukYs8LU+qS
 2QBhPJ86ILDeECBY1839j5/4PWRhX55MYoKt59JeTBb+z/+nMUAU3s5/l
 OR+tnpJ6QQARWCt//RS8B7vL/Tklq2dORtVMC3LbhC8BV5mzcQAgEmYhU
 yXRXXII8AHZ39ZD4+F32pf8zbKF3N0mVbL8XkVJA/VwkcBwc0csIWxgew
 0/Pu7LUawLn2PONifR5SnzpyISpbowVPfA/36Zq/cMlaBi7gs9KMIhAlo
 vJILRKpBW9k5Fjd9aIxfQAwLbkKH11WX0xCUqZtdYgmJu39FRbykKWm8v g==;
X-CSE-ConnectionGUID: C+XLfC0hSHWu7omhGyV4Tg==
X-CSE-MsgGUID: 5nEYfxECTLiKtEcTnPjtrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8572604"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8572604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:32:08 -0700
X-CSE-ConnectionGUID: h2b+8ah1TdqK1TuA0u3QUQ==
X-CSE-MsgGUID: d6/RjN4hTmyiPoRd+9nqtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53440001"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:32:06 -0700
Message-ID: <2f2e0bfc-d1cd-4d9e-973c-4cdaacfa89f1@linux.intel.com>
Date: Tue, 16 Apr 2024 15:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/xe: Move vm bind bo validation to a helper
 function
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-5-nirmoy.das@intel.com> <Zh3Mfac/UZ+6K8g3@DUT025-TGLU>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zh3Mfac/UZ+6K8g3@DUT025-TGLU>
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

Hi Matt,

On 4/16/2024 2:55 AM, Matthew Brost wrote:
> On Mon, Apr 15, 2024 at 04:52:11PM +0200, Nirmoy Das wrote:
>> Move vm bind bo validation to a helper function to make the
>> xe_vm_bind_ioctl() more readable.
>>
> Change logs are helpful for reviewers but not going to hold up this
> patch.
Cover letter contains all the changes. I can also copy within the 
patches from the next revision.
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks,

Nirmoy

>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 77 +++++++++++++++++++++-----------------
>>   1 file changed, 43 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index b1dcaa35b6cc..8380f1d23074 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2872,6 +2872,46 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
>>   	return err;
>>   }
>>   
>> +static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>> +					u64 addr, u64 range, u64 obj_offset,
>> +					u16 pat_index)
>> +{
>> +	u16 coh_mode;
>> +
>> +	if (XE_IOCTL_DBG(xe, range > bo->size) ||
>> +	    XE_IOCTL_DBG(xe, obj_offset >
>> +			 bo->size - range)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
>> +		if (XE_IOCTL_DBG(xe, obj_offset &
>> +				 XE_64K_PAGE_MASK) ||
>> +		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
>> +		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
>> +			return  -EINVAL;
>> +		}
>> +	}
>> +
>> +	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>> +	if (bo->cpu_caching) {
>> +		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>> +				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
>> +			return  -EINVAL;
>> +		}
>> +	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
>> +		/*
>> +		 * Imported dma-buf from a different device should
>> +		 * require 1way or 2way coherency since we don't know
>> +		 * how it was mapped on the CPU. Just assume is it
>> +		 * potentially cached on CPU side.
>> +		 */
>> +		return  -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   {
>>   	struct xe_device *xe = to_xe_device(dev);
>> @@ -2955,7 +2995,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u32 obj = bind_ops[i].obj;
>>   		u64 obj_offset = bind_ops[i].obj_offset;
>>   		u16 pat_index = bind_ops[i].pat_index;
>> -		u16 coh_mode;
>>   
>>   		if (!obj)
>>   			continue;
>> @@ -2967,40 +3006,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		}
>>   		bos[i] = gem_to_xe_bo(gem_obj);
>>   
>> -		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
>> -		    XE_IOCTL_DBG(xe, obj_offset >
>> -				 bos[i]->size - range)) {
>> -			err = -EINVAL;
>> -			goto put_obj;
>> -		}
>> -
>> -		if (bos[i]->flags & XE_BO_FLAG_INTERNAL_64K) {
>> -			if (XE_IOCTL_DBG(xe, obj_offset &
>> -					 XE_64K_PAGE_MASK) ||
>> -			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
>> -			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
>> -				err = -EINVAL;
>> -				goto put_obj;
>> -			}
>> -		}
>> -
>> -		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>> -		if (bos[i]->cpu_caching) {
>> -			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>> -					 bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
>> -				err = -EINVAL;
>> -				goto put_obj;
>> -			}
>> -		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
>> -			/*
>> -			 * Imported dma-buf from a different device should
>> -			 * require 1way or 2way coherency since we don't know
>> -			 * how it was mapped on the CPU. Just assume is it
>> -			 * potentially cached on CPU side.
>> -			 */
>> -			err = -EINVAL;
>> +		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
>> +						   obj_offset, pat_index);
>> +		if (err)
>>   			goto put_obj;
>> -		}
>>   	}
>>   
>>   	if (args->num_syncs) {
>> -- 
>> 2.42.0
>>
