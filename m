Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96442C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78C112B8D;
	Tue,  5 Mar 2024 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVGwidAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CB8112B78
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709650235; x=1741186235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8QULhKqEeqFimi6eO9waheVKpDAi+fBPIrc53MOA5lk=;
 b=EVGwidAXorxPWAPYglReOcmIajevQrVslcsyeoeO9eNOAcFbAHY75T5R
 w4x/iKNuz873KTUnsGYL2vAci9baagmezyPOZ5Qsg6mFMnVMMNd/y3sKm
 WNxqkhOViyhIU+JIATSnvkouqgphysA7HbwdkPH/JL4oVUT6tyEJY/I6J
 60ECS6fdt/YQbItHWIsK5ocFAKgRq6tPrR9GZbWcrPSY+tbNiYuvW4Zk5
 syq0lXA7ifaH6hzoMqzCTF6VBArvLfbjjM7GnUDSht6jTn+SJpczTI+N2
 eh/p5H82bmcTa6HzDTIpfTUR39IgBf6wtbrKiC0TTLZdWLRmT4F/JITby w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4130594"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4130594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:50:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14065929"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 06:50:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:50:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:50:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:50:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:50:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEk9FP7OyiM+nuLSZGA6zFDwBInjpnysCwezfxCwo4AdLKHXt0Lx2npxyrSrXGeFzsWuK5F8W31W6M0Z3Dq2TR8Bb+Zoacxk52+MMNTUSIO8comEoobhGfqdzJYRUv36BUXUk3fG77a5OyMFsAHxk01qRS9NuEpPTsZK8O6nb+vw30tSmjOZ28dEhdG6YMdIQSrP5TrQ5XZzLL3veniEArgBhCqU7+a4AQIR9YvPUMdES5TcPR1/huvvGj90esM86c2vve2fqw3BZP9POyWiyI0J9seeMFRc+mi9Ge8Ui7GFMkSYYhyf0mp3ZGIV+nADqOQbNwwgY4FgMeuvng8M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoWgGU34Pm2wrUn+RijdaxLxDie08xhQLgwjRnVa2Ms=;
 b=O7sCxobeXz3M8Xpr9nePdoOXGuzKmvnnBMYlYx4JdDkpUiQnQJ87TgXsf6ytwI2RH/BCfE0TG/z83LnjWwV1WbKyQB4o+eqfRyWLCfu/BCujCqDPPE4IMsFi6EwJWoyJ7aRyrcfP5yujyB5SePeYDlazdgIgaiD62MayQloGJDpXzdO7LE1dsIO8X7Cxs8M5P/hFn9y24fGXnN2hZ4oy30zWrxfEiOOLYKTaqTE6RUgzk4wIiwyLYm732e0g+Xlpzf6k9nR0Qg6h2jhD9Y9exSI12Ixvc9nutHJ65r9xx3hSTxFnRSL/RTZ83xBm8rCLFOe749toGwkIzKzjTuytkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 14:50:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:50:26 +0000
Date: Tue, 5 Mar 2024 09:50:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mateusz Jablonski
 <mateusz.jablonski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Drop WA 16015675438
