Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25520EE021A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 04:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D5B10E5BE;
	Fri, 15 Sep 2023 04:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90B910E5BE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 04:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694752812; x=1726288812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=QSSoc/uMt61qw74z1oXLMynlpA3fQOxjmQsVFJRk1FY=;
 b=JuIgtVxfHSE6NIq0n40JgpflVRaYcLDrPHFtToB2LwvsECqpmBeRL7Bg
 nGon2G9Srx3STlCChc2p8tPKcMbdQMPtQsfh/ABLra5nqWWJs5XKL+QyH
 PVQ/lUIfGlb08NKBLE/9WEnzbDZYooe8wL6iqi6FD7XQ+a9NZkRWSZy26
 6wom/SWb1+UnggJojHP6GDWSmJsfwcjPF/lPns0H8DyudZUyJXXfS8jOY
 xF2sBPRGOUBlSh2KJCZ/NrZz3qddyeXrQO8D6/QrbUvmbhO9kdaWi/Hlg
 r3mfInZfhPDB0JOkAGsmGVgcLjZpvqY+SU84E8+4oJ7dXSEfpwFhOLl3e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358566506"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
 d="scan'208,217";a="358566506"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 21:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="815043524"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
 d="scan'208,217";a="815043524"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 21:40:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 21:40:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 21:40:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 21:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noMMTT6x+1hD/x8OhwDO7LjBYTYUMpViFT2ZN621vmxiLg+m3eXZttaIAQgYz9JpSHVRBGscq4Pe689TD3wNkikoZQnY2Q1rpadjAjBSh8IS5HbNRfMrh4YxtoKEtQ4stCJ/im73JezTGSmA8nEkSDU+6Mp8YYkkhUmvHMJpZG4RtYM76UJxRzUWkrYCXs/Lg5AdgkzsmLMSz/g+XxzrtSUyFjA9YJHXodCjmjR8w+uEibxuEtcgEQ0/gPYAerMwoxUsd4JFoj3UtoTY1zQpnSiptLLV1j8VbgPS7nRCXQ01OAPJSdGm+Dg2+x8SvYWZOwaEf1k6vukEvKy4reHvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPrXLmgmRKzRgV1+lA7rxIw1RcurTl6YRyV71N2dudQ=;
 b=f0uMmJdpJCWeR+k57kVWSseeusgdWFVGaClAzpCHk8pOtP/RiPtWEQJMND/IXnSy5v/n95xmcIlYeXSXvv/bWKNW7LYdI+x4179kNTtbJ/Jvm09Bvbk+hLJoOIBsKOD2bCFxhjUA+jdQP8J6y01Sl3J09umrny0Bn6u+qqX1fXfbNTJNW4fOlO6eY4SwcMsmT2Xz6SnSRaVSr0IrPXUdlb5//4G7q3Fu6G5uq1B0iiuG7W+6Wy1ZbZJTpXAZ1eFGEslN80V10wXFrQ+2z3xLgoqcCoEN+z3tQjGSov2XWdl8vyoWv5yZKLocWmM4Pc49NZRHKu1qqWVtxkESpNOJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 04:40:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 04:40:08 +0000
Content-Type: multipart/alternative;
 boundary="------------T0AiZqrlg2bHGBIpInCbyh9i"
