Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE14CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 19:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5450D10E14E;
	Wed,  8 Oct 2025 19:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gaHJ9QlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7C10E14E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 19:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759952990; x=1791488990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k3AOBUMFyKbJpbmmzvGEdeqqXeez7UxyGDUpIAM6NOA=;
 b=gaHJ9QlAICy9nOUrYrrS7cC4fsMhU4tJA9P7YEz7pwSoq1ImlTbj6yP1
 Jd1TE9BlSPrkJprp4/mo94uzT4Brq/4dQVIjzzTPzcbKq3hPghDZEycml
 N1kE1M+c/GJO2XHkYIPXeUxrF0OCMEO/pfilqBBBMsnAW2qKgWncWaiD9
 i4MKCVqlyxV9yTowNfP08xQh2WzLrpUbDMu19T5noaSeTjU6ZC68O/Gfi
 1eeQBdtA3Xv37OlL3b3DeBanUYrPXsjMDo6++/VUdOJClUROUAGrUjRJr
 XDbLPl9tXL0OW40VCKz31ulPMcU9aAmPAIpZeNMNnbPmrIIXXw0BUCfRj w==;
X-CSE-ConnectionGUID: WC6NJKQSS3KW60DVba73Yg==
X-CSE-MsgGUID: G9vksPk4SfyLxBaCg/1tyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73503523"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="73503523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:49:49 -0700
X-CSE-ConnectionGUID: vlUM4TSQS++OrNjKDYR1RQ==
X-CSE-MsgGUID: b8q6X13zSFCrQeECZZdxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="185652999"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:49:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:49:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 12:49:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyqLEk6LJK/ZccEwPeS47G1jAPyazFMmStohQNsZYU3Jfr3+WxXOw4BlUhRvWBateaIdHYBH/pszDpI7g8Lz2nB+945nMSPZXNDFrybm9ojGH8zw/6EupkFbK6AioJrEeYJiP+qMrIrcns3oFAU4CikU7wVNaH6ldXd3486C+wzVoQlnL1pD/2ZVEgo4E0X29kdlnaKf+xRBjEKpiPXC98T6g9w9KoFyWwGOSWHma2FkI3vLZMZyyjjJLYdEkYZTB5Uj/xlD/oVb6fMnaOuX53RsN9++e+c305TBBAq+t8GjPrYAD/HVK8G5FJ2nvcqIPqXmzlajiwGU9n4+2sxd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8NEjcTP55Y8fUTOITSaUnyA8jt7SIOixXguXFrNBiM=;
 b=x10oU+Cu0BgQjq9uzquqvqmLNtyQmTto6XesrBHREfcTEEaIEO9vx6w9RoInI1dyr7+kb1brh6+g/VKtc1gSjSt5fseGMnrXsFgotGEYJyUFOrO1scHG3rDwfQiL0IIXJd8Wexm1pkllfuuZvfUExJVaHDdvi8TCWNILv8fOp4M5qRe/lGnYN7sp1DM7c0h1wfWe/F75ooOHpt892k4GCmscff7jWt5AU98KfTwNWgvG87i/3q8BxN+lsr3waa/cmFFsMM9NNR9Q5J4/8Mzg+pjsnH3ZarRy/mC8C/FZlz/Pn7BXitZHUWLpSIfC0RjE5P+vERpIKFDiZziNMpzpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 19:49:45 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 19:49:45 +0000
