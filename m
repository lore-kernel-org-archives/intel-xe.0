Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399F3C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 08:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAC410F3C9;
	Fri, 12 Apr 2024 08:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Si279Miw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEE210F3C9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712909189; x=1744445189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ybwv5+zv3W6v1al+lEkRHPmdOA2KnI6EohM0XGZ0wyA=;
 b=Si279Miw2qTQqY/0R40dtj1sfZOEBuLxYunWNLqiaR0AHWPcWAy4Caq4
 dI0SnIdVQQCgz16KW7+Y1DVf6dMRA0R3Gdejp7ggOKXD22Qxp962zEEfy
 Tu8NOAAO6DtQG6TgKDDfbd+TzvB9yeQK9MbY4zIor16lb/plAHu+dVw2k
 YcXlueE5DxCTM5z+kyphLoVxAzEaqXfVbhdDkLmSwT4IcTBN14uLJdwiW
 YyAU1FQ6/6RUcJJCF7qfFZfeJcqfmocvI20SQP+hW3s1WslyrOhTpjARk
 CPZrMlwsVsd+9MdpURMbW8gzuUaZf5pv/aOQYpXezmJiF/SFr5nZ+x97r g==;
X-CSE-ConnectionGUID: XHK4/ARERcObgTdkt+Sxdg==
X-CSE-MsgGUID: f1/MTjkTQi+PGpSIr4h1aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8215571"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8215571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 01:06:29 -0700
X-CSE-ConnectionGUID: Hfh5MJu6QGqVYDbvQlkUeQ==
X-CSE-MsgGUID: CD0DT/2STluduyRRnkFnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25953202"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 01:06:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 01:06:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 01:06:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 01:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZYNb+gPR3Q1a0Omsi6UFuqKSrC5ZAP5iKruV7H4V76EjbaKV4IocIXoMsnlDFtsbvu/OCJkegtAVInH0SWTd9yb6Dp8pVQHavAKt9QkAtMO15eUc8KTvLrlGcztbU8JIk/v0rqZXlXFxROHO/hIxgGPD7bmc68rMc6gkN8ZsKlDE/hcmkU2vucKn39FAbw6RgQKgG63wqmK+AxOhHEdX9Dqe2OMkEybh2+uKMGj+iskE4q1/rYhNDKI3XScFAitWu9sIRv1wiIdTgpXrehl1LMULDvYPNDFWWLjofs9i0sGA37BX6Gio2T5F8M2ip9JI+Hq36LV3UUC7pleWyYNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbuE8VtaJcWLKhjIMXnvhZho9cjb1UBBixt59KMIuvk=;
 b=KQi7TgQqUF+JWphx21vCP0KrP1Bjmo87CLAkjqGBS9Wu3FCJ2qVXG4MIDfO6YZxk/6tQiKUZ33ehynWTjISA7/E0nO9std24+2k8xN4Nd3PPMxgPdwUjTxRlaRhv8Up22K+6Qw1g1TH/+qSuCEBlzObuGI6iFueo00aAm440UF8sg+E1EktEnBaEXgD0U5V55RwVpVgqx/TQjJcehnQ/m9vkniwS17oNvDKwITwElydhT6PHz6oHbhwu0b4YFrDwsp2PDJCrigy3C1qV4Z8Nz2aKdacvpEiGH9Kmgtya/+NP9lKfSEfnXSl8Hq146MZ+CnYFdVfxMjk6Cnu/xgVuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 08:06:26 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 08:06:24 +0000
