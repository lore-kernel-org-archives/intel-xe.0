Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD73CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 21:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F260B10FF75;
	Wed, 20 Mar 2024 21:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8DbZJx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363BF10FF75
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 21:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710970916; x=1742506916;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=El25adpyAb8eG2YCgm6pGAvbSEmcDL+t+FuU60cRVWI=;
 b=h8DbZJx8rJOmGoiq20eS/GeOJ+rMxG6ikRvsIEiN5CmW2bKDaelraBTZ
 JyFOuEfmyzeIlHHVICqawQ7Tg1iQgT0AtCo6uttzg2Y4Uy6z6xN4jAk4i
 8BCQd+e4uRi1Zeg3Genxj5lVUkt063GOoLwCmmgaL/Fn+uxpoB4uQIxRj
 Y8bsB6rryfsW6F5GdhBA/VWOVhi/J3ayobmCU8VPi2WGMI4xnRq3giuuX
 DD1cdXAvhuqmItCV+ZYR2WzruEvnP1aawMVessyyyNClqvy3SopmiVPIk
 CjJ/wonhL/ENXbGTQS+qqbIxuMZv3GLeAHw05Y5zCJ5da7KetSizSXvpZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5762987"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5762987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 14:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18762808"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 14:41:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 14:41:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 14:41:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 14:41:46 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 14:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVJ+uKTRvz/ZdLXy/NnwYqS5LPhiB+hgRVYHAGuMCaUI47CrPdUO1jOoqoqT4LhwApSd+VAMQCpGirCa3l8hWtR70Abkyip29/uQuaZXWt/NQeXuXXurKzclT/fgeofrm1ZzdhedogNBmClN/RLBF2wFVJYKZKMNABTwSll5wWLwAMxcLfONtDaMitNj0Q1nafWxeu/KKn/5ws7UYeA/T6EqqJddlrDPQdGB1Td1elRYWGiaqrrWdlfa8KLovZpk/CG9hXUBEEJsGzcXsE/8TOMV9eFa5TMlISQlF6WtAg/Tygb04o/0jE1OZ81lM6JyjnxLwi1UJdp7jEaRz0uErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8RYoZPbqcqKLAgTO8EeEJbLnFpmDU/T+LoZavcxCAY=;
 b=E4Z6HyTK6M69ojlz7AKM1wLOxjQpdT0f7XsLPJtBJk29opBuuLoBUTPi+dA7sMY5NJmCRiisGefwaJpyhg0U7q5HY6HSmxoLUm1CQnAIUGvw3udtoRA4tkMcHZValH6h8hfvaGUrs4fUzbcqVod+1bebeZsJc4YXYL0596eAhYVykIfMWD5SFqXmC526QFZsy+dxYIaFMcKZtrW3V71iL8LAOry33t9qbaedTt+G0edTeLGK05TSaiKvfAiai9hg+08RiIReWFt4jIyChI4jdKXLBF3AB1Ulk+kwvDqJ1dkmXhORAq+k3AZsvwVsjZwNNMG29w876hfNRJBbY/MYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 20 Mar
 2024 21:41:44 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::4acb:a351:5d51:6d3a%6]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 21:41:44 +0000
