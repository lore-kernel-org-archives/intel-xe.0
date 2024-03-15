Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B26C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 18:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40523112272;
	Fri, 15 Mar 2024 18:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOCh9Odx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E218112272
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710525916; x=1742061916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A4gZL9p3rKI5FF+M5e4cmxsKQDCvjl2cPA8ci/P4wbE=;
 b=fOCh9OdxU1PHvXamS5MkjANStP4Y+779WZHKkyDY9SOf70zMEh4l9yuJ
 Xp1Lv5Mjxq1bcHXBW598YtMGHC982hWpXP1UXqPAnVCQHpyGM+r+HgoEw
 0DJM97CXY9ZUMnqEmVJ0k0RyJXte7kqHun3bx1OEF1spI4rd/NyUr5qA8
 FeVI+QdQXc4/FbqBbj4K0/QGZ3cpw8NiwSxFUzhb9ps28OUbiShMTbICS
 G5J0+oB2FL086pg0G/P0slxImo3a06BqrsqmMD98sORn1uPDdq7Ic7B5r
 HLMYYwuiMM4KBQylkrTY1l0BVdKhpcE5L+7TMnTIZ9xgPGCwTySYLKkwT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5271630"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5271630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 11:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12671991"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 11:05:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 11:05:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 11:05:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 11:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntkME64xpaJf0ZGvnufMa78BVrMwMBxQbQms8+hGf59FLB9LJBz+57Wv4w8g9sjvyyBm2eY+KPigX8/+rBisBRLrQ+ErQtEVxoZXI585zFP1bthe4n3gQjwDRoMxonsSakzVSOWGAQknvGXACQjU/0HsKy7okdh8Hx56Xj9hqeiNABqOBS3RwDQOa+TEA8mrLcVvqIOElghTVU5+Kmg71BQmN8liXejArvoP7ZWBFhX2cfj9ZrCPxtlWCexn0HPxZLNFMAgJZaZUX94xLs0tp6Txmn/py1AcyCHlQg9vv5KbMH8tezOX5TGG6uxgEf8xRD5U7AWYa3ut0v+2AzhFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlEs/+0Pqy9GtVrNdKZ27UjkpPMZDLg+jgA1BLQcDpM=;
 b=BI/Oz2spaMpethNUv174r7xHUVrtdWYfIePyfaxctpr7ntzP7H8H0vImIobmymQUJyBlZkU+WdurTtQ1W4Y5SNOX/Nxe0+KtXSBsd2+tNfs+oo/5dI4sHaNvebFOFHSVqLaeleSPXFsductwViePcmTyx6GeviCDve6XZq4tNs7pCUkh6QAAJQiflEq1b0lZRjSukIH/UTSECaarzIzSZnJeGDff02wYgh5Rh3jsZ6hP2AUnVP6P54j+U2AJ75NivsFNalsBg4wHZ+FP9QaCcDEDA5JImx3WrOxjavT4xglVGrorcv3sYMU1TzW0/tb4pfrpqY7muBzilCwvKTx+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Fri, 15 Mar
 2024 18:05:11 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a%5]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 18:05:11 +0000
