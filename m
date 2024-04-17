Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75623C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 05:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C4811316F;
	Wed, 17 Apr 2024 05:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kb9Or6Mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AF211316F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 05:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713332175; x=1744868175;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FqGdjqhzUW5WWJM4/rad5Cz/6vLuCkBCWp0m/cSCHWo=;
 b=kb9Or6MvnjWRXJBHjyvBu/2GFq5ud3eUeN/QxAZ/wgfFJM8dyeHNiP9I
 mYXpt0bqMvhOykZBtLjYWNMCnLYh77unQ5l+pnELA1Hp7WQl+K10zeRwS
 l7ojgf1xaXNbKl4kyylsAgB3mOOx/3N8qS03tzVM+nucu2vVmmsZHfCnM
 6xF+yzngVyBjX3mfCY+eCezxk6wNHcXVC1WFGAk8XBoZv4yvf9MUqIcl2
 LMn5V/6LXu06UMi/b0/1TlC7HlQHWcR2qJD2TMzgsy6ujoa9fz6Z4LzAY
 JWpFMgSXZ0Dn3b8rAPXg8H5lPx/oNC2Cf4Z52BBHvWIaMIbYwqJ2XH/tM g==;
X-CSE-ConnectionGUID: wpTgjc+8Sy+pt1FY10Mnrg==
X-CSE-MsgGUID: Ao/ZbAYwS923+zbYYle+Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8964704"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8964704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 22:36:15 -0700
X-CSE-ConnectionGUID: GsIyvoqmTYaAnXOxSFW2gQ==
X-CSE-MsgGUID: JKG7JLIfRyCrWeDdWdUnWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="26945588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 22:36:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:36:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:36:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 22:36:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 22:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5ud6ChweBniVyoscRUckMjLnQyKDeHKWu9nnr3PHXsVQIx6oZRpQ0pM5RlJtaSPRWbLYzQ1SfugnGb6CjZuitSwjGy0qYIA4n93z0r4t3nDHyt2ChlkmNcWeQ4rJxkghEPUtW/n3p7vzSocQc0RXtD5n7Z8v8bN2KDDU15XuakYq/ERmK5lRTpJALVyU2RzWbWrTlPsC2tLhyMyfZ4hhB9NHibWNPRSOO19ZcQlyhtOJi+7TOD1BIOXZ/mb+pKKBvG4NsdwqsT0Ed6xucRsUOgGghwL80/snVf8rOMcICj/Cfz4ncgXYryLhJ3i4e52gNTAg0hH1dHoid1m/ggYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTxV5NNjcTfCS8SIx2JRJOeb2G+lHrbhCMVA/bPzAZ8=;
 b=dW4/4n7EgQkzPbLd1nBshuoxJAzLxYP5o3VMNW+uHXsP6v/ETGMfsoo59RCL7a2a48UOMWL4cHawURVHm5+8y7XP8/JWQ3s/oTN/xQfD7Ak/glDpymdbMvbF1FmIeMdnU+X5Mk5+RbOOGirRwhIMlR5Hq8ZK0jrK9LczMR05bVLjOYfF3WGpdB4jfe1a2MoRoN8IPVVhoh3kl343Aq8FVQSJy69O7mdgR+xPEq8vI5jOdMkq4gsCybqQU6AjK6JgS4hvCkag0GTFj69xwSbNgn6+4AU47myG+jyEUGuv5u6ecf9+lVVHyNA6pcsFLqvPzLhviVnUf2DMR2kWkTcCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 05:36:11 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::3718:5daf:6e25:6127%4]) with mapi id 15.20.7452.046; Wed, 17 Apr 2024
 05:36:11 +0000
