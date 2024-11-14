Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2838ED68B26
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 14:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCA510E2AC;
	Thu, 14 Nov 2024 14:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nweD/Ixb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115BF10E2AC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731594139; x=1763130139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ujo5zQMAti3v7sekAV6dHXdaSFeIWDxquU8fmtBcLaU=;
 b=nweD/Ixb7MsNqwgrzQ/1L+tPv4vaYHArBDBSvEZhtNbhAamAdFNfv4gD
 ijEllXQXfDcXHMfE1xdF6f14CfEwMPa9CsN6/BSRUS+L97vnmyH/RfDAE
 0ydVsiRX+pYPbQJBKn2DNPh9KTbl8isjbXOkyYdugQ9QYf6Un4gdWMSCh
 Iwwg93OMn6WD9iGdnFYecqNul7jaslkCFMHY1C5Q2JPD1O85QCg9s2aE4
 RIB73gThYhLSe5y5cX4p0x0mqO5fR/JI/ZCZlAudnDR9whgP5B/Jyg6BC
 GUOympM1DZcj/sA3lRFkP2eCvkJLQkCfXcgqLoaQhAOZ/xtZv/NL5O+4Q Q==;
X-CSE-ConnectionGUID: 1Dm58VfUSr2vbQmhRFPD8Q==
X-CSE-MsgGUID: Qt9Ma2bmQp24P/oGdsonFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35334336"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="35334336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:22:18 -0800
X-CSE-ConnectionGUID: Qt2c4bDISZiRqaXs/UxFOQ==
X-CSE-MsgGUID: e4C7Wqd5ST67VSHa7HN8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93285602"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 06:22:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 06:22:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 06:22:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 06:22:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE/xwIB8igF/hM1lffxUFyO9PKWWAucoNH5IahFsT4PxXTri1bL0GkR7yCxHDGMzGxglcxjfSA6HUzuwwUDWhlx8020ZIQnmWcgKnBLxgEMcPXyGxcKjwOuhJqpW1v+HwICF64HID30D4muuk7cECZwTr+tl5l/iqeFv1/4oYzuU3lseL3+r87gsxeq2cv8X3ZNpf3rGmenaB99+tkNsI8S3T8dSZvuUaVHo6KpPjnrVkY3iEq+h6MW1NghETJGb7Ns9n4iAwoAgGWn993DoG7R0fzfJ6ue/ORvBGcvlfeNBLlmBrHg5uWJuv1njztj8dpEfelyXZi22GHnMWnJCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb1jMGro0Olwxx1yVrxV+OuRjboVlb0ndxmRCOgrmlM=;
 b=wxyEr55uysoK+JmbDnONcp1/9fzi5xLWTcZM6iOKIh90FJ1nMyp7QivWJ63Y9WQeLnWCo9xZaxCFatheIHH7G8eBuZMa4/2Qy1snYqncs+8xy1jiqjZRKIiIXPBuWW2pHpHOrJM2cCwtcWW3IWThOtcBnQMO5z8idnUoHJTp4ovnBe/x5LmjRIZWgSJ7qZohmEX0ZqPnnPK8JFMrZGAVREhBxE18rRIVhtoxaEZ8pDaPjXonIsN3zYQ0k3EdATw2wOs3GBSDk1mHB7OjgQU0fQHZmbsp1bMl1U2lRzVMRcjS1RKSf+TMjfINbVd9wAQMfhLAZPxVQK9EDxSAvZEkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 14:22:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 14:22:14 +0000
