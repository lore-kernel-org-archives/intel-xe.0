Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA1C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 10:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1610E4B6;
	Tue, 28 Nov 2023 10:40:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FDA10E4B6
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701168055; x=1732704055;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DmlwCDjwig9GT9FgwlU4P6X1e2tF5i+Rc9PIYszMARI=;
 b=hggIfg6gNxs4NAxa6KZkW9pg2nRMYFSCdAOIUEAUi+uAujnz+ofQagWB
 qk+Vh1LjchBAaZqK6IpDVJqnaf+EBwvE/LAhWQmzt9tWEhanTR6zzZ7zl
 gQ1J9lszeOPrLN/UaXtMoGyOOmtBoQoERFgO/3TNpXY/xVNV1BOT22gIk
 SuBsQiJQCFP2A7qwz84xI/RCUJuFmzFlBeCE3vMqBje4q3nEWKkAhDih1
 m5nBY5lKxVMqHafHHxAvu4juhQnm62gO57qGljnDuXNzjqVhfRD2vPtmI
 9k+176p5ErXMUEbOcN/OzsYslHBuRDBN6aywfkQO86Pmh8rDV9sgWBn1e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377923530"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="377923530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="16898990"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 02:40:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 02:40:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 02:40:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 02:40:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 02:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJFn1wjJUoM4c8e25RiH9lbxvpRyIIjVsCpBj+aNHx1RblPhRySjhlkjcKGI4wTuXQ2DZJmB3FfMHZGntiRb4lHNdFx3ry7FqjHcZtAB5OifouFby2Y26OSZMmUPFVCvUxVnQKhjcGCUM/kQEpcFDKewI+BtTCEs6sX7FkeRj4ZiSkqRWaflm4L+/7tG3K5oWwqQ/6LcMOuco53mROBbyI3eXiE+f84rLItAbTsl+JcL+J9UO++wU45tYUkKvh8c98iRZdTDfWMgWfaEyPhxHQLzY/sw0MK31aeM5IboJaX3LCbCrDLzY/X8YySsWL9xNwPpafIZTR1z6pGD3V5Tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP8yMh6odK6R50dJBHh6a1f8DWKck3xTWvd0rXiu4YY=;
 b=D8+QUtM7oadwsQ4x6bU0+kjxUTIneZ4h+aXunYXGCvHEdeizu/CNg5JamSBS6Rkz82zcQnaUMXip1f9XxFtkaN9TuRxZm7+bY0IV4ZRPo9iRxN2JNXYcRUMsLbIJ7FUL/t899yi8yoDYZ3flRvMzX10eBfYfHNbBlkibA87PLsPx1+1s14jSHxHPVHyYM8RZLMMete2lHesIKapx/tSfDPQhagh2FPLq/JXbxNODnCPlRCNbmGX2NFgnPDuxVCXSpERAVK79fMbYgypdYhJa1tGk2rfGx9pRY6LEwvgMJcLiz/bVmRiaNPJKKAjN+NKImi8OL+7mvVgPX2SyTzBByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Tue, 28 Nov 2023 10:40:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:40:37 +0000
