Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A27CD1284
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 13:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7565110F0A8;
	Thu, 11 Apr 2024 13:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0/YiJpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A6D10F0A8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841281; x=1744377281;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uPgDaFc1wneE+XFUr1iGovmuyCP0vlvaumoh2gCaruc=;
 b=e0/YiJpg24aQcSdH/17ui6oI8QeTpfTYmPfNHCwKaHvQQ10ZrguoZMaC
 YNJ7yW0WUXnYD4j366kvP47zg4mQMM1hREUix7ZjzDNQZtV1YLB8s2IiN
 I2+AEoIBYRpqbM0jDel9pyL6aL0wMHVxIR0Q0MtV+v8DmxpG/LXwNJ6C+
 t/KqqVsX2KzAqMXtR/DxfTV8RXFx/RHZtqzU9oNyo3oHOg6bdiDi5AgPq
 cVPtz1RjL2Y20ERL4VVoAj86LrNMoAyT1V2puxtdiFS80lWK9rOcZI7Xf
 eZOBJnerYsQ1OzphRoYCzvi1E47Yx7kJZoZcU5jcDqXyn9p8kIZyU5uoY Q==;
X-CSE-ConnectionGUID: 9xKkaDmzSSO/+N6sMmc4kg==
X-CSE-MsgGUID: 2NvuSudOT22Mp5McXOhK5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25760524"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25760524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:14:41 -0700
X-CSE-ConnectionGUID: Gp3m2MBqRGKIa0UsYr1M6g==
X-CSE-MsgGUID: evtKiAIZQuu85zXvpSrf1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21486538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 06:14:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:14:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 06:14:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 06:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri6TwGjOuvDHvJ5+AD64kjw9abq+f2lnGFJcECeaKmtECC9Iy9VCgvKWcl8+XBSXqLc7plpX1C+pkRq02FPMQcAt8mF43gFQwDYmGd0AUYL3+1cAsM2KAWWxOIFke1A3c85ezQhKlB7+845b5kxSvmznuil7f9jQ47l7NIQysVQw4xCX6jl6d+0KCRCyyIhWmWNhsNBaqDOof38TdjrHMKJBQj35KCz/0ZA363FW9Rrg0l2LzPhtU+ZQuqIWmNOo0Q14UtczhNDSwwN2FmS3wNBSX63O31UmZjeCdHatqb4r4jERO8HFsesM5N1JetKdzIfT73eCRIBc3Wcc0wpxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w36glJpMpNyqP9/6mgdk2JSwHdZ2obtxs5N20/mO9NA=;
 b=GA4ueHW5wRNP3zG7m5KyMEkjlcuwKPkzMaowe2XAx2KSUa2Xfjh7yy/72zWMjTU1Z5wtkFp2O+icx3TSR8vTmqgSJIGRqs5Ah+hrsFBXMg50hT9JsAKg/hZ7O8H7kZjuawr/lSQXr97733Nuo7JCtecFz0512mV5qwPQkZZkLDnQ+7wqBxaJ1nj/V9b79iXbJttqfAObx2hJvWoN5CoaEnsgCxWmD1HRkODt4uWRHUknLToj3N5MW3Zw3ig8ToSBSFvwCq/SXavCRzf/9LtmMo+2WaLS8ihqqRqMqxKjiQvGoqtGcwvLp7a5OU+ZmWwAmr1gQCtv5XjEqekHmo9TDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) by
 CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Thu, 11 Apr
 2024 13:14:37 +0000
