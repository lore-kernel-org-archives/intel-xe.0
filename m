Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52C9C5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 09:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB7010E231;
	Wed,  4 Jun 2025 09:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f56mRy/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C083D10E231
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749027865; x=1780563865;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R3TMFcYD9cpZeJxj7TskSZbxi5t9O4aDgxK7s+LgRl0=;
 b=f56mRy/cDSILfKt4x2ma9ivFSPIUCLHxzIjoErHkLQ+A2T6t7CsvI/n0
 VzA08qCx32keQq4d0s23uJ0ppuyCcD3s6KFVh5cOWA5OawJD6FPVp4kel
 EcNx+yYxF/+OZvx+fCQf51l4sypSvWwvEZuOkg2GA+QYdSj0H2ls7Jv2H
 N/f/PZSizOMAJvDmeK6jqHGNTj6m8yyMYCqJmVxX8CXbWPDaHSAliaUQx
 WYHTFpUxGAaknNpEHdiTY/wDHR91dXDduM0UC1sCEp7s9u4m2+TgQhAi3
 X2zOIhArrxKVEa0G8iHiKCAzC+ADZO463anArJ0Tnvz4tniMxvZLYlKPR Q==;
X-CSE-ConnectionGUID: m6IPmi9yQoi4bQEABn0tsQ==
X-CSE-MsgGUID: jMLFpUSoSyKrze3w8EGx0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50794647"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50794647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:04:21 -0700
X-CSE-ConnectionGUID: 31xtvNIXRCm5GpnshzAJ5Q==
X-CSE-MsgGUID: Kwn/AprnRbqLGts3uNXpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="148971035"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 02:04:18 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0C22832ED1;
 Wed,  4 Jun 2025 10:04:16 +0100 (IST)
Message-ID: <3703ecd9-a0d9-4bfb-9946-f9b66c891c80@intel.com>
Date: Wed, 4 Jun 2025 11:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-2-michal.wajdeczko@intel.com>
 <eb14616bb45ee258c53d2d8c7fcafec79c620a37.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <eb14616bb45ee258c53d2d8c7fcafec79c620a37.camel@intel.com>
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



On 04.06.2025 02:12, Summers, Stuart wrote:
> On Tue, 2025-06-03 at 22:28 +0200, Michal Wajdeczko wrote:
>> It seems to be a better place for this helper function.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Would be nice in the commit message to mention this is because the rest
> of the mmio structures are per-tile. That said, why not move
> xe_mmio_probe_early and xe_mmio_probe_tiles at the same time for a
> similar reason?

the main reason for this move alone was a problem with later move of
struct xe_mmio that is done in the next patch

and yes, it looks that both xe_mmio_probe_early() and
xe_mmio_probe_tiles are really at wrong place right now, will try to
move them later, likely with some renames

> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

thanks!

> 
>> ---
>>  drivers/gpu/drm/xe/xe_device.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_mmio.h   | 5 -----
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 0bc3bc8e6803..884e8e4fddbf 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -117,6 +117,11 @@ static inline struct xe_gt
>> *xe_root_mmio_gt(struct xe_device *xe)
>>         return xe_device_get_root_tile(xe)->primary_gt;
>>  }
>>  
>> +static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device
>> *xe)
>> +{
>> +       return &xe->tiles[0].mmio;
>> +}
>> +
>>  static inline bool xe_device_uc_enabled(struct xe_device *xe)
>>  {
>>         return !xe->info.force_execlist;
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h
>> b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..540bade24790 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -37,9 +37,4 @@ static inline u32 xe_mmio_adjusted_addr(const
>> struct xe_mmio *mmio, u32 addr)
>>         return addr;
>>  }
>>  
>> -static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device
>> *xe)
>> -{
>> -       return &xe->tiles[0].mmio;
>> -}
>> -
>>  #endif
> 