Date: Thu, 14 Nov 2024 06:22:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH] drm/xe/vram: drop 2G block restriction
Message-ID: <ZzYHt1jixFV3pZyh@lstrano-desk.jf.intel.com>
References: <20241113172346.256165-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241113172346.256165-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 9419f888-c9c8-4452-370e-08dd04b7bc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XIfYcxQvhadYteK1rywE6fSUHklmFVE7vWJoi+FAwoW7QxA7vqRq5itViGPQ?=
 =?us-ascii?Q?tsxxv3lMAL/GZ/rNr3Q66cmTGQCMaEZVXbUZtnMN8udsqpasvECNKU/k9jCV?=
 =?us-ascii?Q?bge7BgOFE48Ky+BWwpiVJ8Y3ZrV7t7AK4sTkH2jYMu0cI5mpWx0sCcnzse7u?=
 =?us-ascii?Q?4awgEaHGWeGmPLqtWvcEMy3F0fsYQYAas2ds6IqPjdgvDmiJ6bhYopQUk9ag?=
 =?us-ascii?Q?IyqT3edwgJz1iKLnn85BVAqCzGcUO9m9ilj0rBCHowSzyJJdi6YvejOwRjoI?=
 =?us-ascii?Q?ZzZSWJ+NMQbCpKkwCyakjBLkLz35y3I46dHDhN0JI21L4GJxDU0ntmRE8x8l?=
 =?us-ascii?Q?SYdjjKI/4+gOg1J23O1HAs1ivWJDbYyMzfJgmwRS9PhdnaGo5J4Xo6Go9Lr+?=
 =?us-ascii?Q?jMqdvLoH+/NQRHJqMYHS/95BKOpovv/ETgB5UISnbQaqgeuEE9Qh4oraH/TD?=
 =?us-ascii?Q?ld8GSApmrrF50UQc4puX5cUo3Ai7G5rtlZ4DN5y2P607VCvDEI9PytY9PZBM?=
 =?us-ascii?Q?acxQQfAsLj84TD9h166doO/eO+KLtbHs6KrHUoiGmB1gt3j1z28xBw2NRII/?=
 =?us-ascii?Q?pBHaTO55COZkO8DGOgHIUFhcVhHATL/LQ50N2q1z6KzGhHJ9esYkoJMJFaFX?=
 =?us-ascii?Q?rzPszZ5lTRJC4/Ri7oyXkHF61D2YW4kd9fgn8B8ZBbrYv00aEaKvoPFTgixO?=
 =?us-ascii?Q?txoAVbO9skCu+tsGLMDUeGMVHCHJu7K69Eg/g0fUCrSQ3e3QoK3F6r5+a93K?=
 =?us-ascii?Q?7qQ/+eM1gkbgZ5DBCXFQZ20PWkUXhZyAtChKJ7jjJ2KEuwqG7BbAVmt2GsrN?=
 =?us-ascii?Q?xRJfuQoMe7C7AMsKuYRuFy/cUr4QjJ2q5Nr16sjwzqyTLe1CSqDtrmvxJQYX?=
 =?us-ascii?Q?H14/QNNkjjJOLRk6aBCnCv7Y1HmYzcoM84a3/d0VZLbhRM5LKSZODKBEgXy7?=
 =?us-ascii?Q?apELyUZbU9Wkvj5BZaS3c2qD5Ui9C+3v4Wb/vxsp2z6zA3WcleCEnbQIC71k?=
 =?us-ascii?Q?hKBt/oDMJN1zeIA2n0l0CRt5tnVVb5BGnEzVpei/Z2kz/UNnULl18CbGBDwk?=
 =?us-ascii?Q?hskhRe75KjJ9Yb8rN90pcP0ua4RRAiw9JLTwUwvISIwN7hdF40vxSTVKf9ek?=
 =?us-ascii?Q?AQZr1pzm/oxbFaL7rmFvY60dolYDOGLL+dkFbiMQ//k8J7A8jceHwGdAcRBx?=
 =?us-ascii?Q?FZgT5UQ2JqfdWPN7kTyASlzrboskuimSstx1wIqpcJch3IAIJHE4/8NQC/rO?=
 =?us-ascii?Q?nWSWPt9p9MB0dJR5oLMtpIxeVoypyr0u8YvIVJBW13ddO3R+EQrYAUvT00HA?=
 =?us-ascii?Q?rpuU6p8qOIQquv/FuLa1d3zA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S+yvbC7VaDi0yLjgyxXL+t8fbpsrmA8kG22A4Bsdp8ri98fAedD8eIca0CNs?=
 =?us-ascii?Q?rAnCS9VaIqZEdOiP9UOQcgryH59WKAJsraOJC2iibwYaR4tSpVmKTaDgy9tC?=
 =?us-ascii?Q?ZMs/+2BTT3fPHt7pha4aD6voEGgryLg2QQ9FSPTAVzuvuwtGP/WO0Ks0kT84?=
 =?us-ascii?Q?OWvVKfj61SlWFvgVb0VU8HAU/sqZsqq69lxQYthAy/TxxqE36T5x3FFcrn4B?=
 =?us-ascii?Q?D/RQQIsqRPS1Ic8yyP4GqfH/BRERIk7w+QShgCjJD3zDe4oS1AGeXhFRlRPW?=
 =?us-ascii?Q?adD6z+NMOX+TWFNQ/xGKvxtZBRPjBRV1cHDYYFMLnRr2ufl8O9XF0mmQJGTV?=
 =?us-ascii?Q?EzwgxCpqNRKMAwhZBgSijhCuQrceS2+4v9yavomxRyEXNR9g/2ev5KNAi5tJ?=
 =?us-ascii?Q?0gSe93Q5s5W7xemrALcbqjAbBie0cirKw/GGXHFKkq9SETO1wE8rS43TBLx/?=
 =?us-ascii?Q?WFyvcQ2CEE028v5fgRFnxuliTIjnLaaUfIILl2gZ8AIHMPRVVPjZpIDAARSr?=
 =?us-ascii?Q?WWJd8vUBfRDR0Q6bSIhvJLup+vteg1dvM9KyaQxG86ltWVq+ocme8gMlWJP8?=
 =?us-ascii?Q?6gIwGYqBKUJcJ/Y2suf0e1TjEwGN1ct5t8dkkPCumlWZDiGT1cRJoVKGhXVu?=
 =?us-ascii?Q?PnlPQM+YQWIldUMdjfdAl9bDem8OIWKqz5ZEBZg2ybq7QEqwzJSmRm5AQLgI?=
 =?us-ascii?Q?0OInEpO3iXVLZXizmcRQMx7Rvgp2p/R542hqzXOGYjGf+t/tKJOQK3jyIZkD?=
 =?us-ascii?Q?MDeGerq/uCG51xbNxtcYiBLjPher7u7LFptb1VnWd8ZLIkaVgq4uRVFEvcl4?=
 =?us-ascii?Q?89bjHl8hEepuCCUR3WS4+JvqVOPLO7ByM8nGf94C78+HAaNElJfnsT+c+LnI?=
 =?us-ascii?Q?ifscbg1BSgTRGhU3xbO919ZVVEUARHpo9QQWPhhphSRGREwDFfEA57JuR1/v?=
 =?us-ascii?Q?oP3z7DI5RNcznF4oaXLfpqMacgLi+/wA8bvuV6zOJYovUGzXZYmHnkgLorFc?=
 =?us-ascii?Q?ploH322+JsrtQjXLsTE8q4om0Z0wylZRBjU51yqZ7IB4ynCsCPmK7vBFkOh4?=
 =?us-ascii?Q?hMivtXggs0Ui0MygDN0FX4OHuc/i4mUClDj8ffr3umqsGu11JEbmlLz7vH/3?=
 =?us-ascii?Q?pg29EXIfJj2EN737mkJnbNKt3ZUQW/OPKZ/gKVlEiljLSJtIQfIX4vGvQFlE?=
 =?us-ascii?Q?QKcPs/XhO39CZqTXFhQZkizCEoXRuR1y5+tjrGyJa6/1G9Cp3rXACvI8q6U5?=
 =?us-ascii?Q?s3iE8luUOwg88/9r99xVKZX6XsvRDo6fAX0IQHX49ex7zy9mtmk0/u/873wh?=
 =?us-ascii?Q?N4trucedB8AR5kGa05lyGbOp0PPADLn38K07cqBqSH3WxcfAPA2JyDCAVKjp?=
 =?us-ascii?Q?6SzlDpekZjjpaBubFQWOH2gA0z8S614oPgut3XIDImapqZvCbBCsJusbAFOU?=
 =?us-ascii?Q?rv7aFVDfoKzLbf3lMX1D2Z/5a0DshL8Ah0o5zIC51b81pVplLPRCGi8PX6Kp?=
 =?us-ascii?Q?sjwzg1/u0CG5K+dZ4oxQEnQUGLW5ZRUVrk3zVT8LfAHZjcNY/vR7o8n4OXe1?=
 =?us-ascii?Q?eUgFmSmy6HibUCamBH4r5z+eJr5NWY1w7wF3Nez6J9rrDfHntXapNUp4Jo0U?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9419f888-c9c8-4452-370e-08dd04b7bc6f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 14:22:14.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjS2M22XM54KngB/GIXwDUEHF4z/m7Af6ue8UKmfjGUL6zhactnMyzvxJoxbC4eP5cXpORITahO8eiUECI3MrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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

