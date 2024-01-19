Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F99C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405D10E838;
	Fri, 19 Jan 2024 00:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905C210E838
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623924; x=1737159924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zwui9igudika+e2hfz8HA7FP4b81WiP330jg47FCJaY=;
 b=CCJSltpiwLHgqpz1Bk4Lzz9lcwwm2xuXWEvzNrQHp6TuF+znUJPKppZx
 MZRgwKQzhZmcBVYp+ilHv6yPszYJgpOKmXp8xTMlUApsfvIrxZ/EMJS3v
 U5Wb23NbhhgLZQwiQ11NwLjmyQVi+lWNo5u+q4jx/NoaG/Rxa1oLSSVhN
 PpH837vLSG9Nl3Ni0M/EIqpq4heC91Qif45uPHd3dZx33++Txbio9jPhk
 HqBXuJrY5tfWPdWmLaTyqP/BVQGkg/4crBo2Y4k1fn4IrAoanm1wpcy4P
 AIfB4A912PuciasShLNrs3e27e36V2lylqy/Feefw22hPR8pIbRy8Ye8c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7990992"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7990992"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784928564"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="784928564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 16:25:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 16:25:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 16:25:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 16:25:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7+hvYXBY4L2vsTjMCroQi60QeoGWgHEyXsNkvymfGvHAiPi4KnzdZhIFWJ/5emj90HQlOGULkQu8vn7MRGNLmYAfUICYNF+OPYiRnyhWr7mvxs0mTp5qyWVxyZvUIde4vRbuGWcExGkJ+ykyC7IjxXCeh/7JChmYjZa0i4WeMJCPRRL7Hm38yeL4kelyNKPJaOQaw7SIl4O69L48Yfx9beC0wmT8d3UXM654JRREmKRTr+r5RIYUMGGD+MWsQ4nXexsEOvMWcCS1GagMfUi/eScsefW3/dSe/wBSNW6+yYi2ET2fLSkWMyJ0+JqkiK3ffqKGZDPBiFK+CW+/TV+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfQ9nbpWI/7p2mvq8+PwEHsYwtFSm/0ge7jyvUOr1MI=;
 b=DJGVZbT/Hjpl/VWSHl/v8bUNHzEhVvffa61/YT683kal8YcoEOUCuRhH1V8aeaUfrsRstcr9WTb67WCBskzDcRE22TdnmSEyXSG0rj7dFKrSegJaHExOVEIGAOpLwgsSqs4yIPe3V1iMkPQRXeN19vglYt2+seQsALQ2bsTTCiizCZiMflC+THOs/rCYCkm8UvNQ8EXAEPJhB/jsoi+Rp87+GU+4uiOiOC25go4RPQDMHIrlB/zm2/+dSD1NzMFEj1LZjkM1pMMyAohOJFskxzGPn0M1fpNsuQdV1yqAJr/rdv1OzUMnDiWKIqBnA0kkDyhLRCMU7V/kxjLaqFHMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 00:25:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 00:25:15 +0000
