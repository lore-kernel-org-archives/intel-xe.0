Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FDFC05023
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 04:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF210FA80;
	Thu, 18 Apr 2024 04:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXpgQB39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6587B10FA80
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 04:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713413804; x=1744949804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bJTx0UgJCR9MnS+8+00BGpy8O/H3e5wCd47xa4Hr0I0=;
 b=PXpgQB39nfgPD0uOzbGRma4oOa8DDnqGWKy3SvmrazJodjWSh3FWTkER
 kphFy4EmX8719qA4jK56x/l6Si8xF1eB76SSf2u1plqxaNdIbbKM1oRUr
 MA8VuDmeNhoMdjc7ktnAv28vL82vOoQyxHBgXDSBvmhVRvF+kWVFNrSP/
 mg/6z1gBEM7TksQl2+Q5R5fJvw9EqneF42Oa+bnF4ae7PZUw8b5O6sy96
 GJkCeDupJdVZjiBVDhWe/it1Yc3jV9Bxs5gEK6qoHSGmiyTJmlifhH9Jv
 9oEukfKs8d9LLg+72jE5hRoLCPEzWDsmryAY2hl4/BjTVniH/tQ72Ym37 w==;
X-CSE-ConnectionGUID: dtFGtZLcQiau5Vtz6iI5KQ==
X-CSE-MsgGUID: 5nNBz5U9QmaWap0Ntbf9Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19544932"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="19544932"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 21:16:43 -0700
X-CSE-ConnectionGUID: EfrDgosdRqOBaInlxnJkJg==
X-CSE-MsgGUID: VK1rw7NSQ+G1ZQq8yyvg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="23356698"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 21:16:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 21:16:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 21:16:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 21:16:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 21:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6jItYSploQALmzBu7G5S0PJNbo9JqARYRxfCHVHfZxKxwKyWlJKrJIlwK/tHDiQe7zN/Qo+crYLMZUVkoN2PW4eu3yyAA5ne2egFIZIjM3jCq5BYtzbXW9yoZoayX2/cUdvtc3xERTCdcnwQe6JaJogtAkoho/zLC0jss1IQtzakZBC63OMcR4P3Xf8HSe1HIjTurDUnDyL/Rht5PfErF/LfzWjhv4xGzTXWDZmPBlCZMdqgcZ1UahjvGXncqqMByHjNUIMNHYlQt7PhSBw+h1YJZ61fSlQ5TaX0IPVRVyPzKAmYYyQQPME7B/2rwwyCa7JFWgexaZgxnAZQMYiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va2NfzRCx1zBz6Tlg0qZV6SfZmXrrwh2QIE09v5em/I=;
 b=I7Ul516liOaJA0dGUqWgWJ30GBfIFz6Lwnji2TE9LV4eyFQdjkD4PLUGuiOOf33iYw4JBZFsCjtUZu+YjC4NDnTBuXADYAidGRni06t3XvHnzxtzmElLUN2F1xKNg27GC4tddL1gA6yu3rK1TUIemXfE4HGXNT87Saa2qg0ljOYEMl1k0cZL7G+qlOr+isbk0UGEe5rJ5b6cPWTTHYARy0CdCwtyl2jshQzGKEFeS8S1gv4eTkDBJNd9tnJNpWevzUZPtmJJhhSw5zOy0u3LB0XBBIamjuixw/5AMadbgK5pLgTKA6kVCO3nlrIbwQWPDAhHt6B4Fv26C5uL0c0uZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 04:16:40 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 04:16:35 +0000
