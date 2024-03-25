Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFDC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 18:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E37C10E362;
	Mon, 25 Mar 2024 18:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCFCTgOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C810E362
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711392972; x=1742928972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GVcJ8uRno+wOvLtRM0wCbC0UQaNJ6YCloIXbTFLg0TM=;
 b=YCFCTgOWA+RceUSTqoaBUmTa4+X3PKUp0Nva/TGIJe8FvdcyFTyznCVO
 3nQHT3SOv+kCUaqIMry1qcpm9Zq/ZmyVZaqWCr3jskkiP0kq93keRPAa/
 8vHjRLnFBoFQjduUCOU3YgxDz2qQLygSgsLHpUt9FRf2jxm3RMYgaL09/
 ORbe/pls6GHPygsQ+OKR6NIM+Yu6wLMrQxUDxdbw2uHuRmtsCW518rMiO
 fPjCHzs06FzeT+2ZDY56jigeU0coeA3LFGSieenmKh3S9hFKBD7byCADY
 QQPOehNh1UR8Dfpg5asAHgG0nA7gNCTs+5HzFiitTYNwexUBjPvffZ1ai A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10208772"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="10208772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 11:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16142501"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 11:56:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:56:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 11:56:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 11:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDRaSZ44i50LH+jdABEiizIiK+l8m6467Qh0AEl4aw+X8BiG8TyQtNjkKRIeyoqZDzeW+4GPqREPHwfU7ILr4Tf0Lp5gihG6ODAppjwBNhgG6QnZH7yWWmSnU+QLmITp3e5c05bXOvE7SXDknR7BurBEdz83adQPV+hSVJrMeBX1H2R/6mlGLI+Jx7Fx9uPDIxE91lEz4/XsXE9GBQXorRlSmszftpuGxqYLrsA/EzVunDUyMh4iCD787QpnF8b9klLijJPWktnJgiIXSdUrzrrRYyV60qausPuAhZ/VLnQnxmG3a54MyqZWb0MoL/8A5HAF4QntQEx4t7192gK81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlfma2z5kLFvYOYiZUidWZGHmE4SZKXj13KqMAyLbvg=;
 b=LYyex1s67uq5KlfHVvkllWQQvsHhDD1y8RbwGREsDmjPFK0zHKgFywoj/jBkdeBy3O9rRh+3umaf3MR5mwPliOv5plSuBnCFfLxRm6bzVChKghjSZVozjC0q11jU5d2H9c997eK9zbbOuGBkUbUlIN8J3/alPNKQh+IpGv64WGo6qxO24yP+7WDS5d0usLLst2VxFcR46j5bMKPFKxuLCQ+idk/aWBvU/5f1FZD8lYZX1n6sgY0zuE4RORnuI6wJGOm1KQcVqeRGrvnyD4kxo+G/oOjiiwarTmN5/F46z1Yv4xFSS6YFp96oCDiLXo3LPl+FM4Vyy5V+yStyH411mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 18:56:08 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 18:56:08 +0000