Date: Thu, 18 Jan 2024 16:25:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/display: Avoid calling readq()
Message-ID: <20240119002513.GY45138@mdroper-desk1.amr.corp.intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
 <20240119001612.2991381-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240119001612.2991381-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 3468c2d8-2e39-4358-c9ad-08dc18851be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSWH6EngHO9L3qMjLycz4RFiYTpUFAl91ZmIqnoigGmKospiQ1fPxeKGwI8HucNR3tY+PHlKbFCzD9TKYbSY6T8xVrfIybwblMkt1Cox2sqF7vIM0RIAj4USrwEEw8xlgiTcRNS1gq2nFBnh0/C3fI5Pj1WBHADb9aaTZdAoRTxlby+O+h+ybruTq3Jrb0JZMFW5cJ3UtehUy4NFNa+ZzDySNlLmYsntEQ9fBHptlVVfdnXcb1jUHWoVZzhC7lhjfsnEkNGWlyuQBrXNYojTuc81nmrdv43QDChvk8kGoYoVUpwFAbSnnn12VHZQ9mskG49trmgsKYMTa5eb8Ym7slY9VHDAx2x5XOYPExC4+7TquKQq22Hdw/g8paZzNzqOsrzP+k54w1h3/gj1V/Lu8nnUhYsLgmbYQNE+Qo2g9hEiDhu16LtekcDLRX3GB9pNqd8VnIsDNm+suulHqsKA9W3jNngcPntfOY6ksqNYV6wNjAKFBEfKf1uF0FG36OlkNULgb0f6gdH7HsKZSIgLbzuiigiliJeKyLplvjQgzThj7AYqxt/R3ZwLc4zNbJQb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66476007)(82960400001)(66556008)(66946007)(8936002)(478600001)(6486002)(6862004)(38100700002)(4326008)(8676002)(6512007)(83380400001)(6506007)(1076003)(26005)(86362001)(316002)(6636002)(2906002)(5660300002)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p7KcPMuZpNtD2P9PC6DUL9KazS7NlamNk7zE6Fa06oewBWSM8gAH5QumxlW7?=
 =?us-ascii?Q?+GAvHpHHdDppIuQt7RLclZGT+ot4O/t6LQDeTuf1Pxl9p3i+qbrD63KziD6Q?=
 =?us-ascii?Q?+f5c81lefCK2ZKALzaqwX6Z6wPDOSbTUzcSO1vJtQ7PwHHJHb6DOClLNjIwd?=
 =?us-ascii?Q?zh5sM9qRxXq9L0+BCg9Wc2Ny2B88KfsMjWeFEETXUSj+ILMq2hlulmcOzXlC?=
 =?us-ascii?Q?rGYx9vajeJirsZIHb7/wakCxKTI7OXO+GQtg9epYGSl6WB5FH/itZ1kB6wbw?=
 =?us-ascii?Q?aV4s9XlIAOs7GGX8oSzahQ68+mdvQtd/hztxYfNLVo5uv1YDKNIAR+8wNx2N?=
 =?us-ascii?Q?GURdEslUNyb6VallgCyH+7XlBydgQ9A3oljwmHgKiRTJmcb2ghE/DKiYqjnn?=
 =?us-ascii?Q?gGsba3w3SdH2pVJbrOphJORW8h0eWVHfC6WeIRikAAp7Ztf16e8v9UBTa4EO?=
 =?us-ascii?Q?sfXrTqpu/fs8tBRiIvFS5NvKxY6rT9tAjeTTi1xDi8G9aJXFVQBA7dRPa/Wi?=
 =?us-ascii?Q?4f05hRHoyjQ9Hw7098W//48zGO43Ob4jiMt+knmENAwe+3sQ5XrnxwZumtba?=
 =?us-ascii?Q?zWg++bic4uUkeRh0Lm97ZcP2N12BQjAaHESNpoY2r/Mg6BxToABpFjRANIjW?=
 =?us-ascii?Q?Go6SWU7iuwfZKrZTRr7Uy2nkhm/n7Kc1YrfX6pqoNJ9Ixl6nd1nhp2pHE8ED?=
 =?us-ascii?Q?1JXiaamx7/PWYvJwuc4HvwX+sY/EChfmG6+f0uqYBD3ya9Qc8Yuz7XOqJzJ8?=
 =?us-ascii?Q?+eyVUuK7mXUNMiBoEZ0Rvs0vtN1khgHFYZAuuuvXw1SZDN+8C3Jisq39FPMi?=
 =?us-ascii?Q?QY1jUSG5Vm1DuG8OpZARCZx8MmA06E6qO77uFLiYKYZWoB2O6gew9yD2Oq0L?=
 =?us-ascii?Q?0UbZ/kOPXGq+xkDYheWsB28FZ8MfoUHB5UwH6lsu8jdu3d9PCsDMM9RaLfgg?=
 =?us-ascii?Q?EPopGAzE90ajEUdZt2muEgV34G13U+nxklnPbupLD34CvDFm8ZAk1R8UX5MJ?=
 =?us-ascii?Q?Rr+81TUR1uwgC6YT0+QVGjK0PJS9GRkW87zaALlpHistq2TPTy0abr0ehpvM?=
 =?us-ascii?Q?Mf916CXaXe6oZTRFnOuyCbZ2VIlWy9n5NssKCJONtEum06Qka28HnOPCIodG?=
 =?us-ascii?Q?yDKcTotvOAh0qh/2uXuROZg56QQEr7Yn6Q9O6AmM8meehydmBmFhDLTBljv0?=
 =?us-ascii?Q?xPnB/D4aV56nsMLWAe0FRHJY8jb3AOvp6Qv65UlEzSLwGusE80WhZi8xnQGg?=
 =?us-ascii?Q?I3jWdSrJ2B51fXbYufu6B9CGyPeezzLblY8O1lmGUXeNpnL8UUC5WYR3dwT2?=
 =?us-ascii?Q?5bVrz6A7UC73V2afi5LKZvVoOIn26IUO2WqTfbJn0CpBP2KZyUaEPfS/Jky+?=
 =?us-ascii?Q?HhPfZDAVUt7dIk/A3B4Ut/KFUXqJL2ea/BmPify6H3B0Mkv/XqflQD5R9w30?=
 =?us-ascii?Q?4df9b+WyyJwsEfc5hq5W4MGzoyMnZ8ldd51hSvPLKHXopByTO/jDQ3T50EDy?=
 =?us-ascii?Q?fC5Zl+IivNMHRsS/6DzqLtdmbM7WUsxEFkuPm5pjEbuabSY7Z/3vF1knZz0q?=
 =?us-ascii?Q?aub+vkiX2/HqpDAJY9z+bRjCND612m8kPID/x5HkvLbDGAd/R2m1r8IQQC6G?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3468c2d8-2e39-4358-c9ad-08dc18851be7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 00:25:15.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB9e3vrXgly6kYwCWknbOu1CSEWgOE8m7QuW2/V4uI2yNH7uNG5eg2BDH/vnx84ybF0AVIK1dciM6M/VuqLK7kyJF4W+Br0f4m26vWBdOT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

