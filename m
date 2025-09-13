Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ECECAC587
	for <intel-xe@archiver.kernel.org>; Sat, 13 Sep 2025 03:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6C10E090;
	Sat, 13 Sep 2025 03:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVWzgTHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD54B10E090
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Sep 2025 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757735471; x=1789271471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fbTuntznp17vGy80ey2MAoHvPvK8/F969VxIPSahp3w=;
 b=BVWzgTHnLr60MoN34nG/MH2TjXtSA/IICOkZPEF4YkHrU96uPwJgL7wL
 yPtRfhsyDJRRXS80bWk376xI6WoSosnkb1aYewUZ7YKr4OqPz7xUNlbKT
 jn0VWE6oiuSXDwgCs3yYDiHinHvvlQvgSuHSIMfrOfNt3wfAzbnHww4r8
 mzeMS8X9PC8jgqzgL/FWSYTb3vGgcu/tCK6InmJbqvNnpo5CWlsha/yk3
 /keC1e6yBSE0DbZRrJwTth6RFEdWDTx2yg6luDW0O1/Donr/2maiXZfb5
 SQsf51QGuiagJa7kCM9GXk9tkJuGGUxJaRGEpMYzidqU7IhGLJBRHW9J2 Q==;
X-CSE-ConnectionGUID: OVRuaVgpQtmboXVsLV56og==
X-CSE-MsgGUID: iDfzcftbQmqmSP92tUE9hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60139796"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60139796"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 20:51:10 -0700
X-CSE-ConnectionGUID: MPuNXgfEQpOmwWjEaArgKw==
X-CSE-MsgGUID: ZZuSyWaJS2mjTYmvt4gD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="174532950"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 20:51:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 20:51:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 20:51:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 20:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNNxicRcpXlAv05ufpBIkJeB6nLQqeW1uCCUFx8Dg7lwJ5qMXOTZ29bxcUybvTibRd8GfgnZ+wBzTE3TlfEqfTjKlSUvtdZjIoZ00X+Hn9XDdgWNWOIg+Hpx+UrnRzbvC1hiRlde8mNykHRIHRQzKvgkuWr8cg86jNEodOXyU4ApM+gJLywobXYPn+gJVbKBQUiwCFzrUTCBlhs4ZGg7z2JrENcv1ouVDVz2OsrZvVacAZRSX2Jagy9dlSop052cXrxaPWseBEZeM6bBZLcBa01z48oy7WnErXi7YSybTnOfvGbSF33wKoMGZN5fHybFdoWapd2eH4IVoVOBcWw5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gna2wP5/K25aGy2J5QzqehRb9sI4DrffTiTsbIOtg8=;
 b=oarB2c982JjdjYAymHBid05YCJATywUavyhwz6unVPX1TL6/d9VHKNR4WJ9MIddndNm1sGFqubDDm7d10B1DmmxBKQ7xsGaWbwtoFkPi1mN5HA9VYNChaqkCSGtUkHNWwosTwe9X6hOauk/vu5S5JuIW0Kgs/29gm9auuEeH3Ismp1sa4XsXCw7QTmwrFxxCGDe1dRPNj4KICviY52pY37hkQ2JItFjOmCV6VphgJ58TvJjsPSGRfeWRpvI5cY4qgvNiz6FUE9/A6Qblnc4ZhjuioL3nR2ZaIudkYSZur091t1bu88o4CDhlWD5TJhHpSEVFgvCr2dNxu/feV8nNbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 03:51:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 03:51:02 +0000
