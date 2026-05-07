Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA7CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E410E579;
	Thu,  7 May 2026 16:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUtk2wmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248A210E0BD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170838; x=1809706838;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yu0mTIKWULFjH8KZy5vhxHYCGjy85NJvPi8tvQtnUdo=;
 b=dUtk2wmuM34RbeEmJYOpYNi0Nq56n+dx3ouSjHFpc8uOcSYYf98ulimg
 x3yqtiojDeiydrSLslRYz4SCMLnjYxLgVEhArj+TyRYsmlw+zl4e0B3to
 mJhSCBC5+ON7Cx4CsRV/NuATQ3dA+kvLZLJonrzv0LTcgO9L+kTSfZIsN
 MQpuHKbLRY5YQ7fY1dKesnCwurU4Sz6zQMxCSDMHonsszl5ZvliL9Gfq/
 ycy0DkTxY2qTGk0TvzwKUIJMJrW72kUVUmCwsnXxdLH9+T7SxUXk1coYr
 ZozQTTYgudV2D+i2aRdOfNAvKJDR9rHghrUhMMIg4yEgGsbr4VUitu9Iy A==;
X-CSE-ConnectionGUID: ZzeZUG/OS/KdHKn/hct5bA==
X-CSE-MsgGUID: XFBVrqW3SVqVmB8t59q56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104587631"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="104587631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:37 -0700
X-CSE-ConnectionGUID: qtIvoFn+RNODC4butgLapA==
X-CSE-MsgGUID: ttWf0bsPShu7JTUI1fP3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="274636667"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:20:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 09:20:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 09:20:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDenHtB3q3sMpL1l57yvbQV74PJilAoPKisSHuZd2JVzYJgXmTe650YApCdnCAY+hzYY8dabQ6jE0dR67hUXan0opUPZLRgrNVWy9U7qSWVyQuILEnEJASXlfR6sFgTn0ThlcrrnLF73e+7uO3N7rs1pA2nAecq4nT+nzKzizBOcyv7mrDcKBmUuB6N2HNa1gtKLNWVLhfqISaVib6glKWF6rWwEWHMeqZ+8m6rkU/URxg3+z9Ddkcf7X0Sd50eKAKpJHsQZv6iNDIJbtNJduU0DTRvzsg2n93Cmtix0JBF6m+NiiRT+V2djyVwtDHLCzd8sbAFJXjxJv3PQEXOWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qYTCWcaz9K/eUZcFCPAa5sKtKdZkyqI2n2iQkTOLgA=;
 b=U7CVwwMLrTwPrB5814t4ObhXyy2YYoNCwqMNAjPtJJP52FiJQM25qOGi1xA5r2+FCG/i09KUcCeUXc3kGJnD4Tptz3VKWpx8K/XhTl6xY09bCXVI7njdIgejiz7gSleFpFRFRKqOYA9PrkKUfG08LMlUQgHRdI4P0NeGZLwOTwLFlSMI3LWXOO+VfkNNlACYVnjktz/FUYmmeYQAQdQ4bDDBF205C7UyPo1bq/j5P8Noc8qmAiM6/JUIq+ZaWw+lLUl0ayPq6LHk847wXqxWuldJFeqldaWsFWpXaVhMLyd3SS7tVBm6UEe7pemY5XT1CVEmakmPRBkmZAdG8XwKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 7 May
 2026 16:20:30 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 16:20:30 +0000
Message-ID: <dce056cc-eb59-41b9-ad01-d8a0cde7a5db@intel.com>
Date: Thu, 7 May 2026 18:20:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] drm/xe: Engine class and instance into a u8
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-7-matthew.brost@intel.com>
 <e9b9b4da-9604-488b-89fa-8e69e8e4c432@intel.com>
