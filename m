Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900EBC52D6F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 02:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E04D10E185;
	Thu, 22 Aug 2024 02:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnX84ye2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BF710E185
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724295056; x=1755831056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H2tX5QQSB4jfoFQIRXIPirhpCgVnse/GuNgKjr9ZXlI=;
 b=TnX84ye2WpyREMj7aOB1J8nvc7mBwyOrXDjv2PGtruwProvEW4Mb7tN1
 nhe/1kuZ5AmFxshkCB2FYmN9FRAH++ity6a37NAqUssGcGIsOCPeYcRpp
 Bx2YJpmRVivMd2lZckppVYc6xZzaLuxytcegyUXVWRL0kdRNfLDAfFezA
 gkPmpltFvdnledbn8RJiRt3o0v/bP+HhzCB0hP03oSPLTsRfOLpk99Zqe
 GCWxxgUVRiiLzZNCJmdLPWzmkcijLuGCdSRw9bhWK0yFINtgH3zED1AjR
 WmzBCfu6HIjyLtRPT1ly2tft7BNj/NkElzocnxZqDpQ/mrm6mxJLTnnIS Q==;
X-CSE-ConnectionGUID: TuZb6PnkTt6g3b+iSIP3bw==
X-CSE-MsgGUID: 0CvMNs1mRUeyrZq/xnSrew==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33841231"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; d="scan'208";a="33841231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 19:50:55 -0700
X-CSE-ConnectionGUID: zVrg8FNuR6udSF7Enypavg==
X-CSE-MsgGUID: jTiQBFhHT5GUIzEE0KrfgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; d="scan'208";a="66238233"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 19:50:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 19:50:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 19:50:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 19:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZonZKvPaYf7FP0Hada2QWvkRV3BK8TgKL78pPU0/5fGqkG+sIetmw/V0WnYeWwaMsOy+QvdJ7RSSitJjJaLEcKOESzflXQWpOMukLRPZv5Lbbf/vBW1NkZIvD6X8VA7XwpMlGV7ORd+DTmhMUDGavgyVKeI4YuXrnU+EMHCY/9LlP97dEbQBrLxJVl6hBjLgSwe+pPCn4ZRRAjGf2pR5aS5xa19GtUmnRk5yCkZt1q6PCJoODC4HuWLc6sPsfInTGqGHBjaV2Mu2T0/adQGpvcwW4gQQv222a6HQxtxdL9/ttXmTO69XB+ixBYCsHn9WipBzoxKcgDTkH6LZoluYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSEps4wdi/4XG0y7+LRzGBMbYUaQDJos2KPvTz7OKiM=;
 b=RZ4TbO+MqPLnTn59U//bw+p3Pd3j2iQWB1e5atcIOfCw4BTNIYPD5hj9ZUrh2Y+UlJVxdUIYEX0xah0AIylio8w2nmYWQY5sKg/7eKYpb2sj7lFOAMtTcDo76FQm0mwWFytuTpbpAdK7vElrfRrvp65WbVGsrj9bZtDenKXLRg3yuhl6uQJCodZBqCRjONX49RsVwNaP6RMt2kZ/DO9DRVtYUxsO0tIZD5mBKZ0yO13cLCaMYFUvn9RlAa6ESr91FHHQ4CiQPa1dEMld5+/Bd6iAljpCuyfDNod3K0e1eljvCizB70iHweDw/DD6f99H1M7fplAxhUBmRo0YwyRLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.29; Thu, 22 Aug
 2024 02:50:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 22 Aug 2024
 02:50:52 +0000
