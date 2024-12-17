Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8030E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 22:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279310E160;
	Tue, 17 Dec 2024 22:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4nRgdTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E412210E160
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734475146; x=1766011146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ToWPOOGqYczOpv1zDpAqRYqy/TWi4G/O54Y6kdIUtI=;
 b=K4nRgdTm48nLHEREW0ERMfaYLCgeaG2E+5qTq22dUv4J+omRtd74fujm
 Wv55hsHeajueTMDGRAxCO2YXRUZdgr48EpeCl1z/VlJuylpnMiNMZO9OL
 ZgHAPhxpRLlG/pKCIi93StKs8c02syeC5U8ygV7SYyHRcgVLMnJpcR8d3
 fr+u06p2S23NNR60Fp1CULZzlgIS6BQaIBt1b4Gt/kV2CSrbzalLTGlED
 hmVpckEpH3b4SF8aHSmiRaJbgHTyUDCg6OcoeKN2XdUzk9LTp+k2k9Ig+
 X9MZ2rMyyzrUU2Dcxa4G2v9UY2MaolGFlby2clQVBQDJpRZ/huDomsVJP w==;
X-CSE-ConnectionGUID: gZZcn8w+SUuCLeVy96lokw==
X-CSE-MsgGUID: lOV9dXPtTuycnbhZMCqf8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34958708"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="34958708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:39:05 -0800
X-CSE-ConnectionGUID: PD+WFjBxRlWgPFDu1Herog==
X-CSE-MsgGUID: z/Xe6PT4QZmjiYrAEP/DSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="98095836"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 14:39:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 14:39:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 14:39:04 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 14:39:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIUJRT0I7ZgRa7tQOXOWUAhba4y3f9xMT7zrB0BhGwtwo7VEi9tBLVB2SySyuAtRbMx9kXH+JIUqiK5f2nKgIVogdak+enqdNNWoTgwu0h2UJ9WKgm+JkBBZMNhBy9DczRD9qXfaAFuUWZJDUNbuc3eKoNO5iXGJUlGUoMfvz5cSv2kstutT+T8trMceZpa241K4qxNFwAmO9N/G1WU0wRh6aUEOjUF/Nsp9256lUwg/rfSPOZV5wV+HzRnkiXNxDMIVS+2d6T1UZWNdT80NXdGq/sKmvzuBlT2ANAu//w3vmzuniDzjsC9SoN0jL44UtvA0IxGE639BD5AA2VvMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRLudO7UtrfVHTCR1/R2CEXZNWiIZvgwyOR29tv8Qhc=;
 b=DQRMmmQ/vRdDjQYG5RBYOHVXpU7bgFGSqoiLcu1i3HAdgzicMkH10TElurSbQvXMIKbMYdz7r0+6RZT1r0ISVeMqdu1KOqRsYJjcvAGW+9Uj7YS9rMgjwx0UifZ3qYqfdvpuw2ppejF7wjcvyfhzuGSZTbHCh2oYg/2eEY6+B/9hax24AkC2yL1xuk/tBNqt5cXP+wvBCK3RWX91U4DWoC9vCZ2kus+Bxmw9razbIsU8AIRpWIBgL2CCAnARceFdjZKh5GP7eM+WLj156Q4XThL0pkDBzUruLSsvVvYSni2HTVotJS82hrrIl22XCa9b56tOQa7Wmehm6bKE4H0SnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 22:39:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 22:39:01 +0000
