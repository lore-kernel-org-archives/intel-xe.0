Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E09CD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9510E810;
	Wed,  4 Sep 2024 17:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtDEIPND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB73510E810
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469466; x=1757005466;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pmHjoL7FtdwGN+I2vOO9Zb2zS+fZzjEO3kieusmbZ+0=;
 b=RtDEIPNDUbPMNuxdGdkHVhrfy19HnyHOCteKL7xiWjlPa4e07hNOZnt6
 fc+rL/3l+aNS9UjTT9OapA/JyQywJqggtMmT9o3z0n014KoK2OVkUksbm
 af/pJ+IzfuPF55M/jPxeN97FBsazt8OkcQcPEIAbQtMOFbzKLksxanDhG
 5/ZanAkMqhvjfxSCMsT21AYxlHGeSCude5ts/J+nLC3NA5d+H+FQ/57LW
 QdRgmd9K4P62hMtCV50trL3723OE4qcNxUvzqwN+MpxmZbsKxS9KC3yLS
 LtwAOks64BdFho6oQ2LLkjCpDKJk3X6+kBTKd0759eCigwOeEx+KMFG8V w==;
X-CSE-ConnectionGUID: T9HMoMSeScC+aUX+GWsXaw==
X-CSE-MsgGUID: TG92L07kRrKh8t6JCIpEFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24293066"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24293066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:21 -0700
X-CSE-ConnectionGUID: 9sBeymtkR4Ct4P0LuOP0FQ==
X-CSE-MsgGUID: 5/3HtdWSSU21A0JaJnSJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65325703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:04:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:04:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:04:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:04:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPd0MbbrFCDy7GXW+W1uWmAfYAuM2a6v69xsX2haiO2y9/yFitqTZHnRBNyKXBhfrO+VRbVOZnHzj+7G28oEg8f8+EPXdkrrj3YMsf6knUOawNp7AIT/qv2kPsZPI5hYsW3fPvyt25Qh6Q1SVg6fChXbf2oYyW04/4xQ9d4oXz9n3m4pVc4+PHi8bycynLronaQyZOg9pEiGB+m5AlCvkio6EEj0WOOxDyd1EY5SIa9LpguYgAcEjporJOjgIPmGt0HI9D3ydvGhn4Wu4bTqXiq2ph+22k6TMmn3DAaJmufvnO6T4XG7hwe4+eglPYnPXbcT1fquH4xI1mwbh9JuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9vid/JGWjlSc2oJUdjnDqBuMdf+v5oUxb0g7deh92E=;
 b=RDO6z8fOzAjVcOHVY4SdBBQMQIyUyz7mLeDza+ALqVfYpGbDv6H76g/SSVqznmGJ35CzM0aaCB7bIR+LnIeAPDobhqig2Rq2zaV88mhxzzDNzXojxEiKxkNjkrSf0qBHVBdVAQr2o7vLqyaFgqm/mbLC7Z0/FT4FTcW3Q6SiO2akprfBuKnSPJ4TnHUm6c41GtO3261nnbKVgEIwK/Z3rF6DjGOmevbS4Jl7m6s53/dVauuca/2bQLq4p8PHL0U1i6VoUnS6jdZYVpI62gjqh7sSzBE0NjemyEguhK3vM5sEGx6/8NZpxOzC03aaIBUghqD44Lvp+aq2D3uAt67L5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 17:04:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:04:16 +0000
