Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27BAC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853611262A;
	Fri, 22 Mar 2024 17:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nczStUEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099E112636
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127717; x=1742663717;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9tgK93XMSAJ8qfgKsFLWFVDmOwxhvUGuJQUkSfe+MAw=;
 b=nczStUEqyze9i+JEXek12f697wXDfvZOXpsp+Vp3Ai020Ws+LHiZ3qEV
 oCJRId42mYbXHw/oSLGcFpBMP8eRIXsCQfMcXclf9yIDjPLiERONxVvd5
 wAvpkoXrmmXH0McREiR/ms/Icv0Wiemq135bSDktb/obvOLuIzrBOKWt3
 SQaOCRrad67QAE1dZylIQjzZHDxzc6blmqd164/DE1JUSudFk5rKFYE9S
 CHFx+ZcYa/WnEwvLIvYTZ5le+US2FnbBzkcHKXumbOwOQGepSihHWVLe7
 8kD+jx1v2r2LvZVkBxqy4B1QFeJ6A2A5Xy6ihOUtTeeguLTEsGuck1qFK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17581614"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17581614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19703494"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:15:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:15:16 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:15:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:15:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy2PKPlv4OIPYEYPUHHxoh1SeEjDuG+YnblYR1/CqbeUnG0km+iD+SpIPoou4rGbWsJ8afmHieofE98F27roTQ+4lNSk/+tnhYTuEsCj4WsAeFPASzrCViKOfo3OO/U0A7mFhFWqltGCrU1mNrpVlGGrRp7oiins1kdrJrw1ZOrWvC9qFm/+dV5rjrhnXahl1OxLhDtVDemnjzrWfuPbj2FeKqf8fC6XuEdKvEq2212a3541BJZ51lvd/roVpcwkmWz/r5b8fMTwoG7G+kfK6T5Xp79eypIZwZkSQwij0axl2zOb8gcvqTpe6+oAy4s1341neApva0ygql2d43QWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KjItzlIBfqr13y+nUmv/8rZj6WIuiWSkaG8SCO44w8=;
 b=FX5IGn3TsYZaFt0zIjX5d2oKdv/2+HxE4du+lWHijtz15yOWO+N92tsl/cwiOS8iG7lu/fSH7IZvqeNqomy46a4YF8ElwMh1UhAMHjJrhOk2j7p4ro18ATgyh/m8JIHNVXIXJCQHB7QSla0V9SucoF8FgPv+xDXeQF6dVNmTR9jLtLIDshNvfJO7KvjyGUTghLuhpy0DGwD6aHnZE5ugXJY7KWUZ2YnDygbUYU0YlJvoE2rsCknPNWQVrzG5G1GqFir6ybYBOrxhNBHGC+1aruf/I0jyyLt0EAcwWCfPScHJjICFY44QoVdHohaJgcNUTycixmR+JsTbr/KliKVtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:15:14 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:15:14 +0000
