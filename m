Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E3CD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 21:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8070C10ED47;
	Tue, 16 Jun 2026 21:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8A10d0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E8F10E852
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 21:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781644042; x=1813180042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k8Mjx2CeAubF9VhQKeSwuWd+LXu2uqH6mRd23VgThoE=;
 b=c8A10d0jmwgXwAT2k9eUfrw6qELMVOuHO3pJEy1WiZmzs2Jyf7rOfGn0
 FSKmIDkc/9TBtU+a5ywLR9d/8IURNr3ZD/SVSRWUqWmzbEDG3dUAzMX4M
 RW5UKToeQyIbO8/HNSUkk/sBxAn4nQ0EnoxPh83uVyedRxYLL35QlqmPe
 LPH4Hl8QLyV+dMpjYfk//dQi1rBY8TNmKuhWBRWqfyILHreSXkvQOtIlX
 QfyA+Wdzud3MBImOVWw45ie2X+W/fVZZUgZ+Amigu3+bo5Lc+ZyAhWZos
 7rDZCLrJwyBZk1f8yN9vKKKfIY0JDxnlVk9Mn0fQH4zZuyL5cuWRnp1up g==;
X-CSE-ConnectionGUID: opyGeV8vTjOGA88S3fHsaQ==
X-CSE-MsgGUID: YhTR0kTdTDiv1X+NltiVgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107867344"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="107867344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:07:22 -0700
X-CSE-ConnectionGUID: hwtrkaLWTFOiqac76zGy+A==
X-CSE-MsgGUID: ZF/0tEyqTQ2WWZ7Uyll+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="243720138"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:07:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:07:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 14:07:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 14:07:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wliq/jC1Y54WRxztgt/OIC6xB9nY6uWUn44tul5gxz+kXDWf431G0N9MjuGVDxmDhayIGjuCI8dg/jH41JtvMzTqIH0eLho+u+9kGq6xeKVo56+8qZdDRhJEWR6P02d3/6+h4UL+QFMSHKYtaHxXhnA1+iYOvJh2Os+bT7wGR8a4qHkwnyDdO1KPJPpjoe3OHyS7vNn6zDFNNg7F9FvvEgb6lHN+zVuOfOtIsqod2h2PeM5AG46vgeCXFwV57F1XIDsgE3BR1NsS5bbji1fkk+1Ca+Na7+vigNdnDtULBdNRW/sI2xS/GIc6Nhc8MMwMJe2FZ76ejB5p1W6nLrhanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYwpx9bci6b9c3smoC65DtbMcSO45qDgJD1Zl3g7i/I=;
 b=wkYV6BnTm4VKdAKwa1l4mcerGQgpMbAWufQB92vOHklQOzmlJbJUavziQ1F0tVZTLCduKuJ6ou38CZjqhHAiSijpE7+0fCnOgpwiVeN8p+PpAlwTbPk0fmZcnTMgn1v3Qt2IzQDmYUs/+w0MRAXq+jpa6Ei7wnbKHWC67NRLFxEc+cYHV/qlqOuGGUULiZVH5CyR4i/9NjlnsX5koG1Nr1NESPH1YG9oE/z7edUpTVlFKuCABMRHc8tiUPgJ5wRVT4FDIkJMKbCsMNPy5UVLYPZtH6ynfDOeRJLo5dyTBOJM6zzjvacNEBvGtM+FxcTMsDfsWOqSF7CaYFT1x54nHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by IA4PR11MB9372.namprd11.prod.outlook.com (2603:10b6:208:568::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 21:07:18 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 21:07:17 +0000
Date: Tue, 16 Jun 2026 14:07:04 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/xe: Don't initialize tile_count in
 xe_info_init_early()
Message-ID: <ajG6-MEWAmN8y8__@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-8-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-8-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|IA4PR11MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: 539ff0db-b100-4d07-019e-08decbeb3f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|56012099006|6133799003|11063799006|3023799007|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FJExApQZs4h4iT/nTAKANAuswAWl5UllCHlcLMvM6KQXueaibEL3lOdYrmGxcPYdy6nK4ozNQr6sDHgV48YQnyKqhQ0tGqEKikN97l0gS1oCBCsixc6UuaNUvn8fJmS912AkHTa2a57T3xImKae0xoliVZDKRHEDbK8SWfxkyz3RZH7Ch21JyhYcvMuQI2hLpR1a6oDXOdBcX4xnoMjk06oVtzPSOEsoE/xSoa0+2s4Bu9IAoSohxJk0m2eBhZqIymz4yj+c4lqKJgB9fuZZO83tllJYQDgpU8XIedr4h30Hl5131TiBPRxq4wh0z1kjljJhmrLpECQfNMOWAWXZNo97dTuTyIp6ywperPiPsyznOgn4STKgOPanEWFdOe3CqWTFkMaRvabz/dIIzjZiTaCPwY6NF9WWCPTb/LIPUEkDIh3QyS0mP424asbtNKmM4qj4IkNNnPCbyckesQuNOJRYc93ltKeFXA5hNKaXVdp8ckKI+h4w7dMMfOZ482BKm0ZkgiOrrY6YVmZ0A5pHKRo69AbqGSrogm6OixA7pU1x9NML7RNDbCJuj8/yx48UPS8EBYads6ZwfUXkoCuGxhBpWQoqlSyMm0iHERExIBk7VU5lnUQ/nSQkWv2oa6Sv6TrweA42aW3CIx2B/FOkheU+Im2IQ7OM7fBSv/qX8PFQZxpgtPYHn2w7FHE/C+Gv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(56012099006)(6133799003)(11063799006)(3023799007)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AB2oKmurAOxgAaQ/Oo0OLwx7CWbdnj0rxGrJU+A9T+9Kqej/b0A1PZGsINyS?=
 =?us-ascii?Q?rm117aECBMeYK/+nciHctWIo4mCqzmsSMex8OZiv/Yg+LjoqCgXB9zuULg1I?=
 =?us-ascii?Q?yxoEiPRQJbs0vxV0zrn4NqMmxBuA8WvUZLV/wIYn4CtY7+KfAhNDtftCJOnV?=
 =?us-ascii?Q?s2BXy6aSk5+nDvEX3IxysjEJngwqJsINh8RIhYJegcQeSu5rw3mbH3fi1ZLx?=
 =?us-ascii?Q?+4VX+PLb8OIxP3ehH6fGRqaul0gAxk7RJO9RM1iRYOIAVWXxbWoN29KAiWOe?=
 =?us-ascii?Q?G27dPf2u3duw8L95veDYpzje9TUbtRZzsvmRSaQJhSwPRPl6h4EksHLFfpUr?=
 =?us-ascii?Q?4Q+Msg6F1aFb7sqU5dmk+UAKNONiH/X2NiT0uq+yVpJ2ed0YP8nGw5Bss1/6?=
 =?us-ascii?Q?DljYYSISvubzXPDF5w8i6Qhm+Dv1OTleIHisVRtymDuCYwbQQpbWQt4JcY8X?=
 =?us-ascii?Q?pVcr4a6rOXPAsKjWHW4YbXNYay5MQApQVTFErvxYzBsMdFZJFYuFgJKhRDRa?=
 =?us-ascii?Q?4BIM02zHkm1ZzS+vyHNO1kYFK0z762SUiZ3l7Qq7sbZMeIQytWdxZLJz3P0N?=
 =?us-ascii?Q?XUseIAcddpmU2jpcKxNqZ6r4JkdUlnpbNJ//9UO9bhx7ku1vxyWkpeX6PpW0?=
 =?us-ascii?Q?Gs6fiKf4iMwCWJjl5w2xt7FYa6QuL8+iy+HreJjxxf63hdruDNQ9BNCYLadG?=
 =?us-ascii?Q?0Th324Vx4qJT/5/biBRjVuPLYTPpqMiQtGjZTLNsbGmFOmCtftoJFNyh3VH2?=
 =?us-ascii?Q?keeekkTZarX7gG6a0rFaCzfospNJoA+UE10ljKBOXO3uTmliFSP8B0dBRk02?=
 =?us-ascii?Q?0S2+iIFCeSzvOWfTH9EDft+9bg2vkDRd2gJiveQAD05y4M8kvm2yBwWT5wHy?=
 =?us-ascii?Q?leHrnfHeBBqEv+qeuZYyutzz9jAEW7fqWp32L5khaZDpkBA6T7xlDtsm0KLC?=
 =?us-ascii?Q?SAOu/Qo1+Xak1/dwf8EN6xeveGWCsBe2s665ZymdEk0PX+L+r6WgSm22Jt2m?=
 =?us-ascii?Q?+tPD3dHDwg4Mu8gmXvYuoFXpHFzQoaTdWeErLRSHLFHlhawIkK3oXn6OxthP?=
 =?us-ascii?Q?ZqTI8kXXoUEV3TOeznBVoELJqUxTqQgFRTugD+d7HMssxSNTOxgvV+x3Dk3B?=
 =?us-ascii?Q?aWG42Ec4Nhg31zO+7i6SQQpmpM/+EiQEaw/qxjSb4wDIhLFxDSFocU7Z6kNC?=
 =?us-ascii?Q?xG/1s5jp2lVBoQP3/OZrBeAQm7jS16hbggKiNiKoO4QTofz2Hih/wqfjPJWR?=
 =?us-ascii?Q?Q/oE5weNZVk6aGJ8kPOgnFieolBskGwFE57HzMp6UUqyjgyp+Nz73MikjSVE?=
 =?us-ascii?Q?pQiCJR6qhiQ3xYqjgKjw3y1ECChvNxmQRKVVumSPByCtt+gDqjBWpv3qIcqt?=
 =?us-ascii?Q?/WQsDGj7rpIYv3Wro+g37at5xjUgpUlcrMqNWpY9jalGklkrv03McJeMGpdt?=
 =?us-ascii?Q?SGznAQNrcwjxAoi4kUEiP3aOILQI+9wQBO7Y/cRnMffetbRgRDfmaD0Wuo+C?=
 =?us-ascii?Q?FtacyBCyvLh2cztKQLdWHj47gi7b3gIiX8rv6iDF1U433te69RZSExH+zBOR?=
 =?us-ascii?Q?bXu+MCRho3yp9YeKJCCuzazrnfzt0IZZczEQ4svLcsEjnIrMFDtXgWlYcgUs?=
 =?us-ascii?Q?YHqXRUx7ZuJE9bcbBu0Gk5b6ichSuMZAPgk8COSdVCP9YP7QOMiUCiaHVXTU?=
 =?us-ascii?Q?ao9CSy68QxB3KlAACP0+wYfVOixiezirTbJQq3FSNPqJic2PuFc3kLBSaXhp?=
 =?us-ascii?Q?E25qHU+CUA=3D=3D?=
X-Exchange-RoutingPolicyChecked: mtBdmAsA8oRfJctDV/xm/qPBF4NSYFCzzG3cHANMS0RgfIIxUSPKR4R/RaxC7rO0E9FwpPoRjdGjf6+DXxMBe+qydHgsaTWla2N+JM+euumuQOEBBjrFpxQQ0qn/DgS/xT0ZdsjeRNfzU5/hNgGIO6rN6qsqI7PADFhLB5DZEU2Y0ITbBfCfTHIijeIpNhyN15lbFRK/OXuwKLRbKbWiSK8AdVtWfTkSmVzLvt0Dp0PL29X1keDTeWbt4VHzXjY2ZokbDZPDHkQ1fd+o0DBn3rD4QhmfWyMIpS56vMqHsvc8rTh9g9DceTAdMVyyjBg9uDwqUffbhF69r+SDJaotcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 539ff0db-b100-4d07-019e-08decbeb3f63
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 21:07:17.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jBAPszJNtkh3OCaMpeR1EHH/WlRlWzJaCmA1iBZRoTSSjTHC7GUy8HBg8PklIByRsxhInIpW66P/GUaS2fTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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

On Tue, Jun 09, 2026 at 05:17:40PM -0300, Gustavo Sousa wrote:
> The value of xe->info.tile_count is only really valid after
> xe_info_probe_tile_count().  Any use of tile_count before that point
> is invalid and, consequently, initializing it in xe_info_init_early()
> is pointless.
> 
> Move the initialization to xe_info_probe_tile_count().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  5 +++--
>  drivers/gpu/drm/xe/xe_pci.c       | 10 ++++++----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index cd64b1d614c8..31ec41aa997d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,9 +311,10 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> -static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> +static void fake_xe_info_probe_tile_count(struct xe_device *xe,
> +					  const struct xe_device_desc *desc)
>  {
> -	/* Nothing to do, just use the statically defined value. */
> +	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  }
>  
>  static int fake_probe_info(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 388771ef6a52..6b2daad87316 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -811,7 +811,6 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe_assert(xe, desc->max_gt_per_tile > 0);
>  	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
>  	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
> @@ -823,13 +822,16 @@ static int xe_info_init_early(struct xe_device *xe,
>  /*
>   * Possibly override number of tile based on configuration register.
>   */
> -static void xe_info_probe_tile_count(struct xe_device *xe)
> +static void xe_info_probe_tile_count(struct xe_device *xe,
> +				     const struct xe_device_desc *desc)
>  {
>  	struct xe_mmio *mmio;
>  	u8 tile_count;
>  	u32 mtcfg;
>  
> -	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe);
> +	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
> +
> +	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
>  	/*
>  	 * Probe for tile count only for platforms that support multiple
> @@ -1035,7 +1037,7 @@ static int xe_info_init(struct xe_device *xe,
>  		xe->info.has_soc_remapper_telem = 0;
>  	}
>  
> -	xe_info_probe_tile_count(xe);
> +	xe_info_probe_tile_count(xe, desc);
>  
>  	for_each_remote_tile(tile, xe, id) {
>  		int err;
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
