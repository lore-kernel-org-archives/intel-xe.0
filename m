Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55492CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 20:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4D10E697;
	Wed,  7 Oct 2026 20:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3NrEAfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C39910E697
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791404467; x=1822940467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E1MK9cbSaHejCza4IbbasGREJ1k81byg1rBrqmz/VGU=;
 b=d3NrEAfhi0QjJ8QmVZ417xdmzBjUYDs550U7WMRUaioUmupmpw2m3Nit
 YESC97l4VpPWw24UF44zKAN/SDXSDd2ISXG4FJhY3Q9NwWsWB7yGOjXVl
 V6qLWvg2niDMC+xOJqGJ484ZxO2mMZARxyirBYu91sAIjD7DXaqv7+rLF
 AA3usHTnG88jRpKOqrxX/JDJ2YaQAxf8rkLaNtaI5dTceaFzZNMnN//SX
 j9moqLdd8yboGXKCAt4r86mkGTuFTmIC3D6Aj4FKBT+IjYA4lJKkucDub
 squwH8PH/CZIBZGw2uBg1vzB/+BZiT0MidHzmTyXT5HlTGOtN8fLzDvLS A==;
X-CSE-ConnectionGUID: OGaE2eskSvWTIhaKMt7NOg==
X-CSE-MsgGUID: fDqlf5R1QoezRX7esMI2og==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="175118"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="175118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 13:21:07 -0700
X-CSE-ConnectionGUID: +i0N107gSzGFMktXa6FVAw==
X-CSE-MsgGUID: WOxhY1s2QGCA2snGTdCi5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="240245"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.247.189.110])
 ([10.247.189.110])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 13:21:06 -0700
Message-ID: <c14f7e1a-3eae-4c3a-8987-5db4e65d7cc8@Intel.com>
Date: Thu, 8 Oct 2026 01:50:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
 <1d249b0f-5d0d-491c-aa34-20b8fa63d886@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <1d249b0f-5d0d-491c-aa34-20b8fa63d886@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 30-Sep-26 12:18 PM, Mallesh, Koujalagi wrote:
> 
> On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
>> Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
>> using the VRAM component tag. The "no CPU visible VRAM" error uses
>> tile or device as the log location depending on the caller context.
>>
>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vram.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index fa06c7ae56b1..6c8558042ad4 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_mcr.h"
>> +#include "xe_log.h"
>>   #include "xe_map.h"
>>   #include "xe_migrate.h"
>>   #include "xe_mmio.h"
>> @@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device 
>> *xe, struct xe_vram_region *
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>       if (!resource_is_valid(pdev, LMEM_BAR)) {
>> -        drm_err(&xe->drm, "pci resource is not valid\n");
>> +        xe_log_err_fatal(xe, VRAM, -ENXIO,
>> +                 "pci resource is not valid\n");
> Message should start with small or capital letter, make it consistency 
> across all logs.
>>           return -ENXIO;
>>       }
>> @@ -254,8 +256,13 @@ static int vram_region_init(struct xe_device *xe, 
>> struct xe_vram_region *vram,
>>       vram->io_size = min_t(u64, usable_size, remain_io_size);
>>       if (!vram->io_size) {
>> -        drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting. 
>> \n",
>> -            tile ? "Tile" : "Device");
>> +        if (tile) {
>> +            xe_log_err_fatal(tile, VRAM, -ENODEV,
>> +                     "Tile without any CPU visible VRAM. Aborting.\n");
>> +        } else {
>> +            xe_log_err_fatal(xe, VRAM, -ENODEV,
>> +                     "Device without any CPU visible VRAM. Aborting. 
>> \n");
>> +        }
> hmm, we can change it like:
> 
> xe_log_err_fatal(tile ? tile : xe, VRAM, -ENODEV, "%s without any CPU 
Hi,
No we can't use ternary operator in first argument of 
xe_log_err_fatal(). It must be the be the static know pointer type.

Alternative is that we could use the like

i.e[1] xe_log_err_fatal(xe, VRAM, -ENODEV, "%s without any CPU visible 
VRAM. Aborting.\n", tile ? "Tile" : "Device");

This way we lose location for the Tile/Device but it is conveyed through 
the messages string prefix based on run time condition evaluation on the 
print.
> visible VRAM. Aborting.\n",
>           tile ? "Tile" : "Device");
> 
> right?
> 
>>           return -ENODEV;
>>       }
>> @@ -320,7 +327,7 @@ int xe_vram_probe(struct xe_device *xe)
>>       err = determine_lmem_bar_size(xe, &lmem_bar);
>>       if (err)
>>           return err;
>> -    drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", 
>> &lmem_bar.io_start, &lmem_bar.io_size);
>> +    xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", 
>> &lmem_bar.io_start, &lmem_bar.io_size);
>>       remain_io_size = lmem_bar.io_size;
>> @@ -342,8 +349,9 @@ int xe_vram_probe(struct xe_device *xe)
>>               return err;
>>           if (total_size > lmem_bar.io_size) {
>> -            drm_info(&xe->drm, "VRAM: %pa is larger than resource 
>> %pa\n",
>> -                 &total_size, &lmem_bar.io_size);
>> +            xe_log_info(xe, VRAM,
>> +                    "Total size %pa is larger than resource %pa\n",
>> +                    &total_size, &lmem_bar.io_size);
>>           }
>>           remain_io_size -= min_t(u64, tile->mem.vram- 
>> >actual_physical_size, remain_io_size);

