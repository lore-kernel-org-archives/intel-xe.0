Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7C2C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 22:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140CF10F0C3;
	Mon, 18 Mar 2024 22:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akqPTgoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274A910F0C2
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710802087; x=1742338087;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bKic3oPqLhI7gW+O0QB3Xml/R/JLQCRXj2qv2+FKiWU=;
 b=akqPTgoHJ5GUoIsP74LLp+RULh4AtfUIMoBYRWyudCsQTZbRRsn7z+iW
 xsgZUnNV3OajBGqldYvwR9AUQ/voU2FtVI6FDb81Gj3cK8RwSzy95ETea
 rQcy3f0uFwRp/mI+aTtJitx6CAi7uJvDPWDCI+I4m7+iZNAzo5d4zl3oZ
 75YPlJLSpmFDcP/E1akac6+h+QHfvcxugfhT7VHkfOr9uyQk+97JrwOSp
 0y5/+nvzmFHGaKxZlZNsMsLfxexCoBP1+Z6y7JGu2Zf8QRk25K1loj4en
 sBvoMw64+A1V0TdwIuPqbNwyc5lSxPCVOkCHdrLg1q9WacW5RornA1wCJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5509949"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5509949"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 15:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18273698"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 15:48:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 15:48:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 15:48:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 15:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1t/P+F+YFIpy1eYuQBg1/ZDIfNdZCy2eE6JHj9PbmcIMfk9GiCiMpbMNPAs16ZqHpAPv2fX0vom78KFobUTLEB2YYYJ1IHMQvqTZaDFhYQ4zkqOt7M+KU69NVMfijTPRbUzCexsmFSl4ubyfeAqrkPUQkMaNhtvrg+Fkvchd4vFfiQ6PKGIn1pcHWAI6K8kt997qCPNapQkhpFUdnce3OsoG2evGNLVkhaEp1BPlOWUVzw+XsSxQri1Qj0/HuDdeFmpyDZHBqEmJQZgazGgLYW+CHDgIQ8La+CKWkk2USx1lrw8Jsp6pWf19CJNx+HyTO6ujOcQgHm2E4W1oSUXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMBNK354/jnZI8m3qcf9YCmhN+OItC6hxejdmQnKo5w=;
 b=U+1BdrWu7lpcTHQUPf3pF3NSeERl7zl0K23Mloccu9MHf/9ajwkgXWuOG8CemnOSayiGDCDtb/DWl4fYEvuBlSPYvhgIVtN8BhI6tMAQI+iGSMH9iDzs5TsdN3nG2UflMpqAtICND4r/KG8NgFBDoztCPQCUU19G+UJNdmYL6hzOPZLKGYOFLTRnw8bc4zkeJ/VV0zKCdIbQWHZFTwWqAOM4lwRxVY47pFqp3sMKBOarxQms5gVe+72txSWReMskKGqDXPqg9DpMzADmz1N8ctkwtC/G2mLFddwiD33YdTdlgstPBzZhHzHYlAT3g8y+FIe2LrandanhRjhwaNbGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 22:48:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 22:48:03 +0000
