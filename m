Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1852CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 10:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879F410E655;
	Thu,  4 Apr 2024 10:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqJomGYb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9907610E655
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712227992; x=1743763992;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Ndsgdz1TCyTF+Rc0Iy5TP7vCSE8tQrXjPcDNk0A69A=;
 b=RqJomGYbx5B4mx1psMKsTH1MvSg+ptF4oUf5ZqeGdEtJ+RSdZjRxctDq
 YWGTzsuU6I1rTV1POjXzE9vsn5kVjaqAFxgHaTJMhviBvJEFv2VSaWveb
 Vb3gxFm82eM4Jr8hC1DOttoy/jWtfjOoj1lJk7O9bXQtlPPiKC2xshZy5
 bKW3DJGnYzv/G/Tx1A1/YI8TykbF14vOXfZ6iE45P7Pez6czqaJr8rbf1
 gl1HAe620hNmgf2os3rdgdlmRX1QeJaK3v6PDg/TA+kFGgwjPfEKvWzw+
 O0V/Bn17BVYKTjukpE0FJsJb/4U3yP3PrIQCD5fRegtrUZgcyJfTxQ+dJ w==;
X-CSE-ConnectionGUID: S2gF1J8STemB9TViXInb1w==
X-CSE-MsgGUID: BM20plp2Rp6/ZmGoFUCPqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7362382"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7362382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:53:02 -0700
X-CSE-ConnectionGUID: WeKYwoMtSEe+OHd2xzL43A==
X-CSE-MsgGUID: 5R2s7coVTeqR7/kANU1dQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18719544"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 03:53:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 03:53:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 03:53:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 03:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4S9TT1GFDZlN3NTIGhDmoLD+W6YqKQScpsXjTZ4YiF+mJ1HCgaJogj/xZpKqWICog1P2Okv7JULVNaaBZA+XyyPwPzDNe/jlyNl6sEV4fwEyFW7HDroEfEMhcQBcCx2nADDFJ8m+0yhcQr0BUGzlMJR85tUwzXk8cqZ+0CySlAwb4EvsKt+dTMopB2J2NESafGXF6deVGH8kbGWN6rwLedVBcQ7h7wA1WgvOmpQvJpcmS9q9i8h+dUKdSCb06UC2no8BSaI7AMvWn2u0yKClc1ioaUw39ZwmCHSGDMP4j52cWxYk1Rue3PgcjINv4psF9jgZ6tUneqfzWB5q4B6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyK2qAydF0qdhfZiRzLpH7HyUi9WfqPWaUu3K2WFkXo=;
 b=jOJXkcG23Iwa+2VzddlG6ZXgpCMcB9Oji4MejRXOR32QHuwy9eaHcOhwac53a+ny4nb1wvQV0uoT30XQPd7hIuTtjYqEoohhTdvJWQPyUKVjBv6vnmcMnpMzne8amwwE879z5NwvHvWv9pphv6ZEUBSi5dHyIUpGm+Z30A14wsoLXZ+DsLw4CsnJ/dasNRg2vmfBy2cMxE1QP2kpuq+cT4HKGORaW8x9bTYrlDq2QHD5zZ/jqqQHoqpr6kvD8c2NJJBNJQIbWnaQz5CWJ/fJPBW5XY1vtXPd8bCNXW1koLr9nsl0Xezs7EGxyVNm8iHu3fTlqrgDvYq3AruQFjjf1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.24; Thu, 4 Apr 2024 10:52:31 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%5]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 10:52:30 +0000
