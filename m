Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BFC00A94
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9DE10F6DF;
	Fri, 12 Apr 2024 15:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4AF6bOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917B210F6DF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712935364; x=1744471364;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2huXRCidIU4PllKIxfzfj3IaMKaf5B41PQnn5A1GaiU=;
 b=M4AF6bOTMHqdwN4driiH32Vvm4lVL7P8mL07Pk/VrkMxFyD/2OPYHyn9
 PRDe9C/LTcYYK26I7zX/KpY2jzRqNno8ODHnKBN1drzmGK3QV4HhubrAF
 gI4jjwrMGMmCNo9LHVYlqO3IAoNw1u5jC/BWaFf5bPNiG90fZ02DMroDO
 zxq1ZfwIcILoH3nV0GbObN3VA+pfi8VC3OHuRG5IZsvQ+hM1GPSf02vTI
 TWn4aFgmwA0860Xdql2G/9baEILWXzFr8gY1iLuxlkCM8siWaDO2Fq/yp
 Kdv9/WxFJZzkQblbIPrTw2YYYwN7ewDIm+qkO0f7bg9YiHzjjkasN863v Q==;
X-CSE-ConnectionGUID: BJp1vlItTXK+uOvkO1vB6A==
X-CSE-MsgGUID: fgRI60U1RaqHi18wjrM/0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="18952669"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="18952669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:22:40 -0700
X-CSE-ConnectionGUID: HGndaTGCRv+Qg9KVEESbDA==
X-CSE-MsgGUID: KuKjFHF+R2i67bVKXGbxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="52412016"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:22:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:22:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:22:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:22:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuUVfRz3fr6qe5WbdiP8tvE29hhrapozApy0steBK6XiqqfB7+epiu5MDzYndpJ9lRhXy3Sg8Z0BXkurwc42TALATASSy/Ssg17R6WW9ye1GISGWBMX1cSR5xXwVfZ0WaPcvZb0Ls6JtxSsrIu3OcZ4mu7fTxGIx/sRkf8P7qEasgWl/D5K0wsCl5BEKuVzOFCiZNZn59vF8uWiB3RfYVZ8OarA3sr4wVg3QxhT4KtEjoViQZCoYVKZxy8L/mJUB9mYfio+TXh1cOtyunD3TSSu2JLPO0V8r4dazS8BxSwzLjnQXAHMcfDX6bMz655dLpuc7nqwdS1Nti7yh3kNI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnLz+0CyW4gJ/PIxpwzyL9zuGz3w7YyaMPu6VSctA+o=;
 b=FiTvci7Jn6L+IkNRH7iV++HClISYolcCpv6BmUqO8j8g2VyLQDkmK2kmsIh5WsfBSpz8wjXkrSsFasv8N3ouIW3onR/rQ1QIwY0V8hGIZNBoFifD4tszYbXHVB7y1vK0srSmJwuNIJObMgRk//T+5Ujtv1N6s0K1R0K5wxZuHnPA236044gjPxF6XTErviWJOIdMTjVjkOa75h2rTsM+RMwJnTad1X6zzOLEE1oadcWPuRN7O8vmuiqDUgNsGBH0qIRRO/ZD73E6+iRuoiE9aruKhzk0GCsRzclSq1fx15E6C+URHsMpjf7KrSJ6j4JuKYgafGwPP4MklDOTQ3dPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.26; Fri, 12 Apr 2024 15:22:37 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 15:22:36 +0000