Date: Tue, 17 Dec 2024 14:39:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
Message-ID: <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
References: <20241217222246.863-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217222246.863-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0187.namprd04.prod.outlook.com
 (2603:10b6:303:86::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9d5af9-20a3-4663-9c40-08dd1eeb9a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVetU0AvJsj/fAkiYWOKxFTOBOxG7/16Tj+6F96Z1WfDn/H5jr9rqqRlesSC?=
 =?us-ascii?Q?stu30PO7IsmKjG5bDTDylJRRFZ5E3KDbKxzDPpsBbiHdLUOhKBRtItRSnLht?=
 =?us-ascii?Q?nPoAkmptdk1qwbhmGSotMyQTWWk2ipD7G1ltxcxasjxK/8y48zrMnP5F4Skw?=
 =?us-ascii?Q?D3tT6n8kO7IRQGe+oBlTmfAfGUzzUK36Sb2v00KYMNYk3C3ZlBYJQvfqKFE3?=
 =?us-ascii?Q?4HQpIxFBggtGSKugrDYypcmpp/hsunixYkZ3BxnWMwZluedlpRfJ0DIfdjo7?=
 =?us-ascii?Q?B/HLPWYWiYuWRZvXTW0/mVm8LbjSD5ZkvruwlrxkmNvewvQEFyBk+qHbvUAU?=
 =?us-ascii?Q?Ql8dPZdUYCOlYhGrHr+6xJc5CuomWhJyHiIfwkjxNHe4dhtGHc0n4tYk87Yh?=
 =?us-ascii?Q?kff5MaQDS63B4Yvz+TmLjnShC8Kq2w8twMuCAUaVdrpbjc8QEU6Y3mXYuDZu?=
 =?us-ascii?Q?ww2EOVtAYAVz3o0eo7wNxYxyEZ0Xxi6QRx42hw3h2qwwOwtaSihFDxbTxQmN?=
 =?us-ascii?Q?G+N7zW6RrtK9Hqg/xLroEWoLFss4G1nQaQKzY/BK1G8u51OCU10EUB2JeTtL?=
 =?us-ascii?Q?gWBGaaf643DsjrPZTFSvEaU7YGhHfhEgaCevrnZhzZTxdIn3Dilbp0ylspfK?=
 =?us-ascii?Q?1siXsL0ttd+zfXW6VjCIcvjFm0nmuBZ/ONdNd0pUWmaTTZLAz0KdP4jr6q4l?=
 =?us-ascii?Q?I8+LVyd5NOvT+hymOgCPYlScz75XblZpAmmkKlZrQ7sCziAQrywLKx/d6k2S?=
 =?us-ascii?Q?cD2DPhmw9kaCap8qASd0/pErSofm04YgZyEXdiPeC5e/gmhYKXvhHlT0TByo?=
 =?us-ascii?Q?C3vwvu/Qz4pHSCGc6AojnHxrPZkeQwplBsjBnbcRCTs/fnS9wTTYzHHVAy2b?=
 =?us-ascii?Q?yOW/At76DBesRmff4rBwAYmugIZeXTSHGBfmD4noGK61AYSHfbf8ak2L8dCJ?=
 =?us-ascii?Q?jRaHn6zeznIBubtaUR5nr+b/R6q0LHNEUrCd/yAgna1ltIXVdndzjN6dYqqE?=
 =?us-ascii?Q?NVJnFEp2uEr/jAG+XBIGiZqVDblqFcvXwbAU5kgUo9X/tpxg1YBVD0NuB/25?=
 =?us-ascii?Q?5aOcwKBL/WBWCznkJCGsRWmaXbWji5MD15Omz9Km8DCZH+DMUnrJeVTo3NLh?=
 =?us-ascii?Q?rZ2D3l4ENcM49ODjRpjmRIzH5lYmJZtRoTrGAaB+9Yrdighn1hiwXZ8OEByO?=
 =?us-ascii?Q?LJ5cNMtjSEbMfmoD629+2ZWnDgOankE1fLCXEhnTCHJfTfD8fbmuWSJqbfEr?=
 =?us-ascii?Q?DyyFKmS3GOrSqHhTKCdZqJl3Tb2mXjk1V2MEIG90LDV1/H4m6Cl3HHrJaw4r?=
 =?us-ascii?Q?gpoqoymUGTO0iSsNh8kfKWrXzbyxNW0g8bGnwXAL9OuxnyVQd1GqEVC+kWsU?=
 =?us-ascii?Q?h2x9uFTtox9FDJObmPUdnL0JgdqL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14TaeNZt6J3UpoCvSj2NMdkqljRdDqZZGXCOHd0DcZwSGjiGt59OSzzL0bMG?=
 =?us-ascii?Q?UsvRKM2Gt2WQhBk563A1T8Ad6cea8VYlLruUMxJ8noYi8nfXZ61ix3tA4qJW?=
 =?us-ascii?Q?yNVqavDKrhf4iiF/xHY8cs6HeO6ilLkDZIbPSgpssKRdrEXluIEOEbJwan6n?=
 =?us-ascii?Q?yPy2dRtwQVigtT4bYsqEdGq8X3LBSN/ogD63zopRKJIatv+Kefd2xgYPCg29?=
 =?us-ascii?Q?ueuXc3f6W8urhFjjEvzHvujKFZdQ7a8ynV4JdBXQd2M+W1w18EkqvnAk9k86?=
 =?us-ascii?Q?xGfCh/tl36bbemLV1hylHHsh20ZskLkBPptrABELzZtNZxLY+rbO5Hk3LZKm?=
 =?us-ascii?Q?Wu+YPApmECUIyVlgbemLjjG8L5poVW6sO6BX4lJ05xWfOM9DJfaPVHXgpq3v?=
 =?us-ascii?Q?/K2RpQuIjCeU6b2JDX1g6KTLC7b6H2x97E2c3xUT5TRz99/5UQ0u6QKFV2nD?=
 =?us-ascii?Q?oGmng4cO+LPkRlcs7igBJ2THA1jZPMBVkcKkICbDgyiGaizX0iHP2iFalJFb?=
 =?us-ascii?Q?7wHyw059QL+q+YTTc26jjTHPPoT4l0ufb/my+4US3OVCrSgOrW23VnBYpwdw?=
 =?us-ascii?Q?aDv9MKOYdzMB2Y0A0Dcsdu6p7D8WXnbO+OIbazHBOFxBNo3tn02nKeKsQDk0?=
 =?us-ascii?Q?TesLXjgl5EHrXG8xM+vMrBFF4+3kvM2BSlwXxvEjA2LLRFwrgpFHQxvOvNt1?=
 =?us-ascii?Q?D2FdP1sDJdHKaEAKrMVo9yyefR5aPe1eZDr1rKKUxxYAXWTeFxU7a/+Rpu6r?=
 =?us-ascii?Q?o2rqOAdLKoupY8YUIvLjiq8UPuSTRYOl4i1FGTiv+bx5gTVu6P5muz9OlaOF?=
 =?us-ascii?Q?MIbJhCTc4UKRB0+u2fTzZWEk1PRIu2xNswkTdIT0IzWf/1JM8Ac8LHHcMwwg?=
 =?us-ascii?Q?Bqpnc31jxlaHZFeB+/cNTXKNSSPq2FTYZ0iUrYjzNSf+oj1syVQRxJxjfNXW?=
 =?us-ascii?Q?+k9Esn09H8dVLyL+bIey3F3WtlOejjVrysWWeTyC1z5bWIf5SZw/N71uy5Zb?=
 =?us-ascii?Q?3p0FP66Ka8ROEBs7gFGOwGMhRQGKLB9sRsCvvkzg/WX9z9zhom/3+bAlcUMq?=
 =?us-ascii?Q?CnWP1VncQzC2ix+2qlZV2m/iVuNDahkgoQHkCk6uRVdG5a/vJ0V6lffTcNeA?=
 =?us-ascii?Q?EnDpM6/RX4pbSkOsShbvB5igdu9NsyT+n6lOJd5BDG7Z6T6mUghE6rMRdn5q?=
 =?us-ascii?Q?If351YPqU/5pHA4iOd4hd2PP5e4ByHjltqfCtJQrPDoHI3ZNoI5KgKAJpQXf?=
 =?us-ascii?Q?YRmRQeD81nhwqJGwZjP/oZ8nJbFwpA/m5hiuVPLBH/NmKJD8/6IyLu/AGXNX?=
 =?us-ascii?Q?EQbNoxzYzxLFJHji5D3HTcnnT62oLIJbNJG2zAAHQvx1rRXfa6fk3r8ermCa?=
 =?us-ascii?Q?AHehd9qpOMpmGtezUmk1vhKjC4WNn1qpCLSRhvei7Rm3lw9NKBXiLaXfY/th?=
 =?us-ascii?Q?0xt/6mdVnYnzUMGFY2AKBL1HiXxbj80EcUC4CGhEuYAEADzhHswyGVAv8fIq?=
 =?us-ascii?Q?IF0IQoY4aPHbG/9zyLDFkpYjk6xaPCu3qMj4tJ6NoXy1fU92mjfa1a4AMzH7?=
 =?us-ascii?Q?knebJuvap53ZYyqSeqEmBSS1b3+z5O6tuzyxN1zsjMs/BF+uW86vErlNRWpl?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9d5af9-20a3-4663-9c40-08dd1eeb9a2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 22:39:01.1397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQs4hU9uIG4ZH7z8KIXoKFWbqrKBwgXcKq4koVfurVSdsYcbW2+A6CG9FvSDn8u9J5rUCMQD+g3qPG/46zmAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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

On Tue, Dec 17, 2024 at 11:22:46PM +0100, Michal Wajdeczko wrote:
> Any required prefetch guards are added during batch buffer
> allocations anyway.
> 

This should work but I think we actually want to do the opposite of
this - drop the prefetch pad in BB allocation. This would enable a more
optimial usage of each suballocation. I think that would work unless we
have an odd caching issue - if caching is a problem then maybe the BB is
a cacheline.

I haven't had time to try to out yet but I think we explore the above
option first. If I'm missing something and the above does not work, then
agree with this patch.

Matt

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index e055bed7ae55..2f69277b1a50 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -34,7 +34,6 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> -	u32 managed_size = size - SZ_4K;
>  	struct xe_bo *bo;
>  	int ret;
>  
> @@ -58,11 +57,11 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	sa_manager->bo = bo;
>  	sa_manager->is_iomem = bo->vmap.is_iomem;
>  
> -	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
> +	drm_suballoc_manager_init(&sa_manager->base, size, align);
>  	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>  
>  	if (bo->vmap.is_iomem) {
> -		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> +		sa_manager->cpu_ptr = kvzalloc(size, GFP_KERNEL);
>  		if (!sa_manager->cpu_ptr) {
>  			sa_manager->bo = NULL;
>  			return ERR_PTR(-ENOMEM);
> -- 
> 2.47.1
> 
