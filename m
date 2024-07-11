Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731DCC3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 18:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7810EB43;
	Thu, 11 Jul 2024 18:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6dm31ry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30F10EB43
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720722796; x=1752258796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K0E5kacbAnRje9+JJ30mfM9ZPIIV6YNf7IS1FZ2aFtY=;
 b=D6dm31ryBdNsrRI//17IKtOq5bf/jCdgUu8o+yfdULU2K/4fXE3Itcml
 9XEVw1RHT9QLzofBPUScDd0Qe84wWfuKLJf29JwQxjR/ytiVQmcENmxOT
 aD1NpxOgdvDvkyCglCahNP4GpbiKbk1VPMS2LPl6yBrwjuD9tKONhp0gq
 z4JrwXHUNVGlVEX0Fw/bRKXv4IK8tnVcifpAYRDCsgxlDQYwMzj9Qu2le
 TYKDxI+xgCIhKcPrP+NraGbcil+UUOhQ6uatlo9XAyg9ey1hs4cMtl96i
 5WVOLQZyXmWTK226X3uH4ASjiwfuSRic41WfSPoaGF56GSuu8Q1VWicF1 A==;
X-CSE-ConnectionGUID: TDN3YroETnGWVS+pix8D0Q==
X-CSE-MsgGUID: POW6N817TN+Ixsa/+5tpzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35564645"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="35564645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 11:33:16 -0700
X-CSE-ConnectionGUID: 1a83PDuuSie+xwqZjTqevQ==
X-CSE-MsgGUID: 4tIJk5eQQWaDsJI8xnMEYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="71861733"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 11:33:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:33:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 11:33:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 11:33:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 11:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfmHYWg/+4nc6XbMZ655hHB3xzan2n7gqIwyLMfqKmks+sT4ksodHHsASp8FoqbFw7ovOVL11rB7lKA/r4IwWpKJSJQXJVf6fhgaDifzU/JNsdRoad3d2CCNKj+0/bw+I8xC+CO42CwOxZ3v4h//O+S7mSoFHMx3rFno4HUboUP9vIEXV5FlhyThhFVsf365d1ssgeDGvgbervM2ILu9O4FuqCT6pNj5TEhBGpSbff6r4sU2BjyBPjSEzJY/a7q0RVd64Zt8flFlj7NszSqpSee8PFR4P9fdFGXYMqFr3GEVpZfahTOedx0ws9FnWnKTbjwOPZvMz4tC6SjB/YDbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2URgMf60yr79Km/TYzElFxp/iS8M4lJyLRU23erGjGQ=;
 b=rWOQWjxnI4eTXks6nR/pkIOJH1tqaevsVc8VOyVAS85sG6VLwLRMzI/clqkIGRch7pxeZK7q+2aXu5EIjLVh8AFKqEp/6R2lb4VuEybd8F0xFvTBkwnVrVE/6ol0RMjt52/JEi+nC41dTUNtuV7rlSTWccRukATo8sxo4bllIYjVFlBfaqDk+KUQpWKK/fmP1rDcnzBPDbaAqfkJ/aiF8EJLZIj2c5ahSLooiqGcfFWzmppRwc4GE5I1ZnT/fGIFQFIkOTmAhPE3TLF4Leq1swiLkyhy2avCLm+RktcYEILY5xObiuzer2ya9z2qKYFxBokXU8dp5mghiQU/sOTu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 18:33:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 18:33:09 +0000
