Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0653BC3DA79
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jan 2024 00:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC43E10E02F;
	Sat, 13 Jan 2024 00:56:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247E10E02F
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jan 2024 00:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705107400; x=1736643400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XSaVEEFYUpk8hj90wf62gTimQQIvm9B9l8sMkW7UTxI=;
 b=VWynq94mJbA/azbVmmRMgr7HdpMsjiX/o28kLfHsVPU0R2qyeWmNUTU7
 X0zx/4Sp904htQmuC1JwFv/hgnkadaJfdC1qcMKfUeIjIkXyU2bitd/hN
 IqNphgrvJLQcMywTQ0ZhjCZFZxdtS+ZESbPk16/V9Rg1ACPloc3HDvkQl
 Tcn0vOeRUFDogdopueJ7KVCKSnK3Ta3MlkFKu0hUTgvzfGOTugFuIUYTF
 OJzCPeNQZMsbkG7ZTvFl9oT1h/Nbp2wqa4X6WNWd6s2S4Bpl4tuaQdjxa
 YVviTD+J23nWXfehHCbPsB8GR2GGomrEu5+XSnpjx0YHIA/baFwzzlH2S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6049740"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6049740"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 16:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="17577144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 16:56:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 16:56:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 16:56:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 16:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwR6/XHc19n/52DHksYo1aDMkAsMIr72OisUFoy2pITdwVfIUTSVt0WKrEywIRRYBWCMdBTVg8NsCjO50FEuw9jT2Cjgb2lLJAl9f8NXdolYZVTYwyBSBh2ypnPRywZ1slsdayjbL0tA6ZfMHZrQq0q4NsiF0GRl8SbByD+X7plYRPNLvZJZp8Hxqq7Gp3EmZ3CkiCoEgspP6/q5QwQ/6I2lIpbUBo6X8zsU2Jrt7/AQUJ8oE0LruPfUcXU7lhSC5ytRgrKu3cy/aWfjksE94wL0LoGVXKDyMiuE+8A5Yio9+QuLcvh4vntDHvB6ydhU0q29M8oKFOufNlM4MRDrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkQeqpfjaZ2rykTLhCYcP3OsaAP/pzWts2Fp3gISuoM=;
 b=CAnkLkzxO+RV4Qwd317CNkNYqX7QZqT300wwEkIhgwB2FSn1wwg4zIuMyzCsqA2wsfRwgzUW7g+5bZAXCjf3gWj9bUcKrL5/rvpz8ATW52uErlu+7UTxtT0DK0rUdYXsHYfy8UofzVrtpw3TpjmIHPXswm8gASWRvq8/BA8u4CFkpseylfnIj/jzi39k2QO2bsH4w6iEXCASjpol5rJoLktSlINJ4jXKJha4TNFNNNMlWOJSezSFbKELtIwduGm1DjGgACR15Ac8DfDYIcoowF9XlPUb25DmHwja/tz+Qx3GvMwThViMmWds65n9GVorn+YemneOf5pF3oM4PB2o9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Sat, 13 Jan
 2024 00:56:36 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7181.015; Sat, 13 Jan 2024
 00:56:36 +0000