Message-ID: <2636ee70-1b30-4f05-8448-3453d8f7e155@intel.com>
Date: Mon, 25 Mar 2024 11:56:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Enable GuC Wa_14019882105
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-3-badal.nilawar@intel.com>
 <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <29f52749-032e-469e-9cae-cad1f01896fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL3PR11MB6507:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T11uv0dgTw7MSIBuqzhiidyDc4U94J2Sqkpx5XPatLTjrE8O8LtczT1wLGj//5fUgv4NZTUV68Pekq9klTQNyGAWsWlClBZRhEFXYwiVfAibX9Xs+l+Ow1Yr50rMm4I6q0SzG08Pekf7vKvzm6gqYXqmsdVJQsas9Zvp8TBnecGGn7hPAr+rmNQMmfoSyI+yafQ1KMvM0vK5DoALQaSx6URXwBj5SsQfpmqBWrMljkCkOGUAMR3hDhcfDuuTu+qTUDl0MdoP9jk+eZHESG8LfxSR2WTlhlW5pFWxsZvcloEX9uTYGZauyh8xlZce+p86gBVkRMQDm3MCEl6503z5L6L5xYDyS/m1cz14dCdlsMUO2kFZVBJHM3SVQgSWYXSbNErtVuQSN/U0GutH9OzigleTAGiPsK2E3XoUkxkreclNUTQzoK3p1anyfPGitDawPEwA3dNNv38y5U9BV/83gmfzF23AlnhA21zwbSBEj/xamh//NWGd96279QeyBHNHb1ZWffN67ggV2j7TZlY5U87zmOl0jOrBY80xoUti1siHaB6iq6fvnmuW6xoHyevt0xGBFYwjtni2MuVn4FydEjIjZA2vyfycULaumgETbhuqc5Mrn+nmSyZURl5Mlh1KQ9HiYmt1NPurNsRtbUxfxWS5drMe/6rYJtsc+Xa+OJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpqVjFjMU5heEJBSm96V2JpeXhwdXhNYjVZSCtncncxQWFJb0tzKzFFa1hE?=
 =?utf-8?B?SkFaZW1UeXlnK2RUY2NiSGdvdnU5VnlXLzNvMWRYTEo2ZU56Q25kRjBDSkYr?=
 =?utf-8?B?UWpEcSs1eVhNSzNiK1RaZklWZUpOd3BLN1kxV2k0NXVPeUdVaTdtUndndFBL?=
 =?utf-8?B?OXR1M2pXSCs4U082bXI1T0RJY3JrYllRSzBTWHJKVHhGcHgvWXdRUUtoRDVZ?=
 =?utf-8?B?T0ZoTHBEUkozb0hvUDZHcUl6dEhPbDVTOEtBRUgzUEhIYlNXWjJRdzBnbFNH?=
 =?utf-8?B?VG84eUJIc1JPVmM3U2wyNlNPZUZ3ZmIyeU8rTjhqQjN3Rmp0aXhiWmJiMWFs?=
 =?utf-8?B?Ny83UEZDNzRGZnBCQ2U0QXZYODZpb3c0VFpkV0xFUi8vQklaRlNxZUluc3l3?=
 =?utf-8?B?V2JBdW5WempSUllmVFNTU2pUaUwrbHFlYU1hR1RyM3ZEbFI2WUp4M0l6WDhN?=
 =?utf-8?B?djdjWVFVNDdWNDlHN3d2MWdhWFpWSGVBK00rY3F1T3ExdVI1cWZLUFZIVjZS?=
 =?utf-8?B?QmhRVWNYbUhaUUd5dFNya2I3VWwxa2dEUThnRTJ1VDRRZk1lbldBeEhEa0R1?=
 =?utf-8?B?Tjdlb0ZHQWZXUEpmWlIzcjRWYmRJRXNJY1NrWExzZUhqckp6aEtUYmc5SnY5?=
 =?utf-8?B?aGNhZEkwM1IveVBnL25RdXNmdHVTenk2TW04VVlRMlJuTGJVNEZ0NFhTTWk4?=
 =?utf-8?B?QlNwQWx3NTF1YmZ0a1BqamFUQ1REN0pKRjlwa3U0bHJxOFllMUpIZ3U2Zjly?=
 =?utf-8?B?QklBSWtLeUgwWitrc2Q3K1FLYWljRTZoNFNXWDNuMzd6SG5JWTBqU3ZWUzNT?=
 =?utf-8?B?NVZKbHV4ZWEvN21DdktRVGYvKzBONEhGSTQyUlN2TW5iNWxnNWkxb2oxZnBv?=
 =?utf-8?B?dTY3dWpOMjkveEk4OTEvRVlKRzN6ZTdIOG9XL1RyOGIrYklxRXZGejZLdGVF?=
 =?utf-8?B?dElTZEU2cHo2UGh1Zk9oQlo0WXcxRnU4N1hzVS8rd2pIVExLenk1a1RBRWcz?=
 =?utf-8?B?MWZEcFFUYU85aUs1eUdlWEhuaEU1MzloL0VQWDZMdlVrTUJIeG9hcERjMWRa?=
 =?utf-8?B?dXg4akxYNGl1ZTlTWjFCcGFsUzBDTm5MMHdqV3lOdUdaTHM4UGVJTnd5TGU1?=
 =?utf-8?B?LzUyT3VadzM5RWErVUt1TlRSTDlGVW9mbEc3R1hwWDBIeGp6dUt6MUtqYUZS?=
 =?utf-8?B?QmxXTjBZWlJqcWRqd1gwNTNzZFQvbDYrZzZ6U0czQ1hzdjF3aWkybWFheGFx?=
 =?utf-8?B?cDIwaStZOUxsaUhLTlVzcmlIMVRwWURodTJnSnRpWkpPZHQwcXdreW9aenkv?=
 =?utf-8?B?S0lYWmJoZmtGcHhzckJVNWRoT3VaVE5wQTI4VFZCMmZNbTI5Nm5oZFNqUnkv?=
 =?utf-8?B?enI5bFlYcFRsd1VTejdtUVFTYzk1RkJjbmNEeFlqUytXTHJuZCt4U0orMFlZ?=
 =?utf-8?B?M2h2MTgwYngwc0REQ2tjNk9McG4vQ3l0UmFaMFB3eVo0WmsvNkl2Vlkrb0Yz?=
 =?utf-8?B?Y2UrZnVOYU1wa0dNemZFcHhKSjBXblZ6amw5cC82ZFpacCs3YlptemlUb3Vj?=
 =?utf-8?B?RW5YN2JNQXpxYytWN1ZDVkVTQ2hJVm1vUkwwYTFqd1ZBV1lXOXU5dUxzWEIx?=
 =?utf-8?B?YWlDV2xTK1hSODdVRzErLzdhZVdZRktqVldpNWhUejQxV3VxTHoxZ3ljQmJ2?=
 =?utf-8?B?Sjhwck90SCtLTkdlMzJEeDVESzlja1lXMUFSaERpSkJMRFJiWnJXaVp5OTdP?=
 =?utf-8?B?c293OHJPWkhoaHlkVG1JOWR2eGJWUHI0N0k0QThlYXVQNmR2T1R5Y3dsU2Fo?=
 =?utf-8?B?enhCZzBYMzJDVEpna2dPOVdCbW5hVmtQbVJQSC9keFlRVGI4dXdEK0I1V3Rm?=
 =?utf-8?B?L3k2NjRjR043WEFuYVRyeFdWdE93Uk13R01yc1Bsa1h3dUJSVHlsOVRpYUs5?=
 =?utf-8?B?NU1DcmxjekZOTTRNekZqOGM5dWs5T2t2RXhUbVo2QVFMV2FNang1UFJ5VUlS?=
 =?utf-8?B?ZHFEZis1YmQvRmdROWFVWWZwQnhuYnJJRFdPWkdhdUdvYXNBV2JoR2pFMFF1?=
 =?utf-8?B?L2ptUUppMDZyd29QbEZ6TDZHeDlWOEZwRjh1cjdNaW8rR25vNTRRK2plbnR5?=
 =?utf-8?B?cGp6aERYbUVibVlHZ3BTQlVCLzhLTEkyK2JyellsK3RYU2h6ZHZ3NWZxYVlZ?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 113234a5-c604-47ef-1a19-08dc4cfd3b19
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 18:56:08.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrHe7r5gs3wtxSAwtOLlAnhhC5ShPpwzSngALk90kRKdfgHXc35RJu46i0X5ZRS1NElNt1XxzD7yqitkLbTz39UwvBsmAuGPy0iSAJQzh1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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

