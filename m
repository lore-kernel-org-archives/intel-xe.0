Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CAED0BB7B
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4CF10E0FA;
	Thu, 24 Oct 2024 09:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iud2eNru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9972310E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729761499; x=1761297499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VWeZEU3SpL3gLCVZmdsaZ5E6YEcze5xV5zU6tz7vHuc=;
 b=iud2eNrueQN/n0L1r9f+foG9yfus++EEWda0kKATFXZ/V5sW2cIoauE/
 nB6diAPjXSN89/63DcuScNgZNd2Cnc6GeYjzjoBmgqyaNjMymLIigtUEZ
 Jn2SVlmA7n20NWEFL6bh0Gz9VuGc2ZRnPC6zZ7jlLTfJ5TuyDHhBN2eoy
 mukiUU1MGPxGXHOaQJ5looVYiPJ1XNGgWgqm0k/dlLp99sDpE4iUsBuvv
 OiDzWf5u4UvLswPKFzMV6fRKJ+qqwBk8O0xxpKRvgcs1sf6V2NQqDYXqx
 2nOIRyMflefY3+vy67UGqPBVHHnqxNPsb4Flzjn2o9qIY7JTiulwZszLF g==;
X-CSE-ConnectionGUID: tcd6NB3YRpOHSvmWngOJCg==
X-CSE-MsgGUID: EG6dyUuAS5uOwMnjF2qCgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32241680"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="32241680"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:18:19 -0700
X-CSE-ConnectionGUID: G8OUD1EjRPOsAkurNX4Edw==
X-CSE-MsgGUID: IBIt4fHjQHuRX2OIR/Qkgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="81351630"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 02:18:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 02:18:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 02:18:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 02:18:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atizcfkGpqjpPYauti5+vfpddvQXx9IxixQWlz13/vSZGL4i2Eypse4VxItKDP9g9p7YcJ0DaKvGTFo9024YlgfAIysdO1GTup3sJ03wIizVhxROgdHAobXJmLnlkGDtC1KLb04n8GuZnSfT5JslSR2ckD35uWNNN8Z7LnLCbP3Qg5n2yOeWkfMhDFHfjpR4DIf/kRfbXDITmBL9F7hrZeDWHbedJL5sT/5eBeKpIpzM2Zaf4M3OLLPYJL18JF6t30bDB9gBThL8xU4qna6LS9MXwJDjdIyKQrYh0UR+B0qh84IzWJUuyfIWq+0ungf3nuf5R6H0xfeCp/kxUcLnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWeZEU3SpL3gLCVZmdsaZ5E6YEcze5xV5zU6tz7vHuc=;
 b=K0AQQ7cQOD8Ai0pTXHmIVZ+T/zaoY7b09Lhmr+bx+0oMts9jsSdDi87cYRi4nF7MkEzv6JCkkLmpwYG2C5xNhfuMsDEEctOtDVtBdTkFKJmSAw7Ay3Qtjol3rQ8m2cRtUeMwo6SIMIvzn1tG3bWY/QElgI7Ri2oOVyRRuzpZnYI+OGX81FP/E2f/FQ1DoPWRultrakdE24LWA/3XrQkiLB6aAjV8z5U9KblAGRnjMNK6CAdWjP2ICyM+9fhIX1+xys9vH7qJ3RPPKT3efQKkmY6xubp/LxIzWptRTXbsR4GLHwwfVbXrkFCEHjPN4evshG61h21xyYb/i3XjzKuLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 09:18:13 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 09:18:12 +0000
