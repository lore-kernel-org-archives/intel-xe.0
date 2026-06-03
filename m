Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172F0CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 17:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940C811218C;
	Wed,  3 Jun 2026 17:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgaYqFf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CAA11218C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780507095; x=1812043095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vj90gPR9yV5c7yi3A1BLVfegCYW6xubEjxOFcG4nvIk=;
 b=bgaYqFf2esqsGv4SU2V+m92hxVLbP5KVZwEpDpIF0AG0jx4w4hEbOJB2
 y2jLJk2AM5IV1pWxrzxVM1cvn8ZjNxBsyGAhr0oE4iD44HDys5lgJiIR/
 peKGJJ/lAWdneUWrHRp+VKfkUhkiVCg5pzyQHFrSV7No9VxcwdBpQT9cf
 lzUTUT67qOKHO79CZDn/g0acqbucEwZapLJJZ4xp74aSKNTvVmcGo/Dmh
 v99AiQfpQ0btXLqWy0ELgY8rfTOzm1EUkIw/jUySSZHa9WdDaKmXlc5y8
 6nBs94Ja0GVJe8dBdQslvXVNzxsKvhMqUSGM30Nv0KeIrsxfU4YRphdaR A==;
X-CSE-ConnectionGUID: RY3J6qKHTDmnIDaV8lGkcQ==
X-CSE-MsgGUID: UATnJ9ibTAy6vY4mHyA9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81452502"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81452502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 10:18:15 -0700
X-CSE-ConnectionGUID: Ox2ObkniTtOTlFDRzR7oFg==
X-CSE-MsgGUID: fz3h+XUnQRK3wRaW9ZgFyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244385097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 10:18:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 10:18:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 10:18:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 10:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1yuU/taHzmD1ZIYvTH4Rng8kF9YKiwgoK9RLGYuWj4e+02eMbarx4NBOIrr2kIlrYTrDLN9iDuAk1c6SWIw8mkC70XlV7VwR2PFapOdCXkFx/C/vXykj1u5QgmAMuuzmhgi8ehyqVbXSFuQ2E7vLKhUQ0lr+nQqeU0zYGxXUzD4XiSLZMU0T1Uj1zZDq+g4hDA0kFqE2tsdHPS46FdsbrrzuSTMJ2iDDZbmiMJEiSJXlNf5+nkS66S6J6juUk7fvk/xUDWkCgfv7BOX9gJJQrXPqSB7hYZRWVX8IyNGiFt7faUjaoVALOb4wgkxQliO5zjJDr4GaoY3Ar0MLbWrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qav0edoTwM0sTTYUG1e7ZKRGona55PeSSGhMGtnwBgk=;
 b=LLhpiqZg5bTuTYGH4xFpg/B8Kf0o5Ps/RyyQLFG/wRCvA3EiaZU4isiscBPBv2vosPvPXQXFkQ86G8TfPwk0iBgK6uUWdk0mbE96lpsBHRpFq3Nw3XhMQmfEdZlopvH/5fxr5du62dJD0FAYiFb4389vLMfXER+kSfVMkGN9+TIaga3VsbLE/zxxIY7T2RJh0CPBxbA+WvQqFvaWa2S3BOsag/s45xAkqxQ/6mTCji7oB7x1Hd49EBwZl3sbGqMdoiypGfI6ifGUmCbj4IxU8TiSV/YMVnfk9fJUFTJ+rAyDSbC10x+1DRxhPadx1Tynwq4LT2rpbLo2hteEz16UrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:18:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:18:11 +0000