On Thu, Jan 18, 2024 at 04:16:10PM -0800, Lucas De Marchi wrote:
> readq() is not available in 32bits and i915_gem_object_read_from_page()
> is supposed to allow reading arbitrary sizes determined by the `size`
> argument. Currently the only caller only passes a size == 8 so the second
> problem is not that big. Migrate to calling memcpy()/memcpy_fromio() to allow
> possible changes in the display side and to fix the build on 32b architectures.
> 
> v2: Use memcpy/memcpy_fromio directly rather than using iosys-map with
>     the same size == 8 bytes restriction (Matt Roper)
> 
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../drm/xe/compat-i915-headers/gem/i915_gem_object.h  | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> index 5f19550cc845..68d9f6116bdf 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> @@ -35,12 +35,10 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>  					  u32 ofs, u64 *ptr, u32 size)
>  {
>  	struct ttm_bo_kmap_obj map;
> -	void *virtual;
> +	void *src;
>  	bool is_iomem;
>  	int ret;
>  
> -	XE_WARN_ON(size != 8);
> -
>  	ret = xe_bo_lock(bo, true);
>  	if (ret)
>  		return ret;
> @@ -50,11 +48,12 @@ static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
>  		goto out_unlock;
>  
>  	ofs &= ~PAGE_MASK;
> -	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
> +	src = ttm_kmap_obj_virtual(&map, &is_iomem);
> +	src += ofs;
>  	if (is_iomem)
> -		*ptr = readq((void __iomem *)(virtual + ofs));
> +		memcpy_fromio(ptr, (void __iomem *)src, size);
>  	else
> -		*ptr = *(u64 *)(virtual + ofs);
> +		memcpy(ptr, src, size);
>  
>  	ttm_bo_kunmap(&map);
>  out_unlock:
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