Message-ID: <fbc0dc1a-d3e5-45c2-a312-a191938ea286@intel.com>
Date: Thu, 4 Apr 2024 16:22:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-4-karthik.poosa@intel.com>
 <4f66f854-1f8c-453e-9771-245cf677a828@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <4f66f854-1f8c-453e-9771-245cf677a828@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|MW4PR11MB7151:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjIZeepnWomSB+SZncr3GOX1BaIZ78VI0w/h+MZKu64UkCZrQ3JwjsKGaH+BJGpDqNk8hXM8AGbQnnOrDQcM+SOmue3xXDc9hDyEKE/Pa4EzqQbxNowuW1dZsNe3wRABD93kmZCqU4PYdCr4C+nLr6jOPbhnXoR7hJdQM2TpKPLM+yKJQPqfrOlKVH5M91FI2jm8CV5m7ug2b72s+kuUYtAhD54Y7l9M5SD4QMKiORS5hSG+he5TQnAoAOzex88G8NBIUzyRr0cnOOv7e8VpSgim46ZG+CYyNitnE6ba4Mr4tOFwPNhU7Mpn6OhiqnURG6liMpGUFLdf20VkjxOrXQb5HVjHycZXftMMxGTjmS3j+MgnvTeOvnqJHyhEywl3QLrKQxWMO9A3yjUiLuA2urUbHFBc3eBjpN9aX/WjzVzuHtA0jxUIjE4AgItQmCCKpdd/SVdj1bOpsZ8fXnZrhx5fqi6jFD5UMxhnagpSntL5ogb4bgQimUMhdzNvC+opBSruSVTkStJVZoX1+Tnk9Jh2DRtNJqjcrWwFv5jo382L0TI6BlRHwgggOEn/nsR6p8s2+GOtHo5rG/9hXs/XeKC4+16vC7CbONDPCO8kbeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdTMWd3WGRLeTFJNS83QUtXbjQrOGVkWmVxYVpyT1ZoWHRQeVVlcVRqZ1dV?=
 =?utf-8?B?OVpwcG1WTEZJVHMxZmcxeUMwQ1hNeXpRejhHMml6eG5iZ21uWmNXWEFWSmNu?=
 =?utf-8?B?UnplekZMNGNoSVFzTFplK2M2OGdQMTRXalE5cUFSUi90VVBPRXk3UHFrOGxM?=
 =?utf-8?B?bGE2R0I2T0VDbzJzL1A0Z0U0TUNWcHV3b2NzaHFZTVA5Vlo4YkxvbVdiYTdL?=
 =?utf-8?B?QUlJakdjaWkrZU94Y01nWXArcVRpeE5GQ2FCd0U3VFl4eXlpdDdCcWpDMDMr?=
 =?utf-8?B?ckRCL3BnWVcvZWtoOXRCK0xidWxFU3ZOSmtxK0NkenRaMHN3bWhPSGw2d3d5?=
 =?utf-8?B?cDNxWXk5cDZRNUZaRmpLMmZLZGhTNlZidzRuQ29yaElIRUsxcUxCUmdjYlZ6?=
 =?utf-8?B?VGVkVXFmeWoyMWdFQ1pJbnhiV2FiMStET0JXSTBodVBPUTUwZjJDdytISUJ5?=
 =?utf-8?B?R0NYWUVYQlBaakxvbldGVnBmSUR5anhNWkk4VXBWMmhFaTU1RlJWZmM0a0tN?=
 =?utf-8?B?eVhlTzc0bm5oSzdqdkIvSFlEcHF3ajd0M1JVa2tQL0ZnbXJRRmZJQVRVVDAv?=
 =?utf-8?B?b2dKZGhsSXF2SHgzRHVLOVBYcC9kcE1md3MvYUJTdWxhOC9nQTBOUkdxSzlF?=
 =?utf-8?B?WWliVXFSN25SVFMvMTZzdWJxNHZyTWd1VFQ2QXpGZUtNVUtKRnlJZlM5UlYr?=
 =?utf-8?B?aGk3YmlrN3RiZnhjbXhReFhva0RnalJkQW8vY2syR3VDTHl4MlEwaHBHUjNy?=
 =?utf-8?B?RUJkK0tEOXQyY0ltWFY0ak5Wa1Y5U1NTM3htU21QYW1UMWhHREJYL1BqQXgz?=
 =?utf-8?B?VHVTRi84Y2xhU3RINDViWW16bWdVTTdVRlJRRW96ZE1leGdsUlJjNHV3QjZV?=
 =?utf-8?B?eUdwTklLeU40SWN6dGNZZjhuQ0J6Wld2Sk00MTNiaXA3UlFzNk1vczRUdks4?=
 =?utf-8?B?cDlZN1FTRDRCVTZlelErNTBvR1g4T2hZYTBTZUpOcUFyd29wZUtoRHpxcU41?=
 =?utf-8?B?MDNTa3ZkNmIwcUUyTnBraXhEcmxxUVdYM0tFODFTcHFjeCs0a3BZTkZEOGFu?=
 =?utf-8?B?MHpuMS90VCtIR3J3VUNIcnN0UnV2RSt1Uk9BUjFjS0E1RERCOFp3dGJvdm5L?=
 =?utf-8?B?ZTBLS1N4QVNpam1sdkJvSU5Ua1FMWm82YzVIKzl2VEg1WEs1TTE4YWVQcXBC?=
 =?utf-8?B?a0FHb0hlL3NGWGVhVnFvWlA5Z2p0QWVzSktIMVlwQzY0eGJZcGhaR1NlbTAx?=
 =?utf-8?B?TDVvT3lKYzlBUHVSQTgycGxjdWNSV3E2N1hWU2tjQloySXNHbk1PeGtSbVZx?=
 =?utf-8?B?bXQ0cTMxbDlaTlRxeXRVeG1IbkdOMTBDbE9YY1NPZkhDUGpmNzlHU3NQYjhj?=
 =?utf-8?B?UTN0TFN2WkxvL2s4a2VSYUJuZlA2MlllM1NXSXpXUXYvOEtZeG0yZXdvaTZT?=
 =?utf-8?B?U0psVHUyM083RmtUTjNvUFE1bGhmT1BiTmNjWkZuSitCTHR2U0RlTVMwZDNu?=
 =?utf-8?B?VDR0ZjVvWFRpbkdsSGhnMFg4Q3ptaFYxcUoyc0VJK2JaVzJaYnU5VkFPTkVS?=
 =?utf-8?B?QjliVXBLbjJhd1ZHK1Rpb2k3RVlWclBYeHVMWkR0eFpSVzVyMXltTGNpeERi?=
 =?utf-8?B?S0xNcnloVUdyQUpPdisyeHM4S3NRbWtRNW5EQ1VKb2JlVG1pS2Z5dTdxaG5G?=
 =?utf-8?B?VSs2ekoveVZXREFmWGpGMGw3bDNyZm55LzdNTHV6MGVRV0c4Z3VyME5Kd1Yy?=
 =?utf-8?B?OTk1ZVlkU3hlczJjcGorVG92MGhlYkd0aWRjTm5RYnlIb3VWSjBDV2JUSW15?=
 =?utf-8?B?eWZqbndBaFUxemV2NFUvRUlnSFRGVHJIdk1yZ3JZOU5SaDhjb054VndTYnls?=
 =?utf-8?B?RC9rN2JQc1l6TytFMHBIbk9wWjJSaUNjQVI2TFVjOVdndlBWQllNbU1zOVVT?=
 =?utf-8?B?Yk5oRTNVNFdkZ1BCKzhlWTlicHM3N2VDYUovdFJwQ2hzNTg1aGVtQTVXSG9n?=
 =?utf-8?B?eUhvUndYbkRpVmZjMEpNc1IxNDYvN01YMUpla1lsdUxBdk9nNlJlaDgwT1Zm?=
 =?utf-8?B?ZXp3VDdaVEtQN3B0bmJRNExmZThMbEZBTlpxbXhNdlVxNmR5VmV6NHYwMy9v?=
 =?utf-8?B?dkVIKzRMeDYwNVhEUzI4VURaLzlLWlBFQjV6RklvWjUvaTBMRXR1cHhva055?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7cdd33-d4ea-44ba-9605-08dc5495536d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 10:52:30.7445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trr06H9F/+dDPDdPfTWL7W/wbqRXnV/YgqSJ74BEaFqWCmMU4SM5/kv0LQCU6Cy2NQxzy1NbeU9wsfPBeUpOrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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