Message-ID: <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
Date: Wed, 3 Jun 2026 19:18:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260603162619.1550794-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260603162619.1550794-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000144.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::88e) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b065ba-09ca-4901-d0f9-08dec19416db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: /uHkkRk2qmWl8toeclSsXvU8vXVQnYOlj9455/6VP85vJvDZCD+P1noAtuiwgB+S4OqEevp2/yIbz0wJ9o1Ces7QnlcL+IYEUGJSmsFnu/GHXm2qphMRZiaSC88OFDTp+7yeT1eXIWF1uE4+wBCxwsBHiUHlwS9xq0c6YcrhYiHIrpmVYaNzBvAH1mCyUsVLGRmdoqgfytmxT4t0BY9buiuldnMH+dftx8bONdrOdKheePczCfZLsWOLX55WjeP4aVrsubdC13zAGfHPv7aQiKmKwEN/9lkSEWt9ZqLL/7AwESULlPvrUpv0IxZ51DjK5RY3igPoQC8FZUKLQ/rDIk2vLgQuGpUkjT68i4rcMgDvNxgZZEjYMhMdH9SY0tEX+49zQAxh2aira+Iryshha+pt+L52qRU5yl8chitDlkmAvoqmOzuXV9C2WHfPFKn9RhIudm4ZMAeHlXTcQgnAI0/yNIiJ+iP8IKN84+hE8YklVQF79Lhy1Q+7VjrunoySsD8/yw2JY8MWYx4bErJdLvfFQRiuZRvjVg00ySQMmMZVA4jcni+UP5zfe078Yg5yMW/NHd5xPLEVI2KfO+t/TngQCzT5aYWTpKspt+VF9ftkRbnXk4HfXi898rsRLWWXiBPfLm0nFUq4JdGXjLr5hjYCtPoSE0aGtKJPMYvfoXQAOYFkuEA0IbDc0rJQP3LF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ellGeDg1MXhOUC90TDQyWnhHM1BTbDE2OUZvUm5hd0JRRndyMVplenFPMzkr?=
 =?utf-8?B?M1BwNUNwTGxkUTd0ak5pU0tZM1dpSWc3U1ZKdmFPUlNzZmY5RGFGbjk5dDNE?=
 =?utf-8?B?QnpOZmZPOUhKaEpGYUNIYytNY0lWZnNKT0VBUEp3bnBYWTNJdUFSSHJ0MHlX?=
 =?utf-8?B?cEZyeDhzaGdwOEd1dFpOdUg1NWpUcFVvaVVFRjh0K2E0Yk5Gbm9YeUhJZVI4?=
 =?utf-8?B?M0xjWUlCMTB2YXljYVQwL1J1YVhaSitwSy9aWDAweE1BMUpLeWEvZEkyeFZ5?=
 =?utf-8?B?ZmtuRzNianNZQzVIMWRQUjZ6UnlvdjY2VlBmR090dTc4b1l4bWNMRGJ3Y2lZ?=
 =?utf-8?B?UnFyMGh0ai9WaVcrYk1lTllNZ0VMeUZsT0MvQ3hJL3QxOWxKTHpaZ3NBV3F3?=
 =?utf-8?B?RkJlb3hSaDVnR3JmejBmQS9OREJoMUJjN2xmYTlKOHgrcGM5Y1hRNzdIRHZv?=
 =?utf-8?B?bzBwbTMxNnE5WFk4SlVwSEV3RUMrcmRxOVR6OWZMbXprRWNaWVVXZDNhVFB1?=
 =?utf-8?B?TnE0UG5tWTdoOUh5d1QvQkNQNjZucEhJc09WUjFxZnJDMnliNC9QSy9PcDAv?=
 =?utf-8?B?WHNpRVpPUGZzeUJ1TVdoQTlZZDVzVmpnVVpVa2VBOVlidkdXZi9FSHdXcVRG?=
 =?utf-8?B?Uk5iWVBMOHloVHR1WkFKTUYybm5BMXl4dUQ5VVM2K3FFTUNOWTZBU1hKMEhk?=
 =?utf-8?B?M3FYL3YraStjckhTVEh0ZDJWcGhVZTl3VTY3eml3WWRheUwvWlZveHp1Rks0?=
 =?utf-8?B?ck1SbUNVVUYyaWY5Wks1YXdFNDUrNllORStYMzc3WTlxaGhDeVZqdDBYVkx1?=
 =?utf-8?B?U3N3M0dVWm1TbUtOcGJXMEQ5NnFBRWlsSGp4bFFOUG1EdWFOYzVkSmFGYTVU?=
 =?utf-8?B?aDNPR2RNNjNHQnhySDQrVXZudnZXTmJpb2xyTlVMVDBHRmpNTEFhU1FucEJY?=
 =?utf-8?B?TzJFSjJHM3ZNdFVsVnNRcGV0dkZicVg2dURteUhSZDJ6eUNYR0RQR1AxbTh6?=
 =?utf-8?B?dHVWemRGbTVHQTBjaW9iM2JMeFQ3MEVoQTIyeVRreldaSG56Y2VQeUlHMW14?=
 =?utf-8?B?RWFHOFp6SGJJbTYzUWNYTVZJVVdZNktXaFJKNXY4eHNETVhpQUlwWEd4UUY2?=
 =?utf-8?B?bk1RRnpOaGpBWnNwUC84NWJRY2h4UFlGNCtwUGk4UXNJdGFLSnh0Ukp6Undw?=
 =?utf-8?B?RmpxU2QrRlZhY1ZzMUpiVzNBVzZXaStUTnFvbWF2cHd2TGN6WjAzOGJXRVI4?=
 =?utf-8?B?VTh2VmgrS3FoQVIvbHVOdEVraFk2T2d0RGJ4c2FxeWlXa05kZTdlckJJRXQ0?=
 =?utf-8?B?TmY2bENsYkFoVDArZ3pwMi8zT00wY2ZSUjZYTjRwUWt2OVlJclJmV1kvQjM2?=
 =?utf-8?B?aHo3dmZuUWk1djdzYnh2bWY1NU1Dd1B1OEg4akl2elFNbStGS2E3cStMRGQ3?=
 =?utf-8?B?bTRZckVpcWd1eVAxd1ZVcHBZalFjdlRUVnNzWkwrUXZzeXRKRHJwWWVhWnl5?=
 =?utf-8?B?SzdMN054dVdUdllJd1NqV3RTQnVjS1piR3o4bWhZQlZrVURnVURqeHhqaW1G?=
 =?utf-8?B?QkRYTStUQWZ2VzZYejU2dDhDRzJId1JIVGNBeHdjc0VtSCtwN05ZUnQzUGtn?=
 =?utf-8?B?SU44eU1zZUNpbTYrR2QzN2Ntd0YzY0JCRXlVSTU5ZWgwb01HMitiUHNueVZQ?=
 =?utf-8?B?SjdWdVVyT1pKVnViNXNGM0dPRVgrYjgzUmtUY1NNS281QVoxZWY4Q05Md29V?=
 =?utf-8?B?SmNHRys5NGNRVGdwYlkxdnRtTEFPTnV5RnVqMFB3QmsvaVRFOFRyRFBaY2pL?=
 =?utf-8?B?cGFhNTRMLzZTUjl3NjJvaTZxbGgwejRNUnA2amZaQSsxTnJybCtpK2EzSmJy?=
 =?utf-8?B?RWFvbGQreUxFVG93aTcrYnp1L3VYRUh3QUdTS3pUK3ZGbyt3VXBTN21NT09w?=
 =?utf-8?B?TVNzVXUyWHd2MDI5Sk84RTE2NTJDeitYUXJsaTFqUGVBemE3ZS9maHB3Z1ky?=
 =?utf-8?B?TnpqZk9NQ1doMkNMVUE3akFaNlZYMnc1Y0t6RHVsMGFNajV0d1BzV0g0ajRC?=
 =?utf-8?B?VXpTY24rZ1JjZTZGVFFFWjcyL1hzN2ZoUVRtSngzVTBpL0FNYzluNkZuVjhB?=
 =?utf-8?B?alhHUnVEbzE1RUhHSWx0ZEpMN1hKR1VzeG5YSW9jdlowRVBtYkN6cko4VzhG?=
 =?utf-8?B?blpHTmFpV0RobDI3aTNQRmc3YmZYWVk5RUtPdXRPR1ZGRGVjUTB6WUtzb1FX?=
 =?utf-8?B?ZUMvUWxZaC9hYUVTdEpFNk1tMFE2bHNyNitEVWQ1dDBPSG9yL2lLbHF5OTVF?=
 =?utf-8?B?VmR0ZndLWXIvSVV2aDBJT1NyU20zQkpGdEt1c1Y4cG5wSTlyWmVGd2JFeDVT?=
 =?utf-8?Q?AvpuVXTxuO4uUv/k=3D?=
