Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1702FC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 23:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D1210E905;
	Wed, 17 Jan 2024 23:30:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F6810E905
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 23:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705534228; x=1737070228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V6KRxFu/kiq7oZrgqSJiuLx/GCUXePN1JBqziUuUhsk=;
 b=KzSS4Yr3pMBolTHdnpwytexxc6sILmqM6kKXFDXM68BAXimFIH5KJPxn
 PMSF7nAWL4EPFTtzsaR5IDIvlV+6g3bTFhvsiuzKENCpfvGc6otQmQ42T
 M+iOf0uKSFLu8lHNAKZVjHbEEyYCO7h3J2rcuagzkyjwksa3cuCMJqqdu
 STRRDH/QV3J81oeLrtZnrpSGjvmXzT4/Vy3HcxqrmH6Og3qzxOdu2nhmi
 cgStWZa9cosDofzTRHK9kUx0DDQeArmX9iwNHvaMMnxSBhXU08Ne6h+zF
 qX0grLH9OR0a4b5pDbq/bkMlaxCt+7FHPzGYDsQ36FeNZXiclbhJZz+9a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="205694"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="205694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 15:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="141536"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 15:23:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:23:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 15:23:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 15:23:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 15:23:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la2U84TH10szFzQs09rr8ti5lBvv/M2mmE7+QKstyMQ7RgFKo4YsgbaEk4bNsHsZ9TgoKphUayZvMGu3dqF/OoZIw6ITO3nfkJk1HRTQJ3zjBOTh8RI0m1KqphKxd8xjrOIbfgKb1wShHqAEir6lhSQhYWkewxvlVMsFu9B2i7EmJGcm7zsDPmqMJxNOnNdPGVqf1NU42TRr9YRWH/UQ5e/D1rbADS8wGBqBq7BtBBnBJ5Cu2TYV6oShEd9eUvkA8VJqZGHUOJ0GFWip4BuOcLeSoj9GRI/3rRisWR6V2Wgx9pCHMBKjaiknCRdPYC61StKSkmUyTzTN/SveMV68GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0eMBdrPmCu4U/+ntx0Bhv4SmQNzGgKCyAkGoKGPB/4=;
 b=SuvcNsD8UVWsMdWmrhnPJiQCFz2rDCReQLfhSIi0nXyPCgBvW5Xde5dSurNqwi7JGY20UM0n6dLjMSzw7xNa72n+mhJkjTfj64ACpJ2gQkE6yKSnBUDNKgAi40Kkk+qvt+UxFoUyzP/QBYHSu/uDNlqAnzv+GYW+GtUo/KGLehuYYhJAoLbHjBBvtt8BALur6KyLa5AmBAooypatSHnckTzr99N1fKVY1XxeukdA4Ba3soRiaem33bU+QbQe38PQDz6MEW2F/xKHSbNfA0B5gzEMvj8ypG5g42b2dFH7YL9t/gOchamF0Fr4q7SK02svDym/kv0RpI3uM80KkgLjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Wed, 17 Jan
 2024 23:23:17 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::c59:e321:133a:3515%5]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 23:23:17 +0000
