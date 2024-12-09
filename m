Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2FCE77181
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 16:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8610E7B7;
	Mon,  9 Dec 2024 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSNYjXuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387510E7B0;
 Mon,  9 Dec 2024 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733760341; x=1765296341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x/UICZ7468G6IftgSUCbKUi4awmwJjlgDeb2vcrtCXE=;
 b=KSNYjXuXn+W8sQukJ6c9k4NR/+ylQQSHWxnR25huiaT2RzoHLf9DwvCz
 SUX/2Cw9EpBDeJXVXFDIqe/kTSutXim3QnMZdFIHzCGr5ADvAeauqJ5KI
 iO3VM8TiNAsFQp16S45oRc10JNEmn58iUIGs/2EZ91MaA+soaE+l/+Rik
 Tg+wFKEtTZcyLkYhvUo/YRlEIkZGSfKn2GGja/fUlEbRONzsSpOutCn8c
 ljDWNUyI/KS5oRhxxL6LMhfBRnm4r41SZK/B3jNAiujq7Zg1rA/gkiRKZ
 HUznojhkzcVri6ceqjuB5BxKeqMrzAVr3QB8SwfkleZ1MUIqvGNHdXgp/ g==;
X-CSE-ConnectionGUID: pXjJlfQpTZSe9BLtL5k8YQ==
X-CSE-MsgGUID: Hkx6M7h6QpyGeHUgTcaGSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51599697"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="51599697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:04:24 -0800
X-CSE-ConnectionGUID: moW3BFpYRzCzPmXsiL0WNw==
X-CSE-MsgGUID: 9XeLeo2gRzeNEJHsmnsfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95467330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 08:04:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 08:04:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 08:04:23 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 08:04:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM/UadE1tJYl9XWnsAfAi97HENUm13nyQn+TSSVY4a7cb9iLJxv6UlkT9lRQpICPQIaupaTkZaLVoKF7OFkcsqgol8EyXKnS4yrW1P+Tb9nT5IpRUVzNWFxX0EdeQTV46b5PzQrKc3S9QJZqnz8+3If+JNV7oNgExv5mKOWy+djmFdP6mOkwyT0c1CfmChgCixuEA+ZX57RaGX9OjgAlNVcyFnPgBVo/HJYrllntWTtpr2/OyJEY+4UGe725dVSpdkqnmVF7WFUQCrrziCspFVQktaUSzn4z4lmZhiRzECAckpHSxySbn3F4kl28iI9pgkasdbMVKpNHIQqwbSV6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9VkXy+J8j89U6tJeck34kqbr+WiiWTVELJlvsg7FBw=;
 b=Q8QtWSf4RDwlGacnzdBFqReI0ubaRWKrYL95lmo1zg08dATztsekzv6ri8+Lj9mHPrVdCE91N/y/7ceUq3f7anVWDc2djHhnoUT/YHaDzH8TY08TwSFuaC2JLQnpdG2pWvLY+P4Zwz4Xk2GbcjNrmXcdTbAIMDIAZipol6FoyXekyQdhqGHfYVyQTLgpnh1VHikkveQ9QlCqWeL4Z1JluHwQ5Hgj7Cdzxu+XR0mFf5iqKwuhOdkGb4tEZsKs3zQKrgJuwgFc84wRx2KTXOrIEmdx5gKcqRMZfvA/YUqcWwJIZf83bdRREB/DOe68V5as67j13RUQsZTxwPgbYpaFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 16:04:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 16:04:21 +0000
