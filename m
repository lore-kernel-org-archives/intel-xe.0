Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2702BC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 16:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086310E046;
	Tue, 16 Jan 2024 16:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FBD10E046
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705424301; x=1736960301;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Hl7SBlOMH3jBIWxPL8zF7Dkx+hX7Z0XBSLmPvu1olAY=;
 b=Ih+kX++KpNAwebrJK7l6EaAo7nVTSSIi9NfCzmE0Y1fnigaXnsXQUEDl
 +C+KzlijH35EIzrP4RWSPgFzItLKTKUyG7hEqJYSarIeaFzVujriHKWbQ
 Kws2xo35PScXvNCpQVRPrdVUQ8tHfpg3HbBUgzliNA8yPIdsR+28hrAHZ
 VBAJOUwv0UO8OjcAGuQqIRNpPzldBZpDUYuSDxQ1IYOo5gXJi6KSJEnr5
 U4YHMcX6PjRyGmJx6v8svz4BlwNhoDZ77jW0iRKDPC5NFyfQSP/pTyhs3
 YvHQRtlJPFucfKB8qdA7IUIHXfB6INl18h7k6Xrx/pEAizPnDlV2WreCn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486076800"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="486076800"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 08:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854406428"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854406428"
Received: from mgouicem-mobl2.ger.corp.intel.com (HELO [10.249.38.232])
 ([10.249.38.232])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 08:58:19 -0800
Message-ID: <ecf33bc1-2203-4692-b3d0-fbb70e50a25a@linux.intel.com>
Date: Tue, 16 Jan 2024 17:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Add uapi for dumpable bos
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
 <da54a2ad4a494d70dd550b3561c61b20a18d119c.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <da54a2ad4a494d70dd550b3561c61b20a18d119c.camel@intel.com>
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



On 2024-01-12 18:19, Souza, Jose wrote:
> On Fri, 2024-01-12 at 13:41 +0100, Maarten Lankhorst wrote:
>> Add the flag XE_VM_BIND_FLAG_DUMPABLE to notify devcoredump that this
>> mapping should be dumped.
>>
>> This is not hooked up, but the uapi should be ready before merging.
>>
>> It's likely easier to dump the contents of the bo's at devcoredump
>> readout time, so it's better if the bos will stay unmodified after
>> a hang. The NEEDS_CPU_MAPPING flag is removed as requirement.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 8 +++-----
>>   include/uapi/drm/xe_drm.h  | 1 +
>>   2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a7e7a0b24099..0a3b9c0ad772 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2687,12 +2687,13 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>   #ifdef TEST_VM_ASYNC_OPS_ERROR
>>   #define SUPPORTED_FLAGS	\
>>   	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
>> -	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
>> +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
>>   #else
>>   #define SUPPORTED_FLAGS	\
>>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
>> -	 0xffff)
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | 0xffff)
>>   #endif
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>> @@ -2919,9 +2920,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u16 pat_index = bind_ops[i].pat_index;
>>   		u16 coh_mode;
>>   
>> -		if (!obj)
>> -			continue;
>> -
> 
> Why are you dropping this ^
> Without this block DRM_XE_VM_BIND_FLAG_NULL binds fails.
I have no idea why this is there, that also explains why my userptr 
stuff failed. Had to readd the check, but didn't notice I removed it in 
the first place. :)

Cheers,
~Maarten
