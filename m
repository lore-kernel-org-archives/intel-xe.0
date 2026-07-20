Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F62C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 10:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1C10E876;
	Mon, 20 Jul 2026 10:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuCm2AIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2B710E87E
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784544027; x=1816080027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QFjNLzoc8xzVJ0g7xxUHOJwQ8WDDGbLgpmTdwWtd9b4=;
 b=CuCm2AIRW9T8gPpbdJOfENmFHAe0ljrB4E2tlBwnAWMgOgfNh5PVh92J
 Swg8xLf/6cpYcg3PvRbkTlQ4+QYqVUXaGpZYQA/WBzc+Iebns+oAkLwLP
 iHG4QS+Ucjphl3EGAcIx32x0HbI1rrw/PYfCangA+nX22Ya6kMv80MWxL
 +3ttPj4OYuNSB3/ECeYSuR4RKnWFtDAZt2w/N3WaeFk7Kivwx/0gJp/Bl
 rs14BquHduhNNm3fOEqaT2h8rlEZBj7/Xxf6JWsLWkBinsum62D9xdN2I
 Ak7VHswqjZIx9HQYd5qr0xZiZA0/6ktCRGrBjI7R3UHXlZAwDbUF6fcYS w==;
X-CSE-ConnectionGUID: 6IZ55E87QpuYQhGnr/61/w==
X-CSE-MsgGUID: XL/GD1GgQy27RH6aLMlgfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85322583"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85322583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:40:27 -0700
X-CSE-ConnectionGUID: V8uUV4OqTrGs7MBjLL+MBg==
X-CSE-MsgGUID: +R8F9+IfQz6DEzbAd4NsLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="256844436"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:40:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:40:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 03:40:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:40:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cId4L9sO0KmGwHIZX+hzfyUE8hTmI62r4SmHDrloU4BvM/GFhNmEwVi1Zq8MD0wQh3G+C85HgtMuj9LtO738lp1T39DkSUkW4x/SuL6RpNEXcYxQN+OEZ6I1y9/6gZuMUPxkNRE+bDeTDaTF8eSosyZDfDkqgm43O8WtfSfny1tnM3DVIscJ5dPgRjJkzuOOs6nKVunciho6UuclS4wlflfuEnzMy9y86JW/Qg3cBP9Z0/VQXPHk0D6WdhwRBCFcKTBZDF7XaVBpBLZ2BHq4Fh51S7f1u7owB8/RUvencG5k22eH0Xt7Ja8RUrrI8eTCIE60flRH54elAPy2LeCq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iidj+ZWPk5RUiHFHFKz9lnvT6cZY15U+Qxfomv1qX68=;
 b=EWu5IDnBE1AwdSZoWkpuGHLgf6NFgUZAZmv4V23aH6TTPWT/1zcsgPomt3t8QpFUvVAgmEh9dG08ge1UrV6wR/d3JT2EMcqqhEaRX+xARSUg+cvOT+HqcAuQB9SN+QFXXBPeN7E/4rviX6TPwReOHvLiDB6jWukGtzRBvH94rGixVB2rria2J4o+11CMYSI/PkbOImhqtN03E7b6fxDn/zWt8aakRxFS9AktL8xTKzOYAbDoRgPXULW1IIQ0ORR1p85adcPRCDImCAS+dmLP5tFFWHJ6e8EHMQRd7VgbacJkkEBWnugidfpHUvOSdCVb+Mk+8/VIN/TzP4QbsqYEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 20 Jul
 2026 10:40:24 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 10:40:24 +0000
