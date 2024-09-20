Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5312BCF58F4
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 09:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0E10E06C;
	Fri, 20 Sep 2024 09:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSQSo3hB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98210E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726823671; x=1758359671;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hGjsrUA/S3MD+NqssmwpheKJmmifcxAv6C65oN0enMg=;
 b=cSQSo3hBh2tOpQEFSewJAGG3tWqnikbcOplo3p5KXjqfl9WNYMHJFgyU
 QL2MmTGnJnROSjFGuZVt8BLqaKR4gyKwQrpnaxXu0XSczMj9R1JfFon98
 QlTaFwJ31v9y5hzgH8gKbv/FlNQOsSi8h65xUldnDWPc9JkZ0/qzK146u
 PMJAGz6AVDswqFZb7i3l4M2bf9hD5k1ZyEJcFVzQBs5t8H4vNIND7KnZk
 8tHRoC8UUGXpLAokFEzfIWjUzDLgVYexLXiVZz8WcORUm56X4tNwqKl6l
 jvOrwxuV1sGPIdS4MhyQhJ3/S/5IvjGq2bvMEegQwGMGvQZXzkzUuxoqo A==;
X-CSE-ConnectionGUID: 9ygZFXTgTAmP1pbThKCt8g==
X-CSE-MsgGUID: 1OyYMHStRdCR9aBuewszGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26007163"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="26007163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 02:14:25 -0700
X-CSE-ConnectionGUID: NWp2GGceQU21n3jW+3cnTA==
X-CSE-MsgGUID: HtmxzYnnSbaZ9NF3GKaEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70683426"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.194.204])
 ([10.245.194.204])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 02:14:22 -0700
Message-ID: <5bd3f627-72fd-43f0-a195-1ad0561c651d@linux.intel.com>
Date: Fri, 20 Sep 2024 11:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not allow scratch page on long running jobs
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240919104704.3591977-1-nirmoy.das@intel.com>
 <ZuxIuCF+dsxOT253@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZuxIuCF+dsxOT253@DUT025-TGLU.fm.intel.com>
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


On 9/19/2024 5:52 PM, Matthew Brost wrote:
> On Thu, Sep 19, 2024 at 12:47:04PM +0200, Nirmoy Das wrote:
>> This was agreed upon but not enforced, so enforce the limitation
>> of not allowing scratch pages on long-running jobs unless absolutely
>> required, which is currently the case for a DG2 SKU.
>>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> I think this type of change we will need a maintainer to bless and
> likely someone from the compute UMD.

Agree. Adding Michal and Rodrigo as well


>
> It does LGTM, with that:
> Acked-by: Matthew Brost <matthew.brost@intel.com>


Thanks,

Nirmoy

>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a3d7cb7cfd22..92dc55f3479b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1711,6 +1711,11 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
>>  	return NULL;
>>  }
>>  
>> +static bool xe_vm_device_requires_scratch_page(struct xe_device *xe)
>> +{
>> +	return XE_WA(xe_root_mmio_gt(xe), 14016763929);
>> +}
>> +
>>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
>>  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>> @@ -1730,7 +1735,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>  	if (XE_IOCTL_DBG(xe, args->extensions))
>>  		return -EINVAL;
>>  
>> -	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>> +	if (xe_vm_device_requires_scratch_page(xe))
>>  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>>  
>>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>> @@ -1747,6 +1752,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>  		return -EINVAL;
>>  
>> +	/*
>> +	 * Scratch page is disabled for long running job unless absolutely
>> +	 * required as this can introduce hidden bugs.
>> +	 */
>> +	if (!xe_vm_device_requires_scratch_page(xe) &&
>> +	    XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
>> +			 (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)))
>> +		return -EINVAL;
>> +
>>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>>  		return -EINVAL;
>> -- 
>> 2.46.0
>>
