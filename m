Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035E4CF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 19:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BE2882D0;
	Fri, 20 Sep 2024 19:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+ykSn0I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D6010E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 19:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726859914; x=1758395914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jBfMAnQuh8WUjRDoJqCKRFS286BG+g2IcJJHXMzDvXQ=;
 b=H+ykSn0Ia9uJ5g2ywtMzu3m7gDgYS1FnrKvDGs1gJYCCUKCo+9B5QLkX
 aH7RtedcivLMco5n+/rNfGwuPP6wKhdWEVRSEbOhxWigIMDXvOXJlwbzC
 6l2Us2tKW7wDBzlezKqRUM8+3ZOyjWUZ53HyfjiXZhhAhGsg2Z2BK31py
 RMDgAPxSLU1PiKMctpIpwfswLId85daECp6tbyfVUUSUj0gGAfOF6LwYp
 G2MvbtesbYrCwYK2/AJtKOIlrgJf+NuDDO9+7JVHS2Rnng4CRcxTeEKh0
 F395Hi3tuQFtKKzaVAnGfPAgW49Zlhj18v/2B/2AxO/dLbCiiWubFP7YM g==;
X-CSE-ConnectionGUID: 9esWEzK2Q+SSypnKYYn32A==
X-CSE-MsgGUID: kzGrSQQNQv2ZRpy2Z8dE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25750544"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="25750544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 12:18:34 -0700
X-CSE-ConnectionGUID: icPJSBCAQ9e+IvPtom+cmA==
X-CSE-MsgGUID: F9L31kABRJiOIqSfOYzXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="71238534"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 12:18:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:18:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 12:18:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 12:18:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 12:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5mJV/P94aNEL+NG+bS8Vy63CsfB0zl4a1hkkQrbD6f9UrZFT8NnM+iJn1Y3DMoFIDLoRxwg2zOWAS2jIR8V7buTpmjx3eiXtIm5s7uCGnqYkLNEa+yPRbdRkKhIou0OVJDoUw8EyndeF4xQcg3t0oRY0KZ6u3+RmJh1jWielOQfGpktCMj8v1/fSboCOjVz65RyEput6hIhwLmmlnu2qZIbrOS8ibVTakY1TnX71ab9iWKoLwd8YIiYNyqdHfZj6R+sNJE8agXR7amRwAvuva7cds4nh0WDah3WC/SSmhWdKdawyIi1A/aBwiPVgfgypX6pkjwnlWK5454qltKNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiW7X1UZxK450fs3SagHaCl4lji6Bg/h0/ie5yraY8I=;
 b=QoEZxRcReTPfzgKzmO3hPDBrYldnX2DmYe8iXO6XvUuaQYFydY93hRSmIFRv7Z0ywbA54PnHxXN4WmxCzFBDhBeSwAMg9j88dAdTxBZCuuwtoB/sBVJithKd3bTzfee+r5K/dvVs6j432krbapLOiG8YGZEpTHeN26ozmiENY5fb+6x+DwTdt4MY7418E5UEvljTe/KwCUrVaWQ5iDz/Q5qpjmTyBRXLC3wc1MJ2tuVr2mYHKMPBOhGYCtDeCTnn4/3muB0JxqUNBSYJ0FG8jgxLxZpn9HW9gM6sPSPScp3tnRIuNJYsUTKl69vml+UoZ0F5qEkFNJmOmlOtPIv3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Fri, 20 Sep
 2024 19:18:30 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 19:18:30 +0000