Message-ID: <995ef752-6463-496e-8c60-a7506d734263@intel.com>
Date: Mon, 18 Mar 2024 15:48:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Use u64 for offsets for which we use
 upper_32_bits()
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240318184225.3808240-1-daniele.ceraolospurio@intel.com>
 <c0397652-bd5d-4651-83e2-0828cffd0581@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <c0397652-bd5d-4651-83e2-0828cffd0581@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0084.namprd04.prod.outlook.com
 (2603:10b6:303:6b::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB6168:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUesJS0SjzQXDUklZb9xNz0ZuKFw+NINS2Bz86nzI5ZdP13XW6M+aZU747rzaSBAMZZZvD0gUtdzt8U4Msu863DnJoY5j/Wj/KEzEO7K8/L4A7pIszoSnDRc8OXeRxaG45TMKMDpuNtc36BaKKWvqhN5x4mQ6ozktzFWsfOqzr+GilwlqUp3H5l2SW1aCdASmHXqjS+DB8VRc0685i/twsFSbDZYdQtqMTc+GGxXeq0eSonRoulHaBKaUj51To+0l4nSFnqam6VUXt3Fylp4FK1VHR+tcOza9S4MwoeiGTsioJHOtLU0AOnoqvj4W/ewCVwWE0DjSl1FjL0+CQMvMPzqjo5nol5MmWSOc87dWT2Sw6m7bxeWxW6wzjCaP5XI4uSlMpSgrXxncOCUYSzpK9P7u7blTRsx7nopmKm6DaSQsVmg7bVgvC4sg2FBI6LKWIytzaUuDOCkPFxEhh4vwaFMZyZDqWShHm2Ojufy6O6QakZcy/k3suvBWSN9Z4haa+ZDBAM2px4DLncQ88Cb+PWlkHvsDzp+Uqluzv5ouzaYZjzmAkYqUlTLqnB+8dwubwLUKGfpcIC22Qk6VdPuaffnbn6s2KDhSA7fh5jIOqjYIAcbW2xq7sVo9l2k9xi6odZfDyDUBNYYw4PruVnJWsyM3y8GuBi3UPq6OAkeDpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlvOFppK1U3RWtUYVU4SFJoZUxPd2RnVldhVERXWDVYYTRXbEFRS3ZCMVl6?=
 =?utf-8?B?V080bXdtUEpWSWtpVElUSjYxRGtkVFUwYk5zdTkwYWRSVnZIMVdCbERhNXFS?=
 =?utf-8?B?WjNYY2tkQmRLYUdqQUIzelpYNU5CU2REb1IvYkNzdDdKUVdOaUx5R08wZjdW?=
 =?utf-8?B?Q043V1Nqa0Y0WWFLcHdBa0JSZWw3cklIT0JMREtNWktIMnRLK0xRd2l6dG5B?=
 =?utf-8?B?WCtUQ1pYTkJGZUx0MTMzUFowRk4zNkFyanNIdGZaMVM2QS8wUzNESXNuQ1k1?=
 =?utf-8?B?Ukd1VDU1c1R1ald4bVBZeEZGUFNreU1YYUdJWTJZTFg1TE9EdnNUbEloVmVT?=
 =?utf-8?B?aTlmZVVsT09sUHFKU0tyNitFcVBiRkNKdHAyclNydnk5VTgwdzA5UFBVT3V6?=
 =?utf-8?B?SGd3K2RWZUtVYytkOUtqTHRrVEhuZVNzaFp6Wjc1dVIzb2cvcGJYM3A5VGRi?=
 =?utf-8?B?UFJMRzNuVUx2RURPREVPcVpYOVkrTzdibTZzaG9tRlRCZld2VlBYYVRpODh3?=
 =?utf-8?B?SFJtUTZXbE04dkdiRTBkSmsyL2tCZmliVjlLZmF3VEdzWmlWRmNFaVFrSkVH?=
 =?utf-8?B?KzdidzUvbEk0UngzYVhBRURsWFpXVkRZaGF2cXJCcjhkTkVFMm8vakhwQ2NN?=
 =?utf-8?B?R3dFb2t6aHg5c1RFL1NNTnZMVGVNVHRaUmZ0QjVYYjJ5VUxBMHZYaDRhZ1Rl?=
 =?utf-8?B?MlYyWjBlRXoxKzNhRXYrMTVLUUV2azBiTG5CeFZ5bldMVWxRckExVC94WGE2?=
 =?utf-8?B?QXNrNHVtTHg3WS9WMEY2dWM0dFIzK1E2MFdKaVFNUzJOTmJpZ3kwaTR6L1F0?=
 =?utf-8?B?clV3U3dWQ3Ywa3owaVBNbDNGUDhPTGJPeUVkdEQxVURHMS9ybWdEaGQ0dDJQ?=
 =?utf-8?B?YmluVTVNa3JsN1NxNHFYN1pjd3BnSndzbzJkQkIwRVovM3AreDlzRmdVS2h4?=
 =?utf-8?B?d1U5MHIvUTcwS1RQSFJwUjRJS2wyWVdxbEZDanl0SUxQakNVekNCQmt6dEJX?=
 =?utf-8?B?eWFmOXFtRCtoVTNnR2VmTzNJekpzQ0Uyb1FsZnpmcUNmc2ZlaWtpbnR6blZZ?=
 =?utf-8?B?cXhyRzRONUNOam9vOFZZeVFaemN3a3pEUHBiek1WQUZCSXZobEZDOUpxVEZ5?=
 =?utf-8?B?SFRyZm1OV3V4VE4rRUJKMDJLSlB3UlRTSzJWZlQ4U0l0OXAzUEFWVDRwSzFP?=
 =?utf-8?B?Y2xtWHdFT0tnTURjM2k3RDlseldlR2pTcmdaU2dnWm5DMkNEWjErTE44b3F6?=
 =?utf-8?B?aHhvT0lRYWtLanFQaFVpSlZuWnJlZWJNT2p3MThicVNrY3ROa1JTbE81dnFI?=
 =?utf-8?B?d3g5b3VqaUt6NlhTWENTQlFxaUh3VW9weVppQ21rZzN1MHpBaVZPVDVkYVFk?=
 =?utf-8?B?TlpicHAyZUhHL1Qzem9DdlprSkxTVitKOXhaUW1iakQ3VDNhQ0lrUzQ5NHF4?=
 =?utf-8?B?TWU3ZE1mWHdUT0lsbE95UzYrSzI4Y1ZQdzBvVUI5OCtPSmtrbVVZOFhKWnF3?=
 =?utf-8?B?dGZtTlJJVC93VXlXNlI3ejVVTTBjbjZrdUFkSWVpWU9vamU4Q3Jsa2dFMEZt?=
 =?utf-8?B?VTFBZGJMa1RtSzRMWFIwd2tQSXF2a1poMjNiS2FxSm9CUUF6SnhCYUowQjVS?=
 =?utf-8?B?WUJSQTN4Nyt6NEo2d0xyK2ZNMjJBWXU4cXE1Q2JQbUN4U1ltNzZHYUhZaFhF?=
 =?utf-8?B?QkNCdDJudkJ5WE4zQkRmQWZUWkRQbE5YUThNSnFMUENlQkVXZXpoU0VsZGFk?=
 =?utf-8?B?ejF4Mkh3UEduUW1LUHBWWjA5WjZnSjlOYnlIUCs4MFMwM3dYRnhQMHdxMnRD?=
 =?utf-8?B?U1pyS3JNSGJxRFphVW5BRmYvOFduRXMyUk45VVo1dWdhNDJ5TEJqRzdWdCsr?=
 =?utf-8?B?ZWxQZ3YxT1dBRDhBb09XMDRXRGpySDBjMytPZ0duY3hwN3ZPQWgwYXJjYjR2?=
 =?utf-8?B?VndFZDNrc0E1RExidzEreTFpa1cydnFOam4yYzh5S3pTeDN4SGRjUGZjY1Zt?=
 =?utf-8?B?T1ZqaGhxVnVSRFhnUUdqMkM3M2NjZDVSTzlZT016bUJCdWtFSWxNQmlLTkV1?=
 =?utf-8?B?U2NDbHQ5NWIwNkZFaXk4OFJZZ3d3a2phbDJQOFVXQ2didXF1aEhzVUdPOVV4?=
 =?utf-8?B?VE5Wby9KTDZnSWFvRU9KckZVenlGeEpoQVFjc1lnZWZSaDAzUWVXMkxIM1JF?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4062d6c1-21cb-4d05-facf-08dc479d77fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 22:48:02.9512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTpU+9we+OyEF4HITS0lQDmT3dHiirYHuvXWlIxIoGFlXa3e1ImnAl1VuXEyqSGXbFCjjdfDBfymuQVtaqjD+sClfzMYN+bwMWip0YvdLcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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



On 3/18/2024 3:33 PM, John Harrison wrote:
> On 3/18/2024 11:42, Daniele Ceraolo Spurio wrote:
>> The GGTT is currently a 32 bit address space, but the HW and GuC
>> support 48b addresses in GGTT-related operations, both to keep the
>> interface/HW paths common between PPGTT and GGTT and to allow for
>> future increase of the GGTT size.
>> This leaves us having to program a 64b field with a 32b offset, which
>> currently we're in some cases doing this by using an upper_32_bits()
>> call on a 32b variable, which doesn't make any sense. To do this cleanly
>> we have 2 options:
>>
>> 1 - Set the upper 32 bits directly to zero.
>> 2 - Use 64b variables for the offset and keep programming the whole 
>> thing,
>>      so we're ready if we ever have bigger offsets.
>>
>> This patch goes with option #2 and switches the related variables to 
>> u64.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c          | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
>>   drivers/gpu/drm/xe/xe_uc_fw.c        | 3 ++-
>>   4 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 9ed939c20602..1dfef2c29650 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -74,7 +74,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>     static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>   {
>> -    u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>> +    u64 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> This one does not do upper/lower(offset). The offset is simply shifted 
> into a field position and OR'd into the u32 flags word below.
>
> The whole flags construction should probably be updated to use the reg 
> field macros, but I don't think making offset 64 bits gains anything 
> here.

True, I'll drop this one.

Daniele

>
> John.
>
>>       u32 flags;
>>         #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c 
>> b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> index ea49f3885c10..525e51cc7aa7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>> @@ -14,7 +14,7 @@
>>   #include "xe_guc.h"
>>   #include "xe_map.h"
>>   -static int send_get_hwconfig(struct xe_guc *guc, u32 ggtt_addr, 
>> u32 size)
>> +static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 
>> size)
>>   {
>>       u32 action[] = {
>>           XE_GUC_ACTION_GET_HWCONFIG,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index d51cb9a4a6b7..9d3771ec5ceb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -533,7 +533,7 @@ static void register_engine(struct xe_exec_queue *q)
>>       info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>         if (xe_exec_queue_is_parallel(q)) {
>> -        u32 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>> +        u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>>           struct iosys_map map = xe_lrc_parallel_map(lrc);
>>             info.wq_desc_lo = lower_32_bits(ggtt_addr +
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 44b8c5f58fd8..7e44c468eb0f 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -788,7 +788,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 
>> offset, u32 dma_flags)
>>   {
>>       struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>       struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> -    u32 src_offset, dma_ctrl;
>> +    u64 src_offset;
>> +    u32 dma_ctrl;
>>       int ret;
>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>

