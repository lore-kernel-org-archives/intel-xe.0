Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222AEEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCC810EAA1;
	Wed, 11 Sep 2024 20:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOQhL6xC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779BA10EAA1
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726087162; x=1757623162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lqtvvloU2IpRcsAZrmhR5MB2Ojj3p83q/aI7RwARBNY=;
 b=NOQhL6xCehCccckY5eCH4hTpgtzI10Yii+zC9xCMSg2XakMyG89Lp4O9
 PcnadLxURcCkRAmNP16x+bOKl/AH1hjIWpvwHOz6rtsUJaqRc6TlXMJQu
 1AeKMQ7A398pMGT9hNtmdjiU1kK71j+pYTMEZGK8LemY1E/FkLP9Dao7E
 +zPlR+D9QviZGwurCE423k1ccEwNFF4hnF0HnCDrd2uQLgPGGXU6n2N58
 Y4xdTDL1J9GnaBAk9X2ODNjQwlhP+2md82SZRFOkZZyQAn7yKaF+hNKOP
 MdCBcWg0jtuKY6LKwZI3U7/62+yofZmmTKyTch/wmrw4HTIp4olEqWBJj w==;
X-CSE-ConnectionGUID: 3sNFDpDpTfu9gHkErEkPCw==
X-CSE-MsgGUID: HJBSd6OaSvOd3Wk1JGAhEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25104115"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25104115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:39:21 -0700
X-CSE-ConnectionGUID: Kli0P3bpTkqogkH22sBofw==
X-CSE-MsgGUID: 2FAvJtm+TZqfz8Dya5wUgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="72261008"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:39:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:39:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:39:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:39:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q61SzGLr2cxo35Zl4Y0DYhFpw8NG55xwSH/XIOzoy0hp9FqfXH/K+a6NMx5yUzXR3fo7fkzieqvKz8rsajhqJyiv7POvpv+XWpaPYtuYEY79N8Tz/mgbEM3ZFXin7hQZSCNVHOoTVi3Pi4tLmIRLmAW3x3iMG26itEJBo/bmhjFWg6DJHNDm10SLX/ynmPOGo5lW7l3g1E5DqG+K1uQk/q2mu6piK3PViBIWBmuuPTN49nazfuBRJxsPFBussMQ5osLKmmHA5h5trRyo7FL0EdwD4FNufK54eACBh18MUwd1SPpRfCBUISNrHqdtPmhVqtTT4DqpHKR+Kl9evfqtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iAxQaYzn0HV7MWL1h01JskCIYTnKaxTJqVdN3AmCq0=;
 b=F85Y78Ehf1H9Ypo17uu5o6hsq5zrRb6322DkmYDP0M9lrACi62VqzbgNEMKzF41Z8OeskLO5GA0wdrS8doxsYpEc7fGfeWWLLOt5K0hH2eBZLuVcjU1K7slB8fAVR8Cckd+vjJsgSAkGO0TwDqk0AVAU5kIvEGWo3qdNeuwQB1G2qWm4+BfEEYBt03t2J2up8GD61TW6An8IMGKXPZkwd26rsUb5s7fLrGKh8R1zKJnlll8Yq/v4xNy1fdsvxGwcGeZme3uLwDbuXuL/XWiMycRuO55AJZCAJQsR9PFuhnKn6IGl5ekkZYaXBLIfFZt0oP3SNlyM9AoOkKuLcNFSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 20:39:18 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:39:18 +0000
Date: Wed, 11 Sep 2024 16:39:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <imre.deak@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/display: Do not do intel_fbdev_set_suspend
 during runtime
