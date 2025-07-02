Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE4C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 16:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A717810E736;
	Wed,  2 Jul 2025 16:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlV/4wTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871CD10E736
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751472635; x=1783008635;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=th2E65+6y1eEP4kzfsNW96LgDodvYdZVnMeoHfpJLj8=;
 b=WlV/4wTIdZBYotpbMELzv9tWLb6h3sXRP0RxkxAGkAjrik4MV1owLnWh
 CALG1qM2pp+mA03CQ9+cP90nxoIBhUK7yuYFO/ePreLtJJut1nCcG3RKQ
 8hizw6J/oxCxxXrLpx/v0fIow2MsXGKmn4KWIiO4p/cesBJJsKuI773lB
 v8VdXfbuL/x4qFc6Kr9BAq4YC5hUxF1CsPDe3OLMHz328RC9fniKm9s1Q
 xETLesdgX5ElkoVKx6bXZ1KeM/zUdY5teEWoSf1FC/3wAmsA89+i5aZ3o
 HPuZazblrB+U4L/9Y6A/ti0kQY3Hy8klFKfmTPh+soOA/y7hF+6rF95EV g==;
X-CSE-ConnectionGUID: /FY0LsQhT7uq0AgGw2oqGQ==
X-CSE-MsgGUID: VGkLsJ6qSAekCctlJF4mRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65234639"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="65234639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:10:34 -0700
X-CSE-ConnectionGUID: lfMdM/mOTG2bflBW+fK1iw==
X-CSE-MsgGUID: R6LjweU7ScKgefAkO9cNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159810606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:10:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:10:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 09:10:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 09:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo5purtJweCdvqHJUpPh9vUeOFRfFcN4PccqSxZUPiDGPvDbA8LrE+HvUAETRk2b6FG0wPyZYOP4Gd9QdHI/sLD1uhmrh2V/YfPYGsAL06tZKxTX7JIR2O+gq3SA8QOzOQqZOa+bw8ar7I4V82vJUVDVNX1bezD7m+VTbsKig05ylL3XvoWogk2lSVwsVjpsHuSLIGmp3YLIbt9oJj5xQQO4NYIT46NxWF1b8TcNj0aNvRlAWAxDEiKEC2mZO3FVhYFFTo5teIrJxnuyI2x3/HTk94z51CdFFqlzzEHS+FBCXWR5Sd3fijJ0qVPZT/hJvn/G3BywztRi4kTMo7gTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgJYWLrtVSHOEUanKOWoN3mYebj1oyKTM6C4b1Jn5Dc=;
 b=yaVM/EiFef9olPzbwu+VT4Eb9RWJPii/OzcwQ38hOacZp7gXrYp1N5bAXFziTa0aZH509g31QvI/9XrVNSXrS9jKYySm07NkvvFoq6j+mnL6mLWrFfQTYwr4ggNayDPEOyqnh3z/MZN3gwBO7ucUKpMn+pD9KKjasnjE09K0+eXG0ZgnLaXRlK/Rc6gCe7vIy384fBjKyE2FHIU1mp2wgA2d5vwymLrZeLjUChHDfkObkSDFhxujxI42GumjGpJj+H4hn+Bw0jrrMUDVpfdyXjsx6kPe0DX5xmub832/PC3wqhXrlVZeF/mIcA48UOjjMEVpufe//RuEGSgPdsLtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 16:10:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 16:10:13 +0000