Message-ID: <3abf512f-300e-4d66-b144-08f00a7cd302@intel.com>
Date: Fri, 12 Apr 2024 10:06:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <20240411234412.GH6571@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240411234412.GH6571@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 20856d65-b7a6-4f90-ce2f-08dc5ac7724a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBBZIZt/b0tHiGWQ46+zxfaIJCy8SHVhqYgHmIblZhk/dCRKn7mpHU8rafVDMk6vfusHci2sK8uzaDkoxO7iIAx6dBwGPBuh7aFWIuDXP+pggK8rCmuyjloFpZ8/nd6bkRgol1eDtmU7wQJmnHjLy0vG1yZK4UfpYM5OILdZGarafL+gNaPxbmn8Q/yc5cqxpbrBV+5H0c3vIF6uTVbltWShUnDKZyPwx0VElonIQlK0DYF3173RCISUmtZIPb6tGjZbOiXK798BhH+ZrcNMoLRbWqN//73PK76lsuq0KFau6O11qEHMMJoUmK9Dv9qeiJP4KkiZCh1JXNlJ34J3UdjnOcDmPjiJACrCI8W7jIyYDb1yMvpdx/4FKYA9t/uwhRVZmOzdEnbNcIvnv859ityH+al2Ku2GX8AD0YUvdVNmPvlv4D8tBmxsSRbk1Am80GwSk9Jody/SH15aeEKEuXP6oPOJq2MenIwxMzXOCcC8/SctxPZ3TUwlRaGDkw7ESghiGp2WwqhOyZM/4eFPnSNiS0VU4GQiZDsgKuGEcxehRTIfDBNE9wfhjG+AOUHJ0pmJ8oA4OmRgx+/0wf2Z/lGCfmNqd3rh0gWYHIA7CDWIpCm54Hs36vZVVHTQ3AC2PvqoBZ+R6LNO4JuF7wdIQHORnp4wP0zBq9PpekVx4+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJPNGF3WmJqSU80VDVYcnlhZHUyTURLalNsQy9ZTlV5bWN0RkxMTTFYdnlI?=
 =?utf-8?B?RmNzT3pjNlBHZGY0TWkxSHUxOUh1NFpMbDNTYitLWUpVeXpJU2loN3B4Ly82?=
 =?utf-8?B?RWh0UVFmeUpWWXEyaVNWSklFWnJzdnFPR1dJTFBxWjZaOGZHS0taNHdWMmI5?=
 =?utf-8?B?NVpEc3VEaHpaVE9DN2x2L0E3V3RtQituV1hDdWljNnpYdklSS1FsYVF2SHgv?=
 =?utf-8?B?M3UwWVpBY1RFY3N5cjNUckZqcGVRM2dkY2psV2xwNk5PRit5Qm9GYUgxRkZw?=
 =?utf-8?B?WHpHSEVUaDN4aXA1M0t4N0lkRGFGOU5nRjBLdVROVFM4UXNMd1BGRFZPZklz?=
 =?utf-8?B?anEzM0tDZTBGeU9vWk4rZlpZMmhkWVhwaUVGTjJLN1N1M2U4b1NCUjd5MEMz?=
 =?utf-8?B?SC9tN1gvZ0tLa01weExpR243MVJYV2xWeXdWN0FRT3hCdGlLbWtML25aemx2?=
 =?utf-8?B?RFFEaHlxOVZDTUtid0FRYndCRkYvdWtSUGpUbGI4MzZSeXY2K0UrdC9kalE2?=
 =?utf-8?B?VlRFajNnVnlKenZoWnB5S1BqVU5QbkFSMmY5azVrb0xsSWpQNFRib0srR2wx?=
 =?utf-8?B?VVkxa3VWdzd5VW5MMm83QVkrbFdjZmJtRzM1cFF1ai82Z0lEUmR2NXN5UmZk?=
 =?utf-8?B?alNRMWtDa2JpYW91T2UxTkYrMEFOWUQyYVVmajBVdEw0akhPa01QZ1pKT1FH?=
 =?utf-8?B?R0dVSmdoM3pLUVQrRzhsN0Q2aCtSaCtwUkd0S1JYaFNzdEU0dUFVM2pVNzhZ?=
 =?utf-8?B?dTRaZnpWSGVnb0JpUmRSZitpbElTMHhYWTFIaTdQSndWUmlRaG5lZzFNOE1D?=
 =?utf-8?B?T3ZOU002dWRIdzZFRnRjTFZKbjdGeGZCUnBhcU45TmI0YUt5bE1hNW1LUW4w?=
 =?utf-8?B?aHNJQlFhMXRtdDhVd092VVYwaUZHUW1iYnF5VExCRmxIYjVIZmhSTkRLQkJY?=
 =?utf-8?B?V2ZCMmg5N2Q2aTh1SzFvbHlRU1RvZC9FbTMvSGdFQXpKQVZFT1FMREJRa2hX?=
 =?utf-8?B?S2hHL29kVGZwZ0ZBbmc4WUswWndCY3BzK1gvUG1xRkUxVGljM0kzMVJrUDd2?=
 =?utf-8?B?cDRWRkxNTEdaQlg1VVZzTGZidXdhOVZ3aWlwaU9pTkVlb2EzYUdmQ01aYXk4?=
 =?utf-8?B?RmZlbFo2VmwyL0V3T0Q1ZHkxMk9YUWZTcUlIQmxTS2ZqZ3VWbWpDbm5kNWtB?=
 =?utf-8?B?OVhvc3I3RHBTbFQ1TXVyVUtuOEZrZURKSVBmQ1Y5U251aHlIaTdUbVJmbWpP?=
 =?utf-8?B?ZXkwRW5aWHZ3TFZLWmU3a0xmKzVtU3I4eVRUNjFhU2p5ZCtwd21xTjdlZjZs?=
 =?utf-8?B?T1RMMzJpZkJQOWViWmtmZmxXMTBSZlI0bGEreHpqVVNpTElKaVFrNWRkNGV3?=
 =?utf-8?B?S2hmZzJvZk5ZQUVUQ0x1Ry9VTXR5RUNjYnJoaFpsbUQreFhRK0hzRVhQZU9L?=
 =?utf-8?B?dkVNWjlqUSs5QzZPakVUdGZrSkJqcmFIMkFmWE9sVm1xcmgvNWgxYTF1NVpl?=
 =?utf-8?B?L0ovbUZrWFkzTjA1Wm1sWmt1WWJ1UkdoUkxPN09UZDdNMHJwb0h1ckNoSlR3?=
 =?utf-8?B?azIrdlhtcitacCtyMXg3c3VpaFBXVGkwcU1hVW93WmhSc2VVeklrZjF1UGtP?=
 =?utf-8?B?WFNKRmttamF2ekdXcDhnK1VaWFNWYm5teklqbUZLb21nTVFhWmJPMUsxaUdo?=
 =?utf-8?B?R3hpbXY4WExjU0Nrd2ExNHVLTXkzV1hwOWVCTUhSZkJnN0toWm84UXV5bGdu?=
 =?utf-8?B?c0FYU1Y0eEs3bjBBVk9TVWwyYWt6WmtEMVo5a1RjdnpNeGhsTSs4TlNxRVhL?=
 =?utf-8?B?S3l1L0JSb2R4aFdaR3NXenFRYkN0TktkZTFzdDZaZm94dThYdDgzWWd3WHpv?=
 =?utf-8?B?OVZHMVZDUGNQNGprSSs4aFd0b2Ztd010VlFoUDdMZ2RjMGpjZ0lOaStMemVO?=
 =?utf-8?B?bWFhS0xWcWhzRDZFbDJJaEhxVUpjQVZ2UExsR2FHcU9GR1FwSjNiYlVRek5M?=
 =?utf-8?B?ZDFsUXlrTi9LZVFOTEt1VXFIM0FuNnVKR1RSSHlLcWZxeG9CNHBSVlpySlk4?=
 =?utf-8?B?OTBudWZjckdGc2taWGwzZUNRZDBaVHBUdUFYQ3dLUy9xTXBZODNUSzFBckh6?=
 =?utf-8?Q?bHnhs/gAb/sFKPy7n5kGBiovP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20856d65-b7a6-4f90-ce2f-08dc5ac7724a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 08:06:24.3387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4vTGiPeHDEPakEHoJQu0fDHjtNaLr7GWwWcwzrw72FCMqSZq+/VruPMH2D/O5/ys0LwsFNE44fMYf8DxxEkDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
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