Received: from DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409]) by DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 13:14:37 +0000
Message-ID: <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
Date: Thu, 11 Apr 2024 16:14:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240410170308.409-4-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8136:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: fded47df-3f3d-40a5-e23f-08dc5a294017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnwJqSfvPx+Y3ZKBNOx7GKbfxkfVl0RqgDY7/RRYuwjp4VvX63k5UkicNKXl93zB2vUdYMAL7ZG702yWmQjoDDGOmcM4CGeaa2ad6HqmfZCdVxS/PbHRblb9Wdpp/f7dbecUia88yOOWweL6wf0NAcu0fFeJPWOxlLa3D7i7hJz6Pu2OwHuqAUV5U8A8M4lE2clOkOrJtLvfxuEXmtUAeBEyhEvZW+08Kmox4uvKPMBMwlFoB8Uc1Wi0ZY1e/R/EHNvt1E2ZYdCj0REaMnMhhXkXmvo5Ie4xstHyHyOux6+59agt+LkiH2s2ZDJ+kcAgZw83YokRkZVAuaquMtTMuIfzyOkeBAv+/kFNSlIlorR8tdD7bpbHY2OOGfkwmQUtYJrLTlG2y8LfjstwYpXEeZxxeh8d4iLRrZnWP+pJGY9Mtyfw/LmBnsCKWU8iVVhSmsG/SMIcwccIH1sl9glGstZPNR0wZ5Sp9qXBD/2p6vVVcqE8lv2tVJxeixgzgmcHNUKUElPK+tmLMvImXNIhedWSCJO7PREpgH87PphMmY9XtTG7NGlv70g++J28irg8qs2nBOs+azW8u8ps3uQUuuX5jlX0wVQaULfzD1gfuF3Xqq3XrCerZGpxNTWlekyhBuw6axay/AW47BYEZlmllVSJevyh50LQ45AUDYYXXpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8136.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtLa0d1bEE3eVAzZnErOXc3LzZoRUJ6eXZwSGdyem9LMXJnS0oxeFFySVVD?=
 =?utf-8?B?ZFo2cXZyb2xSd1VjMENndGM2bU5wZ2FPeHhqV2tacmhwM2VuRGM4RTAxek5C?=
 =?utf-8?B?cWlhcndGTWRBNnNkdUI4blZWT2lESlhONlZEb2kvLzFmUEt4aDVKYXAzN2g5?=
 =?utf-8?B?RFNJQ24zclM0ZGh3N3A5TGszMm4xdUVWc09PTFZRUkp2M3NxL3dwcmc5NU0z?=
 =?utf-8?B?STdGdFR4bFNCYXpZS3oydjNrTzBnTmFlNE92L1JZWWV4c01YeHgweU11WVJo?=
 =?utf-8?B?dUxpWGt6aFdtM3N0MGJYclp4TGJlb2pYWFdJMk5RMmR5TEp4YytnaHRRSGho?=
 =?utf-8?B?c2l2QjV2NEMyVEY5bHYweTJaK0ljQmRqcmV2OEQrS0xxeko1WURoZGZhNWY4?=
 =?utf-8?B?TUoyeWJwNjFFUmYybVZnZE9YS25WTGRVWjFKTFNGT1Njb2dyZGFvSzUvQUlP?=
 =?utf-8?B?eUp1K0diaVF6RitjbHQvQTBhTGxGSWM2aDVBVnFqUnVjOEJUT3l4UGdaK3p1?=
 =?utf-8?B?ZitTM2F4RTVNei9SNEJyUStYL014ekxjY3ovVWVQbGV0S3NRTjd3VFJZd1dB?=
 =?utf-8?B?TkQ4Y1Rkd1oyc0RwVU9hVXFrN2UwbHZwNnA1RjliTFp0VEFja2lEcmM5QXF2?=
 =?utf-8?B?cFMrZHBmSmQ5d05xNSttK09kbVZKWHJ1emxVbjRDcUhLbDlTZnZHVFE5WFNJ?=
 =?utf-8?B?NVE1NFA4OVB6c2dERDlGSU9mMEx4TkEvUEJ6UlhvaXlOYVZiZ3MyeFJJVW1C?=
 =?utf-8?B?ZUIyL01VcUpza1NhOFVqaTFvWlQ4WmVWWDhRc0grTm0zZHY4RytqdjdZUTN0?=
 =?utf-8?B?MU5SODMvUkVNZ1FhRG5XaDdMWmxEOUxqbHlPUk9rYWtEdG9pTTk3ckRzZkFS?=
 =?utf-8?B?c3ZodHk3U0xod3EwU0JZaysyQ3piUTIxY3N3b3lUb0tYcUtWVkE3OU5ZQVJZ?=
 =?utf-8?B?SkJIdC9iWVRFSSsvYm12bUptbjl4bkU2Nm9OOUZqMTRnSHRrSkVkck5WZnpV?=
 =?utf-8?B?MkVocC93M0o0OHlRWFBzUE5sajgwWUNkcDd2QmpNVTdRT0gyZEVoQXJpbFFz?=
 =?utf-8?B?MFpOVzVZSnFzMUdVcGxyTTREYTQ1c003Mml0aWlhcGg4TU00T2RLcFN6M2xh?=
 =?utf-8?B?d2VKTFkzenpyNmVobFY3U2hTb2J3Wnp5RmI0WUpvOFU2bU9ieXYrSFpJbE1T?=
 =?utf-8?B?ZE1xcTVpRmxOdWlGSDVOQXJNUGFBQndKK0N2MDd3UTFJWDZzT0dGa1RRT2U0?=
 =?utf-8?B?a3Zta0lXRXZmUjZ1ME5CYnhrRG8zTGFmeE9TT1htdFlpUHlUOEx0bTVka1J1?=
 =?utf-8?B?NmdxTEdvTnh6QzU0YWtiYm1rVTVrQ3BzSzFKNzdqamFzRVJ5RTdvZTlMRUFV?=
 =?utf-8?B?U0d4Zm5CM2dMUFZMUWhuQm0yWDZCUUtUMWs5OVpYSzlXRm1lWU83VDZRUWI2?=
 =?utf-8?B?aWM2YVpFZUYxalNWWmVGWTIzb0ZoZEV5M3VQZnlYVVVYbExabjBJZHkwNzNy?=
 =?utf-8?B?RVBnMUhMa0sxbmh6VmVHaWcrQ3lVaHc1TGZSVzd5ZmRLdzdRTUNrNEZLQ0to?=
 =?utf-8?B?aTV0OFpqN1Q5UUYrb25KRFk2REtaUVIwVXJjL01Rc21PSVlLR01hMGV1cWxi?=
 =?utf-8?B?bVEwc0NxYWRjR0p0SEx2N2pTMGFSMkhxei8rNllOUlFKYXJ5aXhkTjhBcmQw?=
 =?utf-8?B?bWhlc2hPUk01eTAyOUlkaG4xcFBEc1R2Q2ZSUzNMbG5SNEY4dHVXeEFTdTNx?=
 =?utf-8?B?OG1KRjhLalFaSDRsWG8ybitWY09xdXBINkFkK2ZlN3IwdkhPWk9RTXRGZnZK?=
 =?utf-8?B?M1drd25VS3Btb1lPL01ITEpjSVBLcWp5SnJjQUtIaVprVzFCZittejZqdUxr?=
 =?utf-8?B?TW9QbGN0dURJckxwdDRDNmhRKzA3UTBNYk42bWNIaG5BSmhmK1ZCUk5rLzcr?=
 =?utf-8?B?RnBZSW5QdXF5OXBFOHVlcXlJV05RbHlkeDN2L3dtQWpVZ3RkaFdRU3lxaDRp?=
 =?utf-8?B?UStRdXJvclk4b2wyUVk0ZkNhdkduTGlTMEpTYkNFVm1rZmROSkNSeVBFQVhq?=
 =?utf-8?B?bWhZUVQ2aTU0TjBHcVVFMkpmY0t3TEMzalpmVEdUbFJXMUpYTTNxQnhqVEtI?=
 =?utf-8?B?QjN2MUc0SmlqQ1FxRGR5Y0lXemI0blBTVHA3eWY1TURsZ2FnemE2YkpEMHNB?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fded47df-3f3d-40a5-e23f-08dc5a294017
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:14:36.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+NU9lPcJpE+J7YAtVF9/yUMv0eiNWudWr6IbOXXsAgHyabU8rGmGJ+U08tzG45ps4PafIoo/y7sHivFB3qNhg8GYf1sgNnpOW/tzdj41Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

