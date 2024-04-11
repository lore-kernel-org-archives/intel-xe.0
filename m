Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF0C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 14:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E014810F0F1;
	Thu, 11 Apr 2024 14:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaKSdLKl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9936810F0F1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844024; x=1744380024;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=r4AAjTLBHXAG7IKN7847Lw6gKnAzlSqmFpLiuOgX+OU=;
 b=WaKSdLKlLaXDNiPY1CKUF6bEWEch55SCaIfsBQD7k3b0VcYz6qkfXFQB
 ZNlInwTbH1tEWgNtp6t0nx2RVeYtpdH4/s+DH5w002Ftb1On0YKg0s+sq
 93cN4oopruNgpfVn63twwai2KGJrFTeAkR++DjKVZ8zEmn3GaoOl+oU/K
 jdxRDBR0VBFCpNjDE346Tvk7r3sZcHXqt6YvtHbu/XY+4r1nFfG93I35e
 hfefJD6GIrRND8mw9IWJY45E9/PycWbxtdtU0O0/Glmw9VSvq49Zi3f5u
 Zsou9RaP44pA2e42aLEQ7HH2FYQoyZBkJvmOSdWSl3BYS6XHdEE4yH7ht Q==;
X-CSE-ConnectionGUID: C5d9Py9uR1+ptV+c+0kcjw==
X-CSE-MsgGUID: na34HJdXRBGsbNMDsrYtsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18856922"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18856922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:00:09 -0700
X-CSE-ConnectionGUID: auLB3moCQhmuV98Png2tJw==
X-CSE-MsgGUID: 1SyzqqCQSQukJRTewZk92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25697741"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 07:00:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:00:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:00:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 07:00:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 07:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THYx4pbFRLh1yB6Pq/QeEXV5wTldnLC32n9AqK/R+9hbZm8UfGEE3TBHd07+TryOuCqcEmW3ZqsC7r9zNVNcCwcJB0GiG9kIV20m6Byg+I8JIWnF+vKEIrjJU5rKFqLq5NOY3IHWANFRU3lpmoJ7+yosz45tzGP701iNXpZSwMiBp1Gje3WMdn5DH9CAi3uw/B6qPpQdLDzMChGyEbgYz1PTU2RE9ExOeCYeJLDnbSbRjDL7qT+f7sWA5qQX2McrQyrFI8VodavtqYa04Yubxt5NxNNW+HdCFymGCfiO7N2yPZQ+0ukeuFylmi1L26M9WrBT8xc8do3AF0LSHi5BLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxqD4FxfzaZu8usK1KcoErwi0sr8M9cXGnkMwFrRWsc=;
 b=BoCjPScpCjSy708VB5EzjNTi3C6E9x1JD2M2jXLoxtnSWTfSzrqMFok+PYMGGzlh1mZUWkp4OzDwtY4wwFWZiCFwoBBEBcVpziQh+EH/P72gh5RZ8iSQqsAaPCQwRS9WmKBPngeM31jy3twWHISz/A9Y3inRIItDSCXI87SNa7CHVRrRl6yMWJQOjT71xBdwvzFYPCx1hxlJ3WM1tiGBqlRiBLm1sbbKdxYVZ+Ux72IajepGmM/8XyBfOE4Bo7t5YNpdekFuPM5fydolLDWenXHm597gj+0QBvkA9Qt6DdIebLbM7re88px6OpCTSJY1LKrQFj/WGIh7aZEYsHz0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) by
 DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Thu, 11 Apr 2024 14:00:06 +0000