Date: Wed, 2 Jul 2025 09:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Don't allocate temporary policies object
Message-ID: <aGVaSt6g9og1Iyir@lstrano-desk.jf.intel.com>
References: <20250702142504.1656-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702142504.1656-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e6675c-47df-4f7a-7f5d-08ddb982ece5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PmQAU6eYAgCBONeRaKNz7CtYIurrrZZPGN/em6XiQAVGH2VhmGAfH3vmaLLp?=
 =?us-ascii?Q?bAAr7xjvUAfbgXMaNlUED69hK2BWRVLoZp5eZajDZJS7co6KlQ6Mfm1o26DC?=
 =?us-ascii?Q?b+iY213Uf4/CENCjRUmVF6sAg7DA/qt97yJgC5RDfJeiCye1MeeU0GiYColV?=
 =?us-ascii?Q?5H0ND9sME8hFfYtnC4uuQDC4it8KxkBS3RGr6SMCyR0cGmNrHz1oznkHyeF8?=
 =?us-ascii?Q?UqLu7aqvQqhz478NM1X46OkVFxW9WZFUwGTsY13b2zwhx1logucuhqxdzSu5?=
 =?us-ascii?Q?uD7L6LldsshaYdhe4RAJZSqOqHwH0Dmgl/0q2e8qs6yCsHuU5UmCTKlUuQO5?=
 =?us-ascii?Q?pEOtKfOZA6sy0KSazxkSjRoaeF+Z81W3oZvpoKvKRTj1Xi6cIfQmFDgkjpaR?=
 =?us-ascii?Q?q6sn74GMcmsBfGC+pitrcAJP0ITKmz8mzWcbGt5ink0vvQ5/7nCy9ISb0UGJ?=
 =?us-ascii?Q?iQEbBMN+kvkhiqTawnSuEFeRdRHQdOfSqO177vUog4Kd7B68nBj5iIfI1q+z?=
 =?us-ascii?Q?0vM+KARkrN8KkoxiCg4ppjC9k9c30Yb85uIJTQ5YBOh6zzpj0qJ3touXuTsF?=
 =?us-ascii?Q?8IOTUaTyDdde0NbG8R1epjQvlQ59mDD2Sm/81teMdDUzlaj9+Av8q2xicTYe?=
 =?us-ascii?Q?BwLfHcAl3IOL5hWKjfMPZMmdraXjcCrrx60kH3f0pVjf+O0IyreLlCO3R9xl?=
 =?us-ascii?Q?FO7OO/9v0ASdTFh0LF+q3Ia7iaS2mKoW4Cc2/MOT2H7Rt0FQtPqZO82mN6R/?=
 =?us-ascii?Q?g6i7IpS6LId7wE9w2gEUBnYIwN7YF7/w4nfndibw5+lJJ05jKVmlQNqOBxK7?=
 =?us-ascii?Q?yga5N3i3y3LUcI84orzGgO5iQyoPS6EakvEhjgYuqnZg9BNQ+p3oDeRwf+AL?=
 =?us-ascii?Q?1BtIStSFY+1sE0Dyt6a8FgO/hRfsKGB1n/SuHGCKIHMxK6C6ez078QypvgMa?=
 =?us-ascii?Q?JQUEw+ysxfoGCoH6YtqgfzJHsI0em7GGDIkWA8Q1+sWZn0OWpluMruaZkK8/?=
 =?us-ascii?Q?99QvKNIsxygJXoEQ3eFEUZbxET9rUWS2rZMYyCtfubafEHWhCG3gDKgM4lXw?=
 =?us-ascii?Q?wQDNWtJBjBuF/Bqb6Ddli0zh1C/7o4m86YblEuOA/TleftBxwF6UX7b8y2Sd?=
 =?us-ascii?Q?3D2IDOVLJheBNVfU+P+bwkL4m7iQudmDPG+PsEWftJWIcgXhBujKMAcCs9jC?=
 =?us-ascii?Q?2Jrjc6nYowfLHIUcZCbVR325Ji1jk4Rn/f9stjkRNBNTMzEAQS1kpUbgFrMJ?=
 =?us-ascii?Q?9Vfwh9LBdleqnNTrrFtMML6CLXyCBOvY1Vz+y72hK2EURB4HW/tlUz/5Rcj7?=
 =?us-ascii?Q?PlSBZYsDEUNBqtCgoAT009sswrCkdK1oMEIB2/rO3EfNiPVotXws37M1wbBv?=
 =?us-ascii?Q?9ZhEI/3wImXhCHY/zNZxKynqjnM6aZQ5R/ch3fNnLgSHkuzP9MqZKwI5ZhpS?=
 =?us-ascii?Q?Hce0geJJ9X8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?britSIlCgsReO7B1bFhRhwdyLPpuN+4KQ1BHo4Htp/EOB1m6fY2AM6Oz6CZz?=
 =?us-ascii?Q?ypgylvwG63MmYc5FoTJtnvguII0pp6ObUqSo1dVxUNy64BpQKlPDK1DcmVxe?=
 =?us-ascii?Q?r4qMCQsj+LXq88W1avRTVcddT5ZvdCZJFqpKvJKycFABekqwz/+uyYLMwIKu?=
 =?us-ascii?Q?hQ8x8YNSv1zs9jzgwa6CtFzNUMebvrurc0MlTAFonCOUquefLJsweLQEsAJ7?=
 =?us-ascii?Q?2OiPnHfpM4rHuSXzb8zVSsrkR+R+uaPen0W+ZuZq+7SqtOYUJWbrmKRqeKKU?=
 =?us-ascii?Q?6IDECSX7eDrIiV1r58EKmY4F5f2eGnXlHNjTPsdXHq+E4f9L1GMa2UDp5Num?=
 =?us-ascii?Q?5ikwS102B9tpq01dg+Q1EGKjjW/FQof4mhWkyw2/tEaG8qV9bUtmwpF2PhlS?=
 =?us-ascii?Q?6V300wXJpjQEh14EWfHSUbffU73NJQfgftQOtTXmsktQAC1WTYh/qHW6RrNZ?=
 =?us-ascii?Q?qz4s+b64xpb0KfGmMUZb5fS+25W/SjMpTx5EIKwyZUFTUtUX63GgGsXEv2qZ?=
 =?us-ascii?Q?h1Dck9Yf1HPIE/zgSn4HZKBZzE4bYTVqj2fm6B7ozyC9JAHsNWqoT2e//Olr?=
 =?us-ascii?Q?obkQbbUVlSGPImWe74pp2sbj5uBwk3sST+DBsBsPTCT6t/U/t64yNqZmw+GK?=
 =?us-ascii?Q?vpKZCB14yT6Lpyr+xFQOHx9/3WDQmouV57ozeaF4bOgHFsCsRpZ9AsYHD+od?=
 =?us-ascii?Q?jqGEHmY3mZuGC10Y9hyyCSXi8ZYzNIB55IlREIZ9AR3nLIbAANvatNqx4Bz+?=
 =?us-ascii?Q?natwj1h9rNWorQ7+1JvnhT/oX3n1WBaLIJ43SYmKxb2KyanmShMqcwftfU/4?=
 =?us-ascii?Q?hWZSxZvuvsbEHcA2IOaXOwJoepf4XjkUeP0YXCBMOpKfLKgP4aX0OtXGn+Yu?=
 =?us-ascii?Q?/tGFD/XhvDbVk6Zg/mhJiQ4Hd9Rs8PNzOo3dtW3lO4nUTq+NMMnJ40j+HTbM?=
 =?us-ascii?Q?0z70Ql6qJebD5TAJfB388u5kJOzhCuZ/SHNmk3XYQr+Ne2KVk2rB97853pJ9?=
 =?us-ascii?Q?z/jEVfEfLeBDn9Q3uIA3XUAoRmXgrg8syDL4GNAHRKtVVdfJdR6vE0nnIP5H?=
 =?us-ascii?Q?KBFUh16pnXyCLuf9j6Gw8cK3KgZ9WM78XEMnt+9iZtUGANKDZuLPxbzI6dpG?=
 =?us-ascii?Q?Qm7Zi62yq8wcDT6vEIOSOrof+vLwaEGDoA3UdVC5ZELfmp9pWTWTkWo1WBb9?=
 =?us-ascii?Q?3nmzKk9Z0SYBndmrbrw4tYdPbQAN7yvZAWyxle56qfiWPrzLcKpXB1DIFGI+?=
 =?us-ascii?Q?J1t4dcgeA8yumMIvbex9cv6cjmFeiHPfrhO2PPcStTvvMtoZeQLuhiKLCQt7?=
 =?us-ascii?Q?uW9W11TVglJlq2eiM0j/T44xaGKx5hURdQnvvwlWcB5Am0EHVPsH5hxzb0q0?=
 =?us-ascii?Q?SCLDon4DKtN5+WCQGKa+k5G2m8+v/5xKwLJ2BIGHF9RHqejir5jGk1NOZs6C?=
 =?us-ascii?Q?P+85hbJzAxhMWDUh3xYKe2a6Yoe1pWSwNJf0ZS9aM2IFQCQEsWIS6B9nGSkV?=
 =?us-ascii?Q?EKp6BR8NQchYF1AFqq7YCTjVH9LPvwmjsamcEwHLpQGxZ8Jf2QzcFCx9QXTF?=
 =?us-ascii?Q?N8uI8cu7BcU3F39enE7i8CFM4Firvp1id3ICgvDcxoyfqaI3g2Wruv+UI2U7?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e6675c-47df-4f7a-7f5d-08ddb982ece5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:10:13.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5nBvJrMTX/6JAlRv6lEnbmhfkD6ljYiZwte5cOYtN0rCJaRTlkpSJvl8P+Yls13Y2wAJ3uCBucG6vnYesMkGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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