Message-ID: <4eb15074-e8d7-4882-8d69-ea36aafbf404@intel.com>
Date: Tue, 16 Apr 2024 22:36:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/lnl: Apply GuC Wa_13011645652
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
 <20d39c77-2a8f-4512-a352-b0b02eff0d35@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20d39c77-2a8f-4512-a352-b0b02eff0d35@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|LV8PR11MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6b5676-553f-4197-d097-08dc5ea04a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8J+ecY+kLz5iQfMb9NUg7igS0LYYeQOLrDDZhBsbyqO4dvMrB9SsA786mkmvW4ZFSLU+hS/tz87fLGQtPNMbFutR/YqxGdNxFwCXxxrVrVevYy2+zqrBlPXyH4u8XTggRTDzZ50TzPAL/G5HssFiSxgrYXHbWUDzfEhdJxwOJITJkQh5vpsHXdvyCe2AWOhbNEw/cpqmtEmcr5ufUrvMlAElVqKIaBHwncU9iVs4E8nvkD4y758lbW6YQgF46kF1mXIo5w26B62Fnjr4RxekOG9b/I1VzkwTQpX2EfyCOyiER6HgwyPALfsSJIO6ZYsCxvEb0nZ4swigaydSTvgGBjJCa5ZfnlQNs5ldzDKpTKJlMku4fA+rS6rfJNVD4dhQ1nZs8oMIHTc7hljLeBNme9bSOQuRrNbs0qdff0PsjTW/eA9lazEqPD2BHxnSHl1cEEF0oxyL0OIn/2BQEaIVbxAhB8LM+xwv0gcoBHyx6nxFaeDwNfYHTl1Ir1oqz9kQImdNXQn5GOOSAt4xmXNKAZ2xUIpmxwfflgdgQf/JwxB4L/bg7aNw3ERDP6nCLWLgXU1Xkj8zoeRINI2QbcsxTqw2iFvdKnAMM3Gkuc7Y4bk9f/+guM647X6HO6jWpjEMm7QTVX2d5npCparBrCk/pbPBEgljnwJWM12/2gicxE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2Z2bHFIS1ZBZUREb25hZmIrM2g2YkJybXVVdEFTOHRXK1oyT0VPWWlHcE1q?=
 =?utf-8?B?S0NUOW1uQUJHTVR1ZXU4MENka0tVQXl4V3pNZ3NNcEd3MlZCRGZ0NTNZc1V6?=
 =?utf-8?B?TkpnMzhLb3FkblBrVWI0TWRSMlVmUzNpcUpBQjlBMlY4L3I2UHdTV1dJVlM4?=
 =?utf-8?B?NVFNMklpczlmQWgxYUpOdG5qWkJVL1FBYnFnb0pVZEorY1dqa2hUMXR4bmgx?=
 =?utf-8?B?VTRRcmJXeDlIazdkRTdSaFJ4UXQyVHhUNDNjdnZMSXhpMTBDOStTRytBQ0RS?=
 =?utf-8?B?eENYQWswUldwcEVWbEplVzlIbFNQdStGOUxqUmlUeVRQMzUwOEdGRGRhZXFu?=
 =?utf-8?B?U3VXYllKKzR0eDlYRHR4QkZGakFUNkFvSFdMVUpYV05PSlU1ZmlWci9ORW1J?=
 =?utf-8?B?V3gxY1M1N3NuYWw4MkVlNmY1T0x2eG00Y2FvVkVKRnNOWFplNnRoemtxTVlx?=
 =?utf-8?B?OGpDQjRpcjJLRjhoaytJSkFjSjRGeCtqZ1hsZUZpRUVrbkdNbmpOK1d5aGNB?=
 =?utf-8?B?cEdzcFE1S0dUWmpNbW9pQ2hRYWx6eDl4djYrOU9FVm5Xd2ZUZ04rd3FOdFN4?=
 =?utf-8?B?TDl1SUJ5MVQ3aDdsUXpmenhmV1hZTHdxMkpoc1RNUWY5YWlDcUtNRW9CRlFy?=
 =?utf-8?B?NnlNMTRXeU12ODE3TUYzc1VKd0pxU2JVeXpKbjVzWlJ1a3ZqVjdaclNXbnkw?=
 =?utf-8?B?QWdBcjl2RC9lSDNMaEdpNEVOdEw2dzRsZ09IVzlvR1BVL0txaCt4bnVhbzdB?=
 =?utf-8?B?a0ZNeGxYcXZMQ2VYczMxMklmQWZpK1VJOHhVSmg0Tkc1L3FUbTZoeEFvYk1h?=
 =?utf-8?B?enhxQjFkNC9UeWdJcnFEN2xlVW41MWlxaU40VFdGa1dQMHhiZEU4NmlZem5n?=
 =?utf-8?B?RVNpbjhKZzMzbW9kOXR3K0I2OVM5SVpjd1RnOWdoVStDTk1Ea2Y3NFZhRWVH?=
 =?utf-8?B?cDF0V2ZYby9wZDVJaEhYWHlRRElzR25TcVlpazg0QzRiMmZVRURyazFVVk9G?=
 =?utf-8?B?dHRWNnorRkE4bHJPNGtHektWYWd6d1gxQTBlT3ZRdkRCUXRWanRwWWFnaWll?=
 =?utf-8?B?cktYQUdkL0ZtUk1iMERHOTNlL2RIYmdBeFd2eE4wRzFYUWpoemplcFhFWm91?=
 =?utf-8?B?RmFvempGMHNkcTNZbW9mYjRuK0VHTDYxQjJJelEveGpTWVpYQXFGcW5Cak1L?=
 =?utf-8?B?c1F5WnlrR09sNWcwekIycldqaTBMZ0d5QkQvZk0xODloQWNqKzFpUjl3NDgr?=
 =?utf-8?B?SzFQNzUwbjhpZTFPQ0lBaG1EWS9Uc29kQmtSemZkaVAzT08xVUorV1gxbFZG?=
 =?utf-8?B?NGRWZ05WOW5SWWJSckRjYm5kNG1jQ01XVUJXb3dLTTYwTy81LzZhcUpVRWVo?=
 =?utf-8?B?S0VURDFYMjJSNlR4WVNOM3ZEbDhvWENFR28yZGJHT0hKSzUwWWRzZmZrdS8w?=
 =?utf-8?B?RE9sMHRpS0xYNHdzNTlEUWZOaVdaTzBJRkVzNnprRTRJU3JMZysvMWg0NGVT?=
 =?utf-8?B?SkZlcnVwRjQ3c1VmdEJUNHA3T1JBV3VYTkdNeFlMNVB3YVY0eGhiaEpkQjJC?=
 =?utf-8?B?MERsWWVsMEpaemFjbE9OdTMvS3ZXcG5BcEV1aVJIZWsrbEtKMDdlamZFNTBi?=
 =?utf-8?B?Z2QySHhIalVIdkJZVCtyMEo1UXhkcWh5SGE0NDVKdXJEcmt0YzZkQ3REM2lE?=
 =?utf-8?B?WStIYXM3WjZ4cUw2NnQ3bGtsTzVjTlpORXdxeDRKOGo4ZndUZ1NtZmpEUkhS?=
 =?utf-8?B?dnhWaFY3Vkx1dkpJTWszOFYrQ0J3Rm9HY0IwMVJiSVFWSEdrZVVEa3VVUVZP?=
 =?utf-8?B?NGpJUVNLRlVDNEx4TlhGOFZudndyaDdQeS9tb3JPWGFTZEUwQnJzc3hSb1pM?=
 =?utf-8?B?TkI1MzN6M2plNzRWSGM1andXZ0RLa3k0d3Y1WE8xYVF2eklqMVJ0Z2Fheloz?=
 =?utf-8?B?UHY2ZE9vQWFEYlFSMUJvZkpGUW5mQjF5Nm9HQmd2a0M2U3FodGliNC9UeDc0?=
 =?utf-8?B?SWxmMkpSR2UwZVlVaUgzT0YyR3Rqbi9GcWpjT0RxY0ZiL2s1QkZ0L2xJQkZX?=
 =?utf-8?B?Uld6cEN6Vk9xeklCcTNWOWE2bXlac1BlemwrQ0IrenpyMCtJaThaWkc1SE5I?=
 =?utf-8?B?TldWUGozUUZxZFNwRkZLL3NQdVQvQk5Cd1d2Rk4xNG53TldxNS95NmQxRVBx?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6b5676-553f-4197-d097-08dc5ea04a65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 05:36:11.7110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9VfqgaPEjutF5SLsX84jCGAw95NQHOtiwfLRwh5KbCnIxAaIdKKPJZftbWgWzHb6lFGm2FRXssaFWMXc62S/Q7sPeHFY25r9ckbYcI0c7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
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


