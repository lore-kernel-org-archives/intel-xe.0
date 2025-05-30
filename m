Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7864C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 21:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9057310E87E;
	Fri, 30 May 2025 21:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG5/rz1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3297110E87E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748638914; x=1780174914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K+rTn9nguKSyL4d2QkZdDgmWeXMPPPOaZFoxlTBmQZA=;
 b=ZG5/rz1bkYHJRs6XA6kcnIc30m0lQ8GMgWSwsxqkFCqjHiuGjVm6f0NS
 n9x4txapYu1dE19Hbz0XROCH9gDfSEQ+OxsDxgSJzouz/+a6eOnrFjspj
 IGaNEsGBsfd1shJ6oW6kKbMT16ZolmiGCwScnJHFosvbl2Gksa56NIa4D
 0KdFPgb7XhtFWbCUXulK7gaQUY5IUA+HFR9ILoTwGqAOeBKfvpxoQxpaG
 ACdIk43V7qRmZrkfXsuO+UWWz+9GFeG26K/VPn2H7N8qyEiIiJfQ19ol0
 HVqnDcMRkm8TX/AErcy18Z2NNQcbv5F873V2zQ0EcZ85aIYPt6D0NpfTe g==;
X-CSE-ConnectionGUID: X7kDhnScRQabpslgCCuJ3Q==
X-CSE-MsgGUID: hKYQaPVyQJCVyqQJ+OaonQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68166520"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="68166520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:01:53 -0700
X-CSE-ConnectionGUID: Ly/hAAkUThq/Tw3hkVxOMQ==
X-CSE-MsgGUID: zGmIJTSlRqKDeyi1UJqDNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144446219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:01:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 14:01:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 14:01:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 14:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkWmO1XR2O2S0V7kjD2ZO2KVYF6mU1tKJI+HlnigvxZeWG7dbfollk5mAdO9aLDUFp5VPpdbyOrm8OLVNIPUeerhABw/V89LTWFp/agFwS5PF37Lcm1K45dDmoca7J1ajtsjHJ5O+XxlpBmpzGerH4xgaU1vLL/oF5TlD2rOH4SNiA2Jx9H1GTqaxh5reEglT4qR/qy00rfKEQDaiTJNr0m/VVI23UTfvyuKVJYiEZ6OKfqSivVvEGd7iv2ERmSlNVqWb8tWHapww7DAORkrKg7kClSupZbce2jSge/J9tJQyk1yNnhqTzh0JBnDHhZs8dt4x12GbqpxqmvPOy+LoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFB+z59Hr6mW31Th5b+oqRqI9DsoB2aXMCZ4J0+ws/g=;
 b=Nfm+DAAX829NCOrK5nsdTLCpP2m3u09eBl2PNkioL86gs31tdEr6mfkusvorIlm4sWiaZpkosHcXzeFAi2pGdkDTHJxQ93ikM8dzG2BBRH1IrM3VoQxzp+SxESJ7OQT80v2VVyMV7QlG0AZeqrLRO0cfqwecOYwnODp55Di37Oeg3bsTeZosfc8C1YqU1LxQwg2/3fqikMh6mNRTMB+xBQsR/2l2dy2wpTZynd1dEX1JYUxxkok8llOLXZI5GB/EF4OS6/9Ba6gcfWKk2uJ5ATjA0N0XjWhJj2RRUbrq3Vy70nyTXcignrRL/6JhzietKvq3CWE6agX+o8sw4ooH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 21:01:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:01:01 +0000
Date: Fri, 30 May 2025 14:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe: remove unmatched xe_vm_unlock() from
 __xe_exec_queue_init()
