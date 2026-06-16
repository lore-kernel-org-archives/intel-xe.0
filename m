Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DF3CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3EE10E665;
	Tue, 16 Jun 2026 19:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4xpce7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67B10E665
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781638639; x=1813174639;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iyy9AznjNbaNJaCGJ9unFtYcjT1bkkBLJ2scah1h0N8=;
 b=I4xpce7NmGnSTLUxdcH7aD5wJVmr/bpzHGYvpUvpPSKXB+RHJ24GH0qp
 bJ6+4BPBT+GFr7/bz3EG1vWKYLfsTFEBP4AbTbA9ZTkfKNFGyDqeQ8GRm
 MFWSkqVPbGBC8KnO1/6vsmbGLDqsgs6KQ4qYdgdAkmarfaQGazX194IYH
 lsV/CoQhy7CM9KljXYmgPIkKETf8OINPtanPOOwl2hv3AdGrMLZlKb2U/
 MzDavTCLLHPu9McT5XCSfS+1311LkIc3NdI8AhTntrWj5+3lBGqk3LeRr
 ez5Xzfghyn0Ap68c+P1bte1s02BzPICjRr/Lfvo+6nOpwS/TvXUtHoETP Q==;
X-CSE-ConnectionGUID: X/22yhPlSDq2RP4NT1YWgA==
X-CSE-MsgGUID: pU9tcsl8QuCnQ2Xcdsohww==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82460286"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82460286"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:37:19 -0700
X-CSE-ConnectionGUID: 3YxEOskxSp6lh9K4gtjIow==
X-CSE-MsgGUID: INVAH7RKRSKl6T/zZkM0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="245492686"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:37:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:37:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:37:18 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdeCuv/XDGAW2YeGdp/nugOzB/z8TCkOlQNAQqV8iof3oGmuGNRiRS9IkWnJBUC9rYaaB67vSfC+8ztbZ3YbF5ZDlYNXTE3+JiHL9hOFA/TtCKf0E+3vFkZkRWB5vQV593MxJD42TYHfSbLOiybZy6YNv+wDrMvC2vI3p5aOYgEMSgI96ZqSM95m3ogGpUwd080DpI7ntBXo0XuFuKz867X/13GOEXR5Gm4S4O3mdghUTak227x5QOkEGdgGBXlcwJgxH4OCd7ba4sjXC4zIp3lppKsdFqKvZtFgNCxWUEoZs6BC2CEEAVr+zMLENzzvks/E2hKjx6pqRic2rh6QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXS/iOWXUhIJWh6ol7XgdcB8cBJNavHxKEhEHTWRop4=;
 b=TlTQEphQFQhH0v/rH1LPUR7iUUJKFM0+P8obL4OPov7hcNOll+dEd6Ox80Eayokg5OvdOH01jM4b8cTfKDhqrC5c9XHioSvzIN3jTGKf8L/p/F/3n2Y3KmjbEFLLmP8iW98w1CWOIWTGq5bAXe1jLLzJMnlnabW+/nF+LdCyHHa32K3S3aNxYPq/hCTkZv/8D/ccv6RMMPGV9vKBsZpmLSWnLoYWMqz3RWHxsZJsRM6uU9EBHhB4dWYsl7yL2G6wmhbTdQ/oyabi3k5NjExNdNa0NfjrQIevH7jbM8Q5RX8JGwIprzrqpv3I60wBUVJij+Or1m+J+UAhrGCR2ciZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by DSVPR11MB9892.namprd11.prod.outlook.com (2603:10b6:8:45c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:37:15 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:37:15 +0000
Date: Tue, 16 Jun 2026 12:37:02 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe/step: Make xe_step_platform_get() independent
 from xe->info
Message-ID: <ajGl3nwcGd2iXUQf@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-4-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-4-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|DSVPR11MB9892:EE_
X-MS-Office365-Filtering-Correlation-Id: 85944b63-ca96-45cf-200b-08decbdeab4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zj/5oFdEhI+tPrX+Db4wuFqBGtP+JJA6VIMkVJiE2vSQYPfCUrNxmaxq0zgCdSdZaLviKMeA7frPAnpOCSemW7y19j5SJcx+S4dMNVtx8KUEZ7RK2IOvSv/5KzNGUgSaEv1ugA0WcScLC2gz8Yj8pdQonSRn5jQw27UqNmq0iNb/PtVSAPC3msX+S8r3+DuXYFaqE4yksMkVhkUR6Azdf+ZCiNrfY4LVLbropG0gB7Z/Mu5CuRcOgpTm0Km2sem9R1/2lZRuIByW4/j1jrnghmk5YkS0rUEIf7aD+BUMHrRhaTDmmhaX2ZriG57kJnVyTzFyBCfpUfYx9aoQCelT7OqbbvLBvi6kRQkgSm/aOC6VRs2yAKhv0R0BfG6c+tl47h1Dnloln3AmtKHKBJorQ6Wc/mXZW3st2dxWOqYdBocNwIabz5Iy+x5nXo6omnqlJgEsTKqkiqU0N2SLt8M+CMwRyTnqIfoQF4AQojtqmJIGqqXJ3eJIhqT25PvKE8EMX03JsAnySYgqnwYSUP7CkcHDrXsczrqcjx2z0TlXEtGmzTtVCQY75ueugBp2jq6aOAedY4PGSGIB78bLRSZlcJRCbPxHudxvmz6y6tX19e6y/HyCMzbdT3KDIKQ+/Yy3tr9UbsE1qKtri2bLVAXYRWwaPE5TA4JWgdI6CXBGn6zKgYShvoO9cMFO5JSXh6nc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaQIOejHzaGyQdIhDLVQEvuOrFBlUvpIk0w5/L2WOc6/Ag3UnfDfNoO77lK8?=
 =?us-ascii?Q?H+z+DzgEwZ46Ui/uD9iNcNfWGLUSBygdgFT6YF2N9BfUBX3wY/J8x3oh6Sp8?=
 =?us-ascii?Q?1HgtP0mX1cnRFYBTQGjDf4qoOb+oY33gduUHhPCD1PkdJfLKRzSwdTBMmY/B?=
 =?us-ascii?Q?R5arK2yi7XVhVMyJAbvjw/aZ6doMvWnKzhAWzwPHIhomU26NjE2/Ame/ioCb?=
 =?us-ascii?Q?zBsQMGB+XbXq/YsCmBxazYktZ537Mn2Vw3r5Gk62a9g8q34GsM51VBDhiDod?=
 =?us-ascii?Q?yHzSehRFT802FTkvfIejmE92asdQH4Hqn0dq6RBXlxO4x1Xsa2jsiKvuSS4j?=
 =?us-ascii?Q?JXoYZEohfX/ft4aydTmWLIrONX3Q2iL8B504MvDMvBSJlp1ZPaYfUH/XTO9v?=
 =?us-ascii?Q?qC5Y7eGC1bdpJyDYgZyQqSNHuvacc1TUcvNbrQFha5toIYlRzdpcBcPWBqgu?=
 =?us-ascii?Q?x13PKUjufnoqmSmGJmgjs9rDOf/Ws2WkIsAdAoAnwR7fouAE63aa5/7BsnFj?=
 =?us-ascii?Q?fxL6iQaJF4jt5i9l84xxbyyi+HFiUmUY4MhfP4MFy5L9nX/tb6QZrFHmCLrW?=
 =?us-ascii?Q?6YoMP5Yl9IvusGvJyC/NtK3505wVQPwbCuybSc0o7zGlydP2FUo8m2sLjoF6?=
 =?us-ascii?Q?uhhcYTcSsaY7xOT7V9MHc44lMZWDD57MIqP5N88oT3djdu1XP4BRi9J21CnB?=
 =?us-ascii?Q?9dYH50oQyB5/Jzzro1jGzcc+NiMhjz9nTvEEw2oG6Hxnn2tbxfdu/QGkmFLT?=
 =?us-ascii?Q?G5CBta1HfiFGyT5JDd2YMLsqzEEMi5PsF7WBPMqvWBRAHte38+hqEJ1xXv0A?=
 =?us-ascii?Q?DoCYQoHNm+8AEx2aKtAzB0Dv9ogUWa2lBmd8z5oZlaM+mOf9lfp3LVHRFViy?=
 =?us-ascii?Q?1e8/5JGqq2Cd4JjLN6og7d0gqfQQBI5/cH9n4OEKaZhK4FCZFXCaX+njzLUW?=
 =?us-ascii?Q?ucNKz3twhEJtt5lfps4KczpumlSGoV2fPUfWjszeRKbLX0qy+gvEckhL/Lty?=
 =?us-ascii?Q?bRojbHys6s/yIO/wUS1yYvr/PkVS+AkoJFjgrEBXbpSRltaFgquDnGARK+DA?=
 =?us-ascii?Q?YwzPNqn4DoN6Z097jf/zfgv9BkFF5Oll9HZpz2vRk7pl8EuMcbsDZlaqVBLj?=
 =?us-ascii?Q?8Z60E82qgQ1NwumDB6rFD9zk8DiNRzgMENQEGV8AT7AC3wSEAE9JjMniwano?=
 =?us-ascii?Q?xQ4ocdoQvnn7Hvht+eyGiPPRu4Sb9yO3FkEjUACVPfCp/1/OEY2GNfA4SMpx?=
 =?us-ascii?Q?81kEa1N2Li9qKmKaj5AaaPWPu9XoguqMAPyrxzdVHJfbUxMc8Q/+uV44GaTB?=
 =?us-ascii?Q?vfaM/VBSrRElzgzHwU9I+sBR3MFkNqjX4MuX/nf9s8tpN8nGmB35M+aajs5S?=
 =?us-ascii?Q?sq6i0JCMd1jcXZfr371MdwbmV4EJMtHPz3B1ZyvEMn6ox9QCH/DHXrlxTvkl?=
 =?us-ascii?Q?cdsNFot5giNYqw3Py97aaz28W0R9EtN9EcjPgiEWXDG5UNR3+Hzrdl2mNKKf?=
 =?us-ascii?Q?y8Wj6j3JKTy4ls5jH0sSmZEABR/0I54lnvCCMEFxNOATrSj/g00ZyyGKmO8O?=
 =?us-ascii?Q?9Ce4xvFAol0/+KJNifV6ch+M5uPx95M5xELySQgHNsLL59No7uFKtXIzNa7o?=
 =?us-ascii?Q?URhla+k/b+3sSAhFMjsQSrp0sVHUgpX6qUDGxZDYVMMSnwDgKdPfpWpvI4/b?=
 =?us-ascii?Q?ffSCO7sMqsTEXj5ckxKKCeuFi7b8XenE8fYG/WebbyXLv0IsLjNHLd3zCmA6?=
 =?us-ascii?Q?TrVWG/lX4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: Kyhr+sIZdtFrCzSwa5dNLpivP5zQCas0J3sEFdLXJXfl9QNtPpcFTdfKfCFFY49jiNgQjWeRkJwDu5CGTzLjx3KAJm1ycelBhjOWCibqZl76232N096QYZv4tqbWfrTjEtgfcrmNLaJTPYO3ucRB4keVG5nRPRcm9zQlbpIGJ4nM4dIQJdHeUHarbrvD8SDsFP5F2OpqiKjoeXCr2h4mSoHRia/6euSveidsziumkieveybZY54bEEBhjtOaGCvFAoMjRH0VUFFNJv1+HK2+5ihSkJxzriGFPSd4t1g0PWlZBWcUf3+qpaH0Hq5j3YEvG23pWgqppQFtuPpkVoRXOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85944b63-ca96-45cf-200b-08decbdeab4e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:37:15.2208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89Rw1B6o5QZnvamAndvDvrW+XYz9/dU9wPL57KYLft0E6RXhvuY9hwMtT52zx6e5Yo7e5IVH4OafwSYMdN+1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9892
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

On Tue, Jun 09, 2026 at 05:17:36PM -0300, Gustavo Sousa wrote:
> Currently xe_step_platform_get() uses info fields from xe->info to
> define the platform-level stepping value.
> 
> Because the platform-level stepping info depends on the PCI revid, it
> should be defined as part of xe_probe_info_early() instead of being
> directly probed inside xe_info_init_early().
> 
> Let's make sure that xe_step_platform_get() receives the necessary
> data as parameters and does not depend on xe->info.  That will allow
> us to move the call up to xe_probe_info_early() in an upcoming change.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c  | 2 +-
>  drivers/gpu/drm/xe/xe_step.c | 9 +++++----
>  drivers/gpu/drm/xe/xe_step.h | 3 ++-
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 382df59260ae..c5c75fbfa0e2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -808,7 +808,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>  	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
> -	xe_step_platform_get(xe, &xe->info.step);
> +	xe_step_platform_get(xe->info.platform, xe->info.revid, &xe->info.step);
>  
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 49dc64f2b363..55c1996f689e 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -110,13 +110,14 @@ __diag_pop();
>  
>  /**
>   * xe_step_platform_get - Determine platform-level stepping from PCI revid
> - * @xe: Xe device
> + * @platform: The Xe platform
> + * @revid: The PCI revid
>   * @step: Pointer to the step struct to update
>   *
>   * Convert the PCI revid into a platform-level stepping value and store that
>   * in @step->platform.
>   */
> -void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
> +void xe_step_platform_get(enum xe_platform platform, u8 revid, struct xe_step_info *step)
>  {
>  	/*
>  	 * Not all platforms map PCI revid directly into our symbolic stepping
> @@ -127,8 +128,8 @@ void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
>  	 * checks.
>  	 */
>  
> -	if (xe->info.platform == XE_NOVALAKE_P)
> -		step->platform = STEP_A0 + xe->info.revid;
> +	if (platform == XE_NOVALAKE_P)
> +		step->platform = STEP_A0 + revid;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index c6cea95a3727..5a5845335740 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -10,9 +10,10 @@
>  
>  #include "xe_step_types.h"
>  
> +enum xe_platform;
>  struct xe_device;
>  
> -void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step);
> +void xe_step_platform_get(enum xe_platform platform, u8 revid, struct xe_step_info *step);
>  
>  void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step);
>  void xe_step_gmdid_get(struct xe_device *xe,
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