On 04-04-2024 16:05, Riana Tauro wrote:
>
> Hi Karthik
>
> On 4/4/2024 9:24 AM, Karthik Poosa wrote:
>> Return u64 from xe_hwmon_process_reg, instead of a void return,
>> input pointer and a bool return. (Lucas)
> what does the second line mean? which bool return was removed?
it was in v4 version of patch.
https://patchwork.freedesktop.org/patch/586457/?series=131765&rev=4
>>
>> With this caller can directly assign return value to the variable 
>> without
>> need of explicit initialization and pass by reference.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 45 +++++++++++++++++------------------
>>   1 file changed, 22 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 2385f05d9504..114aadb54c8e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -121,31 +121,30 @@ static struct xe_reg xe_hwmon_get_reg(struct 
>> xe_hwmon *hwmon, enum xe_hwmon_reg
>>       return XE_REG(0);
>>   }
>>   -static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> -                 enum xe_hwmon_reg_operation operation, u64 *value,
>> +static u64 xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> +                 enum xe_hwmon_reg_operation operation,
>>                    u32 clr, u32 set, int channel)
>>   {
>>       struct xe_reg reg;
>>         reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>> -
>>       if (!XE_REG_IS_VALID(reg))
>> -        return;
>> +        return 0;
>>         switch (operation) {
>>       case REG_READ32:
>> -        *value = xe_mmio_read32(hwmon->gt, reg);
>> +        return xe_mmio_read32(hwmon->gt, reg);
>>           break;
>>       case REG_RMW32:
>> -        *value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> +        return xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>>           break;
>>       case REG_READ64:
>> -        *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> +        return xe_mmio_read64_2x32(hwmon->gt, reg);
>>           break;
>>       default:
>>           drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg 
>> operation: %d\n",
>>                operation);
>> -        break;
>> +        return 0;
>>       }
>>   }
>>   @@ -163,7 +162,7 @@ static void xe_hwmon_power_max_read(struct 
>> xe_hwmon *hwmon, int channel, long *v
>>         mutex_lock(&hwmon->hwmon_lock);
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 
>> &reg_val, 0, 0, channel);
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, 
>> REG_READ32, 0, 0, channel);
>>       /* Check if PL1 limit is disabled */
>>       if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>           *value = PL1_DISABLE;
>> @@ -173,7 +172,7 @@ static void xe_hwmon_power_max_read(struct 
>> xe_hwmon *hwmon, int channel, long *v
>>       reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>>       *value = mul_u64_u32_shr(reg_val, SF_POWER, 
>> hwmon->scl_shift_power);
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 
>> &reg_val, 0, 0, channel);
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, 
>> REG_READ64, 0, 0, channel);
>>       min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>>       min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>>       max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>> @@ -194,9 +193,9 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, int channel, long va
>>         /* Disable PL1 limit and verify, as limit cannot be disabled 
>> on all platforms */
>>       if (value == PL1_DISABLE) {
>> -        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, 
>> &reg_val,
>> +        reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, 
>> REG_RMW32,
>>                        PKG_PWR_LIM_1_EN, 0, channel);
>> -        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 
>> &reg_val,
>> +        reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, 
>> REG_READ32,
>>                        PKG_PWR_LIM_1_EN, 0, channel);
>>             if (reg_val & PKG_PWR_LIM_1_EN) {
>> @@ -209,7 +208,7 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, int channel, long va
>>       reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << 
>> hwmon->scl_shift_power, SF_POWER);
>>       reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, 
>> reg_val);
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, 
>> &reg_val,
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, 
>> REG_RMW32,
>>                    PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
> indentation
Fixed in v6 patch.
>>   unlock:
>>       mutex_unlock(&hwmon->hwmon_lock);
>> @@ -220,7 +219,7 @@ static void xe_hwmon_power_rated_max_read(struct 
>> xe_hwmon *hwmon, int channel, l
>>   {
>>       u64 reg_val;
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, 
>> &reg_val, 0, 0, channel);
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, 
>> REG_READ32, 0, 0, channel);
>>       reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>       *value = mul_u64_u32_shr(reg_val, SF_POWER, 
>> hwmon->scl_shift_power);
>>   }
>> @@ -251,8 +250,8 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int 
>> channel, long *energy)
>>       struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
>>       u64 reg_val;
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
>> -                 &reg_val, 0, 0, channel);
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, 
>> REG_READ32,
>> +                 0, 0, channel);
> indentation
>>         if (reg_val >= ei->reg_val_prev)
>>           ei->accum_energy += reg_val - ei->reg_val_prev;
>> @@ -278,8 +277,8 @@ xe_hwmon_power_max_interval_show(struct device 
>> *dev, struct device_attribute *at
>>         mutex_lock(&hwmon->hwmon_lock);
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> -                 REG_READ32, &r, 0, 0, sensor_index);
>> +    r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +                 REG_READ32, 0, 0, sensor_index);
> same
>> mutex_unlock(&hwmon->hwmon_lock);
>>   @@ -367,7 +366,7 @@ xe_hwmon_power_max_interval_store(struct device 
>> *dev, struct device_attribute *a
>>         mutex_lock(&hwmon->hwmon_lock);
>>   -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, 
>> (u64 *)&r,
>> +    r = xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
>>                    PKG_PWR_LIM_1_TIME, rxy, sensor_index);
>>         mutex_unlock(&hwmon->hwmon_lock);
>> @@ -483,8 +482,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon 
>> *hwmon, int channel, long *valu
>>   {
>>       u64 reg_val;
>>   -    xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>> -                 REG_READ32, &reg_val, 0, 0, channel);
>> +    reg_val = xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
>> +                 REG_READ32, 0, 0, channel);
> same
>>       /* HW register value in units of 2.5 millivolt */
>>       *value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) 
>> * 2500, SF_VOLTAGE);
>>   }
>> @@ -769,8 +768,8 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_device *xe)
>>        * so read it once and store the shift values.
>>        */
>>       if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, 
>> REG_PKG_POWER_SKU_UNIT, 0))) {
>> -        xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>> -                     REG_READ32, &val_sku_unit, 0, 0, 0);
>> +        val_sku_unit = xe_hwmon_process_reg(hwmon, 
>> REG_PKG_POWER_SKU_UNIT,
>> +                     REG_READ32, 0, 0, 0);
> same
>
> Thanks,
> Riana
>>           hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>>           hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, 
>> val_sku_unit);
>>           hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, 
>> val_sku_unit);