Date: Mon, 9 Dec 2024 08:04:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jan
 Maslak" <jan.maslak@intel.com>
Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Message-ID: <20241209160418.GS5725@mdroper-desk1.amr.corp.intel.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a4d3e3-0bb5-47f5-1f79-08dd186b2469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?boDnA4nicfNF/rgFTm+y/tzf9GjOc1F/v6/b1tnu9ShYQxo41MQqgnSxxdg7?=
 =?us-ascii?Q?+GofyJLTNeN61JOJO1WAQow1g3UsrpEZHwZPQDaWKCttXuJzmjBfTTMmROQ3?=
 =?us-ascii?Q?6YCLzZrwvKFal6JrHRIHwrA1lYEcroU2xb1raIdSRkf0vY1Oy75gIjV0Yz00?=
 =?us-ascii?Q?E+J3cr78uJix+oz/GmzwUY5H83o2/YFsx8k8io5o51wMlWMZ7AJS3RRkAeye?=
 =?us-ascii?Q?DxwZVo5TF4yGPJdwRAjL2sFFftLUS1LAIpcJrHATO3wYk7tXeUx4NF8BQen8?=
 =?us-ascii?Q?bWir83xyyMnx1cvrnfQ1R5mWDuDPehpzmCsUmNGtSoVoOAR3Mz8dUpfIOnqZ?=
 =?us-ascii?Q?u3+VcaAaXXbK5ZaDV8ZFaM+f8i9j1ZiAxuiPjcPZ7QqwxS/PrzNK5WvYW81p?=
 =?us-ascii?Q?pkqsb35jnaxvoQRN1jHWURlur6j2WdSe/xdE8S6uKLc8GOL/SsfgSaFGG4Xd?=
 =?us-ascii?Q?Yu8n3Rst/zfvJ/PnIHAA0GwlYAvceDzYuwOjv7bIJj5PsrZzTd3vyWj8rKSL?=
 =?us-ascii?Q?6CAERlus3sJi5NAjxEn2Ien3gjBNHH3OaJKRQQh4j8RO9qn/jq3C/iHR5EXf?=
 =?us-ascii?Q?icuxyX3TPa5AvdDWheoXIGbsGt1R9xsATNVxBpFXbOcYbfiOAh96mV7DRJhR?=
 =?us-ascii?Q?/J+5ZqTycGHUyGKJ+vaOJd2WkbxBZSjp2TkQs5h9pR8WEgmJj0/xboOZzShK?=
 =?us-ascii?Q?PkuFof+/zPQR0WcugPUMRryK5feiANn/14NveMZ7efZL44xT2jXsGVMxAsk2?=
 =?us-ascii?Q?8MzjWlxZmA6fw2baHTZJplIoQhSp0pOhcnjnUSTXFNf9pdERGybgWC0306pu?=
 =?us-ascii?Q?jOVV0AmJenXo3cNzXNbiQFafWedR5zCaCE6AqBTwE8oJjd6TlvvpAZAQ1bxP?=
 =?us-ascii?Q?rqvLiFROIJSPCizwXVyzfBbjNlhHmdYKoNZCwBFNS3nRdmoOBBpX/DzaA4V/?=
 =?us-ascii?Q?AhC0ezG0FOUM4XZGMmSyPe0QTz5Gvrfdi4KXPbcCPwk1nN024tRHizjyF7aj?=
 =?us-ascii?Q?PCcXj2cz0uL1GLLi45cF9VRZvov5/BueIbvZbd03qrT6Lnzn42fQff2/nPie?=
 =?us-ascii?Q?p1Nil5G5eCOUh1Bc3UQCuRyJ6LZo4Q5m4Jk6r1l88pO0IgIA+gJ2qs+PWTR7?=
 =?us-ascii?Q?L4BfvjBYiBOErP7UNNWBiq1SM6BcG0GFKbQYC8iMr/oYYAnsr9ebaPG5qWhK?=
 =?us-ascii?Q?3EOsjnPWJt0GM36Cglb/KmkWo3xj/dkRG4hlMWjs39nPkITK43LKjy6c7Wsn?=
 =?us-ascii?Q?KOqukofSUJU+q1AEiW9vFaJamdC+qwt5RgfdCL2jw5C2M7IwtfRKRtmrbLgZ?=
 =?us-ascii?Q?0Dw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhsPW0P6FPHSbMZtmJDPuEiQ7c0+v+k3XH1w9LxnvBuCCOWAw+680PRZqlfz?=
 =?us-ascii?Q?AKrD4ENGxKQMYKd8uhlll1LoS7LREBw4ut6qr6NnJITMtpv3rgJbY/7HoYAg?=
 =?us-ascii?Q?2r5MtvWzpsD2t68SqSPKy3Rfn/vz3vNyvEwCtUfNSRAHzRpZLRU/Q/Y0z1Zv?=
 =?us-ascii?Q?krC34jwmRD1YEMJ5DdBTR+E9mPRlR1VjXXae1U9V9PCCU5SDrbXD3Hghq3u5?=
 =?us-ascii?Q?Slr4wVHIjP2019w3T/VDjOEVJXKgwWBDtJ+OT8fcGxoiCkpXt+cdbkuI3TtW?=
 =?us-ascii?Q?49ThbCZJoFVfob3EodHg2EUDTaCisUXcwEpHK2SkaY5xiazzczE+E5AxapC/?=
 =?us-ascii?Q?DBokM2sGXqkYkRO4DhTgDG37KBv7d5sUdcFBNVKPoWADwWHS7n40+3+2CXT/?=
 =?us-ascii?Q?VV582yLjg9Cl2jo6VvJV6A87jhNfz3HbZjbFt5O3lJ7rwxM+nAX36586++gx?=
 =?us-ascii?Q?MnAryYtrQbbxyvHU+386ofSnu2IoBilu7VFmOUPezb3289lWo8UXiTyEB/bo?=
 =?us-ascii?Q?C25JMA0f5t7GkLX78uIFYJMm8bBH4YqGaBDBsg0GY0cWGzue1d4mCQrIcYKh?=
 =?us-ascii?Q?uEHxna85fnPju6yUFPF7V0/W/oB6EGof07aWvBv28tpNz0cXtWJH7tRuF0aX?=
 =?us-ascii?Q?WojJ73Qtd5NWfk0tlDbJvFaqNWWKFrxgVIYJDeWhQkuJc5Ism8zT+qC5GEul?=
 =?us-ascii?Q?0zUQEPv/gPbblncj7Se5IgwcwvJvGbhCvY92nG7zFBocSYYhhEuBIrSa/rmE?=
 =?us-ascii?Q?FyViiOd8etxXO01M/wz2cC4EeUWINZ/J7hhG4ud0ZWDaPb0iYvLIArPTNVdK?=
 =?us-ascii?Q?1MZfomVf8kqzl4wDrW8xGcgM3QMFmsx1i8WUXaa/ba+Brgp/Owj6JznJ2bNN?=
 =?us-ascii?Q?z35qbAItB7SSl0QCe2Psi325zhe6bH/WJVP3FzkA1tWDlvbADJhDZ8nXR95O?=
 =?us-ascii?Q?C1SxURONr/VfFdv8QLFRn0GAeIz//ISfb5yB+z+P8YfQ8g2f7uOf4v0sIsav?=
 =?us-ascii?Q?srMniqSE8OMCaLqJBVlxrOhJ8ZfthRpve9NFpWmrmhD+o0D15LF+usB68a4H?=
 =?us-ascii?Q?ysbLeBrBnwRjhmsDOZnjgREJWahWdeGVwyPV+aW37kb6EQU1NL2CpvZT2Tsm?=
 =?us-ascii?Q?cg8NhGpWL6pBRFqOJHoq+whp2WCksodztFE4D++5YMFLrF0F9uj1GMl+Cj8z?=
 =?us-ascii?Q?4ufBIstvEyvFZpLyT+lS7h/QwQBG3l+XFB6zhKX3dtfGFjrwKokUpXRilRW/?=
 =?us-ascii?Q?Soe5T4IAwWGu/JFXWPKaWtOrDmU2ErdQqL9UVWNz5dGktc/4Kc4ZJlJl0nT+?=
 =?us-ascii?Q?0YqvT9YFqtkhO/bAhZ7gZ+VcMBUoRwoICJNIYXVH14ATqIfh2sAdyLvHaMTW?=
 =?us-ascii?Q?oMs0WopdgPanCrs9GoGdUkFTMlep74rSph+1pkyo6xtdpNej8fc8KYYqUUsq?=
 =?us-ascii?Q?PPNnuqKP2rHhT71TGwl2DFxmHPdbQav23VkHz7t4ze5mpJXCRehc7zp8mhwQ?=
 =?us-ascii?Q?Rgpz8VzPgWp7NMKyNH51qcozxYfkm4CBcPkEJwXrDE09XzZWhe3eFKnQxnv2?=
 =?us-ascii?Q?/N7mS9Df7DJHeYE0EKPUxD5Ev2uKaxUBnJ9d88ifJ7TTh4RC0TMX/RL2RVtb?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a4d3e3-0bb5-47f5-1f79-08dd186b2469
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 16:04:20.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIKM9o5i6B1mYK4zOPCzByybHeU8AX10+vCXg0d3XuY0PQNRJNJ0T2dSGLMbN0rx7dX5xrLfZiLHnSWJYpaByreGDzrEZ04V7OJ0G674MP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
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

On Mon, Dec 09, 2024 at 02:27:09PM +0530, Tejas Upadhyay wrote:
> There are hardware platforms which are not supporting
> hwconfig table, for example ADLS. Querying hwconfig
> on unsupported platforms leads to assert and failure
> for some of tests like,
> ./build/tests/xe_module_load --r load
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683

This should be provided as a git trailer:

   Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683

Then gitlab will automatically update that ticket once this patch lands.


Matt

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jan Maslak <jan.maslak@intel.com>
> Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  lib/xe/xe_query.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index f3731d9d3..8f0a5392c 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
>  
>  	/* Perform the initial query to get the size */
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> +	if (!query.size)
> +		return NULL;
>  
>  	hwconfig = malloc(query.size);
>  	igt_assert(hwconfig);
> @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
>  	igt_assert(xe_dev);
>  
>  	hwconfig = xe_dev->hwconfig;
> -	igt_assert(hwconfig);
> +	if (!hwconfig)
> +		return NULL;
>  
>  	/* Extract the value from the hwconfig */
>  	pos = 0;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