Date: Wed, 4 Sep 2024 10:04:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
Message-ID: <20240904170408.GS5774@mdroper-desk1.amr.corp.intel.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
 <20240904162238.2831202-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240904162238.2831202-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff81012-b1cf-44cb-d8a5-08dccd039bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mq+7gORRhwCK6qAlSdCmdngKrNbpzk6NjfsMa096tHK3slqhK8XeeFyb1E8A?=
 =?us-ascii?Q?WwZng/hUjLSTA9Haz71RrWmVTdEuA0Vu/H8QDrnOAzC0+rt0Rj1QRUh/97xH?=
 =?us-ascii?Q?l1PFwXP46gJ+ttgboxMt/GNqo1qegq7dNvCyQQ7QfUMFli1b+W1XMfzfy7Df?=
 =?us-ascii?Q?m/VVL4tQGsWwtXUFfadsoGtY868p7+xht2cGIHan86Cw6sMuw/x6r+8t50Jn?=
 =?us-ascii?Q?secuB2v9MPyPlrB3A+t+3dE5+9w58Saee6NBOzPcq8VokOQWIeh8D4kUqYrX?=
 =?us-ascii?Q?f3xZT+IaUoeq7cEE1DPHNhmJR9NSzsrJ6olyCI8Q8vZmLf4izdOC4Sdgmrin?=
 =?us-ascii?Q?rZethrnsMQO7K7XZj2x7DBwr3jvSAiWfwgIb/0E9FuBVs19Gi04zbhc9tzAG?=
 =?us-ascii?Q?a9ZzBrVKbjWEGm5lTavHuaKjbOMcUn4cxd2fzvul47MwQ9Gf+B8KovcXukcq?=
 =?us-ascii?Q?bdqPv2n4R4kG/hRwcdUyvh4ay3rl6D5DRM/reFBhi4LIvBTHkaNd0leQ9v8z?=
 =?us-ascii?Q?M/2tB/zJqHFfmox4U//Fq+Nr9x5A4IsSCCDsJeSj34TPRz0JeWXcuRxauiCK?=
 =?us-ascii?Q?qRi25Vn46DOiewpy12vkp1WJBMnatQVuXCtZ3a+3SqbrLdlEHeeCzh6uV1QQ?=
 =?us-ascii?Q?qzxAx+QZaG44fzFphXw1F6vErVR9yCJptCGtlqeARCwNJs4b5DuGhJIJ7VLY?=
 =?us-ascii?Q?+AFrINoS/UKk81rd3NBfPxSZr9C6V7wdBoHCMcETEgU2msYe/zwNunhbEzio?=
 =?us-ascii?Q?NDAtBDfjp37fcJt9HlnkN+E8I29LXg6MO2EqmyFcHVpNCzeeZEflfGvLERbe?=
 =?us-ascii?Q?Vobgve+MplLyJ96orXXpGHL3f1LVz9xRJ2vxYdRWIEBKBsMX5u7qzMeMCPM+?=
 =?us-ascii?Q?zgEYRsaf91jd+hm1MoUFsAPQtwT/V1xyuY28DjMEnGGrIFvN9Jc7tim4SK+8?=
 =?us-ascii?Q?j9RNdwDXO3oGChX8/Vn0D0zqwnmPPzcBspYLp3LjJIERcEquTFtUm6K1/JCs?=
 =?us-ascii?Q?lxdhImp/JafczEau/wYfy06VpWCo5GDSYQgU69QK52UH/KabarZVgNZF1Au4?=
 =?us-ascii?Q?jReDST7lH5/k+brlj8wJvKk2zDaMKjxPpt2eENFCc6zh2DLGp0P/IghIoDjk?=
 =?us-ascii?Q?DwxbJ01XcfSNoURawdVNmZnJEmXPbUydLeXfR6/eVq2a197ZLPAQ9w/wlGTS?=
 =?us-ascii?Q?3IzzmgZBuAMqAVvrR0RQCDWAnjeTJI9qZv+RYowpNKjFgvku/SJGvw6hMGqY?=
 =?us-ascii?Q?GNVKhun1kXREB9z6Ya3As46kmLUTuPi1ibjr7vtRrDWEEVzlnBuyuXveHISk?=
 =?us-ascii?Q?jlQKle6RzBvENHt9Ra3+MM8vh74LdoKpaZEtKTB+0O9SVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aFCK+9HEc2/rs0sPrmIW8vhZrazW/1e4YKy+uB1bkX4IPbClxvH2NzB82xvg?=
 =?us-ascii?Q?nDMcyqtoCv0+4iLkueNe9S2i/iiUY3RQQtT6YsyymZ7b430wViLzRG8gupQL?=
 =?us-ascii?Q?/yidI5ODjwFg0OQoV8QkpGSagWyqwgZd0s7IBGUkzsBuF8LB8EFHCUago3NM?=
 =?us-ascii?Q?SbCAh7j7gpIObgSB6B5wyGVORVKEMosCigLv8ObJelBUnX5YPEASJkhhqxbo?=
 =?us-ascii?Q?i3JvTVXnlp+ZnhU60OCwklKF5L4Kqb/sf1PAZrQqQFu2FRc2b0Uc47qhVAtS?=
 =?us-ascii?Q?PF7/7nENnkg7FqNfRV0dyBJoENKlUrAud8edLNQzrOyWhVjDJmKN9noGVFyk?=
 =?us-ascii?Q?B2hL48rshhITLx33KKQjbR92v1wZuYgYxeBzng2EUyjzphNwdWsgdTuoIRJg?=
 =?us-ascii?Q?oatZoruxt7SO5ttYk2+Ehy7EGNGb8aB/nc4W4RTUczHgSyKCcjqAGWJGYyyh?=
 =?us-ascii?Q?Fc5kG3VF+YMB9o7yuEH073wMj5/k1rwQUslUPral3W7LTyUDUcUsj8RWdTtw?=
 =?us-ascii?Q?HkbY03Rs4n0aYZNYICKrU45YJBHxQAl+74WraCZEVEhX+up6JUxVyoqDJzhU?=
 =?us-ascii?Q?6uRrpPMCw21xfBQIT+7Omg4wUoufaT0/YD94wzyLuQpHbIAukd7eFLU184OR?=
 =?us-ascii?Q?PKBZGvGfjsmed4Gp716jzdOpGj9ZC6JkA18u/w0HQnhPo97Wp94hU9OLMrGv?=
 =?us-ascii?Q?+ZZhcH296nxxCfuQfHlSpCYy+FZWTmp7G8SO093CKKkkxaJVTTyo314fnFgE?=
 =?us-ascii?Q?Ij5V3k5A49a42xWu1tTAO2V773M9vZsARuevfy6tAHWIWofNMUxwGVGBvN8F?=
 =?us-ascii?Q?r7QwEzAdukOjZDtpHjb7s6MEhwU/h5lhl6srTwRnNezjrc5cpeDZzyE903s9?=
 =?us-ascii?Q?6jZRMNQOSW+csJ+YNw2+57XJ9nMEgykJh6qf98t9vpYggRY+HvBnopS3TGEo?=
 =?us-ascii?Q?uMRJYkIenxebJ7dL4fdoU6RvpNeR7+B095BNjpPZeDNoiEjXS7KpxjeNzCKd?=
 =?us-ascii?Q?oFJCOs7hUQ7M+xrDwCFyYi4dyVA2k/uLhrtHCbLyyHqkfRNv1wtb6laU8FEl?=
 =?us-ascii?Q?UHlfsv4hCF06jR7bdEJTIEIsWenHOJp7RyJ5cSxgbne9I9AoY1B5vBJIfbcy?=
 =?us-ascii?Q?2eXF820xAFWEIrCw810TTPSUxUZIhhjEop0abigy3n1srCjC+rd2Z+vyBGEq?=
 =?us-ascii?Q?7G6z0BoHTAsTRNVy/0mmU7nrfT+Bf6e1rc7sLKcx3b/SvjxQyLDcBs2Xmc7o?=
 =?us-ascii?Q?NdHglHbU9i1kjTncUnpJLcl5ZxWBTDklvQm70UPKz2RBedCDBr0h6XG+lg5Y?=
 =?us-ascii?Q?UfcTsw5zE+/tnXK3QNPkxFVdqf/eYyyGCmbNZBWetFRg9SS3acrX4kyzbftr?=
 =?us-ascii?Q?q8m6STS5PN4Wr4lypIf+QaXiumNmdZ3Ljfd5Dzw2BXmDb4hZyOFY1pGvWy1g?=
 =?us-ascii?Q?KHg7FyIlFeWduxb6HxLZg/uMhAHjFTtPM5kRLvzmAC6lzfiWtarZXqQAr7oh?=
 =?us-ascii?Q?d3cARZVdUXEy9k9kFH/vHruJq9LYoV0enxjOWqPezqL4PPdpjKnz1bf7TFYL?=
 =?us-ascii?Q?Z4DX04rNTNO15PqHdmjm04izA29WALHO20tkgkdhgEMm4p3h5zt34ROAeqe6?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff81012-b1cf-44cb-d8a5-08dccd039bab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 17:04:16.1379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIQkBgdnCCPKf6z2LpgJ6S4+JuWL0YF8zPOM7Wwm+BVd9ljZl739DRPkpXXyrC8zolSK08f7/ZMtZQUlsm2j3C9huZr8mVrFznTNSq8WvS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