Message-ID: <ZuH_8bUkSJu8tvSG@intel.com>
References: <20240911152724.693560-1-suraj.kandpal@intel.com>
 <20240911152724.693560-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240911152724.693560-3-suraj.kandpal@intel.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c80ac96-4315-498b-1404-08dcd2a1ce30
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1D1RdPddnJ9ssE9+VQVvDuv122FGo88tfY3ZV9tft3NP34/tP4/bKXHrwcFb?=
 =?us-ascii?Q?J2f1XWQymnLjMdyXcXaxxk1u9Gb0H8kAnNQunSgaV9Pp0bp6KiEAH8twrPFR?=
 =?us-ascii?Q?g3xO9AOgDAjETg2z0SsFLrNAoCTR5jVDyiSZU6Vge994yJx3IjBg+BEHmtht?=
 =?us-ascii?Q?aKAEXmQGvQwBf6BRiayiRgqTb9rW1pOhl2K4rcObCpgUVryw+HaTYzi66LHk?=
 =?us-ascii?Q?kZZa65UdjRv0IG8LQRBqMDgsdFxsHreIndvAHemD+SxWE1ZYKqLQFSqi6Fd8?=
 =?us-ascii?Q?wIpeXNikx5Ssh7Q3pOVQqxAyYArsSpzs3HbNv6CcmIdNZd8jinaDd5v0FBbt?=
 =?us-ascii?Q?EOmQcAfhdWHIOmltvQ5w3evP6Su0Yoejp49pjHhPI7pbuQiwwkHiV7+huy+5?=
 =?us-ascii?Q?HuUaDTqG9ksjUjIABOoQzi00eVZvZzfzXvpdKYLkbDdqnQU70zsLW3RquKUU?=
 =?us-ascii?Q?kNCXWJsnr1UvigO8G+z1rr4t3ZnW90GkqRD8VPTgV1UEEiCImki+sxcfzRrL?=
 =?us-ascii?Q?PsjZlkZuieSu71q/d7nMzelukLGJ9ik8X4hWoZCjCO66YkIsbGtzcR8dhZXZ?=
 =?us-ascii?Q?HCOnZ8qsDDp693TNGUwc49VvUa3xXSodit7ANWcGHzwAfMcLriQOqQghB9G0?=
 =?us-ascii?Q?hQlazMyxf/x10gjSlB4WHYUJCWdVxU8pCuJSPk4+9tmvn7yDvmRm6w0chTRw?=
 =?us-ascii?Q?/jwldEK53F0KWfMErgh06sVc/VzdIzmLDvbH2pDhQOa2Au+uqeqSd/419w6r?=
 =?us-ascii?Q?8lbYalg/XgJrpv25pkY1cbzME/pjPdGosZHn1/If8blUJMAGir3Hi+l1Znrm?=
 =?us-ascii?Q?etdbYorTKqnLSSjDFd924e3Itwvqcvcstklao91oVz2LW0LzMHQs1QjlIYmL?=
 =?us-ascii?Q?bvndOzRWJab+LjrLVZiRTYkqZYyEXi2fRWnlpMFaLKf8vfk3bFzt2XckRF9K?=
 =?us-ascii?Q?SR1og4NIKLXmAVP6SPBZ2x28BOzXQL4cT4H3dK0/ggjgYCiEaxXr1OKOqy4Y?=
 =?us-ascii?Q?BclBXzwsWinr5XKoLq1Oz3OUfOWlr1zbhf9Bmr/H0Yoyrb6nxHIvndSDdX4q?=
 =?us-ascii?Q?7RwO2rEC/QbaBWFkVMtgQCa0RKXCoD6C0bpwBovG6wdqXY+/YmelEfT6gC3L?=
 =?us-ascii?Q?qqI5w9dNvRKdKTwp74KoOeuIQTv8zQ39AnqRBs1hysNNKsHosB7xXkZhsqLS?=
 =?us-ascii?Q?e0BMXJMqCwu5GktJ4n4IDOi5MUF4NALiZFIHJ10hZ0SFBbgTBF17dc1g5jHW?=
 =?us-ascii?Q?KpNcVRdZneNorRj/o1cuCuXop5oSfAuZ35ZiOT4zLOUdMWHIjcPiWow21bWU?=
 =?us-ascii?Q?7IZEygtFpPLHCp1mi2yZdqmBvTD9D7ChVQjlWuRMm48/9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+BnZ82DAIlbXqGlQVnb+6eoYFPRWkkTzbD6NOdGmxF16I7p95aQTW5XyNu1D?=
 =?us-ascii?Q?SEfxJCX+cCM2X1jNtgQHmV9Oh2CfpRA+0ZehXBqpwwG1JbB8iMrYb6+tb4rn?=
 =?us-ascii?Q?Fha9XB6YFLCCRYsB+SAGWVwrmss1ryTwKcGRVHuyWOSq84mt5BXIYiYB3ov1?=
 =?us-ascii?Q?IfQNA0gmAp/4FM5r6hUuemGw3HgZ9oQUBBp1D4UoWJEHDnwkbAi5MXDuR5+C?=
 =?us-ascii?Q?gFZ8alFh3HwIqdYjmhOpJ5DAFKF3Nf4u499xJ8Xub7Yjcx25XI3sgU1LBUyD?=
 =?us-ascii?Q?ysd+4JOiMUmli7Gah3AGr2zFSxu0pa1Ke7MCI3gC5SEwtyjfjVNDTrfYe0ML?=
 =?us-ascii?Q?nSRHh3PeiCWK3XB6EwM3dyqjjM6ENRl750PBsoY5P1kHF+70Fr+ZwKGKFLjY?=
 =?us-ascii?Q?iToSBsFNN6FXvxyuXQhgO0EUBuO7ETy/2TLrx36vbaaeDmI0ac7XGF5u2vga?=
 =?us-ascii?Q?ckvCsUVPll2hX/XOAtGUxDxeFuOWJn9+UQ1yA3RpC3zovtXzqDUNyFggDozB?=
 =?us-ascii?Q?AFB98RqIIOdFkeHX5rAvX0cOH4ywkFqx+iqpV1Gdm57DEVLIZxKdvy8s4Z9L?=
 =?us-ascii?Q?pweV/qgRPu1uzaMDljMrx0VC/8Y9m6gGDYGa5k4pZ1XNO7WWn/FGDI9RNVsG?=
 =?us-ascii?Q?VWDrC9QUwpM2pLRW8dR5Ui6vOlj2cxHlMpv6y6Wh6r6lCR/fkkDaw9KqWg7A?=
 =?us-ascii?Q?iZyiZyeyuUTkdHCGHrBXylWAo6smjShNR3l5F7GdKWV0zbe/USHE/L6pTYty?=
 =?us-ascii?Q?cDBwKDUtJtsNubDcPB0M3HCXcn51m3x2mmS/hGWyX9cUV007Yi/RZzEEmddR?=
 =?us-ascii?Q?xw2huqyRL+kjE9pFvIkvikEDXbaAoVydvIrY7+XcgDrLSmxmHLx/0D6+MAgj?=
 =?us-ascii?Q?ndfY0jH2c3bqxb8pLTTTJlIKStFT6lFA22N2g39rijO8D0Z7dCxqsRixuUo7?=
 =?us-ascii?Q?+yCs3zTtUpO9m7rQa57FHHBEYf8yyWW8yugBrr92TGGoriOXROLWMl3mjXIG?=
 =?us-ascii?Q?/RasnVpo63KjuF5ixc/mTxSwfNea+5K+QiYqXd0VPA7bfLTzm6oxfiJzp1Zd?=
 =?us-ascii?Q?MyVFDE7Kiq+783Na5cNrhrSLFniA12++T1trUFwO5788n2BQeAXvmh6Xk9R6?=
 =?us-ascii?Q?/msaowdR/k6quMRu+mJVEi+kYEhWCi//Zy1R0hjTPHFpdfTC6wiuCVfPvbIl?=
 =?us-ascii?Q?SBmNTPyrChnjh4WfZ2o/yXJmdxklKP9rJqKnsyYfKVxgrxQ4VkZz5Fg6vYIW?=
 =?us-ascii?Q?MunignMglkRPqMKWQw0iIJ5nxfukfSWyGmjKx5AbMglal3sL04Gt3kg+NR4o?=
 =?us-ascii?Q?AY2erPUNnBMU1AsEn7OKYUvqAJfrN8WTdbfsq5OL8m69fOkty9Rpmpqw8EaH?=
 =?us-ascii?Q?4/BhyI+uhE+HOyczuzYZFiOoGTv/ZRizWtJ41ZQvOxdkQpx2C/c32RPl9NY5?=
 =?us-ascii?Q?VQFbW2PiU7o4F3fubkzKYRO9T45FkT45qRoHguRyUSDwCwmK4TtRWsnGa4NE?=
 =?us-ascii?Q?HnnhFxfi7L0I8PCPOSF7SkVQqi4gQHeQikeum+wRohCeRj26I3FkhSHunjMD?=
 =?us-ascii?Q?G772cYpcekHcQDXwYunje7whB5FzPS87fQ3wWrebREYuU6XkrGucffmjT7kk?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c80ac96-4315-498b-1404-08dcd2a1ce30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:39:18.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcLOxkrZwMNpjXy51lh0Vb7+C8MU9n+JkQ5EFCpE8FtlQNbms+3pNfj5qH82sdqv3wBEhoesHxO4nzeurrBZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7579
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

On Wed, Sep 11, 2024 at 08:57:24PM +0530, Suraj Kandpal wrote:
> Do not do intel_fbdev_set_suspend during runtime_suspend/resume
> functions. This cause a big circular lock_dep splat.

Please also add the lockdep splat here.

I also agree with the change and believe it should be removed.

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index a09062b7687d..bf18fd69e1c2 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -333,7 +333,9 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +
>  	if (!runtime && has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
>  		intel_display_driver_disable_user_access(xe);
> @@ -420,7 +422,8 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  
>  	intel_opregion_resume(display);
>  
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>  
>  	intel_power_domains_enable(xe);
>  }
> -- 
> 2.43.2
> 
