Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B739EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 13:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C8E10F0C2;
	Thu, 11 Apr 2024 13:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHiu9SIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0024C10F0FB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712842934; x=1744378934;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=njS8TS+jXuy5nbhrl6HiaOt/IIckL/mmklD5xK9t6+c=;
 b=YHiu9SIfEkpJqjxKZMxowaX/FXapmUN6QMCzE1AkFN6w50oZn/TRW+I/
 jmriqVrbn3zqKo3sc1rFMawS7lqXTGGGLA/ICI/oMwbdo1IVgWIkzWDKS
 j3OnQzr4WReM0HhZaP91r+POT59+qnq/Hf/DWaGeuRrjYgGHIwdH0XyKl
 n5aRY8RLdP+DWE3Pa6nbIFpwetkMNXfAnymVjBTW5XXx/FPqf7s1Q4R8b
 44TwPeq7dpR6RvrykqvBSukthQmMsu0IseFF86xpv4bIhaq4BwO2d60Im
 1tSo5xPsnm7KNA99M07FHee7hCCPX23kZxmWkwqwrjDV2yRzntIPcNyvQ g==;
X-CSE-ConnectionGUID: FE+RaG9QShqmtkSQsMKGsw==
X-CSE-MsgGUID: JnvGQCjxSkWtt1KIbWPZng==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8380920"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8380920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:42:14 -0700
X-CSE-ConnectionGUID: 8/eEc/kXRPGJMP64gxo1cQ==
X-CSE-MsgGUID: 1fOrZoLQRg+CO1QsAjungg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21406289"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 06:42:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:42:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:42:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 06:42:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 06:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8Aq1eetaKkMh6X37w+Mf2gK2m6/A9eQSV/r03IfkzpcBGrhArzStAiE0YDqVg5N0r343vxiXNseOsqntGu4Xw2w9VEgMXJ0Aj9+lbaV7MTWDvjTAP2Dbck8ieUO4D7hwl4cF+Xh5z7ZnS+9+bQhaZmJ/dhfI5K5kDoYewALk5UeFUvGS0546O68r7bR2Bda7IJxquVQQbGsdbT+aZUHF2MVoGSPa9BKTKQT2pp+miFdWz/0JyCTK4grGkIRm6odhZBeO3fnpC0hetmFQ/1nzcviwcSRVfbKRyw1dKQjaXHF7Ck6Z3xbK5dSoXURbyEp+GPUDppOy/yYSMPTGc05PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJzWiabL4UJkOcpICMiGj+zwZMk5Q1wPZhmOvwN0TP0=;
 b=c0irU8ZAvwKZVf3OhuRpozdCocZaNpt52ysNRfGAj3RdGgcphkd+rD/Ch+A7aNHP5s7PGRIraK0O+VBUwn1VrzQq8E2CvhNIpVmWU9Hzjk7dZz6aUbU8MdvJSDl/V7Dji59RQLGFzo88VSsrJeOl2YFFogyL9jfa54rBRzDfl9t3CKF86zNiBFll7HtAc2EVz7HA6DNYQDEyZs369sdwjexXHt++MnQGUoNi02aD69bSeobyWhf0TmpQ6ziwiJ0dKKedhlQ33hoaDq6xF3nbkwX+SmnMlaFApqR/ABsWHUDyz3NmpKxtuXeQkgIhOVTqlQsUJaAWsrIbmmChaH0vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.25; Thu, 11 Apr 2024 13:42:05 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 13:42:04 +0000
