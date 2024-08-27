Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DF4C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 21:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761CE10E406;
	Tue, 27 Aug 2024 21:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFKXQsD2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794810E406
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724792724; x=1756328724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2gDKCqAqWGdURRQjHhBgp8Nj/uCDlhHiIZYtebZp3E8=;
 b=XFKXQsD2IXgaV4bt2q5nlL8Z/E+w9k6c35zc9sYG9OeRUlFAR5f1uzmM
 gEo4fXUrCdyvlOOz981+h4Hbf+XztgxsX1jNpX/+0oL1fy6uaAdtTl/ls
 Iv3tSELH4/Af00dDwTxvuvenR63UlWNW1DDrn4aWbR88Dg1bb4HbhGBaI
 9b6Ojld/Ow8+DZ5fYyFGiqaElIgmA5UF2dVNntG8f2r+NxmPrMftzL5MR
 6rwRkzbbddbafjQ1HIwRxzKRBHt7858DXjhhMrSJ7gnKjBrt+hSO8ilkX
 da+AzGf9oSb0/1opjtPIyxChI9CM1ApJW7LjNXrknWgX3Lyth9mJbvyBY A==;
X-CSE-ConnectionGUID: wJGlMauoQ9SZqIehXEG5qA==
X-CSE-MsgGUID: VkN6nv1FTaytzAMblZXhNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23441490"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23441490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 14:05:24 -0700
X-CSE-ConnectionGUID: 8iauxFlHQYKJFs/NPZrtYA==
X-CSE-MsgGUID: JlpBpqptTC6X3pQy5GUXug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67147651"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 27 Aug 2024 14:05:22 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E592C312C9;
 Tue, 27 Aug 2024 22:05:20 +0100 (IST)
Message-ID: <ec9329db-17ba-4bbc-8587-19862d685fa0@intel.com>
Date: Tue, 27 Aug 2024 23:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Use VF_CAP_REG for device wmb
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
 <20240702183704.1022-4-michal.wajdeczko@intel.com>
 <87cyluuatt.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87cyluuatt.wl-ashutosh.dixit@intel.com>
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



On 27.08.2024 01:24, Dixit, Ashutosh wrote:
> On Tue, 02 Jul 2024 11:37:04 -0700, Michal Wajdeczko wrote:
>>
> 
> I have a couple of questions about xe_device_wmb() below:
> 
>> To force a write barrier on the device memory, we write to the
>> SOFTWARE_FLAGS_SPR33 register, but this particular register was
>> selected because it was one of the writable and unused register.
>>
>> Since a write barrier should also work if we use the read-only
>> register, switch to VF_CAP_REG register that is also marked as
>> accessible for VFs.
>>
>> While at it, add simple kernel-doc for xe_device_wmb() function.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cfda7cb5df2c..74beddb55284 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -744,13 +744,22 @@ void xe_device_shutdown(struct xe_device *xe)
>>  {
>>  }
>>
>> +/**
>> + * xe_device_wmb() - Device specific write memory barrier
>> + * @xe: the &xe_device
>> + *
>> + * While wmb() is sufficient for a barrier if we use system memory, on discrete
>> + * platforms with device memory we additionally need to issue a register write.
>> + * Since it doesn't matter which register we write to, use the read-only VF_CAP
>> + * register that is also marked as accessible by the VFs.
>> + */
>>  void xe_device_wmb(struct xe_device *xe)
>>  {
>> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>>
>> 	wmb();
>> 	if (IS_DGFX(xe))
>> -		xe_mmio_write32(gt, SOFTWARE_FLAGS_SPR33, 0);
>> +		xe_mmio_write32(gt, VF_CAP_REG, 0);
> 
> * What is the purpose of this register write following wmb (aka sfence)?
>   As far as I understand, wmb/sfence should be sufficient by itself.
> 
>   If we wanted to flush PCI transactions, we should have to issue a PCI
>   read, but here we are not doing that.
> 
> * Why only Xe has such a function, why is such a function not present in
>   any of the other drivers, including i915?

what about [1] intel_guc_write_barrier

[1]
https://elixir.bootlin.com/linux/v6.11-rc5/source/drivers/gpu/drm/i915/gt/uc/intel_guc.c#L936

> 
> * Also, as an aside, use of write barriers in the kernel requires a comment
>   saying which read barrier the write barrier is paired with. Generally
>   speaking, such comments are missing in Xe.
> 
> I have sent a patch with xe_device_wmb() replaced just with wmb() here:
> 
> 	https://patchwork.freedesktop.org/series/137818/
> 
> Let's see if we see any failures in CI with this patch.
> 
> Thanks.
> --
> Ashutosh