Message-ID: <4f386d5a-1bcf-4489-b82f-17b2c0673b7a@intel.com>
Date: Wed, 20 Mar 2024 14:41:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/xe: Introduce a helper to get dpa from pfn
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@intel.com>, <matthew.brost@intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
 <20240320034425.1785007-5-oak.zeng@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240320034425.1785007-5-oak.zeng@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: b98d7a58-1607-4ea0-8f5f-08dc49268961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHFTAVxdIpQcVoK7XbVl52Z75CNnxMZVoOT6krK3hL15xoZRMZ1kL1m/tMWSZ87zb9mgoVKV+mkEaVD2A0yQSr3K5v79yLQaeKooVW4GkdySKyocS3Hhj3w4GazCHvM13ZX0ILKca8fmUNcvEnAGz8AETwVw0N+/V7i60fZHge8LMNxwTQ0OYCbHtVNqBgfhWYi1gjjl42AN4hW75BjtY+V4e3DykipNgo1DnlOb0T+cobvAKx9kyPoLRwvY1zeyek6DXH4/Vbj85lSQn+V+81oNeazgzHCOkSWTrahtucP6WXJdzaGeA2QfR5rsl6K3Vf/KKuzJRGUPYdNll9f9MVnDLs75L77zon2Xwe/pJnuTlS6jKR/WkJ1pJiUjpJtndd/ISHqMRmrV5IRoeDhDTaFVDnZXK4h0GHKJTvjAFR9Wlps0SbB+WTlirR48MHmBDNTR1QnBJSIvUPzMOdtin12VPNsQmHqiJWvnNRdjOKZ93hPvVba3oJInrSsO9Dzdi442ZMDoAJcSw1ETiNHkc5GH6H1anc6AtgApWC6oWSGZSSzuJy2+7PUcSRsXlBONjrfGDvphpXt0QzE+QwlfkynxVWo7ZnBJR5ZJMFdcIKMheT8ydXc67iCvH1ZJRRcLHDQAkIbV2PG4a0nUgwhBSLpDoLxDgwDKv9/4dZ2Wu3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0l0bTlaVG91blcrd2xHbFU0TElha0lIUVc4US9xSlFEemk2MjUvQXFLemRy?=
 =?utf-8?B?SXN2VkVwbjdYWk0xY1E1R0YxK0NYdkNkc2dML2hOcldFejVGM2FSWDM2S2Yz?=
 =?utf-8?B?c2dOZjBTdDhHdm82WW1mZTZnb3l4YmsvQXJCOXNwNmFPeW9oU2xyRFZ6YUtq?=
 =?utf-8?B?a2U2UkltTjBZTE1haFpTSThZOTRhdHdIeWY4VmxiSDNPdTdDcStUalRUS0No?=
 =?utf-8?B?dmFpdUo1N0VRNXpHTC9kQ3hHNG5VZ25jUk9oQTdnUVcrMFNyVGYwcTZweTJ1?=
 =?utf-8?B?c0tNRU11czBiMStOMzVGSnI5aW1uRjdYUXlmaWIvMTh5dDNENmVDN0pTOWRu?=
 =?utf-8?B?MTZQbWxoT25QYzFJcm42eEZtNHNENnF3NlJhSjB5VXloRllDM2Yyd2l1Mndq?=
 =?utf-8?B?YW5tVVNaclJrb2ltdHZVUjRjQUVMRXRTa01MOFdlZUQ4eVRYZjE0QysyMys2?=
 =?utf-8?B?QjBBaVNEUVJUeDg3Skt5UEFDcUpHRmlpV2lsSkRuTkgzWHVSejZ1WjQ1YkR6?=
 =?utf-8?B?ak9wbjZsU2kybG5oQjhXdXdSMmtyRlBoRDM3bXRaOEZSbGZTTzltRWxJd0dT?=
 =?utf-8?B?RU01b25zZGJYMGNlcUZQRHFCa0JaS1VoaVlPa1l5cTFjakJ6dEpzMTNDSURP?=
 =?utf-8?B?MTZWTDQ2Wlk4MjV6bXBqSlp5MFpsYkRwcFMveXdPOVMxalJqUy9IMmhGUWJl?=
 =?utf-8?B?ZlpyN2xNQlhjUWEzTy9kVmcxbnQzR2lzbjNZa3lPSXBpQmxpY2NHeitIZjBV?=
 =?utf-8?B?YlBPdlpiWitQYXY3OVBsbTBtNlBzWEpZcnpmNW8zT05SLzEycGt0QkNOWGFj?=
 =?utf-8?B?OUorakRRcERKREFUVVZvUlNkMVNlTDlRbjJiR1NTT295bHpERjFrSEpObHB5?=
 =?utf-8?B?MUNPK3N3SmVYSFJ3ZlBxYVNVNDE2VnFuYXFqdmxKcFVQTmplTnNhaCs0dW5h?=
 =?utf-8?B?OS9iOUkvd0Fpa1U2amJSMWVmQlNPSEgyTm8vamVPM3l2ZVVZU1NWOFlaZlhS?=
 =?utf-8?B?dXJVUG1hR0dGQTZ5S2c1Mko4WU5Ma2VvbkZwdjZCNCszSWI3dU9QejIya2Vo?=
 =?utf-8?B?cHJYYWFkdmZEbVlkWm1WQy9IY0dJV3h6bXdzUVVIOWd4cXVaVjA2clQ5Y2s1?=
 =?utf-8?B?eGxaeVlFMTR1Z3hGMW1aS1h1cFROZHdpMTlITlQ2cE1yUVlCcE51U3ZUUFZD?=
 =?utf-8?B?MWNYUVBGYmJUM3JLd1h5cHRBL3VnOVBVWk5sN3ZiSnlqTlowK0t3cWdaTksy?=
 =?utf-8?B?WU4vWlRnaVE4aGZETWt3NDVpZ0xhQnNCaTU2MHU4SnhHQVNXdXJYbjhqKzBL?=
 =?utf-8?B?RE95ZEd6RndJR1lmaGl3Qml4dUF1YzhwWDFIV0FHcnBNVTh0WjBNMGxkNU9y?=
 =?utf-8?B?Nlo1QVI0U003RWZ0Z21ZbG9rNnNXOEo3UUliYkxiTDRZUWRPZXNiamNBS2xl?=
 =?utf-8?B?Q0tpbDZZQVlDSk8yb2Q1Q2FmMGhWdFhWOC9FcEloQXl1SGZjRHNwRGdIaVNB?=
 =?utf-8?B?UVYrc2FGSFFRbzZUODB2eGYzb3F0M1UvQzI0K3A0YUd0QVJKbEpJV0tiY05W?=
 =?utf-8?B?NTBSaGFabmp4SFI4YURvNnZ1NlhzQkdOc3o1QXdJQkpUL0VYdTIwRFFnTlBO?=
 =?utf-8?B?SjhoVFRWQ2E5a0kwVWYxeElCaVpoaXAxTkp4SVZWdzNOKzN3L3JvUXJKTFZV?=
 =?utf-8?B?THpkdDcyZlFnTEt5cG8rTTVYc2VWZTNPaldCM0F5RDVMUjhGbXJLTGFUOVor?=
 =?utf-8?B?Yjc2VE5oUGN3cllZWld2N2V4WE81R3BpWEQyM3dnVG9yay9KVk1hWm54aHl3?=
 =?utf-8?B?enRDT056TE9Uc0dHOTM4ZDdzSDBCVnBuM3haK01lQ2lpKytUMEpHSnBBYW9V?=
 =?utf-8?B?eEp5VGtFTWt6aHl6SkRYVXlyT2I0M1hUQ0hyVnBXazk3Z29TRW84WTEyYmp4?=
 =?utf-8?B?MEx5Vzh1S3lvbXFCUUJ1T0tTUHNURTQ5TUZiMUNtZUhGZVdaTi9xZ1gvOFVo?=
 =?utf-8?B?SE5mUDJBZHB5VUdOM1hyV3NxR0JodDZGMmkxU0JBZ3U4TVVCa2lnaVcyWTkw?=
 =?utf-8?B?ODhlZjlBZjR0ZjEvR3ZMTzhkWXMvMFBNdjEycUxyaGg0b1hDMFFiTE05UnVM?=
 =?utf-8?Q?LzDBEth+APbAutIAcxUxl+Ykh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b98d7a58-1607-4ea0-8f5f-08dc49268961
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 21:41:44.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0OWvLtWZDlfN0HYx2+5IO+txoIiNtgF5ZbEHXjktBkp7F76dyQfrwIVxLb6ITuJidQauox80dWXb17Fwf8bvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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



