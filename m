Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE859C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7700010E71F;
	Tue,  3 Jun 2025 19:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OO/h9+/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2443E10E70D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748977957; x=1780513957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LF8ppogTzMmd8eXFnR7XfBk5/eUx4p2XCwIjyG77Wbs=;
 b=OO/h9+/DsqjCE/42hIYpoRB0Y3O/I6rHu3e2ud3HnzEyvcUAkw5NPcXZ
 +qRrbofbSF1G1HtCb7nzbLIk2eplWSQ9RkbDFE63R3/c9PSTdvAXpW6LA
 5L7JG8Jvc2sOYdx1Ju2fmMRc+6J0/8vD6+vuqiZuGQI26CTancDqify9k
 kwpu5qtgiWt3xOhJURglyKiYgwiK1yv+9jj7haBtaF42gJ415OmcXb6ZT
 NeWjcgCXcFkynogwWXHaTYIMawEnYTKwqjnqbn0ap4eX3PSHf6FawyyrS
 fmC9mm6pPko2FpenYeosKyKxeEcPf1M5EwYhe/ONfF14sIEo4UCv/Wu1j g==;
X-CSE-ConnectionGUID: FrwQwrMGRGaEWpNFmLrEVg==
X-CSE-MsgGUID: CTFZhYpVRNaCp5Eedq5aMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61655701"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61655701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:12:37 -0700
X-CSE-ConnectionGUID: 31ynca2WSkKESggpz6BbKQ==
X-CSE-MsgGUID: /CZJRFiDQjau/vQd9yiBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145924900"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:12:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:12:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:12:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYZYagxZ1xsgBv/sJ87uHrY+EZvSWosUq3baX634BswgcIS8ZHN5IUncc1fRUPKsg6L/RAn+oZtVTVvs16ZNFfIJX61BtmRKmemSMGMrh+aQnVdhIJpoOeSxbj1NB4wC+MTM5BJcOwOveN4EjQPA8RVHx0lywDaiUIb+c3nO1woSaj6t0+S+3b7mLz9Q+h47P6DWVZUMYq8G8+UFLulRP5NGzSg/Gru2QG5p2wMSGjjoBQasOd21tC6p9eWPN1SZIm8EPyOFI95P8horHqMMWc6yYoY+DrIjsIZGTMy9OrxdAmg04FLfDdTIb2rQymHs7iyxYvRk3YFgQqhVS3RATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVzFALNjKmRxsWEE9UKxKa8TytLSbhF9srg6aJYQycE=;
 b=Oq5riau6yqVLmChYXXnnC9MdatiPLAWfIGgS2PtlgSysdbqDXrjwtifsFwUUxsLLXFf1wVpCqOyeE0ulZU4Cyk/BVTQyr20N6udf8ZzsMpwsFIg2MUCasPpyxntWcyKr+noJH2dQMtB1M3CQkdHXBTIMEIsJhFPU2xz0lb4YiO1BSEZyVY4+aGnrSKNtV8U5njgVpvCBx9D25aJFFCxQMb8bFTorKEot5zaZ7c7dA54xCkEpSkKnQYGnjxPYjCAy4m1VoAyyRbxM3BKY7Mdi6WIJwcT4DZvCY1n63b93Gg0NHG8nmjjblVK9BJrYErl9Y2jsOwkrXCJiHQCMWI05Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 19:12:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:12:33 +0000