Message-ID: <66e367be-46a1-4ccb-969e-09ff1cabb53d@intel.com>
Date: Fri, 15 Sep 2023 10:09:57 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
 <20230914121909.3860392-8-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230914121909.3860392-8-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN2PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f39644-bd69-46f3-2f52-08dbb5a5d6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwoHM0rJUX/3I8BzPN3bMLi2fvCq9Zh+nuJYIg+bZ5A/9xQMKkWvW/llWcAvoBMBSvIaSxKojnFS+uQNEgi24ywww7uEclSkCuiHmD4VeQfeo7gZCVQi3ov/jMlb7OZEhx9wNSZK3J8lZcoA4USnrPlWF0WBNGIpMU3LQPXSyCs4wXEDK6bnUnDxjyb3Jy+m1rXXJ9tXdPI+c66/tLG3luDYTd0lmH/gUG9dY/MhIKLKu4udsztcHHMKDoy4IMu07OuWC1uHVENoMr2SlsAb95U3/Fd18jnBcXGpbMKQ53nL3u0zDASCv0608R5qRhsqSWhi+FtnwzjgQ0lyzb/GaYoivNp2uZvti3oSQkSVbL6SsSicxfFVBol2t8EJolO20pXmjdaKRmn44HXKUsYuzWdof5h6VAJu4n6tdanlITbSNxqiNopUGuvxeqqUYp1R3xW8ht2UsyAmpmuywUuOc2cYG/2IoTp+qfkGH7cz2kmUdJXFRFsSmZngkzCeZlj2hrm+fkw00NVCt5Jhq83tWdPD3GQK5KoWdEKYTv/PntdiSLSljTQQxznUt96yb5leXG46W3v4MXeAXydxb4rgjN6iuM7Xv6p6177CYf40NsfqO01yoTNMEahAuh8gXwRnGo++5LWvQLSXguOWGkSYGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(186009)(451199024)(1800799009)(31696002)(31686004)(83380400001)(6486002)(6506007)(33964004)(6666004)(82960400001)(4326008)(86362001)(8676002)(8936002)(5660300002)(2906002)(26005)(66476007)(66946007)(107886003)(66556008)(6512007)(478600001)(53546011)(38100700002)(41300700001)(316002)(36756003)(2616005)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjFWQzV3K3lEdGhNNXNjZmsxWmtxVHNBWUpJb2hPWEdlRlRGSFM0alJJZzhV?=
 =?utf-8?B?YVhFV3IrUUNjV0R5YlBlVVZDZ3NIZGdwNWhEQmYwMjlUc0FkbmZDZWpyRm1h?=
 =?utf-8?B?YjJzTXBqYk9TSDRqNFFLMHVVKzAzVUZtWnlFT2g4ZUl2elcwM0Q4SmFtNFVR?=
 =?utf-8?B?R2hEQVlobDByY0F3dklKaFB1aEg1THUvd0ZNd1ZOTysya0ZOVnZ0N1BSMVZh?=
 =?utf-8?B?dzJwdiszQ2paMlVqczIrUmVSbGpWRmRCeS9KMXNqay83aXRVK01tSFVXSnBj?=
 =?utf-8?B?RkVJOXFYWWFGY1ZXOUdtT1QvdjVvZlU2S0k1VWFVRGVLNHZDQ1A4QnVaMVg0?=
 =?utf-8?B?RFI2MTBXV2FWRFZHMldrUVFEczdhYkJHZzZkTTRUcGhuaDBRWWx1NDBLU3pD?=
 =?utf-8?B?WmcvVjUrRDlXVjZGSVF6a1V1L1BRdlNGTjkxc283Mm9zS2VKSU96NVgyaWo0?=
 =?utf-8?B?ekFuUkxLSjhnbXhLSndzVytZR3RWV1p4em1rRTBRQXk0ZEl1S2h2VWdSNzI1?=
 =?utf-8?B?d0twVktZaDBtd0NETnVta05qVkNzNzloNlRBRFV2MmZPcElyZTcwdXdpNDV4?=
 =?utf-8?B?NnR3RmlXaXQ1M21oYjg1dGZ2UGpBeTNleDZhT0NkQ3VJV0VJQVJDckRYaGxC?=
 =?utf-8?B?QzFDSnowZ0tETGdNT3J2cjUvSmFrSUordkpnMnhlV0tmeUlBTVl3UkdnakUx?=
 =?utf-8?B?NkY5YW5yTEpQYmc3aWx6TTloVDFhWmg4NldmVWxhU3hpUzRqVDJ5OE10WDMr?=
 =?utf-8?B?ZlBYTGJ2dkNFVVVQQnR6RFJFNkh2NTFPZFFFTExxWVRhbTVNamdtWG5tSFZy?=
 =?utf-8?B?L0trblpoM2wyVCtlSENmSThZSmtWMCt1SzJKMGJEcFloTEZFU2dzbTlrL1k2?=
 =?utf-8?B?YzkybFpzYTcwWHZRNG1YcXljNXpRWGRtRDNBdlN4UE43cEhqeEEvWnhnTmV0?=
 =?utf-8?B?cHkwRkVDMUhCSUszSXV4MWVZYWhzcTdZd1k0ckJxckRFb0RSZmxFcDdzNStD?=
 =?utf-8?B?MlV0YXZZZUdFSjFrekNHRkZDckk4U2t0a01NVjdEMkxRUUhzY1F5NTJTSW8w?=
 =?utf-8?B?d3B2YkdtT3p2YVd0ekNzT1BJclppZUpad0I2VmFoQ1VBSy9jUTd4ZVQ2aTVJ?=
 =?utf-8?B?NDhlUGJyQ3lQZTEyWjl1eGxIQVR0bUF4NkVMZGhZaXdjd3JCbjI4bmF2VTZJ?=
 =?utf-8?B?Y0FQRDBVRDVKMmdoc0o3czZXSTV2ZjJnZytSTHFLRG5BeURRTmNsMEVaNHJ3?=
 =?utf-8?B?SDgxazduaVAxcGdCdFoxSFVobFRudEZVOFBQUmZNTTJnS1puUkJ5TkxCMGcy?=
 =?utf-8?B?U0ZOL2hHcGFJMEVmZ2kvZDE3bjRmSSt4NytnSTdxSUVJNlpMOTg0aHFZTkZs?=
 =?utf-8?B?NXZ3bStxbklmaHNiT1NzaElyYmFtbHhFUXhZemM3SG5ack5LbnlzWXdsU0tU?=
 =?utf-8?B?dDlYdjgzbWZmMTAwejhaM1lvNWhYdFc5UWNYYk1GTGwzRUFlYjJqd3ZYVWpN?=
 =?utf-8?B?ZlVuOUpMcGNMdk5iZ0E5bkdKZ2VQdTRnNVNJeWg0ZEc0N2JSKzBicExlejhl?=
 =?utf-8?B?eCtOUW95bGUzZEJsT3owa0o2Mmg0MDNzbFdXRERBdUg2bis1TE94M1FsZmQ4?=
 =?utf-8?B?NGRKME5OblNZRU9KMDJIRlorekhYUjhXbEMrTEowYUVaWUhLZ0I4bjhVQ0Z3?=
 =?utf-8?B?bFFIR3puNHljZmE3dVdBcWlhQW5GN1VVbVUvd1licy9mbEc2YjRoYXFWVzBI?=
 =?utf-8?B?RW9Fdzh5WkUvdlplc2daQTZHOTl3ZnhHVG0vMGh3RFM5MlVpdHBiNU5UZEp4?=
 =?utf-8?B?d1cxamVGUndCRXJzeUN1WHF4U3UwVjlvaE5zb2ppbFJhRGNHTGF0ZEtwZmY2?=
 =?utf-8?B?d3MrYUx6RERFa3ZJNzA3S1g5bC9yeTBDakZEMS9Ta0dVcmkwbnB1a2s4d2pY?=
 =?utf-8?B?ZmZuSVg3KzJrT2Fwb3BSQW5qekU4c1FyVGovU29jYWM3cGpYTFhzYXhJeHlq?=
 =?utf-8?B?TjZLZXYwVmNHbVVXZncya0JmRHJGY2tWR2FRZUVZblhUWk9jM0t1QXZwOXJX?=
 =?utf-8?B?VC8yTi9UNEp1SmU1QVlBa0s0ejRlSnRWVmc5d20raTJDb0hDRUNGYnJOZVds?=
 =?utf-8?B?KzdITmhjdG9tNHY2dVhzNzUxLzhuMjluT3RoZ21haVVRVEVuVFBnOXJKVDAv?=
 =?utf-8?Q?MWPhsgFHN4b2kupbNu70+8U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f39644-bd69-46f3-2f52-08dbb5a5d6f8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 04:40:08.7955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdUNYhmqERA6dusEa/yldjx5M+vaPTxEBgVXunjqClgE4ICCSdYvEXbeCRgqoCpjcPKfmYVXUdk89sFbU9SDr/FWx00YKPYXWXaZH8vzuIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 7/7] drm/xe: Implement fdinfo memory stats
 printing
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