Message-ID: <7addaf63-6945-434f-8f9f-8341e0fafa26@intel.com>
Date: Thu, 11 Apr 2024 15:42:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0041.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4f5441-d8b5-4f75-ba6e-08dc5a2d2c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVWzAu5s9g8I0/dPWC0XmhvP+v4TkXXjzCtN7J650Z56vSeXj1CM3XxOiZg4EDHX1tjs0dTvptS+IxUVfS8Qe0BJsHjh8S0kabh9o7CpSt31lu5MnaVl6u98sCMAlcex0h81r1xegI2DJOMP4i9ek7byNXk7325y/lYqkpS2byV62s1vIs8oH9GFgOMBL7xnvKL4eChpkdxvmoSVIbYo1kgYh8FjTo/m9W7JsihgZoIsqakC4xI5olhm+NOqHi0JUKJmJ4ghBuKgIS9sjImLopselleIZOgV41wyhY682XCju3JluXKZVkNE2U28esNCAD3FPU7xWxdwvdLxBU0WnXkIWSAOkKrDGFuhZzXwgYkCoFGTEdRZL/eqNW5ZqYKrM3GKAa00D3TvDhHeywGjGtkwojwq3VQHhVxADZdzJ7TrMBSqNSPcA9o7e7sxsr4V0qdInc/ctNZpuK6AuxvI2ksI817ZrZfvvggT31k6QK7RwHs6ncHjMNDJ+bpmz66G3D0ol/FuARbZKe+E3L4whCgsiGGWP8ELmu1MpwuRBEiUJ8oUlEDUU/cfAImTm/Oqh+RchmFZsTtcDuZy6u3i48VBhz0cAKU/Wuo+kkb/Xqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1hwb0pNa1BmSW4vNnU4c0I4N0xJNEFzZ2JhRFdHMHpsMkxCRXFwWEJIa2lp?=
 =?utf-8?B?eE85bEVyd3oyQzVyTUdZS0E0WlZuRk1nUjJxbU1rcmN2dm5UZUlPN1pBWG4v?=
 =?utf-8?B?TEZDYlhTK0dlYmZYU3hrdDVNbEs1d3ZQR3djSnhRMTNrcWluakR3NFVHNnZK?=
 =?utf-8?B?aW45ZkRkb3NTYUhHNDRNTFlPWmc4TlJGZXY1d2FBTnhmOEdtTEVpMS9RQkpy?=
 =?utf-8?B?dDY2QWlYaDErK29DbGZhbXZQQ3VmVFZYcU01eHlqUmZKUmpPc3dXUThuSGxO?=
 =?utf-8?B?VmMxdWNrQWkrZm5vWkZtQkJyRXlMV1M3VVVFalZhSkxjaThuSCtnamU2YjBx?=
 =?utf-8?B?bitDNzNTR1dsaG5lNmdXRlN0ZS9UaVFJWXBUR2Fhdy9GYWJqcEsrdGp0NmN0?=
 =?utf-8?B?SUlUUlNRR0pCNWY3Zm5Cc0tQRGF4S0grZThsZTNJMHllZEdOY3l3eHdvMW8v?=
 =?utf-8?B?bVJwQUpUMG1jTi85WjVTdVo3V1o4bDd4ajBza2QxWUZYTFlQOXZIb2sxQWVx?=
 =?utf-8?B?VWZJYWNMUEFqNi9LQjRJQVI4bEJRNGkyVXRUNU9zMTZhTTV3VFc5Q3NSVWZY?=
 =?utf-8?B?MWE4K0pDMnc0Sm5PQm1TeUN5MXV2cmU3OXFvY3lCbi9PUnpkK1p2UzNZMnlL?=
 =?utf-8?B?NUNFUXVsQzhmS1ZjTUR3NGhaNjhnRUFPeS9hdmY1UFNaZ0Q0ZFI0T2JqOTZo?=
 =?utf-8?B?M3ROSDY3TVk1dzgwdG14VlAxMDFuc1VDYjNvVUhnem5YeklacHVOclJLOUNI?=
 =?utf-8?B?Q21kNXYxdTlqa0JoTks4QVBrYzFUOXE4NHFoM1hCNXZScnBkcGF1OFRUOFBh?=
 =?utf-8?B?K1JaT1NXMlFab0M2TEZjTm1KNENzc2sxSG5sNjNIMEFiNzJUdGxWeDNNM1dy?=
 =?utf-8?B?Wm5URmV6TUJ0c21wdlcxOGtGU1FkTVRyTEt5VERuU0JLbUkyTXpkRUwwZVRO?=
 =?utf-8?B?UlB4L3p6YUhxWDRIV0UxNHhMZFFNaE0yZGxDdkZQU0d2TnNGU3hkcERadTdN?=
 =?utf-8?B?RnFOdjQxZ0E0TS91aWxtWlVWK1pXbGlWQXg3TkNiWXpQaHFnVktOc2VnTUVs?=
 =?utf-8?B?Ry84VWtZODVieG9uNmc4cWNKWU95Y0tBVDd0ajJrL3UrcjJyajVoQ2lINDk1?=
 =?utf-8?B?M3ZtT0FHNWVIT2s3amMrWWlnVFRWQ3I4allBdmdnQ01JSE1IYlpPTmVObTV1?=
 =?utf-8?B?WVljVkFxWEJLcEdXOTU2WS9GbE5UbWZIUlRxR0NBRHFmbWN1YkIxK2NDanJr?=
 =?utf-8?B?OHJJT2NoVXUvSGc4K2QxZGxWR0FTRnV0dm13U1ZpYXhxK3pSNUxzTEl1SHBo?=
 =?utf-8?B?cWd2TUgza2FCS2dmWUdUblVpYXFFd1phYm9oUjZieHJsakRZWHhGamUxSDVh?=
 =?utf-8?B?d1dCZ1UzeGk5VVZOR29IcS8vNDcvOXpaUWxpTEVaVXFJd3RFNzNLVzUzTzlk?=
 =?utf-8?B?Q2IyZDUvT0dtV2hKZHp4Q20zYURZNlNuMzBYTzNPa2h3ZFRMMGl6QndMQUVW?=
 =?utf-8?B?ZFFZd2RnUTllNlR1a3JkNlFBeTBRd09CU0ZORkNpS1pxQjRUTHVOdEUvVEpw?=
 =?utf-8?B?MFdSVU5HemV3MkVUdmxsZU1mallEOSs2UnFxWkRQWExmMlYxOFgxNmtRQzlI?=
 =?utf-8?B?U0RmdlNqeDlGa2QwNisyS0V0a1dlZHNQbURmTkdIM1pOaWRIcUJwNmk1SmxZ?=
 =?utf-8?B?akdySkg2VzE4dUtvT3NJd003dWpPZHNlb1ZEMzlRUit0SjYwdUJMMXl0by8w?=
 =?utf-8?B?dXJnT0tWdlEwOVRpOGllZGZVc0hMUUp5V0tzcWlVdXgzVGF6OW9DbnFrR3VH?=
 =?utf-8?B?SzFwc0RVSkRXTUFPRllpZTN0M0FEekVvL2NOcHUvV05mb3czS1p1Tm1JSmlN?=
 =?utf-8?B?RUk3czJHaFFJSjVxdndzdGgvdXFGcHFBNEEvK2QyaFlqdlR0OUFPak5VWHhJ?=
 =?utf-8?B?NU9OWEhLQmJjTnpEY2RHVk1zbGFCbm40QWh3VGI1QkxONldXdndOQmgwSzVw?=
 =?utf-8?B?Y0xjY1hScVAzZUJSUUl5a1JSL0M1RXRmU0d5RERrWkpXM1dSdmZTTVVmTzVa?=
 =?utf-8?B?K3NscHdROVcyNVJxbHJ2Q1YzS09IUVNpQ0lpMVhNTmlSTEFyOGp4TmR5dlR5?=
 =?utf-8?Q?q6X6LjqkV0MZwRBH+TqzofaaP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4f5441-d8b5-4f75-ba6e-08dc5a2d2c79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:42:04.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dr5TzXpVjSgeum3BJfaSrB8LZZGY1tegsvLHi2171J6dT5gzq42BFPvHFjfOKev7AjnPnGrfEf7G5HXj1zPgCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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

Hi Lionel,

On 4/11/2024 3:14 PM, Lionel Landwerlin wrote:
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

It is an error if this flag is set on non single memory region as 
atomics on SMEM+LMEM  buffer will be handled with migration.

Let me know if I got that wrong.

>
> Are we supposed to the ability to set that flag or is there going to 
> be a query?
>
> A query might make sense since it's going to be rejected for some 
> platform.

Can we use the rejection as a query ? I am using it in a IGT test 
https://patchwork.freedesktop.org/patch/588759/?series=132289&rev=1


Regards,

Nirmoy

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
