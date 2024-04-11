Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD32BC001CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 13:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA98510E723;
	Thu, 11 Apr 2024 13:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5aB5uw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D248A10E723
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712842298; x=1744378298;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H1jcWBsebSEoL0MkxLBqKSiX+6NJBTGWqYG2zQTm3p4=;
 b=F5aB5uw5H+FIGXGam9EtYwY6vMQPgM45+6TTv5aNk+NITiYwUpxGhLGr
 vxj0Ws7QtgsqbCdaivfkKL7ariSqKhK6J+7AMl+HWtC5MbSO62rxvmSQu
 Wbt2N9HiaCTaG3XXgq64VYUQnwkJMq2Ocmql1GhpXSW7pSYCCzPK0zNIU
 Ex4cajpYuOaGinOJ/3iR470Lw6506O/IKM9m8uMhpg3qmXE4PpDGzjyXW
 wJwwKUmMdBU7B0Oz3qCzVibNSMgnvVqNF1qMZUXBaE4XyNMtrQe8fo3iG
 rCPpwgkmH1LiFqzxLUgD1csV38O7NsT6ba7gj81RuDXMagv6ajn8Wc2+X w==;
X-CSE-ConnectionGUID: LJlBxti9TkO33keYECLhHw==
X-CSE-MsgGUID: bmBppi6wQCKzrea0s8khSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8105547"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8105547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:31:37 -0700
X-CSE-ConnectionGUID: ffoxeFSmRhCJtWud3GwEGw==
X-CSE-MsgGUID: 5FK6FMVlRDmo9GtdZ9peYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20804910"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 06:31:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:31:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:31:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 06:31:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 06:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhIBPA8oSplT2+dHyLdwKLI4ckz98OU9UDNKMw012sk748HUgsRGQkJlNiiVNF2Uj2u/7lcV80OlfNvyl7eZIRxGq5ef3wPAEW/2rE1PTsVIQBcyl5+IazvVZ/y9uMGGLsDpS1eagJQpmElB3NaLYCbWM4GTyaMsShlk24yeWLDLQ/YjXBSj5sddF9ex//iodgsi5TD9rqc3+buwgZamnaB0IhR2zlv1nJmZX1hzv+GeH0FgIG1f0wffEH/RbNY0uzxpIJaqmqtk7/i7Y9NcGQKMVju6R57JE+VJAwqHFqwylRB47skxiY0EcEtF8ATnbsnDxQEast0YF0RmgtFz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcrCYWkmGYuE2CWQc4JfhBrCRIHsVSnnAW0Aiwdut8s=;
 b=Wb/BZ1ztLSuC/9PUjEsc+E9t8orrVSotMIrGRoCeJwYCEWRy+U7gKkaq3cyJsB9AllbsoNXai5SfyxgIbLC4lHsn3Z0n5/soe8yNVP8+Z9OgT8Ez+b1zwDskCDfWumq1o5dO9L33kaBCRVLsDK5FCNzMB6qq+CZ4Im5wQCKy4Igbrsc4LPR+vY/Nm9b73zJwbz3A0q3ZsyjJo9Gtzg6sAg/6s7bbSZNI9FpQqqwiBk8E8+jFdmw8HjdcTkbWhe0hcojL81IiB45khyttUkjzJ9mIUfjjRBlAF1+q7R9Z130QcZY8/9/Q3DgVsuOGkbyQgV2mX70bIap7CcAmOpgd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) by
 DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Thu, 11 Apr 2024 13:31:33 +0000