Date: Wed, 8 Oct 2025 12:49:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
Message-ID: <aObAWeSKr9iMdtq1@nvishwa1-desk>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
 <20251008180500.3261209-26-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008180500.3261209-26-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 059be813-d3e7-4ae0-1066-08de06a3d4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xP+Ch7Ug8wTQpLqJF82MiZdnjmdf2TyIAldDvOuKsTcGzIAm/8lsNb5V7Wmn?=
 =?us-ascii?Q?o184o1n1YSfn/natZavmhVfZS0qO9GVNt3Jgw0DggsDCxmt01WxQXPei3k9l?=
 =?us-ascii?Q?28hMLa6MKkvEtitV57dsK3Ex+UnnNfxP9afa4tZrvf5phOckhC7IkXehYlFd?=
 =?us-ascii?Q?w74LGv04s9rbItGzYYeu5WHKyOSZMVyENZDFzOfVRzR5QrN9KbT9gDY7gClZ?=
 =?us-ascii?Q?/N30rhxFVVSJLpx0mr9KvCXAHNaXmW1VffKC/9hh6eh42MdaXk226/iTwjln?=
 =?us-ascii?Q?WqxYVNeM1tKe0Q1w63ORZOrpi4DVy7aycsfAj0RBreeoWoXlZmRV9bGgb6e4?=
 =?us-ascii?Q?3aTTlFS/CedgqxSQlWh57+5SNtUu4B24JXMpfRhQiOyN4yN5r4Q0HLwwySzi?=
 =?us-ascii?Q?gMfgkp/8AI6glXNeT0kiKAghBn6tE4UdCqC8RYMn76V55zkBFRT51CyNohoj?=
 =?us-ascii?Q?weKnfw2zUmctpejiCNd/l1YQ3m1cH56/E3fxRwQo/ROdUAdkSodWq9GuyX5H?=
 =?us-ascii?Q?FGvVeA8GaDrkJhoBrVmrsqH3TDKbT/gxFqXh1DH3mqLGWYsf7baUn11LJSSA?=
 =?us-ascii?Q?jyn6RMSF9KFEtsJWvV9Lg/DA1bwhvEywSV+Eo9+k2/HFYprlEt4LGlbTAB9q?=
 =?us-ascii?Q?9q1d31R0QTSLHEqcSSPl9+xTOEz816JemBoKlOTisCS+VWDAMhGXyxC3Sw7w?=
 =?us-ascii?Q?o0+gGM33p4zpUxFPcklWrwWODbF/wG9VWEuQwjBL577KbGNdVTeGVZapC5dV?=
 =?us-ascii?Q?vFRE7nt5DcePBHAhOk96xbQP/B89Zz6edCnM7/zBavSCDdBIIaw3eM+QGyR1?=
 =?us-ascii?Q?+a7MHeMQWEcK/oxb9fUoQQUAf1Pjm+CEWsYWRaEgefdLpfcgKHKH7zEtGbuW?=
 =?us-ascii?Q?bBvEZumM4bBUrvDkvjvttqWh8rlDx88cnmdyirjS/BtHveNAJgSjl1rbU0cr?=
 =?us-ascii?Q?cKRUFcWdXF23Q7eJMPG5x6JMG8PbRRSKKTF3mRC27baSGWFoR/XmV8a5NFYn?=
 =?us-ascii?Q?fhrOESOqQgWb2kRW/accJV0hqEjuPvOFYergF15M8Tx74SQyWFzaQ61iI5co?=
 =?us-ascii?Q?gD8pruit0nf9WIext46uZHwldlJfUx4LE4uO4IpdajmTPiel5C5p00bRjjj9?=
 =?us-ascii?Q?Vd/7cy1ZAii5YzRsROXK8TJNkHcdYEgeSBV30pcexUp7hL0j5DDk0Cme0Yfz?=
 =?us-ascii?Q?iCZxFLcwckhaPt9uGEcjAjM4D6m+nDHPftsQVc0u20j3JURHQPyBMLdNmSPZ?=
 =?us-ascii?Q?1Y0Q+quxoqEQqkcJQlHwcE7t5UIdCir0fFN3eFOAYKkv96Qnn+mXjpr34XDq?=
 =?us-ascii?Q?r/e+Al0k9lvS/6lPqYsAirGOjhbXovfFTLPxGxLZDfYC7O974v9P2U3xzZun?=
 =?us-ascii?Q?R4YwA0r7D63vohA0vZiGpjuGjapT2/xAvt9K/F+us52wbyCjgOoxatHOpdId?=
 =?us-ascii?Q?b/+y75XhMKTlCqzvKtBj25tJO+fsc1v1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUD7p10H4lawoe9ZWlQkor2Im5+03bYHMJS3pX+BQPFMPAStoXBjUG9OAcNS?=
 =?us-ascii?Q?xXfIq/ShTbB99uxEyu/4xIqe3X+40xt5k/rpuKJFtoDCxis0Ywpmi//pBhcH?=
 =?us-ascii?Q?K43e/K9F/SDuIjyDGty/v0TBEShp1XyC2I1zNUJXiZMSzSB9ZVQue83UrNfX?=
 =?us-ascii?Q?ctjRy3cTrIBNStYpPrZJPkuAZn7Tp63W+G7YfGVtObzE7mWGjgTMPHoJ9xTp?=
 =?us-ascii?Q?BGOSDCu89OJ2Xn9zUSsNMQibeiAlZ862pRQsxdpIv8AxnzaqG4/yICrlYOnP?=
 =?us-ascii?Q?77AQ0dEWfUp9iZqMkX18qEzP19HVqDXCmgrOnLGLGpxRD7ldNev/jB0UR66G?=
 =?us-ascii?Q?62WmAaKpqq7Pe9jD3jpBFofQUR+EeNjtbUh4LTSwJSK+Kk6jSxPqHSyyR8xk?=
 =?us-ascii?Q?sgUvWhbY20ye+3Me3IhbZHItfFesRxl5ICVakNoFcA7Dlyj6czvylbegHSd0?=
 =?us-ascii?Q?yzcBgE0PtkXlgg4JhgM0CCrjORwi3Dz3xecXTdzEtzPBYLn7IXUBQtDw1MoC?=
 =?us-ascii?Q?MIGNDrdgbipBynCIQYk3SGLWJ5/H/fBVePso7Ar0WEtAq6CHVDRbvR7Nmtcl?=
 =?us-ascii?Q?x81Y9TbWDVHjUjKqMkt+uYgp3BZcFwiNMgMobP/8YfRhpIkZYDGzzDzA6wxr?=
 =?us-ascii?Q?5EJH6rHh0eJWEowEYkV0WyOqz+rmOL6ZhvImlP3wQw9/LMaugog/cpn4Fttt?=
 =?us-ascii?Q?m7sSiG/W3kkIZRjwj2gm4XGvyAIMY8ElUCH6SN1OZXTUwTGBKdszp8rnVRlE?=
 =?us-ascii?Q?/w/nmebTLPCOCbbh3U0KNnGdCmMsXb8FYIosDk5uhNvgyRC4Kr6HP3hlpfl0?=
 =?us-ascii?Q?UeG5ClFZeTfh2mEFIeNmQJK/v4xRXrHQK/XWppPRB3UsMwN0CxVknydYiOPj?=
 =?us-ascii?Q?XOG8cL437WMNRQAOSZn9fk0gj9roNUTv3Z0R6MA9wJINX6exN2jA01xLXGar?=
 =?us-ascii?Q?OZ+AfThfaVpl0zX/cEzkHWbBg8cr9EZqz/VAverPeBcHdn2qNqV4HYz+4BSn?=
 =?us-ascii?Q?+dvc1yli0nMzqzc743OMwmA0FzPH+5oUjL5OOjMF+2zXhaFK4pUTvRgGjaVC?=
 =?us-ascii?Q?sfHLa5TU+zlxa/SpCbwvEFszw/dofWkhPb8JOJezT9McU7Y4R6Kb7Qiw8N1B?=
 =?us-ascii?Q?/JCVtc6Yr4Cb2xm8svfvszBvb2koKie+kU+ocxLKlT7vEvWKDs/XpZD0HRRa?=
 =?us-ascii?Q?0iFakRW8IIYsNHu21Krp8ysdUfqN8hcouFYPS5CjPIgr6usuTyJ4tOecA7ol?=
 =?us-ascii?Q?r0+3Td/eX0mm841A/98KJJkW5v/Crtc4094raC+IWZ6BbaMoLxtnHQmUdtDf?=
 =?us-ascii?Q?t9BSmmHJPlK/zKncn4mQdFhM/U53GDcfVy12SwJQGfBQGDcVo+BMvxTVJ+jy?=
 =?us-ascii?Q?FHixH29pHIBspDr9cXJTg/BC/BontUtErNfpqgGR5J8mPQB8kHpxxDa9mfXd?=
 =?us-ascii?Q?AC8l58eh1pRUN1oyKbegUctCrQUURQlR652/A0ob9nE7iGeMNqnXMz3NuPbV?=
 =?us-ascii?Q?NuCHhRJvunDDr+u+uTUMURQFGGgNNdgYai0xBLkGJEuSx8iY8Ard67bYU0Yb?=
 =?us-ascii?Q?6DiA0dSwG19P2yPECI69M+5o0Pm8CUDTFxismNthwaOXmb0LY8w1tDZGc6HI?=
 =?us-ascii?Q?SO/Z5bEOcHAKauO/yuYCE7c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 059be813-d3e7-4ae0-1066-08de06a3d4b6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:49:45.3455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JyDXQlfhzGzBUy24MAsiUWodv0E8K3MQCAD0KVrXVjcppqSKGQGOWOnaq6AHjSBmXbynXPyLOUQbmkQLb35ot329ZZq5zpm69tfl2VAiR65TMzKE4ZF27smiTJrSeSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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