Date: Mon, 20 Jul 2026 06:40:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/xe: Use IBC v3 on PTL
Message-ID: <al37FLeJiXOlfUpu@intel.com>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
 <20260715235824.116991-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260715235824.116991-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c819e77-f2f0-4a08-df34-08dee64b4de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /DXh4GKrflhKtzbh/BadQMdKxfuDnJVEkD5+B+M2efbo2wIa4Ud9Mhyn9xULWbKf+0+05vbJZqBpYbxFYHh4F39VMuUB4LUP0duZW1HHgm/tARUWUHY7z+H6pzcGr86WOICSUfgtGVGPaN1/6kN0VYAD4ND3X5bD/vs3v2T4+gpP+gqvj/UiaGwOooNqauxeeai44uPbCG3cUUMOOECCM9EjBrdM2YmMQpbnTmLz9i3GZzuZ7xVYqCNya9bu/EpDokri+IXNp4S72O51ON+yefQ5CplhQHASdC5+itjIeNvIrMvB3ueCi+VYGw80luWqy9g1NDx6MjuCgkwruX2yOHneM+t/vznfLT8IcosyKDojyxdPovTgvoI1uMwJDEfQgSAcHqVzUIf01tiOGr+Q7anlcIOooSlb/XSsyWeycAl20JSbpiwALNKE/O7Zrr4hbT2se+O6QGHENFYzHVlM1W4h0fMMgLDsNgwaYOcHCasO7g64lK/djNNvQq78vnQLwGUHQ3zuFA7uXTUAaZhu6GCsS094rWUaPWCGleygRDrrsZcawFaN6RlFFU3VpXj/QMNh1RD8pzWq4p1JWDN0gnQ1usAVGu2fVdiUp+hSoGEwIGc/tJxmjgiW4OivLNtnQUVZwnDWcttRGjEEO2E8tVDAGrv69nO9ooyfDt1+l2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NsPJYI1YkkqWSe3aZ4q45kIG6C4Cicqhsg1pha6/pQRqEZb6ZO8UwPU1/itW?=
 =?us-ascii?Q?foVA6rTYuGf35F5AsLcWlcpOnBRm53n0ieKWSTaEM5mkISmzgjRJz2g5nK3Y?=
 =?us-ascii?Q?OdwAzdR0ibtNN2A5TY3R5rJfr0BHnYJ+ZjUEr3TelSKynCJ5rQAhUfIybEcM?=
 =?us-ascii?Q?mjq9n48os9q29cpLWsCbjajagPyEx8JP3XOnr+afyuv5O7gx0TjHpjFAuxba?=
 =?us-ascii?Q?yzbrcGs0ZEOhhy+DeN/j7aOHFjBAjHI8hDFacFiHEh7XW1Z0bZx/FPzGXLVB?=
 =?us-ascii?Q?cFNrh504qTA5eqoSjiXwmQSuews9tgUUUhz4YpiKKzkIyc9yaJoENXSxGjbh?=
 =?us-ascii?Q?J4ShrHMiG4T2ceuV7y/yZ2CSkrhoDhY2l2nIlTjW9firJ2tU13j765f/qBaZ?=
 =?us-ascii?Q?onuqgvg439+cbu0YQYJtaOI7bAf52ywoz5YpnXyRvXZXVJkLjwqStUx0Fm60?=
 =?us-ascii?Q?teGkeXVnWuE4rksV2e7E0gqZpwyR4dcDQLOn2oQrrFo23HOjHLOixdt6T/Hz?=
 =?us-ascii?Q?RJLODOzdPukZygNUQW60uREz4nKkXUNAk4sRISJ0bIm+JZqMDXMgcyxlthLs?=
 =?us-ascii?Q?G6UhYe8fzH/8Pcu/fvHpXgxi6BrBfdMhNiuE/GBT04yJ7bq63FUECh9YaXK6?=
 =?us-ascii?Q?UADVVrof5kRSmOxJWEPPAHTtvig+lGa/AHPWa5Sgf75p7hO7J7g051xB0hY4?=
 =?us-ascii?Q?BnguTM6+TkKvgMLFtKyG2hsBiw77quExXoQsfddaRSf7emZWSo5fQef0nLUa?=
 =?us-ascii?Q?hcbvReFlK9ACOHdUIbF+dZbYrTbI2IyRpTbACDTkb270EpYMNJXwi3EQUyhQ?=
 =?us-ascii?Q?nAYqyZzObTmyVenMLEU5AfvGcHX+dqfKICY5Db7GhDrEm9YELDJXH5lG0Uaa?=
 =?us-ascii?Q?bR8M9B56/fSoKQnb/JMYAWHImPrZrYXI3m6E0ueyxmfe4XdpTZvUF+bcV3UR?=
 =?us-ascii?Q?VPPXo/dlyJzmbSq19o2Acd5eUE/dk//pG301tF67XehiEfy2z4ZA/J5mCQ9S?=
 =?us-ascii?Q?blQ14KNv/QgXQ9MW4QegqrxzB0fOayhqgiWDtbywgxUO13+j2ZDbLFSfe5ST?=
 =?us-ascii?Q?+QBRAKCEw2K3mdUxCqo0/Kgqmgo/qKvXbKTVofVZlQ9Y2etnhV3q4YLta+QA?=
 =?us-ascii?Q?uJdEf4uEOxYczjhjQVMo2Z+qDhvJWalc7X17Ac/CfbXqu3Rhhq4kGRbHc5+H?=
 =?us-ascii?Q?vj3ssJWRkJju1r3Z7j9V/UI69Gl+NKITgEgQ2qjfRbdVqAI2IDyv78BuA1eg?=
 =?us-ascii?Q?E06BSubrH8dJ0LieZqKPx+DKrFNGWVVDFUv3pAqRjoQswlA7w0ijRFEGjRHz?=
 =?us-ascii?Q?zhr5h306qYti9N0OSUhJBu2WQ8Wrt/qPWYz0nEzPA+Bz1wcBD1Zvjp5/qTIr?=
 =?us-ascii?Q?uqR4Iy2O3KLz3dgp0cyw6VjWUUtl5G1U7k6Qlp20w+RIo5GFgwbjPWaXKCO9?=
 =?us-ascii?Q?UTADXzpc+BjGY7rfZxi71qQ3Bu+CXqmnoFl0QPxoMhbYXpmY4A5fmi+HOIm9?=
 =?us-ascii?Q?cXOQS0kkdzCZrY15LnKbK9XkYcZ8Gpv27UId9v3gp/ryYf0jcBIiahSCiaLT?=
 =?us-ascii?Q?HAYSeeKDZTz62QI8zNZhaLZxLZwVbSk4JAQ9XxJcGOCu+z0q6/HtN1vQdofW?=
 =?us-ascii?Q?T3bEvpuQgoVaYpvcSPqoUgeM/MXmf2afBkj1cbrMztjKsm28KKyKivjPJfKX?=
 =?us-ascii?Q?xJOwY0QlqbJuQc30P+cLBeRMyWOlMCdNce4eYFmlT1YlGkUGZgTmOEtnjVk5?=
 =?us-ascii?Q?tR04Stt2rQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: b2KJRyEUtGy/khAty51ouRwEKZCbDOh7IjTtvXNlukrnQXHPnLjH76iGzy3R46q5RgN1L8YVi5RYBo9Ooc29JGwOytGMntNk6J99aVshk/rJ8NRkptrcV0baA2a50ZUivYmuMhDzhX78eXNHrj9MBkJrwgR7YPEeak5R99uD3fzwWxkNaZhtmZjTFp0lwPywFx5KMn1Anxc2B8L2KEXqST3/MMp2aVMmB2eDUmrf+8CUy/Hb2yJsDmWxk/QbNxAEnm/r/J/EVvi7xYewmYoUFy6ig+AMlmThWy2Y/VvU7sShFpkI1qt88PfGLRG729I9Uw37HzRHiag9bTfvACL/Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c819e77-f2f0-4a08-df34-08dee64b4de5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 10:40:24.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjX37EvG4w/qGE51TOwYIR1xJLeWSjXztG6nSVvNoQ3osSc+9j+ZZeHYYbd9/rDerLoonrtarpgHMyrsUnrvAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