Received: from DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409]) by DS0PR11MB8136.namprd11.prod.outlook.com
 ([fe80::10e1:e64:7f71:5409%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 13:31:33 +0000
Message-ID: <a9ff9131-d071-4105-84f9-a1ce18357267@intel.com>
Date: Thu, 11 Apr 2024 16:32:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
In-Reply-To: <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To DS0PR11MB8136.namprd11.prod.outlook.com
 (2603:10b6:8:159::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8136:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: cbad684c-8d96-4c6a-430f-08dc5a2bb45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yo5xaCFaV0udosFefsTPEkX8WPBukLKyRd89kxWtEJ2ezYo2tQ9zPRCxrTAUCgM8uKdty3sXOze21YGhLgevPurSrwFrxqB2Dcgs+VS65w3VuIqaAWwSJIrK4+T4gYZVTj5By1fH4qH/kpiQ+4cxF6aDs7kmxrIt82EfUHgyBp1Aznd+irRY99UgrD3/0aeAQAVdyunf5pHe3LlKt84pnWlAjCmDK0SHF/tYoVUKzBQaIoWWeB416CPTvVESFW9gkGMKe8FLHQ3TLrp/IYquPcIHV469vG52UHn4nXhpFiOezudTqrmoxQOQpvQ41/BK68AR4nZkEVtNNhLk/+PxQRe6kR+XAsuKn5mxzn4+zbtKUF6Wn5/Eyew0CBt57MQwkY/JeEqrvu5DZlpx0xnp7voibTyxUY1dyKRLLan/YB5+iFFyj9Mqe1R66h7+J3JbDczKx8KLDd+n/Rdi8NYQjJ5LxlhMHC3RjFmdjBoMcqpi5HjMF5hlkN1uN5j2JzKY+j5rg7DbcK24WmsCGmzxKWrA/IE1nN9JlQi2eh2CVrUmJbwzvGUtf02gfz+K8RxY2zzN2tpDIX2aCU4gv/z1I0ncV67Sr/QWfwSuf6ZPju6B+STJ//Cq2AP1GCkf4yyi6vUDfVuyM3hVs/aKvzMDFjS6Sjg7ZvYyk64jJuSAJuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8136.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1JHUlVYZ3JPM21xLzRKMTlkeFlmcGh3MjNGazg0V3kwN2x6VHlyZjhqVVNN?=
 =?utf-8?B?ZGpkalJWT3FjMGdod1BiMnJoMEVPM2NkMG4xR1ZpcmNBQzVxWTdoQXFZaUpy?=
 =?utf-8?B?NkZ2NHFNRlNhdTNyVUtIZURiakVhdFZoRnJOL2FORHZCM1RxQkRBeFVzVGtr?=
 =?utf-8?B?U20raXdVeDRhekFsSkkwdzJrNlNNVSt5SzY4MTg4NS9TbWVab0xmRGtKV3Jq?=
 =?utf-8?B?UWU1ZDdGaDdCN2R5TjU2TlhDc3oyQzR2bnl6YVo5c3krczM0OHNtelBMYy9r?=
 =?utf-8?B?MTIwNi9uaTAzNDZNbDJNTlQzN0ZLQmtEK01CVzVwUmJBUUtXeDhlcTRsWGwv?=
 =?utf-8?B?WFZ1eG1MSzg4UnlacEpkT3NOWkZaeFh2L0NET1RjdFJ6blVLMThvMmU1Z2FS?=
 =?utf-8?B?RGFxMmJyelhTZkJWak4wQmtKSDdqdTdqQ24xbzNzSE12YVdtYWtiN3ZtRWpx?=
 =?utf-8?B?Qm9UcTdrcXBCeEpTK2taUCtsYThtS3NiMG9hNW4xSVVReFA3aWs3U0lwVmth?=
 =?utf-8?B?alJYU20zRUQwQ1A1MytzWnFKa3c2REkrRkVsWHg4Y0Q4a2kzZFRuVVNJK2lq?=
 =?utf-8?B?ZWloMHJjd2hMV3dweVgvc0l2b2w4dzEwYk9NQm5IVUwxUnlWcXNYZmhFc2sv?=
 =?utf-8?B?Z05SVXFXU2VRYk9WZTB4VHl6QzhSRm9OS1ZHOXZ6aXlhbUw3NjZEVW9BQ2Vl?=
 =?utf-8?B?MnNmZjluZTl5MzdIYXNoOS9rbW5NWC9oWWpBTTY3R3NIQUpvYWFHV0NNMGE2?=
 =?utf-8?B?T1B2Rmdjd2EwblFFSlIreE03WG9KM3lwUW9XekhvZ0xtLzhHME0xV2pHR0p5?=
 =?utf-8?B?MHR4ZUM5bkxZSEorTG5rTEZMeUVlZ0kzRjBTR2h1aXp5NFl4UFVJY3ZOYXhw?=
 =?utf-8?B?N3Z5dmZWUWxvZnNLcitvUkt6TXlMcFJlelFGUWJ2TGR5aHJjMHdWdjcvdWxX?=
 =?utf-8?B?WlRVdmVVNDNWdzJHWWkvL004SGVXWmdnOWdqZ1RUUTBvVE5vcFB3ZUY1ZHhX?=
 =?utf-8?B?Q0E5QnZTdGNTcUVlbWxwRXBkOFlPSUtLYjJ1b2ptaE1HcnZ5eFR4SmxNSEhN?=
 =?utf-8?B?bmg3clUwT09aMURIMVYrN1Z1allYbkFjMTZXSkcxZWs0WnhVbDRzYzFJQU5p?=
 =?utf-8?B?UitoNlN5aldKeGxUWU1rUXNtNXI1bS9QRnNXTFNZUDQzSkhPUHRORitBSG5N?=
 =?utf-8?B?UkFYemkyZGp2eExBUG1ucXRaMWtMdjJYQ1lqMGV2TXB6ZnB0YmRjaDAxT1JR?=
 =?utf-8?B?VGJWZUpIbllkL2c1Zm05dlBPdkdTWlpGa3Y1dnRaYWg0ZjJ5Q0JMcHBqaGVF?=
 =?utf-8?B?THM2dklkeDhhdUEya01URDhWcjYrVnFSZFVvUkxoV3A4aXVEMTVvVXhlU3VG?=
 =?utf-8?B?TmxJRU43Wldibk13VVBsL1krN1BHYU1Pb3g5VEFJN0pSdkd3TkhCOEFrakpN?=
 =?utf-8?B?OThNYVRaSnR3VzBPaFIvYmRmekJ6VWkwMFRkUWllWDlJRzVFck1heFEwWFZG?=
 =?utf-8?B?S29Wb2x4OGZEZTZPeVJDUjJhUUpPSnJmZlJ6aG9uMmxlQlpsS0FSRlNndFNk?=
 =?utf-8?B?UXZxdVZHSlNnNFRzSHZQZkxzdFR3U1RrdmlISDZnVHM4eUdtaW5UUDdzc05m?=
 =?utf-8?B?dGdmRHlIYWcvSHUwWHFqRTJQdnVMRk1pWllHSW9NZzdheEgwQTNNQjlFUUhW?=
 =?utf-8?B?YXVlbm41TmdhNGJqZWpVcmwvZTZLekszYStvNWFkQzRVUEEyTytDZ1pkUkQx?=
 =?utf-8?B?U2NjSjY0V1dqdHMyZGJoSWFTZlppZlRhSlBvQ2pzV0p3NWVWZFlHNmhZKzJy?=
 =?utf-8?B?WFJ6WDByaTBWc0F1TE9XKzh2MkhHMjdsSkN5ajJBOUNUMllTdndXMmp0VWNZ?=
 =?utf-8?B?eE5DS25QS3FmUUU1bkI3aDRkZExUdDUyM3NiK1N5b0tYNG8yRWVsdk9NNVo2?=
 =?utf-8?B?QmthVmRLTlVYcVhlMnFQZnBaR1lPU3dxWFFqQmxkbjJYVjhCR2x0SXhURFNl?=
 =?utf-8?B?dERwUGhXbEJZU3hUMW1VaDlpMWYzcHBPZis3UyszVnhTaUtiM3ZVaTZpaXNB?=
 =?utf-8?B?M2hjNitCUHZGakkyb1d1aUxXSEErZllCZXQ5WVRvb0prSktDRTRhd2RnS2Vl?=
 =?utf-8?B?ejkvZ2p1bm5KL1VDSzBRSDlZNXFjd0dTeklRU3laQXFQb0V4aUNpV0dnUEY2?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbad684c-8d96-4c6a-430f-08dc5a2bb45a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:31:33.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIsxyIjw5GLVlIDaum+pqXP7VYHV7MjiZNlCiywswUmBYGcQkzV7jZzd/JmavcrKBgJTvCDXhwuhT+GM51Mxy8T4jNH7DVw5shKO7GeVlu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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

On 11/04/2024 16:14, Lionel Landwerlin wrote:
> On 10/04/2024 20:03, Nirmoy Das wrote:
>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>
>> Given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this 
>> provide
>> a way to set device atomics when UMD is certain to use the buffer only
>> for device atomics.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   include/uapi/drm/xe_drm.h        |  9 +++++----
>>   3 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8f3474c5f480..530b4bbc186c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>   #define VMA_CREATE_FLAG_READ_ONLY    BIT(0)
>>   #define VMA_CREATE_FLAG_IS_NULL        BIT(1)
>>   #define VMA_CREATE_FLAG_DUMPABLE    BIT(2)
>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS    BIT(3)
>>     static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>                       struct xe_bo *bo,
>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>> *vm,
>>       bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>       bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>       bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>> +    bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
>>         xe_assert(vm->xe, start < end);
>>       xe_assert(vm->xe, end < vm->size);
>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>> *vm,
>>           xe_bo_assert_held(bo);
>>             if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>> -            !IS_DGFX(vm->xe))
>> +            !IS_DGFX(vm->xe) || enable_atomics)
>>               vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>             vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>> struct xe_bo *bo,
>>              operation, (ULL)addr, (ULL)range,
>>              (ULL)bo_offset_or_userptr);
>>   +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +        (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>> +        drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is 
>> not supported for this platform");
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +        !xe_bo_has_single_placement(bo))
>> +        drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS 
>> can be only set if the BO has single placement");
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>>       switch (operation) {
>>       case DRM_XE_VM_BIND_OP_MAP:
>>       case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>> struct xe_bo *bo,
>>           if (__op->op == DRM_GPUVA_OP_MAP) {
>>               op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>               op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> +            op->map.enable_device_atomics = flags & 
>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>               op->map.pat_index = pat_index;
>>           } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>               op->prefetch.region = prefetch_region;
>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm 
>> *vm, struct xe_exec_queue *q,
>>                   VMA_CREATE_FLAG_IS_NULL : 0;
>>               flags |= op->map.dumpable ?
>>                   VMA_CREATE_FLAG_DUMPABLE : 0;
>> +            flags |= op->map.enable_device_atomics ?
>> +                VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>                 vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>                         flags);
>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm 
>> *vm, struct xe_exec_queue *q,
>>                   flags |= op->base.remap.unmap->va->flags &
>>                       XE_VMA_DUMPABLE ?
>>                       VMA_CREATE_FLAG_DUMPABLE : 0;
>> +                flags |= op->base.remap.unmap->va->flags ?
>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>                     vma = new_vma(vm, op->base.remap.prev,
>>                             old->pat_index, flags);
>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm 
>> *vm, struct xe_exec_queue *q,
>>                   flags |= op->base.remap.unmap->va->flags &
>>                       XE_VMA_DUMPABLE ?
>>                       VMA_CREATE_FLAG_DUMPABLE : 0;
>> +                flags |= op->base.remap.unmap->va->flags ?
>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>> +
>>                     vma = new_vma(vm, op->base.remap.next,
>>                             old->pat_index, flags);
>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct 
>> xe_vm *vm,
>>       (DRM_XE_VM_BIND_FLAG_READONLY | \
>>        DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>        DRM_XE_VM_BIND_FLAG_NULL | \
>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>> +     DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>   diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index badf3945083d..7b9c68909c78 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>       bool dumpable;
>>       /** @pat_index: The pat index to use for this operation. */
>>       u16 pat_index;
>> +    /** @enable_device_atomics: Whether the VMA will allow device 
>> atomics */
>> +    bool enable_device_atomics;
>>   };
>>     /** struct xe_vma_op_remap - VMA remap operation */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 1446c3bae515..bffe8b1c040c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>       /** @op: Bind operation to perform */
>>       __u32 op;
>>   -#define DRM_XE_VM_BIND_FLAG_READONLY    (1 << 0)
>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>> -#define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_READONLY        (1 << 0)
>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE        (1 << 1)
>> +#define DRM_XE_VM_BIND_FLAG_NULL        (1 << 2)
>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE        (1 << 3)
>
>
> We should probably document that it's an error to add this flag if the 
> BO has a single memory region.
>
> Are we supposed to the ability to set that flag or is there going to 
> be a query?

typo : Are we supposed to detect the ability to set that flag or is 
there going to be a query?

>
> A query might make sense since it's going to be rejected for some 
> platform.
>
>
> -Lionel
>
>
>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS    (1 << 4)
>>       /** @flags: Bind flags */
>>       __u32 flags;
>
>