Hi Matt,

On 4/12/2024 1:44 AM, Matt Roper wrote:
> On Wed, Apr 10, 2024 at 07:03:08PM +0200, Nirmoy Das wrote:
>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>
>> Given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this provide
>> a way to set device atomics when UMD is certain to use the buffer only
>> for device atomics.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   include/uapi/drm/xe_drm.h        |  9 +++++----
>>   3 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8f3474c5f480..530b4bbc186c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>   #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>>   #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>>   #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>>   
>>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   				    struct xe_bo *bo,
>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
> Is this a copy-paste mistake?  I expected this to be
> VMA_CREATE_FLAG_DEVICE_ATOMICS, not VMA_CREATE_FLAG_IS_NULL.
Yes, it is. Fixed it locally now.
>
>>   
>>   	xe_assert(vm->xe, start < end);
>>   	xe_assert(vm->xe, end < vm->size);
>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		xe_bo_assert_held(bo);
>>   
>>   		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>> -		    !IS_DGFX(vm->xe))
>> +		    !IS_DGFX(vm->xe) || enable_atomics)
> Is this the intended logic?  This will still turn on AE=1
> unconditionally on Xe2 platforms (regardless of the flags, placement,
> etc.).  I thought it would be something more like
>
>          if (xe_bo_is_vram(bo) || !IS_DGFX(vm_xe) ||
>              (GRAPHICS_VER(vm->xe) >= 20 && enable_atomics))
>
> so that AE=1 only gets applied to discrete smem in cases where we're on
> an Xe2 or later platform _and_ userspace used the flag to tell us that
> device-scope atomics are sufficient for its needs.