On Wed, Jul 02, 2025 at 04:25:04PM +0200, Michal Wajdeczko wrote:
> Since we are already using reusable buffer objects from the GuC
> buffer cache, we can directly write into their CPU pointers and
> spare unnecessary temporary allocation.
> 
> While around, also make sure to clear obtained buffer, to avoid
> sending some stale data.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

QQ semi-related though - guc_ads_action_update_policies. The GGTT
address passed in is 32 bits. I thought the GuC firmware interface
changed everywhere to use 64 bit GGTT addresses to future proof. Did
this H2G get missed?

Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b4d81f4bd548..131cfc56be00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -995,16 +995,6 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>  	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_policies *policies)
> -{
> -	CLASS(xe_guc_buf_from_data, buf)(&ads_to_guc(ads)->buf, policies, sizeof(*policies));
> -
> -	if (!xe_guc_buf_is_valid(buf))
> -		return -ENOBUFS;
> -
> -	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
> -}
> -
>  /**
>   * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>   * @ads: Additional data structures object
> @@ -1015,13 +1005,16 @@ static int guc_ads_update_policies(struct xe_guc_ads *ads, const struct guc_poli
>   */
>  int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  {
> -	struct xe_device *xe = ads_to_xe(ads);
>  	struct guc_policies *policies;
> -	int ret;
> +	struct xe_guc *guc = ads_to_guc(ads);
> +	struct xe_device *xe = ads_to_xe(ads);
> +	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>  
> -	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
> -	if (!policies)
> -		return -ENOMEM;
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	policies = xe_guc_buf_cpu_ptr(buf);
> +	memset(policies, 0, sizeof(*policies));
>  
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
> @@ -1031,7 +1024,5 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
> -	ret = guc_ads_update_policies(ads, policies);
> -	kfree(policies);
> -	return ret;
> +	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>  }
> -- 
> 2.47.1
> 