Message-ID: <aDoc55B7hTqbv+lK@lstrano-desk.jf.intel.com>
References: <20250530135627.2821612-1-maciej.patelczyk@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530135627.2821612-1-maciej.patelczyk@intel.com>
X-ClientProxiedBy: BN9PR03CA0917.namprd03.prod.outlook.com
 (2603:10b6:408:107::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e2e766-3549-40b5-a58f-08dd9fbd152a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SnrJ2DO/rOjxFsHqQR6+UyQJHnFphUQ8NvVQCPQNOo3Z1+BQL9f1LyhnZp27?=
 =?us-ascii?Q?WxHm+godcof5HVz/Oto/XTxAC9lHa85oQVIV1LLgTTd5I+2tlBnfId+7iMkT?=
 =?us-ascii?Q?8VcJNgi3iqQhKWugbdNA1HF20BwkZP3WtDmKtvnUk6Vzt/aDC/h14aeNyygN?=
 =?us-ascii?Q?5lRbZTfNLDEiGZ28W+1XRfivMdd0QkrfK3XgW5PMYuuZdqbO1WKJ0ati7Pxh?=
 =?us-ascii?Q?jP2YP+RSMOni/QYRNc5g+S68KBV5H7K00OQF3SztGw+UwqwXylqvJUwUZ9Zq?=
 =?us-ascii?Q?ZKwwhYukLuDxml/+VIccbGb9xyFgiTMrLOCLDLSo5ZoXdTM8Ak2HOsAFcYtd?=
 =?us-ascii?Q?b3LDHUWM5V4N0zVxSqmaRBEJzz4UKup5qYoKJpuOClW6G5F3DHK/TWcGetvI?=
 =?us-ascii?Q?XVolICMuu+9/sRAiZvBRVM/PJwfmDP6HaHj8ErQgacJdw9+93xMqxpQs/ytC?=
 =?us-ascii?Q?WITUKsg/8HtZ1TWu5rdY7trWgfNsDN2IajgXpvMfz6z2iUVS6pwCl43y4dGh?=
 =?us-ascii?Q?wt076UMyGW95QMSopoojzn8KMgLE8GRxilX8DzNj9zPW5Ywo8XrGMnRyddPb?=
 =?us-ascii?Q?HHhaOtCTfTjgDcCwxsbSl9OK8IkX0CrpiXyTelIHLg+QWMosqFUcI3GmaDKZ?=
 =?us-ascii?Q?AcXOlcRvPujaIYctusAzHLiV1ErLnf5HH55Ra8MCccEX41WSyR7FXlPHfVjd?=
 =?us-ascii?Q?tqmE80C6DEwETC5/wd6AnHOjlxIFTAoi59YCocCrAu3Mec/4npH3GGYZuxac?=
 =?us-ascii?Q?AHj6M3x5RuryRKDqbc4QjvDSVzPCpxOAFixBBApe4GkAaidGcoshDAWC52tI?=
 =?us-ascii?Q?6yK4ZfxrbXC7NAX9WAEkT44ImKYgF6HNkrYaKDADgn8OPvK2I8ZgCeV9V3cN?=
 =?us-ascii?Q?ilDCm4INVbJguMKIvxwIh3s7h6wUn2pazK7RJnbZlpNZhCMeh8POSYMyCtvw?=
 =?us-ascii?Q?TfzEEm4+7R9KwsSf3w/7uqIjVAzZLyQH4Z3MqVqThFIsQ6GR9CLL+DwWr9r9?=
 =?us-ascii?Q?y1TXOSUpQSVbL//TYVvCfJkC8gVP9CSG7S9Fvz1fXCO8gLPpXbth4L6557ve?=
 =?us-ascii?Q?Tr3TeDB87ubkCVDdG47QfYvSykbBBeFaAuYjncs9/6gW/ZM6GcD3+0Bk0oYy?=
 =?us-ascii?Q?jQ79llyAmnMFnC4U7H3bwdYKFV1ZSLRp8rt/4IXhQEeT0J88hGkMRS7QoB4n?=
 =?us-ascii?Q?DrCsLXSnthA1ByMGAYmCWpywjl7GaG2uXjWibN5ALw4AddBMdBsiEiChZYYM?=
 =?us-ascii?Q?hFSNXx+wf7Ukij/9PrJ52+XWUWtqP9oYElqm+y9g8wkvfQ9jAasoyluVCruk?=
 =?us-ascii?Q?Nl59WJwtAhzdDA1DbY53EUURyHKctW4mohFT8y+9zKMLMpnjyZWSn9mE4V2E?=
 =?us-ascii?Q?Av1Fsf4CCrMwpPuKPubYiV0LjNDsqmVifd72YNnLiw0pm2pmlLultIZKknmC?=
 =?us-ascii?Q?XOTSrGjdLWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kcuulOE/bIJHkltJh7fLCeMF8mPxNz0g8+mkAm6jaNCkYjxoXYMJCXtEs36?=
 =?us-ascii?Q?uw5b/pSECh3WXFgXOs2ClerShgJfX3PaZYBD0ioirtOwlSG0/0nkl4Cryn3y?=
 =?us-ascii?Q?XSrPl/7Y37zIa5imo6CKKHUyM5I8b8oa+Yc4U0OAlBW/nOtI8Njnal2iJKTA?=
 =?us-ascii?Q?NflvmQrx1zn2MJ9Wo17utY2VK0CcPd1bzvgVDDGGL49pFFnrG62IgplMa4XJ?=
 =?us-ascii?Q?4gPf1eCEdmLfAyyi/Add306bk9XG5AlQYIOlQ4/uVnM/NUmyJ+InI6hLbukQ?=
 =?us-ascii?Q?EUpuHWYgBhSDec9sfxYJoab348PRw6rKre/Q6RL+V3/aiEdYoxiLT3bn2JV3?=
 =?us-ascii?Q?ySVyA4HVDZMWZZLaHywO2YG4TF0sTkS7YhXAorU6WWVjA23XoIlNUa5NR+oZ?=
 =?us-ascii?Q?UgyhpLWSSH04nH6XrEv/4ShM5yvtrNS6CoRKII+l+fHGsU7pYMVzngx09Lnz?=
 =?us-ascii?Q?gx8EsFPlHHVj4oTto5Uqo3DJrZ+f+zxRiWE6yVQRUu1g14FyTXSJ597xUpEX?=
 =?us-ascii?Q?l21Jd1IFCw7rvz8nkKes2NSFS0uqK71SnC79+8IPutnQJljSApVnNN8YvW/s?=
 =?us-ascii?Q?3Vcl3+I71X7E1nHaoHovGXNehMsQrGfueX3wlUjmSovqlsBN5mFN0Ly3CLCi?=
 =?us-ascii?Q?HEIrtO6EkOSBRP/MjzvRUVgpPa8teyyoelvLdJAGwg8vsTAXwXy6BsrmgmA3?=
 =?us-ascii?Q?Hpo6xF5qLlcwKEGQEacL3/ojmS/kb4NkBOXTrv9O8/rAiO0r57aOYqjW9MvC?=
 =?us-ascii?Q?fioCJ0zUg+DkCuqEgzneACV0LMoxnELJDCM5LN+dksFuiiNqd7WEfB07vDCo?=
 =?us-ascii?Q?RO5tSgkn7MrbMAUCFFz8QkO70a/+uo72CSuO8oNMvjb5b/hOsYnqTyhaApiS?=
 =?us-ascii?Q?XKN9dpumqXiFIGYyCvdQBJXlP+ugSQXxO9ApJAnCLzDOWw1gDc3CYLihyYwU?=
 =?us-ascii?Q?BXA6UaHNGvbFvApxq0RpE5SS3Mxe/cIxxG+3sPNjZ3QnqjBOa+4odiaX3pp9?=
 =?us-ascii?Q?0L+w79wjomspVhPLDYXhMWYkVTO7DEwaDjwyyyESVrb7o9tdFKjgA5SuXnWF?=
 =?us-ascii?Q?j7bOGpOxv+Rn3J89kAcZOM5nj/oYgeQ+vC+h6IAhlY5EaOgiuvY5phb/gVEk?=
 =?us-ascii?Q?PWYWKgZ+R2FBwxHyVg9chRKZD14Ifjb0LNaDWL/oL2iXoMKGZtHfkS3r1a6d?=
 =?us-ascii?Q?1XZu2lshiuzqhpQ/jzbeCl/6XyJnmDAACObtgv+1hqVJz9F3XW/e+XockEaT?=
 =?us-ascii?Q?M/Km7JGyJuX2St2BuitvIQJ76izfbO6ykrw3SnoRoMlPrkoxLMG9/TM/TFVj?=
 =?us-ascii?Q?vC7AIdj7NqJ+WfjRQ13YW8Ry2X6GG40aMkscyBtA40/B57C7w9GTNEqseHCN?=
 =?us-ascii?Q?UQzHu40zQpxIEUBSGbtLxPzMmQo7B/NG7UVWg4rdzOS5t/YFZp6YoVFc6rsn?=
 =?us-ascii?Q?ubSruCllyL11DoX6ZXTPwcPgEMysr30wA0V9YEDFu3jvCAIlj6ohVZv97udo?=
 =?us-ascii?Q?ywO8NIw/xy7kiJmfuaLFiSeCckPnMOxZk6Z3daVear0CAl/slAZqCBZriOY7?=
 =?us-ascii?Q?UQSMKU63F0CgsRSRuzE6Hhiq3DojzUv7UhFgJt12p9reBwcV7ntw48XU3OBy?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e2e766-3549-40b5-a58f-08dd9fbd152a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 21:01:01.0696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWVON5WaxsCj/9OF3wkHWEcf+sm5HVZEp8BvRte1HrM3hYsHDBuaJj9+o2jC6fMRNYxa99KHRHZ+Q7vDK0G4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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

On Fri, May 30, 2025 at 03:56:27PM +0200, Maciej Patelczyk wrote:
> There is unmatched xe_vm_unlock() in the __xe_exec_queue_init().
> Leftover from commit fbeaad071a98 ("drm/xe: Create LRC BO without VM")
> 
> Fixes: fbeaad071a98 ("drm/xe: Create LRC BO without VM")
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
 
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 32c6923df7c3..fee22358cc09 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -114,7 +114,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  
>  static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  {
> -	struct xe_vm *vm = q->vm;
>  	int i, err;
>  	u32 flags = 0;
>  
> @@ -136,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
> -			goto err_unlock;
> +			goto err_lrc;
>  		}
>  	}
>  
> @@ -146,9 +145,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  
>  	return 0;
>  
> -err_unlock:
> -	if (vm)
> -		xe_vm_unlock(vm);
>  err_lrc:
>  	for (i = i - 1; i >= 0; --i)
>  		xe_lrc_put(q->lrc[i]);
> -- 
> 2.35.0
> 
