Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B939C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC7E10E337;
	Wed, 13 Mar 2024 22:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRubsRVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB41710E337
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710369303; x=1741905303;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E3SAee8pE+bvO2GNzqc9OXOWAzFTtn5iD4k6fXs9C2g=;
 b=hRubsRVSKtvQAOSgnmUgyVH7IXrRbE47ZdgihFdRxNQpVYHw+8Iu2QtT
 AHk2Ck/9BHMDVjtBJVqQBhgoDr9WPb5ZYff73V17S1Ao3qWpXERsp3O6Y
 dbDNpQY3ZDg1kIb8iv0DOg8W5lEFAOjTDYcfOOzw4pih45OJPRRFDpcjK
 WcvBTvKbIAff7BKdA1eBz5UeV+l5VoJUlopquU4N+GyD2kuCy4gQe5OLN
 p0oePFJbcMuB92f6u5NxTsS1krObKcktRli1D69vnmT1vmt87z4ENXABe
 BFQwaIZiZeC3OJUJja8L2xQdLj7kV9XhCstq04B62+1iK1NYSl2PRyxKz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5030050"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5030050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:34:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="35212573"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 15:34:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 15:34:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 15:34:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 15:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hrlj1f3szTrX3jCOHlj0Mc6Mwm7lCo77BAZkvvHr2AGkyN3sk4TzVZExEPpuDztBISd3szTLD7zI4K/XyQ1IyIDsdCzpnOtVGNuapoaYkjObNuJ+xSmRKazHdq+WajsVrxMUQiYoRe09PKYYerufCFwNHx2XDIYu/A7WWSdDsFTU4c0o4nxbOIGrI/J+SDpd7vFso2Rxwl2iuh0EF28LXCYTupM7aAPYnJZFMf4OTKmtPd3HDDCCPNVSmipenKrZGN0ejtwRRBOVqvWDnppLR+Td5MXGPDHPHi3Xpz32YThLHdNyf9g/18fUPzSTtqvvrEPwFxigscWfb6WZW4LAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk11DXYnxnsj5rPVd/FexrGr454Os/27TZbhQ/Dh7JA=;
 b=Zg/YG2mOmXLjDqyVj/BN/D6P3p7E5gxBzibSwA7EX33yFN24Ktnnj1YDKc16wi5v1w78uLvfJ5A50LlL5tyFgWaHM6m04idgYVCJi/xIs/o0Y82s6aOqs5tEFfuAP47nueXLBGJw7W7KZEMqUJ3lhFBQvt0U0RlILwf2p6Ao/KyUIFQqTmMlA3QWw02xXFAlfCIx/Wp51Z7iUZ7Uzw/jpe5AnUI+xUNkanfGBk7ir1DIXFgJOXYMh7kA3HnXy2LgRKs1iabad411d2CUZvhO/7r4xVI7v1thHXGm2Vz7JqxWHY1VUSAzI4z+hR2v+6DzqMWDnxJW3fJE/pr33AcSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 22:34:51 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7386.015; Wed, 13 Mar 2024
 22:34:51 +0000
Message-ID: <837b9d9c-325c-40d3-b490-8f67e963cb2e@intel.com>
Date: Wed, 13 Mar 2024 18:34:47 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v10 1/1] drm/xe: Add helper macro to loop each dss
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240220161937.11714-1-zhanjun.dong@intel.com>
 <20240220161937.11714-2-zhanjun.dong@intel.com>
 <1f18385d-010a-4146-8a59-40efd1fbf330@intel.com>