On 3/25/2024 08:32, Michal Wajdeczko wrote:
> On 25.03.2024 16:04, Badal Nilawar wrote:
>> Enable GuC Wa_14019882105 to block interrupts during C6 flow
>> when the memory path has been blocked
>>
>> v2: Make helper function generic and name it as
>>      guc_waklv_enable_simple (John Harrison)
>> v3: Make warning descriptive (John Harrison)
>>
>> Cc: John Harrison <john.harrison@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++++
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 41 +++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>   3 files changed, 40 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 0400bc0fccdc..5dd45e06f0b6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -319,4 +319,11 @@ enum  {
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
>>   #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
>>   
>> +/*
>> + * Workaround keys:
>> + */
>> +enum xe_guc_klv_ids {
>> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> how should we know the LEN of the particular W/A KLV ?
By reading the spec.

> as this is the ABI header, IMO we should define that here along the KEY
I strongly disagree with copying the entire GuC API spec into the source 
code just for the sake of copying the spec. The implementation of this 
w/a (and a whole bunch more that will follow) has no use for extra 
defines about sizes or fields. And creating defines that will never be 
used is a pointless exercise.

>
>> +};
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index a98344a0ff4b..633e5fd9c738 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -7,6 +7,8 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include <generated/xe_wa_oob.h>
>> +
>>   #include "regs/xe_engine_regs.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -19,6 +21,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_wa.h"
>>   
>>   /* Slack of a few additional entries per engine */
>>   #define ADS_REGSET_EXTRA_MAX	8
>> @@ -279,23 +282,43 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>   	return total_size;
>>   }
>>   
>> +static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>> +				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
>> +{
>> +	u32 size;
>> +	u32 klv_entry[] = {
>> +		/* 16:16 key/length */
> drop this comment, code is self explanatory
>
>> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +		/* 0 dwords data */
>> +	};
> you can define size here:
>
> 		u32 size = sizeof(klv_entry);
>
>> +
>> +	size = sizeof(klv_entry);
>> +
>> +	if (*remain < size) {
>> +		drm_warn(&ads_to_xe(ads)->drm,
>> +			 "w/a klv buffer too small to add klv id %d\n", klv_id);
> this looks like our programming error so xe_gt_assert() should be
> sufficient as we don't expect this ever happen in production
>
> but if you want to keep the WARN then use xe_gt_WARN() instead
>
>> +	} else {
>> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>> +				 klv_entry, size);
>> +		*offset += size;
>> +		*remain -= size;
>> +	}
>> +}
>> +
>>   static void guc_waklv_init(struct xe_guc_ads *ads)
>>   {
>> +	struct xe_gt *gt = ads_to_gt(ads);
>>   	u64 addr_ggtt;
>>   	u32 offset, remain, size;
>>   
>>   	offset = guc_ads_waklv_offset(ads);
>>   	remain = guc_ads_waklv_size(ads);
>>   
>> -	/*
>> -	 * Add workarounds here:
>> -	 *
>> -	 * if (want_wa_<name>) {
>> -	 *      size = guc_waklv_<name>(guc, offset, remain);
>> -	 *      offset += size;
>> -	 *      remain -= size;
>> -	 * }
>> -	 */
>> +	if (XE_WA(gt, 14019882105))
>> +		guc_waklv_enable_simple(ads,
>> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>> +					&offset, &remain);
> hmm, it looks that your implementation here in patch 2/2 is different
> than suggested one in patch 1/2
It looks the same to me. It has simply optimised the the offset/remain 
calculation to be done inside the helper rather than outside it to avoid 
replication when all the other 'simple' w/a's are added. The actual 
behaviour is identical.

John.

>
>>   
>>   	size = guc_ads_waklv_size(ads) - remain;
>>   	if (!size)
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 48cdba1cbf95..a8d15f004b6c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -19,3 +19,4 @@
>>   		GRAPHICS_VERSION_RANGE(1270, 1274)
>>   		MEDIA_VERSION(1300)
>>   		PLATFORM(DG2)
>> +14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)