Date: Thu, 22 Aug 2024 02:49:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: fixup xe_alloc_pf_queue
Message-ID: <ZsanSW3JhOEmRNfy@DUT025-TGLU.fm.intel.com>
References: <20240821171917.417386-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240821171917.417386-2-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cc6624-6082-4267-ccfd-08dcc2553c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cwINq7BV/AGI6t0opYc1zlOE8Irj5BzmDmTo+h2xkGZumWuCJxPAolhMecXV?=
 =?us-ascii?Q?Q+YX0pSAgBUCrCkUOG61d8mApbMkyGvq6kW3mYvh61Rqr69ydNQdtFOnhrmo?=
 =?us-ascii?Q?f39PkI8hEthRtBowX3knDXDFiIM6onvCdtge6F4IBgM0IH8cNe+kcC9YGuCh?=
 =?us-ascii?Q?owG+Zm5MRw65hxWd5f/p3HxjW9+G9wTfcWjLS0j6wkhnWKnezKAg9aUbEjUd?=
 =?us-ascii?Q?BIHMAeo/rYOophink0dc1rQ0B9MP3ibkH5LnZmmeFbEDvgTV4jIQty2myuYB?=
 =?us-ascii?Q?j10/gQDOitcG14JQpXs1CUppQLkeFQP/2LqHGlKUmP9ixRYfrMN7ufnGCfNR?=
 =?us-ascii?Q?Tu903n+iVI0o/IUrOa8JE1HVwhyqkoQOLPJPw5c3YHJVoW6OsOFmaZ7lD+8F?=
 =?us-ascii?Q?emKh7k82IajbuypDlcfw9Dnp6eLCENrxibiBnb8m5qm6b6nCJ6SHULTWqnOa?=
 =?us-ascii?Q?1l63WjDNKjiCNXB1GM1eZ2V9t2HZjZsNRSp2YGNh09gA6VkX76Dtdfe4sjop?=
 =?us-ascii?Q?reGIpfbQXIN+G0isGtcuEIsmfSKg+MpXypZ9WOnbk1+RKhs5bewzSTQe3wVV?=
 =?us-ascii?Q?bWRVxb8EDJ5tzukQi9UjPZIZhVtRDU5RXq7UMD6u2W6r+Cqmhdsi2z68UNMy?=
 =?us-ascii?Q?2QBXGfOI3/Qs63TUlLbJYye2/h6X8uo93ddJG+TA0OQhqyny6WW9nviJ6NQ3?=
 =?us-ascii?Q?xpJNSTN2c1q3kN56KeHp2Jo45IMWI99ZZJprb+Yjbt9iX5HMj//k5ZZ/9lF0?=
 =?us-ascii?Q?RLGRN7t7GC9jzkC93s9Vor51PaZY+rA/519ImUXb/yKFCJyiGBf9/jodbMpk?=
 =?us-ascii?Q?h7RpO0ZTLOUOcQf9GRfiBCOPpu9tBExsezR+lr4HQszE7E5f7Vt3DrHgqU02?=
 =?us-ascii?Q?hWWrFg0Xsi9t7PQyQTI0kadnzJLwXgdriN6qaMiosqLm9cCz/Az1fVi778+0?=
 =?us-ascii?Q?3FGHRqiijR337fJz5Gmjurcnpr9nZsX0IwIhuEN+DWxG1azr/KS+4roaqO0j?=
 =?us-ascii?Q?9zglALdKlaBzMp4YE6ARCnD5Oz1gLbQWJ5Bb0v1KBScLLcXwF9DnfRNz1PC6?=
 =?us-ascii?Q?SRIuVtzieOVwdUWgj0ghzLADhP39G8wyJJAn7Av94FknJD+Bzj7g1LETCSJb?=
 =?us-ascii?Q?37Nx6QU5DOx/ORK/A/7qYAZ/DSiZpxLe59x+00pcLQSJMwhl+eM6i5B2UKNo?=
 =?us-ascii?Q?25504xOamRSutIER0dojYtpXxFC/2MYrznwHwhkgVrUTdFLKi6MabMjBFgT6?=
 =?us-ascii?Q?w+p7gBo7XUBkWLor54CwhtEvTo8wk8i5Yk0Y82E5XYjAbUz62yM9UiNzGTYo?=
 =?us-ascii?Q?pyV+pmGQqkn253rnPxGL3jy5mMC66CZUolwz++NbbeOxfw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDWvDyC9sS0NL2GYq6dNTVKC2Q2WNjufM7N3L4r78iGGj8/8JvtF55WOTNcr?=
 =?us-ascii?Q?p2Hxtum+Rs3X9P4tpoDJNdFRplRu+3DIaG7DbI4wNPS/6cT0j9M0oz8qzj7Z?=
 =?us-ascii?Q?p8QvRtxuhuDIXkLmKOrstmHi+l89jrHbT+0Hpv9YdIXbiWOXt0BWjZBsRFKn?=
 =?us-ascii?Q?lIOCm8j5qikydM3NfWAHAoeZFSS0yO82VEcFrNIw2NJrM9VnoT+bIdE1tNgV?=
 =?us-ascii?Q?QG/N7eAjLISJDRvTKu9qeTqWY2t5lTZ/0de1qA+4A9dbp7vZlLOBYbVXACt2?=
 =?us-ascii?Q?KMOUr+XzyLsb6GgenlPh9oHBVc2xwfb+lBoHziF8utYU39RHV8jkBHVL92iE?=
 =?us-ascii?Q?vML8WdbYWNuzmoLeAu4WDpyW8jYDcQ9aQWtoMkIPGWuCy6ytxveEB1/tDjII?=
 =?us-ascii?Q?GgY5BFHICwAUVVct8tENIM9hTsLoDLqYy/zThURZ69UVFTt2CLc+ihkLr1Vm?=
 =?us-ascii?Q?t0glNPu3Va/6XBhWscMi3KySOMRqtWNT5PXK/8J+DWYCWJ+XGEGlU1GewcBH?=
 =?us-ascii?Q?eMtE/A+al+JmGjF1KDBe/T9qz321WSmxWCfhOqpJFS2zUyziLSBvY0YT7paS?=
 =?us-ascii?Q?KhIwTqb/CGv8oPPS5P7Aqu5wxFLCqZ+FLucCVYGEktGK9eUK+yVmCKzC8DlG?=
 =?us-ascii?Q?40GuKqOBV5Cd7d0qX621RN6H8GhEJJZjt3/jwWmhnjLfiEsIIAUryl1RcbAn?=
 =?us-ascii?Q?HfzTv9j1kca8CItQMbxJn9jRmNV7Op29zDD3LS2rwaCcpZP5cuaXCkoUn3wr?=
 =?us-ascii?Q?0ug05kxZq9lNVhYOm4Vc+fTfENxETJVw8ekesSokoIrq5hFZdbGSrWMnSoX2?=
 =?us-ascii?Q?oZrsbDLc7jwWpjYJNZ2LTEYju9PtmblU8MZ4NPconmkvQpRZiMTGyt8Mz0X9?=
 =?us-ascii?Q?6PozXszZeYo5Z07J3GbEGA9SX8wBT2ECfoRhWZcYziOxWwi2bwszzP+LHWig?=
 =?us-ascii?Q?/RS4nYe/RwZula0uwVLUAdqFsGitfzgVJul5q6WM1DvSz10niA8t3KePi5oP?=
 =?us-ascii?Q?oDyAslEcHgPK3UyUyTBZd8wUH1HxRIOe7bVU+3y+Dmg/5c4bVN+lOmdhFIfn?=
 =?us-ascii?Q?yo00BhHCswwwSe9NEAemdSi/Fjcgm1D8OSxBXoM/lHsUXVr788DwpVqiOHc1?=
 =?us-ascii?Q?gRT4YsDI5FzMYVFRliqLIe0rqsSIeaZ253iwvdcvCg5Mvg/wImNJQvnGHOXH?=
 =?us-ascii?Q?lc60nUYZtA2ssHPu+3WK5ItVKMMev5AYUU4n2fQSdliUcbVzfIF5jJMwL39q?=
 =?us-ascii?Q?bLid7Y0g3TxoLkToZnt/vm+h5SzZ0N0qljt7ngL3fMtKbnRNl9qLWK0m95Hv?=
 =?us-ascii?Q?E03aj/OE+Yl6Pup4VltWpaZaQsQXLaiOWL07Um5DUzUEILOYwuxM+o0On2he?=
 =?us-ascii?Q?JwLvf9eHyZy0dirErnkjZdhBEeA1B9bGeG5rxD9UKtaxYE/NmZBWRfCgzTdM?=
 =?us-ascii?Q?rRrNlYHScw0K127BOZ8DuiWGqpQbhLukFdsRu4sB103lS+sCtGgolr0O3a28?=
 =?us-ascii?Q?YiPFMJj2miNmEuburt5a0wv+twOUIWEOUQ333Q6bliUmhNHVZWtA53Vzi5YQ?=
 =?us-ascii?Q?quGj1+IXKB2l4feKM3eqDBN7IOSgitF3wz8U67u/EiZA+0zhxeLEJxb1H3h5?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cc6624-6082-4267-ccfd-08dcc2553c56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 02:50:52.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADdSUzhR4uGA7rab75pVJPEBR6ixt94g0B7qD7GCDr1voSxxtdIkdftE4fFWauFBTBg6GyQcdPEeTdYTjOA9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
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

On Wed, Aug 21, 2024 at 06:19:18PM +0100, Matthew Auld wrote:
> kzalloc expects number of bytes, therefore we should convert the number
> of dw into bytes, otherwise we are likely just accessing beyond the
> array causing all kinds of carnage. Also fixup the error handling while
> we are here.
> 
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 401c0527d914..e4510e56e4a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -417,7 +417,10 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>  		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>  
>  	pf_queue->gt = gt;
> -	pf_queue->data = kzalloc(pf_queue->num_dw, GFP_KERNEL);
> +	pf_queue->data = kzalloc(pf_queue->num_dw * sizeof(u32), GFP_KERNEL);

I merged this s/kzalloc/kcalloc based on feedback from dim.

Matt

> +	if (!pf_queue->data)
> +		return -ENOMEM;
> +
>  	spin_lock_init(&pf_queue->lock);
>  	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
>  
> -- 
> 2.46.0
> 
