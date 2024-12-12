Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539C4E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E7810E0C1;
	Thu, 12 Dec 2024 03:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGG6x6sq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBC710E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733972674; x=1765508674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PrB6Xragcq6OIwL7+ac1Tb9PycTJ5W0kjoguYh31FDk=;
 b=eGG6x6sqROLN833MxLrtmwkzlFyqAs1i91R8GSFmar+aHH25BcORGxLE
 briYJLCqMMRRHvhKNxWUKAku+OLvas6Q2gw01Iv1fpEb23zkM+Lppk+Ud
 2OW8IJ/Bg0EpCk1vWQ0uFW3bo3HM2laenk4vUytfaP3bo9jjNT3mV68CR
 7RqaG1TRMWU4Twc9fk1j9+ylilE+pdNsFRgMr4ZpGToNnWTvHmHN9weJi
 33kbX2hH6yISkLQwQWIj1EH8pjacMvJZ9wI3sdyvvFOQiY4soOOdfH/6a
 j1BTIo6kQCPQ9XgSL5IO60C6kylid5YZ4YayvG1cyC6hnO9wxtpE/sjug Q==;
X-CSE-ConnectionGUID: l4f7IqAYR7qaG6whT2mUoA==
X-CSE-MsgGUID: ahTIq9OgRm2taUB/8OMQlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34280102"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34280102"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:04:23 -0800
X-CSE-ConnectionGUID: wYyAbrnRR4mfnqwCkenShA==
X-CSE-MsgGUID: FWFbGddaT7CiEqzbqNNfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127042828"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:03:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:03:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:03:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:03:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GH5gi6dcApdgm1SXXEgIu4m+54Btu/1pVdLEzZxR4WTAuQPeNdW+VInVN6dWHvMcTCrZq2c1nAzhcDVXtvXQi/VkLnZsaq7gB+yTys+AZ/S59+MQblPWRI/6RiFRyO23Ud0SwNt0v2n2YID1bcuplS+zK3cXiITKjoJ0oWqIbKqDl5lL8WjO5ohygU88MX+B63ygPkOB1/25xnQ7/7K5WXRvDcCU/ENEyoC3HYbNjcVk5qx5uZ+0zaeQ3lKdAvUQDtu+tevllhBLw4ADalItJb2FJPAk2YUSUmndKwwhCamoo2ijk6UZFS5Ygse9b0OGDTEzCf66S1GGMtZcSba7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tUh6yprqhIVpHQQbNVc1GQMiHoi7PTga28oWjESghU=;
 b=XpiTp7qv2tw2NMtR4/tRVVkunIhsaIV81Goz9UKxrff8MTNpbhWZh7dxtw9QU17BzVSpx8qlaeD5RfAa3934VBLgmVR3KQPgEqujxEaXex/l6SOssu6gGrYBiWQAq6JjVBaoG8H40Yw0+h4+Udoeusgs8W2MwZbldMCwi+acC6WXVLdejhGZzxG06Feh5wxCVNSugQVCXT5yF+FQSKwVaI8K4x/rfSyiggMl2tqDFaeKNEDoWb4T20nAJ1ZNmATsZn3y+7rkXePdc0GL9TY30p48KdhWW/N00leThGVYRcYm4OSwMq9A/Uz07G7wI9HulNW4Sqaxdv4vwFmAoUUOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Thu, 12 Dec
 2024 03:03:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:03:16 +0000