Message-ID: <226bbca6-35ac-452f-a86d-badff5bd56ca@intel.com>
Date: Fri, 12 Apr 2024 17:22:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/xe: Introduce has_device_atomics_on_smem
 device info
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
 <20240412092249.3636-6-nirmoy.das@intel.com>
 <2fc9b73615bb9fb5115773fcc6e4fc9243a6d234.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <2fc9b73615bb9fb5115773fcc6e4fc9243a6d234.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0030.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c1d731-c08f-4f22-d373-08dc5b046245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGmgeG1hjEtGKFfBbm+wlKro+0Pab10STns9/sd0Ws/S3oJ3bgX/CYr7F4ETgZ+lFbSW87MKNx9gR5PKXsLC+AKfSTifYGcaTYALr+DhTQwpoMN1o+mksAOv9KGKtwyXo2c5urAuDhIeLx8Hb/NfR1Nit5XsCBTFiLwMahoERZ+DsubJx4eKAXTgJEsXE9Sl3HrYRsCJJz4wPqigozTTsFKBtNHiDEPF2BMLfovbeCS7jl/SlsEj2SXdtaNUnMwX72lF9CpV4bw+KrYtx8zkCrJleUyqK6mBosQ67Ilq7MZ4XzOHbp/wYopkDR55VC23eQZkB6RNAEJCwMYF33xXa68nXJZljE2AmS9idcGmLgEca/LGLnEZJ6P+qOTEOElPRSpxxK9Wi4/f65rVTSn8rZtFJXWuCZVQ5E3zHTWedik4asxF3kMUGWP/HlY6hBF2cP57bK1Av8w8KSPbKaL4FJxf77DxXUv8ECqq/4QdP6GvNfbjK3AfcQzIzAOxLX7GA7UOHSSlm8fBkRdJK+CdrT2PWJawhq8Xl+j+cfVj+9wsv7mqv+BGIY+Ild5lC68xWzt8OKpYCRUKJmXA68T89xXFwc2e9vqXvWyU4ZmeYS443Ced3znBPBpl2kq/+e6bN0ONNpf5vRtcdj1sn7LjW0rizl0b0w9UP446dOUoy5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZtZ01kSHNqczg4b1V4WHI1bUoxQ2pDdC93R1VPM3BrSHZaZjZueE1KdzJN?=
 =?utf-8?B?WWhjbnhoQVlrV2wrMzFub1Q5K2w3N0JYMFZMeWNyUWs2SDhWeHR4YSszK0hr?=
 =?utf-8?B?eDgwYkhzSjVzUTJHZEY2RnpqZ0h3TS9CWmx0eVJLRGhpQnhTZzZZYVVyd3RZ?=
 =?utf-8?B?amxZN2pYZFc2a3NBanBWS1ZUUUtLYmJXNXdPUDUySDh5dDNOZEFldGhBMmwr?=
 =?utf-8?B?ek4wbGJsSXp0OUFUTDNIWW9UOCtxY0htNjRCTmZkdk4wd2ZEMWNKV0NQbnVO?=
 =?utf-8?B?c0NGU0xpOWQ2U3JNdzM0a1d5YzIvT2g0OTMvL0JYY3VqN2dqbnkwcWF3Qnla?=
 =?utf-8?B?ZG1OanZMNHdTZEVFMnpUNjM3bEpuSGFlMGxOM2ZhcXVzZFFjc1l4WVBKSWFh?=
 =?utf-8?B?K0Jicm9pdXN1NFA5cldIeUVPakYwelZKTE96cytqY1ltcE8vb2dJeUxsSFQ3?=
 =?utf-8?B?bzlGOSs1bFl5RlVvYnNOOGJsbGpzUEVVak5XS29GOWFoTWhneWhuS3RwcHA5?=
 =?utf-8?B?V3ZOU3hVM2NyVnV1REVOM3NmckRYbGI0U1lyaGtmbHRGWENqZGdsc21pQVNC?=
 =?utf-8?B?U3FOSFU2VWdFUUNMSTFtV3hKcGs1eXFjYmZTRjhJN1NvVDVRTGc0ZjFnV3R1?=
 =?utf-8?B?a1N6VnI3TEdjV1hCbnYzYSsrRGV5VEV6WVZqMEdST0lpMmdTaDlhcit4TGFs?=
 =?utf-8?B?dHZKajRXU0RlNG9KNlBucU9VTzl2U3BnMGNIblh3b3FSYVVwNjJtMjFnR2pr?=
 =?utf-8?B?anBsME9Sc3RvNHdMZERxWlNxQUxQMmdkUGNpWkNJaVlhQ2RvaVpJN3J3N2pp?=
 =?utf-8?B?dHlUZWlxaHZBUUdXRUxtZ3VGZ3B6K2U3VVFnanhMYW1ESnRoRzNXdUFldDUv?=
 =?utf-8?B?Mk1JenVBTW4wRHY5alkrcWEydktqUkJOTEhiU21TYm9JcDBIaGc2L3EweVZk?=
 =?utf-8?B?eWtMaTk4UWUrVWR3WWlmallObEZBb0lpWUlOLzVHMk9nNGhxMHBsWks3anFG?=
 =?utf-8?B?N0tUdXpvUTJWZXpZZzk1YlQvRmZYR2w4U1lacjdDdGZBbCt4SFNPeUtDTXJh?=
 =?utf-8?B?b3BCZk1PQnAxMitEVVpFU1F3LzNkcHlOb3pPZk8zOHg4L1kvcmNIbTZrSXNF?=
 =?utf-8?B?WFBCOC9nZTBzVjcrK0gyZWQ3aHJrOWxaSk5YdDIxOGQxTTduYjZmcmFhczla?=
 =?utf-8?B?b0xmRk4zdHZUSG80elA1RnFMKzZHcFp6M08wRU1TVzBPODkyczltSkFNN2V4?=
 =?utf-8?B?aWJPVUFVMW82Yy9rQ2lXWkQxeXk1aFgrbjNvelFVVWlINFlNTTMvVkJHYnRG?=
 =?utf-8?B?cGs0TlpSQ1RUQjYwck9PejFzd2xXWlBxdE1qenlDa3AzTVFSd0RGa1RjRmFr?=
 =?utf-8?B?MUcybzlZMnkzanRKYmJqc2dITFZFdDFWM3U1WklhTUJTV01OcGxSUXE2ckFh?=
 =?utf-8?B?RjFLOGNkc3BxMmt5aWlkc2orQTF6bVYzRXhNVWcrRjZsZnpwb082VERUWXlY?=
 =?utf-8?B?Y3p2TVBGZXZPaTloY3hrcDdFUGtBdXZQMVdPV3hTd09HR3ZGQ0tyZ2FvdmJK?=
 =?utf-8?B?aFlMZEdhSVNYc2lOZlRZS2VZVzVZMm5DM1NTelJSbm1VKzVtY2trcnRqS2tV?=
 =?utf-8?B?MDU5VnZsMkJVZmhpMHdERTNHZ2lWdEdTMi96eEJEYzBDbTg2TFdzTTdOSlln?=
 =?utf-8?B?MTlkOWpPc2hjdlZJczIzK1MyQTZ4eEU4dHRSTEdFYWhORHZya2wzMnJwV1Z0?=
 =?utf-8?B?SmwzbXlzcHV2dVdvT3gyUDQybU02OVdqTW1nelZOM1RxRnJwUVpQRHhWK3lY?=
 =?utf-8?B?SFhJZEtqT3ZRK0VqNjZFL3lnRUEyMU8wanJPbkhybkVKRFM1V3dhR0RYNElm?=
 =?utf-8?B?OWF0WVk4aitrZ2Q3WFlFcDI4SlpEZGVTQk14ZklPNUN5a3BXemVLVzU2Nnc4?=
 =?utf-8?B?VitoN3kvanhqenZtQVNpOExla0pFVk9lbnBHSVk0cUMrb0tPUjRhdHlWRkdP?=
 =?utf-8?B?VC9obGNPc2ROTmtQSXBHekVaSzJRYm5jSklrak5IZ3hEbHoxTlpsL1o2eEdO?=
 =?utf-8?B?UTVVVHpDbG83bFNEZGhJNit3ZWUveFJCdldOZWhTUld0UUFmSEJRM1FxZE1q?=
 =?utf-8?Q?PSnWXtA/TPSgdLJes8/8Inr+6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c1d731-c08f-4f22-d373-08dc5b046245
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:22:36.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXHFVLx7s6P35Ru3+gOw2eJkatUYR4CfOa2GGkekFUlJFhmxkt3TKVMTsOIF3X4XX9PHd6YFoXPWAwgUyQsRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

