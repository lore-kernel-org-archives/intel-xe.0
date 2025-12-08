Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C4FD3B7ED
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 12:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058B810E45B;
	Mon,  8 Dec 2025 12:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0aN2aoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0210E454
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765198103; x=1796734103;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Sg86nbslpMoXQwLXNyrriYofcJplkkfyUsHzBgC/fQ=;
 b=a0aN2aoHgiEJxIypOQOYdkIOuXyal9ujCHQBDEb3HwnU4+pu0nfgI5gM
 44YYVpOl0ppjZS8Sr3EzLn9P3Lg6GeC2RHZKZWYXtxu345H189jl5M7+0
 OsKBz3A6dL/X1EAnbbXerTGs7iA5/6wl/nZMgNjlhB/Ma5Yl5/1z6+Hgc
 dJWh5Qx1+WS45VVhuDy3qOgV/J6i+9RaALIrDM4W+RnMxWQuxDliSM5Fr
 maChyN/gKB2X9ITV81sCwyIfVd73h2TYaXVvF2VlzntVpOVc6oioubR/L
 F9e0ypAwsNUUUUYHdWC5z7+974LgOLeNsoMNoTFtI30Gb3XYDohWylyeb A==;
X-CSE-ConnectionGUID: CyM3nypSRsC/EbWcFAk8Sw==
X-CSE-MsgGUID: IjHeW/MHTgWSV6F3xwnPbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84543855"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="84543855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:48:23 -0800
X-CSE-ConnectionGUID: XoLMRUKXQLuLyHnIXbefSA==
X-CSE-MsgGUID: rRzZXorVTvm+lI0ekXGZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="226943752"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:48:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:48:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 04:48:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:48:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzXE1MSfl4+fK27hMKhQEjh8PEjo16BoygRiiz4z3Xp0dOomzlgKwa/eg/jJuup0/EZpFrLPrFs/3t+8xzenAQu22smt5aqWMdL/q7qGbo3DQIQI9UmKtRE5ezB5D20IQ37CZHc0fVF5Oei5vJvy4W8cW9KdA1P+WE6mbVFdg1uFjUwS6UffapnMluheKIPonXydBNNPZoX47KLwDc8jSLwLyMtQkKSDRAw5E7cz0imjXasTjHnpJUo7iE8IDcGFXrqKqZltyWRrIc5f3L8ejtET5E+D7impDblxECjYs86s8FK3yQt9US/kg6TlAj8cmg68kZ4N70Q14fNuCTiZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dGKAiEa3o3pxizKc9oz4m/RAQeSwccMK/n/MBfi1sw=;
 b=WxpAjUIwbZx+gt5/EoaydOQr3Z4iWYThJPk6kX2BvBpe2g3iAsTzkWGCMOHOdSvfyZaaFjucgcx/uxS2eceVGmQPgbxmOQzbdLPRvpqrNZSZo2DeMU+7lzQJWtx+ui1Ki8jbtvF0bOGU9mxkPrNBe4BE7rWjP7rIW64HWuRopnukfARzDMOlm44dugBNjzMV3qOMQwFKFW9YCeTQHoWl9o5+qzpo3mDpQzb2pLkaTtxR7Im1r4R5MOlUh3U2Hc+jeGTy0/61bQTHr9IAlIKKCbTGuNV7eRPIE5dWM6NYhnRU9ZU7EUctA+y+J8rs1MNsKasfqznp5ueSzkgn6kJI6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 12:48:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 12:48:18 +0000