Message-ID: <3c144033-8851-41c3-8d9a-2e330cd030dd@intel.com>
Date: Tue, 28 Nov 2023 16:10:29 +0530
User-Agent: Mozilla Thunderbird
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-6-riana.tauro@intel.com>
 <e953591a-2991-49fc-b104-68f4438cb6e9@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <e953591a-2991-49fc-b104-68f4438cb6e9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: de517beb-f2b8-4206-0730-08dbeffe750a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /o+7ZDVt0cIRRHnCx1f1yrLx+9wMrqnZJH1EwKFA2ltWU/6raRB+4WQGyINmBlwtr+9pC81HbZ3R52ACjiVpG8RBk/468l0WZlGkbWZD70SRy+AtCG5j71z4XR7qFrDiEYQiOMf2d+Ngm/AGer8nqxaw8PoShAcuPp+tkO1TNsTYopXfiDT/v4qFezxnBdqVDmNThUVVJy7cJqMtVHWAICH4vNzUsOEhd0oeHT62rmi/gB9JZ8qa4oT/tyFij+UW79HV/XfldDd6S6vJHp3JZrbv+3P5pyVwdBCA04TWKw3G506kjWD+2LVHYn2k9BL+IudKAXc4rPn7KSpdbKFdciDk2m3SqGy6NsBPQF1DA7fotdXF0nZAHyXDbfzs3ntJ8ySlSdFR2f6mN1CP+CrMyaTrTShV/WsfyuXfLOrwhQw5A1pdr2leVMhmuMEbKd+uAU4ym8EgAtODUk0g6kTXCEB/6Z2c+FbGA+4lE+0XkB6vQUXpRSVMyTdB4ncAmHkA8u5PEMJB7Rsl1cruvR3jZNfX1z0D6QP08QeSjtf1/+WwG8bWTJxdPYBemELSvSXvBS4jFS/TmVRXuKZR11ERFkowaFLqEIQl8lMGvu9fM5NO6T7Fardtwc2pP2qd3QLsChclwBJDpLgJJI//E6hEsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(2906002)(86362001)(478600001)(31696002)(6666004)(53546011)(26005)(6512007)(316002)(2616005)(66946007)(66556008)(66476007)(36756003)(8676002)(8936002)(6486002)(6506007)(38100700002)(82960400001)(83380400001)(44832011)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtrWVpKL0xlcU4xaUdHaUlBcXc1b2VXRUVTV3lzYjc5TmJiM3lIMS9iMjJ2?=
 =?utf-8?B?dmZXUzVjbWNTaGdUV2hwaHIwSWRjYlpBL3FqZndmdEJHUVBTSnZZV1FKQWVV?=
 =?utf-8?B?S1g5VWdJeHZDaW5ZQmd0WlZSMU0vL0FXa0E5M1BpaThCVEl5RURCeStHRlpU?=
 =?utf-8?B?QldzRkNzeS8rc0gySGNnRm1WRGhYcVc3UmlSSGFORE1ZT1UwWWNYSlI4TVJm?=
 =?utf-8?B?dGEvdGxPNy83Q2FkaEs3R3oyNVJOWkRQY1ZvTGZsWVFycHpmTXdldlluNGJK?=
 =?utf-8?B?eWNqQ3pxWTFqUHdJYzJMN3BTYTQ5THp0TVlFaTVpenlKUVNITkJKbWFlaGdy?=
 =?utf-8?B?Z1hWdEZqdzRJYXBwRXFobE5GY1cydFZ3RVZlTjQ4NjVQSkxna2oydFRIaUZP?=
 =?utf-8?B?eGdLbUNWdE5maDBXUTV5em9UbTFaQjNnMnkwTlBlSVVaYUtuNVFRRzZQQ1BC?=
 =?utf-8?B?UkR3K1k1Wkl2Rmd0dURraDFtamtDNHJkRzA4YVQyRXo3T2hka2c3QUp0VTR6?=
 =?utf-8?B?Rm5FeWJxSWZCT1B4OGVCQWJpWWlCTnJGL1V4V1NWd29KYmtzbmJNcVhxS0hO?=
 =?utf-8?B?dVYwd1lYR3RkNXIwTUN5K3I3cU5XY0I4Z2svWUlaSEVsb1NpaGVDam9JRUJQ?=
 =?utf-8?B?MXRDZ25IdDBLWGVtZHFUUmRkbmxwdkNDdDFhYUxnSFljWkJqOE9UL0l4QWs2?=
 =?utf-8?B?YjB4QmJZU3A4M21sem4xd2R2RStwOTg4SHdSY1NIVENTT1BqVndzTDNjMXNO?=
 =?utf-8?B?alQrSXg1RVN3NFc5NFlCSVFLVkpQakZ5SWtoaWdEQUNBQTFMbzgzSHFnQkFC?=
 =?utf-8?B?QTZFYTVJTWJkK1hmdWtTcUE5WnE3WmNYaW1XMHB2VG1WRllqUTdHNHJJbmNm?=
 =?utf-8?B?MU56TWoxNnUxV1gwWUtEVFA1bnVwUWx4ZTVnVkJKSktGRWVhVWN3dkpWNE1x?=
 =?utf-8?B?U2pOcUZNbEVzKzROUGxqL1NzbE9BQkRXQlZpS0JXMHRVV3FFZ1VYZGx5c0tG?=
 =?utf-8?B?RmhIZjJUeHJtTFFicE5WTTUrVG5mRFZLRmVaeWZtQnVpa1E1K1lJSE04bWx3?=
 =?utf-8?B?ZjFvb3gyUktFYWt4TGg5UGtILzFSWVBCN0xhS1ZNWTlQMXgzcjJ1UXF5VndL?=
 =?utf-8?B?Mkpoa0ZSa0xqYklDZHhNM2VQVGl1cm1ZM3NoSERYaWNTei93cWZ4RXE1dkc2?=
 =?utf-8?B?eGUzOGljWDNESllOZkZRdUdXTnl3ZWQyQ3RTbk1kTkdhYWZjbjF2Y0FUSUVl?=
 =?utf-8?B?a2FpblU5bDRCRkliajkrODE3dWhKOFlpM3pkbTRVSThjVUJESFVoTXIyVkpx?=
 =?utf-8?B?VlpCV3NmUWhQYmFjWmpuODlxcVJYa3NNVmMyT203NUNVdDZGMjJQcGVkeUYr?=
 =?utf-8?B?anRQeVFVRkM3SVBYUWd3V3JUSjQwa2J5MU5BR1F5L0RvaGtka0VYeXBJWDBY?=
 =?utf-8?B?ZFQ1cEFqWWRtQXhzejQ5Zk1TRWFHanhWM29DejlUVWdlYjlJRjd0ZVh6dndY?=
 =?utf-8?B?N290QVg5eUxIN2JMWlVkTDJwSHZhQ2IvSWwrZUQ2VUV2dVZYeGlwd3RLTHdI?=
 =?utf-8?B?S0NBUDl6VCtMQ1R3UGRSRTRGUWU1TzFFVXlrT09JdkhUSVd5L0xuYWFhMWNw?=
 =?utf-8?B?cWxSV1h1d0VoODBVWUpPUU4xTzRMSGZBTStxODRnbzN6dGF1ZkhJTUtpMTdk?=
 =?utf-8?B?M215TUFaNGQybTQweFpseVVLN3VYN05iNkFGNHNuMGhCeFFDelNtNCt0MUhD?=
 =?utf-8?B?ZklHNGxPMC9BejhzY1JCNFRWa3ZrMU1YQzZDejh4K2J6cTB3aE44TENicU5Y?=
 =?utf-8?B?UzEwT2lsYURYQWUzSHAybjRTMldja1hKR291cy9vUWk4TytMeEppZCt3QTA4?=
 =?utf-8?B?OC9pSFlNN1lON0VMeDVId3U4RG9HdCszUXJsMWZtVmozSkEvMlBMcllWNHFK?=
 =?utf-8?B?QytFUU43VWhGNEs2L3A4Y3Azb2g4TytSVHRlZVlkMlNISXMydG9za0s3L00v?=
 =?utf-8?B?M3RTaGc5VUJUMUZZQVUzbDNjQXZxRlhmWkQ2NFZJNTIwaE1Sb3ArQmF5UjhT?=
 =?utf-8?B?WWRSa2ZQN0xZb1ptSTZVYzdRcnpTMnVLeTlBSUFudjJtaWw1ekhvcTRuWEtl?=
 =?utf-8?Q?NnJsgiTK1zxnzEa2RN3czRavn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de517beb-f2b8-4206-0730-08dbeffe750a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:40:36.8204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjEL986ntNxF2GiK3phapTT2zv4n6nh/LY+uSzbmEwwBa0bXimut7DCpp9NNsXQN67KgmH91kJcAbv+Hi36kGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/8] RFC drm/xe/uapi: Add configs for Engine
 busyness
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