Message-ID: <ZecxLsM36K06ZFgm@intel.com>
References: <20240304233103.1687412-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240304233103.1687412-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f3225e-54d5-4332-25fe-08dc3d239802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDd5K+Yf//YhdIp7kzD0qC1gTStq64Jpt2QY0cKig8B2+rJ9nJyZLx7Tu54JUflsdyjAPOwLADsVsaj9OXJRZlWdrwgb3/LtcaKdxSSXQzm6dggulx+cPJfaTmDjvhAJ7acRct5MKSG+fvyayfHJG032qhuTIeCGDuY85J6fz7GNcQivMST9jYjEg6ON70GgkX2Mr3lvicRJjdtvepwl5P93UYtXyqz3wSj4LlUxKPIZp0QIqhntj3vpGUh8VhSACYz2rsiirA1a7NJ7OTyXT/57Whe0D3jnHVJUj+WAlDowGfKRnm2ZFfUigX57cDuKJ8ilYf5VPvSVJqAnC+gSzAiJ2J/OImc4rBNsd0uDG83oYQ9eHer6RyAhhGDISdNzC5x1KFoDKfYk7Dn1dY3fjD133hEjmh1XINbTWOs4uSDl9pqHj3njB1aHpjid13F7d9/IFJAUTnXVZiSttE0BbGhwyBiIf/4cOhBlgTiO2ih4IMC14DgnomxnBWDoTpADmJHaqAtvSe9mBXQxz4tEMrStC2mBUQF3CWlk8G8ZOpvJ/UUzrh1zf3oAWMBDqscrLR8fb4uUQ+FXRKEWTYbi+0YAwUjhGWBhtjKRTW/3LjMrpoHUFe3kFzll7DYgB3LfXWYn0OxLLAzNdHTsREorTTNemy0cJHbKU29RYS04/+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUashzLBgZJtzF91+CFJSfNeIVdwvXcaGRrdXufujmoDhFuYzhlb8K8+R3sW?=
 =?us-ascii?Q?4AdBl71Wy4fwzrnr2g06z8qltfZ/Vemy8nZH7eYl2rJ8zepSE4J6Kmsmuydh?=
 =?us-ascii?Q?Zzb+LzCn4vJQ2iS7MW0HksZroDTSu5AVjBsoPT0b+FDHQr7kPfWMvs4Wqakk?=
 =?us-ascii?Q?bCTwUtmpehLHp60itcqh7D6VVbAiZKtxlhqHrIBRAffdoJQYVaL0PtEKpfSe?=
 =?us-ascii?Q?5jImRJVonknKUiKiBK/DuqePiXPl2HA76AbrcQDTzOhYoKPIwzKV6w5aO/G4?=
 =?us-ascii?Q?F7/cQMm0S+KFrBCVE5SYNQvVkpo9FVLF4E/6Qiv4YnBWZ5BhQTR5XziA5IVc?=
 =?us-ascii?Q?ejxKZ2t9TFabK+MhVoB35gOKe+64fExfbIA0EaUwxl2MplRPvxeLlDbzecgs?=
 =?us-ascii?Q?HE/RDzKWQnZKSh0KsykDCQWSp8sXgbdgfjiFoEZdaZYFj9ul2HMJjxM0UNpJ?=
 =?us-ascii?Q?q5sRWLYjYkLlcvqZJEmm9ivv4QjZG/YnIIPRuhpItuVGCOvrAbIggDM3I1a8?=
 =?us-ascii?Q?5kXwyqrqLxfdPem9AQ+TCSiJB4BaRAovQmQX3RB/13NUba+oCok3nPxyogU3?=
 =?us-ascii?Q?43Q3D3IAI4W9oRXheAc2zgpEzSpxwJnB3Fy2EArEJugeQRUO9eTI48fWHnnr?=
 =?us-ascii?Q?I+6PQB9wTjUfT+yEvvL9iidjSc88A+Z+zwObdDpAg6sdnLDDZO4utFanIKzM?=
 =?us-ascii?Q?BtZwFoqEWaImICtR17jF9rCgp90ZfwnbAO3E1nfeUoM0LhGYW9NPw9JHgvY3?=
 =?us-ascii?Q?PoZJnPqx0357W8FpynyVkxG3OwMiSHrrFFyZ0n/iBfxOAafgqVR1BoO0NzwW?=
 =?us-ascii?Q?42cwECceM9kiMLaS07nZr4LYV4017NkRjs6UmeaxVvfLwbPEPXnDVDgF9uWM?=
 =?us-ascii?Q?q74FtXDMMQCLvPLXRWBH9xae0UA1pS4XumTNW/y595W53cBpUEIMI9CrQNcB?=
 =?us-ascii?Q?o7qEks0RPazHtvWO0HIDLjeHyrB/4rDUiIR6U4nACp2sPKod8dj5iH1uaXk/?=
 =?us-ascii?Q?Ke5AK7ZIQdVx/C5BiM9b9NttNs59/v4JuXhRtMNsUKz8ndy/6O8QzWoKx/xR?=
 =?us-ascii?Q?L7fJXPzTEKwwjGdOoz33vT2Uh3JXWfkgBf5OJQ+KLPsfalVNP6ZlAQWogTzF?=
 =?us-ascii?Q?ac7Z4B1UFmRKGfojGl9MBzl6NxuXERPXMGcvQUTGU9ZMqEmowklOHT7lsMnT?=
 =?us-ascii?Q?CF2pSHhIhqZUj5su/rBWqcNISN/g6QqXhj2Mkv0+/8ckydqPmxVRwKSA2z0f?=
 =?us-ascii?Q?LlCwXZRgbgRXZv2Ld9S1UHDFWJTbPHoNIZF9JS/7U0AsKJtO97PLGpRWqQUD?=
 =?us-ascii?Q?8wY48RRjdjxgfsnvnEKzS68AGcYT8IyDbhd6+nhIydm1Mx4ffniYSGlk5ZDw?=
 =?us-ascii?Q?Xn721QxrKDGYiYsfRHL4yeevx78Cfvs9Tp1I0pedqibY/YG3jsMaSKLpXSOx?=
 =?us-ascii?Q?RYIVxkzN3K6BTjjRITC1TWGOUclFh3Y+Z/T5kJEeHeUfNJO8xieSGy6diX4a?=
 =?us-ascii?Q?4cJ8mFwBBzS2pwCs4lq3XEoFi5FuKD3ReSoZ3iHrmauKPGMKNKGPWLSpGDdV?=
 =?us-ascii?Q?WiOHHeKLdL+iKfwW4yXjuRfrh0qSKyqkpAPGkUE2Ou9oZFpNrZgNbl2oInIS?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f3225e-54d5-4332-25fe-08dc3d239802
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:50:26.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yduZX3/aiSAqiZkm9pBCeaCF4niazVTbevu5bwZAP/G3QGKmTNNUebaBoxrkSm9tywG02fzoPNGMse8RIaQf2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