X-Exchange-RoutingPolicyChecked: UBKLAQmFVk/ckA7caaIutI76T/rPjs+YWrysrFcWUzJk7IoI6sz80gSZ+LjQqP3x1ukJknsb8Wyza3LvjM/ua0UQooTKdWYLWLXBmEBgzptyvkQrWx2UqwzlIxI9DckP4GVWTjnEJkh69DgB1R39ckdQJfHRmtffbYvK+A5xZm9Bvw3MsKVMx+Du1WwKFvPZlFQEgQfGUBdfVvS3VeI626QHL0PJfHefeXx9cEf96yRUkBO23S4lHbg/4PB8Si/aAdHTncO40N9bF1q7RoVlRxnJEuL9jAein9jjQBxH78THhgGN9FG2y8MPlwBaMTjnUrZ+YF5W8v1/LKSXWAoXzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b065ba-09ca-4901-d0f9-08dec19416db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:18:11.8564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCJHXye1JnWzIrO4X2R/ptt7Y6Cihh+kbCvkJ711Mo84Et3hWwr4QoRAqqVsAHzFgLuPonA9kBUcWSTqRBBC9u5Fyol0ZU1rQ1LZ85qDkqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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



On 6/3/2026 6:26 PM, Shuicheng Lin wrote:
> Replace the per-platform ternary chain in xe_wopcm_size() with a
> field read from xe->info.wopcm_size, populated from the platform
> descriptor.

