Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BDDD3F08E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D000610E1F7;
	Wed, 28 Jan 2026 16:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaBbT7kM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E3E10E1F7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769617468; x=1801153468;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YWjbzmy3slu4CGYyw2zy3NJOtCu9n9qQYifmSYyqoSc=;
 b=QaBbT7kMRRAPTdMW2aGKT8PHfFR4ycxUdsTCXKM4Q/SV0ceFqtirkUO1
 kPwJNzhMxUJvnWdSG8+1Jul7WF+/2EZ/XzJ9ZQSAj5N0eH1lJDnqd1ut2
 doaoi7tUU4hrxQgzusQFgA8G7St5D9n/K2FdDCmjl7heSK5NUWc1J+51F
 dSHMeIex6jGlgRuYjM0DSYmQFSUGATcuV15pqt3R3n/02hKB+nKEZVymn
 Y9bJgTszl2uzwAk5Q9W+4UESQ72vOUK8XLRDl9EhIfLPh3W9AyPfwE6kA
 PZzlAbAQUyJp2NnsGNRqGj4U1HtU42kH03n3bA13MGvrI2ATIflwWE28P g==;
X-CSE-ConnectionGUID: Zm6NF8IbSxuIBi+1mr2COA==
X-CSE-MsgGUID: TKlNXLoZTuS/fefiyjEX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74460098"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74460098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:24:28 -0800
X-CSE-ConnectionGUID: S9vBQV5PQ7+XgU0CpWpuGw==
X-CSE-MsgGUID: x7AukSAIS5WNVAVzAAxM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208745437"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:24:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 08:24:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 08:24:26 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 08:24:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3IF7hqxAoUYSveVLHMpjQlwo0nYwj2iG7zzZp5/rwyOHH7H0tnSJmPabueUFuSn0Of9N0RBT9MpfUgYlMGrQzfspmeM3PClenimIRcx+EEkP7G8Uu9SwDyjbxJrrupREByQDMR0N90m7Q87f6dvhtZLd4/Q+/1b4YZBjHs9wlxswIe6+wcwpYhawcDeg30HPBloMCRNY8rdKsyXAAfJP1M2+VzlDfR+OAba9NuabFpacWpnHze0L+RBP1XW1rlN0Gh8bCb+Aoc3M1z9w3vhSc8jozzlU15LeXa79kNSUosUDd7fKHRqmQaOwV+SahJvH1lHTFKhWTE7GGuAKuwlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJuVd0nPvaD/eYjEi9yrKMZRoNPEsVLECkoz90VH460=;
 b=tVeDdgx2sfBsPl8fUWNjF5NKS2jj/8VLkBjRjVx+GwMbLjpTWxCAcVnpUJ+urDEoV8ruwY16mTj5mmQwt5TpvxM3RQ22xaF86kEOLCc7HLHZrHMl1cPcxkRQx+pSvv1wZUXiQZL4MfE1WSpdLkMiz80Hfnl34dwNPkh790g0Ikl2NpS6tSFpdh10L5FTF1oqV010Xc1SAo5ge300Ooem3i96NMzYy/aNP3ZcDPa5l59OI95yvUepfcI/z+IdJh6XQJDjGQe6JBDcfaZMYecqnT3Rwiw/UPxtZjHGnDXYNE/mFY7MRNeIlwmkKlRZKR2sh5QNRsHNYeyB72DxXuTNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5091.namprd11.prod.outlook.com (2603:10b6:303:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 16:24:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:24:24 +0000
Date: Wed, 28 Jan 2026 08:24:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Apply WA_16028005424 to Media
Message-ID: <20260128162421.GD2174980@mdroper-desk1.amr.corp.intel.com>
References: <20260128062911.1456539-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128062911.1456539-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5091:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a643fc-f9c5-473b-d2df-08de5e89b2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AYKwa3vVob4Kw4WWDlqFlH7oxXFDT2UottfHIPDekoY0YdjN0MOAx8Dccm+a?=
 =?us-ascii?Q?UpBgVcwEk52np+GG0xplQiYtUeIsKLlGt6hEd2H64itwGZSwqCwYdkSWm6mk?=
 =?us-ascii?Q?JEoaH6vvWS1S/8uCM0zzXj6p2DQ69jY+aeWxnQOaZPXSRDEol4vbtXBjSPNG?=
 =?us-ascii?Q?VpSd5sZ52BO7VvqQS5ur1FcLiMbNOrLVDQHdLvhownoN9OArhLsYPtkUHC5u?=
 =?us-ascii?Q?e55bF9P/cZU/d5Lr7CNS1xftoRH420rTlbxY6EcduS51k6qeMTa3jpHLesnY?=
 =?us-ascii?Q?wweY1QFM8ivZxHldHdKqOKw8CpWqaEI7vpF98xA9LptMsKeVkP87EvpZ4Ii9?=
 =?us-ascii?Q?0Mq7iNPXyj8zzu6jRXxXEUbyvB7/REzCUC1ktGgXaT6L7h9kmZG93xwilFJA?=
 =?us-ascii?Q?171bzzO4aTHncq7PH6veMUpwZctIXU1YQDTwEcoVHEVHWo76nicc4jEUF4eG?=
 =?us-ascii?Q?AtnGfFw7IpJB8cj18ZWCT7II4PguopMw7w7mhNFjy3fY0zU18KAYuRSZ286N?=
 =?us-ascii?Q?4ae0aNu9WHX1265s2K/Oa0WEQ2jtoMrkZ9GUIimmxmtOpkKZiVGCi2lHi0AK?=
 =?us-ascii?Q?abGiP1OJ82wBlxQiAwC4E+xoM3/5gBbUiak1AtxYa5aQM6OZr3w3TF0dIuz7?=
 =?us-ascii?Q?U4fl6HTOs9oPRhlgwBt4kDDnlCamMYRpqr8gTrt+XVHcUC8caZFqVXgXQJeJ?=
 =?us-ascii?Q?Xo1JprEyGq1W9TyHKzgNzKGT0RWRKTSMF7r50Zij8LT39nvXIeyCk5VTwaII?=
 =?us-ascii?Q?fN58p5A5cJ/abTzgXr8Gg3JDOilj4HUhON/mLRyHqtlKDMI2mztWaVIe/fuU?=
 =?us-ascii?Q?GE0SrjLzYq4E7Hy1YWOdBvnlf+xeg/ak1xv6sxc949dZXtdSUA+472jOnboI?=
 =?us-ascii?Q?VEuagrBanWEFkyhKslJAcRFtNsuCJLIRVYmvscm5Y5xaabOskIhnex+L+G+9?=
 =?us-ascii?Q?nc6xesAoxouqaqiwOuWA0yEuOU2sRle9eie1iQxv7exBH990k4H1iZ6O/xgJ?=
 =?us-ascii?Q?8COk0Q8Aof8zM9+/1bIlc050la4TUe3Ikgv5VeNH5P/zd70Y8781XWLrfSos?=
 =?us-ascii?Q?yh1SMQzNag7uSlRimO2PbMT7FRgXviIDUARvScG/xeWPO3h68XHuKRZsaVSd?=
 =?us-ascii?Q?Q/Fa7ogct+bV83YTYPmM372e834gESa+5wHXuwQSwPuWRlwzA27d0yPWDtwY?=
 =?us-ascii?Q?jBxoDJ9Jikk1i1gCgUJ1T6cHCXcl8+00XI0DDRPWr/CLkfVgRqOl+1PlFA0j?=
 =?us-ascii?Q?ZoDbwapXkzDUz3pmlb5VJxOx9a/shSEdXAOrv7MnQdIG2Z4rYuVoBM/UzMwz?=
 =?us-ascii?Q?F0NzVTvpSCsT7y95o/z1lOAP+oyjSwYrphPnyhTQfXbtNVrMGAqE46f7RP4p?=
 =?us-ascii?Q?hPyXWuJxStKSPljTDpvWf1fz+gqaBsYh3RCgRo/IgLZB5QY7qj2Ms0NF9Von?=
 =?us-ascii?Q?Xyf5zVyNxk31i3TcMEKmf6z2FXLNljdT0anBorzo4Thh3zG3DdsGbycOtAD5?=
 =?us-ascii?Q?KV2EKWfreKwQBUCNJiZS2Ut/yVbeH+6OaAAx8wEe7qwwNvsRn9kYvsnJPOr3?=
 =?us-ascii?Q?o6Xj+b80hh33aF8hoog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KjNETlXept/SpeJi/x7JBc+xQhHOVyCipivX2SAmX70C/LuhyLqWXsiNbYUL?=
 =?us-ascii?Q?BM0BpgOs6B5NRZZ5wZDkmhUTYmRisfC2tETruWzILFo6KtyEv4vvMvH3GIoB?=
 =?us-ascii?Q?QWcopYraFsW4umUTEh0kJRZOsB4lX9j1oIeaS9j/BU6yA0YpxpjGl7P56wWt?=
 =?us-ascii?Q?r0Jzburk5MEJpR/gzHyoodWB8HK1T3vRQuP6133pESRQ3nzTgwXr56LSdrlK?=
 =?us-ascii?Q?01NnPeJ2x6HU8hDPGu2i/kSCMt+57h6NjQGOfol/e15Jk8YJuBSr+2qkDOIs?=
 =?us-ascii?Q?dEyUL2fkFyNiUrQBsol1WT+oOh32cDQCfLDoo/Ox5k0Z2rpKhA8hrMRCwjK0?=
 =?us-ascii?Q?B/GvonhyvBWqR4U4/mynIIfUl1s2QZqRtYRddPLzQSiZloNWNgNjITQYCXte?=
 =?us-ascii?Q?Ydl/YXtykS/oMgAz4VNQgKfR4UQXuJASkBQ0Xt5eVyyz8p14FevVq1ry42/+?=
 =?us-ascii?Q?3IGewubASWEB2ElajxNOcx65orNo2njT/C0oU0LQ/bjSgNInAQdZfjYjvXWz?=
 =?us-ascii?Q?0m/ttpZTsfQHFm2CXab7mpJKSLQFWnzUVrmTsp/r0k5H0/JWAMf1WHx2bRGh?=
 =?us-ascii?Q?KyNO7/hxPLnwsoKhsR1KNzDJvkvaPFDSEpOVrUCZF6LatfFLV2C7t+4rXTpe?=
 =?us-ascii?Q?Wt+AOMWvIobbA1EoHPhIMn3IiV7qx6n5TYejpnZE+62vKc/bYIspXH3XkdfF?=
 =?us-ascii?Q?ZIPl1ipqz46gScB+4y+gYSNfxatsf2jr0eF+xdgIZKrhZunaA6oxuwj+xEvN?=
 =?us-ascii?Q?zxt04avawpIa3rP3ED4DAhKi5qV8oeFQamBuAOk8HBQXP1q2YotZfuh2kK4J?=
 =?us-ascii?Q?pGZ+rZRyMakCabLf/j8KSpkSp24CwGIDOCc5YmbvAwLsm3NqqaWfuAMX1edd?=
 =?us-ascii?Q?TXRHAMN1EDgUg2Xk67pXRHUjlvn84W+gnYeUkpym9ie8j/5L7kuv870HsSSW?=
 =?us-ascii?Q?nSDOdB6uAEAohCUn8Xw5VMFb/1XxZ9+eLUNcvhEcExP7TSgk/dJK9+M6U2vn?=
 =?us-ascii?Q?aYJlDl7LftLsRSgRfpVOR7hgjIehKBNHD5vpZ0dm+yj8mJpptI0mSC4o92gO?=
 =?us-ascii?Q?sUE/Mx9wmW3n0lrXCuez929xCvKCL0EdjSa4rQndsyxViU8RPxoViOuMCrAE?=
 =?us-ascii?Q?/Ye9EBSTJFp8MM4nAYVz0mEH91SGAZr6BBlUPBA8jcyLQGtrKdUzOV9HCIpH?=
 =?us-ascii?Q?V5nvuJk8d4ETZYFoBNmyPa1uMGjyFmatQfDmqplE14P3bDv6Svxa4xkFBxmg?=
 =?us-ascii?Q?mx8tffZHdj5iHWyxo0tcI+X6w7VaAuxkFs0FoNYVVW9yDREl4vzaBWb68dtd?=
 =?us-ascii?Q?corAjKsVJYYsCyMW7PHEtHUFuv22e9rAe0c/Z/m5LE75LIcll0cHjAGPdqnc?=
 =?us-ascii?Q?vRqS8Vh9fYBK73fY0sf3sMXT+gLj4vkMqbEF87KSvEa8irdhXJwcZlyKJZdB?=
 =?us-ascii?Q?r5RBzIPzjigHpJnYYP7AE2EG0NUzoWMAaI/Zp9/+KVBWiRa7N5OhCqNh3Pzl?=
 =?us-ascii?Q?q7JqNJ6dz9zrZOYUYkh3cqYBz5N8/SKphqz/wZIW0eZF09LRpk3dANjZhKWk?=
 =?us-ascii?Q?Kv6J+g4UJvscd/s+2PNCTNwhqScsw4m2U6BC+XktmeiIlSfLnHcoHFc9y3ZI?=
 =?us-ascii?Q?M3kqKAD5yfuLUW0FOgv5FXecRzbmsDpF72vSR651ikdJBJh4gpPidvOFLnAQ?=
 =?us-ascii?Q?0YRZGoFKZpnQYStksIDqNl+bSOeFnU5KkY6PKRlkxgpF/2s4YY1VI+Vf5o0p?=
 =?us-ascii?Q?5dBEl3WYlWau81cYZ8l/SY4b3WzQdV4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a643fc-f9c5-473b-d2df-08de5e89b2e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:24:23.9864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pql7sZIEzE7+0Q0WCvaHa8G52ABjp/WIUb6lEb2J3F1Uo3wS+8ZURZ1ZUp04LiSpv6Z6+aaxzAl9uBAg1vmBj6NHmFzXFcui3npXHxzAeoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5091
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

On Wed, Jan 28, 2026 at 11:59:12AM +0530, Balasubramani Vivekanandan wrote:
> Apply WA_16028005424 to following IPs:
> Xe2_LPM, Xe2_HPM, Xe3_LPM, Xe3p_LPM
> 
> While doing this move the same WA defined for Xe3_LPG under the comment
> for Xe3_LPG. It was wrongly placed under Xe3_LPM.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> v2: Move the WA under the comments for each IP (MattR)
> 
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a991ee2b8781..1e8d61ac581b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -236,6 +236,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
>  
>  	/* Xe2_HPG */
>  
> @@ -262,6 +266,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
>  
>  	/* Xe3_LPG */
>  
> @@ -269,6 +277,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
>  
>  	/* Xe3_LPM */
>  
> @@ -303,7 +315,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
> +
> +	/* Xe3p_LPM */
> +
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3500)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
>  };
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