Received: from DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409]) by DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 14:00:06 +0000
Message-ID: <17cbfe83-fa8c-4494-ac96-9ff5630c40ee@intel.com>
Date: Thu, 11 Apr 2024 17:00:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
 <7addaf63-6945-434f-8f9f-8341e0fafa26@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <7addaf63-6945-434f-8f9f-8341e0fafa26@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8136:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 504fd06e-18d1-435f-1e78-08dc5a2faa7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQD63u1XT5LtXadBYe7qbE2cLmboBHdd+0QsNUAGiX/n9OKkHVYfYEly07Yxh6HmxsO7tcPbWTuJ00DBN5kUtz0Xe9e2v2sC10FIt+2cZO57yMOqnaw2501eLu9wjeaXxVv4M7jj8iG6QG8gFvgN4izCd9sfVuVh9wCBXDrFOJz+aeZ/yWulC/l3OIBdEkxLKlnFDlSfmo+eLKWLhZAgpI9eECBBPiPArvc8XoTwGSiboKGRiqduh8UacXHSATSDd0U+T7pbJRyjH7iJHa2zbS2MzKx9VBNWAlk8N0hnTmQ/9TGzMEakRiRXkjf1BavWGClUY5CxxrTy7PigtxDZM/ogp2tt/DEnXdfzAJGM+dHI4Cy4myuxbtldoLeRIxzpjSFlgd2qRW1+f7p9eOGrD2ZvC7DlJpkudEfkAXPJ+cs3OtM1KaDDR4zLmKUwWQofvIJslZKzlsAldTD08z0MzRi//lEVbF/nWXq+Os7yfGoilk4aobv6LUkHQpBjWF+k/RUzkw7qT1ii3bjQ24UhVky83IwkVIL/D7W4rfUIoPybEsGF15CgjemRPicdrZeD1DpXbHriViHWdFQRQeRndK4euErkNXYjNkC5EK2vHPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8136.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um1LY1VxMzl1VFQwZXlTY1crR1Jsc21KT1B3bVY3bllqb2theWVFRzZrdUZm?=
 =?utf-8?B?N1d1cENEcHNWVm16U2I0V1Z5OUYzVkNLT1l4cUpERE9vTHV3QVIyUjU4c3lV?=
 =?utf-8?B?UzJaODM5MXVST2c5V0F3MFNIMklZRHdjNTdMdnlQbjd0Rml6bDVnOUcwM3Ex?=
 =?utf-8?B?bUhkcXkzQTBBWVY1elZhUlpCZDZUL3gzaG84RytOMnQ2aUJTU3hWeERsZ2xx?=
 =?utf-8?B?UUZMOVBma1oyaXZwZUloakNnZk4wb2VORWdDNnJwUFdtWlQzbHZUVGZkN0d1?=
 =?utf-8?B?LzE5QzR6MFBPY2lMenJ3ZWMwd1Jvc2dXcWFuazI0eWJXSUUzQkY5cjljcFVx?=
 =?utf-8?B?Tm9BOWlzTmNmV29yV0loSnBTVG4zSmVKb1VvVlpSK0w4RGtLRjUxYWpZWTZy?=
 =?utf-8?B?VVJDME9DZmIrRjJSWkJLRHVOMEpoSG9mbERNckJpUFQ1c25Yejh1U2JyS3BM?=
 =?utf-8?B?cGVKb045V0Noc29BaHdMZzBoZ3gwdGpWUlFwMGpaUGs2M0Q4dHRiMkNuWVY5?=
 =?utf-8?B?VGF4U2hGWjliQzV5dzlsbGh0MGlicTNMSDV4bHRxNEliYlJ6RzREY0NJMUNL?=
 =?utf-8?B?VHRsQ2phZVhreDJEZWpUNTM5RWtUV2ovQ2lOSU55eHVlaFIzUVlJM2JjaWZi?=
 =?utf-8?B?RlcvcTZsN0hZdFYvM1kvY3B4S1NrUVdTY0ZrNW9XNWt1cVY1R3lqR2RnYjdP?=
 =?utf-8?B?L01XWWE3dldqYUJuUFhQR0xkWGl6eFpzVjBMaWluR1pyT0tHMldIWFdhUEIr?=
 =?utf-8?B?VmxRM1Y1S245eWMvdEV0ZTVjK05mN3RDTXdtYXM2S0FiOUtyUSt3cnowdmZz?=
 =?utf-8?B?QmlPK1N3dzVsQjc0ZzVJV2o2WFBBMEluYmxHV3kxSWVlVStFSll6djErNksv?=
 =?utf-8?B?VlJUVDNDZkVnM2dQV2FibkpQd1FRbzhFZzhyL1IzdStsODlFcno0UHQ3VVJq?=
 =?utf-8?B?YnNINzg0QnVkMDA0YkVjdnRQZEtwUzZUNnh1ejNnTTRBcEhGVlU3ekdQNUdk?=
 =?utf-8?B?Y0pRR3ZLL1lVVStMUE5GOXd3VDhvNEltakVRdGwrOW1CUm9sUWZOU1pwU1F0?=
 =?utf-8?B?c2t4cFBDNEN0OXgza2pHVGhraUFSNjM3K3c0VmQ1QWx5NVBiWXRYbDhwNU1h?=
 =?utf-8?B?aEliOU5xZlFmaXorYmwxejRyRlBDK3hUMUNOZXIzZjFXSEpmZHJGWjBrOFo5?=
 =?utf-8?B?S3l6SjVhVit1RDRhRjdmVlp2Rkg4a1VGQSszTHdTKzQxNjJqbWVmcm15RWs2?=
 =?utf-8?B?TlN0Zjc4YVhsdExjcUlVZ2syTURGazMrQlFZZEtWVVJ5RUdrajAwL0dKUklh?=
 =?utf-8?B?R3BFUVhTOEJYd3NkazlKRTgvNFJaeHhJdGJabWhTNzFOQTZwU0ZnWWwzZUZM?=
 =?utf-8?B?cDA0RjIxTys5RVVXYUxVUG1KMGN6OVhQeWFpdWJqc0FoT2ZQTWZoaEpEcnVM?=
 =?utf-8?B?U3BRRVVhOFhDN2JFNXJsVXk3ZmZLTzBYVXBwM1FOWjk0SE1xVml3RTNqNzJP?=
 =?utf-8?B?eUtibG9ISUtrK1FGSnJ6MVRucUhvdm40bHl6bW1ldnVLZGtDd2JkdW91UDRY?=
 =?utf-8?B?N3lwVjdSVjUwVWp3aDRtanY4dEZzeGpIem5tNU1EaHFNaStxU1p6MEhiaUdO?=
 =?utf-8?B?M20yamExb0tlb2haQmxwQWlIT3hVU05aZndZSmc4SU85dzJ1SU9SWHN4WjBx?=
 =?utf-8?B?azA3WjNFNUdyQ1VoMWdFZVprbGlrWHhYeEpFQmNObG9JdTE5SXZKaGhxNnY0?=
 =?utf-8?B?bENtMXZWWGJHYVBxN0hlUmhnQ2kyUGxRTGgxR0pSWWxxUThabUpUOS83VDhS?=
 =?utf-8?B?WWpMNkthVHZlZ256eFRhL2FvSlk3U1MxaUxWSkZTL1JqcS80bmZlaDJRK3BY?=
 =?utf-8?B?ZzdQMW5WZE1pOHJycnpkVjBQZm5Nbkk5VnZsYzlsSTlRWkFhcitKa2MrN3Bj?=
 =?utf-8?B?b0U1NHd3K2VZSmVmQ3NLbDRiM0Y3MlF3bDRjZzQvVzVxd3VOZ01BYXdnZnlI?=
 =?utf-8?B?R1BBN1dFWUFtMURYNlc5eUtlMS81cTY5Z2djcHkvOFlmVUZoUHRMZjdBUFRr?=
 =?utf-8?B?L0cxMmJpYkkyVjAyd2pzZDYzbmNIVTFqOHNudnRwRFlvSXR4eFppMURNRUxp?=
 =?utf-8?B?czZJdWoxZjFjYXdQR2JpeTQ1azY3czNCTDIxaDM5YnRDSVBXeU84TnFHSDYz?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 504fd06e-18d1-435f-1e78-08dc5a2faa7f
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 14:00:06.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSmEk9tyEboluosYJHop6cWywwRfAm5OzWxlsdFGWRLNHaiwyLxL8Px2K8YECYAS/04PS+zFs8qgqhuClH/Kf8WkcD6TJh/f6yWPfmMktAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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