On 4/16/2024 5:51 PM, John Harrison wrote:
> On 4/16/2024 12:41, Vinay Belgaumkar wrote:
>> Enable WA for a bug that could cause the C6 state machine to hang
>> during RC6 exit.
>>
>> v2: Add comment clarifying the WA (John H)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 34 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>   3 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 0972113f6b81..511cf974d585 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -326,6 +326,7 @@ enum xe_guc_klv_ids {
>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED = 0x9002,
>> GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING = 0x9005,
>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE = 0x9007,
>> + GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE = 0x9008,
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 678ece366056..4e6fc69a4710 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -282,6 +282,33 @@ static size_t calculate_golden_lrc_size(struct 
>> xe_guc_ads *ads)
>>       return total_size;
>>   }
>>   +static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>> +                      enum xe_guc_klv_ids klv_id,
>> +                      u32 value,
>> +                      u32 *offset, u32 *remain)
>> +{
>> +    u32 size;
>> +    u32 klv_entry[] = {
>> +        /* 16:16 key/length */
>> +        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>> +        FIELD_PREP(GUC_KLV_0_LEN, 1),
>> +        value,
>> +        /* 1 dword data */
>> +    };
>> +
>> +    size = sizeof(klv_entry);
>> +
>> +    if (*remain < size) {
>> +        drm_warn(&ads_to_xe(ads)->drm,
>> +             "w/a klv buffer too small to add klv id %d\n", klv_id);
>> +    } else {
>> +        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>> +                 klv_entry, size);
>> +        *offset += size;
>> +        *remain -= size;
>> +    }
>> +}
>> +
>>   static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>                       enum xe_guc_klv_ids klv_id, u32 *offset, u32 
>> *remain)
>>   {
>> @@ -327,6 +354,13 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>                       &offset, &remain);
>>   +    /* GuC will restore register 0xB04 to the default HW value of 
>> 0xC40 */
> This reads to me like 0xC40 is hard coded in the GuC. I would prefer 
> something like "On RC6 exit, GuC will write register 0xB04 with the 
> value provided. The default value for 0xB04 in bspec is 0xC40, so use 
> that."
Ok.
>
> John.
>
>> +    if (XE_WA(gt, 13011645652))
>> +        guc_waklv_enable_one_word(ads,
>> + GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>> +                      0xC40,
>> +                      &offset, &remain);
>> +
>>       size = guc_ads_waklv_size(ads) - remain;
>>       if (!size)
>>           return;
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index eb647d5a1e16..12fe88796a49 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -26,3 +26,4 @@
>>           MEDIA_VERSION(2000)
>>   16022287689    GRAPHICS_VERSION(2001)
>>           GRAPHICS_VERSION(2004)
>> +13011645652    GRAPHICS_VERSION(2004)
>