Content-Language: en-US
In-Reply-To: <1f18385d-010a-4146-8a59-40efd1fbf330@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: a903117d-851b-4224-b129-08dc43adcbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +9OcNyJ6RHMMZyFoA0FbL978x+XUWgyps9rlwNx50pfa0ytC05dhW4AOvtJAw1XLCfl0DzkfhF5aYiI42QM7SydLGw6ncwYpSOD+BgPEbdUDQixmDi5Y5oedOBywKFpWnvmYWcQ1xr2nOIoHZ+UdkLOAxAqMJbUuuS8A/M6qimmXmpYfH4NFH0XhaeiDOC7K4uwRshvWbdDerwSX6z712PNkEoxRFOAbhU9CLamjVcBOB/VZGL0J7sNsMZb+QCB/8jxiADYPC4gC6mtqr/xbZV6jsugtwHvc82RXJ8MxONMC6sJTw7yYXJVUlGzItjQGLCExxkaoBcnOxjhDBAcNcIvJ5w2atwwchkyIOyvDfvydKr6+K9OLDAMv8a/Db3SeYy6m40kIKMC5WaN1wFq+BvzLaaY7R5hYQCxGgY2TCecAr8qFth4vYZp1T6lMiS3MzZpp5fq6pAHvSdPdb1fG44Ez8+fURe1FV+InWK6+AyQuD2BqG6PIawHKWpDQI5ATFXHJOd1GkRGHEGDhhT+Y/xe6O9RQkWvZ+DAhWIGMW20dKoV1OZD7pq8tjxlAj3VWm0UcjqMOxuzLm6Bck9O8EcD4/IhTSvOlLFsyZ24vrhVb0DoBTDzjiBO4c7btsiCD+4GSyDt3viMgU5W7AYM7F8FQ58v2B/Nlh4FicyhEiYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0psZzIwUnN0MzFjaEN6ek9HQXAzVzlZMmxhQ1NmRWJBdTIyaVEySkFuSHNu?=
 =?utf-8?B?b244aE9ua0V2cjdVSHFTWkgybUd6LzEybVVhSUJYOGtra0JKOHZCSVJDbjFS?=
 =?utf-8?B?SUhNVWNBRkp4aUNoanRUMWMzZS9PRVBjUGF3MnFoaHFqSjNlT0tJa0dkVVl1?=
 =?utf-8?B?Qkh4MFU5R0x3bi9Bem5JS3F0RER5S1NxWXczOG9UcnJVNGZyeWdUL3dVK1B3?=
 =?utf-8?B?dWJvUElVOFhsbGlhMGxiV2lyQnBKWTNjc1l6UXo1eDNRaC9zMjBuZVk1a1Mv?=
 =?utf-8?B?L3VQWnZrUWN3UDdZYmdoSC82Z3ZLUkFZU0hOWTExcU1EeGpFUkVIdkxGU2t5?=
 =?utf-8?B?eWlkRVI2UzZvWnVmYU9CYy9hSENIcG1iSS9NUGptK0YvLy9ZUHcxSWQ0U2Mr?=
 =?utf-8?B?VnVDVlYyQVIxeG1TZzk4RnZSdVhjZ0NuN2h1c084U1Z6dHpzRU5QUDl4d1NY?=
 =?utf-8?B?OG9aaXY1Q1Yvd3MvTWE1di8ydi9tWkdrMEg1SVl6M3hURHA5Tmc1TWZWQWxO?=
 =?utf-8?B?NldidXRabkk2NlM4RGdJZkJlZUtFN1RlUEU5R1hpdDZzOWhVUG1CSU5pSEJD?=
 =?utf-8?B?T0d0bysvSmhZTUY4TFN6b0FpcU9GM2dOUTRSOGxtemxueGRIaVRzOThtN0M2?=
 =?utf-8?B?eHRhSjB5ODA3dzJLZm51RzB5dU5qazdKbVlncnM2K3dGQXdaV3VibkhuWEc2?=
 =?utf-8?B?WTBwaVhFWmhtMUVod2NCZGMvMENFbk1sMEUxcjJHckNtc2cvc05ZMzR4MExS?=
 =?utf-8?B?c29iWGxPUGRXOTlid2s0VzJiS2ZYRlhjTjdQRGxPNWhmS1paN2Nmb1NVWmlL?=
 =?utf-8?B?cjRnZEljemJ0cmlWUVcxbXJSTmQ5cytCMnFLbmo2MHM2S3M0Z1Q4c2xCQmVD?=
 =?utf-8?B?Rjh3dTNWOEc0SVdKNjZVbGtSU3dNODNsN2QxNVREQ3ZFRjhjRzJhK25ySjZx?=
 =?utf-8?B?SjNJeUs2d0xJOUo5T25oMCs0NkZwYU9ncDF6VW0xRU8ySmVxd2RNOHM0djla?=
 =?utf-8?B?WXBkT0YxV2FoMTVrd0d2VW4yak91OXM2bHlISm81dnRRY2I0LzRtNXp5bHdL?=
 =?utf-8?B?dStyZEVZVGhFZ2dRK0tKUWFzcmhtNGFBTG1IaGV5Q0t3NmhjcUxKY1RUcUZQ?=
 =?utf-8?B?Tmx2MHJJQ3VKUVFSR284M3JzN2FmR2hJSVI4R2dtU25WK21aczFVVUg4V1Vl?=
 =?utf-8?B?cFZ2VnBXcmhES0tSRFNkVXFISGwrU1V1TTl1bHM4U3o4bVJxZFNvMW15MDc4?=
 =?utf-8?B?aUxBVjh4RGNCNjhNTkFMTEM5MnZIYXJFRktsTnZhVENVSFZBckl6cVM5Skdi?=
 =?utf-8?B?ZmlrSXdWeDVNcGdkazFtWE9BYnEycDluVU54aDJrMThnYTdjcnpYbkxxZDV2?=
 =?utf-8?B?aHlhb3ZMbzd1dTdCWC9rM2RHSjBicmtmVlRwb0VtYkNyM1VXQ0htUUNkVzZM?=
 =?utf-8?B?VEdiaWFibmNPNmRhR2tWQzdQNnorWW5ON1dQL3hmYnJGZW1Ja0NnMmo5bkUv?=
 =?utf-8?B?SUtQVThaK09WUVRrMWs1bXBTbWM1UXBlTnN2K3IzUkQ1L2YxS0xsakhqSWdJ?=
 =?utf-8?B?N0JtdG1sSnB3VUo2aEwrZkVhbW5seUpUc0NsNS9iblRXejdvY1FUVWoxaUgx?=
 =?utf-8?B?NGJveGx3NndVa3RmckU0eFhTdXNXQzlWdWZueGYwSDJpRTFKc2NnbTlCaFBI?=
 =?utf-8?B?dDYzanpjdmlKVHB2cWE0a29EalRIL3NFbDFnT1I1U1hNWWFpRjRydG5sSlRB?=
 =?utf-8?B?WTBYZDJ5Ykt0a2FUNDVxMklxVU1lRUZmc25lY0JLSms3SWZqaFlOejhlMGlr?=
 =?utf-8?B?UXZLMEtqOEFGaUp3ZllJRlRBNVlFbzh4cUtlVHArSU1US0k3R2tvV05OQVlj?=
 =?utf-8?B?cTZLMnBHUFZOaGQzTU9TZXJReWY1UmtMcDFMK0l0OGhzd01Xd05KVFUzRjRn?=
 =?utf-8?B?TmhTb001YWJqYm4zR2xuWlBMOHhuRUNNSUJMdFFqTzVrRDFVMml4dFhaTUJH?=
 =?utf-8?B?cExvbUQrRUluQ215bmZrS3BaMXllSzNYYnpiRG1jSHN3LzYwYTJnajFzQUhL?=
 =?utf-8?B?aysyaFA0VDJRa0xCMHkzRzZxcGFJcFNSWFlKZ1ZFelNDVjg0aU1lQXBEVUVm?=
 =?utf-8?Q?17ngZR5sQaW/sEoie1p6nfFGq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a903117d-851b-4224-b129-08dc43adcbdb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 22:34:51.0097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9jYjhVbmh6R6lsJNMkGoUGXOLGxu1f7tUctmkh5wmhUq9Gt/+kMAXd899rdJ4aHdjVTghEeHlIGtZ1jKSVtmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