we might want to update check_platform_desc test to catch any missing
definitions of wopcm_size field in new device descriptors

> 
> Per-platform values are unchanged: SZ_4M for DGFX and MTL, SZ_2M
> for all other platforms.
> 
> This prepares for newer platforms that may need a different size.
> No functional change.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
>  4 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..f44c031e3553 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -139,6 +139,8 @@ struct xe_device {
>  		u8 vm_max_level;
>  		/** @info.va_bits: Maximum bits of a virtual address */
>  		u8 va_bits;
> +		/** @info.wopcm_size: Size of WOPCM region for this platform */
> +		u32 wopcm_size;
>  
>  		/*
>  		 * Keep all flags below alphabetically sorted
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3165686e3e04..6b7dd8661f64 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/sizes.h>
>  
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
> @@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc rkl_desc = {
> @@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> @@ -243,6 +246,7 @@ static const struct xe_device_desc adl_s_desc = {
>  	},
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> @@ -265,6 +269,7 @@ static const struct xe_device_desc adl_p_desc = {
>  	},
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc adl_n_desc = {
> @@ -281,10 +286,12 @@ static const struct xe_device_desc adl_n_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  #define DGFX_FEATURES \
> -	.is_dgfx = 1
> +	.is_dgfx = 1, \
> +	.wopcm_size = SZ_4M
>  
>  static const struct xe_device_desc dg1_desc = {
>  	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
> @@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc = {
>  	MULTI_LRC_MASK,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
> +	.wopcm_size = SZ_4M,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
> @@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.needs_scratch = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
> @@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.needs_shared_vf_gt_wq = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc nvls_desc = {
> @@ -450,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  static const struct xe_device_desc cri_desc = {
> @@ -489,6 +500,7 @@ static const struct xe_device_desc nvlp_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
> +	.wopcm_size = SZ_2M,
>  };
>  
>  #undef PLATFORM
> @@ -757,6 +769,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.va_bits = desc->va_bits;
>  	xe->info.vm_max_level = desc->vm_max_level;
>  	xe->info.vram_flags = desc->vram_flags;
> +	xe->info.wopcm_size = desc->wopcm_size;
>  
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_cached_pt = desc->has_cached_pt;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5b85e2c24b7b..35acb878c111 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -34,6 +34,7 @@ struct xe_device_desc {
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> +	u32 wopcm_size;
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 900daf1d1b1b..783bf37c87ef 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -48,13 +48,6 @@
>   * context).
>   */
>  
> -/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> -#define DGFX_WOPCM_SIZE			SZ_4M
> -/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> -#define MTL_WOPCM_SIZE			SZ_4M
> -#define WOPCM_SIZE			SZ_2M
> -
>  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>  #define WOPCM_RESERVED_SIZE		SZ_16K
>  
> @@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  

while around, can you add kernel-doc here?

>  u32 xe_wopcm_size(struct xe_device *xe)
>  {
> -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> -		WOPCM_SIZE;
> +	return xe->info.wopcm_size;
>  }
>  
>  static u32 max_wopcm_size(struct xe_device *xe)