Message-ID: <893518a5-79b9-4292-bfd4-f7553f948ab8@intel.com>
Date: Fri, 15 Mar 2024 11:05:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <fca1e232-89c4-4f39-b754-ad067941d5dc@intel.com>
 <SA1PR11MB6991D7E3792624E06A8334C692282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991CD16EE87B670DE646D4892282@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <SA1PR11MB6991CD16EE87B670DE646D4892282@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: 227cf019-2b58-46cf-a92a-08dc451a74e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oY2PmxbnFKvUZNp+UhTawH8RihLNPiUAteiVU0lYD2EhxQ8lJWBV0+XepiCa4nRk6Q5i3jyGIyu+f+4S1wRSbKCq0+gvkmPP/uA34lC/zGkY2FZqW6vd003wNNwra7j0nCXF57Ob6VPKXAWNTmjgnMIzMPSt5oslgaUPbjQV0wlDb9+vRc3SAwgpcFuhfWEu2ZKxPLrRIKAk6gTBL2bl7Ctny1nFQWRLjHPqCzlEgKydS1aKPL/tKyvL8RMbXAWadujuXsFPJDWHibbJbDN8j9Qlm2nDOhWMno+deaeTZpbLot3LrwiiXDThdjDsJv3AUCcIw4Xt+Wesf5feNdlBouOVmLq525KcTizmUvx781UUVTFYYzAgqp/MVzbgyfHyHv0zlYacVVXFlL5quqJtUw5CbgNz1bYg9M29jkc4Ttty+53fmdhoDlpu5p/7l+e63lpsktLKzjDe6gMj2seU1jCrxlc1vmAmB8xIv3ekhxwFFd3XDVA5O2URiHXnPvxZHn5GlfwSX5ur0A27I79aRgZyXbqwLShiLJyeFPmtnrh71J8j0gWEzaWK9+INqdCMvtrveHhRhKOvZhD0FXz+REUJD51A9ALm8ftwD0zAeVBV2WaXiqDPHNDCZANGRX7TpVWTG9q9IcB8gmMAVHl9j3hkX+YT3qm0uajGHADRvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlRM1lnMGE2RXdRT1lrQ3ZOTTRWeGZkTk5FQk9mU3RQZTNxM3ZpWUdQZ29Z?=
 =?utf-8?B?STQ4aFhWM1E2QkE3YndmRGdPMkdjMVRuS0p6MG1IUFpjVmtjMlloNWlqVEk3?=
 =?utf-8?B?Vk5qT0k4blBPOWtSOE0xMTYvN0tYR0dQakdQRGI5WW1JdkJRcFBiNkt3MUtz?=
 =?utf-8?B?blMxdE9LRTRIek91eUlhZ3BqcDRZRzIwK0huTk9hZExZK09BR3FmSkRROEZN?=
 =?utf-8?B?bE9zWnBGZHJyOTdUYXQrOTdOWUxUVnBrM2ltbVl2NEl4SCtBOG90UmlnbHM3?=
 =?utf-8?B?UWMyNG00V0xtMUsvekdqOXBUdm1kVkl4VWZoR0UzRFIxemNKMjc0NXh6K2Rt?=
 =?utf-8?B?M2dFV3hhL0NrMWp0MmN2MjNyTHcrZHlSUjZoSzBUSmNNQ2RzUDhsRzZFeVZ5?=
 =?utf-8?B?d2QvaXZsSDNpY0ZuUWJXZG1oQ1V2N0p6ODJPcXI2WVpRZTYwOUhGaHpINkJR?=
 =?utf-8?B?aHRTSENEbDZjRTBaSTdPdmlsZElPNnpOQU9zTVlDNnJpZloyNVVJYzNBNXhl?=
 =?utf-8?B?M1dxMzlqdE9hY1doMGRKYzRLQlBYUUlvME8zUFQ5NFZ6QUhDZXJ6QzVvak9Y?=
 =?utf-8?B?Vi9MQ0JYMzhYWEJtbzgyZDZCMlFJbU1rNS9yYnJ5SnhJZ0hXRjhxM0liYWxk?=
 =?utf-8?B?SitXOXpDZnNwZWtwUThLMElQcUdTd2w1SGxYSGZSUldiaktSWC8vaGZwdElW?=
 =?utf-8?B?b1c3bEQ5V2ppcVpyUjJlUmNMMzFZNzBpOFNVVi9BU1cwRDc2Ui9TZlNXencw?=
 =?utf-8?B?ZzBSNlR6VzRHWVBVVjVTUlJrVXNrc2R5b21GRVpJUngzL0RDQU5YQ0RJMjJ2?=
 =?utf-8?B?Vnd6WGh5TloyOE81UlFHZHc4d2kxcXB0UFU5ekNtRzhKMGNuQ05zekpYQkQ3?=
 =?utf-8?B?SDRSNVpieVNvWUJQTTZIUTdDZ292ZzAxanBWREhJQ2tOdVZpT3RFbUZULzVj?=
 =?utf-8?B?M0Q2L2NIZDZkdTgyVWl0RnIwZ2djTCthTW9NNGVmR2N2c1RwRE42eXlWWkxN?=
 =?utf-8?B?T2tUMk4yb0hLK1VGdzNmVVkrblFlQXgwWDBWVzlQZDRKaXM3a0R4NFdKREN5?=
 =?utf-8?B?RHdUVnpiQ1NseVp3N3BLam10Rm9ybDZzaW5sQmxPQVFTREo4SmsvY2lHL2cv?=
 =?utf-8?B?N3NrSTgwR0Q1Zmg2VFZ6cXlBaWxreFJ6VWI2dkJ3NENoby8zSTdzRG53MVho?=
 =?utf-8?B?VFMyS2JzTVRWZnE0UVRSblg0UEZRUVdNejVVOEt2SVVYOEVWT1NGTDZrZGpF?=
 =?utf-8?B?bWpJRm5JNElFcFd2SzNYbWlRWW5JOFd4SnltWi9leUUwemV1aHhqUFhuY1hX?=
 =?utf-8?B?UFh5TElZbzB3UlA5Z2w5WnQ0SjFUUTZId0FtVWl2eTNHaXdaM3JWNHZhY0No?=
 =?utf-8?B?Z0x3WENvN1UyT2hJOTNzd2haYnVyeGdaZk1XbGFNam1oZEVFYUxGUGtUL0JK?=
 =?utf-8?B?NForWW9RY3pPYmticWxnK3kzU3A1RlI1eXVvV2l4TWkyQncyTXNoUXBqcmJu?=
 =?utf-8?B?YklqeVdxWnk3R3g1dVdueThOVFA0U3J0clZSYnNVU09pcnhZZlNnSzR6WUhl?=
 =?utf-8?B?VG5NV3BwenA0am9sQ3hsdUlQYXE2VWlxaGdnNlZqSVR6bTFISmxQbXowK2Uz?=
 =?utf-8?B?TEhUQWlsenR2Y1BDVUZldlR4bHhCWk1SZXY3cGJHNDh3WS9na1lZWnpLQnRK?=
 =?utf-8?B?R1o1Rmx0U0JIcVo2RmQ2YnBZSXFibTJTc0FONzEzUzgyL1AraEhEK2VLeEVU?=
 =?utf-8?B?Q2VDdndRenMzYnJvN3lLL2gwbW9jOUJLak9GcUxGVjBEcGU2NlZWN0NhRkd2?=
 =?utf-8?B?N0tQZGh5TlhoQktucWZScDhFOEJ0TWw3anNLVkdHekZycUxvYmJGSENwOGpO?=
 =?utf-8?B?OGNoUldXN3lXdXlJck51YmVFbUJhZnRaa0RGUlFhMngxaFA4eTZ6RURiSTk1?=
 =?utf-8?B?dTY3cHVRak0yRTlPWWRobEtyTGVGdXZoVzlET2ZuQk9HaEpmZmRBR2ZFZE5z?=
 =?utf-8?B?V05pTVZnR2xLUTRoaFgrUjhROVBBMFpBQlpCSlRvL2tQS0d4RVB4KzV2MnJU?=
 =?utf-8?B?QWRpUTFrV281VXNxZmRhZTMza0ZiMHBBOGFrZnY0cnhwS1ZEU1ZVeE9NeFlq?=
 =?utf-8?Q?0R4AAFOOr06ZDILBlAr8fPyNO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 227cf019-2b58-46cf-a92a-08dc451a74e5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 18:05:11.3657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXaKRMXpvCGVseelAWKSiwTsxeK4n26Q+h3MbfIf29b145sdHvdqU96rAci6/Ieb4wnJ8SYF7+bP9eRaUQ7wrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-OriginatorOrg: intel.com
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