Message-ID: <44845ee2-79bf-4641-ad73-ffb88a23ce0c@intel.com>
Date: Thu, 18 Apr 2024 09:46:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Define all possible engines in media IP
 descriptors
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
 <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 648e86dc-ee86-4bff-c904-08dc5f5e559e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+KSez7aluXxDPXbbeWOEOPHpLQXemveRvFAeAWNtjsSovnG6NsqbJJjtNHi2KxZChJ05X3L0hJFMkaZl+9kY98YI9LwSCl+wEnPlAyt198rt+kIR3/9awV6wf4laZcrkgF5yUKeqDgyKrcotOjZyW+gAEziJN94z6oITHiP9QczFEJxhneCFSdksxuuzJl10AfGRCSKEYPiO2NJCDKhVnHG+CubqRPkIvT9mW3X7YzR/0UtWrIRGSx+4n68onqRI3Qo3ZzPesinuOIDG6vAyJVLsU9lgEsCCB8uoNym7fGWOG4NW9wBAYGNdiaaAzWHTzRQCtSYIfmbBA9dHA2cyy+MUVcqG/2VD6LclcAiIKzKcKk6qrR27C/5PGiTAKv7+/+O9XR8uB5eK8oZV2dcqGGwhAMT8UAjT/TvR+78CpmZK/MRePs5ypBRlcyfxFgloJCvdY8mcsuRqGMlAtWG/D8bF6ytHtbUWZEwAHYOSXb/iWQ3y+iB+Nm/kXjWxRX6ShWaO9BBW37/KB/j3iiy5Ysrcd7dNiAsd53o1dyO8TxNbQtYewfVfpXVbcV2neoHWNwYgK7YQzOdVOXs6qDenGyQVUF8yKztYgc29CJopFUiqT8m5aPbFNsCLERge7ZfLYpvCjqEXgCTVTZ0yKr+AsOE0ZGHiSxCkoel4XQf4AY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VSNWpsL1VDTmk2K0p1Z29KY2xBcnlyeUdDUnc5SVB4SVFkVWV3UkhHdTgx?=
 =?utf-8?B?YW9ZQmtSdU4yTFlhMldxRC80cHNCNFpzaXVjOUhhRndNQ3RMY1FhR1VNS3c5?=
 =?utf-8?B?dXU1QXZOVlVpTjRScDJBN09jMEl3eHE0MmN0NFJjVkdQdTllQWNnN2dDLy8v?=
 =?utf-8?B?a2c4UXpWb0xpa2VwOWxTMThIenVnQk1xUTFLRWNVeVBMaVF3N3FhUWNJdndJ?=
 =?utf-8?B?S01QbUt3OS83cDhJd0l5bVNOYWM0SG5Sc0ZCRUd3V2Z6RVJoYlJMemgyVjRo?=
 =?utf-8?B?L3MrK3kzcFdyNEY4QUQ0c3lGTnpqL0praEIybzBwWnRKT0I2VUVNYnBHVVZF?=
 =?utf-8?B?T3cyVjhJUko4eUMvNVdrZlNseGNwQ09wa1BvMk80UjlxVzNRbWVadklTeXZx?=
 =?utf-8?B?ZDg5SmZ0WTEreUJWT29xSEdQN2ExRmltbEJubSt4WTNUdmYzbDBOM0IyRU1X?=
 =?utf-8?B?ZWNpK1k3MVJiS1FIcW95ZEhRWDFsRG43eUtXWXc4SEtKNjR5dVdvSHZ3b1lS?=
 =?utf-8?B?OUIrTmtpSW1peEVSUkIvbUtJNzVqeVp5Y3pzSk1kVUVXVVJGOFB1STRVSU1x?=
 =?utf-8?B?NHNjNzEwWTMxUTJuSlk2WUxWUFY1UWVKMmMzQm5BbDMyWUExeHJ5bzlsbXpy?=
 =?utf-8?B?NkZYSkJZWWVBbUpmSk5pNEFqQ0Y4c3gzUm5MZUZUaStLVE51NytXTWlkZVAz?=
 =?utf-8?B?UG10TXFBWUhkSDVVMzlCamlXNHo5bmwwQVpYK1B2citXbWdyWUZpVTZKNTkw?=
 =?utf-8?B?TlNIMkdlL05Gbjc2UVRiZFo3dXNyWVVjSUZnK0xhYktMa1ZLQ24rcTFKRHpY?=
 =?utf-8?B?MHNDdzJGTUZzcVJ0S2lNOWcwZjlSY282V0ZLR1pUNmdnSjJzYzA3aVU4S0Ni?=
 =?utf-8?B?SnV6a3hWS2FjV2E4NzZvbUo2WHBNS05wblZ4S0dZVVFNeEhGYy9sWmpHbjZw?=
 =?utf-8?B?dXZoMHZzV3RRMmFXNnZNNmRaZ3BxeUI1YzJmdFFjNWtXK1FZd0pURDhzT1pa?=
 =?utf-8?B?bXZ6UHNaWk0wSm5MZEtQT2hNZmxkMGpRQjFWd1RuMVdPZGJ0WUcyVk1kN1JJ?=
 =?utf-8?B?SXVyOHIrangvYUFHTzl3aWg1NlBEOXJud1loNU9uTE1GWmowQUVXdGN3RlJo?=
 =?utf-8?B?d1hDNE9sZ0xGS09nejdpV1o0Z0MxaWVIdmFlbFRPbFJ4dUNzS3kzOGhUdGJv?=
 =?utf-8?B?eU4wdTRNaEdHNWxWSG4zTys2Und5V1ZnemhoRFVPVHZoK3I2WWNXaEpwREV1?=
 =?utf-8?B?SjJxMTVIdGpOTjlOY041UFd1RGRIL0NBcnpSb2s1MFMzc01aQ3FPMW5GQTZX?=
 =?utf-8?B?Sm55ZXpJeTY3L0hIZHhmYWRXNmNOSzdlblFJZ2JEdUlkcmtZNkd5dXNWZmJS?=
 =?utf-8?B?TjVBQzFJT25tQVVXems5YXJiclhTN2xoSnNBQ0hyRTZ1TjZmL0hVYUlqQTl5?=
 =?utf-8?B?TVJxdWJ3NlAwd21DQm04K3duVjBoUWtUS2pQRllScW9pUmh0QnI2eVdCL3FD?=
 =?utf-8?B?dzdVa1g1ZGNNVzMwelhKTzVydGpCWDY1MGJrYmlzcFJ0UTdGNXN4WE1iTjQv?=
 =?utf-8?B?VnVJSm91LzBPbURFL1VVbzhmU3dzZjJMYmNVVkpqWHJMRHFRMlZEcWw5Rmk4?=
 =?utf-8?B?bllTazU5NWl6bEhlUGpNVnNIaFhGdkJueVRQOEFvOFZaZUo0dzBCN2NTUXV3?=
 =?utf-8?B?c1lTUHJCSkF4WTVNRTVBR0QvNEtncDFCQ3YwOE5BR0d5UVpFRHlCdUk4MFdV?=
 =?utf-8?B?UzVCeFF3U1hvdFRHbVFMVEdYSkcvZXdhOVd3UVdVNGZpS3B5c3lsdmJhOVNk?=
 =?utf-8?B?cFZsR3hXMU5JSDBrT3FXaWRPM2l3c0V4cnZSWG5BMW0vWmwrV3F4NkpuaHk0?=
 =?utf-8?B?Q3lvbTkwZWphWExlUnZuSUhvS21kQXdodGloSnZlemZPR0VPL0RwdUlTMFdC?=
 =?utf-8?B?VmxEUm1QVzZjdEE5VTYyMXFFeHk3aXRPZHZFTWJyWW1ORzl3VXMzU3ViYWFx?=
 =?utf-8?B?Ykd5M280NmpzNU5rZ25XTlVrTDRkczUxS2VhWDRKQWlIc0F4YXhHSllqcC94?=
 =?utf-8?B?UERiRnhBeHRSZUg2d29xTGNkM2ZjVkdUS1BwUDJiSWZkS25DZHRxSmN0amhs?=
 =?utf-8?B?T3Z0ZGwvcFBMOGRvQjNBT20wM0hUR3grb29mZ25tSEFhdmtKdmZ5bXZ5M3pj?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 648e86dc-ee86-4bff-c904-08dc5f5e559e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:16:35.0867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpRCEVH94jLC3lSZ12ZgNWcvVkWVEyQK5PtDk8OOXwIAx6V7VvpWjQU1o2lzvEskYFFHaScAnnCpYqkZX5t0hajJKaYRtlnabtqMyESwyGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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


