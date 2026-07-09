Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A524C44503
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 02:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDC10E449;
	Thu,  9 Jul 2026 02:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFGiI7MC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DD310E3FA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 02:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783565733; x=1815101733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uWbtj9tYYY8j+G2XNx1jDmt+Qq6eZKeDfuD8Umxccmc=;
 b=UFGiI7MCEaMhxEuJWtTUoFzRxyuJu1GsZm3TyP3KRwUXJfA6XyKhDbDa
 drykWzyPeul7R4svTmxIrshnCyw5fk0/b4xlVQBA1RjwNuzm/Ig2j3U85
 GxSdpPHIBTuTMqyCbboVkffhBdq/K3E4HpLf7QGyOTuOzM9dpXGqZV+Pg
 Ek9qOnBRuG/xZ5IonYblw28QCzxBeWZJRx2WCVwAU++TN+USMkGV90+Xo
 HfOvo6XrYaxThWkbF1I1yGWhAgGNL+etrFvR5sWaWNfjogs69PIzUTRdc
 mqOHBqJ3UB34dJUKHO6vtnYB834DWQqOVNX9dgvyOoka49oEQjkbftjr1 w==;
X-CSE-ConnectionGUID: DqoddiN2Qsap+HgnSjkQKw==
X-CSE-MsgGUID: hXaeX5+XS1uPKHgN6hn2XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109786281"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109786281"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 19:55:33 -0700
X-CSE-ConnectionGUID: ElGMea4mR+6mLNbTaYok2g==
X-CSE-MsgGUID: 0OjKZahQRm2rzzwKxSLFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="277684268"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 19:55:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 19:55:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 19:55:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 19:55:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWMPADSZ9jUqBI6QIqXDLYn/TRKQdBIu7V27PNDN9kJo4cB+zz/HI+C6Ku2jwSsEqT46mfzPQMPLSdnDPdl+Wd/yD1yx/5vr/U0EnyM8zuv7qT3tDHJb8iiboJOnfnbWqwEBza7xc8yj/DqCNHHYOfMRLu4vy+nSaJz3eOsh0rPxJyJrCQ823tjuqZ1f7lGjF3/ZxjEeqpv+je1o2CXPnb5gNPU8Hw2waE22ChF4XGNe3SwKm18XBh+KMvfVNCFS4T7DIx2jXanU8XOxJFbf+gP0xfX0OMncgJE7gfkJNfFQQeDBOnADKGeNxOhB4D5dEV9rZfCaucp+aMXHlrAIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dK9ILf/DAboIJSLQvHGPpbZqDdjHCjBrsAPw/eUfe1c=;
 b=Y/SVdHS2MkPI5zTTXl+fVOckLrVo32f1WCtJyqa2E686tAufX0gI1opUu4b3cA5a/rSUEvfIg2buVntBKZf/GzYkH8ak2TdR7lLRkNxHzhX4tAnwOeXCUpPJMyO5yOkZe98SpFpd0YA3fs9WXTaugrog3rHY9ekA/ryODSPozv1Xe9/+vwNXVI59ZTU0x5rxYwtU6+gePKNKsW52WIkCsCbI/F1mP6Sa73HZckt3KaocJtW8nEKCqFZ/3frEq3WCeCoCSfiaGGa3vdhj9fZivWEJ/irS3u0ZT9CePZ2Uoduq4XoJk8rSBI8rhKAXacRYxTWMORVjgRZW+OfeI8Yt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB9803.namprd11.prod.outlook.com (2603:10b6:806:4d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:55:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 02:55:25 +0000
Date: Wed, 8 Jul 2026 19:55:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use xe_tile_info() in alloc_primary_gt() and
 alloc_media_gt()
Message-ID: <ak8Nmp4RKSj7Uku1@gsse-cloud1.jf.intel.com>
References: <20260708221233.3251663-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260708221233.3251663-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 12236485-4fc6-4f92-e9ce-08dedd658651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gFuVxrBq5x5vEvBVrjIARvj2PhtjQhW9i5RAHB7FtEr7niID6C3YeYyXKm6NPhonapMNtvlLRcY8G+NEjrt+caP2jqLHiYsoBWnUCBo6KPDucXRYrlJlOKNkecbwCO56I41C1kpTcVvQqrWSn7T2tiD7x3Inb/zdPAiYTvELf5efAkuvP1/tXGKA9tA0opgF7a2KVEaWhIXdP198kqpa7bP8n0MCWay0KM5FZCwJMoVHICt8ERwafIouQ9D34ZkvNJYvCjTYb2km+d5hzbYwPwq1Pn/nUsXoGvUKd8JJD5cmBzEcNxV6cTgB/jXOAH9GXN2rpz2wKpO421KIxGi8Zql0rY/2UotZ+TQL2Nl6Vn9vCMV8ecpSyxWKnE0hkkmmrVKN66EbNA7CfGO1ffYBJphIpk2FAz1Cdiw0cwOfh1xmVoiXTvf65fEvQtkMWGoDyJ4k11/Ex3m+ahIgrjzUciXfm3swRYJbomISCH3dQeQyzDfTTK9a1MkEraZf2AbgdicFTVAkldPxydpl+6mrgxPQ50hL0jon5LOfJyuzo2tQK5n9dt2c9+5P1kridMY04NgjlEIn64Dm+J2QhA6pGIx5so03+oRrnp0xVazU346UjqMDrcRb263eSXg2NslMiEPUKiTfidgQvY+8YH3mnnjNgPAC9Kfpb3wob8B6nLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bLm3kJHfZZx4taD6fOERIIPF7Qahs7QhtcHjS7yGq8AX+v/UL2MduilmgPRf?=
 =?us-ascii?Q?czsaivUkiqwuhITn/qNcfKzdNVlDOu8nQsbc6MRqXZk5Q2ljGZCS3mo0EPiC?=
 =?us-ascii?Q?xg4ghtkEa+r0V0pfMBC0b6GIVBSvfMGPS4FiaK+srzLPrTPYjxZ8hwKAcI0f?=
 =?us-ascii?Q?+TnOuog4ed2QesTdrBhwjzxWjRp7EUjK0EfNupeqLRWfTC7eS7d2ZtpYK14j?=
 =?us-ascii?Q?Ue4CTEcPJFjMTYa6cCp05965vendwcMZBxpULpfu7FIl85xHNqn/PNohcRx7?=
 =?us-ascii?Q?fPFB2YRDGQt3M93rIGTrFkwYV+IjhXCWKRR8ij6F6xKSXRMp1xeRYbWw7PKP?=
 =?us-ascii?Q?Koh5f1gJvC/Cq7hJkdPCwzM+LielCo63JzQjWOjZ8x2bwoLwiJRDy0pzwl7t?=
 =?us-ascii?Q?6UKc5W7aFghBKHVH6mqmOHkTYs3ZsQNFuyvsDQ4nuqJBDhd0G/YA/DlQA6pY?=
 =?us-ascii?Q?I7S3kFB0DYiVBwF2VwdtiXfg7UhAMaKLmiLxHnf/HBuP4xkcZAtobS/W/gOh?=
 =?us-ascii?Q?yg/cxku5TqyahDeU5VP7XSy+fzfeAtdd2+27TjqRj8kQl4Fxd1PMlq9lyPpa?=
 =?us-ascii?Q?F5JUzxgvLlRrEFeovZQQEkOlKCPZRZ/Ykat4Smqjl1XwuE7FBLQeS0UYIhHm?=
 =?us-ascii?Q?utLlu0PsgeNsvkp8hygp7EHApQwI3F/M2WkaZl+vQHQAnuDLU7sDfbirbfXN?=
 =?us-ascii?Q?sqNj6eiOjoTRkckze+lbPaBVBmdBIgH2Gxv4N70Lbbr2fabVi77kYL++WEg1?=
 =?us-ascii?Q?rMhICYNNO9KfPYggByjMGpCfprEvUoLagvAdy3SWZwYF11c17TWfMnb4vmw+?=
 =?us-ascii?Q?CKX6Nm88JeFfYSJe+JIDuJNal87safB8ynkSZC1WM9ImlkBjIvMJ2/Ug1FCM?=
 =?us-ascii?Q?jnvNGFA2pXBcMVW+QZGc7zVY6JO9LdVmVxS4bDUXsStzrFEHzFDOIG9RIoIn?=
 =?us-ascii?Q?CM2dqdtb0QVAnds9GUiMDUNgThmHfcnEj8nVh3fKAbHTq7f2uLo9FMeO4CJD?=
 =?us-ascii?Q?z9W47HRabJkDWIRNjpH5ujN80A8gDMCImIN93w6GxDoUzHUrJcGk76pE4A9b?=
 =?us-ascii?Q?WNEvh1iV1lV8aaOiFICZ9hdt+NwwrwR2puxK0gl1Cnx/IHOWZMUDXu2C/0Xv?=
 =?us-ascii?Q?/U12EtHQ/snW4GUEgVbsCB09Nrz7+U/bWiPaFTUynpwK+HCvLglHv45gAPlV?=
 =?us-ascii?Q?+vBJoQn4fImvav8O6loIDcIOkRDa3elyKjK5OLHbfqzd8AJvZ0c39sF00u/B?=
 =?us-ascii?Q?+uxegkxOgFcy7h5513KhU3nVLKt+ofCRipWoAuyKn2lRX2XI0vsgZj63/Cqe?=
 =?us-ascii?Q?0byYnigqYJQmbuF9nGrWE0lvlrZ/Ckm/D0h2fuxAB1jScbD0UDcDB+E6AF2S?=
 =?us-ascii?Q?aZcuhQ+q2L9K9tW99uLsm1ryoW2ZWVRIYWTlK9bwo5XfTFlEgRQwZPFKAg1/?=
 =?us-ascii?Q?oNGX4DUap7UrLp5xkjLyTYvJYHPvwbqnUXKmV+7Yv11S40vTML6oRF4F9fnp?=
 =?us-ascii?Q?QZPsI/yUBjtAQhCti7XTtdTcBvAMPAn0cjHy3wFcgfOpxi6Vf+r2itOHUzSO?=
 =?us-ascii?Q?NsYwAci1OpBVPMlUDQT6rmkCfTT166yOK/sAlK+dW859AsCU+t7yW0VZv1D6?=
 =?us-ascii?Q?GY7fWqv6ob3nmmrAv72pIlcpAIMb3Mpzlbu/Htc+4TYbv2dT6Zi/LGaI7eqr?=
 =?us-ascii?Q?lEgjxHCAW5D2aY0O/adPn0U6fIlK8HBdGpZx2tvgx9zP16ZEN+bdmRVG8Ny3?=
 =?us-ascii?Q?hdZ9b4U2Yw=3D=3D?=
X-Exchange-RoutingPolicyChecked: hwkYEtJTCOKxKvF5Ttyx3E1ujPfjz1S79lLAUx+o35DyzHHv4wL0usKf48AE8HwwiGxYWkb98ZVyFXK2zPdPsjsk+GzvjhqtUZp3gWr9dIJxy0CH0QdL5dB0jlhrrNV5kcrWmQLGpHrUVwokd0LDTBZ50BbDcjo6fKzG5U6UD+Mn/8qpFslhGuouZOufrNVriEwm58YZAWxnTHyRv6kuVpFJrvn5wt6PttoJva1+Ce5SvpsRqaK/17lkkRSq0l0HbESXh7W7UShDBhI4CVPfhM8CDkmOtcS5llfOw3Xz9vx8xKeWkUwTobe4DLcTmWle6X/yGcuCEbqS9NKsespi2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12236485-4fc6-4f92-e9ce-08dedd658651
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:55:25.0598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaPpoQ4rdeUJqO4Y8sg2KXLXmX4FPGILBJl/K8d115i3BdSTLl0JMrGh6+jhOx36CRlPoGVaMVN+FT9yPiq8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9803
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

On Wed, Jul 08, 2026 at 10:12:33PM +0000, Shuicheng Lin wrote:
> alloc_primary_gt() and alloc_media_gt() both operate in the context of a
> specific tile, and the configfs-disabled messages describe a per-tile
> primary/media GT. Switch from xe_info(xe, ...) to xe_tile_info(tile, ...)
> so the log lines are prefixed with "Tile%u:", which disambiguates the
> message on multi-tile devices.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d6ec3b242c02..1d7d8f3ce71f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -37,6 +37,7 @@
>  #include "xe_step.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_tile.h"
> +#include "xe_tile_printk.h"
>  
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
> @@ -865,7 +866,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	struct xe_gt *gt;
>  
>  	if (!xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev))) {
> -		xe_info(xe, "Primary GT disabled via configfs\n");
> +		xe_tile_info(tile, "Primary GT disabled via configfs\n");
>  		return NULL;
>  	}
>  
> @@ -911,7 +912,7 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  	struct xe_gt *gt;
>  
>  	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
> -		xe_info(xe, "Media GT disabled via configfs\n");
> +		xe_tile_info(tile, "Media GT disabled via configfs\n");
>  		return NULL;
>  	}
>  
> -- 
> 2.43.0
> 