On 3/14/2024 8:16 PM, Zeng, Oak wrote:
[...]
>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>> b/drivers/gpu/drm/xe/xe_mmio.c
>>>> index e3db3a178760..0d795394bc4c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>> @@ -22,6 +22,7 @@
>>>>    #include "xe_module.h"
>>>>    #include "xe_sriov.h"
>>>>    #include "xe_tile.h"
>>>> +#include "xe_svm.h"
>>>>
>>>>    #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>>>>    #define TILE_COUNT		REG_GENMASK(15, 8)
>>>> @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>>>    		}
>>>>
>>>>    		io_size -= min_t(u64, tile_size, io_size);
>>>> +		xe_svm_devm_add(tile, &tile->mem.vram);
>>>
>>> I think slightly more appropriate call site for this might be
>>> xe_tile_init_noalloc(), as that function states it is preparing tile
>>> for VRAM allocations.
>>> Also, I mention because we might like the flexiblity in future to call
>>> this once for xe_device.mem.vram, instead of calling for each tile,
>>> and easier to handle that in xe_tile.c instead of xe_mmio.c.
>>
>> Good point. Will follow.
> 
> Sorry, with my comment below, do you still want to call it in xe_tile_init_noalloc?
> 
> For UMA, we only need to call it once. If you do it in init-noalloc, you would call it multiple times. Right?
> 
> Oak
> 

Oh, I hoped you were still going to move it.
I prefer it in xe_tile.c instead of here.  But feel free to ask 
maintainers about it.
I think the UMA would anyway add conditional to disable these calls 
wherever they are placed, in favor of calling against xe_device.mem.vram.
But this is pretty minor and can revisit later too.

I commented down below, to keep to one email.