Date: Fri, 12 Sep 2025 20:50:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <rodrigo.vivi@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2 7/9] Add a Kconfig option for GPU work period
Message-ID: <aMTqI7Jr6oWR0/nm@lstrano-desk.jf.intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
 <20250912090354.2619418-8-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250912090354.2619418-8-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa40ef0-4b65-4835-2aeb-08ddf278c1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pVdOMhMpLkkghjEddJwD14iOCMg8HS8WPtmVI9BdahGFRVfHTDWEMcsZ5FVs?=
 =?us-ascii?Q?oJTwo6wZFgX14rldeM442CY0XzLIPrHNqkP1s5IHAwtQeUhJzeP+8Vc4F7Th?=
 =?us-ascii?Q?TU0vjp7Y8ykeX6ey2DyQaUFUpVeM2uw405BiMKCdVp1xNIRVBsixJ70oBKe8?=
 =?us-ascii?Q?UDFglWkuZ0Vfogv6px70Q3Z1JQkxrTduFv/2aGbtMVA2Ko54P3So/sbrIdCb?=
 =?us-ascii?Q?LLw2obXp1s6O+nLnyjfBu0Gmxpcfa2OsF6H3rjIuq+gUR+lFqnLNCfwKRyp7?=
 =?us-ascii?Q?JiyjKNjUcfPUap//5ub2YDIoCXRA6mIgT1B+uI6BCKNrPaIJca3lSJ0wSFoj?=
 =?us-ascii?Q?TXVCvea2Pw5yG93kClb6e5x0PLSyfX+AfmWqewU4Gn0SRE6hqVfaV8yE7TKH?=
 =?us-ascii?Q?uhMb1IiH0byKcBaZp+5zHiGMFNj7Br8Waz03fDqn0IjtsexAfpW7JoS6Kzzq?=
 =?us-ascii?Q?nDaeD0E6HNWYNA0752R/SvubAtsglYdwEAF3Km9cBDab7LanNM8lgROLjdIE?=
 =?us-ascii?Q?RKzTsfCSerGOL0wiev4B+lIrgBqg2r4MgOH776lDSN28MdfvtZHKf+7LFKA8?=
 =?us-ascii?Q?AGbwNyw34fk2MSRCrX39hCI/4O3+AuralKNIkgtLfkbooazSwx/Hjqv634GJ?=
 =?us-ascii?Q?QcSms0XQvJ/rCA0tHvXy+rCYoNvxa6ptQH8LQUPOjjZzWGgSDTihzTVdpR7D?=
 =?us-ascii?Q?5KY6y4c/R/1t01wDZuaDBJ7mhxWcXhCz/8zKbfGcqphabaIxZaFK1QvK5vp1?=
 =?us-ascii?Q?PUrQkCwSl0j2obqerRX1sXW0PtRCKQQVjkj9jvDbO/PpQSta6feDpbPtjCPH?=
 =?us-ascii?Q?Y0E/lLWsK8s6FY5mKXmX4Fex3EBdPsx9jQSxRjzr4j3aHybMKH+qzcpclVzq?=
 =?us-ascii?Q?imn1pgVlJ6FaBp5QMx2rrGhawxp6pGYiGG2ybtIX3GuE3g32J8ubeo9coG7m?=
 =?us-ascii?Q?xsk2zK/upQf4gYxVTkkXNbREC+gvz0ktXVY3syzFamc39Runr5cY9/R88U8L?=
 =?us-ascii?Q?aQncB0hx+znkrUQ8z0TVibgu3qF1XfuC+3bk5a3IyngE3gBNd045DWwEnicR?=
 =?us-ascii?Q?cOSLzHUGNdBxmbdreB0KGLCVoU+/X2N4qnZmvj+yChlQVkwk8NABMBXiSR6r?=
 =?us-ascii?Q?nAy3ZXSzDf01wZQJ0V938XQ87tPr6Tz+CznUOldaWD9qsPqg2unS8kqvvJMa?=
 =?us-ascii?Q?ZTrGnCnNN1LGGeZlBs1Ck3EKlxPm5iGb5HpAfvUNJaodaioEiXroGMwEoRQN?=
 =?us-ascii?Q?kZ1jwTB4I8QCCkt9eDySAfaZenifjIyBrbdPM6NnEJ93wtNfmaWEmVGS1hgU?=
 =?us-ascii?Q?wkNcjrdNtdosaQOQhrTqumuv/iLLCWmVmgUZGJWtO0wxIilE5QB/Acy6ZHuO?=
 =?us-ascii?Q?HWct4DvRCN+IdJ9i4/IEA5n3lbi1ONJ6PyLsS3GSnHZPZ3xAG81Vx0L73Yu2?=
 =?us-ascii?Q?l7f7r3OXpk0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?igU3YXMWVARS/d3m/VvdmVZThig1YzT+s7LTINS3fnQRQDSzwqyRRcR7Lihq?=
 =?us-ascii?Q?FpBN8L2ObSMg4VbqaQTwfUSmAqYqD/W9k2jJl2hDBzHSTYmvzCwTMV+jjPSU?=
 =?us-ascii?Q?VTNfXmLSumz4rEVIhHPy+F4uxWcK47Wnk+o83R+cRxF95bPh7GhpBNcBFpgU?=
 =?us-ascii?Q?U0OG3Ggd3Crcgrj1Huyjor62GDvrun83YYaIv+UDZUWkDQNAIGBiQPQ1rYP1?=
 =?us-ascii?Q?eKF4VrApNJYnTdYH7dJ60/3SL8pooga39+DWWUkJzSaU/PVC8MSHO1niCjgB?=
 =?us-ascii?Q?BgAH5Y398mrs2hjMvNzrfrjctqib4tQ5qF9bF7qKqAgSIfqjvnlzs+JHrcRG?=
 =?us-ascii?Q?A8s0j5pr1p0kAVQRAgPTxVX3ID7DCwEEQyZ9/ArW5WvYKnUnkDtQsqKtw1GF?=
 =?us-ascii?Q?0utmEf0kMAaGZDNtDxuC5I71QHbPrmz6tDtmS2sK93mh0fbCwCVDE9I9EFZ6?=
 =?us-ascii?Q?YpGkUneewipKPx1apwDF8l4SFFqmM7uvwzMhtEL6mX+0bZDyixusbsx8plYy?=
 =?us-ascii?Q?SmK2XZiY1I5FZbyYTQqH4VKZQrvjAKr+Nz2FNl0tiP4u8paFw5hqfLWJJtd2?=
 =?us-ascii?Q?8j21EIZgdaJBg78DWUKpPRC+2/oeoLEYZznCs5CzT6jkKHIz+YfKKHSvg01N?=
 =?us-ascii?Q?YC+KThduh+OwjTpLG5ppAo+56VQzXD+C109SIEjDjO779ZbOdVZEdTIU9DOH?=
 =?us-ascii?Q?UdxMTtPF+ScyS/Sj3Xt/z4iD7MUhnMwk/USNbXimqeJupGymdF3uS1D590gl?=
 =?us-ascii?Q?sNHgAlSPuopdTOMBXMw0ewnD1r1HmLya0O70s9I0pUNiGYPnJpxF3r+3B4vr?=
 =?us-ascii?Q?dT+yhBL3wkagvparHXHv4F3/PSyL2PkOdWcRioJsfF3F6hjxIIUZUnaWFldg?=
 =?us-ascii?Q?i4n8p0v8kcIvMHtayscC2OdZSwsOCkxDwgGdqJSf/B+eHzZV+YTSecliJPkh?=
 =?us-ascii?Q?BW2hOFs+SHRzT3iPZ/3j9LXj+RDF43BRoiDq4ivQs7D4b//42SRZM7G3kEo6?=
 =?us-ascii?Q?rO3mZqjipDeMwrPERYNkOMciswHVhSn/aUKH1xKRh6NeGbOQ3LBFOg2PYSor?=
 =?us-ascii?Q?LKuxrbbCncH1RwOGAlMGhNEiqLTCi/eElZNtrnvS+rEEPiVy5QRUh6mA5oMX?=
 =?us-ascii?Q?bbewLVhhAEuSLf6ojo6Ca+aqxpx5W/pmTUJvq38k/6J3o6hyjP20DGOYMvLn?=
 =?us-ascii?Q?pcIBJ1thMHXwGVpQ3XwX1l+IRcJMw/V9IGn9AVUeWxAmZn/7Zl3Wu0H3E8HJ?=
 =?us-ascii?Q?h0NFSr2VQH/B/rtvKBwpqxYok0KbuM2gXVIjYvPzz5kJH4k1uYXV4GqS2A5m?=
 =?us-ascii?Q?ttdCy/Lo3GLcmo0dD0suEdekAATGyp7pNYJipPohV71mQingM/mGzPOp5Ft5?=
 =?us-ascii?Q?7shUyX/KpK34zqxpJVOYEOb0BhyTlmKP3hrG0/glVFdKa0ovgOV5pehAxKZg?=
 =?us-ascii?Q?s6ey54fAKnPseAE6uYAoSLdTn/sprA32JEPLgrf4BhQmdgQrrkRXXMDsi9Yc?=
 =?us-ascii?Q?amSrd/yu9v8jqYFS7wLqpTYA7c6ex5QZxMIZnzHQXpAWVkIPLYeN83m8VuCR?=
 =?us-ascii?Q?nyKkGxylzkevU7jnsxJ86qPTrcEkloP1phvpAE/waCnxFC/y+SxvN7JIyJZj?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa40ef0-4b65-4835-2aeb-08ddf278c1ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 03:51:02.3543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5d4IA8MclCSGuEM7O2OPBxTz8Fsw76vc9OoExT0smYbw9MqOfFqpQ6n0OLy/3g/q+/bULNxGLwLSdJPscig6Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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

