Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315D3F531DB
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 22:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937310E53C;
	Mon, 13 Apr 2026 22:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYVdGYo5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED7310E53C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776118794; x=1807654794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D92VVaE2WZceeMzY+XsgayeNuEtFZivW4r6SYH5ZThY=;
 b=ZYVdGYo5Wzyos9TNtaCXihfBrQurw0wFNYkm6AxtvRTbqi/K74dkNv0J
 Qhm701QqmT3JEaFgHN+nvhPkLaLydfkC4ONTl7FFOIQ94DRwPn9/jA5Ex
 9yEuCRXM9aDfwcxP5/f3mj79hwfneSt0g/fWXf3Uy7Wm2obJW+9YFaKhE
 lJNhMzxZLgV/lVr2zEcBNbUfWdVLsr269LXXiWoT/p8wAH9OtyZfVCrAt
 gmXwpJQAT3tiUcaDaFeN4q0rtuiziVev4l8ELd0LTL2FBVHDzpZpofZ4y
 vM9HZDba4rGjSfbTyHarPpHkVvReGUOOB54M+JXuaMY+8v2Sc6LZvCMTW w==;
X-CSE-ConnectionGUID: slq85aVITGizVsGF+aIEAQ==
X-CSE-MsgGUID: Keft6o3qQOCGHFps96b6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94464026"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="94464026"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:19:54 -0700
X-CSE-ConnectionGUID: Sx3rHn8mT+6wSiPIprS11g==
X-CSE-MsgGUID: Pxe7fi/ES/2iz0Fb5cQS+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="228869140"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:19:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:19:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:19:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq20rJAYpTSi2fqhHmRcZ8FZd4j9LhVa5IMwm/4qKBNc6CMdEb2ZK1yoq1UCc7IVNjFGopjH18tSKaCfr0JgBbguC7cuA6Qazx/YhByyP2wmu9iMskVIX40uKwbdH8I4LPEJZuJh0ZwfRgX7JTSWNtUDLK+ra6WefjaONoSw2b40ckLZBFEPXvN413/NAu66PNxu/uSv5O01aNc1nn45KjaGZZ0buGeCQ4k9q+7x4Cv7BcdlQmcMPIRPILWxmvCEx9A5TaDFXzme87R4aPOc3ZidIxsTcuKfO6Mc+EV/8HEvqKOfHVpmO6qz+o1LOOWckd3m+oioTkVvWGCjbIzMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s50gb5rML5q06jKtCuvPDTtN09Drv8hRCZDw5ov6R40=;
 b=Zyk/ZqzK8ERv9Anh8NBhfWhptzZDbeKqm+1AUgylDWNMKrjbEb+6+w9Ki/tlI+3Mv6uZsQ7B/p+T8aF0xwwBMBgQGCjJ8RCKNkxQNpb7h07xTC3pS5y8ASWQbVhEgTFw85KFU53WR6OYkkusl4BKx2sjR/2XWRkUqKq9WgBB0t9AEJIhLBrKkYp5hGX9wWgCQWhO7aMQwlkkJ9bk/8V4yS+jsNhgZ0y6jdHWZzDou90fIALIRxamb5e/jb+WweLAGSbj7uKAh6AJuQsSUOvFAQxN2y23P+GXFhhDx1hOyZ+vfLc+pUcslSOdWp1W52dZ4bnhBgV8HvF7k9naNTtUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by SA7PR11MB9596.namprd11.prod.outlook.com (2603:10b6:806:4d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 22:19:48 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 22:19:48 +0000
Date: Mon, 13 Apr 2026 15:19:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <ad1r/WSO+81BDWl0@soc-5CG1426VCC.clients.intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
 <ad1ptHyrfIg4Y96J@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ad1ptHyrfIg4Y96J@nvishwa1-desk>
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|SA7PR11MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c1e5a5-8a1d-4dd5-bb64-08de99aac60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: LBfv/QjJEn9dukdmlKeCPtzaF/4o9gtI0tVRzXoabMHFqS8x7eKwQBFtaIiZIXP3eN3i9cJ9ifLK6Nb6NhAW+D10z0z7hHniuDg7ozhU3Xgs2FI1cG5SdhW0RuPgF+ulGJorbZY52NKs4aNK47Sg5HlcAFxE7nHKzIwNlrmSgv+fFie31drIFtsv2Jx+CIZ63uZIm9jm7g1pd+6DoFvtiu4c00z3481WrWR4gNoR5FYi2YHYj9RVKhfGtDrr0czbEY92tyzGGwQka1mfNZfNrfiXfyp/+AXbY2zrL/x2bw9/+ytMc9OwINRJnyYTUJwhGvyYhYdHqOqdjWMnO4vR2JC5SJMC1r3/djfmVDOsM59AKucG0ZaWAl9++xP9JuA6lb7vcrVwStF35doenhz/nOlroYgfTBlwfJzz6wIRAp+AEd0NwpHPrWxS37iDoZ3l5+q6N+veAUea+pvN+QMmdI7pSykIyKmrGr15nwCfyVkB+8fw3GCWM56xeN5j5X1MX5qxnVIkQKZhoE2wJeZlD5MxC1g9OA3H7z8vM5gPf0fUew2DKY9Kv2Al+BDTuwcjjYB9APulRMx9tT42hsnIgF3y8uLFKDoCoDEdRQanwU5RLEoiGS3rrO82yxWH3k2N44YbNFdmwO9yCSVZjbUmVfP6A8foe7SaoODG8D/byUbFc7C662BS+EdDtrglCSHwW+l1w28UX7h+pnOUnzmZ66oA79WTNwSgNC710Z/XcW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWcxMHlqREZucDZKeW9ONzZ4TURIUW82TTJXa2RlLzNhMlFzQ1Q3THlJbmMy?=
 =?utf-8?B?QkZTNFNJN2RCazFQOGJTaUh3RWVHTkFuR0dZaWZPaFF2QXF3ZkVrR0MrOFBi?=
 =?utf-8?B?Wk53THNORk53TXlRK2prM0lYRjdoQjhNa1FuU0tVSWRna1FJdUlLNThFcVBL?=
 =?utf-8?B?akhFSWxMLy9SaDRJckV6d0dBSU5jOUYyeVg1d0FvNGZweG9QSjdraC9XZThH?=
 =?utf-8?B?Y0pDWFpQdjlrMDRIVVVuTHN5UGZHT2JPdm5ndkhxbTBCVnVoZnVyOGZ5UEZP?=
 =?utf-8?B?YTEwbVA4ZHhnajJtQS9iYjRUcUxZUFRKS2EzYk94MnN2SlQzdFIzb1dXeHc4?=
 =?utf-8?B?bkxoOEdHR25iK01IZllKUWhpMlBsVDcyQlh5WWplSE04enBJK2ZFLzV0MGhJ?=
 =?utf-8?B?c2kzNWtlTEFBMUFFNTZxZ0huc2w3VTFmV1NQS25TaW5IYkFqMzlmMlQ4RUZL?=
 =?utf-8?B?STlDUzhRVHN6YVlSMk9XMUJVU0dnbG9sR0QwcjhpQ3dYd0FScWFsanhsR29l?=
 =?utf-8?B?Rkl6WkxvTk1XVk9RQmdYVG9tTFpTKzJhYWVaZkRuRFRPOWUyQUJTQnRiOXBq?=
 =?utf-8?B?MUxJZTJ1Z3RFV216dkxrYmNjd2NnOG1QWTMzUEJ5ZHJ0YkJ2c0c3SnZ5ZXZN?=
 =?utf-8?B?UncrRjBkN1FnUnRUNUhabGhJMGNudi9oMlZqTmhtYzROUE1NajIrYjRTRGNM?=
 =?utf-8?B?a2VQVUN1N1lSNm9uck5Mb1d5YTRWbmNvNjRYTmhCUVJ2cmIweFBqNEtJNVNl?=
 =?utf-8?B?amV2SCtEcVBkZkRHTklJeVZFbEIydkZpamVEZ0I4QXJieEdOcDh2SDNRUDVo?=
 =?utf-8?B?dE9tZ2ROWFBSREE0MTZqOUxiT1AwWU1manV5ODhKVXJCZFE2aEd5dkxrMDZa?=
 =?utf-8?B?aCtMTEs3Y2doeFgreXhSZWRpSUtqV1luNGE3TkVmcGtUTVZsVHRONTh2UzI0?=
 =?utf-8?B?S0RwamFwaUJ1UU9nWE90RlQ5OVdOSkkrcVM4TmpwTW56WGF5bGQ1WWMyOHNr?=
 =?utf-8?B?ZGs5U1hxYUhqbHhDK2E1Z1N2RGFWUGNpdFZST3hMMy9STk80RHZCaHluMlhr?=
 =?utf-8?B?MFk4REFYbkdyTEczcFU1U2Q4MDdreC9GOWFjV0lLVDJJSXhZdHBieWlTZ0dM?=
 =?utf-8?B?T2VpdzlsaEcvdkZMOWJTY0RnZ0tlYWJMK2pmdnNIenJvTTM4UVNEMmN2VFNW?=
 =?utf-8?B?eHpxMnFlR2dUUE1vN0orU3J3RUgzblBpSE0zeWVZVytuQmVVcVlYSzdXN084?=
 =?utf-8?B?T2ttUUlOcGQ2Qk4ySTlNWTVTWDRzRVQra0JmdExkV0Y4dEp0S2VGY1AzY0tu?=
 =?utf-8?B?VkpCUUpFaXVXMGlKRmJxUkxRUCtVd2xobGlWa1dRbmlrZVQ3OW9FZGlOUi9q?=
 =?utf-8?B?NXd3K1piUFVCdUNrbjVrdFl0eDYxdC9BcFlDV3UrYVJ5T2NpV0xucmd4NzlV?=
 =?utf-8?B?WW1rZDlYeEE0c09vWVg4SDZLVDN1ckhpazV0WmZVODZjeGVTL0wyVkdETThw?=
 =?utf-8?B?SlMyQ1dpUmthMS9vbWZXMWhKNUNSZzJ0cTlFTXBNSXU3SzBNbzFuSFR0TUdv?=
 =?utf-8?B?bHN1c0RJYkNTL2toODN1WVdpSkJJNmsvZnFVT09rYzdCTXVHVUdVd0V3UGNH?=
 =?utf-8?B?OXJjY3R2RW5QblNKaDYycnJoeFB2Um53QjZ0THZzTG1aRnlrM1dpdFBONzBp?=
 =?utf-8?B?YlM0RXAvd0s0U1JwdFFVUWkzdklHS0JPVkg2bElMM00zUngxYXdOaGw0bWdw?=
 =?utf-8?B?c0c0SHU5Y1NwRzc5U3BjRWFTSlk0TWhWOEdpOTBUUm5oTjQ5U0xDQ1I5b2cx?=
 =?utf-8?B?dFN4eXRSZ0QzdDFEekFTV2VQVUtnQjJTdHZXQmtUOVhKZ1E0Wno3bWdwdkF0?=
 =?utf-8?B?VkVPd0V1czFUWWZUTzZJRi8xR2xFdlJmUVFXUVdWTTNPKzVYWHM3SUFUUmNE?=
 =?utf-8?B?dm5DMFF4Q29meXhWUmNUcGFPZ3grZjdBcVM3Skg0SkJLaW4yN1BQZDZ2UlhY?=
 =?utf-8?B?ZWNuckxra2NJUllXaFdlL2o0QndoNWttOEp0dFZCQ0ZSREl4Qnh0b1A0TzQy?=
 =?utf-8?B?UjZQcjh1aWRFMnFNWDFBRGhxNkRHaHRldmhjTHpMdU9tY2t1LytYZFgxWXV5?=
 =?utf-8?B?aG12Nm9iYVZ2bkxlcXpCZkZIRGlWWm8zTm52ek1xV3dlWjZSekJwU3BzUHRY?=
 =?utf-8?B?dEh0VTd6cGc4UTdIVFMrRUVSTDB1d043NERvRWVlMXVJU05NNFc1RGF5b0hQ?=
 =?utf-8?B?Yy9uV1M4b2tUeWZaQXVIN1pVRGplc3I3NG1kMmowQ1poRDV5VlBXYU9lSU92?=
 =?utf-8?B?QXNkK3dGK1czY3gvV1FUaGNnY1NZYTJscWd0MlZyL2xFN2Jwd2RROE1IeHRD?=
 =?utf-8?Q?T8pD/SEK5ggXXqwlw4wYeDIfHzDq9vrfhe/VU?=
X-Exchange-RoutingPolicyChecked: kmcodyEMzcDXtMv4UV88mHUOnjH9IX44Nd+CRWuyc/9FMsapAVoBffiSpytZcM2oncbqCX28mGnZeBUuaweJI7wZKiQdZJ4CN0fAJ8XlxuBvDgVl9rd07MGfRr5v8eZz2k+mzdqbAUcwbvbHs8XzVDzbLQkUPrC62zpYlkJLFVsG8jX3gnjgazeTYy9HYzxr4Z/Kf/7tdeeswJz1cZxBjbmmu7KkHjcljgNsilmR4+2u+PbQqgnFedidGfknP6Y/zsw7d3nnIj/xNWI6jZOO+AIGNiOEoe/VrQHy4LlECY5mVCgZag/p//7Ahs6ZEKv3neUC3gUtxjzBoEjhUTizsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c1e5a5-8a1d-4dd5-bb64-08de99aac60e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:19:48.1944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyMR9EIQ3y6yq1WYjByDsCA3SHAgehK3uyM2QRQXwWT9JqjiDs6M0fYlnh9XYvvJnhb7fdWLU+XktYD0CsgNSFvKc295KA9+9spbM2hVU70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9596
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

On Mon, Apr 13, 2026 at 03:09:56PM -0700, Niranjana Vishwanathapura wrote:
>On Thu, Apr 09, 2026 at 01:37:18PM -0700, Umesh Nerlige Ramappa wrote:
>>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>>register to get an up to date value of the runtime. To do so, ensure
>>that the primary queue is active and then check if the secondary queue
>>is executing on the CS.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
>>drivers/gpu/drm/xe/xe_lrc.c              | 122 +++++++++++++++++++----
>>drivers/gpu/drm/xe/xe_trace_lrc.h        |  27 +++++
>>3 files changed, 133 insertions(+), 20 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>index 1b4a7e9a703d..af6af6f3f5e8 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>@@ -170,6 +170,10 @@
>>#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>>
>>#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>>+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>>+
>>+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
>>+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>>
>>#define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index be1030c74e21..1e407a761076 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -21,6 +21,7 @@
>>#include "xe_configfs.h"
>>#include "xe_device.h"
>>#include "xe_drm_client.h"
>>+#include "xe_exec_queue.h"
>>#include "xe_exec_queue_types.h"
>>#include "xe_gt.h"
>>#include "xe_gt_printk.h"
>>@@ -2638,17 +2639,72 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>>	return 0;
>>}
>>
>>-/**
>>- * xe_lrc_timestamp() - Current ctx timestamp
>>- * @lrc: Pointer to the lrc.
>>- *
>>- * Return latest ctx timestamp. With support for active contexts, the
>>- * calculation may be slightly racy, so follow a read-again logic to ensure that
>>- * the context is still active before returning the right timestamp.
>>- *
>>- * Returns: New ctx timestamp value
>>- */
>>-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>+static struct xe_hw_engine *get_hwe(struct xe_gt *gt, u32 engine_id)
>>+{
>>+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>>+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
>>+	struct xe_hw_engine *hwe = xe_gt_hw_engine(gt, class, instance, false);
>>+
>>+	if (xe_gt_WARN_ONCE(gt, !hwe || xe_hw_engine_is_reserved(hwe),
>>+			    "Unexpected engine class:instance %d:%d for context utilization\n",
>>+			    class, instance))
>>+		return NULL;
>>+
>>+	return hwe;
>>+}
>
>Can we update get_ctx_timestamp() function to use this new one?
>
>>+
>>+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>>+{
>>+	struct xe_exec_queue *primary_q = lrc->multi_queue.primary;
>>+	struct xe_lrc *primary_lrc;
>>+	struct xe_hw_engine *hwe;
>>+	struct xe_mmio *mmio;
>>+	u32 engine_id, queue_id;
>>+	u64 reg_ts = lrc->queue_timestamp;
>>+
>>+	/* Ensure we are PF, primary context is active */
>>+	if (IS_SRIOV_VF(lrc_to_xe(lrc)) ||
>>+	    !primary_q || !primary_q->lrc[0] ||
>
>This must be an assert if '!xe_lrc_is_multi_queue()'.
>
>>+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	/* if primary queue is active, we have a valid engine id */
>>+	primary_lrc = primary_q->lrc[0];
>>+	engine_id = xe_lrc_engine_id(primary_lrc);
>>+	hwe = get_hwe(primary_lrc->gt, engine_id);
>>+	if (!hwe)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	mmio = &hwe->gt->mmio;
>>+	/* check if the queue is currently active and then read timestamp */
>>+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>>+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
>>+	if (queue_id != lrc->multi_queue.pos)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	reg_ts = xe_mmio_read64_2x32(mmio, RING_QUEUE_TIMESTAMP(hwe->mmio_base));
>>+
>
>NIT...Should we make it similar to get_ctx_timestamp() with has_64bit_timestamp check?
>
>>+	/* double check queue and primary queue are still active */
>>+	queue_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
>>+				 xe_mmio_read32(mmio, RING_CSMQDEBUG(hwe->mmio_base)));
>>+	if (queue_id != lrc->multi_queue.pos ||
>>+	    xe_lrc_ctx_timestamp(primary_q->lrc[0]) != CONTEXT_ACTIVE)
>>+		return xe_lrc_queue_timestamp(lrc);
>>+
>>+	return reg_ts;
>>+}
>>+
>>+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>+{
>>+	*old_ts = lrc->queue_timestamp;
>>+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>>+
>>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>>+
>>+	return lrc->queue_timestamp;
>>+}
>>+
>>+static u64 xe_lrc_single_queue_timestamp(struct xe_lrc *lrc)
>>{
>>	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
>>	u32 engine_id;
>>@@ -2680,24 +2736,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>	return new_ts;
>>}
>>
>>+static u64 xe_lrc_update_ctx_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>+{
>>+	*old_ts = lrc->ctx_timestamp;
>>+	lrc->ctx_timestamp = xe_lrc_single_queue_timestamp(lrc);
>>+
>>+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>+
>>+	return lrc->ctx_timestamp;
>>+}
>>+
>>+/**
>>+ * xe_lrc_timestamp() - Current lrc timestamp
>>+ * @lrc: Pointer to the lrc.
>>+ *
>>+ * Return latest lrc timestamp. With support for active contexts/queues, the
>>+ * calculation may be slightly racy, so follow a read-again logic to ensure that
>>+ * the context/queue is still active before returning the right timestamp.
>>+ *
>>+ * Returns: New lrc timestamp value
>>+ */
>>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>>+{
>>+	if (xe_lrc_is_multi_queue(lrc))
>>+		return xe_lrc_multi_queue_timestamp(lrc);
>>+	else
>>+		return xe_lrc_single_queue_timestamp(lrc);
>>+}
>>+
>>/**
>>- * xe_lrc_update_timestamp() - Update ctx timestamp
>>+ * xe_lrc_update_timestamp() - Update lrc timestamp
>> * @lrc: Pointer to the lrc.
>> * @old_ts: Old timestamp value
>> *
>>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>>+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>> * update saved value.
>> *
>>- * Returns: New ctx timestamp value
>>+ * Returns: New lrc timestamp value
>> */
>>u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>{
>>-	*old_ts = lrc->ctx_timestamp;
>>-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>>-
>>-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>>-
>>-	return lrc->ctx_timestamp;
>>+	if (xe_lrc_is_multi_queue(lrc))
>>+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
>>+	else
>>+		return xe_lrc_update_ctx_timestamp(lrc, old_ts);
>>}
>>
>>/**
>>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>index d525cbee1e34..988d360143dc 100644
>>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>@@ -12,6 +12,7 @@
>>#include <linux/tracepoint.h>
>>#include <linux/types.h>
>>
>>+#include "xe_exec_queue_types.h"
>>#include "xe_gt_types.h"
>>#include "xe_lrc.h"
>>#include "xe_lrc_types.h"
>>@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>>		      __get_str(device_id))
>>);
>>
>>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>>+	    TP_ARGS(lrc, old),
>>+	    TP_STRUCT__entry(
>>+		     __field(struct xe_lrc *, lrc)
>>+		     __field(u8, pos)
>>+		     __field(u64, old)
>>+		     __field(u64, new)
>>+		     __string(name, lrc->fence_ctx.name)
>>+		     __string(device_id, __dev_name_lrc(lrc))
>>+	    ),
>>+
>>+	    TP_fast_assign(
>>+		   __entry->lrc	= lrc;
>>+		   __entry->pos = lrc->multi_queue.pos;
>>+		   __entry->old = old;
>>+		   __entry->new = lrc->queue_timestamp;
>>+		   __assign_str(name);
>>+		   __assign_str(device_id);
>>+		   ),
>>+	    TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>>+		      __entry->lrc, __entry->pos, __get_str(name),
>>+		      __entry->old, __entry->new,
>>+		      __get_str(device_id))
>>+);
>
>Hmm...I am not sure how to map this lrc trace message to the queue trace message
>(which queue it belongs to).
>We have a trace_xe_exec_queue_create_multi_queue() event, but unfortuanately that
>is logged before lrc is created. So, can't add lrc there to match. Not sure if we
>really need mapping. Also, not sure if position here helps us in any way for
>debugging. May be we can drop this new trace event now (and use regular one) and
>if required we can add this new one later?

The trace does help especially debug the drm_fdinfo side of things. The 
position also helps indicate that this belongs to multi-queue and uses a 
different logic/register for calculations.

Do you think we can add the position field to 
trace_xe_exec_queue_create_multi_queue()?

That should help correlate the queue to lrc if needed.

Thanks,
Umesh

>
>Niranjana
>
>>+
>>#endif
>>
>>/* This part must be outside protection */
>>-- 
>>2.43.0
>>