Date: Thu, 11 Jul 2024 18:32:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <John.C.Harrison@intel.com>, <brian.welty@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Message-ID: <ZpAlNwh6Ylyy1GFf@DUT025-TGLU.fm.intel.com>
References: <cover.1720718987.git.stuart.summers@intel.com>
 <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 9338a8c9-6f69-44cc-3ca6-08dca1d7e99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ej5gLYGL/Eege3tRNltObviBcpBoer3HHIBOypmW9XRMtDTlmfmVs3rRxuej?=
 =?us-ascii?Q?zVcy/OEgNulsqvP9q7oHVDBaTaH9UVPPf6bkQRDtwQ63AZLoUUPnOOWqehmC?=
 =?us-ascii?Q?i/qOp7Owf8n0XLUpyFAX4QNVEqqDjTNVWvRYJ56rk9MP15G0zUiwiaESOFsp?=
 =?us-ascii?Q?veFgQQuP5Qw/xZfRjnT7gIx2F8+QVwOeFtP0hRTuvz9qkBO1cicCJfO+oi3u?=
 =?us-ascii?Q?M+sZIt+3O5Tlaaquof5zAKydS0msnyBUPC+ZHs0zgot7XqkwwFNCRE1RDCmL?=
 =?us-ascii?Q?Z2jWsgkzXaLr9P2pvG0XlKHn+X04IB4kuq/D+QLYug6lBty3cJPZxEYfTRbA?=
 =?us-ascii?Q?DYv5ZiJ6E8PdDLgZar8fK3uAt8KJWAPXq3ML63QyYaWYbu3TunRTCkR6SE1I?=
 =?us-ascii?Q?UCSEIyE+iz9b/iycyWSOXl40bnj2Uk2qHCtS8gMNba60rIgcx7ovEyP+tdu4?=
 =?us-ascii?Q?yQVaKsugStnbQImrBxldEIDimZdlEkdh1ms+YaLTW2dZA5Ke5juTZ0ca6OUJ?=
 =?us-ascii?Q?V+wlZUoHrXGiq5COKpQhQeMi2BAisnt4wt6NmYbAhAX7Oi1ZcNKPR7yYiLTU?=
 =?us-ascii?Q?SJCUq/iyKsFdGAqZRSNKH97zbPK9DJSncrOBnwC4L5l04CGM4ZzHoqW4LXcf?=
 =?us-ascii?Q?VHKdXV6ZJLG673CJD/Vvv2DfVN0U3rP2117x28xB+j/vd5epyU03kC71UZtc?=
 =?us-ascii?Q?E0rYPIVmXjOObni0QHK4sX6i6q829CeeCUSA+S160coPleV1chrp2OgdlILg?=
 =?us-ascii?Q?xVBy04P2AVstbnzwAfzuNi/5YBJkXxu0r883OxYGmIR89zRM5AeWqHtOCqDT?=
 =?us-ascii?Q?T71A4+5FGk7JMXIFCBCln7dcrdxFwm0vqIVT/x4//YjRIG9rFcob1ZCEPEHV?=
 =?us-ascii?Q?k/Fy3/B/grkFs6Pd7PglTKahuisOde/k1m8Q39xfuPM0igJWb9q/cQFrYxyh?=
 =?us-ascii?Q?EUpwyTsKV2f1BqQMNKMhnnl6KwXB56S52sR3MDxrRH0Yv9aR1/t+M6y9YVij?=
 =?us-ascii?Q?uihRVB0HLra9PmPS+djynoAAkE/yA/RPM60bkhqDPOiJKNFyYEpg6Kq9CbgV?=
 =?us-ascii?Q?BetRsbGEmbiPPyUCaj1idXFRS5MsGwwWOkQGOcbo58Vj9wXsMIgwJx8COs+Q?=
 =?us-ascii?Q?nWq2bJneBOkkoDiy/ANR5pwcxc+CyknZVu1NRZKOv1zjZRRXgzIKvsKOjJQ0?=
 =?us-ascii?Q?NeHzeohXzjSbNIHRXvQ5Hb5pESggHYC2mFHJ/kuBSx9X2UkmXwy/z8olTwh1?=
 =?us-ascii?Q?u1OOtI6Q+U33mgCLjMcDMR5BrErv8rFp8Dz9YJXf253UMl3JIQvT2miUtBFS?=
 =?us-ascii?Q?jm5LojrS6TEdfwxMMW0Mj5sQy4MLWC1c1UT9GmSoaOrEJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+KcQl+Q/+0krAlv1fvz5yt2f/UpQkKR7hxLFqJIneDaP5pzU0ic5leYzgkJA?=
 =?us-ascii?Q?Sglqe4NSqlNASSR4XR7BYHMR2vtdOYsG1u8HInFZ/Es3DaQwQCdtgI6pTJcG?=
 =?us-ascii?Q?Lgozq4MHW5gjzXHNzuQuemBcuFujVtxue5v3D/ZfSxJN9cpO30c/b06cRT/m?=
 =?us-ascii?Q?ttURZZpP6E87/IfFt2jxbZ7rWHAdI9cIiA6AJQH55XhxbAlFqp6sIfh7LbWB?=
 =?us-ascii?Q?bobAa0FrhSNir0/VXxfkROdf4bXinIFNsCEFCc53gGog8FWrVwVA3wRT7Jqy?=
 =?us-ascii?Q?qk0RNWjejGce82l7Bh7+gYQtTtiFiRZkJkZf2p7G7OGIEthVqa9scB+KfJln?=
 =?us-ascii?Q?3c9W/zEbJILvjFHMpyhOLZfd4jQDyu9shbZ+iciwBgdO0AxExDw77IPYCQIM?=
 =?us-ascii?Q?aBuiJo/6bFHDyOY/EPh9Bwt+/D4ECSHlp1jgQIXL+qB8ytcUzSE+87FnTiEv?=
 =?us-ascii?Q?yFiBgHDe7DwtlOja4k+oSFM8FtJLvo/P337X/zLeFiw4KfNGvh/otRnD7ZLF?=
 =?us-ascii?Q?WJInjSP1/h/kYgXjOy5biqevR/4Do6yWjNwpLaLDrr9xuCWHRTaTsNcEA92A?=
 =?us-ascii?Q?8RUJ9dLbd98m8QuSUVHjrbyswx4/lYh1S5hz0TAXEXr24hNgpOz71m0D5VQy?=
 =?us-ascii?Q?mNwO+h+kufRgx/PIZO6pDOuVmlhoRq4M/6ZsLXON5PHauxC/fZS1+6CGVQm5?=
 =?us-ascii?Q?zBpXxETdzfHKv1fueGgmD8CvzzDHa0r/feSoqMn18Ek5lfCLyDLcM6r5FgTZ?=
 =?us-ascii?Q?vbZH+5sU64Xy24Mcbu+GlikQHu4d/WP68DytJ8ONoRJ1brquM8J+djBOp8Al?=
 =?us-ascii?Q?vs4cKccqSbhJtNMcD3QCyYiYo7PQnCK9R6qWiFG+9XVPi1kYvlQEIk6DxQkw?=
 =?us-ascii?Q?93UULJLdyzN/tthbGlFVQPm3sdqrv+UBtAX/m2M+RhowA3krJHtDVV6OHOok?=
 =?us-ascii?Q?0tLbgWhheFzApBBtU0CgvEFtjpbMHCLFeMeQz2MSqbxA1vBq7fhlDzLOAY6C?=
 =?us-ascii?Q?T0DBroW4oU9tVby2kYZn1Zzf2OAeNnmzLP31cMZw6njnGX6TSsldCVZ8q/9H?=
 =?us-ascii?Q?MbhYaK7ESqB7cLYQ169UnBOzIlH97el7m/wYY2MRD930CUbO4sI8QIlpX5pN?=
 =?us-ascii?Q?o/S4wHqYMqoyTAmLs88VqGpunLeoYzmxabHQOzkRTDZxTLODkY5ggy28/iSm?=
 =?us-ascii?Q?5Gzd7/UzcxyEu1YrAdDAo9H4WA7+sBAk6lATZIvpm7yZyb03zw77qeBmNoEW?=
 =?us-ascii?Q?iv66/3hpS0gdq9u172PBsf6zU0STku1o97O3kBAo+HMnSypagLaahs8KnXf5?=
 =?us-ascii?Q?h18fGlWKtILYCHpad1p3lD31eJWBi7Y3QXKmeIzx8qdulUg60zAQVG753tdV?=
 =?us-ascii?Q?5uU6yqyue92HGZQdM3ZnKPMg7C3sl3t6u0fMOSZNJlQfe1AEuQvt6/lX9h5v?=
 =?us-ascii?Q?BP1pf7bu083juVIIUJS1WLCrIfenpPQMbtMLElkfdD2jvGOgLxv8Nh791oZo?=
 =?us-ascii?Q?V5Q6vbbsQcIwl3GKK+B9IxI3WvwuiEnU72USFYPsseXHHtm+XNwDDECF01Op?=
 =?us-ascii?Q?TpoSmWUBiXUejOaeYu1Nj4+ttLRvOQXW2G9JYme7EIeL2QjSQwHHoe2z/9E+?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9338a8c9-6f69-44cc-3ca6-08dca1d7e99b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 18:33:09.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPcyi8UpdIbp2+xnQ1VNo6HemBkWE3bf487X7wUtJzFa5IiAoSiHIkEGX7EvOAbhBDqCM2ki5TChm9+ZsTQkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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