On Fri, Sep 12, 2025 at 09:03:50AM +0000, Aakash Deep Sarkar wrote:
> Since this requirement is intended only for Android, there's
> no reason to have it enabled by default in other distributions.
> So, better to have it guarded by a Kconfig option.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   2 +-
>  drivers/gpu/drm/xe/xe_device.c     | 116 +++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_exec_queue.c |   9 ++-
>  drivers/gpu/drm/xe/xe_user.h       |  13 ++++
>  drivers/gpu/trace/Kconfig          |  12 +++
>  5 files changed, 94 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 89212fc7ef44..9cc8743b8d7f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -325,7 +325,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  
>  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>  
> -	xe-y += xe_user.o
> +	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
>  
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_display_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b4692d45c7e9..569f3890bde2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -110,64 +110,69 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  
>  	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
>  	if (task) {
> -		cred = get_task_cred(task);
> -		if (cred) {
> -			uid = (unsigned int) cred->euid.val;
> -			put_cred(cred);
> +		if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {

Can you try to avoid conditionals based on Kconfigs in functions? i.e.,
Add helpers which compile out if CONFIG_TRACE_GPU_WORK_PERIOD is unset?
That is typically the style for Kconfigs. Anything more than a single
line or variable set I'd say stick in a function. 

Matt

> +			cred = get_task_cred(task);
> +			if (cred) {
> +				uid = (unsigned int) cred->euid.val;
> +				put_cred(cred);
> +			}
>  		}
>  		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
>  		xef->pid = task->pid;
>  		put_task_struct(task);
>  	}
>  
> -	if (uid < 0)
> -		return -ENOENT;
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		if (uid < 0)
> +			return -ENOENT;
>  
> -	INIT_LIST_HEAD(&xef->user_link);
> -	/*
> -	 * Check if the calling process/uid has already been registered
> -	 * with the xe device during a previous open call. If so then
> -	 * take a reference to this xe user and add this xe file to the
> -	 * filelist belonging to this xe user
> -	 */
> -	user = xe_user_lookup(xe, uid);
> -	if (!user) {
> +		INIT_LIST_HEAD(&xef->user_link);
>  		/*
> -		 * We couldn't find an existing xe user for the calling process.
> -		 * Allocate a new struct xe_user and register it with this xe
> -		 * device
> +		 * Check if the calling process/uid has already been registered
> +		 * with the xe device during a previous open call. If so then
> +		 * take a reference to this xe user and add this xe file to the
> +		 * filelist belonging to this xe user
>  		 */
> -		user = xe_user_alloc();
> -		if (!user)
> -			return -ENOMEM;
> -
> -		user->uid = uid;
> -		user->last_timestamp_ns = ktime_get_raw_ns();
> -		user->xe = xe;
> -
> -		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);
> -		if (ret < 0)
> -			return ret;
> -
> -		user->id = idx;
> -		drm_dev_get(&xe->drm);
> -
> -		xe_user_get(user);
> -		if (!schedule_delayed_work(&user->delay_work,
> +		user = xe_user_lookup(xe, uid);
> +		if (!user) {
> +			/*
> +			 * We couldn't find an existing xe user for the calling process.
> +			 * Allocate a new struct xe_user and register it with this xe
> +			 * device
> +			 */
> +			user = xe_user_alloc();
> +			if (!user)
> +				return -ENOMEM;
> +
> +			user->uid = uid;
> +			user->last_timestamp_ns = ktime_get_raw_ns();
> +			user->xe = xe;
> +
> +			ret = xa_alloc(&xe->work_period.users, &idx, user,
> +					xa_limit_32b, GFP_KERNEL);
> +			if (ret < 0)
> +				return ret;
> +
> +			user->id = idx;
> +			drm_dev_get(&xe->drm);
> +
> +			xe_user_get(user);
> +			if (!schedule_delayed_work(&user->delay_work,
>  					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> -			xe_user_put(user);
> -	}
> +				xe_user_put(user);
> +		}
>  
> -	mutex_lock(&user->lock);
> -	list_add(&xef->user_link, &user->filelist);
> -	mutex_unlock(&user->lock);
> +		mutex_lock(&user->lock);
> +		list_add(&xef->user_link, &user->filelist);
> +		mutex_unlock(&user->lock);
>  
> -	/*
> -	 * We have already taken a reference to the xe_user in
> -	 * xe_user_lookup in case this xe file doesn't own the
> -	 * pointer to the xe_user.
> -	 */
> -	xef->user = user;
> +		/*
> +		 * We have already taken a reference to the xe_user in
> +		 * xe_user_lookup, in case this xe file doesn't own the
> +		 * pointer to the xe_user.
> +		 */
> +		xef->user = user;
> +	} // CONFIG_TRACE_GPU_WORK_PERIOD
>  	return 0;
>  }
>  
> @@ -183,11 +188,13 @@ static void xe_file_destroy(struct kref *ref)
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  
> -	if (xef->user) {
> -		mutex_lock(&xef->user->lock);
> -		list_del(&xef->user_link);
> -		xe_user_put(xef->user);
> -		mutex_unlock(&xef->user->lock);
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		if (xef->user) {
> +			mutex_lock(&xef->user->lock);
> +			list_del(&xef->user_link);
> +			xe_user_put(xef->user);
> +			mutex_unlock(&xef->user->lock);
> +		}
>  	}
>  	kfree(xef);
>  }
> @@ -523,9 +530,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>  
> -	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> -
> -	mutex_init(&xe->work_period.lock);
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> +		mutex_init(&xe->work_period.lock);
> +	}
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>  		/* Trigger a large asid and an early asid wrap. */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2ee8a475f5ed..6a24463e13a4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -907,9 +907,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>  	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  
> -	// Accumulate the runtime in nanosec for this queue into the xe file.
> -	q->xef->active_duration_ns +=
> -		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +
> +		// Accumulate the runtime in ns for this queue
> +		q->xef->active_duration_ns +=
> +			xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +	}
>  
>  	drm_dev_exit(idx);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 80948199e743..7c30bf470aa7 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -72,8 +72,21 @@ struct xe_user {
>  	u64 last_timestamp_ns;
>  };
>  
> +#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
> +
>  struct xe_user *xe_user_alloc(void);
>  struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
> +#else
> +static inline struct xe_user *xe_user_alloc(void)
> +{
> +	return NULL;
> +}
> +
> +static inline struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
> +{
> +	return NULL;
> +}
> +#endif // CONFIG_TRACE_GPU_WORK_PERIOD
>  
>  static inline struct xe_user *
>  xe_user_get_unless_zero(struct xe_user *user)
> diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> index cd3d19c4a201..34f2e08cf1be 100644
> --- a/drivers/gpu/trace/Kconfig
> +++ b/drivers/gpu/trace/Kconfig
> @@ -11,3 +11,15 @@ config TRACE_GPU_MEM
>  	  Tracepoint availability varies by GPU driver.
>  
>  	  If in doubt, say "N".
> +
> +config TRACE_GPU_WORK_PERIOD
> +	bool "Enable GPU work period tracepoint"
> +	default n
> +	help
> +	  Choose this option to enable tracepoint for tracking
> +	  GPU usage based on the UID. Intended for performance
> +	  profiling and required for Android.
> +
> +	  Tracepoint availability varies by GPU driver.
> +
> +	  If in doubt, say "N".
> -- 
> 2.49.0
> 