Hi Aravind

On 11/28/2023 2:43 PM, Aravind Iddamsetty wrote:
> 
> On 11/27/23 19:41, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks.
>>
>> Add configs to the uapi to expose Engine busyness via PMU.
>>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 6f38f836b705..be75e6ed317f 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1004,6 +1004,10 @@ struct drm_xe_wait_user_fence {
>>    *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>    */
>>   
>> +enum drm_xe_pmu_engine_sample {
>> +	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>> +};
>> +
>>   /*
>>    * Top bits of every counter are GT id.
>>    */
>> @@ -1012,6 +1016,22 @@ struct drm_xe_wait_user_fence {
>>   #define ___DRM_XE_PMU_OTHER(gt, x) \
>>   	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>>   
>> +#define DRM_XE_PMU_SAMPLE_BITS (4)
>> +#define DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>> +#define DRM_XE_PMU_CLASS_SHIFT \
>> +	(DRM_XE_PMU_SAMPLE_BITS + DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>> +
>> +/*
>> + * Engine configs offset - 0x1000
>> + */
>> +#define DRM_XE_PMU_ENGINE_OFFSET(gt) \
> i think this as well is for internal use only "__"
>> +	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
>> +
>> +#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
>> +	(((class) << DRM_XE_PMU_CLASS_SHIFT | \
>> +	(instance) << DRM_XE_PMU_SAMPLE_BITS | \
>> +	(sample)) + DRM_XE_PMU_ENGINE_OFFSET(gt))
> should you have a define which applications can use "__" will not be used by applications
> they would benefit with having a helper which they can use to define a config.
Will change all internal helpers to __
> 
> eg: in i915 we have I915_PMU_ENGINE_BUSY(class, instance)
Will add a helper XE_PMU_ENGINE_BUSY(gt, class, instance)

Thanks
Riana
> 
>> +
>>   #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
>>   #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
>>   #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
> Thanks,
> Aravind.