On 11/04/2024 16:42, Nirmoy Das wrote:
> Hi Lionel,
>
> On 4/11/2024 3:14 PM, Lionel Landwerlin wrote:
>> On 10/04/2024 20:03, Nirmoy Das wrote:
>>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>>
>>> Given that simultaneous usage of device atomics and CPU atomics on
>>> the same SMEM buffer is not guaranteed to function without migration,
>>> and UMD expects no migration for SMEM-only buffer objects, so this 
>>> provide
>>> a way to set device atomics when UMD is certain to use the buffer only
>>> for device atomics.
>>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>>   include/uapi/drm/xe_drm.h        |  9 +++++----
>>>   3 files changed, 32 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 8f3474c5f480..530b4bbc186c 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>>   #define VMA_CREATE_FLAG_READ_ONLY    BIT(0)
>>>   #define VMA_CREATE_FLAG_IS_NULL        BIT(1)
>>>   #define VMA_CREATE_FLAG_DUMPABLE    BIT(2)
>>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS    BIT(3)
>>>     static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>                       struct xe_bo *bo,
>>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>>> *vm,
>>>       bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>>       bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>       bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>>> +    bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>         xe_assert(vm->xe, start < end);
>>>       xe_assert(vm->xe, end < vm->size);
>>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>>> *vm,
>>>           xe_bo_assert_held(bo);
>>>             if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>>> -            !IS_DGFX(vm->xe))
>>> +            !IS_DGFX(vm->xe) || enable_atomics)
>>>               vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>             vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>>> struct xe_bo *bo,
>>>              operation, (ULL)addr, (ULL)range,
>>>              (ULL)bo_offset_or_userptr);
>>>   +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>> +        (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>>> +        drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is 
>>> not supported for this platform");
>>> +        return ERR_PTR(-EINVAL);
>>> +    }
>>> +
>>> +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>> +        !xe_bo_has_single_placement(bo))
>>> +        drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS 
>>> can be only set if the BO has single placement");
>>> +        return ERR_PTR(-EINVAL);
>>> +    }
>>> +
>>>       switch (operation) {
>>>       case DRM_XE_VM_BIND_OP_MAP:
>>>       case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>>> struct xe_bo *bo,
>>>           if (__op->op == DRM_GPUVA_OP_MAP) {
>>>               op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>>               op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>>> +            op->map.enable_device_atomics = flags & 
>>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>>               op->map.pat_index = pat_index;
>>>           } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>>               op->prefetch.region = prefetch_region;
>>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct 
>>> xe_vm *vm, struct xe_exec_queue *q,
>>>                   VMA_CREATE_FLAG_IS_NULL : 0;
>>>               flags |= op->map.dumpable ?
>>>                   VMA_CREATE_FLAG_DUMPABLE : 0;
>>> +            flags |= op->map.enable_device_atomics ?
>>> +                VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>                 vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>>                         flags);
>>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct 
>>> xe_vm *vm, struct xe_exec_queue *q,
>>>                   flags |= op->base.remap.unmap->va->flags &
>>>                       XE_VMA_DUMPABLE ?
>>>                       VMA_CREATE_FLAG_DUMPABLE : 0;
>>> +                flags |= op->base.remap.unmap->va->flags ?
>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>                     vma = new_vma(vm, op->base.remap.prev,
>>>                             old->pat_index, flags);
>>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct 
>>> xe_vm *vm, struct xe_exec_queue *q,
>>>                   flags |= op->base.remap.unmap->va->flags &
>>>                       XE_VMA_DUMPABLE ?
>>>                       VMA_CREATE_FLAG_DUMPABLE : 0;
>>> +                flags |= op->base.remap.unmap->va->flags ?
>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>> +
>>>                     vma = new_vma(vm, op->base.remap.next,
>>>                             old->pat_index, flags);
>>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct 
>>> xe_vm *vm,
>>>       (DRM_XE_VM_BIND_FLAG_READONLY | \
>>>        DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>>        DRM_XE_VM_BIND_FLAG_NULL | \
>>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>> +     DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>>   #define XE_64K_PAGE_MASK 0xffffull
>>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>>   diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>> index badf3945083d..7b9c68909c78 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>>       bool dumpable;
>>>       /** @pat_index: The pat index to use for this operation. */
>>>       u16 pat_index;
>>> +    /** @enable_device_atomics: Whether the VMA will allow device 
>>> atomics */
>>> +    bool enable_device_atomics;
>>>   };
>>>     /** struct xe_vma_op_remap - VMA remap operation */
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 1446c3bae515..bffe8b1c040c 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>>       /** @op: Bind operation to perform */
>>>       __u32 op;
>>>   -#define DRM_XE_VM_BIND_FLAG_READONLY    (1 << 0)
>>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>>> -#define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>>> +#define DRM_XE_VM_BIND_FLAG_READONLY        (1 << 0)
>>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE        (1 << 1)
>>> +#define DRM_XE_VM_BIND_FLAG_NULL        (1 << 2)
>>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE        (1 << 3)
>>
>>
>> We should probably document that it's an error to add this flag if 
>> the BO has a single memory region.
>
> It is an error if this flag is set on non single memory region as 
> atomics on SMEM+LMEM  buffer will be handled with migration.
>
> Let me know if I got that wrong.
>
>>
>> Are we supposed to the ability to set that flag or is there going to 
>> be a query?
>>
>> A query might make sense since it's going to be rejected for some 
>> platform.
>
> Can we use the rejection as a query ? I am using it in a IGT test 
> https://patchwork.freedesktop.org/patch/588759/?series=132289&rev=1
>
>
> Regards,
>
> Nirmoy


Okay, sounds doable.

Will try to put up an MR for Mesa soon.


-Lionel


>
>>
>>
>> -Lionel
>>
>>
>>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS    (1 << 4)
>>>       /** @flags: Bind flags */
>>>       __u32 flags;
>>
>>