On Mon, Mar 04, 2024 at 03:31:03PM -0800, Lucas De Marchi wrote:
> With dynamic load-balancing disabled on the compute side, there's no
> reason left to enable WA 16015675438. Drop it from both PVC and DG2.
> 
> Note that this can be done because now the driver always set a fixed
> partition of EUs during initialization via the ccs_mode configuration.
> 
> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on the patch itself
for the reasoning I'm relying on the acks we got...

> ---
>  drivers/gpu/drm/xe/xe_guc.c        |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c         | 11 -----------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ---
>  3 files changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0d2a2dd13f11..caa86ccbe9e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -164,7 +164,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
> +	if (XE_WA(gt, 18020744125) &&
>  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a0264eedd443..b972e281d891 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -328,12 +328,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>  	},
> -	{ XE_RTP_NAME("16015675438"),
> -	  XE_RTP_RULES(PLATFORM(DG2),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
> -			     PERF_FIX_BALANCING_CFE_DISABLE))
> -	},
>  	{ XE_RTP_NAME("18028616096"),
>  	  XE_RTP_RULES(PLATFORM(DG2),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> @@ -383,11 +377,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
>  	},
> -	{ XE_RTP_NAME("16015675438"),
> -	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
> -			     PERF_FIX_BALANCING_CFE_DISABLE))
> -	},
>  	{ XE_RTP_NAME("14014999345"),
>  	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
>  		       GRAPHICS_STEP(B0, C0)),
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index b138cbd51bdb..48cdba1cbf95 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -4,9 +4,6 @@
>  22011391025	PLATFORM(DG2)
>  22012727170	SUBPLATFORM(DG2, G11)
>  22012727685	SUBPLATFORM(DG2, G11)
> -16015675438	PLATFORM(PVC)
> -		SUBPLATFORM(DG2, G10)
> -		SUBPLATFORM(DG2, G12)
>  18020744125	PLATFORM(PVC)
>  1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
>  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
> -- 
> 2.43.0
> 