Message-ID: <b9f22b8f-5816-4ff3-8b10-3026374ca98d@intel.com>
Date: Thu, 24 Oct 2024 11:18:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
 <8f955251-db47-4b21-82a3-979a353eb6ae@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <8f955251-db47-4b21-82a3-979a353eb6ae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0022.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::6)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4688bb60-c785-42a8-328c-08dcf40cc8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHRmeWI3bld3VThkWFdlT25kL3ZZd0dsVTlncEFBdVlvSG1wN2FUZkl4ZGdj?=
 =?utf-8?B?amd5S3lvaHhKYk40bkE3akVBc1FMREZCUEd1R0UwWmxUamlqemVMTXFGcExw?=
 =?utf-8?B?ZHRaRmpsbWdOb3ltcVJGeE1BZXpBUFljc0hHdzFXTHVNVG9FTHVYS05TTmNQ?=
 =?utf-8?B?M0lOVWF5ckxURThWSU9VdC9DRWYxekRkUFlWcS93R1VWTHJPS1d3dVgrbkli?=
 =?utf-8?B?ajNPMWZOdHI4aEEvczVRc05Oc1ZId3Ric2x3UVZXUEVNb2FzSjBTU1FPUFJn?=
 =?utf-8?B?T1V4QXpwRys2QkIwT3B3SWFjS29iWSt0b0Z4anVUdllqbnk1K1BRMUkwQzBO?=
 =?utf-8?B?SnZ4aU9ab1lGSzlIMjE2S2o1NnNKUEV4MExuN010UUNUOXBpdSs2b1ZZcmxZ?=
 =?utf-8?B?K2lDLzFkaXNVdldCNDMzTWoyeDZZbnJVZVRhRm16ZmdBRWZHQzhidkdkd3Mv?=
 =?utf-8?B?UlN5WkVFVytGNFhpR01FNWFFVFQrMTNNbEJoVytyV2s3MUI2SUtIM2RiQlll?=
 =?utf-8?B?RlhFZllrN1VlQW1tSVVhL3Bjc0RxZitjcGdIazBDT3ZxNzRxbXFubjFpd1gy?=
 =?utf-8?B?Rm5pcGgrUG9sQTNSVWRlM3ZsSWloNFovTmQ0aGVueHFBcURjeFJ1OUNiYmVp?=
 =?utf-8?B?N25LaS9FZnI5L3J6Q3hCVmhoNU9rMFFPSjZ0enFwVlFhWUNqQlBTWFVFNzI0?=
 =?utf-8?B?akcyN0I4dWpOOGJkdVNwODA1QXJEeVcrbzJjYTBnRVp6cjNqR2JPVVMxR3Vj?=
 =?utf-8?B?M0RCdVFmMWgybUwvK1RRb3lvU0hnSTNDem5SU1lCc1pzVlZmT0NTbWdrWTdx?=
 =?utf-8?B?blBXQ1BTK2x4TjdSa1Z0a1RLYUU1SkVHZnFoSDlUaHJyNXFteWF2QVpUNEEw?=
 =?utf-8?B?NTRJOU5SN2NhYlN2MldERlkrY2lFTU1MNS8rSmpLLzQ2bDFvMkFYYVQycGJB?=
 =?utf-8?B?cmVxZ1pVU3ZGcFRUL1NhSFNNTGxPT2x0a2NiYjVjY2RxMjRGVnZENjdrUHNG?=
 =?utf-8?B?d09sbkRjWmZCcHBoS3BabmpjYnRCZXNZRzJOTmliQjN0VnlPSEJocDFUWDhh?=
 =?utf-8?B?RHNGc1dUMW5zOWV2TDNCMDR3S3JXY1ExZW5qM1VxaTl2K01uUEJzdklvaHhK?=
 =?utf-8?B?NUJZTkdCWW5ZTzQyV25adFEzUkJzUVZaTkU3aHJROHhWZ0ZZc29taW9tWjR4?=
 =?utf-8?B?cUJCNXczaWRtSGZOUVQ4YlNaWndNL2gzRUxMWVNKZ29ZOFU4V083VDBrZHZR?=
 =?utf-8?B?M2hhTVhaL0lnMUdFUk93Nk5UejhWVEhnK2hTUTJ2QklxdkNVNEN5UkprNGd3?=
 =?utf-8?B?cmsrazh0eHRZM29CeUtYMnA4OUpneGZVcDR5TW9zeWZNMWZReTBYNU1OTzFi?=
 =?utf-8?B?d2R5TnFtS3hKR0dKaDdKWDdCUnhFdWVCNmcxY2k1aHo0MTFxbm1LOUlDbDBy?=
 =?utf-8?B?SGFaQkhEMmZlZUxFRUpqY1h4OWN2Ny9vRjRKdTBRbytSNUFFVDBmWW9JdDZ2?=
 =?utf-8?B?OVpkVFlrSk5LcTlKVDBmWTFvREJNcVpRMWszUC84b0FYemtoNjBSbWNyelhJ?=
 =?utf-8?B?V0l3SkhHclo0WEVHZ0l2YjJNTWFEdHdScldCVmVYTGd2VjF0ajJIZjBHc0xM?=
 =?utf-8?B?T3hQaUFteGhPNWxOOURUOE14MGlMOVNWSVhEOWV4RlAyOHdlUmR6M3BDancr?=
 =?utf-8?B?bG5RQXBydjhNVTZxQmo3WFc4MWZBNXNTcEtPLzZzV0pFQXZra2FEVXdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi9GWkk5RHlUdXRyeCsyV1hDaVVkdXptbXJCNU03aXBKdUVGc3AzeUtOM0ZF?=
 =?utf-8?B?a3ZDL3pDNkM4ZndsZ3hicWlaYUJRcDhpcngxay8yY1VKNnVmTHdmUU1vdlU0?=
 =?utf-8?B?M1phY1E0cGxrL3dtTzdPNE9ZcjFzQW9WVCtJQ2FSTWFoMzJxc1hYc2dXdkts?=
 =?utf-8?B?OUNrbjVNZnNCL2lwR2JBdGl1dkZwL2k1WHV1aUd2NXRiMzY1c0MvNzBDbWxr?=
 =?utf-8?B?bmsyNGtxTXpZSU5uaU92UnhlakRGY1d5UW9wd2R2blRKQ2JzVkk0eDB0Ukh1?=
 =?utf-8?B?alNGZllVLzJ3MlAwYnlRbFgzTFpvZlRyMUI5c1FMN2JHMFduWnFCa1pXYllp?=
 =?utf-8?B?WDVOU3g1UGF4VVZZTnEzaVhoVGpmWTNtV3dKaWFoQ3hoLzFZWUJTZ09KUVFi?=
 =?utf-8?B?bjlxVmcwcTJCUVhVcjZyR1p1NmFsNWRnN0IveUdFU0hOeU1LQXRTK2loTjIz?=
 =?utf-8?B?ZUgvNWlkRTdpT3JJTnFoVTVaOEJuK1dCdzFGTkUrd0VvN3AwZm5zbEJnella?=
 =?utf-8?B?VG5tWk5HRmhrNE9ybFdvUHQ5MnBteVJZQ0szRldBUjF5Rm5pblp6TnI1RUJm?=
 =?utf-8?B?c2ttVkY2Z2hzUVVVdlpVaFhRcER4OHlGWnpQSTR5NklrN3pNWHVlaXk5azFU?=
 =?utf-8?B?aTNXay9TelpybWZySzV0NmpKMHpVdHJaN0huZ3RaNXJGYjZMcVNyZmg3ZHVz?=
 =?utf-8?B?WmtrMVl6NE92UUJqWHhad1lqNnB6ZkFMYXNmUUpUSk8xTGFGU3BCTncwM3Yx?=
 =?utf-8?B?d1dRYjYweXd6N2dkcmE5RXdLSVRtbWszSUtSTTc4enZtTzA0NVNPaEU4b2R0?=
 =?utf-8?B?K21nWlFsUnJKTFhPWEpaTkdFZ1dXNmJwUHlnR3YvNXMycFloRTVpWTJCZFpS?=
 =?utf-8?B?N25YMnNtVTlvUU1YNkg0THFwamNHc2ZUM09vWldxL2txNGt3ZkRoUjVpYTBR?=
 =?utf-8?B?UW51Z3gyeDFsdFZQbHVpaTJmcVAwYlF4bm12TGJ3VzFOTEhOVDFwbkZPT2lD?=
 =?utf-8?B?QXYzSGw2TWtXcm14UW41S2lOVnVXNmcrU2Z0M24ycnErY29aTWFkeHkrd25Z?=
 =?utf-8?B?TUdNMkFQZTUrM3dSWFJtUXRBa2ttMzFWZ01GaDh6ZU1yaHRuZGZKckQ3M0xO?=
 =?utf-8?B?QnJPcDF4bWdGdHpqRG8veDJoRjZ2RVdvYy9pQzlJc24vNTFoYVBWRmhEOWM4?=
 =?utf-8?B?ck9QRGtPaHVkT2hzckx6eERUN3czSFpXM2doaWNEZ0cxL1pUTkp0TUhhb29w?=
 =?utf-8?B?ZTFFNTluSTEyT0tvekVmOHQ2MHdqQjBTaEI3ZFRuMmVtM2hUUEVrMHdHR2h1?=
 =?utf-8?B?S05yeENpWDc2QkFvRVdYWVlITmljWjZiaHJURnZITUN3QzBmejZFRzU0cFNx?=
 =?utf-8?B?NzFqMUM3blhvNytGL1lGKzJnQzBEc2FQVkliUE82UkQ0WUUyaS9USGtVSGpL?=
 =?utf-8?B?ckIvenBVK01GMXF2d3d5eE1VQ055TTVWYzIvYnhqQXczWmtxaGx6S3pGQitk?=
 =?utf-8?B?TTcrbitCTkh6ZlJ1NU5RWldsZFVKZEhZWmJPWm1RS3MxbW51QnBvQjcrUThm?=
 =?utf-8?B?c28zSnJLSVYrMlQ5U3ZkQU00WllwQWtBOXBtMDl3Q1VHSklYNi9tQUhJNUdm?=
 =?utf-8?B?NE9KR25rcHZDTmhkeTdMSHZHR3FJT3kwaWFvSWd1NlExT25Mc2hsNzJoWUVZ?=
 =?utf-8?B?c3IwZ1pVN24wR2owb1JmOThiWmFKcXd4L1k0eVl2UnVDRkJFbUtrWVF3YnFq?=
 =?utf-8?B?WVdKZ1NSRlhqbkdHd2F4RncwS25wQk1sMW8xd0xQb25yVlNCQlQ4WEtBeWlZ?=
 =?utf-8?B?UjE2L1hCSDdMN0g0Y1Vid1NualNEKzQxZDBhZjVrVDFPZjl6akZGbi9TNzB0?=
 =?utf-8?B?TzNiMktzaHltT2dQNXRrODhpRTgrWUNFb3g0WEtXbFNaYXMxalljalZBUy9v?=
 =?utf-8?B?a21WZVZkSUZENmhOenV0MCtFbDZQS1BVeWhCQ0kySUw4WFE1bEtCQ3VJUVFS?=
 =?utf-8?B?K1JGM2RTL0hJREZDam1HbzczWS9BMnZuSHFYUmxMWHZBVS9VTml1aCtJcmpN?=
 =?utf-8?B?dEFJYVUzT1VTb1V4bUlyMEFpOXY3WUxnMFBiU2NzNjk2NG1RMy9FY05VT0ND?=
 =?utf-8?Q?BnhK7hmjrH0fyAHSvlrY13o+N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4688bb60-c785-42a8-328c-08dcf40cc8cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 09:18:12.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD+H+WDQ9oATFsREOgxnNdSlFpqZmWHSQ1d9hm/cX+YQ1PjQf8oUV8a69HQbCHSi/ShR/csKVfayCTon2aQZ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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