Please see my comments inline below.

Regards,
Zhanjun


On 2024-03-12 5:49 p.m., Michal Wajdeczko wrote:
> 
> 
> On 20.02.2024 17:19, Zhanjun Dong wrote:
>> Add helper macro to loop each dss. This is a precursor patch to allow
> 
> please be consistent in naming: s/dss/DSS
Sure
> 
>> for easier iteration through MCR registers and other per-DSS uses.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_gt_mcr.h      | 16 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
>>   drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
>>   5 files changed, 83 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index a7ab9ba645f9..2ee727ebc4a2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_gt_mcr.h"
>>   
>>   #include "regs/xe_gt_regs.h"
>> +#include "xe_assert.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_gt_types.h"
>> @@ -294,14 +295,41 @@ static void init_steering_mslice(struct xe_gt *gt)
>>   	gt->steering[LNCF].instance_target = 0;		/* unused */
>>   }
>>   
>> -static void init_steering_dss(struct xe_gt *gt)
>> +static unsigned int get_dss_per_group(struct xe_gt *gt)
> 
> nit: as there is no "set" then maybe s/get_dss_per_group/dss_per_group ?
Will be renamed.
> 
>> +{
>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>> +/**
>> + * xe_gt_mcr_get_dss_steering - Get the group/instance steering for a DSS
>> + * @gt: GT structure
>> + * @dss: DSS ID to obtain steering for
>> + * @group: pointer to storage for steering group ID
>> + * @instance: pointer to storage for steering instance ID
>> + *
>> + * Return: Always return true. The steering IDs (via the @group and @instance parameters) that
>> + * correspond to a specific DSS ID is saved to *group and *instance
> 
> if return is always true then maybe function should be void and just use
> comma operator if you need bool somewhere in the macro

Sure

> 
>> + */
>> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
>>   {
>> -	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>> -			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +	int dss_per_grp = get_dss_per_group(gt);
>> +
>> +	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
>> +	xe_gt_assert(gt, group);
>> +	xe_gt_assert(gt, instance);
> 
> as general rule we shouldn't assert NULL pointers as any NPD will end
> with nice report anyway
Sure, will take it off.
> 
>>   
>> -	gt->steering[DSS].group_target = dss / dss_per_grp;
>> -	gt->steering[DSS].instance_target = dss % dss_per_grp;
>> +	*group = dss / dss_per_grp;
>> +	*instance = dss % dss_per_grp;
>> +	return true;
>> +}
>> +
>> +static void init_steering_dss(struct xe_gt *gt)
>> +{
>> +	xe_gt_mcr_get_dss_steering(gt,
>> +				   min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>> +				       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0)),
>> +				   &gt->steering[DSS].group_target,
>> +				   &gt->steering[DSS].instance_target);
>>   }
>>   
>>   static void init_steering_oaddrm(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> index 27ca1bc880a0..0d8abd320e08 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_topology.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>> @@ -25,5 +26,20 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>   			       u32 value);
>>   
>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
>> +
>> +/*
>> + * Loop over each DSS and determine the group and instance IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + * @dss_: DSS ID to obtain steering for
>> + * @gt_: GT structure
>> + * @group_: steering group ID, data type: u16
>> + * @instance_: steering instance ID, data type: u16
>> + */
> 
> 1) no need to use underscore in param names
> 2) remember to wrap params into ()

