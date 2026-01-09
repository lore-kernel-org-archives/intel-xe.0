Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2C8D26D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 17:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463C310E919;
	Fri,  9 Jan 2026 17:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX4+575S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7837310E914
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767980597; x=1799516597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KKVSXbe7nViuuvHLcyFpHv1KduXuCfrmVHHtRRtwQyg=;
 b=AX4+575SY7VbtByzzLCtJtgkFxzumCB7O8igmSPjxN4e/ei74R21Dz0F
 qmXjiQ55MoVg6LCBBaZIj0Z6eqGizty0Fdoq/Laqr8za4XkCZjg5Ma8yH
 9oXF783kTiB85Ti+kyroxH5Wxvg2FkBraAfYo79C9DOvccoabPFdg5A6t
 Y7Uz2bUVUbubDXQKVHT9iEkZcG9nIylOw0pwPa9wyjIpOh7ip59EE2cQE
 0jBdYyz6Gnd6ShB36wys4G8Gm7aWDZMf60rh92EYVReMNpqM51hS3KD4T
 blxRm7bwV9hWkW1o+B7twrQ1RWfF+zme6r/QTcZJNZgn4anpvPOy08I/L Q==;
X-CSE-ConnectionGUID: Q4giTDXHTS6isK4q6FNIQQ==
X-CSE-MsgGUID: rUFml5egSeKzfTlH0UgvXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80815835"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="80815835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:43:16 -0800
X-CSE-ConnectionGUID: lz0GI+wdT4i82E8/+Jq+gg==
X-CSE-MsgGUID: v/xviTesQiWxENEJmhS84A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:43:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:43:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 09:43:15 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:43:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXzYE9uZ1vjN3YMoSVUy1p/xAV8b/ufavR9ispRfNtqdFH8ZRs6+Pm8SPktHIPslbsn1jp/4HUr8ozbYpgz+LXU9JcUnE7P8n6rBlXNOOXi70x9bR5S/h/7R75o28fmU62Ga0GDUAP2McnZYQWv1xbQTXgwSLzJI8iAnT8yM8zi55NuHuXyKLGQ2N23DcUdrPm4Ped4M/9yNe/lAtSfnroT7q5Xnyc0PTuhc53UDLTp2cDhwa8K+rwEaCY3EVgM8jJVIYj/tLB4tiBt1ZDogtI1FxlZXF3f0SMmSOljzk4wudqfVCjlvXm49N1QlU4QCXsUHpYrQpIDfzlEmaYxVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrSGZxe5vAKfogQQMRV9B7JqzYs0/1opEnWlO3OmhU=;
 b=q4QAtSAoIqY1VeP4BfMQnsyJrLm5DJJ8X5hvSYnnPJH/2wRV8i0y5njnF3kfxUjOvfffdZTW5EAAiZU5czVBJxTuUpUQlkOjc+jY6Y+TopxnaRQrBXcXoOxGWNj2IIhvt42CHI3VDJ3e//dYZdDc4OgDOyTerJ5v0c1M/aYVKhoK23YJCzcmThbDawM1nIH79og93spFw3gCg6NjuH0gxuiyo+ZsZ2MIJDSqDVSB7n+3xr7+Sn5ElRlJZGtdK0dgiPbi3phbNT/Vbw//VOnhzleOPhaBykQWrTkAmqL8Rse73KY8dJlLU5d2dMl8svJ4HOD9/KNbQ9Pj6uSgFnHFEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 17:43:12 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 17:43:12 +0000