>>>
>>> Related comment below.
>>>
>>>
>>>>    	}
>>>>
>>>>    	xe->mem.vram.actual_physical_size = total_size;
>>>> @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>>>>    static void mmio_fini(struct drm_device *drm, void *arg)
>>>>    {
>>>>    	struct xe_device *xe = arg;
>>>> +    struct xe_tile *tile;
>>>> +    u8 id;
>>>>
>>>>    	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>>>    	if (xe->mem.vram.mapping)
>>>>    		iounmap(xe->mem.vram.mapping);
>>>> +
>>>> +	for_each_tile(tile, xe, id)
>>>> +		xe_svm_devm_remove(xe, &tile->mem.vram);
>>>> +
>>>>    }
>>>>
[...]
>>> b/drivers/gpu/drm/xe/xe_svm_devmem.c
>>>> new file mode 100644
>>>> index 000000000000..63b7a1961cc6
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
>>>> @@ -0,0 +1,91 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/mm_types.h>
>>>> +#include <linux/sched/mm.h>
>>>> +
>>>> +#include "xe_device_types.h"
>>>> +#include "xe_trace.h"
>>>> +#include "xe_svm.h"
>>>> +
>>>> +
>>>> +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void xe_devm_page_free(struct page *page)
>>>> +{
>>>> +}
>>>> +
>>>> +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
>>>> +	.page_free = xe_devm_page_free,
>>>> +	.migrate_to_ram = xe_devm_migrate_to_ram,
>>>> +};
>>>> +
>>>> +/**
>>>> + * xe_svm_devm_add: Remap and provide memmap backing for device
>>> memory
>>>
>>> Do we really need 'svm' in function name?
>>
>> Good point. I will remove svm.
>>>
>>>> + * @tile: tile that the memory region blongs to
>>>
>>> We might like flexibility in future to call this once for
>>> xe_device.mem.vram, instead of calling for each tile.
>>> So can we remove the tile argument, and just pass the xe_device pointer
>>> and tile->id ?
>>
>> This is interesting.
>>
>> First of all, I programmed wrong below: mr->pagemap.owner = tile->xe-
>>> drm.dev;
>>
>> This should be: mr->pagemap.owner = tile for NUMA vram system
Oh, okay.  Glad we caught that.

Still, wouldn't using 'mr' pointer as the owner be sufficient and then 
is common for both cases?
Avoiding the strong association with 'tile' is nice if possible.

But I haven't studied rest of code and how pagemap.owner is used, so 
maybe you actually need the tile pointer for something.

Well, this also seems like something minor and could be revisited later.

-Brian


>>
>> For UMA vram, this should be: mr->pagemap.owner = tile_to_xe(tile);
>>
>> This owner is important. It is used later to decide migration by hmm. We need to
>> set the owner for hmm to identify different vram region.
>>
>> Based on above, I think the tile parameter is better. For UMA, caller need to
>> make sure call it once, any tile pointer should work. This does sound a little weird.
>> But I don’t have a better idea.
>>
>> Oak
>>>
>>>
>>>> + * @mr: memory region to remap
>>>> + *
>>>> + * This remap device memory to host physical address space and create
>>>> + * struct page to back device memory
>>>> + *
>>>> + * Return: 0 on success standard error code otherwise
>>>> + */
>>>> +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
>>>> +{
>>>> +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
>>>> +	struct resource *res;
>>>> +	void *addr;
>>>> +	int ret;
>>>> +
>>>> +	res = devm_request_free_mem_region(dev, &iomem_resource,
>>>> +					   mr->usable_size);
>>>> +	if (IS_ERR(res)) {
>>>> +		ret = PTR_ERR(res);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>>>> +	mr->pagemap.range.start = res->start;
>>>> +	mr->pagemap.range.end = res->end;
>>>> +	mr->pagemap.nr_range = 1;
>>>> +	mr->pagemap.ops = &xe_devm_pagemap_ops;
>>>> +	mr->pagemap.owner = tile->xe->drm.dev;
>>>> +	addr = devm_memremap_pages(dev, &mr->pagemap);
>>>> +	if (IS_ERR(addr)) {
>>>> +		devm_release_mem_region(dev, res->start, resource_size(res));
>>>> +		ret = PTR_ERR(addr);
>>>> +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory,
>>> errno %d\n",
>>>> +				tile->id, ret);
>>>> +		return ret;
>>>> +	}
>>>> +	mr->hpa_base = res->start;
>>>> +
>>>> +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm,
>>> remapped to %pr\n",
>>>> +			tile->id, mr->io_start, mr->io_start + mr->usable_size,
>>> res);
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_svm_devm_remove: Unmap device memory and free resources
>>>> + * @xe: xe device
>>>> + * @mr: memory region to remove
>>>> + */
>>>> +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
>>> *mr)
>>>> +{
>>>> +	/*FIXME: below cause a kernel hange during moduel remove*/
>>>> +#if 0
>>>> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
>>>> +
>>>> +	if (mr->hpa_base) {
>>>> +		devm_memunmap_pages(dev, &mr->pagemap);
>>>> +		devm_release_mem_region(dev, mr->pagemap.range.start,
>>>> +			mr->pagemap.range.end - mr->pagemap.range.start +1);
>>>> +	}
>>>> +#endif
>>>> +}
>>>> +
