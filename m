Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B7C5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 06:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B18710E1A0;
	Thu, 20 Aug 2026 06:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWg+BVqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F2610E1A2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787206019; x=1818742019;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lUyIKVpR8TEb2fkJVSvBgQdnGCzJCLHMzTvv3lXreLE=;
 b=UWg+BVqYpBfltNUJ6wuiW43df1kRkTKo9OFtOAuEu9o8nSbzLGOmqjmh
 c/MYGwwG3Y9BVMXwy7F7MmbKdMxmwqSt5QJWajAW4u9b49YrrzZT0ylbl
 n+1Er2J8cUBV42sHgpC2vXwPxacJl3SD/krx+HfthDXFeUlB4Ht1CrUu6
 JsDeKqf4lTUhE7BxydGEhWkiEMZG53oUjxvkfDC9835kxM24w4Z0/NzGN
 0OZza1Dvg2/ye6r9ZZtnyR2tqhAkck9g72JLP5wWsc95zkzEQcKvzQoye
 J+h8lxDSpYswcbkY1zS0opiInu2NlC13gZ7AY6rsnNXXNAgK4928ky2wX A==;
X-CSE-ConnectionGUID: wp3tzYaOQUu3XQzSFQhFtA==
X-CSE-MsgGUID: xeFnt8x/RaeVXYX6K0/tug==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98325703"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="98325703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 23:06:58 -0700
X-CSE-ConnectionGUID: NuPOU17bQO+/X6cqz1E9CQ==
X-CSE-MsgGUID: IFqm/8fQROmCfRjrMX2Wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="264543212"
Received: from unknown (HELO [10.66.116.151]) ([10.66.116.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 23:06:57 -0700
Message-ID: <a8489c72-ad2f-4424-a55f-16fc007af506@Intel.com>
Date: Thu, 20 Aug 2026 11:36:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-13-dnyaneshwar.bhadane@intel.com>
 <20260819192928.202C21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <20260819192928.202C21F000E9@smtp.kernel.org>
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



On 20-Aug-26 12:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Incomplete replacement of drm_info() with xe_log_info() for VRAM reporting.
> - [Low] Brittle error handling by hardcoding -ENODEV instead of using the returned error variable.
> --
> 
> --- Patch [12]: [PATCH 12/12] drm/xe/vram: Report VRAM errors using structured xe_log API ---
> commit 0430f39e6a6ab1de29f7a59722a6a22038b4d848
> Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> drm/xe/vram: Report VRAM errors using structured xe_log API
> 
> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
> using the VRAM component tag.
> 
> Move the "no CPU visible VRAM" error out of vram_region_init() into its
> callers so that tile-based usage logs with the tile as location while
> device-level usage logs with the device. This gives better diagnostics
> by identifying which tile has no visible VRAM.
> 
>> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
>> using the VRAM component tag.
> 
> [Severity: Low]
> Were the drm_info() calls in print_vram_region_info() intentionally skipped?
> 
> The commit message mentions replacing drm_info(), but print_vram_region_info()
> in drivers/gpu/drm/xe/xe_vram.c still uses drm_info(). This leaves the VRAM
> logging inconsistent.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 23eb7edbdd572..9fae593b07413 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
> 
> [ ... ]
> 
>> @@ -311,14 +311,18 @@ int xe_vram_probe(struct xe_device *xe)
>>   		total_size += region_size;
>>   		available_size += usable_size;
>>   
>> -		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
>> +		err = vram_region_init(xe, tile->mem.vram, &lmem_bar,
>> +				       tile_offset, usable_size,
>>   				       region_size, remain_io_size);
>> -		if (err)
>> +		if (err) {
>> +			xe_log_err_fatal(tile, VRAM, -ENODEV,
>> +					 "without any CPU visible VRAM. Aborting.\n");
> 
> [Severity: Low]
> Would it be better to pass the 'err' variable here instead of hardcoding
> -ENODEV?
> 
> If vram_region_init() is modified in the future to return other error
> codes (like -ENOMEM), this log message will incorrectly report -ENODEV instead
> of the actual error code.

Yes, I should rethink on it. I should pass the extra flag from caller to 
determine that whether it is coming for gt or device check. I should 
revert these changes and modify the existing function definition.

Dnyaneshwar,>
>>   			return err;
>> +		}
>>   
>>   		if (total_size > lmem_bar.io_size) {
>> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
>> -				 &total_size, &lmem_bar.io_size);
>> +			xe_log_info(xe, VRAM, "%pa is larger than resource %pa\n",
>> +				    &total_size, &lmem_bar.io_size);
>>   		}
>>   
>>   		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
>> @@ -326,8 +330,11 @@ int xe_vram_probe(struct xe_device *xe)
>>   
>>   	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
>>   			       lmem_bar.io_size);
>> -	if (err)
>> +	if (err) {
>> +		xe_log_err_fatal(xe, VRAM, -ENODEV,
>> +				 "without any CPU visible VRAM. Aborting.\n");
> 
> [Severity: Low]
> Should this also use the 'err' variable instead of hardcoding -ENODEV?

> 
>>   		return err;
>> +	}
>>   
>>   	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>>   }
> 