--------------T0AiZqrlg2bHGBIpInCbyh9i
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14-09-2023 17:49, Tejas Upadhyay wrote:
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
>
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
>
> Objects with multiple possible placements are reported in multiple
> regions for total and shared sizes, while other categories are
> counted only for the currently active region.
>
> V3:
>    - dont use xe_bo_get/put, not needed
>    - use designated initializer - Jani
>    - use list_for_each_entry_rcu
>    - Fix Checkpatch err - CI
> V2:
>    - Use static initializer for mem_type - Himal/Jani
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.h         | 11 ++++
>   drivers/gpu/drm/xe/xe_drm_client.c | 84 +++++++++++++++++++++++++++++-
>   2 files changed, 94 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 4a68d869b3b5..b4c371f17bfb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_BO_H_
>   #define _XE_BO_H_
>   
> +#include <drm/ttm/ttm_tt.h>
> +
>   #include "xe_bo_types.h"
>   #include "xe_macros.h"
>   #include "xe_vm_types.h"
> @@ -238,6 +240,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>   	return PAGE_ALIGN(bo->ttm.base.size);
>   }
>   
> +static inline bool xe_bo_has_pages(struct xe_bo *bo)
> +{
> +	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
> +	    xe_bo_is_vram(bo))
> +		return true;
> +
> +	return false;
> +}
> +
>   void __xe_bo_release_dummy(struct kref *kref);
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 7abc1db1dc9c..0ff23708f51b 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -4,10 +4,12 @@
>    */
>   
>   #include <drm/drm_print.h>
> +#include <drm/xe_drm.h>
>   #include <linux/kernel.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> +#include "xe_bo.h"
>   #include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_drm_client.h"
> @@ -103,6 +105,86 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
>   	xe_drm_client_put(client);
>   }
>   
> +static void bo_meminfo(struct xe_bo *bo,
> +		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> +{
> +	u64 sz = bo->size;
> +	u32 mem_type;
> +
> +	if (bo->placement.placement)
> +		mem_type = bo->placement.placement->mem_type;
> +	else
> +		mem_type = XE_PL_TT;
> +
> +	if (bo->ttm.base.handle_count > 1)
> +		stats[mem_type].shared += sz;
> +	else
> +		stats[mem_type].private += sz;
> +
> +	if (xe_bo_has_pages(bo)) {
> +		stats[mem_type].resident += sz;
> +
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv,
> +					    dma_resv_usage_rw(true) |
> +					    DMA_RESV_USAGE_BOOKKEEP))
> +			stats[mem_type].active += sz;
> +		else if (mem_type == XE_PL_SYSTEM)
> +			stats[mem_type].purgeable += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	static const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
> +		[XE_PL_SYSTEM] = "system",
> +		[XE_PL_TT] = "gtt",
> +		[XE_PL_VRAM0] = "vram0",
> +		[XE_PL_VRAM1] = "vram1",
> +		[4 ... 6] = NULL,
> +		[XE_PL_STOLEN] = "stolen"
> +	};
> +	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
> +	struct xe_file *xef = file->driver_priv;
> +	struct ttm_device *bdev = &xef->xe->ttm;
> +	struct ttm_resource_manager *man;
> +	struct xe_drm_client *client;
> +	struct xe_bo *bo;
> +	unsigned int id;
> +	u32 mem_type;
> +
> +	client = xef->client;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, bo, id)
> +		bo_meminfo(bo, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(bo, &client->bos_list, client_link) {
> +		if (!bo)
> +			continue;
> +		bo_meminfo(bo, stats);
> +	}
> +	rcu_read_unlock();
> +	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
> +		if (!mem_type_to_name[mem_type])
> +			continue;
> +
> +		man = ttm_manager_type(bdev, mem_type);
> +
> +		if (man) {
> +			drm_print_memory_stats(p,
> +					       &stats[mem_type],
> +					       DRM_GEM_OBJECT_RESIDENT |
> +					       (mem_type != XE_PL_SYSTEM ? 0 :
> +					       DRM_GEM_OBJECT_PURGEABLE),
> +					       mem_type_to_name[mem_type]);
> +		}
> +	}
> +}
> +

