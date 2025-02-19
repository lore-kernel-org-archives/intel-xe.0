Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EA9C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 21:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1B10E044;
	Wed, 19 Feb 2025 21:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ar903wpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C810E044
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 21:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739998901; x=1771534901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6NNMWHX/Ut9PwMyWqpZGk6VAJrqNn/aEw1HcbrzKkEQ=;
 b=Ar903wpAZLBAT0qgnddnZYpBqBf9ey38k0F28GzTQgyoDjPMXcfJ6YEm
 T4XnoiLpkjLoRu04coyh770bZR2yi2N4TFp3iQcHtWV8YsLuQxMmvdGxc
 j1ysg3ml54mmUKwRSucXJyp7waAXpO2ROIUnjYeEMta8XehRDSFtC++Hl
 nPaIQk3JjQqJF3FwZj0YZJP+zc5cONqdMt4amSqrBE5fYy0odyow0r2l1
 VdKFbpuXzRNjVxJHcfGFm1FBTauUoAKcT3QgbFyHMLLF5md1wiHJZCXoh
 9nnQt/UrZPXT6U+zsvRmGmd2XIaWFUKj2UnzNbaCdCuPVg3kz5EUVEW4q Q==;
X-CSE-ConnectionGUID: Dc2q+ZwDS8GPqIe4JPIUgA==
X-CSE-MsgGUID: Lr3USWq2Ty6meaiNA11kDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40678529"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40678529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 13:01:40 -0800
X-CSE-ConnectionGUID: 6nL2GycyQCSCc67omvE4aQ==
X-CSE-MsgGUID: kPYKGdOSQLWtpR5Lu7Qogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="152037827"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 13:01:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 13:01:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 13:01:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 13:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIm/CurwM6ww9IrRHZIC/TvNHGiJpsqo8JJzFQVhuqhx3/Dzq1AEvIvkhPNPKh/WwhQW54WRCsYMHac/4a7wRtkvjGnp4rC9VxrjPOUEhtqPrqtNy2K05e93C9WI4cmFVe9d4YRrCWZPR02oGvJ+TgXN+R8BMgpSZD4lEO2gzC/lEVIXtJB2NOpS3xxeQxpuW96BNvLgnyuCra4ddCcO+kEGXLOin9nmR6Z1hmtn5yE1E161f+ba7hnvAftJxkn7JSnGI7gtYU6kUaAoDUCSf3kEOcKVMwq28ey3dEXiwrxk/6v4YBU59J3ZSywRAmvG4PWlqYHfohnRhH2IOmwZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0/tGyS+byBJ1Sq78cO717jS3vHczMfs/E9Rcg6e7Ag=;
 b=eqLKuZ4ozVKv+UBppUlNFbcBq0R5g5yeRA1x+cRHLJly7oqfD9N4rQsSBpGzUB8hJPwRd7l+WPgXErwueacmLjFscuYGFWjlKLapwxZCfIxHwsbcBNXmTBvCowzWDMlAESs0hk55POTRg2IbgORMnmn+Zuu+z+J73azb7zVXHuF/tx7t3/s6dsxDmfAp0X/fbhPrtozxvAV+LX/wDPCsYJgNToaiuEckJbjUXc1slINwVQEfd5OIeQOp5D6IzS/AfKhB4o5h0BFI+MSG9l3euYtkPWGBX3qi940RJULe3fEJhBfKBt74v4Lp1JuygSWu0bncQ+4/R/d/AcRVwItvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.23; Wed, 19 Feb
 2025 21:01:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 21:01:08 +0000