On 10/04/2024 20:03, Nirmoy Das wrote:
> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>
> Given that simultaneous usage of device atomics and CPU atomics on
> the same SMEM buffer is not guaranteed to function without migration,
> and UMD expects no migration for SMEM-only buffer objects, so this provide
> a way to set device atomics when UMD is certain to use the buffer only
> for device atomics.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>   include/uapi/drm/xe_drm.h        |  9 +++++----
>   3 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8f3474c5f480..530b4bbc186c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>   #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>   #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>   #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>   
>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   				    struct xe_bo *bo,
> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
>   
>   	xe_assert(vm->xe, start < end);
>   	xe_assert(vm->xe, end < vm->size);
> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		xe_bo_assert_held(bo);
>   
>   		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
> -		    !IS_DGFX(vm->xe))
> +		    !IS_DGFX(vm->xe) || enable_atomics)
>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>   
>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	       operation, (ULL)addr, (ULL)range,
>   	       (ULL)bo_offset_or_userptr);
>   
> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +	    (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
> +		drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is not supported for this platform");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
> +	    !xe_bo_has_single_placement(bo))
> +		drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be only set if the BO has single placement");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>   	switch (operation) {
>   	case DRM_XE_VM_BIND_OP_MAP:
>   	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>   			op->map.pat_index = pat_index;
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>   			op->prefetch.region = prefetch_region;
> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				VMA_CREATE_FLAG_IS_NULL : 0;
>   			flags |= op->map.dumpable ?
>   				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |= op->map.enable_device_atomics ?
> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>   
>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>   				      flags);
> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				flags |= op->base.remap.unmap->va->flags &
>   					XE_VMA_DUMPABLE ?
>   					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>   
>   				vma = new_vma(vm, op->base.remap.prev,
>   					      old->pat_index, flags);
> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   				flags |= op->base.remap.unmap->va->flags &
>   					XE_VMA_DUMPABLE ?
>   					VMA_CREATE_FLAG_DUMPABLE : 0;
> +				flags |= op->base.remap.unmap->va->flags ?
> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
> +
>   
>   				vma = new_vma(vm, op->base.remap.next,
>   					      old->pat_index, flags);
> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>   #define XE_64K_PAGE_MASK 0xffffull
>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..7b9c68909c78 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>   	bool dumpable;
>   	/** @pat_index: The pat index to use for this operation. */
>   	u16 pat_index;
> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
> +	bool enable_device_atomics;
>   };
>   
>   /** struct xe_vma_op_remap - VMA remap operation */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1446c3bae515..bffe8b1c040c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>   	/** @op: Bind operation to perform */
>   	__u32 op;
>   
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)


We should probably document that it's an error to add this flag if the 
BO has a single memory region.

Are we supposed to the ability to set that flag or is there going to be 
a query?

A query might make sense since it's going to be rejected for some platform.


-Lionel


> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   