On Wed, Nov 13, 2024 at 05:23:47PM +0000, Matthew Auld wrote:
> Currently we limit the max block size for all users to ensure each block
> can fit within a sg entry (uint). Drop this restriction and tweak the sg
> construction to instead handle this itself and break down blocks which
> are too big, if needed. Most users don't need an sg list in the first
> place.
> 

Code looks correct. Curious what the motivation for the series as before
/ after the series everything is functional. Just cleaning up a FIXME?

Anyways LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 51 +++++++---------------------
>  1 file changed, 12 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 423b261ea743..1d39a8c53b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -52,7 +52,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
>  	struct drm_buddy *mm = &mgr->mm;
> -	u64 size, remaining_size, min_page_size;
> +	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
>  
> @@ -98,17 +98,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  		goto error_fini;
>  	}
>  
> -	if (WARN_ON(min_page_size > SZ_2G)) { /* FIXME: sg limit */
> -		err = -EINVAL;
> -		goto error_fini;
> -	}
> -
> -	if (WARN_ON((size > SZ_2G &&
> -		     (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS)))) {
> -		err = -EINVAL;
> -		goto error_fini;
> -	}
> -
>  	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
>  		err = -EINVAL;
>  		goto error_fini;
> @@ -116,9 +105,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  
>  	mutex_lock(&mgr->lock);
>  	if (lpfn <= mgr->visible_size >> PAGE_SHIFT && size > mgr->visible_avail) {
> -		mutex_unlock(&mgr->lock);
>  		err = -ENOSPC;
> -		goto error_fini;
> +		goto error_unlock;
>  	}
>  
>  	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
> @@ -129,25 +117,11 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
>  	}
>  
> -	remaining_size = size;
> -	do {
> -		/*
> -		 * Limit maximum size to 2GiB due to SG table limitations.
> -		 * FIXME: Should maybe be handled as part of sg construction.
> -		 */
> -		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> -
> -		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> -					     (u64)lpfn << PAGE_SHIFT,
> -					     alloc_size,
> -					     min_page_size,
> -					     &vres->blocks,
> -					     vres->flags);
> -		if (err)
> -			goto error_free_blocks;
> -
> -		remaining_size -= alloc_size;
> -	} while (remaining_size);
> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				     (u64)lpfn << PAGE_SHIFT, size,
> +				     min_page_size, &vres->blocks, vres->flags);
> +	if (err)
> +		goto error_unlock;
>  
>  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>  		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
> @@ -194,9 +168,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  
>  	*res = &vres->base;
>  	return 0;
> -
> -error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +error_unlock:
>  	mutex_unlock(&mgr->lock);
>  error_fini:
>  	ttm_resource_fini(man, &vres->base);
> @@ -393,7 +365,8 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	while (cursor.remaining) {
>  		num_entries++;
> -		xe_res_next(&cursor, cursor.size);
> +		/* Limit maximum size to 2GiB due to SG table limitations. */
> +		xe_res_next(&cursor, min_t(u64, cursor.size, SZ_2G));
>  	}
>  
>  	r = sg_alloc_table(*sgt, num_entries, GFP_KERNEL);
> @@ -413,7 +386,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	xe_res_first(res, offset, length, &cursor);
>  	for_each_sgtable_sg((*sgt), sg, i) {
>  		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
> -		size_t size = cursor.size;
> +		size_t size = min_t(u64, cursor.size, SZ_2G);
>  		dma_addr_t addr;
>  
>  		addr = dma_map_resource(dev, phys, size, dir,
> @@ -426,7 +399,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  		sg_dma_address(sg) = addr;
>  		sg_dma_len(sg) = size;
>  
> -		xe_res_next(&cursor, cursor.size);
> +		xe_res_next(&cursor, size);
>  	}
>  
>  	return 0;
> -- 
> 2.47.0
> 