On 10/24/2024 4:05 AM, Ghimiray, Himal Prasad wrote:
>
>
> On 23-10-2024 21:28, Nirmoy Das wrote:
>> Flush xe ordered_wq in case of ufence timeout which is observed
>> on LNL and that points recent scheduling issue with E-cores.
>>
>> This is similar to the recent fix:
>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>> response timeout") and should be removed once there is E core
>> scheduling fix.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
>
> Same comment as "drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout."


AFAIS recent failures are all on LNL. I had another fix  https://patchwork.freedesktop.org/patch/msgid/20241011151029.4160630-1-nirmoy.das@intel.com   

which should fixe timeout issue for all platforms but LNL is unique here.


Regards,

Nirmoy

>
> BR
> Himal
>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> index f5deb81eba01..7f034871345b 100644
>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>           }
>>             if (!timeout) {
>> +            /*
>> +             * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>> +             * in case of g2h response timeout")
>> +             *
>> +             * TODO: Drop this change once workqueue scheduling delay issue is
>> +             * fixed on LNL Hybrid CPU.
>> +             */
>> +            __flush_workqueue(xe->ordered_wq);
>> +            err = do_compare(addr, args->value, args->mask, args->op);
>> +            if (err <= 0)
>> +                break;
>>               err = -ETIME;
>>               break;
>>           }
>
