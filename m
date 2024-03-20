Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A95C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 20:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0B510F7B3;
	Wed, 20 Mar 2024 20:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5Le2BA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9D010EFC2
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710967415; x=1742503415;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e0lF5lhmwxZqH5PO6hAsTEOnN2UCx4lx1NOk+vKCRv4=;
 b=D5Le2BA68EPx+VyGxUhilXLQ2FS85dHil9QqSlL/T4dYYuOu2TCKbFA3
 T4kVmJT2mCUJkerMmbgUt4scHM2LsUZ0vLQoPo2EUY89uOMuigcXKF0/8
 0a7fWytKZ3+pJUYdF6fAgJANDZyA/Nn3aOc/1xKvbGZKX/z1Z1xi13VGc
 u4p2k3IwBoTAFh+f3Qb7N4KElAR7MBz4zUSfQBwbh+FBkRbQex7psoGTo
 +uG71l4Nm3p9eGnDOFiFjqaPmAp6h04aJnQwuVQp9h1v94mhlERjV2dpo
 SrFJsoKUFKG41AjEuYmdubIvF4fmBI/q6IqYEo/igjwXw8JyEIoH/r5LU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="23376881"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="23376881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="19003961"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:43:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:43:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:43:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:43:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib/6/WRBlE2bOjxHNJC8B8iwI+d5JfcvLc05SvyxRqh3gUmItlZDOseFMDLWKXlolpZq5ajk8wkFwcCuIDHIoH6Mo06TM/+sdrlaSVEi5iSi0EpINO8Vrl0ho9wQSZ9m965QiyrZeIUDoLv76EilgFT1V2aDYQC3Glmrdtg9eYmTSq/EhkvO2UDMVdYBWFt3jee6RX9C5v9wfhzLV9sCni/8SY+3CPthFVHH76KxbCBsU0oNX9oLwCrgPhairvQNicQj0tIgjP7JZUurS8Vdw+TdcLmOyupcesOYn24r7C/Coo8GxYscToQZjQLHq5hZau8BzhAVfJ6WhDtZou6IRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv64DOy0nFDUs8NJvIrXZwD843CgGcMfbDM/iSmn22Y=;
 b=YgV2ddKrsgDGW634eT+z0ploBmrbHn8UF8iOJixyY3Ww/fdT9vTWNfUraW417xqY6Pf3cP4k2VkdTAHoCsCv2iEmps+zdCqYVwz6nayqWckNSvB+DYqqiv2QX3+xZKFneskhwgFHD0MjjTRAXA5J/cr1+YbwsUzC5MmwV23WHtd1oTkw9ak/MHp19HzxYvUaU72NIkrhSa2U/t25kVcXs7iIr45pEnHCMMrDSjScxsHQ9ezesSNukQ56D14SlufFYFYs/YQ6PJoMKK07JmxbZZAwiVQjA67TA1ok0T5dW0RIYdDfhxZ8u02eqB88x+EOY3jSKoY80wm2NxrVRp9Ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Wed, 20 Mar
 2024 20:43:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:43:32 +0000