Date: Tue, 3 Jun 2025 12:12:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 5/6] drm/i915: Set max cdclk for display 30.02
Message-ID: <20250603191231.GC5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603182430.1016734-6-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: b43f1aef-4269-475a-6093-08dda2d29826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8teByVPyVfnvGH4ZPuQoKHp0ftRHedq4o+goh9VS6i9Z85roMZxZMILwPzPX?=
 =?us-ascii?Q?MK0t2188S4VeR6phAP7VQOO8XdV3CO4Yr+JMGM9QwWVm8H330A+DfdUfMl59?=
 =?us-ascii?Q?CXOyHNXLD448Kn3sROnfZzpxTCOeCiSRLCj+X9WyOYWcS+AxF9Dc3wGAFwL6?=
 =?us-ascii?Q?CaD+8VoD1KXjrHs4QjdgZH2QTLQYPOQbQAjRm/jVcg60oA3b5LL7aKEv0BTP?=
 =?us-ascii?Q?ZdExB0nGtiwj0DWCC/EEcOCKSqOvt18tAyuVTZa421VCLAnCB+UAJgJrV6Lx?=
 =?us-ascii?Q?SlosOB1cQEx2yy3hmO0sW0FvhY71osHA3UiK2HxQU17ZykharjWZsfnoDaVn?=
 =?us-ascii?Q?UJFGlSYkCf4ZJF4KxHeLyMf8LHqzjlWPo+ci+F3h/g4PyTZFy4G0N/aw8PU7?=
 =?us-ascii?Q?noMhDUq/ygok1D7DpOXhgDg+UFTNRulqbrdJ1qvfY5zQSICVUc7zEzl/PIj7?=
 =?us-ascii?Q?bvPg8/ClGXbQcMA0QJjaeG2bMLRqHuKNW1VCvbjiFyqcGDmWstj6N1XVOLIi?=
 =?us-ascii?Q?DSEKxmB9gGpPMhEz8hWbhw6w0U/aKlgYTK3EeC7GgA7NaF22QBQiM7+sUzrh?=
 =?us-ascii?Q?2dmgCGKSv3XUoButx+eSnKwk17nuaquT7WX5T/ZCszPCkNun2WXjSh/rxpO0?=
 =?us-ascii?Q?Sx6drA6fI9VlgtLO+O9qbFuaMIDU4uJjCOJTbvViiG/OheOY+N8tdXYlQE5z?=
 =?us-ascii?Q?DXlR2pwl8ad8G1H/lyVncKb1eI6FizBQq+U5B3NcvEfVC25h848GFGJjXBLw?=
 =?us-ascii?Q?tanJ41psQ4NtmpNqH+3MEn/QsF4lIUlG7gOIr4OL0s9IcwHsUKhM+Q2iWpqR?=
 =?us-ascii?Q?bzaQVjEG6nhO/l/PENR6abKxQYqf/87+U1Iy7xf/qfxItdwOkXv1/7nogyNn?=
 =?us-ascii?Q?GXszVfA0k4gLx6PA0Z9eOMGjp5MM/bFs49pXFxT33PmBAt3/QX/1cyJAN6o3?=
 =?us-ascii?Q?Qnsj3g7ZHnYstbWWHHDg88LJ1s8g6DSCmaQq3i+JdxtFnOZJDse8no7Zckeb?=
 =?us-ascii?Q?syedu9SdzRFwxDhT4Ju/c6FdH/bkLK/dFRxUJYDdx+HYa2ohdcDUnlYTp1FH?=
 =?us-ascii?Q?7ilO/NZn/uNSnursHaUnUCjcuoYiWLmN5RFuNYPMXz3uxX9C52jGtVAyzayh?=
 =?us-ascii?Q?l9aAo96+CrsEh1xlUU9n5VfmkVyh1qNswNl4pySDyblvA4ds343xrpEtN13R?=
 =?us-ascii?Q?uoyNq9/W4qnHdef/BjKzhKAlDuKhP9XUXEtpnIxoNGqqpZVJS5Brx+k1BAsq?=
 =?us-ascii?Q?vc22RI1MhWA0N8IBVeoZdDvg2VT4vDCLg2A0anroGsxp9ILz66ziMyKt154g?=
 =?us-ascii?Q?3vwExh5qCmdT71JO3Mf8VovgN7nGpJzQRpdV+1GmwWX7OG9EQ+/QT65fpQk0?=
 =?us-ascii?Q?zeVVISK1+c0wksBGdvcwgPj9tP0k/FanPa8snWe/NxCVBzCj3AuhbbV34Wow?=
 =?us-ascii?Q?WorEGjUJOOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHMezEl8sZ27G3xI8FVYEVQX5HxdvWmydSuz1DtJ+SoqPgtLKm1oSsbHTiY1?=
 =?us-ascii?Q?FUm/HDHagvyB1aVWGVLnzmTuLwcH3yTN3CRWATvO5kU5ipezNjH4JRFLpSy0?=
 =?us-ascii?Q?jIzeKI4Gf08F6mDjhLAcrke2l4me5/FpQH95ne7Zw0KPxNbH3RdSO2RbjVMc?=
 =?us-ascii?Q?egD79s10Wt0vrqKntrilF9pg3Z67wtSq97htL5VuytX61hmYsZeRhx9UjVaE?=
 =?us-ascii?Q?Di8UvZQTOMZB33G5VbI5pdQ0KlIfd7SUVtlrjGWt+ksMiWzFlfBvfdKu0/SP?=
 =?us-ascii?Q?OIAjl6CfE0rsi1RNsIKl4Xd+avHzkxkzKL7hh1IugyiD4EeXd8/eUVzzFXwT?=
 =?us-ascii?Q?7ylTMyfc2tV86dgJDusNoA1foiseX0cBEg2dtbQWOKBci5w3xF0560QbrIAA?=
 =?us-ascii?Q?QAM/tVyxi0EgskXKiIjL88wcKpPIGByjvC9hQAwFMKcv0pQlG6DpQB4T+vgA?=
 =?us-ascii?Q?OigmL/K9JVSMHrfD4+a135WwgvJBfAjVOtr4E5A1BULara3uUaGs2IZ+4jdG?=
 =?us-ascii?Q?euTPlH/WOrfRgIX9x5y/DKwyVBAlU86n7oM2jehqpM7MWfrnlfZt9IeNNCFc?=
 =?us-ascii?Q?nM0v4re8p5rDlITvAGTl2dd1kZCmWf1yuQVrNLg5b9zgWj1gbLhb9TWoGF+e?=
 =?us-ascii?Q?5zxFcO+IjRKL7H4lR/Vwde0BEHtFGVoncL18F+uV92wRXjm0EPPWTqzKnj8C?=
 =?us-ascii?Q?StvFb+cIQvnBRYefW8HK7FfBzPvk/X9hSTGkwAiyR1nMdlv+Gi1kHu4m0tZu?=
 =?us-ascii?Q?u8znBISJzuY11CZh3n30jg688THrUTGqTQVzKJHvmpDVJEZdDz+DJJow0J0P?=
 =?us-ascii?Q?WXwvt8fN6NLrh0WiumGU04Yg5BqB4/xYfSjCn3O9pwSKJHQVPuEDzNiN1Jg7?=
 =?us-ascii?Q?OV7NDDl55Ulr8d9leZvZ0WKgCcly1mE38C6yYpd5BaFzOuNFm7Y7DL/RyxJV?=
 =?us-ascii?Q?d5WBGSyMYj+ofxp/9RFbEsvmEY4ZNWlhZHbgReCdlk8oRUhQ/3nwSJ3T81iI?=
 =?us-ascii?Q?qaGW35hfRXLH7XZKOWGCAMZ+oSy3FAyQAHLU1UIzPvMb7gmiaVYo8tF+f2fn?=
 =?us-ascii?Q?jBG08nkNUl+gDJT/E3GujF2xKuZqI5L+u+LJ7LnWzunVgq+QAuDg+73ey3QP?=
 =?us-ascii?Q?5PW16oQXADcrG18ian91HYn7PiVN6RIpTDfXh0xPFNxfijyIJUDoFfwKE72l?=
 =?us-ascii?Q?3HHutO+OLEwbsO4TfGd9HduJZvPOITD/xXC3vPgBE6SX+yTTAqn1mqzE4dsG?=
 =?us-ascii?Q?ThOGcxg+uXK6nLv1EjvfLxiP0kLt72Lj5vHutUNcmv+Be6jlVzb4Yu99srbM?=
 =?us-ascii?Q?7JlF1WoGqOsnSJ8kXsnQX4B+qIH8F0koqZBknfK7BkvRUXIL+UiEw/1O5xfU?=
 =?us-ascii?Q?PvpzgNk8uQvCJ7ktOvKvjXH/mwNPRC/mZlqq7jNtLLoaMYKAOACdVO48R1LK?=
 =?us-ascii?Q?i+M9TtEL+csl7ryGT+nzjvN30gIHtjiOZ7a/NNB8IFZigByImWiBYxURoGnx?=
 =?us-ascii?Q?a8X32msdOhPgBK9CVAsWXq2/ZXgvSUo5SbyNsIFFiFYXuzGZjLL20zx8fX30?=
 =?us-ascii?Q?SSzw8VpOTa2mFZveI6lAgdK7alDBjNvg2MkWDm4Meoz+YBT4Z178wityBqIz?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b43f1aef-4269-475a-6093-08dda2d29826
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:12:33.7707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4LRVguafMQthmD748kNjCB8P/rE0NErOuf3Ok98R3EQ5RzGZB72YFek5SmuiYztkiq+FY8wTDh6JSnGIuUykDmq5eejVI7zczxQPrxIXA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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

On Tue, Jun 03, 2025 at 11:54:29PM +0530, Dnyaneshwar Bhadane wrote:
> From: Matt Atwood <matthew.s.atwood@intel.com>
> 
> Display version 30.02 has a lower max cdclk rate then 30.00.
> 
> Bspec: 68861
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index f0c673e40ce5..4625c9cea4b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -3385,7 +3385,9 @@ static int intel_compute_max_dotclk(struct intel_display *display)
>   */
>  void intel_update_max_cdclk(struct intel_display *display)
>  {
> -	if (DISPLAY_VER(display) >= 30) {
> +	if (DISPLAY_VERx100(display) >= 3002) {
> +		display->cdclk.max_cdclk_freq = 480000;
> +	} else if (DISPLAY_VER(display) >= 30) {
>  		display->cdclk.max_cdclk_freq = 691200;
>  	} else if (display->platform.jasperlake || display->platform.elkhartlake) {
>  		if (display->cdclk.hw.ref == 24000)
> -- 
> 2.34.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