Date: Fri, 12 Jan 2024 16:56:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 7/8] drm/xe/vf: Don't program PAT if VF
Message-ID: <20240113005634.GD45138@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a11fc05-e8b6-466a-a2ee-08dc13d27e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKgIX1WWWbSqPNZ+VTibwPSNkIeB0vVvAjPSJ8uepq53M30TU3GtzTqc3fYSyJoiRssX2H9cqFVBlaDQ4vnItTkKixj4XR4VG3/09YyKOSTE/pbkqmxA/9e4GBqmmouIGQDZ57xyd2IlWh9z62wlg/EduTJWUNbI87jvQWzHjQgqLsuKC6+AtcD04XhtU0GFPxqAAlt/n13na0kYUrJ+9FM3g7vrHThHBVmylbOM5JpxsoWuXz7f0vLMXRHtcZeiF1v7tBqzgLpFymrkaHEnebzmlrEMYW5qdGu0ZKHjw0vqpO24XSiEqKqTld29Dw6eIaFHsM2fLnbrPL+KVOd+Qc0P3tR08qoyYWF1paE02zbnf5XZcLA+Nqgwx+SAya1n2yLrBVIpGi7nR/i2JAUf1sHDAeQq9CxYGpwM4DpWPhkzw0QYppccY8kXHBuISUoCT/r5y+uARr20k+w6UPXxOFap1l+FfkZ6DUSAzth3qvXKbkGUQi3v/K2AosAwXpHpuSEFlsMB9wZSGzG/UZOcE7cDyMPOk2HJxkC/duciXqbePtfVdjffymfteWbD12zQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(8936002)(1076003)(6512007)(316002)(6506007)(8676002)(66556008)(6486002)(83380400001)(66476007)(66946007)(41300700001)(86362001)(6636002)(478600001)(5660300002)(38100700002)(2906002)(82960400001)(33656002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yh71jjRMolGgh/VCFASp8WPcH0has2/um6j5f2uZje46YgJAXKhw7rMF0P1U?=
 =?us-ascii?Q?l5Fc6mnWy7dw6hOlvBK9dKGjbZyDjh3Dl6cAyIr3XeLOAaazevAOiAVJi16a?=
 =?us-ascii?Q?bT/GCuOe6vTUbyFk+OqxfR4KR5hQyG8jHcUrVOgcPLz/tvHlmqUTgsp1guvP?=
 =?us-ascii?Q?eZjV+l2XzklmKRSTyj7WfDYlvKyTOUfvd+0jbazWJnIaJDO0ypzU2LR7qiGm?=
 =?us-ascii?Q?5/InxpvoJoJAm/jsDBK5a7F30GopzsZtsEa7XHjdSYYyOk3quK3Vc3AsdQ1s?=
 =?us-ascii?Q?bYR0yP2ZoBJI5+B5Zvs/Rr0PtTgAxMs/OmvoF3c+s2lfdu3U6UVnEKnT49n7?=
 =?us-ascii?Q?iRzc1+QKsY4ZQn2pAzcMicMbMWyM6iNoH/CfLdaxObPQ56AG9fEx8/RsBHE8?=
 =?us-ascii?Q?Co/TzneVcet0jZHyNqGl5c3DtH+2b/r+UcndMJNxBIakLvo69+Vl18z9jFuW?=
 =?us-ascii?Q?RBTFm0Rzcaer/iiPEmAALTNU8nEpE3kGZh5gPzr4tHzQ06BMtIKgqQEluFAb?=
 =?us-ascii?Q?NDpwo/B1ZjuAfxkH3hgjt7bfF0140dPhJGnOGQsZAnOyqelGyHD+OQS7kGZb?=
 =?us-ascii?Q?vbG72iMfC3q4pvP94q3sZAWDBsWqK69pybiFirqglTH5FFka8+Nne5rNTc4v?=
 =?us-ascii?Q?G671YFR/ga5U7bltNUc+8/lbTDuLojq3xMiGF3wE9bYjCAtXEPG1l1ZSwm2n?=
 =?us-ascii?Q?M5k9VoexPqE7w5wEGSvYJUDOrhAgT452vx4looTcPOa7YdosgZqzaK4MAh2x?=
 =?us-ascii?Q?nX1pJTko1KEScETF1yrASiUz3fp6zbx7Mm2efe+D0k10I0vh1AgTQJPp6Tv9?=
 =?us-ascii?Q?CNwGTumdGJFvRlE8aUFnK2asZQ7mSQ2vegefVK6fgmY37u3IpT8CNwUjBsnk?=
 =?us-ascii?Q?WbAOg1Syrd9Z1LKaXmFdh61BQQ4xjVq31XDt75bd2gabI1Q+85xzLY1/+hi4?=
 =?us-ascii?Q?/TrLMK/TXmEmKIeqIQnka1914+ShGs4ZGKvoZdjrJLtafRiKa6LCtsem75sG?=
 =?us-ascii?Q?+yKDxnheEGY7I3fSaD7qT707YXaRoUyxhj5YmDk7PWHlH3ZniI7OrPGewVHr?=
 =?us-ascii?Q?POW1DqADE/MaL4svI5dGi/JptCDC3g2N5LDW9XjemEKPFjRkSIOtKi55rogC?=
 =?us-ascii?Q?midMbdbLTppb/qNFuJ1wSVfHdtSubF/MxHpws42PWXdh2Srn9WV0b/aNRi2M?=
 =?us-ascii?Q?cdVwQh5dUQ0eINz72jJBNKOPby7Hts0LYjjY/unr45JmYTlIor0gROPXQ5AP?=
 =?us-ascii?Q?JElAbFXEjRVbYI2LVokdKoU9P/k/Vy8ilgXfDKO8GWQCsEeM+nINOCpQmoK4?=
 =?us-ascii?Q?eNwQwxeC4+Lec3Cvscevq0mfSc2mXUUFXTfyqr/uTqpp9tL0GkR+jyhwMKfs?=
 =?us-ascii?Q?Kws4FydLOOZvFeZTjfmGOWEj+UrfyHGow7Zv0Bb7zqg61xWQ5+qGQWaXzplp?=
 =?us-ascii?Q?hhjV4tngLahm9CicDxp9OpGz1Ut6HpAqmTQaGEKIvIC6bsVTfVJ9dJ30dSqO?=
 =?us-ascii?Q?+eBd0kjak5UDASVlVbI+EP1r7YHNIDDqwJFlbIh3nEruYnAr9j5Sgp5TLHHC?=
 =?us-ascii?Q?Jmjb0DrCk0vFoi7zmOBRBGwz+7XWZGlOu2zXtsWK6FhHm8ozIS5e8oA4Ce14?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a11fc05-e8b6-466a-a2ee-08dc13d27e4e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2024 00:56:36.3796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1YdmyYit/F9Lcb89FGUfqb+eC8wQbUAvBzkAnfrLr/HknC+qOM3DX5Ecwor9rKzySCzW67+on8nJG4qhws3++aEG0PtHrhWrh9HUKNBEZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 04:26:48PM +0100, Michal Wajdeczko wrote:
> PAT programming can only be done by the PF driver.
> Besides VF drivers don't have access to control registers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1ff6bc79e7d4..e148934d554b 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  
>  #define _PAT_ATS				0x47fc
>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
> @@ -433,6 +434,10 @@ void xe_pat_init_early(struct xe_device *xe)
>  		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
> +
> +	/* VFs can't program nor dump PAT settings */
> +	if (IS_SRIOV_VF(xe))
> +		xe->pat.ops = NULL;
>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