Message-ID: <fdd66cb9-eea1-4e70-9498-ad1b48c94717@intel.com>
Date: Fri, 22 Mar 2024 10:15:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
 <20240319160859.2672825-2-badal.nilawar@intel.com>
 <c4637cc6-307f-42d3-859c-15b9c304b44f@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <c4637cc6-307f-42d3-859c-15b9c304b44f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b16c973-5612-4663-1010-08dc4a93a324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8PcVSrlvRL3QxGA9nRiElA0SAceLLYq8g3Xe4/CwTSdPXJAp+LZ4p9tqmckPr5qnplJfIwsgItueXEZEbXNFJsGFSplF7AQPBuZIABinbvYeDSi7/pTLAoo/dCFmTQg3fvf6+Hy2a1dAlZ9/NfJfQCQsHUe8f2NsEzNschDn6vO9aZGDaFuI8AIs18YQyWqbGEoDs1DcOmaBYAxxL/+zmtXn7v+C6VlVs9GYp5pmMzkj0nxGOlGPVZJb8hXS2il7/Xr9lANfPC40ITGT7U8O88sTV4YWBqPc1dJhxAGWqJPglSS+4WPVq1a2a+7PoY0paBBqx7l9jW9EZvqAKdR2BIzeZyBKyrbXaDhJspXFiWS+9Jx1416qAeLgIm6UvQ1PBma+YMoScu8Rv/QnfZKJTH7dwPNEiSD6hwoAgd7KmntQcLrhNW/vpiwdIq7dB9abNEFhp12lXI9yRy6q5+abeb4/x3UNUn102cvqjtkuXU7DUa3dcaZC6ynQfwWJvDWMrW0FpYeCE7Ce0sXux0tJsDR9ADvZsSE9E7bYAR6K58ZaCXCYwco1xsy3WEkhygf7mYFMgLQa93WaiCfmdLvcVWcQmlP7yjNo81+/uLFo1+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUo5aWtENUZsSDZBYlhKSTg0Zks5dzBSbEMxcHZEYnBnWERhOW5MRmpNQ3BQ?=
 =?utf-8?B?RC9mUUxSRVVLa2lHaVdYK2NEWjgyNHRiUHRlMzlmMzV1M0N3Y1FqaEpsQ0lX?=
 =?utf-8?B?THIvbld4bjVNMHQyaUR1VFp4YUJyaGFRc0pEdDdHZ2w4Z0poNkF3ZklNeXVL?=
 =?utf-8?B?TkRqdEdhT1F6cHV5MENieTlhUmRmSFo1Uk9SK2psdVFoNW8yOHlucGhwd2ho?=
 =?utf-8?B?S2FES2ZBZFY1VjUxLzFKdDRmTFJ2eUtXcDExcVA0UWE2L0piL2RoMVpoMVVO?=
 =?utf-8?B?dkNwRFhlUTFSWjJFbndqTVZDZDlrZmNqTHB5Q2pKR0VLanJKekdBSzhpOG9o?=
 =?utf-8?B?MVdtdWRFMVd0cEIxZm1hZmw4MXhsVW5DMXJ6STlSRkUwMllvaU9zVHBJYVRM?=
 =?utf-8?B?L3BaaFN2Ly9FWUhRYU8zT29lcmdOV2dUeEZlVi9kWHozNWFVWExpZ3R4REF0?=
 =?utf-8?B?TXdmbXo1bGNwK2lTb0FQWlY1ck5FdUFXWE5aMkY4L0g3T2tXWHQrazZjejhX?=
 =?utf-8?B?eGhGK1ZPNXo0bllwejhvdm93Z01WeUc5YW5oaWpuUTAxamF1N1IwTnhEc2hJ?=
 =?utf-8?B?L3FNRUlzL1lSL0Ywd1NyWk1PdmFReXIxdzloRmxJWEpiUS9PTTZGZ0U3Mk9M?=
 =?utf-8?B?NWJ2aWRLUWIyNmFVSXJialNqbTZJRmk1b1U3TkczQ1VvclE3VGQ3N0l0N2tK?=
 =?utf-8?B?ZUhqb0pHN2wwYm90Sk1LNDFNbzV4MU5CM2RwY1RvcUxvd1Z1c2c1TW9CSTVq?=
 =?utf-8?B?SkExWE5wZ3BGQTNrYzYzaTlEVm9lYjE2UkZyVVVEaWRrT1ZQNWpKQXFCK081?=
 =?utf-8?B?cCthT0dwc2ZJNlNSUjIxckpzYzY1R1d3YnhaQmNweGwwWkk1NlVMblZiWWF2?=
 =?utf-8?B?V2RmOVJRMlcrd0xjSFR4Z1dCV1ZpcXNVbHloRHU0aloxakJFM0VaNTZxMS9O?=
 =?utf-8?B?T2N5cFZaOWw5bmE1QUJNS2QvMGVOakkvNHhtM0dDZnFFS1VpV2JyUndLcUNN?=
 =?utf-8?B?V09WM1prNkRabVlYeVlpYWppZ3lxVjI0K25PVWFwOWNBV3k5QkJ6ZnJTOEll?=
 =?utf-8?B?bzA3OU1uNHhOYksraWtBSHdyVWI2RDk2c2tFcEJrbzJQaG5uL3l2Y0lkREU5?=
 =?utf-8?B?RkROTC83U2dyeStoSUc2cmZWYzFOYjdUM0lqMW8xSHhNaWR1ek5nZGVaTXh3?=
 =?utf-8?B?RlVQTm9QVEFSR0s2d0d1VFhkck5vditqUEdzUU9Kbkp6M3BINjBOYTlFLzlR?=
 =?utf-8?B?OWlvY2x6OVJDM0hSQXBLR2Rmam5YK0Exdk42SytEYk5mQW5jWVFjb3k5dHlk?=
 =?utf-8?B?NGpiRytCNHFySzBTdUlTc2dGOWtRWHY2ZEtnaGpvVmNhOXZZTDNkRlVwR002?=
 =?utf-8?B?eS9JNWg0NHJkbnBabG44QlljVVNEejRDWFFJME8xSlBTNFpMUkxRcllrS2pD?=
 =?utf-8?B?K3Zoa25GbUlvVjQ4NEJBcCtQeGlvYTB5c1F2dUE1UHpTalYrc1hvWU1QMjVF?=
 =?utf-8?B?UzlYSXJ0MFpFWDVDa2hkeDNEdXJwMDJHYjJ5eThSUlh3NFc5ZC9OcXlSQWxy?=
 =?utf-8?B?L3NlWkhLaDRWUVhNL251SnJrWnhPYmhpKzhGUHhJWU5XcVVGM0RvamFsWUhn?=
 =?utf-8?B?TGhKOWo3cm9TcHliYjg2bkhxdzNZck1laFBUbEJxQ3kyeDY2S3YyVS9rSVR3?=
 =?utf-8?B?K24xc21oQWprVTEvc0ZNOVdEd05ZeEwxRjF2YmJjRXJjdDF5WUszOUFnR0xX?=
 =?utf-8?B?YW5rK3pOMllvQXN6Q1dOdnJNdy9ldm5vSDJkYnpwMnR0dTZteXlMNmlPS0lL?=
 =?utf-8?B?SEp4NElnSXVKaGZQZVF6eEl1Uk41cFRsYzJ1WHNLTTR1SERFdkpZZTlKTGto?=
 =?utf-8?B?UTlQbnl6ZkJlUFU2clBaajY4eHF0S3VUVFFuQ2RhdnIrdGhZKzhvYlJ4aGgy?=
 =?utf-8?B?SzNRZGZqaVZLQjhmN3FVMDlsQ3Vla0oydytlTjRWV3hwRmplaXhTUkc2K05s?=
 =?utf-8?B?UnJKZWQxa2Q5ZnVCeVMwN2ZDQVl0eG5tMXBxYkVGYzlydHlEQ0NMYnV3MGxJ?=
 =?utf-8?B?T1pTSzgxdmcvQkRNcGYvd250Q3BhSGYyUExaYm1RYjR1ZGhNSG1BK2N4RkpS?=
 =?utf-8?B?L1ltRDkwRlFoNXl3YmlFRUVwRWgzWklDdFdMTm1oODJMYnoxallEUzB4QWtu?=
 =?utf-8?Q?rdI8cKxRgwEOaLqFMmUJ7f0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b16c973-5612-4663-1010-08dc4a93a324
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 17:15:13.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywyw4FFnkYaU7RShx033MLoXUOeX6nROU/kkJx6gm+NDINRhteSFndlHNmJHnAEbR3Cs2PCG1/83m7LRCG+KkGas4iIR5noTYzXtS5tSnMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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