Message-ID: <49045e0b-c1dc-4326-94d9-9a3fc805d4b2@intel.com>
Date: Wed, 20 Mar 2024 13:43:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Content-Language: en-GB
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
 <20240319160859.2672825-3-badal.nilawar@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240319160859.2672825-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dee522c-7f78-40e3-7c11-08dc491e6802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ls+tv0DpPU1+qB5DynqW+JU2V0nTc0hwwbXu3dpHZP5K6KLl9cpwKYfRbjlpyTgonUsmmcAa1wKnvYRmL4Y4O1p6WdN6DBbQvtRFTOiMJ2oOZOJGwfp1DEhM2fdoID+OhD7ao1Y7osU/Hf8o00M1IQZZLrwHjOahfhg4/a93leaUixe8b2wLIiZDuB7r6HZbS0nYerRH/iT1i2QbncZPFDaxBS1KPUsCpUZc0LVNAb/6cniy+Vxtn9nA9dmMtIHNhAHQv7dakeP4VITKqxC7+ZyBXlhsdvt9tvzk+t9YXpnLInau9uxGyYARowzsKtaOnpgrZlgiorwQ/shtlImhEH1Sq/fJS5L4VhnUUyKstdFdjrbYAbruf4Gton0fDvzZxe0uSYY2R8Uhq7XfLyoEmmvaP1sY279niayVnLupHVSS5evXfJ0m72f3ziPnsxwcVvZCmTHeBh0F/68Zp6/3rewupmRadRd8ays5WLsc1YpSIB676h0B2NyD6IIPD2qALwrQQdgr72KUDmQya7OH1jXByj1xYiH3St4fDAIE5tALsxjX1j9GwMosM72byZ86z4F3sO7UV09ZWkVjRltzDrKFecFouQjixFaBqYXIy6xicX7l5zRxN2Xk+a0rIZzjxE79u7jzW9g/vL0PCCcbYXboLnLGw8/8mGYiz1F4FX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkVxSVBsVy82N1lzaGttUHZRcGNIWmI4ZFJieG5NSUg3Ky9EenNmMTFINitY?=
 =?utf-8?B?VCs5MTNpUEZveEEzSUhqNXlMUE0vdW9YTDlrcDduL1E2QzZNSEIzckprTjNJ?=
 =?utf-8?B?U2NGTnprN0VFeUE2RXZFa045cGZUOFRLOTdzbVNLVTgyWERnQW5CY3lwSzRr?=
 =?utf-8?B?MFRGa0JQWC9YeEhadjNvV2RhU0xPejNjMG1iN3JMaTJ6VVB5QlJwYlFIZ21S?=
 =?utf-8?B?UzJrNDRFaDRpNmduZE8zNnJSVEVzNjhKa1FoUEJoSUYxQ0lEd25EUGFDdGRz?=
 =?utf-8?B?VXJ2aWgzK2dUN0lmOVZmT2tBZmJzNGxWWlIwU3FwdXU4cnZWRTBHam5IbEZz?=
 =?utf-8?B?dXFqM2dmLzRXQThOMmF0Sk1aZE5Ib1VKL3FmMXVmd085MEE1UjFJWmhJOFhH?=
 =?utf-8?B?WDA5OXQ5dHFOSDgwS240dGlEVDVKL3FCNzVIN0hmNjBhTThqZ3djaG1KeWNH?=
 =?utf-8?B?VXFwWDdzc2RvWHlJd2FxUmpYc0lMUDdacnRNeHJFM1JJZ0pmdlZ1TFVnWXpD?=
 =?utf-8?B?SVZ0WlpiZXFqYlVxdTdXdEE1b2pKZGdrYXFBWFBxR0V1TTNSaHlMYVQ4Yk1p?=
 =?utf-8?B?Q09xNDF5SHVua1JqTUExSERRc0xneVQyNTA4a2RVcGFlVVk0SkpTTkFEYW1D?=
 =?utf-8?B?K0R2YTUxZDdSMjVDRU9YYVoyU2NvZ1NQUVJNYWZBMlF0NUwxQVNFczF6VVdv?=
 =?utf-8?B?cE83ckVPTEo1djV6U0l3bkRPOHFsT2hLTHZPcDlxbzBlT25JS3B4SGF6NHNS?=
 =?utf-8?B?RHowdGFXeU8zalVzSWZmVWF5bWVmaElKbDBVSHRhTmJSU0R5SGloeHFYZUJR?=
 =?utf-8?B?cmpyN2Y3dEZPYnZTYS9SLzBxZFV1dFU5Tk1rdXBRZXRRYTVGZVo0R3RhTldj?=
 =?utf-8?B?ZnFSamFEY0xGRE51b25BZkRyd2daWmpEQVp4b25lMXpUZHRNSUU2ZXRHcU5j?=
 =?utf-8?B?dFN6K1NjS2x6SHF3QllIVTk5ZjUrR29SSzcrL2xIdDVnZVE3eEJ1a0dYMmJ2?=
 =?utf-8?B?YTd4VGpYZjNFcnFSaDN1S3JHeDF4VnJnZXpZWGlmVGFQM2hreVQyazBCaHZ4?=
 =?utf-8?B?dkkvdXFYWjE3T3VCdlEwVkFRbVEvTWhFT3M1azk0SXora25ZQ1hBSVo5dURD?=
 =?utf-8?B?YmE1N0tLMnpqR3pGNVZ4N1QvR3d3UWw1blhqSXU1RWRJRnpVVklpRCtsMXd3?=
 =?utf-8?B?WmJ1OVROam9wK1RUak1TRHJScWtDWFBCM0kyRUphSGdNT1pSOXFxYkJ3dXJQ?=
 =?utf-8?B?TGxGOXk2eTVjSE0rMTlZMnV2bUE0WVo5L2x0dVdveThwSC8rR1FKbUNNQmt5?=
 =?utf-8?B?ZTNialZkRGYyNjdrcWFQMzE5NDBlTTRiazlmMmJEc1lGSlpmblV1dmMxOWxK?=
 =?utf-8?B?WEJCQWZjKzFnYkJ4ZVNERlFycm1YRnp1RlZKWGpiM3FlWTRwSXJSSWhzMUJz?=
 =?utf-8?B?SmptbXZkSXo5SnZ3RXdPQzBnYTRRVEF6alB3ZHpTNHYyUkg4ZnJYdFFwT3Ev?=
 =?utf-8?B?OFRKcnNsU2VPQ1ZDSHVQdGJ0dnp0UmNWWjBFNUswUG1wTG5SSTdaN1VkZSs2?=
 =?utf-8?B?YWxVSk5Jb3RqaHVHMlA4NXdYWEJmTW1tZ2hzMERIWG1FeUZObzd3TmxmK0NK?=
 =?utf-8?B?TWU2UDlsZEEweFh6R1psck12bktNYjdZMVA1SnJUWEh5K0dJOHJ0UUwxaDdq?=
 =?utf-8?B?aG9obEVtUTlON2RhcC94L3ArQ20xL2NjbGRTZStXL0ZGcFdmZ0U5UjI3R04r?=
 =?utf-8?B?aUhLeWtqZk44Q0tlcVRncDlHSmpZWnJKeWVWUmtnZEhyd0RuM255QkFzaWpI?=
 =?utf-8?B?VVZMWGZtSjFzVjI4MHB0R29jdTUyczAzSFNaK25TUHUyZnQza0ZuU0RBRkZi?=
 =?utf-8?B?VW5IUjZIb3B1LzBTTG9aRGtDeUpmVmNlOUVjUW9mVlNlQ1ZXU0ZpSEJveEFS?=
 =?utf-8?B?LzdqYkJFWndlM2pzRW9IZmIrNVkxNEZ6dGt4alAycmhKamxTUEtPZ0t4SmRv?=
 =?utf-8?B?c1ZCcjJoYVFNcDFLNzY3eXY1cXdmdkpwWURmR1lzblFiUDJSQnBicmpzRVVC?=
 =?utf-8?B?SVpDWUE4ZXVEUVdyOTR1ak83UWJ1OUd0Z0tSc3FSNFZ2cEVOYUlpK0FXSWdp?=
 =?utf-8?B?T3pNRmZjL2ZQRlhRQWY2ZzVUT0Y4OFB1TzdwRWdJL3drM1Z0dTZwT2ZIQkxq?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dee522c-7f78-40e3-7c11-08dc491e6802
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:43:32.4077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgnuNPjVzTLE8BSE9/UO078hftAeBXz1V2VPHebKQKTwfiIIYtNpZ1NgLZAjDA+VS9LVon+5F/tqWVMySOQw6aB+uiUomPBrPtfgWoBA5cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
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