LGTM. Reviewed-by: Himal Prasad Ghimiray 
<himal.prasad.ghimiray@intel.com> <mailto:himal.prasad.ghimiray@intel.com>

>   /**
>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>    * @p: The drm_printer ptr
> @@ -115,6 +197,6 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
>    */
>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
> -	/* show_meminfo() will be developed here */
> +	show_meminfo(p, file);
>   }
>   #endif
--------------T0AiZqrlg2bHGBIpInCbyh9i
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-09-2023 17:49, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230914121909.3860392-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Use the newly added drm_print_memory_stats helper to show memory
utilisation of our objects in drm/driver specific fdinfo output.

To collect the stats we walk the per memory regions object lists
and accumulate object size into the respective drm_memory_stats
categories.

Objects with multiple possible placements are reported in multiple
regions for total and shared sizes, while other categories are
counted only for the currently active region.

V3:
  - dont use xe_bo_get/put, not needed
  - use designated initializer - Jani
  - use list_for_each_entry_rcu
  - Fix Checkpatch err - CI
V2:
  - Use static initializer for mem_type - Himal/Jani

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.h         | 11 ++++
 drivers/gpu/drm/xe/xe_drm_client.c | 84 +++++++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4a68d869b3b5..b4c371f17bfb 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -6,6 +6,8 @@
 #ifndef _XE_BO_H_
 #define _XE_BO_H_
 
+#include &lt;drm/ttm/ttm_tt.h&gt;
+
 #include &quot;xe_bo_types.h&quot;
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_vm_types.h&quot;
@@ -238,6 +240,15 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 	return PAGE_ALIGN(bo-&gt;ttm.base.size);
 }
 