Date: Fri, 20 Sep 2024 12:18:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
Message-ID: <20240920191818.GV5091@mdroper-desk1.amr.corp.intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
 <20240920171223.64969-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920171223.64969-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9718eb71-1ec9-4c4d-fd94-08dcd9a90308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ihbtPmyjEn2Z90TUKKRURt8bSBbPDpO4HptMvMKBmG7pQtNchHl3+CvcZxhR?=
 =?us-ascii?Q?+s0VnEUxkN60fGwkeLuOd4WICE96h80gR+1q38sQS/EjoKFIh/DC0CyfqW9n?=
 =?us-ascii?Q?78crze9l3XGTat/cXhKrnRquF4HqukU9Bs4zt/20zKe/kGCne8KQOVqiE1ES?=
 =?us-ascii?Q?l1lqJOmi5gsDyqKQiTlMVB2r2uco4ja3Chx3VH7N4DDXwy3uPVMFM2D7t06v?=
 =?us-ascii?Q?St1HEVqU3rvJHfftUGHeoDcfiPINz6i4suUK5vhFuXwZ0y06RqxSsdgnWZAB?=
 =?us-ascii?Q?g9xL8EL786gRXAvgw9RntQmBP1/ueNjil+MGJsVr21SZ9ielgHZVsU4CUyg3?=
 =?us-ascii?Q?+GP+6dHxbVsGAO4lLLg73NSfxGG3rgWaDehTDUFxmmzbAEIOoroz9X4hvjAT?=
 =?us-ascii?Q?ZcS4tg2okQJWuQLYaQ345ff0j/DegjlKm4DpdVtJ/CSSkP1AiOmEziK7TVJK?=
 =?us-ascii?Q?XrKwIpQEtnmdNWTr/Xk2uxneGgX/9aLAcG01030lW5IjaYojCD/OUFiHay+S?=
 =?us-ascii?Q?UWZDsegrtd7SmSilcVX22TTF8bLZz+WYVO+64gM3C8uVAYCfDrvvso/W/Fkj?=
 =?us-ascii?Q?iNDyxxywtrG04qOxv2qSKkIXiz9kgu42kkS12v+c95FH6kx+XVN1UX0uysMa?=
 =?us-ascii?Q?Y80rQY3obesCRQwJ36DtbWMv3lZOm7zQBst8vblT3N+lLuFrBm87Vj48kc0Z?=
 =?us-ascii?Q?1e7WuIC2VzcSql7Xf+VqNlJXk9EWvEfY206Yh7hTJeWdOQm0wUKNK7YqxiDb?=
 =?us-ascii?Q?RsDgxd1G95qQs5NREhQDaNsxuWF4JDhQAwyU9Qo9vj+P64zeJ0RDJOPIfu39?=
 =?us-ascii?Q?42Vw1FXPma/FPVenBZAMhg7BPSjAZms8/CN/h3ootXZy5ctwP12xRYFluc0t?=
 =?us-ascii?Q?rV5TMNh0sotVBFX/pbCrTlEIsIZYqdc6yJPzBVfIT3biBdNUqknfjr2z1xWu?=
 =?us-ascii?Q?3MegM7bnqV+TWEyh1Ye+xYlpU+vFHK22CPA4KemhkcG+slk38/9ioBGKfHmS?=
 =?us-ascii?Q?+x5yjQNsOi7kmh3cpLGD32gp5Gk1C1c8aM1KMt4cfX5T3rwVz0JZNDEAMI3k?=
 =?us-ascii?Q?XYifapJlj7bayGuwtPJpJLtTV7ImFfiU866ourJzulJrBh6/+uE50fj+nkEG?=
 =?us-ascii?Q?p1+Wmm+OB8+O6HkwYnQU2gJML5TejaR5EJpq/UbkGjrY2I4dRBO8OzRdWTfl?=
 =?us-ascii?Q?oN1a2FLRGe13kE/WA2SLdYUYab0ql+p9DC5JadcBH/kEWmiBfF6mPUql6KFQ?=
 =?us-ascii?Q?+gGyjRCaVd+s4SLw9FehwNPHdM/M8d4KiQszrmD/aFSn3izWemzfdNBQj7qo?=
 =?us-ascii?Q?okjyBpCldmJnDs/vjkvbKc9WGEKJg12acJ7gei9ohrZxwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9U3+RBz2tsqF6+tx308TKIj5tLKTcVTGRlffkUzMVy2B4BBP53msCX6qPndq?=
 =?us-ascii?Q?eVreswVpxsbP/uSOME2o2yTw0TMZxhHHFRhpwrD7I313gYoAo8eVIaGkYC7R?=
 =?us-ascii?Q?Flqwytt2cC886YFSWK3AVvjGwXvjmgpW+ej4uxOjVYWw8/DDAGEyoDerG00G?=
 =?us-ascii?Q?/x2huVGpPr4emZmvaNGoA/mkWRmM8HOePsNSJfbbuQFC8iQsMzkEnPvUr7c9?=
 =?us-ascii?Q?xNlnfXEDnVS1Rb54OTXUsIytarupACBpiMlXeJ+cD/K7KmZJY36Hx1GDXvkl?=
 =?us-ascii?Q?PDWjI6PzH5qG/KUFC8ahLIE2nekuGEveP1gJYj/XiD5gdi7eMeBAiHhxkV4S?=
 =?us-ascii?Q?UvLZDZsN87aPreoMUSLBimu0aPVx6koo9ybOYCInvP7wbQ+1cB0vHlLUrfTW?=
 =?us-ascii?Q?uOuvYdTSh8QULmzRe1Uw2gVHcbi8ok9AViK6/itydNTDZHgd2P1UnmY8NBQj?=
 =?us-ascii?Q?fgD+OvznjxLLAaRoFTiFkTSC00ZQwbBPlaa6Z2YminEpOvvOt0Yl9/YdfIUG?=
 =?us-ascii?Q?GkDqbV0W/j279jdKqWTiId9mcZLe5hUWIB+ORXAY2pSGRQfDw4lUYWaOxJGn?=
 =?us-ascii?Q?6XLtxnsNEt1Sb9bdBVVcpWIbE8EdbzzaBefaC8bVqy4EmhHo1kfVW5q9rYbr?=
 =?us-ascii?Q?SMxMX6YvrKb9+/JSEQS9gG3F1wkzPPAD75LAz25WcsKbKN6rRzZaiLCN26TC?=
 =?us-ascii?Q?l9lH/F6LGcIL1726oh5kXrec6JSKFjI77f+hC3L5H/RAx86z4VLRzpWCNR/B?=
 =?us-ascii?Q?4P5//QA9zi6DjMoQ76snHScTwOJD+1J7xVHJsRvH5Q9dDJjVNpQo4gY+pHgu?=
 =?us-ascii?Q?qlpxtxTU3TJsMcGp5woT9jj/LJWVlPmvwR9wQ7CVUerM8VRJXxSAFDhK8sgH?=
 =?us-ascii?Q?omEalqoF7RfRo41p/VRCXTUaQ7Pv++5QOtk3TX/9hz/Hw+TYE8NgMd+QOqc5?=
 =?us-ascii?Q?bmLNJzNSpDjL911duPs4a9brtMR6a7vmQv0q93fAhXHw3bnxv16IX4lj7MQf?=
 =?us-ascii?Q?Le2QFnU29Kpw2RRuykYUHxh9Vahkd2bRCNiuBdqLxilnfXUzFLMeOArPOG21?=
 =?us-ascii?Q?y+EmDsN1MzVjfOHPL1WjXrf5cdru4NlEyGFE2cGO57HDHlP9yMmTU79qTr+Y?=
 =?us-ascii?Q?DL4rmOJ/zqxIhl1QBRGUlBFZRnBp8lmtFLjD2bXcD81go30JlEJ0qEK1QQU8?=
 =?us-ascii?Q?ztf15Od5m0bamNRkuS3Zd3wMTMtpuWiU2SBCPSmzaaY2zFIdD38ib2FWuxZ+?=
 =?us-ascii?Q?QypNMOuSCEOd+JiSRePED82wZqvm/RI6heWMqJXcWPAseyH0G7nVK317i0KO?=
 =?us-ascii?Q?x7aUawenuNDPYYVfLP7ZmRq6rA80o2Vl1YjL9bUHDtFrGum8/efQn1oiSSJw?=
 =?us-ascii?Q?KdrfXTnmlfljqRmuNB9d0PPf4O7G6rlUgPLvLs6gJ1L5oHhYoUJYfDqcLWTl?=
 =?us-ascii?Q?afCIx7Xw1Mz0YYRmcP4Uq3bMTI3OPaiUDLQPDrkA8TBmNbODOMis4cDo8IpH?=
 =?us-ascii?Q?jYfqph89eWPiHR4wKKhXIAo8ViLBI+AhTqXoG+gYe8DvuPyMckdbcE5uATht?=
 =?us-ascii?Q?F0xj9w5KNYOI+DlzR3c1fiuQiQHoliYVLbLnvsxVph5rzegqOoiSZ6wfhDI3?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9718eb71-1ec9-4c4d-fd94-08dcd9a90308
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 19:18:30.4754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bei0kQFG3j91LvYnX4g/LBnR/yoOnZgv51KUcHoczwKbR/Vl8o7b48+tWd59hakJ2Mcbo/79HwvPzCihu9Syr5ZOnxsP0F7lPFeT6AhVI5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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

On Fri, Sep 20, 2024 at 02:12:08PM -0300, Gustavo Sousa wrote:
> According to Bspec, Xe2 steering tables must be used for Xe2_HPM, just
> as it is with Xe2_LPM. Update our driver to reflect that.
> 
> Bspec: 71186
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 2671ce6b1a76..4c0767403881 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -441,7 +441,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  	if (gt->info.type == XE_GT_TYPE_MEDIA) {
>  		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
>  
> -		if (MEDIA_VER(xe) >= 20) {
> +		if (MEDIA_VERx100(xe) >= 1301) {
>  			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
>  			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
>  		} else {
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