Hi Jose,

On 4/12/2024 3:31 PM, Souza, Jose wrote:
> On Fri, 2024-04-12 at 11:22 +0200, Nirmoy Das wrote:
>> Add has_device_atomics_on_smem to specify that a device
>> supports device atomics on system memory. Currently XE2
>> supports this so set this for XE2.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>>   drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>>   3 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index bde42fe288ff..c06be1e00f1a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -283,6 +283,8 @@ struct xe_device {
>>   		u8 skip_guc_pc:1;
>>   		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
>>   		u8 has_atomic_enable_pte_bit:1;
>> +		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>> +		u8 has_device_atomics_on_smem:1;
>>   
> This one can be easily replaced by a simple gfx_ip >= 20.
>
> In my opinion it should only be added to xe_graphics_desc when feature check is more complex,
Did occur to me but I haven't seen any existing example so picked a safe 
option. I will add platform check in

xe_info_init() if no one objects.

Thanks,
Nirmoy

>   like the has_atomic_enable_pte_bit.
> Otherwise it will get complex and error prone to add new platforms.
>
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>   		struct {
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 9cf45559b915..4e4699962337 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -165,6 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>>   	.dma_mask_size = 46, \
>>   	.has_asid = 1, \
>>   	.has_atomic_enable_pte_bit = 1, \
>> +	.has_device_atomics_on_smem = 1, \
>>   	.has_flat_ccs = 1, \
>>   	.has_range_tlb_invalidation = 1, \
>>   	.has_usm = 1, \
>> @@ -630,6 +631,7 @@ static int xe_info_init(struct xe_device *xe,
>>   	xe->info.vm_max_level = graphics_desc->vm_max_level;
>>   	xe->info.has_asid = graphics_desc->has_asid;
>>   	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>> +	xe->info.has_device_atomics_on_smem = graphics_desc->has_device_atomics_on_smem;
>>   	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>>   	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>>   	xe->info.has_usm = graphics_desc->has_usm;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index e1f2b4879fc2..d403814a7a84 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -26,6 +26,7 @@ struct xe_graphics_desc {
>>   
>>   	u8 has_asid:1;
>>   	u8 has_atomic_enable_pte_bit:1;
>> +	u8 has_device_atomics_on_smem:1;
>>   	u8 has_flat_ccs:1;
>>   	u8 has_range_tlb_invalidation:1;
>>   	u8 has_usm:1;
