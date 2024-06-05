Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD3C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 16:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560B10E208;
	Wed,  5 Jun 2024 16:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSuVM3Ea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763710E208
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717604441; x=1749140441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=00Ptye9aI8ni7LcK81UYL7cnijaaf4hTWkxpbDvDsTQ=;
 b=hSuVM3Ea5GexSu4Tm83FiPPtWjSY6IoMQlXN4xnaX+CqQslwVWbg887k
 K5zTP2vIrXbL2H7xxCOSLWSeRqYQIpbkAPtRSBwzuoKQ2jJkfPx9g1PKv
 MjNR5BxTyEu+GHQ03l8xF+4ojFBqWRr/y+mhXsIbXymzwZC5IyvRMJfEN
 cAN0nPXByGPu0Ltmt5GRH5+c6YJEkoVrvhgObU6Z8D3wHKQ19CgAcAWV4
 cvjvSQdFGYM9iAKPkGFpL2GlPRPpPqTWGTb10VDgSID37F1LrJ9i06LxS
 Jwa/i6rvpFsm/7gsP3xvp0OIJw7M5R7sl1QiafsYvtVE+v4PsJK75LkUm w==;
X-CSE-ConnectionGUID: AXrzmkEcSBundZdVLtArtA==
X-CSE-MsgGUID: YRF7x82USC+DRq0AGZAwDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39631816"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="39631816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 09:20:39 -0700
X-CSE-ConnectionGUID: VGgXyLfASlesNKXhtLQyqw==
X-CSE-MsgGUID: Gj1uhS/+RfmYh7vUtVBCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42105575"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 09:20:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 09:20:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 09:20:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 09:20:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 09:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOXlgn6xSGS9GHhDKzC3G/T+t8WdNk9W5lZ78tc6tSiCf1iRi9FuRYhQBLkpCwnDAyD8+V81p3pbl1yxeZON+fLf2WgMAWxy4oUNPIhFDZ6BeYiUcILKipE6hcIuHcKaXnqkdvW47q+Z0MX71Uql6jsBKg/ELqdn5DYeX2Y5ShMJ/u7G5Gp+EUrto8UQMp+N4tuR+CZVI4SjY7U5fXCq7a/jIXiSi9ZDtumNPV4/ZsNqU5s4RZRwsdb9d044qvP/AnbWsN4z5/VnzBqD80KgqlC1IPAS1fJC4nkksewvcnTb2HtEqrsxYBdlbA2/ms24yjofNi53i6r1/V6jD1U5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRLCEqYW3mjtScSZ95wtnSBirYewXe5rl76BortQAMM=;
 b=aJbEcCrGBhHgbwMB0vDCQMYa9/8SbA8m6+H5qQR9QupCZGVsUTiYByQBDVPML3HCXqVxxJsxTNa1oz9K/Sszpo/qqtd05HOkgQDD8CEDWmLNflh92SK8Mt+1Agp+QV6MYUozxEUv5MhJiGTiERRX+gJzE5Z+Zrhm8cf/5pszPODLGeVpnGpUsjsDl/r1m+O7LPBmk7cauPZB+R6L6nzem9sngUh2kG+MYmmvtJ2a+M7a5I1eFEg4z0w0DEourmDHNppUsPFHyjla8gLwYZE1+R98UQcQg+8lMarSTJYVcLLuf6M68tsnJ6KG9wQGJvBj9LVZGEDkWKJlbeeUatdamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Wed, 5 Jun
 2024 16:20:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 16:20:34 +0000