Date: Wed, 17 Jan 2024 15:23:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Define XE_REG_OPTION_VF
Message-ID: <20240117232314.GK45138@mdroper-desk1.amr.corp.intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240116145617.1177-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: c42f27f4-68d4-41ec-ae15-08dc17b34933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qidO2VsFQM3PJvOsSzOMlKgcBkx2Uz2n0K+KPjgzgh+sre8Tn7dea7Qn7Mwp6WJHl0ohF5UI2eWTNdP2aKmyIEgKC1xtgV2Uiprop+188/7qQfc138vtrxsJNLVTJ7mFtUS1sNdnWHusHvGEcquW5qToE0IJvm0+oioG2CrQGi9W5E2gbN/BxrphkN2LQmFXONjovLM/kyXAnYn+KmLC59uvtVJQ6sWF1Q6spHfpBwwelQvXZcP2d8okm+qSLuc9c0mWauB+GBctTuzbL5PcZfD9dr2iBTVkZBinOUsPqa0CMAMC/zdfD4byGV8HgxzhvFuLZTiSKavqD2t+jD3cOU4BUALnU+5ax7J3c2jNkwyf5PMPn1XY8GirAqAvfNFLyYDGVz3ZyFd6sQOS5q/U18yEjDC5SKZvpkBFlYpAW9IJNO5C+HxzPrSCRcrObKgRaOtIO2R2cvXg/i6TYaQ7qt3NV9FccH7qbc8W00YQ7G8Nipje8tdwqvN1MEpXxnLZrVbzTCh0Khfwi123xmCtr8452mz/fl4wF/q1eakzwIokwxegKhma0iPx/L8CLquv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6666004)(1076003)(83380400001)(86362001)(26005)(41300700001)(6512007)(6862004)(8676002)(5660300002)(4326008)(6506007)(2906002)(478600001)(6636002)(66946007)(66556008)(316002)(6486002)(8936002)(66476007)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvRlEPTJcmc7z7zgOoprg4rZBk5yff31jl2weeZ+zTMjbFtKGfu9nncTPlvq?=
 =?us-ascii?Q?fpMHk+OkyyU0UNp1950nC1/ZcvBy33LIwLZbx1agiwta2QFVlZGoXqLDGR0t?=
 =?us-ascii?Q?CtEUPvbmyPRueyHpfSDIK/d0mJdo3RD5bRUtU5KNL2pZjfOZf66rfPSzK+ud?=
 =?us-ascii?Q?YKfpc0bRuIW/9QaIJnSGlh6IPjp4hx9q/2N4NLmx0X/ZzDP3Ys0/HHwbL5Q6?=
 =?us-ascii?Q?k5cxNRYIGW+l7eaa7sUIPTQ9uuAPDfDXjtbjtxvcbLL8WNeRUIi8yn25+NC1?=
 =?us-ascii?Q?QXUm5/h8RGAMDLLQB5NP/iGG8Bq4EKTospZtgJ/VXOq0PV4LpugLZpx57SIz?=
 =?us-ascii?Q?Fuz8VRiICZ/DezFgXvz1xjQUUmcKpoW4caMVuCGdylnUf0/jk8Bw2OgAAOcu?=
 =?us-ascii?Q?4eSqRCebK0y4b7L29U1kv44hD7mLOdvkgUKp6mkSzPZBlPpbTEkhPdxLE8ek?=
 =?us-ascii?Q?+A5PWPM/PbxnJ9pobv0m8Lyi1A2PSodiSBBko+mQhSi9FgaGlLyyNTjtjjIi?=
 =?us-ascii?Q?2U7IjT+/ppTl0lnzULuByEtxvm6YwbwZlbvKTbXK01MLdMcE/NThJpk8cbKo?=
 =?us-ascii?Q?hZqfJJh8xVPKZkT7Jpl5lZGA1KpHHU05vQv0RhW7Ea6ruXDPFUXi2wTYtoIt?=
 =?us-ascii?Q?3qrBt9cpFGtwyG8j3iVVmSDcQ3ov6CgjGQIlf2Tx9IeN8v9abSWGpHtB9O/p?=
 =?us-ascii?Q?tHzuWP5V6/N/AOnG3RFhFV3CrellMwiOm4OeUejQVRAF5m/vjS7BS2Xtu/BH?=
 =?us-ascii?Q?q53IVDZonzQbmKxve2PSDjQCrq8Z8nzrY9mYE6GT3epXlgvvUS2EuQ4x9mGM?=
 =?us-ascii?Q?HrD5YHovw9MgbqEqSvzf/z6kjFvrdJq8U73TgcPHvDOZXil2/1xAQpaRpFZW?=
 =?us-ascii?Q?pAWDbUCVZTbmjh7Yt/e5L7zBWuB70kl3+ruQkhRqPL5PjhfrAMrp9FzIursm?=
 =?us-ascii?Q?gXMrQObt+2FqZ13bemyi6ihQGVd8/Cp1ArX5rdrkVu50+DIqeVdPQi1JeQR3?=
 =?us-ascii?Q?bXlRadGv/uzsJzqyiKKPZXw42dBzVmJ2MML5rFExfjoM4LfbBQw8Dl22w+eK?=
 =?us-ascii?Q?+y2dRA0t6HK9rZ3YC5Ro0tUOfCANAnNwbj17Dg12KSN5RwzfiC+/0cSNWVh+?=
 =?us-ascii?Q?Ndkp4lbxff5xoXdK8SsI4H2q99o5QFplonRHQTGvX1xeQ1bBGAD6Sr9gCIyA?=
 =?us-ascii?Q?kfFcAarcyagmGrA4bDJV8KOx0d7ETpBvGdQvZiLotRp81eXP68tEHyhTrAhT?=
 =?us-ascii?Q?VuFurcuqHSYxXriwuYvtTzQrB8NjWsuMi8STGA8ljRrtpRANLaqqLQSKIQc1?=
 =?us-ascii?Q?mR43ClCkjgS7ruoCioDdM8l25gkX2KY37xDScWPSEy40knh5uoxsyrlJCemV?=
 =?us-ascii?Q?umnLNPBbRp1dKUJLzoYEOXUIBqwd0DaL4Aq5u+GcGnqHnB1/EHt/z1xg+ejU?=
 =?us-ascii?Q?pzLpIpYLjCjnPnz7TlLn3ATwP7fpVzBCgUR5JdqWKhA7xD3FxOa9P0W1bTSe?=
 =?us-ascii?Q?0asfG7t3MrVRnvjk4R7VTpIcw6WcrCw+FV9ncnyytLFxjBsd+TCGsWuVkp3Y?=
 =?us-ascii?Q?vd6im1Gz/cefi3f94rwhaorVX0NQPokySpT9hK9WaQUJ7Y8Xh5AuqVk1/j43?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c42f27f4-68d4-41ec-ae15-08dc17b34933
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 23:23:17.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbTWYJnTL/pqNEvP5Hf2skcNPnrJNWD6m1HHd9ojt5YYwrGtMB9I3emSXOo02mZjmVM6Hpu9jd8iqYEr1ABGBgv0T1VPI1WzWOLnltsUNwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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

On Tue, Jan 16, 2024 at 03:56:13PM +0100, Michal Wajdeczko wrote:
> We will tag registers that SR-IOV Virtual Functions can access.
> This will help us catch any invalid usage and/or provide custom
> replacement if available.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index 114b07db962f..c89ef2b79a3f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -37,6 +37,10 @@ struct xe_reg {
>  			 * value can inspect it.
>  			 */
>  			u32 mcr:1;
> +			/**
> +			 * @vf: register is accessible from the Virtual Function.
> +			 */
> +			u32 vf:1;
>  			/**
>  			 * @ext: access MMIO extension space for current register.
>  			 */
> @@ -78,6 +82,13 @@ struct xe_reg_mcr {
>   */
>  #define XE_REG_OPTION_MASKED		.masked = 1
>  
> +/**
> + * XE_REG_OPTION_VF - Register is "VF" accessible.
> + *
> + * To be used with XE_REG() and XE_REG_INITIALIZER().
> + */
> +#define XE_REG_OPTION_VF		.vf = 1
> +
>  /**
>   * XE_REG_INITIALIZER - Initializer for xe_reg_t.
>   * @r_: Register offset
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