Content-Language: en-US
In-Reply-To: <e9b9b4da-9604-488b-89fa-8e69e8e4c432@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0270.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::22) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: f11a4f66-a977-49f4-3a3d-08deac548e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: sO49XiBrdqR4sdr98Y9TGc86+bxQFxsxb3iJgbsb63wjbzcDOME3GJovDktQY5ebMvkNz4ZT6/vQLaxNPeqbG+0KbD0eAXgFpaOmsihUJnf306sotA8o40I9Ai1svv1tMP552Llk/XEpHlx1yZk3XDoNxDWBbmWhtnKixKzaENmJ5yIl67B4xIqhFyj83Fm8ovjxjsg46xkGGe6kl2JC4IcRQWHsogYN9k3gErlGjijoGX7A9DfQ+di2kX2ODJUDvEpfgkxh1LZaY5QaupkQ7YASy3hUzop7OZmuhAxm5rIBG5/ASqdFMkAOBAe3z1wBBEcyqmU5z7ZCO9U4MlpIkudZ3C/MfbY4CG+f6Thrf4+GyfUwGLkrG13FSK/oO5Uwmp8YihqT1eTmh7qXQcxnZWIh39G5ixcYz0vYSmBCdpl22+ess+GZTdxoVCeFF1V7jvuNkLi+AAulPgjPC7akPTbQ/+hZ+KBOOzsTVrzxXvitPEhlLvpW17KPCazTn3IvReHIMfy28nRDXKoZxfE3qsEo7M1e3F7tH1OILJziMPBDYdp87lI4Bg06cT4JYB761ef78VemWBTDGKIQX3LEyApdIKy9RbjA8UhOpjpqS/zsM6rCoTVOlWOBb5SReZBowFRBssrbR30Apljkk6aYS5kEVFbEaYaPdFFvZUOCFv07inyjK2mXwZ6+/V9Xl271
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REQ5MnlzbFJ1akJXSElVNm1aRHFqeWtFRUpOWG1jbkFsVCtWVjNCaVkyWEtC?=
 =?utf-8?B?Z1Q4T2ZxUHM2WGhDYWlNS1FXQ3VGNUhFYzJQTElyeVZlSFZ0VUdmRmdLdGVZ?=
 =?utf-8?B?aUQvQXcwdW9OU2ZhbFUwNHVCK0R2UkFWRVlabGJGRU5CUjR6NXpMWVA2Q2pX?=
 =?utf-8?B?TG5OKzdQeUNVSTZHZFhYZFlwQVNJa2s1UW1aY0crTnVoMFh4RHloWCsxKzNj?=
 =?utf-8?B?dDdBWjhUYitFZlIyaDZlQVVxTS9OOWIvZ0RnU1NSa0ZkUWJHYlkwQSt3VHVB?=
 =?utf-8?B?N2w2WFpVeXJ3WDdWem16S0JURHk0aWV1d25iQzBRU3hucDkwTEJyY1VKMWlZ?=
 =?utf-8?B?cFlrZDEzSVRsaHFrZjQ4dVhoNjVZRzI3SU9keUlGbDNCa3BDNlZCcDZtZHJW?=
 =?utf-8?B?clZUcWk5eVp6SG1ZZU1kL1BxYUFUVWpiSTNPUFRMTGNMczlJQ09wRTBBY0J6?=
 =?utf-8?B?U0kyR216V1NIYm1UaTlGWGc3MWJSRTVGWjNPalFveFlGVmZwS2k4aW1SVlBt?=
 =?utf-8?B?MjVsRGdxejJmTkIrRGZOTWxwQmIza2hyVm91VmxVaktiWXphbm1DWmhoUkhh?=
 =?utf-8?B?NHIvNDR6cGNNQ3p3STVndmd5VXY4dGpzYjFwVHlQb2tLNXVFcFRSUG1CODZX?=
 =?utf-8?B?TEFJVzJuM0ErdERUMGI3Z21XVU9ld25LWk5aSGEwTTMwclFyZUVJWTRjS1d6?=
 =?utf-8?B?RlBHNjhZS3RNQXlkWStkS3J5S0o0cXZsWHcvUy9ReElJb2Z1NUh0WmxLM2xx?=
 =?utf-8?B?clQ2b0JaNmVmMGRycTNnUEM2M2RmQnBLVG5UOWdsMytHWVlZTTdoS3NYVzl5?=
 =?utf-8?B?ZEM0NDZRbjlSWUJ5UnlVMUg5SHpIbU5oWmVzVVN1bnR4WWVRY2h0dVJUSTlL?=
 =?utf-8?B?MWFPRXJxZXdjQW9yUTZ2aHFPVlJXTjl5WUozQnNlQlhLRm9vN3JNbkhCQXlH?=
 =?utf-8?B?TUdENXE1bHhaTGJrSFdKc3YrdlRKaUxqQzhlS243cXhVM3hOWm9hcUVVdXBL?=
 =?utf-8?B?WDFtWndySEc3cWJoTWNQNUk1K0ZpKzUyWmpHL294bUN0em0xZWVvcTk3dS9n?=
 =?utf-8?B?cFZTWGNOYjg3N040b05zQlorNVNzTFFrZ1ZkUi8wTitTbkQrMm94ZHFRaHRE?=
 =?utf-8?B?MGFCaVN3a0VLemIwQkZOQmZueHJQZkc2S2NsTWpkS3JPNm1ROTV5Mmhya2lX?=
 =?utf-8?B?cWdDUlZDTWtJOHNGaE9KQ3dsYWNaaDJkOVc5dDFCRzUzVDN2d3YwTDJjaElF?=
 =?utf-8?B?Mm8yeDhFVGZ4QWlWbVVXWVpMNUJhRG9ldXRXWThCNXhLYVR0bCtQUGVPbXVL?=
 =?utf-8?B?NG42MUJ4SmYrY3lpZXVwN2ZVQ2xmMUc1TEpFd1lTRHRFTlFxcXBYR0NiQk9Y?=
 =?utf-8?B?aGJHV1hQaGNGdFJZWS9USFZ2azk1RHJzRnR3dWk3SkhHdURjd09zdVFwbHV6?=
 =?utf-8?B?Y2JLMEc1V0tNdHU2WnBNRGNqb2dFQVlGTHdvM0NrTGd1bXk3cjd6OFdJNjd2?=
 =?utf-8?B?aUxtZEEyNEtLalM4Y0tQbHhOZWFPdmZpV0xvUTBGWGJoZGxiRndPejRqVWhK?=
 =?utf-8?B?eFRGYlJldlJibzNIc21KRWlNNTZjTUpENFMrNW9aQ1hUNXZpUjVUYmZIZVNC?=
 =?utf-8?B?UUZBWnF2NDFDc2dDQVJ5L0hCU0NsaXFydmZOVmlrVkxpVjNwKzB0d25MN3NO?=
 =?utf-8?B?MmNrSFR0UTZZYmZlbUEvWm93cUJBWW9JRDZibDI4RCtaaCt4My96Z1JXRHla?=
 =?utf-8?B?QTFiOHVBaXlUVmh1d2hIcnZOcTNkZnp0YjJSbHdlRFJxeE5YOUR5M3ZlM1A5?=
 =?utf-8?B?N3h2QlN6RDdZMTM5K1dBRXJ2aG5qM0RXUGVKaHdvb3RnRHR3MVdqcUxXUEhK?=
 =?utf-8?B?dGc4TFh0YWQ3OXVNUHl5dlRuRzBFQlZWa1AyWkZqRjEwaG9tL1o2OTZMWDhN?=
 =?utf-8?B?Q0JORzFpWklOZWM2RVNOdDJUdEFIWWY3R0JTYUZhamRVUi93YjFJb3lnUTBm?=
 =?utf-8?B?ZmVsWFdhc25QTGozZGVEdFlQNnRhZ0k0bjRDN2NOTlZBZzVqd1pnSGhWenZq?=
 =?utf-8?B?QS80Q3oxVzJIc250VmdkN24yL2FRR2R4OCtqZWNMSDJNM0xhRnBpSGpDTWYw?=
 =?utf-8?B?ZGZRamdvbE14eldaL3NYaVBjeVBXZ1FJY1Jka20yQ1N5a3dkZUxhOGloUnY1?=
 =?utf-8?B?QlFWZG5ya3hEUnpnQU4vdUVldkFJK0VMRzVWRGJTb3R4eXVlVGRMd0lWVXEz?=
 =?utf-8?B?OW5NNldRZ2hwc2ZaUjVBdjNyU2w3REw0czcyUVZubmx1YVljY0cyVjhPVEs1?=
 =?utf-8?B?azNyZ1hXUHlyVlIzUGE1V1Z6VmVaWVk1czFjUEJzUmZvYTdBYXlUQVNxMUd1?=
 =?utf-8?Q?GCanc+er9K8231H4=3D?=