Date: Mon, 8 Dec 2025 07:48:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/oa/uapi: Expose MERT OA unit
Message-ID: <aTbJDZhEMqU8Rg62@intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
 <20251205212613.826224-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205212613.826224-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 3620ad8d-c35e-4004-bb5e-08de36580ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2enmw4kFMl2zat3pHF37XntMoYEDgwkLNN6ZuTuB+MsRCSc4IGQq/98ZQEvK?=
 =?us-ascii?Q?Bf+ks6dn9v7cih5FD6x8HbcpVQwxAMAiRHU6hENWBRe4LjlOHY6toZ7ZqNzk?=
 =?us-ascii?Q?orYtsOmctjEAc+oNuTc9+Gs2G0Mb/A3HGQBgnq7FXX57PFjVr+qpmkVlV5iE?=
 =?us-ascii?Q?jcBZQhqOSaiayhsac1PtCy4/Hjn3vakImYp3aoLDw0eWIj8p6zq5mabtyV5g?=
 =?us-ascii?Q?ApTTmUwW0lmogNQjdE9cV1JS+XLFGClaMqc3pJ5eDiA8JUsmGfCaOseQ6oef?=
 =?us-ascii?Q?75XpyHgPrpSsbNpGQF44yFAjWe0z7OJq9LQE/cbEp8EpFuN9txn4gn/qreWO?=
 =?us-ascii?Q?moUCOCmZ7Eb3Khkf6vwX0gyVjP1W+9LCrApPIOVbMcE7TTKj48HJEVz3Hf+D?=
 =?us-ascii?Q?6vZDKF8WPTQ2qz96/Uh39F+vBcgph0dHknUiet6oeGCe5C6oUSXDQzgEd6aE?=
 =?us-ascii?Q?Ly4VTo1IyMduhhmgUnLGkjQJt3Cik4ubWJLvYoXr7VhVNkZHlQO0M2EXinLN?=
 =?us-ascii?Q?41js2pfFAbs1gOlu2FyNa1VV6LAK86GW1ZcnVK/rHXwyJHZlRwMP/Y+W/sDX?=
 =?us-ascii?Q?Mng17CA2bv9TvQsKb14RrPPVWAWVAQ4jqfpP7WMIhMLAwqSsYTgQAC99YIIe?=
 =?us-ascii?Q?kGhRIs/XhE67w8LK4yBw+3d7X6l30Qpc60cC5XKEjzd0JbRzClDdkUZkNIiy?=
 =?us-ascii?Q?qPZUPcTjLil6dRVZylS7S4dURrMMCGMJQ6qVhp1sGHMmq3cHfIPoBUDzHFp2?=
 =?us-ascii?Q?zk2vZXCciC4l0EvyNnaRgDZEhXeF6Yr1BKApa3baagAVXD8dZFgARwxpKhUS?=
 =?us-ascii?Q?njvvem976qkMe8lW4pNxA4rnRuMFHl1ktVnJLlQNS+y7+8VbZDycf1Q8F40f?=
 =?us-ascii?Q?dPwxz3yrGoyo9M9g+QIA210BvAxNbfRYoWo1nwj6NnFVlqlPO9+q3pSijYCX?=
 =?us-ascii?Q?gOAI3bBirCzX1G58uw1CpW1XXmOPLo3nmguZSxJqSTcxYjES2Tma4KUBR8hh?=
 =?us-ascii?Q?z7MZl02fcj1qUENExeFiTCKng9VN6TBtBpm+pXT1LO4MNJrhFamECPORgzQV?=
 =?us-ascii?Q?f446yWBCGx4iyHVHIXCit9fiCStmwCwmfuvFKqeffYdZW1h6uA1rt47884s6?=
 =?us-ascii?Q?QLBUQo/M8w8ipdwaSIFXpGclxzomg4WwPIopCK+wrOIlk1b0wgQmh5NyTdVb?=
 =?us-ascii?Q?F+AMF9Ml/psEwW232qtNmblXwQsMYpC9J9EKu04+OCU79elC3ire/lc9m/yr?=
 =?us-ascii?Q?5O1eMXWFF7HViD7av5USYYUR3hk/mb8o+hzG10LvogDRndLOyt/7ZUGqG9Gt?=
 =?us-ascii?Q?1sdOEQK9eYXPyqC2a+zXCXjR6PWpQGQHWiPoFqvxrNszCVElDXK/KVZFNyGH?=
 =?us-ascii?Q?0j7N069PLGjjAAMwHXifINxlCIrPmkiwNUHP28guNqoc6FeJULel4Iu1t8rb?=
 =?us-ascii?Q?SeB+pCWkspFZwtD4JhvYii1P2gSvGtHk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3H8DtMMs5CttB3b78qzpQr+AgywKRGWPuKin3h95XJ4cpUs2fITEmo8Zvzd0?=
 =?us-ascii?Q?DCuKhQIKCKppy/lW/l6oyeyyjExcFVJ/DlIch3pGjxkxQ6l0KqS/g/9iQeiI?=
 =?us-ascii?Q?HpsqPP/AWrGa6T0a+g1rLUkLwFo3wFgjvcbHLuC4yq7bOBDUZuf35RHvSyn3?=
 =?us-ascii?Q?OMQc52P6baaqTE0unYu37kbZ5/YiCfHmG+EkAq7199bXtQYAXnp8tsI3kqLU?=
 =?us-ascii?Q?oleCre0lWXSqd2JEa+2jfe+OPzG+go1XCKagiGJc1h4c56u868Im1Bjke5io?=
 =?us-ascii?Q?9tAHBMyt7NnFGG5xpzLjtiTVxZmIsHt/uVKKbMBmZ9pJBpVxAJY9vgprxpSS?=
 =?us-ascii?Q?zctLcVx5apkZGAP+nNTInwGa7PThN1zONa7Pw4XePVQk3kxpbPWr2w6tKy3M?=
 =?us-ascii?Q?EAU+HQL/f9yH98YApfAECZGIfAY59jaWQnK7DGvbLf1kA3A1GwcZr1wwiYXW?=
 =?us-ascii?Q?LOTyKz55DO9aThBq24MlEwZ70SXQLMonTc8Aci3vab7MS4CBVoAdchP8xbKg?=
 =?us-ascii?Q?aPiH+hq9ww0U+D88u5nMKz3HVmqcZdQ27wXAUgQxkZgxeT69w0vEytTi+/p5?=
 =?us-ascii?Q?XK2u7yqa/bVpTyXLga7KZnnvoILw7XsC2N2cRrCF0xY7AynpQ5yTLFh0ZjK5?=
 =?us-ascii?Q?QPk0R18Tv51nwiZ20D2xi+ga3+YPtDYdxRWhEkj+bUG5+4MVcgHTXuuNXl7c?=
 =?us-ascii?Q?YME0UyBmILQPoY1cVyscDgk2IOruwV+EmMQqv+jQycUjwALgzB3O8C8/m7+f?=
 =?us-ascii?Q?oo63nnO/5Z+srZFCz9V+3sEAz+JTKvhtOd5+PUeXsU9zSZyxUB1IUPCWElFL?=
 =?us-ascii?Q?r+Had5Ze6PxxbjTBB9Cz6yCcmgFTjttspLkrlvrM7rHkMIQQ5Lwa/lkG3QLX?=
 =?us-ascii?Q?ENaVu+GxnBE6fIYXcTJmjYLTx3XdN4ermhsWgXt7l/5b9fuvJgDuABF7ShGO?=
 =?us-ascii?Q?IyPxbPSHcTfLYxUv98BY2xT2CblK+6BORFE6Z2AumNP9bR2xtszOInkAXZY/?=
 =?us-ascii?Q?V9Lwl6XAl2sdLONYYbZ2Aa2RYeu2Dy1THyPoHT3akBtUtPAcFG5FjT5avG64?=
 =?us-ascii?Q?WY/W1OFGL9mnv3tgBWnehBXxH2dTBKrNz1rWErJzoFZ7WIvg7J7MRNkhUxwz?=
 =?us-ascii?Q?VKj7kYV+RxdvnwWqDTr4r4TboO4BbtNNO4TYIosz3nYBoDwmlteQiPF1XpQ5?=
 =?us-ascii?Q?MXU232UAK2bAclVEiFTKqdVW2oYM8dtnFCFpZe65rNUlDNCHtaNoBJEzhO6H?=
 =?us-ascii?Q?sDQsG335IDukshE1Ck6/Fr0uGsuxMA4GTEEHzuDTI7P6tKKo0AwQE/qiTNgz?=
 =?us-ascii?Q?U97IDHq13G+WnXeTQiLpzXYvZilqsrSy+CCDHFIAMceY/b6Skr8kBgBy0MQA?=
 =?us-ascii?Q?5jhwgyvQtweZqQH3olHD9HsI+a4YQ8Ec9gPnqX43vy1N+AQJd2faNKKoHq/w?=
 =?us-ascii?Q?NWjrir0I3SdFEtl10fvaFfLCY6/NTI3rUTSWakxPet7uVj4lMdsokpBZ1jKB?=
 =?us-ascii?Q?NxoYSE8dvmNrUli3+Dt0mzPSJJtnDF95kkXpE5PA3j/7lePc/DF1VXTsVBuR?=
 =?us-ascii?Q?Vjff3FMOuHOGpqLGXmWywX+lAyyzAFaD/NBSNlYN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3620ad8d-c35e-4004-bb5e-08de36580ff6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 12:48:18.8525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uT+4jXlFvbXB9qQEVx9IQeqpTIkbtpUNFx5P+d1rDiWUGdzBucg8kQUGTiNmvStnTSDI4o88omJqyLzROu+W0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
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