On Wed, Jul 15, 2026 at 04:58:23PM -0700, Vinay Belgaumkar wrote:
> Intelligent Bias Control (IBC) v3 algorithm in GuC has PTL specific
> optimizations. This version selection param is only available GuC 70.48.0
> onwards.
> 
> v4: Fix sashiko.dev review issue
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c                | 9 +++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index ce5c59517528..57baa68bcba4 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -119,6 +119,7 @@ enum slpc_param_id {
>  	SLPC_PARAM_STRATEGIES = 26,
>  	SLPC_PARAM_POWER_PROFILE = 27,
>  	SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY = 28,
> +	SLPC_PARAM_SET_IBC_VERSION = 29,
>  	SLPC_MAX_PARAM = 32,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 59f2fa79ad42..550da596fdd9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1236,6 +1236,15 @@ static int pc_modify_defaults(struct xe_guc_pc *pc)
>  		ret = pc_action_set_dcc(pc, false);
>  		if (unlikely(ret))
>  			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
> +
> +		if (!ret && xe_gt_is_main_type(gt) &&

I don't like the cascade of ret handling.
We should perhaps do

if (unlikely(ret)) {
 print msg;
return ret; or a goto out;
}

> +		    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
> +			ret = pc_action_set_param(pc,
> +						  SLPC_PARAM_SET_IBC_VERSION,
> +						  3);
> +			if (unlikely(ret))
> +				xe_gt_err(gt, "Failed to modify IBC version: %pe\n", ERR_PTR(ret));
> +		}
>  	}
>  

out:

>  	return ret;
> -- 
> 2.38.1
> 