X-Exchange-RoutingPolicyChecked: SRkHkXI07q1IWu8JvlHdBl+TPspUrSAggO14QLNrhMkHbixR019SECSI+nmwg3Lidogdmp0NYPoL7khU3QPPdtVlbq36nOq8zyAq4CVICmV6K/U6XtaD+Kzent/JOcdZl3pk7+LplEg9T2OuMsujREsIkVVPav0ktO8Pyw8g+d/o8Eej9wQQypf/N1ty8jov/BM3IpJt80m+G1iQm1R4X5Bkm/Hxpj8+rxxW0b38B2uEhXMJKV6ua+HH9WWuQn20RxgqAwBR6cs2HXbjgQHH0buGc6Y4+0aZZbO2Zgw2rb0z4n8TbIMWEgOEDNVQV4D7X0Z7oLiKJaZRsTAlHy4YvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f11a4f66-a977-49f4-3a3d-08deac548e25
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 16:20:29.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBzO5xw90j2OYCZwpewAVSpDHwbGLRdWlmfWg51VdR4oq1/oM4LRdyoNI6SqEqtSiTLOvw28wFjjVpp//90qLztViOb6t+rWUvzlcrCR7JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
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


On 06/05/2026 18:04, Maciej Patelczyk wrote:
> On 26/02/2026 05:28, Matthew Brost wrote:
>
>> Pack the engine class and instance fields into a single u8 to save space
>> in struct xe_pagefault. This also makes future extensions easier.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  7 +++++--
>>   drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++----
>>   drivers/gpu/drm/xe/xe_pagefault_types.h | 10 ++++++----
>>   3 files changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c 
>> b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index 607e32392f46..2470faf3d5d8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -89,8 +89,11 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, 
>> u32 *msg, u32 len)
>>                      FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
>>               FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
>>                      FIELD_GET(PFD_FAULT_TYPE, msg[2]));
>> -    pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
>> -    pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
>> +    pf.consumer.engine_class_instance =
>> +        FIELD_PREP(XE_PAGEFAULT_ENGINE_CLASS_MASK,
>> +               FIELD_GET(PFD_ENG_CLASS, msg[0])) |
>> +        FIELD_PREP(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
>> +               FIELD_GET(PFD_ENG_INSTANCE, msg[0]));
>>         pf.producer.private = guc;
>>       pf.producer.ops = &guc_pagefault_ops;
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c 
>> b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 64b1dc574ab7..a6fa790774c5 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -245,13 +245,16 @@ static bool xe_pagefault_queue_pop(struct 
>> xe_pagefault_queue *pf_queue,
>>     static void xe_pagefault_print(struct xe_pagefault *pf)
>>   {
>> +    u8 engine_class = FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
>> +                    pf->consumer.engine_class_instance);
>> +
>>       xe_gt_info(pf->gt, "\n\tASID: %d\n"
>>              "\tFaulted Address: 0x%08x%08x\n"
>>              "\tFaultType: %lu\n"
>>              "\tAccessType: %lu\n"
>>              "\tFaultLevel: %lu\n"
>>              "\tEngineClass: %d %s\n"
>> -           "\tEngineInstance: %d\n",
>> +           "\tEngineInstance: %lu\n",
>>              pf->consumer.asid,
>>              upper_32_bits(pf->consumer.page_addr),
>>              lower_32_bits(pf->consumer.page_addr),
>> @@ -261,9 +264,10 @@ static void xe_pagefault_print(struct 
>> xe_pagefault *pf)
>>                    pf->consumer.access_type),
>>              FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
>>                    pf->consumer.fault_type_level),
>> -           pf->consumer.engine_class,
>> - xe_hw_engine_class_to_str(pf->consumer.engine_class),
>> -           pf->consumer.engine_instance);
>> +           engine_class,
>> +           xe_hw_engine_class_to_str(engine_class),
>> +           FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
>> +                 pf->consumer.engine_class_instance));
>>   }
>>     static void xe_pagefault_queue_work(struct work_struct *w)
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h 
>> b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index 45065c25c25f..75bc53205601 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -82,10 +82,12 @@ struct xe_pagefault {
>>   #define XE_PAGEFAULT_TYPE_LEVEL_NACK        0xff    /* Producer 
>> indicates nack fault */
>>   #define XE_PAGEFAULT_LEVEL_MASK            GENMASK(3, 0)
>>   #define XE_PAGEFAULT_TYPE_MASK            GENMASK(7, 4)
>> -        /** @consumer.engine_class: engine class */
>> -        u8 engine_class;
>> -        /** @consumer.engine_instance: engine instance */
>> -        u8 engine_instance;
>> +        /** @consumer.engine_class_instance: engine class and 
>> instance */
>> +        u8 engine_class_instance;
>> +#define XE_PAGEFAULT_ENGINE_CLASS_MASK        GENMASK(3, 0)
>> +#define XE_PAGEFAULT_ENGINE_INSTANCE_MASK    GENMASK(7, 4)
>> +        /** @pad: alignment padding */
>> +        u8 pad;
>>           /** consumer.reserved: reserved bits for future expansion */
>>           u64 reserved;
>>       } consumer;
>
> Looks good,
>
> Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>
Sorry,