I realized it yesterday while adding platform flags as suggested by Matt 
B. I have next version which

makes it cleaner.


Thanks,

Nirmoy

>
>
> Matt
>
>>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>   
>>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	       operation, (ULL)addr, (ULL)range,
>>   	       (ULL)bo_offset_or_userptr);
>>   
>> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +	    (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>> +		drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is not supported for this platform");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +	    !xe_bo_has_single_placement(bo))
>> +		drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be only set if the BO has single placement");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>   	switch (operation) {
>>   	case DRM_XE_VM_BIND_OP_MAP:
>>   	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>   			op->map.pat_index = pat_index;
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			op->prefetch.region = prefetch_region;
>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				VMA_CREATE_FLAG_IS_NULL : 0;
>>   			flags |= op->map.dumpable ?
>>   				VMA_CREATE_FLAG_DUMPABLE : 0;
>> +			flags |= op->map.enable_device_atomics ?
>> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>   				      flags);
>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   				vma = new_vma(vm, op->base.remap.prev,
>>   					      old->pat_index, flags);
>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>> +
>>   
>>   				vma = new_vma(vm, op->base.remap.next,
>>   					      old->pat_index, flags);
>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>   	 DRM_XE_VM_BIND_FLAG_NULL | \
>> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index badf3945083d..7b9c68909c78 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>   	bool dumpable;
>>   	/** @pat_index: The pat index to use for this operation. */
>>   	u16 pat_index;
>> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
>> +	bool enable_device_atomics;
>>   };
>>   
>>   /** struct xe_vma_op_remap - VMA remap operation */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 1446c3bae515..bffe8b1c040c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>   	/** @op: Bind operation to perform */
>>   	__u32 op;
>>   
>> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
>> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
>>   	/** @flags: Bind flags */
>>   	__u32 flags;
>>   
>> -- 
>> 2.42.0
>>