On 3/20/2024 1:40 PM, John Harrison wrote:
> On 3/19/2024 09:08, Badal Nilawar wrote:
>> To prevent running out of bits, new w/a enable flags are being added
>> via a KLV system instead of a 32 bit flags word.
>>
>> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>>      anything below < 70.19 (John Harrison)
>>
>> Cc: John Harrison <John.C.Harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 61 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>>   3 files changed, 65 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 6ad4c1a90a78..506f0be35763 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>    *      +---------------------------------------+
>>    *      | padding                               |
>>    *      +---------------------------------------+ <== 4K aligned
>> + *      | w/a KLVs                              |
>> + *      +---------------------------------------+
>> + *      | padding                               |
>> + *      +---------------------------------------+ <== 4K aligned
>>    *      | capture lists                         |
>>    *      +---------------------------------------+
>>    *      | padding                               |
>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>       return PAGE_ALIGN(ads->golden_lrc_size);
>>   }
>>   +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +    return PAGE_ALIGN(ads->ads_waklv_size);
>> +}
>> +
>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>   {
>>       /* FIXME: Allocate a proper capture list */
>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct 
>> xe_guc_ads *ads)
>>       return PAGE_ALIGN(offset);
>>   }
>>   +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>> +{
>> +    u32 offset;
>> +
>> +    offset = guc_ads_golden_lrc_offset(ads) +
>> +         guc_ads_golden_lrc_size(ads);
>> +
>> +    return PAGE_ALIGN(offset);
>> +}
>> +
>>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>   {
>>       size_t offset;
>>   -    offset = guc_ads_golden_lrc_offset(ads) +
>> -        guc_ads_golden_lrc_size(ads);
>> +    offset = guc_ads_waklv_offset(ads) +
>> +         guc_ads_waklv_size(ads);
>>         return PAGE_ALIGN(offset);
>>   }
>> @@ -260,6 +279,41 @@ static size_t calculate_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>       return total_size;
>>   }
>>   +static void guc_waklv_init(struct xe_guc_ads *ads)
>> +{
>> +    u32 addr_ggtt, offset, remain, size;
>> +
>> +    offset = guc_ads_waklv_offset(ads);
>> +    remain = guc_ads_waklv_size(ads);
>> +
>> +    /*
>> +     * Add workarounds here:
>> +     *
>> +     * if (want_wa_<name>) {
>> +     *      size = guc_waklv_<name>(guc, offset, remain);
>> +     *      offset += size;
>> +     *      remain -= size;
>> +     * }
>> +     */
>> +
>> +    size = guc_ads_waklv_size(ads) - remain;
>> +    if (!size)
>> +        return;
>> +
>> +    offset = guc_ads_waklv_offset(ads);
>> +    addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>> +
>> +    ads_blob_write(ads, ads.wa_klv_addr_lo, addr_ggtt);
>> +    ads_blob_write(ads, ads.wa_klv_addr_hi, 0);
> @Daniele is pushing a change for supporting 64bit addresses (for 
> future compatibility) - https://patchwork.freedesktop.org/series/131282/
>
> Is there any value to changing this address to 64bit as well and 
> changing the hard 0 to upper_32(addr) instead?

For consistency it'd be nice to do so, but I'm ok with just hard-coding 
a zero in the upper bits if the variable is a u32; the compiler should 
warn us if we ever switch xe_bo_ggtt_addr to return u64 so we can change 
it up at that point if needed. The things I want to avoid are either 
using upper_32_bits() on a u32 or hard-coding a 0 in the upper bits if 
the variable is a u64, and this patch does none of those things.

Daniele

>
> John.
>
>
>> +    ads_blob_write(ads, ads.wa_klv_size, size);
>> +}
>> +
>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>> +{
>> +    /* Fudge something chunky for now: */
>> +    return PAGE_SIZE;
>> +}
>> +
>>   #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>     int xe_guc_ads_init(struct xe_guc_ads *ads)
>> @@ -271,6 +325,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>         ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>       ads->regset_size = calculate_regset_size(gt);
>> +    ads->ads_waklv_size = calculate_waklv_size(ads);
>>         bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) 
>> + MAX_GOLDEN_LRC_SIZE,
>>                         XE_BO_CREATE_SYSTEM_BIT |
>> @@ -597,6 +652,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>       guc_mapping_table_init(gt, &info_map);
>>       guc_capture_list_init(ads);
>>       guc_doorbell_init(ads);
>> +    /* Workaround KLV list */
>> +    guc_waklv_init(ads);
>>         if (xe->info.has_usm) {
>>           guc_um_init_params(ads);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> index 4afe44bece4b..62235b2a6fe3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>       size_t golden_lrc_size;
>>       /** @regset_size: size of register set passed to GuC for 
>> save/restore */
>>       u32 regset_size;
>> +    /** @ads_waklv_size: waklv size */
>> +    u32 ads_waklv_size;
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h 
>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index c281fdbfd2d6..52503719d2aa 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -207,7 +207,10 @@ struct guc_ads {
>>       u32 
>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 
>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>> -    u32 reserved[14];
>> +    u32 wa_klv_addr_lo;
>> +    u32 wa_klv_addr_hi;
>> +    u32 wa_klv_size;
>> +    u32 reserved[11];
>>   } __packed;
>>     /* Engine usage stats */
>