+static inline bool xe_bo_has_pages(struct xe_bo *bo)
+{
+	if ((bo-&gt;ttm.ttm &amp;&amp; ttm_tt_is_populated(bo-&gt;ttm.ttm)) ||
+	    xe_bo_is_vram(bo))
+		return true;
+
+	return false;
+}
+
 void __xe_bo_release_dummy(struct kref *kref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 7abc1db1dc9c..0ff23708f51b 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -4,10 +4,12 @@
  */
 
 #include &lt;drm/drm_print.h&gt;
+#include &lt;drm/xe_drm.h&gt;
 #include &lt;linux/kernel.h&gt;
 #include &lt;linux/slab.h&gt;
 #include &lt;linux/types.h&gt;
 
+#include &quot;xe_bo.h&quot;
 #include &quot;xe_bo_types.h&quot;
 #include &quot;xe_device_types.h&quot;
 #include &quot;xe_drm_client.h&quot;
@@ -103,6 +105,86 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
 	xe_drm_client_put(client);
 }
 
+static void bo_meminfo(struct xe_bo *bo,
+		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
+{
+	u64 sz = bo-&gt;size;
+	u32 mem_type;
+
+	if (bo-&gt;placement.placement)
+		mem_type = bo-&gt;placement.placement-&gt;mem_type;
+	else
+		mem_type = XE_PL_TT;
+
+	if (bo-&gt;ttm.base.handle_count &gt; 1)
+		stats[mem_type].shared += sz;
+	else
+		stats[mem_type].private += sz;
+
+	if (xe_bo_has_pages(bo)) {
+		stats[mem_type].resident += sz;
+
+		if (!dma_resv_test_signaled(bo-&gt;ttm.base.resv,
+					    dma_resv_usage_rw(true) |
+					    DMA_RESV_USAGE_BOOKKEEP))
+			stats[mem_type].active += sz;
+		else if (mem_type == XE_PL_SYSTEM)
+			stats[mem_type].purgeable += sz;
+	}
+}
+
+static void show_meminfo(struct drm_printer *p, struct drm_file *file)
+{
+	static const char *const mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
+		[XE_PL_SYSTEM] = &quot;system&quot;,
+		[XE_PL_TT] = &quot;gtt&quot;,
+		[XE_PL_VRAM0] = &quot;vram0&quot;,
+		[XE_PL_VRAM1] = &quot;vram1&quot;,
+		[4 ... 6] = NULL,
+		[XE_PL_STOLEN] = &quot;stolen&quot;
+	};
+	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] = {};
+	struct xe_file *xef = file-&gt;driver_priv;
+	struct ttm_device *bdev = &amp;xef-&gt;xe-&gt;ttm;
+	struct ttm_resource_manager *man;
+	struct xe_drm_client *client;
+	struct xe_bo *bo;
+	unsigned int id;
+	u32 mem_type;
+
+	client = xef-&gt;client;
+
+	/* Public objects. */
+	spin_lock(&amp;file-&gt;table_lock);
+	idr_for_each_entry(&amp;file-&gt;object_idr, bo, id)
+		bo_meminfo(bo, stats);
+	spin_unlock(&amp;file-&gt;table_lock);
+
+	/* Internal objects. */
+	rcu_read_lock();
+	list_for_each_entry_rcu(bo, &amp;client-&gt;bos_list, client_link) {
+		if (!bo)
+			continue;
+		bo_meminfo(bo, stats);
+	}
+	rcu_read_unlock();
+	for (mem_type = XE_PL_SYSTEM; mem_type &lt; TTM_NUM_MEM_TYPES; ++mem_type) {
+		if (!mem_type_to_name[mem_type])
+			continue;
+
+		man = ttm_manager_type(bdev, mem_type);
+
+		if (man) {
+			drm_print_memory_stats(p,
+					       &amp;stats[mem_type],
+					       DRM_GEM_OBJECT_RESIDENT |
+					       (mem_type != XE_PL_SYSTEM ? 0 :
+					       DRM_GEM_OBJECT_PURGEABLE),
+					       mem_type_to_name[mem_type]);
+		}
+	}
+}
+</pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;}
</style>
<![endif]-->
    <pre style="margin-bottom:7.5pt;line-height:10.75pt;
background:white;word-break:break-all"><span class="reviewed-by"><span style="font-family:Consolas;color:#333333">LGTM.

Reviewed-by: Himal Prasad Ghimiray <a href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></span></span><span style="font-family:Consolas;color:#333333"></span></pre>
    <blockquote type="cite" cite="mid:20230914121909.3860392-8-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -115,6 +197,6 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
  */
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	/* show_meminfo() will be developed here */
+	show_meminfo(p, file);
 }
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------T0AiZqrlg2bHGBIpInCbyh9i--