On 3/19/2024 8:44 PM, Oak Zeng wrote:
> Since we now create struct page backing for each vram page,
> each vram page now also has a pfn, just like system memory.
> This allow us to calcuate device physical address from pfn.
> 
> v1: move the function to xe_svm.h (Matt)
>      s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa (Matt)
>      add kernel document for the helper (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.h | 27 +++++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e944971cfc6d..8a34429eb674 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,8 +6,31 @@
>   #ifndef __XE_SVM_H
>   #define __XE_SVM_H
>   
> -struct xe_tile;
> -struct xe_mem_region;
> +#include "xe_device_types.h"
> +#include "xe_device.h"
> +#include "xe_assert.h"
> +
> +/**
> + * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
> + *
> + * @mr: The memory region that page resides in
> + * @pfn: page frame number of the page
> + *
> + * Returns: the device physical address of the page
> + */
> +static inline u64 xe_mem_region_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
> +{
> +	u64 dpa;
> +	struct xe_tile *tile = xe_mem_region_to_tile(mr);

I believe you are dropping this patch for now, but wanted to comment.

Is above the only usage of xe_mem_region_to_tile() ?

As mentioned in earlier review, it's better to avoid the tight 
association with xe_mem_region and tile.  Such as for the UMA we talked
before, it's nice to have flexibility for xe_mem_region to be associated 
with multiple tiles.  But I guess this is all future/pending, so can
leave to solve in future if you prefer.

Not sure you have other usage of xe_mem_region_to_tile().  But here,
looks only used for getting tile->xe pointer.
Can caller of xe_mem_region_pfn_to_dpa() just pass in the xe device pointer?

-Brian


> +	struct xe_device *xe = tile_to_xe(tile);
> +	u64 offset;
> +
> +	xe_assert(xe, (pfn << PAGE_SHIFT) >= mr->hpa_base);
> +	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
> +	dpa = mr->dpa_base + offset;
> +
> +	return dpa;
> +}
>   
>   int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
>   void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