Date: Wed, 11 Dec 2024 19:03:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/13] drm/xe/sa: Drop redundant NULL assignments
Message-ID: <Z1pSnpJxGWtkK3iP@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: c3647aeb-e9ce-4d56-7cd7-08dd1a598671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jLXvcD71m6M2dRkbHHMdoA1JV50cfG5tj/6k0IYF+BSRHM9TgJxIpl9jAv+H?=
 =?us-ascii?Q?KVOFfj49qWvRmOuqDaVrGNyPxRdcN2S3B9/505UJhhAz6ANhmtgL5Cjwuqqg?=
 =?us-ascii?Q?JtkIKG35JLwo1HQr4g/YEqnps79rbOg4O/RTuYG2x9of3tt7iQDjDvDpkh+J?=
 =?us-ascii?Q?dzhqtX7HFF8deLvugMfUorP+E9qyEW06y7ewW6diU49PK99IXpas92q9ogGW?=
 =?us-ascii?Q?flReGleJon6dCeJQWka/GuEeZl5IvOzfwSvjcNonsMcFK7EaDfxlxBPNFEjK?=
 =?us-ascii?Q?UMMT5PT0pVTBb+CFrUxIwiOg/emr2oSPl8/6VAps67KBHFwKiwWz1s3SZGJH?=
 =?us-ascii?Q?7ja+5YgmoxFJ2jc/tfG2hfLoRc48p/QqOA2In30RmcxbdG6Ct/xHiPoCp3FY?=
 =?us-ascii?Q?TjvcdWNcKbQzuQRIcXwCKAJaGtvJBKhqk45IDOEtr9jpps5uxsp45x/ShnuW?=
 =?us-ascii?Q?LOg/rnt6YWPZUm6iYl+mLHz0fbGF+xpP0ftvb7wc/WoUlLZxHAy7LKnCMl8o?=
 =?us-ascii?Q?HOo5N394vbEsZsUCMhJhmnJm+tCnKwsEghHk+1Hml0wF0ms5i9b9FPH78+xG?=
 =?us-ascii?Q?tN6aICiFTjcavZ6msmZmDGIMR7OjHeFF70h2gfv1IHZDB81snszsYkL1UG+y?=
 =?us-ascii?Q?XvVQ8jE12KCcBnkeHMkfN6fBE/Id7Ewq6TEpV1PpS4XvTUT9l0kLEcqrCCAY?=
 =?us-ascii?Q?reKHP34wJ3jkK72WHOOW4YY8/DEKZCrmOmN7Jf4KvNeL2SX6t5o+KPQHmfkV?=
 =?us-ascii?Q?mKkTqaXVSAFChQWueBITo8l9F2evPDke25xTSf2/62iYWDHWyHBO8szLS26H?=
 =?us-ascii?Q?Olg0cUnaVb1+s74f9BkNR2QVuMp5jTwAPGe3+MzzTSPFMywl7/M1DIV5Gfsq?=
 =?us-ascii?Q?0jbaX8oQmDuBSRfV6Pl4EVSIzG+ZeWoU6zBO1H599YAJVqEPAHrv2nB0GJZj?=
 =?us-ascii?Q?f5mel2t8qGyBIVxsgPzpwyiNuCTMU4TJVtjTeRY2r7Ja+Znr4yKFii8g3HvW?=
 =?us-ascii?Q?LxuWoqjmTRM62F+tJglfVClOb+Kbtah58SFcj19MHdccDde9FsmC3wiHX3dP?=
 =?us-ascii?Q?8s0Mc/l9MRLtSpWvmx4YT0Q7TB9M+ZWviT/59LS6DCleSBBMAwz/9I+AGvvE?=
 =?us-ascii?Q?pB+R+wyK50J2fsnoOQQOJIgHue4/NG2cmOlXFvk2zgoNBjC6Io0CMHuqoCxT?=
 =?us-ascii?Q?OBRnK7NWFfBFav/3hcmXm9gIigdfDnHw4nXlPfFIPvgu//94xM4+qmBpRJPg?=
 =?us-ascii?Q?ax+oUOE9pTbsK4qUUS6KcaAhi49b84bT4WI/tPpLgoIa0kygCMRQJyzzFGXg?=
 =?us-ascii?Q?ArR/YcfT0oPDKSsNGKtef0HPhj1yC8V9d4Tuv5JlC1GLjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uyyg0kwYBjf7LXJ1hxBZkWQBx6qOSDp9k5utevWvHl92XRcuU9Coo3HiBeXe?=
 =?us-ascii?Q?rqrvmvkzfF15bKA9BT5Qf+eHqzug7AV04gqXjit8cwt/ZEhAmwNzMF7NvfUj?=
 =?us-ascii?Q?Ati/5w491YCWIIuNUQACFx+3hR66+lNsPJlu6A4wa2dDjPaGsYV6DFhfMhDT?=
 =?us-ascii?Q?DVIXohbsqYRXEzd2kdW22ycp2O7JSG59Aw7mKL0RQRcBhb1cPpRopCx6Mmpl?=
 =?us-ascii?Q?4R1kWuz1OawrcgXJB2YCEOog1qxx/gViQCZi2Ga3wVU3FIIGzr9g67cPMQS9?=
 =?us-ascii?Q?lPWmv92fj3t/oeyn/Zw5SR99MLq7beQFNt2yJrMKJ5NpOHb71CDi4+ilcN2f?=
 =?us-ascii?Q?bGIc1adz4LRB8ozXXsrPkMmVODb6OpEB5Num8jyPmESE2zfZebq+urPx9G26?=
 =?us-ascii?Q?gx9BV9QJ6tN7z9OK0K+NyA9fTjoT14ERCvbx85GtRgAuzBn0JOvIsy7Yftdn?=
 =?us-ascii?Q?XoNX8NYq9zsfZx9rLOQtfuCcpJfHRl3ztJwnjIKUHZ6m1mKGt9dXXUEGwTQk?=
 =?us-ascii?Q?RZXaIURiTrTgfGhDVvPvdiXOZUjQFJXfQxJHNmDgyf7WQSe4x5ng39ui4vP6?=
 =?us-ascii?Q?4iCDAE9U1BsHbf4s8FvmbtI+2LoVdxyM2nhCrkq54GD/UhjG9nO05vEjxZBI?=
 =?us-ascii?Q?sfkKlhNZLc5UVTjDVYdqNT2TO7Hk13qwEeJQMWeYWSeqPq+ibb17yxrzCJdt?=
 =?us-ascii?Q?lf3tYycXnw4yWID2RznyqVLfUUBKMF9aj4H8YTTDyb+mmP6IDAvO+LHAjEKy?=
 =?us-ascii?Q?FosmKRludoZGVPGRQViBpayoFbzKCy6F/+vaxroemE4zgGXYI6mWdCwnlhUo?=
 =?us-ascii?Q?xhOq7v7SSoWKCRY2BsiXYIWn41g2WV8oq4xqy0wLIrSUsd7IogrWS61Sozs9?=
 =?us-ascii?Q?LC8CRfoQh28NXSJHYT30z8QiM1j0lAQPefI+4Mk77RLTvN+LCcx8AokxX6r7?=
 =?us-ascii?Q?cfY4TDeW4H0C0+4LBgWeccNqw/f/jxaiEmVU4agifzgaTHEKCNAdRB/Cdz3U?=
 =?us-ascii?Q?3wgea/XvdXgN8Xu9pslMhneoSY9Gj6T6UUsDeQwvf59odoU7c9FFKCjAKmIZ?=
 =?us-ascii?Q?UVg5IFTl084ck71dFK1boq1fcQ4zVRYkHCs1nsReqGYVZbp+k0HRL+jT/AwQ?=
 =?us-ascii?Q?s9DjsBVKYG/JlYEm1I45glpr8Gat0L4j4KVYJiZPMGUMPldynDRJS4bS84Yj?=
 =?us-ascii?Q?hBeRTELpDyUjeX4h9iJ/Ev8H5tzVClPuCbll5TEJd9Z+MEiXKqkhrG9Pgzqr?=
 =?us-ascii?Q?p+XU3IjLp+6uNu9c5n1fkTtMohBse71k9kGD0IzyOlztn7/bJ3wQ3LqaIbI4?=
 =?us-ascii?Q?/zyaS5SjfQysgodsuI8UQB00EmD3x0kur+C2nfzGVf6CIXsdhh9WRW+aHYvO?=
 =?us-ascii?Q?SmDYa0P8GiuzUoZDAKF/XlFejJSJeYvRPEUdfXdI33kH4gIsKcoyZ25K/qaq?=
 =?us-ascii?Q?lT0Y7XIaWHYP2UijTNbSmJayO+Lh2FxJ6gnqpvuY6LnD+wpG3r1V7S3ugHZk?=
 =?us-ascii?Q?iqqvhUroe8z2O/zNm94wfwPzwzOuO/PJuuj35SJOgCvQ70PbrnmwxyoTbsve?=
 =?us-ascii?Q?HOi/llck6UXU7pSoAIe7cYHLoMw7MvllgPzd+0y7ryUE+u/3u4FjI4VhEcym?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3647aeb-e9ce-4d56-7cd7-08dd1a598671
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:03:16.8013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZZoqb1WSfzH3RnZxV9gaJ8Xk9DRtdUivZVq1bVbpCwF0fyqdeHlAtdMfc2GIsMNaGjA25QfIs4J8vfASza8FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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

On Thu, Dec 12, 2024 at 02:01:30AM +0100, Michal Wajdeczko wrote:
> The sa_manager is drmm_kzalloc'ed so all members are already zero.
> And in case of kvzalloc() failure we are not returning pointer to
> the sa_manager at all, so no point in resetting .bo member.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 4e7aba445ebc..eb314ca75355 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -44,8 +44,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	if (!sa_manager)
>  		return ERR_PTR(-ENOMEM);
>  
> -	sa_manager->bo = NULL;
> -
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
> @@ -61,10 +59,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  
>  	if (bo->vmap.is_iomem) {
>  		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> -		if (!sa_manager->cpu_ptr) {
> -			sa_manager->bo = NULL;
> +		if (!sa_manager->cpu_ptr)
>  			return ERR_PTR(-ENOMEM);
> -		}
>  	} else {
>  		sa_manager->cpu_ptr = bo->vmap.vaddr;
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
> -- 
> 2.47.1
> 