On 4/17/2024 23:48, Lucas De Marchi wrote:
> On Wed, Apr 17, 2024 at 08:26:22AM GMT, Matt Roper wrote:
>> Rather than trying to identify exactly which engines are available on
>> each platform in the IP descriptor, just include the list of all media
>> engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
>> We still rely on the media fuse registers to tell us which specific
>> engine instances are actually present on a given platform, so there
>> shouldn't be any functional change.  This will help prevent mistakes
>> with engine numbering (for example ambiguity about whether the 2nd VCS
>> engine on a platform with exactly two engines is numbered "VCS1" or
>> "VCS2") and will also future-proof the code a bit more in case new SKUs
>> or platform refreshes extend the engine list in the future.
>>
>> Note that the media fuse register technically has an 8-bit field for
>> VECS engine presence starting on Xe2.  However there's still no MMIO
>> register range reserved for VE engines above VECS3, so VE0-VE3 is still
>> consider the "maximum" VE engine mask that the driver can support for
>> now.
>>
>> Bspec: 52614, 52615, 62567
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
> I remember we tried something similar for BCS and had to revert. However
> for media it seems we have fuses available on all platforms, so should
> be better handled by the current code.
>
> Assuming CI is happy,
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
>> 1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 3b30353dbc09..0d21306f8995 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
>>     .rel = 0,
>>
>>     .hw_engine_mask =
>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>> -        BIT(XE_HW_ENGINE_VECS0),
>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>> };
>>
>> static const struct xe_media_desc media_xehpm = {
>> @@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
>>     .rel = 55,
>>
>>     .hw_engine_mask =
>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
>> };
>>
>> static const struct xe_media_desc media_xelpmp = {
>>     .name = "Xe_LPM+",
>>     .hw_engine_mask =
>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>> -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>> +        BIT(XE_HW_ENGINE_GSCCS0)
>> };
>>
>> static const struct xe_media_desc media_xe2 = {
>>     .name = "Xe2_LPM / Xe2_HPM",
>>     .hw_engine_mask =
>> -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: 
>> GSC0 */
>> +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>> +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /* TODO: 
>> GSC0 */
Are we correct in excluding the 4 new additions that are part of a new 
HSD, stated in BSpec 62567?
>> };
>>
>> static const struct xe_device_desc tgl_desc = {
>> -- 
>> 2.44.0
>>
-- 
-shekhar

