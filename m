Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD56FCDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99410F3BE;
	Thu, 25 Jun 2026 23:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsGlllGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA8110F3BE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782428509; x=1813964509;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sXabv8NUOanBvgu+jIMqiUjHxHp2gBxQhobTuG+uYU4=;
 b=GsGlllGLdpxGeYTru7SCp/WIBbR12570HcQ6DU4Y8SD3TvrdJN555izx
 viB7ebWDjYHNFtLcmJhVQ4D4gfZ3O44hDI8TRZFggnXu8P79mjMXTpee0
 +Rpl6N/fzlqs3r+KwVFvoG7/+iYluxYODYtCgXNaU7ks+unEfBE8LPjSC
 KNNl2jNcpHcMCScWkqC2bljsyG/V4ntVkurJeM2cSCvvf7NTmMdMC03wD
 jtJMZ/yDlUvLcXBAI1y9QVEYZQHN3JekKTTUZXUvd8/iN6TWRTkqjLNxp
 ZJQ1wxyBqpNBj+8p8hYDeL0rjgO0rhvMpRqbN7pqkgYZwWMs7eB0lWOo/ A==;
X-CSE-ConnectionGUID: LdcSk7qvS2aYu12lDBiojw==
X-CSE-MsgGUID: 1XvsG5uCRF+7zr48iRbgRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87070735"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="87070735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:01:46 -0700
X-CSE-ConnectionGUID: uA3TVuEJQu6VatnGGw6Q6w==
X-CSE-MsgGUID: PV050cK5Rv+mrw105Vcvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="250712876"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:01:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:01:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:01:47 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKPn0eHLae3BGePrfXGxokr8/IMyELZGTMWyDRT213kk0XKkoStrkaCZQPAotNQQ1wxtpV6T+dT15QrtWpIts6nMl3bl0O3/qao8k1cLE0lCnaRCfoB4PK6ppMhgId/zqRwPusc9s9pqLW493czD6RlwT7dG5hqrvzPsU6cBvspxT2J87mGNq7sqyFSM6lUS2bBXQqJkhtWsPxX3ALuLfxF5NLXSV5xlL7YFjnQbZLbsbEt7FC42PKivafJyqwdCRNK3n2Q4ecPxkRl8nB11WpNpwhakFDY09FSFSYkg3ZiayfLpq0yzE4QkuuFJ5N3bhH7ZzOEWl0v/8kquqyiSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXVzEFGnugOcGrBxScElDQ3U1v9mt989tWOuxhvXm1A=;
 b=r2xn4WIQFpSZ0yWaCPBiGI/llcsNPaTvemrzUESeI2sAHeXkh2nqzT9PaCT3FmOF8FWAIHKbgeiZOaZzINo+XT89Zkfz78VswdCrHriL7LxY7rc+YLdzKkaXhpNRBHf6/2mHB0mBa8g7fC1TrJk256pNjn5WfM2Q+Wjy15AIF6YNxIsnQ5f+oXUiIw/mD3IPb9aPIhqDmvqkZDC+ATz+ADY1ji5E/6azYyMEDoNunwKFKDpcJ/+9Tp0LKPg8GIxCg02rW4l+OD0rb/RsuGWOBk3zGe3Vs9VTuj5Li4C8KdyGhzvTpQI/cUihEd33TbGE55XR7koYpqKeQGnAWwWakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SJ0PR11MB5117.namprd11.prod.outlook.com
 (2603:10b6:a03:2d0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 23:01:45 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:01:45 +0000
Message-ID: <9f925de2-ef6d-4385-b18c-feeef1288123@intel.com>
Date: Thu, 25 Jun 2026 16:01:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/userptr: Drop bogus static from finish in
 force_invalidate
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260625224452.3243231-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260625224452.3243231-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: d49f4fbe-79fb-4a98-44d0-08ded30dba62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7xKrM99MxoB9gbqoWMETnodaFw2HJp6GjNZTTsZ7lcUBcWIS35N1d0RL/fxYWUA6M7f7K9L1dc60AWtFaxiWXDZ67vzXIS8BDPur7YilZBKRDG4cK1DYwI8WYCdxVtYJOBjG2eHARA+b4nzJp82q0AaWju3KAsTo+tXfmxkE5Keq4ej1JxfsqkugljMNTngBhqsokfpjSWZfSn2oDcP+8QCpmqZ40Qxg8GOqzEbzZ5vCeuyyG1LIBA9fuyUFhY2UYS+HmnA/Do0jTy//dLjIHSAGw0tJxrHFOnuK+hteUlqFOR0XxYU9sJ9sGAYr3r6V7mutjxGMxH/jCwlwU7XGX8IKRnL6adsuviCVTcxyDOIeUofopsbEPMVH57NEkFo1DJPAvX7hqf5X/Ya6/QeW6iYsPRXRVlCSQBRbYifSH1T6MhrT5yuH5SYopY8gBgSD7Qs84fVrIeI0WqoWle8wOpqHHE7jmiNKjFaJimMyp6oP0dQrKdBSuvyKwOoKF3Nhf4yPY5Tocm+6bLkuGQNKdU6KIeXBcJ6wwLcrkmGMrnlnsWQ2RGXOQv2jxe8q1OvG912VogSTRWfuHMhKm3LaFP+1rcBLu0xsScFpEdDblUiz+dGYNmT8E61oOlQYvjW5lNzOImW+AveKG9P54fQF6KjLFrKP0oiZEM9onxQEXjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUhodXN6YUhldEpBTzJDN2JNYmdTcmhYaDJFRGZHa29FTGlTWVk2dCt6NU5s?=
 =?utf-8?B?Q1pIUkxncG1iT0Qxc0JWdk0xbXFiV1VKMGUvV0dNTUFvNVI3VkhTZjluVE9p?=
 =?utf-8?B?R1kyNGVhMFdSV0QyRHlRR1lBb2xrcWRCRjJkUkpCQ0V4dFFaRE8vSkdHcndB?=
 =?utf-8?B?a0dXS3pzZ3U4UTdNZmdxUFVGcXNiWkcxSThwTGZnWUx4SUEwaFcwVHBmLzh1?=
 =?utf-8?B?VGcvY2pUTVpkdUZSS2hHUzRjQk9vajVlRG1RNXNFZEF1eDdZOEZqL2ZvOGlJ?=
 =?utf-8?B?KzBvd1FBMGtnUWVVM1NqNGVoTnpXei91eG1od2NwN1ZHVGJBT1hSdlBXVi9M?=
 =?utf-8?B?cGVCbkIwQ3lVUjY4RGM4UFJ5QjZMVm5ZVEszRUN3emRRN3lIMTBZUVQ4QXBw?=
 =?utf-8?B?SkxMRk9qUk53U1k4L05TSFJrSUZVRWNSelczNkdHY3U0MkxEdHJLU0hQRnRy?=
 =?utf-8?B?czRLdW1MRTZXRHJIZ21yL0dNVEgwTmFsdDM0SjVvMUJkYVl5WXhZbWxIQ3RX?=
 =?utf-8?B?Q0hINEZVUE5xVlQ5ODdFNDg5QkY5VjBneEFhdU41YW1KcE9KRGZoWk5Ha1Ay?=
 =?utf-8?B?QlZGaktDNzlRUy9yVEZRWVROMGtrOWkvZjJZTE9iWkJYMW9mL09FWDYzVDJ2?=
 =?utf-8?B?RG13WEFiaGp5YnZrdWZjZjlBQzRtcXpOc3JEck5YT1d3R0t0clp5eDFOWExt?=
 =?utf-8?B?c3l3Q0R2MTRGZVYyMTloZHJBNmZXemJab2JBTXA3eStTNWNqYmdnUGwxR0lT?=
 =?utf-8?B?eGNhYnlxN0RJU3lRRHluWGNnc1IwNXRyZExReHR3Ky9aR2Yyb2lyOHdlWXdl?=
 =?utf-8?B?WkxsYXVva2xaTnRBRjJvdDBXT01LdGJnTEhxZnJWc0xzQlgxbXV0TkpOOVhy?=
 =?utf-8?B?MVZBY1g4dXNzOFlFVjJ5cDFadGdQcnkwVi9MMW9nSnU2VEtZbCtyejh6Mm45?=
 =?utf-8?B?NVpIZHlVazJFK3BpK0xuOTIzVjFjcGZSUFhDNVBHZUM4S1JjczhaTHVabFFW?=
 =?utf-8?B?UUk0QkNZUGZNOHM3ZlVKM2hHbEh4QklqR1NCZEdiMFhSNTh2d2hXNTdETmcw?=
 =?utf-8?B?eFkwcHc2VW5LSEYxVGhCbjgyaTV3cEFVQjh0cy82Q0VBN05VZ2dLM1drVURM?=
 =?utf-8?B?ODZCSFQwTjdRb1NGVVFhWGNnTVlya2Voek1zbGQ2dzZmSEtEUU9XZmVUT1JP?=
 =?utf-8?B?VDFCbVdQb2dMVG1ROE9XdmtObndDb2RjN3FaeUFDTWs1L2wralBuV3h2Y0pX?=
 =?utf-8?B?MzhoeHJ6RmxOMCtLOGQ1RmdoUS8zVUViK0lzR2s2SytVaVhyOHNHeFo4SGtm?=
 =?utf-8?B?STNCbnYxSW9FT1BQSlNmMm9ZMVZQalR0SVQ1SDdVVkVsaDZqdHA5S3V1cVMy?=
 =?utf-8?B?cERGeG9RVjY5L1lnb01VRjhiNXBKdmpicWNSOGRZaUFpVlJLRTZ4WHhqUVdX?=
 =?utf-8?B?VDZNM2ZkaUN5MXZWQVhYMzV3c3ZZQ05wRTN6UzhTR29wUW9qZUN5bWFxN1kz?=
 =?utf-8?B?eUVBWjVaQ04rbVdPQXNtQTBQdEhxTGYwb3BVTGlUQTA2THNIWUlDNlg0OE8w?=
 =?utf-8?B?TGVBSVFYTVNDNGVIRVl0Wm5sNll6OElyTjVkZlVtRjRPdUFNRWxmSmRLdXI3?=
 =?utf-8?B?M2RmTlRhVVA3NUsyUmlKT294WHp0U2plMjdrbm1zNmEybkxQWmkyWmZWQWJi?=
 =?utf-8?B?LzJOOE4wSm1WcUdha3k4VmxGNWdXUnZjNVBVaVAvTi9iYjZaTTJ4b3BsOGxO?=
 =?utf-8?B?WFExelRqTXRTRWl4OGlHcWFndDIrdXc0RUIxV0FKelhjMk9QOTgxdWd1UHlu?=
 =?utf-8?B?ME43eFVnVTZrdE0zSW1xVTNVSVdnMmJHQThGTStnbW1rbEw2bUcrQVFrQk5B?=
 =?utf-8?B?Q0Z3dGo4VzYvYnF0amFzQzZDdHZTNStFdGpXQjE0ejF3b092Q0pGcmhsUWxm?=
 =?utf-8?B?NXZPZjE5Q2J6cXJzaEV2SWhtQmQ3bHZQOEc1STZmQ0tvSjJMNjhlNmswOEhp?=
 =?utf-8?B?elBsQWdLTG5JMlAvdzdaK2lDTHhSVm5lcmJnV2VHaFczSzNmK3R2SXhFdUZG?=
 =?utf-8?B?bVpZdEJ1U1lGM094VFhHbUp3Uk9GM2RnYVZucHNzREEzVUptUUNVcitRTS82?=
 =?utf-8?B?bFlUSi9wbjdNSHowYUlDaElFL3NGbllYVHlZTFRXZm1ZUFZUQWFsVm9VZnRY?=
 =?utf-8?B?VFArUHZPT3Z2RVcvYWFDd2Z4TkppYUhNWGp0YXhmcDVBVUw0QUF5RmV6VDFX?=
 =?utf-8?B?OE1uM1hCR1FycUlQK2RuSitvVXdSdG50Q05MZ0psZkl3alNOeitHUUdQL3NW?=
 =?utf-8?B?Qk8wdFExMDZxQTU3RjZlUVovdG9GRGpBT3FxTnFVZ1Q2R09Yc0p4QT09?=
X-Exchange-RoutingPolicyChecked: M6c7qr39EA/JvbS9N4R/T3uf1PrjdFvWFDyMXorTk7Nt2DR8dTCOTmU8ND3UflFb0uVmdGN26zLH0oMWPTEqrxqx67sRG3C0e6dBG/9dOs57MQRp7PXJK7IcP1vRGHqQoxhxhJ2JCo7wS3I5a2YGwRPVzpXn6uDLiGuqhQ4I2V+bDcCzbIu8Lvb5iR2k7W/FAbVy632/oAdWiF/p/ArhSFSq0xiBvGrGyhGz8j7SEqQz3RmuQpmbrCQUx1vRLFkYDsdUDvvwnfPc9QOasV0+ryW4WRbxe5ro0N30Cwd2seFeCVleKdhDepdfVCgBC1U8iBbtYG3J5eglGQR9Kaesvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d49f4fbe-79fb-4a98-44d0-08ded30dba62
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:01:44.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wutnK8aP9va8cPgE13j26nzxFpOUd0TTuyvUxcxQRM2ns6yBY7cWnYHBFJXpWbkybW1eXwiV7S+5R8HVjl8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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

Hi Shuicheng,

LGTM

Reviewed-by: Zongyao Bai <zongyao.bai@intel.com>

On 6/25/2026 3:44 PM, Shuicheng Lin wrote:
> The local "finish" pointer in xe_vma_userptr_force_invalidate() is
> unconditionally written before each read, so the static storage class
> serves no purpose. Worse, it makes the variable a process-wide shared
> slot: the function's per-VM asserts do not exclude concurrent callers
> on different VMs, so two such callers can race on the slot and take
> the wrong if (finish) branch.
>
> The function is gated by CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> (developer/test option, default n), so production builds are
> unaffected.
>
> Drop the static.
>
> Fixes: 18c4e536959e ("drm/xe/userptr: Convert invalidation to two-pass MMU notifier")
> Assisted-by: Claude:claude-opus-4.7
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_userptr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 6761005c0b90..6f71bc66b14e 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -269,7 +269,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
>    */
>   void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>   {
> -	static struct mmu_interval_notifier_finish *finish;
> +	struct mmu_interval_notifier_finish *finish;
>   	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>   
>   	/* Protect against concurrent userptr pinning */
