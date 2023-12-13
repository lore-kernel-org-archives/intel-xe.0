Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C969C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 23:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3048610E86F;
	Wed, 13 Dec 2023 23:04:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2FB10E86F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 23:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702508694; x=1734044694;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8YQ6qjrahPi6oIq6kj6o5UF8Vj4AeuyVneZWOFTcVBc=;
 b=BO2aXk2HWQwmNHZBEX29tAb0NBhqanQgsspV1FS+6GCdWITAB3SDdNNR
 2UKhqedvdtxQR6ftj1ql5l5rkuyMTf8dkG86Og6G7OZsss54W9YQSGU1j
 cvinD+lqSFHHtIcVSKt1nx//b06Ea16XB2R4nu6SLt9e3012m83OdVftn
 wgQudCsb8EnglumWEYiJl9GCQT2Dm2RsCOUBoOpRzLw9Etdxl27VOrgt+
 avaqmZYz2hHeGRu16RGSnySzUGgWn0XmNtSj0RbKgQu0m7TMf2mXhRNnv
 2gsTPysUOZ54bw213I2V0Iq2Z6+dYTZGQA6O73xURgP0bmevevTBInv0w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8435413"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8435413"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 15:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1021296597"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="1021296597"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2023 15:04:51 -0800
Received: from [10.249.145.20] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.145.20])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8656836372;
 Wed, 13 Dec 2023 23:04:49 +0000 (GMT)
Message-ID: <414be183-38f8-480e-9532-4abfb6062e74@intel.com>
Date: Thu, 14 Dec 2023 00:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/xe: Add device flag for memory based IRQ support
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-2-michal.wajdeczko@intel.com>
 <20231212214114.GH1327160@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231212214114.GH1327160@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.12.2023 22:41, Matt Roper wrote:
> On Tue, Dec 12, 2023 at 10:00:45PM +0100, Michal Wajdeczko wrote:
>> The register based interrupts infrastructure does not scale
>> efficiently to allow delivering interrupts to a large number
>> of virtual machines. Memory based interrupt reporting provides
>> an efficient and scalable infrastructure.
>>
>> Define device flag to indicate which platforms will use memory
>> based interrupts for delivering interrupts to VFs.
> 
> It doesn't look like this flag actually gets set on any devices in this
> series.  

I was assuming that it would be better to wait with turning it on when
we will be enabling has_sriov flag, but OTOH memirq won't work without
has_sriov, so it could be done in this series, if this is preferable

> If I'm reading correctly, this flag should apply to every
> platform with Xe_HP IP onward, right?  Do we expect there to ever be
> future platforms that don't support memory-based IRQ?  If not, I'm not

spec says memirq is for "SRIOV-64 or SIOV mode" so in theory, future
SRIOV-7 platforms may still use register based irq

> sure if we even really need this feature flag and we could just do
> 
>         static inline bool xe_device_has_memirq(struct xe_device *xe)
>         {
>         	return GRAPHICS_VERx100(xe) >= 1250;
>         }
> 
> instead?

but since this will work for current platforms, we can start with and
switchover to flag when needed

Thanks,
Michal

> 
> 
> Matt
> 
>>
>> Bspec: 50829
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.h       | 5 +++++
>>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>>  3 files changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 3da83b233206..0b158d0d04e4 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -168,6 +168,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>>  	return xe->info.has_sriov;
>>  }
>>  
>> +static inline bool xe_device_has_memirq(struct xe_device *xe)
>> +{
>> +	return xe->info.has_memirq;
>> +}
>> +
>>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index d1a48456e9a3..0c48e3686837 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -259,6 +259,8 @@ struct xe_device {
>>  		u8 has_flat_ccs:1;
>>  		/** @has_llc: Device has a shared CPU+GPU last level cache */
>>  		u8 has_llc:1;
>> +		/** @has_memirq: Using memory based IRQ */
>> +		u8 has_memirq:1;
>>  		/** @has_mmio_ext: Device has extra MMIO address range */
>>  		u8 has_mmio_ext:1;
>>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 260e8a6034a7..11559669cb8a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -64,6 +64,7 @@ struct xe_device_desc {
>>  	u8 has_display:1;
>>  	u8 has_heci_gscfi:1;
>>  	u8 has_llc:1;
>> +	u8 has_memirq:1;
>>  	u8 has_mmio_ext:1;
>>  	u8 has_sriov:1;
>>  	u8 skip_guc_pc:1;
>> @@ -551,6 +552,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>  	xe->info.is_dgfx = desc->is_dgfx;
>>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>  	xe->info.has_llc = desc->has_llc;
>> +	xe->info.has_memirq = desc->has_memirq;
>>  	xe->info.has_mmio_ext = desc->has_mmio_ext;
>>  	xe->info.has_sriov = desc->has_sriov;
>>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>> -- 
>> 2.25.1
>>
> 
