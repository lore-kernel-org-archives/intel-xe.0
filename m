Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5521DCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF28210E1FA;
	Tue, 14 Oct 2025 17:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsdCUSjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE4110E1FA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760461505; x=1791997505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=74f5zInzmU7DcxEnWV9AMHp4O78bwKaqG3BCZLOz/Tw=;
 b=EsdCUSjEohj73NhOA86IGKFTkQDp6Ab1I7LQYkFPqX3kQoTcoKbJGg4l
 CN4PZ3nUhX086GMRkVu3PphyfcRFlOrw4fFJDhPw+f4v812gu8py+D24Q
 7Tod5CSJFbIQaylxk8TKitjin2BpfmYFRqBnOum6CztfOz0DkMZmiVIQ6
 eDq86plkE5+dKSyH/R+tDNh4cpGSG7rMm9nKgrornI1FFAY005+H0ri9G
 isIYpJa1OrJHE4BiPoaREVxujiDFFoL3vaf0pDsYJSDLkAX6wwqTW+Noe
 nDglKPNp8jvwkarlPCLVG5ydWpKM0w04UgBL2IucqAi8QUb/aAHst8Le5 Q==;
X-CSE-ConnectionGUID: KNSZliQISxuX0M73YQAo4g==
X-CSE-MsgGUID: rAKVlNikSvWn8tC8woH1pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62778546"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62778546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:05:04 -0700
X-CSE-ConnectionGUID: bJZ5dkNJSFSCOylNL8YwbQ==
X-CSE-MsgGUID: hAkyQzCmTkGKM74B8450Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="187243047"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:05:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:05:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:05:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VC/gm8qWpMVO2hJaP+RysHpvHExH3zMhbSZ0pB12+Gz28eHuu/ckcw5+kYeviAV+EDqKhuMcXr3CfSRQo1SaXowRC5IRJAyQDS7DM/A7e+MJ7QDVo5lOjhJjq+ODlonGdX3fkPB+lD5tNptB9QIkbwaUMvhxv6YWfliMusT7w2+s18JtIZEQXnYAAcPYZ/k+PbowU4N5L6Vex4wF4JulrNCAVXMQ5iKN8ZhH6jOyv/XOokSRPHMWDpiRQOtCMChLiqHFvqjVPHiyOxCpHlkc5nnRY6PLZ7G/5hC1QUlPKnP1Xmmco6t593KR7+mhEaIrIfMynNBoSdCmey8XGjVYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+G3wD3UNFaWmR//GtFTyg/8WhbVkL0Kd29wvd/GArQ=;
 b=nFradJ706m+BBV6BFRqPEwViCCfykeYVAwumFr9gP68Q55CC0Ur6WKmNs6wl2dK/8829yTyTrPGMUpsPemvVtSCc1m4TF//Q43tKigVRYm/lGffy+hcXpkS3oO16shXGroIZzs4EtWWQc86ZDZXaN+kdK1bix26+UYij99u+ZaUHsowAsbZI53vciTJYxt5N3aO1/gmIBu+aD4gcbVB0o2Odjx/1x/vgw5c+1wLBnBCDotIWT1pmUJ3GICStkw93I2Y/gjbAB7TJQZNYaFY0NtwTyaqqqg86W/GT900FhCOf0wW+9xhv+jXFmA4IERiWa9ACcQ1gc1KmTDmio4riqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 17:04:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:04:32 +0000
Date: Tue, 14 Oct 2025 10:04:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 06/23] drm/xe/xe3p_lpm: Skip disabling NOA on unsupported
 IPs
