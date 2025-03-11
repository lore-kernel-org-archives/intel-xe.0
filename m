Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C045FC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 15:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720D810E5B6;
	Tue, 11 Mar 2025 15:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRz3rmP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8506A10E5B6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706146; x=1773242146;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jxAfg1gQkj9xDGVraWi2goWBEP9ESnH0rhP/+FxZ3Dw=;
 b=QRz3rmP2bwQRO5cfqp/1Gnzsk2FFaTmUQVOkb3A6JyqT0L/BEXnAQSjk
 vbuoXUgjNBVAko+5RA05kwqv5XcgeKCK3BxPZaLblFdGpB/PXatj9iRH8
 RBPvg2WOJ+mrfHEasOJ6DCC3piHu3QUtt+XGPipL+PJGvzy1yScFp1cRG
 EjDudpd4ZQqJP7SwEfmbJ6WMUIZ6Ivpo14vxJoxr4ejEOsZacSLmBRD+t
 Ylfm/tbl3DqPMpPzUuiDgalfw1dEV6+DMsF3FDiAq1WS6xaDEJtKwsYoM
 by9UtItc4IKm3M1nuFD9I7k4BbpaBf3ghykq6aZ9jjcc0MAXR2J2dQQb5 A==;
X-CSE-ConnectionGUID: jfe6rK00TqeZsEllxPCrSg==
X-CSE-MsgGUID: YvrrAGpJTw2X+J7pLhzWQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54121516"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54121516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:15:45 -0700
X-CSE-ConnectionGUID: yO72OLR5QxifTYUoZeq2Eg==
X-CSE-MsgGUID: OJL4YWgyQtiPDWUoWgGJZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120853230"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2025 08:15:44 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6C12F34337;
 Tue, 11 Mar 2025 15:15:43 +0000 (GMT)
Message-ID: <1e622c7c-41e8-4f21-97e1-936f62c27d19@intel.com>
Date: Tue, 11 Mar 2025 16:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't try Driver-FLR if VF
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-2-michal.wajdeczko@intel.com>
 <0af001ae-1e86-43ea-849f-30213936ec14@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <0af001ae-1e86-43ea-849f-30213936ec14@intel.com>
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



On 11.03.2025 15:25, Ghimiray, Himal Prasad wrote:
> 
> 
> On 11-03-2025 19:27, Michal Wajdeczko wrote:
>> Driver-FLR can't be triggered from the VF driver, so treat it
>> as disabled if VF. While around, fix also the message, as it
>> shouldn't be printed just 'once' as we may have many devices.
>>
> 
> does it need fixes tag ?

it's more a gap than a bug, so not sure if Fixes: tag is needed, and
even if it does, I'm not sure which commit to blame

> 
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/
>> xe_device.c
>> index 5d79b439dd62..a2afa8a88997 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -504,7 +504,15 @@ ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /
>> * See xe_pci_probe() */
>>     static bool xe_driver_flr_disabled(struct xe_device *xe)
>>   {
>> -    return xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) &
>> DRIVERINT_FLR_DIS;
>> +    if (IS_SRIOV_VF(xe))
>> +        return true;
>> +
>> +    if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) &
>> DRIVERINT_FLR_DIS) {
>> +        drm_info(&xe->drm, "Driver-FLR disabled by BIOS\n");
>> +        return true;
>> +    }
>> +
>> +    return false;
>>   }
>>     /*
>> @@ -568,10 +576,8 @@ static void __xe_driver_flr(struct xe_device *xe)
>>     static void xe_driver_flr(struct xe_device *xe)
>>   {
>> -    if (xe_driver_flr_disabled(xe)) {
>> -        drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>> +    if (xe_driver_flr_disabled(xe))
>>           return;
>> -    }
> 
> Change LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

thanks!

> 
>>         __xe_driver_flr(xe);
>>   }
> 