On Wed, Oct 08, 2025 at 11:04:51AM -0700, Matthew Brost wrote:
>If VF post-migration recovery fails, the device is wedged. However,
>submission queues still need to be enabled for proper cleanup. In such
>cases, call into the GuC submission backend to restart all queues that
>were previously paused.
>
>v3:
> - s/Avort/Abort (Tomasz)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
> 3 files changed, 31 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>index 68906ffe931f..fe66c2236ef4 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>@@ -1136,6 +1136,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
> 	xe_guc_submit_unpause(&gt->uc.guc);
> }
>
>+static void vf_post_migration_abort(struct xe_gt *gt)
>+{
>+	spin_lock_irq(&gt->sriov.vf.migration.lock);
>+	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>+
>+	xe_guc_submit_pause_abort(&gt->uc.guc);
>+}
>+
> static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> {
> 	bool skip_resfix = false;
>@@ -1194,6 +1203,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
> 	return;
> fail:
>+	vf_post_migration_abort(gt);
> 	xe_pm_runtime_put(xe);
> 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> 	xe_device_declare_wedged(xe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 7f0ea35f4f0a..4a45c4934dce 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -2098,6 +2098,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> 	wake_up_all(&guc->ct.wq);
> }
>
>+/**
>+ * xe_guc_submit_abort - Abort all paused submission task on given GuC.

should be xe_guc_submit_pause_abort.

Niranjana

>+ * @guc: the &xe_guc struct instance whose scheduler is to be aborted
>+ */
>+void xe_guc_submit_pause_abort(struct xe_guc *guc)
>+{
>+	struct xe_exec_queue *q;
>+	unsigned long index;
>+
>+	mutex_lock(&guc->submission_state.lock);
>+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>+		struct xe_gpu_scheduler *sched = &q->guc->sched;
>+
>+		xe_sched_submission_start(sched);
>+		if (exec_queue_killed_or_banned_or_wedged(q))
>+			xe_guc_exec_queue_trigger_cleanup(q);
>+	}
>+	mutex_unlock(&guc->submission_state.lock);
>+}
>+
> static struct xe_exec_queue *
> g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
> {
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>index f535fe3895e5..fe82c317048e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.h
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>@@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
> int xe_guc_submit_start(struct xe_guc *guc);
> void xe_guc_submit_pause(struct xe_guc *guc);
> void xe_guc_submit_unpause(struct xe_guc *guc);
>+void xe_guc_submit_pause_abort(struct xe_guc *guc);
> void xe_guc_submit_wedge(struct xe_guc *guc);
>
> int xe_guc_read_stopped(struct xe_guc *guc);
>-- 
>2.34.1
>