../drivers/gpu/drm/xe/xe_vm.c: In function ‘xe_vm_add_fault_entry_pf’:

../drivers/gpu/drm/xe/xe_vm.c:605:51: error: ‘struct <anonymous>’ has no 
member named ‘engine_class’

   605 |         hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,

       |                                                   ^

../drivers/gpu/drm/xe/xe_vm.c:606:44: error: ‘struct <anonymous>’ has no 
member named ‘engine_instance’; did you mean ‘engine_class_instance’?

  606 |  pf->consumer.engine_instance, false);

      |                                            ^~~~~~~~~~~~~~~

       | engine_class_instance


Missing:

--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -602,8 +602,12 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, 
struct xe_pagefault *pf)
         struct xe_hw_engine *hwe;

         /* Do not report faults on reserved engines */
-       hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
-                             pf->consumer.engine_instance, false);
+       hwe = xe_gt_hw_engine(pf->gt,
+  FIELD_GET(XE_PAGEFAULT_ENGINE_CLASS_MASK,
+  pf->consumer.engine_class_instance),
+  FIELD_GET(XE_PAGEFAULT_ENGINE_INSTANCE_MASK,
+  pf->consumer.engine_class_instance),
+                             false);
         if (!hwe || xe_hw_engine_is_reserved(hwe))


Maciej