On 3/19/2024 09:08, Badal Nilawar wrote:
> Enable GuC Wa_14019882105 to block interrupts during C6 flow
> when the memory path has been blocked
>
> v2: Make helper function generic and name it as
>      guc_waklv_enable_simple (John Harrison)
>
> Cc: John Harrison <john.harrison@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 40 +++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>   3 files changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 0400bc0fccdc..5dd45e06f0b6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -319,4 +319,11 @@ enum  {
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>   
> +/*
> + * Workaround keys:
> + */
> +enum xe_guc_klv_ids {
> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 506f0be35763..c71228bc8d57 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -7,6 +7,8 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include <generated/xe_wa_oob.h>
> +
>   #include "regs/xe_engine_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
> @@ -19,6 +21,7 @@
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_platform_types.h"
> +#include "xe_wa.h"
>   
>   /* Slack of a few additional entries per engine */
>   #define ADS_REGSET_EXTRA_MAX	8
> @@ -279,22 +282,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   	return total_size;
>   }
>   
> +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
> +				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
> +{
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +
> +	if (*remain < size) {
> +		drm_warn(&ads_to_xe(ads)->drm, "Cannot apply guc wa klv_id %d\n", klv_id);
Hmm, missed this before but the warning could be more descriptive. Like 
"w/a klv buffer too small to add id %d". Saying "cannot apply" makes it 
sound like the w/a failed to work rather than a pre-defined buffer 
allocation is insufficient.

John.

> +	} else {
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
> +				 klv_entry, size);
> +		*offset += size;
> +		*remain -= size;
> +	}
> +}
> +
>   static void guc_waklv_init(struct xe_guc_ads *ads)
>   {
> +	struct xe_gt *gt = ads_to_gt(ads);
>   	u32 addr_ggtt, offset, remain, size;
>   
>   	offset = guc_ads_waklv_offset(ads);
>   	remain = guc_ads_waklv_size(ads);
>   
> -	/*
> -	 * Add workarounds here:
> -	 *
> -	 * if (want_wa_<name>) {
> -	 *      size = guc_waklv_<name>(guc, offset, remain);
> -	 *      offset += size;
> -	 *      remain -= size;
> -	 * }
> -	 */
> +	if (XE_WA(gt, 14019882105))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +					&offset, &remain);
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 48cdba1cbf95..a8d15f004b6c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -19,3 +19,4 @@
>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>   		MEDIA_VERSION(1300)
>   		PLATFORM(DG2)
> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)