Date: Fri, 9 Jan 2026 09:43:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <nakshtra.goyal@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/xe_query: Removing check for gt
Message-ID: <20260109174309.GA458813@mdroper-desk1.amr.corp.intel.com>
References: <20260109093937.53584-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260109093937.53584-1-nakshtra.goyal@intel.com>
X-ClientProxiedBy: BYAPR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:a03:80::34) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a8bca6-7e62-4c73-2f3e-08de4fa68f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F9z25elYyB7XTy1EpSqTdyox1buKXt9MlwKMjQctGTztdfRpJCYKZAFd6WW9?=
 =?us-ascii?Q?uTVqZ49DAkOq+wo24E7Pjog/8jfAKi9LJwREdbN6+YwBunVhag03/dO69RsW?=
 =?us-ascii?Q?DbrWAr9JXA6BTptBZdrhDZLTY53jzK7QFswUyASBoWsaWil8W5zVRQ8Ct25d?=
 =?us-ascii?Q?XnVOVVH+Ue2Q6v2GRUhTpK7TTikyv6CFxICiu2io1U0O3NcsjSzH+FRs2w8E?=
 =?us-ascii?Q?JhzQnWvkqc5ipGybmIS/T/U6jgXY6Bjt5FPzA2zQZmCr1j8G2roRoUq1MVlo?=
 =?us-ascii?Q?gc1+ungdcrNHY7btWNO5oyT37WREIAs7bWqX+dPw8b835E7VnYcCgUISdtNB?=
 =?us-ascii?Q?ZQJ7rGiQqf5IWnUH7mz5Sha+w/7uDPwifAwbIFQKfzw6sFnYpbAsH9JDFR/Q?=
 =?us-ascii?Q?3ZaKgzOZYmVbAqpGPIMMRe68bUHIAR8Tjz9S6XbNlGA7ncwAg5auSty2ElS+?=
 =?us-ascii?Q?WKc9/7uSDYLuCWQSoHy1h9bXS6kO9KpeUoQSfO/O4CBvbex3Re+GzZI1pzZ2?=
 =?us-ascii?Q?zisN97OjWz5Z+vmZi+1BVTb/ZUdTCVPUPpa/s3SDOTqJPcWodiI/SNWnfQY8?=
 =?us-ascii?Q?j4TiV74MNEFCP4KefghhSyd/D2HEjgqM3Of8tbKYBn5WnZz3t3sADokIecx9?=
 =?us-ascii?Q?DCZRjUY+bSxomz9UHUXR/cPhutDgkobZrEJWD3YWoBjfa8GPi5orIh0wdvqc?=
 =?us-ascii?Q?/Oac5IYP4GYhuwVHBINSDG5K34K+h9bxPm+/y4naiKFKebXJN4XdBLV7Oc45?=
 =?us-ascii?Q?Pb8LsGwOHfnLbX028NLjSyiw3KwLqqwOg3MztPWqWFEduscU8KthBjVUa/14?=
 =?us-ascii?Q?eEYHTDQ/fb5Curi4FRFKO1R9yNo08xYHeJGh8FVRny6in2h6tzoFurzE1/KI?=
 =?us-ascii?Q?AcO1PN0ghGb673xrI8lFrZOxOpxZK8dZ9x1lpDo6/eqwKSmtgZ5PNlOUwmf1?=
 =?us-ascii?Q?bPMzcHsjTaKDNQwzo8FSeatynqcWaPgEYtMXLHf//MPnSECzatQSHpfX8uRj?=
 =?us-ascii?Q?NNGIJ+WtXpXmU/Wku/5DjzDwU14YejPguO8BqGFEANWiSxSh3Awvz7xUOF/7?=
 =?us-ascii?Q?kFjL5GeVy03m3tJHYHizn008w0zcLjnsTWppMemrOUVx8huZOPnr5E7RbE0S?=
 =?us-ascii?Q?8pfH0qLSzChV0mCh1lFE8u8gqwyz7glfZiNd533PSL53MrpkrH5NMqfZK9tJ?=
 =?us-ascii?Q?T/vGejUl2k4bY0zkC2eWbNUvucbGo4reJG3luPYrR3QzodT3ugNt2fVmPR9Q?=
 =?us-ascii?Q?2K8PJHsA4d3nJnN89SLdt7b7h5ETTs2tUkjrubqWZLWyTxwmPOXh1swU6tJ2?=
 =?us-ascii?Q?rA4qlEW1OVi59h+1r/IStl0N3YIZh/6H6dpkDtad3YBnLerkiRo9CNuaicHw?=
 =?us-ascii?Q?yDZoJIdkSbZnHhTW5yOXavWgzUrTmuWyMnbMrzKO1vgnw9UTbaUxCdkvVCdl?=
 =?us-ascii?Q?Rz6bMxACQkRzryoxsQ7nFEroPdAC59q5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdwDbPjndQ7ynW03Vz0enag7H2fMrtV/UQk7wQ6CRxpS2gcxl29B6Ff4X0Nk?=
 =?us-ascii?Q?PY5q3s1nKMy2Far9efxx3RFoMyvsybe0+6+xugF0PwnMdEz9a/c9hyAOvrQy?=
 =?us-ascii?Q?GWYjPCxc7DI5AQG3K9nKFrazKyYDq8XmxMSzd/EAoxSd2BggJj+szSU3PSuG?=
 =?us-ascii?Q?PC9Kfa6cNspg1NsWwd3kfRv9fLzEtd4aG6HICkL9VcmU/XGygFFIzTvbcRjD?=
 =?us-ascii?Q?gDiR4sPTwWFLamoqO69JodNvx6Ew0hLC8VqtjjyJBTWa/HPhPVqX+tM/6+KJ?=
 =?us-ascii?Q?u29Axg+2ZIZ1kFGNWtC6GMJRhNObT3N2N9WuRP7rkV4gvgwBO18hAQ7Wr2VW?=
 =?us-ascii?Q?rxYrZ6DQ4N4hzvFlYuDGmE3oQCnz+KikLJuIE/1RJkE2dTsljfWaXzuMkerh?=
 =?us-ascii?Q?aDTOgCfVHzMCMygtUDIVsaTj8n9v3+xSdSy7lAj338lBuotD7FRzM3+shx5p?=
 =?us-ascii?Q?wUOztgp4VtErQRWVvEvzCaQEF5vbbHUtGxHFCCwKsdJw2a5e+xkIXi0Cjywn?=
 =?us-ascii?Q?k/S+9DBHES1wrBLlKA8Iq3HyyiEXVhLWCVjLcoeRG1H6/jDYmQ6F5w8rQphX?=
 =?us-ascii?Q?V+6anpZeiTGHRBhvCMleT47uleB1JrY9z8EgCqzC3bnB3RbMW0sRaHbvDw3k?=
 =?us-ascii?Q?d8dop3ehPKHkJYt0V/VUJPmw/GVWS3g+kxAy207cmqD1AEBUiyrl1XwKdFYW?=
 =?us-ascii?Q?t0VC7GBvPMvi5ck1d43UWLvUUpJcVkOYrbdjrkXkvmiY6ovUBc9vgvixyxdC?=
 =?us-ascii?Q?6ZT+VxQwaZh1zFZ/Uphc176CezPWiQxcSTShgVjy59Ijqr2FM+OUy2uW6/0l?=
 =?us-ascii?Q?XM+1X8mlB89ChRLNX7e/VnZ8NQAV16bfKmAVDSLx6y442FVY0Zydz8IOkeUD?=
 =?us-ascii?Q?XvsSsIONek7VnWP2YP7DafqalE44DhfQQ8rsQ8VrV3oo/q6ELfLpHdgeVs/Y?=
 =?us-ascii?Q?6aYOvP9pFKPnF1PVzLc84lEPORWUZ56lny6mKKe303bZXuSLpF1znqYZ8+H6?=
 =?us-ascii?Q?tDS1CDYDzODi/xhJQ1mapd2XAKsNAJ5ul6SwX27qLViGW8OQi/WIrnE7Rdl9?=
 =?us-ascii?Q?5TH2fp0pqJKx85FCWoY5emgMLByp287Lj2PGshgLFGCtjlh1r+GJYvwCDPzY?=
 =?us-ascii?Q?Saoclmn2IE9w/hX/aWqO+1XQnlEgD7TC+qG3f2RDZWU3X+7AMLzApQ0QoJLX?=
 =?us-ascii?Q?ZAvyn1RCo+geopar7wk3fNGP81KuBM8AWUR/JbBj3AWlKP5LcyQKGILSp/NO?=
 =?us-ascii?Q?WHkbziU4atfoFqmrH/+7+ILyjszPTJbuVxKIcYo9Uqj9CO7nNZt+WrvTB+R8?=
 =?us-ascii?Q?FgcPzx1uaaw/RS/N4bpA94bijSNFvMhQLZ9Ji7NKMO8fnJfLeHaSVPGKXaVd?=
 =?us-ascii?Q?K3kwUakp4ImHSQfdAwD/gzZL8V1ejzE/HPU3vhfDizntpQMnAzTnuP3+p111?=
 =?us-ascii?Q?WpgUrOD4NtkZ1EhRuglSfMv7fQ5TAGqOmQEbk9EKcS4FUD1ENjU3mESnKzLb?=
 =?us-ascii?Q?qrIuKfMmAquC59UvK3P+B4+B/6jm9YPmjzyWy/nYTc5FxGtJRvyK+hdIvnbD?=
 =?us-ascii?Q?D0ISXMODfmGhXiEpc63MK4AfSn0oL4YJNtM4qurqrnR9OUJGxUn82YUnZ7i9?=
 =?us-ascii?Q?kdnCk6LrO9o12LS4Rf0FcbYgNSC6vRbVscHCPgJSjKyaOI0NYQ5EmJbiBWjb?=
 =?us-ascii?Q?zLr2WOdQlbUTuHRhQ1yh7TO26I7tjR4V0PqzNjco95gClRPj0R3X0KMafVHU?=
 =?us-ascii?Q?CjvzUKAer/Upsk99o6gD+WZ9UZJtHpg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a8bca6-7e62-4c73-2f3e-08de4fa68f3a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:43:12.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNg993GRErXqaV0E6+UkBOof2a7j6j5do+OHecMw4YRBoA3/d/9dy9bSoZja7dq+ZiunyAPU3Gu5RIqqYgIIKvpH+B0Pe3DaPyQ1uqFNKhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
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

On Fri, Jan 09, 2026 at 03:09:37PM +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Removing check for gt as '>=' condition is not correct,
> check fails for gt1 tile1 and correction check for gt is already there
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

There's no need to check a userspace-provided GT ID (which may come from
any tile) against the number of GTs that can be present on a single
tile. The xe_device_get_gt() lookup already checks that the GT ID passed
is valid for the current device.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 75490683bad2..b7b4261968e0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -142,9 +142,6 @@ query_engine_cycles(struct xe_device *xe,
>  		return -EINVAL;
>  
>  	eci = &resp.eci;
> -	if (eci->gt_id >= xe->info.max_gt_per_tile)
> -		return -EINVAL;
> -
>  	gt = xe_device_get_gt(xe, eci->gt_id);
>  	if (!gt)
>  		return -EINVAL;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