On Thu, Jul 11, 2024 at 05:36:29PM +0000, Stuart Summers wrote:
> Currently the page fault queue size is hard coded. However
> the hardware supports faulting for each EU and each CS.
> For some applications running on hardware with a large
> number of EUs and CSs, this can result in an overflow of
> the page fault queue.
> 
> Add a small calculation to determine the page fault queue
> size based on the number of EUs and CSs in the platform as
> detmined by fuses.
> 

Missing is the G2H queue size update. Adding this patch by itself kinda
makes this problem worse as if the G2H queue is overflowed by page
faults it is basically a slient bug unless we look at the GuC log. That
itself really is bug GuC in the GuC interface which should fixed (e.g.
the G2H queue should always reserve the 1 slot to communicate a G2H
overflow message). Anyways, to stay on topic can you include an update
to G2H as part of this series?

Matt

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 54 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++--
>  2 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b2a7fa55bd18..6bfc60c0274a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  			PFD_VIRTUAL_ADDR_LO_SHIFT;
>  
>  		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>  		ret = true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  {
>  	lockdep_assert_held(&pf_queue->lock);
>  
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=
>  		PF_MSG_LEN_DW;
>  }
>  
> @@ -312,22 +313,23 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	u32 asid;
>  	bool full;
>  
> -	/*
> -	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> -	 */
> -	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> -
>  	if (unlikely(len != PF_MSG_LEN_DW))
>  		return -EPROTO;
>  
>  	asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
>  
> +	/*
> +	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> +	 */
> +	xe_gt_assert(gt, !(pf_queue->pf_queue_num_dw % PF_MSG_LEN_DW));
> +
>  	spin_lock_irqsave(&pf_queue->lock, flags);
>  	full = pf_queue_full(pf_queue);
>  	if (!full) {
>  		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
> -		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> +		pf_queue->head = (pf_queue->head + len) %
> +			pf_queue->pf_queue_num_dw;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> @@ -386,26 +388,54 @@ static void pagefault_fini(void *arg)
>  {
>  	struct xe_gt *gt = arg;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	int i;
>  
>  	if (!xe->info.has_usm)
>  		return;
>  
>  	destroy_workqueue(gt->usm.acc_wq);
>  	destroy_workqueue(gt->usm.pf_wq);
> +
> +	for (i = 0; i < NUM_PF_QUEUE; ++i)
> +		kfree(gt->usm.pf_queue[i].data);
> +}
> +
> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> +{
> +	xe_dss_mask_t all_dss;
> +	int num_dss, num_eus;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +				XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +	/* user can issue separate page faults per EU and per CS */
> +	pf_queue->pf_queue_num_dw =
> +		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
> +
> +	pf_queue->gt = gt;
> +	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> +
> +	return 0;
>  }
>  
>  int xe_gt_pagefault_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int i;
> +	int i, ret = 0;
>  
>  	if (!xe->info.has_usm)
>  		return 0;
>  
>  	for (i = 0; i < NUM_PF_QUEUE; ++i) {
> -		gt->usm.pf_queue[i].gt = gt;
> -		spin_lock_init(&gt->usm.pf_queue[i].lock);
> -		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
> +		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> +		if (ret)
> +			return ret;
>  	}
>  	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>  		gt->usm.acc_queue[i].gt = gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 38a0d0e178c8..263a604b76b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,9 +233,14 @@ struct xe_gt {
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
>  			struct xe_gt *gt;
> -#define PF_QUEUE_NUM_DW	128
>  			/** @usm.pf_queue.data: data in the page fault queue */
> -			u32 data[PF_QUEUE_NUM_DW];
> +			u32 *data;
> +			/**
> +			 * @usm.pf_queue_num_dw: number of DWORDS in the page
> +			 * fault queue. Dynamically calculated based on the number
> +			 * of compute resources available.
> +			 */
> +			u32 pf_queue_num_dw;
>  			/**
>  			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
>  			 * moved by worker which processes faults (consumer).
> -- 
> 2.34.1
> 