On Fri, Dec 05, 2025 at 01:26:11PM -0800, Ashutosh Dixit wrote:
> A MERT OA unit is available in the SoC on some platforms. Add support
> for this OA unit and expose it to userspace. The MERT OA unit does not
> have any HW engines attached, but is otherwise similar to an OAM unit.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_oa_regs.h |  9 +++++++
>  drivers/gpu/drm/xe/xe_oa.c           | 37 +++++++++++++++++++++++++---
>  include/uapi/drm/xe_drm.h            |  3 +++
>  3 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
> index 638ab3b99eb0b..04a729e610aa9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
> @@ -108,4 +108,13 @@
>  #define XE_OAM_SCMI_0_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + XE_OAM_SCMI_0_BASE)
>  #define XE_OAM_SCMI_1_BASE_ADJ			(MEDIA_GT_GSI_OFFSET + XE_OAM_SCMI_1_BASE)
>  
> +#define OAMERT_CONTROL				XE_REG(0x1453a0)
> +#define OAMERT_DEBUG				XE_REG(0x1453a4)
> +#define OAMERT_STATUS				XE_REG(0x1453a8)
> +#define OAMERT_HEAD_POINTER			XE_REG(0x1453ac)
> +#define OAMERT_TAIL_POINTER			XE_REG(0x1453b0)
> +#define OAMERT_BUFFER				XE_REG(0x1453b4)
> +#define OAMERT_CONTEXT_CONTROL			XE_REG(0x1453c8)
> +#define OAMERT_MMIO_TRG				XE_REG(0x1453cc)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index cc48663c2b48f..7846dbc32542e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1937,6 +1937,7 @@ static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
>  			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
>  	case DRM_XE_OA_UNIT_TYPE_OAM:
>  	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
> +	case DRM_XE_OA_UNIT_TYPE_MERT:
>  		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
>  	default:
>  		return false;
> @@ -2224,6 +2225,8 @@ static const struct xe_mmio_range xe2_oa_mux_regs[] = {
>  	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
>  	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
>  	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
> +	{ .start = 0x145194, .end = 0x145194 },	/* SYS_MEM_LAT_MEASURE */
> +	{ .start = 0x145340, .end = 0x14537C },	/* MERTSS_PES_0 - MERTSS_PES_7 */
>  	{},
>  };
>  
> @@ -2515,7 +2518,12 @@ int xe_oa_register(struct xe_device *xe)
>  static u32 num_oa_units_per_gt(struct xe_gt *gt)
>  {
>  	if (xe_gt_is_main_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
> -		return 1;
> +		/*
> +		 * Mert OA unit belongs to the SoC, not a gt, so should be accessed using
> +		 * xe_root_tile_mmio(). However, for all known platforms this is the same as
> +		 * accessing via xe_root_mmio_gt()->mmio.
> +		 */
> +		return xe_device_has_mert(gt_to_xe(gt)) ? 2 : 1;
>  	else if (!IS_DGFX(gt_to_xe(gt)))
>  		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
>  	else
> @@ -2599,6 +2607,22 @@ static struct xe_oa_regs __oag_regs(void)
>  	};
>  }
>  
> +static struct xe_oa_regs __oamert_regs(void)
> +{
> +	return (struct xe_oa_regs) {
> +		.base		= 0,
> +		.oa_head_ptr	= OAMERT_HEAD_POINTER,
> +		.oa_tail_ptr	= OAMERT_TAIL_POINTER,
> +		.oa_buffer	= OAMERT_BUFFER,
> +		.oa_ctx_ctrl	= OAMERT_CONTEXT_CONTROL,
> +		.oa_ctrl	= OAMERT_CONTROL,
> +		.oa_debug	= OAMERT_DEBUG,
> +		.oa_status	= OAMERT_STATUS,
> +		.oa_mmio_trg	= OAMERT_MMIO_TRG,
> +		.oa_ctrl_counter_select_mask = OAM_CONTROL_COUNTER_SEL_MASK,
> +	};
> +}
> +
>  static void __xe_oa_init_oa_units(struct xe_gt *gt)
>  {
>  	const u32 oam_base_addr[] = {
> @@ -2612,8 +2636,15 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
>  		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>  
>  		if (xe_gt_is_main_type(gt)) {
> -			u->regs = __oag_regs();
> -			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
> +			if (!i) {
> +				u->regs = __oag_regs();
> +				u->type = DRM_XE_OA_UNIT_TYPE_OAG;
> +			} else {
> +				xe_gt_assert(gt, xe_device_has_mert(gt_to_xe(gt)));
> +				xe_gt_assert(gt, gt == xe_root_mmio_gt(gt_to_xe(gt)));
> +				u->regs = __oamert_regs();
> +				u->type = DRM_XE_OA_UNIT_TYPE_MERT;
> +			}
>  		} else {
>  			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
>  			u->regs = __oam_regs(oam_base_addr[i]);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 876a076fa6c0c..f520462c28643 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1675,6 +1675,9 @@ enum drm_xe_oa_unit_type {
>  
>  	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
>  	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
> +
> +	/** @DRM_XE_OA_UNIT_TYPE_MERT: MERT OA unit */
> +	DRM_XE_OA_UNIT_TYPE_MERT,

And who&where is the usage here?

>  };
>  
>  /**
> -- 
> 2.48.1
> 