Date: Wed, 19 Feb 2025 13:02:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Message-ID: <Z7ZG0wgbhMVfjbfy@lstrano-desk.jf.intel.com>
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250219192710.281-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:303:b4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: f046502d-4fee-4f3c-0a05-08dd51288860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIEyT2qf4/G9fE73+j4ASY/pGUZFaiE41hGB0sFV7yLgR6MmoscXkUu0deeh?=
 =?us-ascii?Q?YopIuA9hvWyNwFUo91MlaxCg1NMnuTtw7Up0vxRXxgSgUgL7d7W4IZZWgvUp?=
 =?us-ascii?Q?uVXSKO6+iN206DxSpp3wUrjaQpZnHLMO32AtmSxDaau6ZxAwzEtK1GJhJOeh?=
 =?us-ascii?Q?68WbErhri88lL39Anv1DnQ/F9J3rQCZOWHIEECV+xsnKHE9YYzt7v8gGS3ju?=
 =?us-ascii?Q?T8VRL0mcIXOLO2njzKV5MHdi516w09mTyQ+0KARDB9weF7AI0kXSzS0r7O20?=
 =?us-ascii?Q?q9iC3VBEZYWe/g5bqgyjLWFkP0RucZjQu09fKMdK2Ugn2u3gya0Up8O/HL8Z?=
 =?us-ascii?Q?a88DhabQzDLRWAIsdecP8jYcxQzfZW4mjPGxbt9NFdMrOap07Ym71PePQjHx?=
 =?us-ascii?Q?q5oSy8MErl+vvlcgRGI2RXFdi7FJzKfPBWCBCi/pvYUYpTImcEEIYO/Rzgxl?=
 =?us-ascii?Q?1Vq2WnL1Ae5HP77wiaktzcKtkgJ9PpMuwdQmri5WpMcMHrnF6MnQfyh5myx1?=
 =?us-ascii?Q?ql9wXKq0kKEI6KlaeOJ5PKXxmBRDAfkolkrDYs0DSTpwWA173APKmxYP/dIU?=
 =?us-ascii?Q?eI+oHxe4u7m6SrlYoJLvqgGJY4Q4mq3ksde++AuFIZFZKrkXlv7RjXOfxBbf?=
 =?us-ascii?Q?rwiIF6WGb7jFzcgWpFYLALIGjVdbwSAJX3B//5fM+zzkFJYVar47YHrWxPiF?=
 =?us-ascii?Q?w3wrMxFvVbrViQJzHPtVgEHKlO+62ZdOc+USIH5PILz3d6aIyFpECdBBK2Lx?=
 =?us-ascii?Q?mG8oevtzpQOiXsIqsImUU5Q/PTyWM2btlAh3qrvJrwoXrLU6qT7FFJ2bKzQg?=
 =?us-ascii?Q?d7NdPlNfm3Ql1Z2h9B3HTjmrdCrRtwyClzEsa18J1mN+Y/eqT9HTwt8nt/v0?=
 =?us-ascii?Q?hsYpkJfTLVvRoK6y1wuDAt0iqwAlWW4ojyyV/DLMaukJ5zyYQbbDnFyXp2ZT?=
 =?us-ascii?Q?2M3YZQma2cxj1lSqYUgxYb49TN9fkaIVMwWxXSBtl+pfv+RHLhrslxR01ZxT?=
 =?us-ascii?Q?FBufMqtMpZBrH8R4/JQ3o7YjXawZZLCOno+mTDDpx6j7wJbOo4fWst66DKjA?=
 =?us-ascii?Q?++QIJZb0u80Pihh7KgV6eozenL7T81cKavKUKGW0Vp/tSLJOLbTzJgTYsD9T?=
 =?us-ascii?Q?XGnkO4fZAqSB+0yN2JccAIkDnDflG/9mylK95FqaAAw39zYyyP+sT608bVX/?=
 =?us-ascii?Q?AyFJQDu9HRuNwhMTTUnaeh1kEMBpJqMTCVVSjg2FfjcrF/gH2djPCcxexR+a?=
 =?us-ascii?Q?eFQdPH6HAdZ5L06+Y5Y+l3Ff8DEyIEViYzWLeaa87NARRyZXYB4JZsll8O99?=
 =?us-ascii?Q?C0ubdnOUq9ZkSZJnTlG5BEpVxj2phdoxTErB61PrYnOpTwG/O+kVnjaLTbU4?=
 =?us-ascii?Q?NHLeOy2LUQvVeAgHkdpdsTdxsqSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?igUwm42bnAL6931OHvRDwMbOh9sw149qS18stQoQg7kGe+1TScYxNfc+Mt2/?=
 =?us-ascii?Q?MrP5ma6LimLQW2Qxu3B4Q7QP9GyYmo+WoC8iDmMqXhrjci82d2DMCC4EPxgZ?=
 =?us-ascii?Q?o+MrSdC+rm6AjtXHY/tpnxY8wCewJJraPOGphNr9fL8cEe8IdBJmLfYYNjlr?=
 =?us-ascii?Q?RczDW1aXYjjJzhe2hSFCWxmXP862+o4i/BqUpPfAtPGmTL2XDjlc3gqeXlvA?=
 =?us-ascii?Q?/9IB9yr7/6ksmV8C3B9lyOrEUAFLqx072/ZYIVPaO4RIc2dEelf7WCLu54eR?=
 =?us-ascii?Q?16Iz5rQWozWeJCPwkd7fW0e8i/dO181klrGiZRpLuAXDWvwbsXq66gRwCW2V?=
 =?us-ascii?Q?wVui0SeMDv8s7m+o6hPSviECiwjPEbJDR+pimVK+uv+VdH0onyU9AQSWgFht?=
 =?us-ascii?Q?g9oi7nvHgdo71bfhsN84todzHzZzOCfAYcFIhtpi3Ri9wyPL2mizvEXiIuLN?=
 =?us-ascii?Q?QNRDBlRsv6sZZ373h3/J10xW3HbZrZQr3x/apPV2BmwCx1sAEk5ul92CFnA4?=
 =?us-ascii?Q?NgAUXBc9vcB9TXQlHuJwUi5YSVQUCXUHKc0mWoZsECVhBXY22byqP73bSuKh?=
 =?us-ascii?Q?3vIHtv3TOQVt6OlYrBKyDXy6zHLzUaDIfI5Ccet3y+y+MgDX1ytXdbBn27FI?=
 =?us-ascii?Q?GbjSSX6DnOmBj2lPK8R6+srXRa66f3D4isg1joai8wwaUTP4O4AOE8vxjq04?=
 =?us-ascii?Q?76dVxnt4bWW0dgfYyqFeggCOtfsi5ypGA9S4R2cO8/TB6yQ/OilAgRjuSU/Z?=
 =?us-ascii?Q?v9oT0NY3eDmixDSWiapCAbQFSEmoMU97EEO+Aw7b2Ed59GPLdVH2Y2vmoZAH?=
 =?us-ascii?Q?wquM+9aENX9xvz049aHLCHxfCxMJ649AQoXssC1yds4S7105wORIHP9QlTny?=
 =?us-ascii?Q?+vfLbBSavbQLqwsWFHPgBYJxgdgCA6MJTHTx/wA1dRQXdd7Zv7/bA5fFEwZ7?=
 =?us-ascii?Q?8TrFcogRmwA9pdYyOUktX38bWtvjGRktOCO/x3cV5+lVggr4GxAqYmz4WRiX?=
 =?us-ascii?Q?TmWwbVH3pfwMIIMidTusQZQ1T2Upyw3DULhN+d5CpIyHGTzIV5DtqWqW5p8A?=
 =?us-ascii?Q?7ndVFPCYMCSOFlvOlovUFQhusp05U+C9Zf4i64ZMqbg4Fuj13NPsUFfe2ivj?=
 =?us-ascii?Q?rirRyH0TzoElAGgXn0n3C6Ol7OAFcoGZ84LMpNrPY6ZRoSNybM9DQz5rmFOk?=
 =?us-ascii?Q?RwSUQqZkGED1LPra+sBZBjtRNM7NBsz2RF4h+DzpnEFkNw9XgOu0+GQbcMt3?=
 =?us-ascii?Q?EBfMc4EFQ95MZ2VB6s5tthQtnjnFAhRw3/wPhc39UT2fLFgxwj3TgveFp2sn?=
 =?us-ascii?Q?V5oRhRJ6ooFt4GD8NdhhxP9gIGnlkRCGOMASJjJdNzqjbYmE17DvRuwWAu6j?=
 =?us-ascii?Q?6RaFBSazIKo6dwRO5/dzO6KS8g3ABE4BuAkHEodX/MQiRf4XASMTpnGNgyz+?=
 =?us-ascii?Q?cYpDDlpQns0f2TgrZmhqtDhlou1pBJBwL0f3QNai/4BZPpU7AHDbLLViQqHy?=
 =?us-ascii?Q?xO4sZ5T8uZSRYFxzjYEVJ5KsqaRYjcIOFU3jnNORsPG7PG3O59RsfHC3ie5+?=
 =?us-ascii?Q?pfdaxE3T3EoIqz0nlLkQRGKdqFPtR3BIqqLz/z2KguencnWz+yNYr/hZUGC0?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f046502d-4fee-4f3c-0a05-08dd51288860
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 21:01:08.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XShiYjj7CZT+xrBFRHD5GL2nlmogyr97l4ZgGBQL8ak06N7IoRkVynz3Xiy8aYZ8SIhcSBu9X/UcG8vAdhFdvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
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

On Wed, Feb 19, 2025 at 08:27:10PM +0100, Michal Wajdeczko wrote:
> Treat unexpected non-zero response data from GuC as -EPROTO error.
> This will also prevent passing positive value to ERR_PTR().
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain/
> Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC messages")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..bb03db361512 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
>  
>  	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>  	if (ret) {
> +		if (ret > 0)
> +			ret = -EPROTO;
>  		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>  		return ret;
>  	}
> -- 
> 2.47.1
> 