Sure
> 
>> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
>> +	for (dss_ = xe_gt_topology_get_next_dss(gt_, 0); \
>> +	     dss_ >= 0; \
>> +	     dss_ = xe_gt_topology_get_next_dss(gt_, dss_ + 1)) \
>> +		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))
> 
> I was hoping that there could be for_each_dss defined in gt_topology.h
> something like this:
> 
> #define for_each_dss(dss, gt) 					\
> 	for ((dss) = xe_gt_topology_get_next_dss((gt), 0); 	\
> 	     (dss) >= 0;					\
> 	     (dss) = xe_gt_topology_get_next_dss((gt), (dss) + 1))
> 
> followed by:
> 
> #define for_each_dss_steering(dss, gt, group, instance) \
>    for_each_dss((dss), (gt))
>      for_each_if(get_dss_steering((gt), (dss), &(group), &(instance)))
> 

Sounds good, for the for_each_dss macro, I like the version defined below.

>>   
>>   #endif /* _XE_GT_MCR_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..d9566867c7ef 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> 
> nit: this definition move could be a small separate patch

This macro referenced from other 3 files, can we keep this small changes 
within?

> 
>> -
>>   static void
>>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>   {
>> @@ -167,3 +164,31 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>>   
>>   	return quad_first < (quad + 1) * dss_per_quad;
>>   }
>> +
>> +/**
>> + * xe_gt_topology_get_next_dss - returns the next DSS id from a start position
>> + * @gt: GT structure
>> + * @from: An index to start search from
>> + *
>> + * Search from this GT's DSS-fuses-topology and return the DSS-ID of the
>> + * next valid DSS instance after DSS-ID 'from'. Depending on the platform
>> + * construction, DSS instances could be for geometry (RENDER engine) or
>> + * compute (COMPUTE engine). However, all current platforms that have
>> + * both engines have the same instances thus we can combine both masks
>> + * internally before performing this operation.
>> + *
>> + * Return: The next DSS id from a start position if found, otherwise -1.
>> + */
>> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from)
>> +{
>> +	xe_dss_mask_t all_dss;
>> +	unsigned long next;
>> +
>> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
>> +		  XE_MAX_DSS_FUSE_BITS);
>> +
>> +	next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
>> +	if (next == XE_MAX_DSS_FUSE_BITS)
>> +		return -1;
>> +	return next;
>> +}
> 
> maybe there is no need for this function at all as likely below macro
> could do the trick:
> 
> #define for_each_dss(dss, gt) 					\
> 	for_each_or_bit((dss),					\
> 			(gt)->fuse_topo.g_dss_mask,  		\
> 			(gt)->fuse_topo.c_dss_mask,		\
> 			XE_MAX_DSS_FUSE_BITS)
> 

I like this idea.
Yeah! this function could be optimized out.


>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>> index d1b54fb52ea6..44bd8a58f9ce 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>> @@ -21,5 +21,6 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>>   
>>   bool
>>   xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from);
>>   
>>   #endif /* _XE_GT_TOPOLOGY_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 70c615dd1498..f6da2ad9719f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -25,10 +25,12 @@ enum xe_gt_type {
>>   };
>>   
>>   #define XE_MAX_DSS_FUSE_REGS	3
>> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>>   #define XE_MAX_EU_FUSE_REGS	1
>> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>>   
>> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>> -typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>> +typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
>>   
>>   struct xe_mmio_range {
>>   	u32 start;