Date: Wed, 5 Jun 2024 16:19:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <john.c.harrison@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <ZmCQIEcu+AcJusXV@DUT025-TGLU.fm.intel.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: f2699c73-28de-4fa0-6bbf-08dc857b6da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nq+u7hXuTfSg2hHpelnrSjdPQWwBUwkz8+KZU6q3w02omcjDuXPlBUcMXKKO?=
 =?us-ascii?Q?Zq9Hv2qhYikwL8zCtI1cIKi9NUZtSC07uel5C4+Zj/xquGybNwXlQIiEdIJY?=
 =?us-ascii?Q?TZBn50Lji0IMJZCZCnSsDblVDT6RIDk18vIDR1PUFyvU0nQur679zeptbpR+?=
 =?us-ascii?Q?F1XqbYvKgipTYMNQNeJAff00L7ZJuilM6+xJamYwpA+XCsuaV4ZLNDT996hM?=
 =?us-ascii?Q?ybU77uEU9TrZxGYrXcPGNuYFylk50wKG3RUGzX8dVexdYJzBYw7cBp25nr1l?=
 =?us-ascii?Q?KQYSKpOqSMWj2BMNzHEkiTN4m78CTdAUhWhdFSaH8/0luilRKbWRTKycZ3Ov?=
 =?us-ascii?Q?V9bQEqMyO1aeQa3R31oNPBEoIoHML0J54oZ8pd4EEuZZNIfRUt9++ZwAJDsJ?=
 =?us-ascii?Q?NX52PHJEO0YopCAkdsIErcQkAxUZ5KUvpVN1MXAN90QlEcUzdEKNPSCbKX1a?=
 =?us-ascii?Q?DVVYBX+8z3BaUf67N+/gi+7flQHK0nXp5sOqnbGWxi+CigCddJXAAKMNiNc7?=
 =?us-ascii?Q?jlqlIrBZCfdX/jv26944H0ssmWrgYsUi8wodMsIo5VTP26CSRVc0OHBHprYs?=
 =?us-ascii?Q?hE6LtmXA/NriYs6l5bQ32IfdOZNdettf6D33EZZ5MTkIhV2jI+qtuIqf0HK+?=
 =?us-ascii?Q?B3c1AUxqvgEVfyryd+ovwArXoPUorzrGUJdt+CMEVWmjtBMTGAOU6WHGAdEk?=
 =?us-ascii?Q?uB0bxGB5eCcQ2HNzW2bNZpkJq3Q1wFmwEYW4me7zA83ibsCr0nnJlWEPDW+1?=
 =?us-ascii?Q?pmKxk15mNXULmjqUNHF6oMKO0N64/MRAFKTVeHRrmB/R9myf9Cju7g/y4SHT?=
 =?us-ascii?Q?m6F7ZXpgsp0lGfVmGI/2MJ/9cif/5rVZgwf8aiG0YZlzhL8PrlBV5hGXpv+z?=
 =?us-ascii?Q?m/N3lUucZOuDHfTuLpDX966eAmSsznPZ96yA6vg5vrI1oJy3Q00yYYpYXfxa?=
 =?us-ascii?Q?FSEvR89UPj35e0qHz/VTZ8aCf+Yqqsd1tLi8R7tif8es1sO0hMNSvBxPD84F?=
 =?us-ascii?Q?Es9XejJgb3YQDEyNy5zWQUDsdhdY9BnMEPHMbdQx3MU/tas1OTn6ujtYg9J1?=
 =?us-ascii?Q?UUEoIwaZWevprMuSZBvRJ6I5nIRUEsyeq0BCgRQs0k4j1wjuDRUDrBCjtx9/?=
 =?us-ascii?Q?ZU5Uq7onn0094YtODqdHejWISBVukL2UtXvCYxU+V4EO/Var0GFR0unyAAAl?=
 =?us-ascii?Q?scWjKqpKpkrAh7+CVLSk+j5wrI3eo6KSGrBwWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmvH/oOvw8M7Kg3u23Ch1IH9rIfP8LZpbOTXJGdOhjlcn0lKJvvE14Bs2Y3k?=
 =?us-ascii?Q?0F2aHyP0F/7MeyX4aUTOLeI/G6Z3sHuSZczsW5YBuTj7s6d2PSMnqmGyrcJt?=
 =?us-ascii?Q?1RpPHQk4W8QEGtwis7wMkFNBe09fAgOkAd+fcoIds/vwf4jQhP9GYPnoJaqf?=
 =?us-ascii?Q?X1iJjLwtU4yfeB2OnogZJO14WJOpwqJJv+jbtuEuf6GwWzUOqNamQ+wJrafR?=
 =?us-ascii?Q?l1tIY/AYYdIo4n6kLkbSgQLy7oywqxwzUH+DrIaY5OmX/co0Yh76WoQiUvCM?=
 =?us-ascii?Q?Xk0YUGbhBzjY9otBcy4sbVrytBZjx4z0AfTZnCurQw2AbbtrHkghj4l2xiGS?=
 =?us-ascii?Q?TtD6U/iNn1MnMP7r6tY8mtMGSPUjyK1sqf4d9UcmuySnYzLfYPqgZdjP79nu?=
 =?us-ascii?Q?fptDN7Jvi6JLDDpjvLaQhVixzpNJh2ul38EZxhjOvVxOSkCpqunJfJaMcBji?=
 =?us-ascii?Q?9e6vahGcUlpg3uEhphEpQcl87BPnc3LT2543RTYRTSy9u3C+MEf0pZ3ahZ3s?=
 =?us-ascii?Q?zGlP67gRS+ST6PxG7+upX5EGsRbSMl/vhuKeKg6N9pAnHraWJQan2Wv+LJ8p?=
 =?us-ascii?Q?8AM1x5MgKI2iUllsaHsWUp8Eao6A6HbN4Ex0f9WBt6hp+pKLIaWrep1ZyAbI?=
 =?us-ascii?Q?YDBiBZNblxyrdlN2bq3zYKfMkElw4wlHkYczl6Zhd2OaciO4NalcLua2FxR2?=
 =?us-ascii?Q?4SgXPmk1x7juv7foCmOQRqZkuLrnE9SILZHgZzRqZXGOnrQR/JD9s2GtZqVh?=
 =?us-ascii?Q?sxeLjyQ8t0s48cYrbO8g7qyircvI7vPGXZPLH1Tg5hDX6RtW2/fKQCJg2xj1?=
 =?us-ascii?Q?J4EhDeoz5s3PYI4rm0c0QyB/CHcpsCjP5gaOAVJMHcTOsBtYdROYTXYvm1bC?=
 =?us-ascii?Q?0kVCn+KAJEjhH8TWRPUxxUt6I7g3qE9wYrmYNHW/8x1pqPBGhyX3Z/z+2HAT?=
 =?us-ascii?Q?ryMKvAYfLm94/TP+3QxCAp6W2yxNLZU/WvI+hxyQlR/jyX24BDvh1u8cAoGA?=
 =?us-ascii?Q?JuexPhqlZCmFeebHV1CEa++b6ZPaYjAM2Kvb9mzP3mWUIgUZExgXGXGeH3ck?=
 =?us-ascii?Q?Ri09I5siUwL54JV6fA6NSaZT7VznKC/JTW/3GiLw2W1qlnufSpuZx83pzHk8?=
 =?us-ascii?Q?zsiQazSyEPvxziomH9lzedoOe+8b4DWhw1OPVCqGPTuFV3x+FtkKhIRhzIRu?=
 =?us-ascii?Q?1WxyeofMgRO4+PWFwDuMTOhA2F3aSQ1ehuWcOWPm4dlmbqceM+gsdpN/TPgT?=
 =?us-ascii?Q?g8Ouxg/r5nKnSgYS48aCMFuvmprxxdGTOmySvBISFaxI4lIIP8Cu+GnkQGI6?=
 =?us-ascii?Q?xX7z+jplJITSdUP2J89+x3swbuqLMMjkGPGb0aH0ha8f8oe7Lqt3nVNs11XQ?=
 =?us-ascii?Q?rFYn9iR6XzyJB/kQDyrpFgfb2sDp7WWabtOrcOmiKouI/yp2IuWWEVhsB0Qc?=
 =?us-ascii?Q?vGt1AeWQmPsJjmI46rL8xbj7Jg2hP/6kxK7+wvkyZOJxA2/+P43TT6GsQzDV?=
 =?us-ascii?Q?5jQ4/SgN2yLMYrUqhOjvTBtgtHgWq4VTyeWS3dqk0JL1AjxbX4WTi4AM31iA?=
 =?us-ascii?Q?KRRDjycZuDr9e4kUsloiJUwF0rdUxSBFSy0vvkUPBO8zAh1ITpngSTOSKUHO?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2699c73-28de-4fa0-6bbf-08dc857b6da2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:20:34.7603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvnPYm+F7uXwkzbR920nUycJdLm8yWwt8MIdUXI2AtPoRGX61KTcSCb3otnocL4XXiDRPMKxn5GIY9D0WuBv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
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

On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> We currently have debugfs support that allows the userspace to initiate
> an asynchronous gt reset on command.  However, userspace may also wish
> to wait for the completion of the gt reset before performing any
> additional work.  To that end, add a version of the force_reset gt
> debugfs function that operates synchronously.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Longterm we may want to switch resets to a single debugfs entry which
accepts a write value and takes actions based on this. I am ok with this
going in but something to keep in mind. 

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 66f897a9b6ca9..5e7fd937917a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	xe_gt_reset_async(gt);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	flush_work(&gt->reset.worker);
> +
> +	return 0;
> +}
> +
>  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> -- 
> 2.25.1
> 