On Wed, Sep 04, 2024 at 09:22:38AM -0700, Lucas De Marchi wrote:
> It's confusing to have a *set* function that actually probes the
> hardware rather than receiving a parameter. Rename it to *probe* along
> with prefix removal and comment in the relevant places that the
> has_flat_ccs flag may be overridden in runtime.
> 
> While at it, fix the mixed declaration of struct xe_gt.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 +++++---
>  drivers/gpu/drm/xe/xe_pci.c    | 3 +++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1a0d7fdd094b..449b85035d3a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -588,15 +588,17 @@ int xe_device_probe_early(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +static int probe_has_flat_ccs(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
>  	u32 reg;
>  	int err;
>  
> +	/* Always enabled/disabled, no runtime check to do */
>  	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
>  		return 0;
>  
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	gt = xe_root_mmio_gt(xe);
>  
>  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
> @@ -688,7 +690,7 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err;
>  
> -	err = xe_device_set_has_flat_ccs(xe);
> +	err = probe_has_flat_ccs(xe);
>  	if (err)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8642c079bc65..94856ed6686a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -677,7 +677,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>  	if (xe->info.platform != XE_PVC)
>  		xe->info.has_device_atomics_on_smem = 1;
> +
> +	/* Runtime detection may change this later */
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> +
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  	xe->info.has_usm = graphics_desc->has_usm;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