Message-ID: <20251014170429.GT5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-6-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-6-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 53336a0b-47f5-4c68-a16f-08de0b43be80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JTVTlJvCEzbOqSmzC17r4+ckTUgIcPsBRTkeOSv5QMpsIw+DYyPWzs2KlNYz?=
 =?us-ascii?Q?KEpB/7XfCK0/Kk5lOIRTfAS3kBt+W/j9wgjgu4lQJTOERjwNIDNHMHlr2TLF?=
 =?us-ascii?Q?JrcpZ7oj9ssN8aCrU5NfiwNItp+sulqS09MlRAdXXGP4tODG4g0o/733XTGA?=
 =?us-ascii?Q?2HI3UaRwt1D238uhI9EbT/MWR7Mhxo3TdS7lcRuyZTnmtsyKLJ2bY7cCYA+f?=
 =?us-ascii?Q?vwgjgsbAgfRibmeINS+KWCsdvQt//U9NWSIB11XKYAQx3NTKzcpX+Uwtop6d?=
 =?us-ascii?Q?poOp09nOP6oxlna0N8oOtDWAvXjHtok5aw+oDkiKueYAslpXaI+hibhemmcD?=
 =?us-ascii?Q?Pg3seMtZfK1/ex3RXhMBgemkR7Y3wWcYoBjZEpd1awFDUO4nVOyNCJdmHtaJ?=
 =?us-ascii?Q?gaF4B9qBBMHyUsUuDD1Hqc1l2MsnN7xYvTHtFZz0V9SMW7YpfBTXokVJp4ib?=
 =?us-ascii?Q?tbLmSBJRVNwGq6woBUchffU6c81nP0ZICMIfcr3aPfRp1wlUq/KOFU23hT5Y?=
 =?us-ascii?Q?zxZxKWxRNcEtWkMf3D0wLR7iT3Ly5uLlAC2N23trXt/rn3zaBFx1AoMBnoWN?=
 =?us-ascii?Q?YGpyvoxp6Id51SzRAaA+s3ZBnm1QRPKa0LuBOOJ9kPO3gVYfHeQ9Zen/6qUQ?=
 =?us-ascii?Q?TzPl7uXLdY0xvc9WZ+oRxgW3OubjPUnRi8KYA/KNeUchh2pooqy7Xz+aF8pL?=
 =?us-ascii?Q?3bmISLvOb2RyRaylkytccqojCb/MaxmXUWQ1XP7OyFgRRZkF5ODfXldnITmz?=
 =?us-ascii?Q?LbyHYF2t2anbj5nIsnUmbICBsMY/RX29fEuAUnEO9xGtkiz+kGgFmIi6Yj+n?=
 =?us-ascii?Q?Afvjb01kWuRSFVl19Rf3iCwzr8vjKENiwHQNZOHUKXVVA5I/1GbI6ljog3eV?=
 =?us-ascii?Q?vbMIDz2ChY9aqjA4GZ8hvYQbPwLnyztYoyHZLquttOip8RcenNDnBQsLgwGI?=
 =?us-ascii?Q?wtSmOwXATlYudOnKv6R26iNIEXpQJFlEcGiCDPdwfKGhiB2oNgG0PgOxy/S3?=
 =?us-ascii?Q?onGXY+AM1rbsZ7/KvNWEStILGtO/K5EKoegAaqi6283JkyB5Yiw2n3kBoZDg?=
 =?us-ascii?Q?nVtMhBWTQkLN9hmxgTgkN1nwa8fR0T83R8DjuwUGrCDInZpjYbT7f+7ehAxz?=
 =?us-ascii?Q?kkIvdhHMu5FYr+3yANWpg0O0SKdZtndovWas/GClpgRBbFiuKgztbVp3dbgs?=
 =?us-ascii?Q?JCSe/EVirdV/cADNF1y1kRVdp8njO947NsR2FIC71ToOL8Edv7WrJIGNfHpa?=
 =?us-ascii?Q?KoZaJbhdxwr1RLzFjUVo1xYbRtQYhQbiVXzbYhfq8sWmw1YaCi8NZ/zurpMT?=
 =?us-ascii?Q?s+2AzmQwKoQ6T/T1SqO+VIRW1Da4zfB8prB/x3onIe409nk3hIXMt1za++hC?=
 =?us-ascii?Q?ky447ZDjl/ypJk0ltf5Joa24Qan9bZws0zRDkNdZC487f/r4+ex2umCata32?=
 =?us-ascii?Q?xzyfNnggbOZ+HLiYm/0nAA7/y9cbPa4/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RH5bhF5payecH5J3NA60T6UYTDDwxnlZku0ItivmFlmQq0O23dD8rgzBozA?=
 =?us-ascii?Q?Ui6R+cvEEPaXsnHcr8CDEwarAzhclgkEieWjV1SAwWHpRBqeptkRskOpw0Bn?=
 =?us-ascii?Q?jZCOoYluCCtgYJyLD6brJZUlDMRg3GM2iTMhqqor/tQjJ8PsY9BzsUw/N2A6?=
 =?us-ascii?Q?FtUmtqyxYMDLIf0HQoemgQ3fiLal9QrwyHOlcw5K1KkuUQV3nKbi3URbEnQX?=
 =?us-ascii?Q?z0obyFC8JnBzUPkA67TvtgMe05qZMoc6cUQLQzjWA48XR0YqyaSu5IbOkK91?=
 =?us-ascii?Q?4N2zAPn1iK2cpk/3KvDtLZtOknMetr530uiRZXSDjmj26oBnUlKZDoqLXdUE?=
 =?us-ascii?Q?BtEVba1ke1SLZv62r8kHwjnzJypIMKqURWTQItPKf4ML8JRmmErD0blIBgk4?=
 =?us-ascii?Q?Xjrs0ArlacOZCPnHmDwaCwTNyLcAMxItmjv0Y/emsjbzX7Mcy7Dw53hHGHPT?=
 =?us-ascii?Q?WBxKNdAJzzsmGEJL2Bp/ApyUHn9oB2oc4UYBoaNWb0oaI0F+lbu8j2gg/glG?=
 =?us-ascii?Q?4GgJE2tiFOxIPkg5Yszv4a/LlX0QRV2ucQUy9kujLk2recqYuGeaMwg3AbZ8?=
 =?us-ascii?Q?C4jCDI2jgfaVYpQnPCNs1LhBg9NhkjzyP6vz1iYzJDTev7E2KMEK7VK5UIub?=
 =?us-ascii?Q?YoKo4YqRpcQqdW4cwqnaBrg8RXVFOQ0rLfO+/0KmBulTL/QwDadcEMlcU9ou?=
 =?us-ascii?Q?ehInHYeQ5hAaqFSU3qL0w+lKgHedBH/gEQW5spuvdzfFFKBFexIxYKrFOgAP?=
 =?us-ascii?Q?dswi4//aJByBeLRZ4ru8LmWOxFVv6HFPyK3eI1SU0re0MP4lGay4fseq0bZ5?=
 =?us-ascii?Q?DIBy75JyqExr60LpBg1rbLQga1vl75MAzbm7v13GaH4sgf+MbVHSbKhq2jHC?=
 =?us-ascii?Q?P8A/mKANUVFoc8CY1z2HVhmgtHyvuXTp2qKo9SMW8i+fv5ko4opJT2vK0/8h?=
 =?us-ascii?Q?gr4rcjk/7dGIo5H9T3dlhAhB0qg0Qi6R7S6pWWb/key+AYpuwgwclRBu58zS?=
 =?us-ascii?Q?NRgpns00bCv424TMS+TZWknqWsKwepqjmSnCP9pItnfV5hCaMbrc5MGNqce1?=
 =?us-ascii?Q?nERHV2CUvpPNpkSZH0FCU+lJLG6L9G7Eo95SK98uxhmx1k6zTGDpYqHbRruy?=
 =?us-ascii?Q?yuJGPGTJShFTtR3ofHnocKze7BbIUnLQCLJHNYqp7g+83VxM77t5jPPQ8VxW?=
 =?us-ascii?Q?txq1YvSfKO44YknFWkTsXIadKAUBCPiuyDo2O3QoSgcIMJcajDe/zWHvuXhG?=
 =?us-ascii?Q?No0yU5m845a4ejH+2yrW8KjN4g9V5NSP/LSS3thS4Xo53BI/e1OezM85zDum?=
 =?us-ascii?Q?QkITjrhWVXkbnecDZGUc2Ve4QUSyaHC1fGMWkle0n2YSA5DeSzhMZYLreWqT?=
 =?us-ascii?Q?J4GWdIs7856+clLsRSnpYRik0OxAvhDnOmTBPsEaSJkUGHVWV301fKu6Sr4g?=
 =?us-ascii?Q?k5r+pq4pHRjGGpfPdudolIn34ZzzM6sqcOwZk5l6dm/H8/41HtQg6JpyqRgT?=
 =?us-ascii?Q?WZbc8mnsmgp60HVOmM6J3oNl41tZMouHAa1LTiMFZbT226Tsj1aXhVpvHPhy?=
 =?us-ascii?Q?E3nGsh/yyQetYTCLR/z/rvsuE2egi0C0pGdglUlSAuSCmAJsRyy3by9dnNqM?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53336a0b-47f5-4c68-a16f-08de0b43be80
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:04:32.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktpN0n6/+7KKCIbFR2jzOmmh9Coi89IxwRnmvDARjJs2fs/ddEYAMOvuQHSQfN/ojpj8dv6xw/LbDuZJ4DxtZFgqDefiWjjj9KBrmuE/ecI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

On Mon, Oct 13, 2025 at 08:24:38PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> IP version 35 has removed "NOA Enable Signal" bit from RPM_CONFIG1
> register. Skip clearing that bit on unsupported IPs.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Bspec: 62391
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a4894eb0d7f3f..f901ba52b4032 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -837,7 +837,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>  		xe_oa_configure_oa_context(stream, false);
>  
>  	/* Make sure we disable noa to save power. */
> -	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
> +	if (GT_VER(stream->gt) < 35)
> +		xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
>  
>  	sqcnt1 = SQCNT1_PMON_ENABLE |
>  		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
