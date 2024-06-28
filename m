Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940FAC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 01:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C210E0DF;
	Fri, 28 Jun 2024 01:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfSHjmba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDEC10E093
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719536432; x=1751072432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jC+cINeWS4i6S3h24AOzQ9j9l99Nomra7TKz7DV77Ns=;
 b=LfSHjmbaJUJvz5PB7HU650DnzUW3V0cb2wj0a29lyiociVxGBMKPndaD
 S5da2+xvdTR7wvOgN6smYPgAFYTEB8mjiFMM4O64VZYxl5UEzdZdF54aE
 kR09w8nh4hEgtXzCe9jMvr9mXYjDGzAdLpSPm/HbfHa5pRKmoGo5I3Amd
 afkKoA4APYeJvgbR5pCUtfQ2N+H5smwjLpVu4sAaURdG8RowHNeE8nLvY
 6g/OnklAtAJI0ryzLAn2hAqzhY2zrNrZjF2/keca8XlWzt868fKAZVoAz
 q5hCQ0wFU4kvuIZaLzRTCaveqC/2DFyhACn9eqm1tuwaJOM0sJwSaMThl A==;
X-CSE-ConnectionGUID: 1KYXjm7LRYe8zjzHf2GzDQ==
X-CSE-MsgGUID: wrUFXzR5S/axSmxN70mVSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28102299"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="28102299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 18:00:32 -0700
X-CSE-ConnectionGUID: qnE+so9MQtiPWauP1V96Fw==
X-CSE-MsgGUID: dfO3lNruQymXbPbWgUbEDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="45208078"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 18:00:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 18:00:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 18:00:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 18:00:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3JmljlpQ9va29xpKkquwJ/5pW47MVdhGUxjiHUO/S++xG2A+JNYhoBwOmWcwByTfOiqkbbbI6eE1qZJ22lOJZIWeeixKMof32dW3cFVhE/R+Bbzz83k2tMWIscgc/5N2D0vnyAsaIJ080qAlN9JoJQlC7m5oS85lkeFxlOsqwg75cCGWQHItZOoURgQcRwkBuPDD0xOjxjTmGuphYj78Og4sYpeC83gN0QejxbEu3KkvsYsmIMT6bEeBIRRDqnLSx+KC68JBLiyCSK8oaA50xIS28sEiZDhRzVPK4RxxfnQfa4El7E7iCUxt1iR18Xnr5RPSdQXSuTg89EYuGguaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qLKF/oYU0Uk/dcul9KDQ4TL90zHqiewmakSlVPSPZg=;
 b=Ij2FaL22NBZUZHpzZdbLh0UZOLsxtcVSyoJ+XrwnDOTRCzP2JVT35+oZFUA764Z179JQf390fC8GDX3q8mCveJxkJg9UR6derfLIND79qE///ZVBi43k6KkXTaZPhqgodkx2XRhqdDXwf3DTIW/hmLgDMObQsT5ftHAKNvtLwDA5G1LL/g8RDYSSiH0M3DSLnAsIErxcNIn0hzq+zkI9dEDgdCg28+Xz8AUG4pa7/gMGLyFfSnr0dEHjBbm1fzEDsEjtjrfzLNAN+y6yH1nh6tkXsKYXiLedKVJfLbvxW8XzVQ/tt956hpROk+5unoEBpEZHRm1g9NzbVTbNCc9uLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 01:00:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 01:00:28 +0000
Date: Thu, 27 Jun 2024 21:00:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <Zn4LJ1qAFUAVpxYs@intel.com>
References: <20240624072754.2231533-1-riana.tauro@intel.com>
 <25eccae7-3bfe-40c7-b400-738ab77c47ca@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <25eccae7-3bfe-40c7-b400-738ab77c47ca@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: bfadeb3a-d09d-4f98-e5aa-08dc970db320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vNz5tf0U4GkxtJhrQzmX+mwmKT1Shxv4NIqX6m+lmA6vNLE5ChmqctwiVog?=
 =?us-ascii?Q?JRldHkX1z9NdnuV8g+0nrwTIlmmY4NRxseEubdpCG+WZN5Gti+xtsnpuNIog?=
 =?us-ascii?Q?KIkgEcMBMg2CNOg6glpLpus/8EL8AJZTUNN0cy8ExfqqSC2wL6DN0dweO4wj?=
 =?us-ascii?Q?TlWWV2dbv1oCdNGhTX7dgL1ptO9tPFMaSq9C7tob6l1sMQJB4gbTp5DUUPWu?=
 =?us-ascii?Q?O/cHhbO5YC2EbVMISRHl5rsJwUaX+e6B8XHhXzmfnC/yGpbV4du+vCvvCv8K?=
 =?us-ascii?Q?wwPOKfMfvQEbpAyhn8M8Ozg5mojy6EcX1nLI59MhluSbx9+hpmChpoexGKXI?=
 =?us-ascii?Q?CEvbqknWMWajLx+vppw02qaOfcbphHrsjNYY5LK8DXhaYGdWxEtkLntNH9fI?=
 =?us-ascii?Q?JYQChXZ+Rw010cl/UXf8hamieg/huXug/X8IbfLMVbHf2fIcP23WF/Erk9Aa?=
 =?us-ascii?Q?eDimRh406eT8avGROi0JQkrNqTuXhE2TatKnTmllO1aAPMf1i0kwoBlk4Wyg?=
 =?us-ascii?Q?u2/taMeHKuzLQhRG9UPzMGCaHUhHpW3bjy1r+kLZ569Q42tm6bsDO8zgCYGF?=
 =?us-ascii?Q?WYBAROY+ImjqQU8i1UjzjpP1a9n0GZ/Tu8r7gNOdNyWqNTULuMfahpbnvCZH?=
 =?us-ascii?Q?aAlnyPEiSU+ZcfieRXhdVcs48ePK8dGCtGUivKxxiXzKRVLwGu8gZh8ze4dQ?=
 =?us-ascii?Q?x92gROiTMgRRRcaXrg30v6nN5sW8lY88LSiZIEt7daAgtvbetRRoedzU/u9c?=
 =?us-ascii?Q?lyUdePz8GEYdNCtEkmA2vMpnCRvHpErB7q0gQpQ1MQUTXC040T/2BxAtFY2D?=
 =?us-ascii?Q?/QltdvY6tBHdueRmh9n1O9XvOZsCoKkZZkiTSp6D+SKX3tYaTsRpwHwwqgZI?=
 =?us-ascii?Q?/NR2kbfdGSXkCGxS1VfKR8RJtwTxg+p6r7WDtaBwa6FL5qklNEMH1jZlDvKf?=
 =?us-ascii?Q?xM0eWb4vz3vu+gH6lIK4tCbjYVgvlvD5E6h8Hg5f7bW4AjYJ64dTpNhGZpPn?=
 =?us-ascii?Q?8ilUG2hF7CCQ+oSxJxnVS2UjMGw0H4TR7v3DNe31aqGZLcSY4S+b3j6QHxAL?=
 =?us-ascii?Q?8DGeZwHWReS4bNzz4z89Dt1M+fqv0MS0xfv3ToQLK50qhu17QB/EFTpWH8Uv?=
 =?us-ascii?Q?n3QI25f1Vrw7xqmnZGj+wLxf4s4YUK2/2UJd5oo67UL+9benSyraxzhAp/Ir?=
 =?us-ascii?Q?1UNlem5x0FAA0bRuU1L0qyUne2RIO4uGW74cZ+tP6nfy1p0hn6ec38TDSr3w?=
 =?us-ascii?Q?a0rYGd9kmpOP6+/2RKjlN9ZrEgA1czOynWKULl6zybut1MqPuHSrlF/Olr6H?=
 =?us-ascii?Q?HNqfd+kGcBP7XwzrHuDcs60MK+valo7CAGnfQn20nBZqWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fo6QR6ZHCkgvUe4VIOwI7kpqvorDXrAPyoz2YUEbiAnGliueO5R4dFU+ilG?=
 =?us-ascii?Q?XiZ5bdkmLAZMSHGsVIer180LIVA2680zMBEmE6ZrZL0PnXokknaOfe1AULRE?=
 =?us-ascii?Q?O41svb8H5HtZ8WJN1gOgsMOCQ32AIVfbmNpWL9IoI8zFNogIH5i0ph5jEepQ?=
 =?us-ascii?Q?s55sVv1TAiSZ+EdlcM0vP4bl6CnKd2um/lWEFoN/Z1ckqIgLqOLGmvvMi7e9?=
 =?us-ascii?Q?OiIqPBIqpbNpV1vS/gjXse7gagUqPZvAVNL7W8R0e+R3Ha3NnBPvKC5P5Tj3?=
 =?us-ascii?Q?YH5obHgMUScVJyQbJVHgkgzNVrf2LfOUciJiaDP0neT+F0xRmxDX5zLG25nZ?=
 =?us-ascii?Q?MbX3oxCcNSbzqdOFshQ8q4fhdwm/nFsz/+Ew7j3Iaxy2Ub6yVnU35Rt2Obq+?=
 =?us-ascii?Q?60/jLkEVYsI4aTBEn3++CqmPLWUIFuGEJ5jtopRd8ZU2+LmP9ZFpGEUib2We?=
 =?us-ascii?Q?W62aD5F47/yf8GREg4xReQZR1Y+FJFOjgMGeRgyepmo4zkV8iDu+IDpzgchc?=
 =?us-ascii?Q?cvaqVGDUR54HlNMGoMMEkpdPKqewBwiaXDzd7G0OQnuA92oWFHJWIvN5INSC?=
 =?us-ascii?Q?AUBcLY10S6Du+4sQcHigT1H9MfIetYqvV8yCAUOOaE2f8ZE6QEoWifJWovMK?=
 =?us-ascii?Q?juB+1tjUlh37vL04Sce2N5dSd8vb8rJZAaJvUlMwwNT8mxPJZJtNvpcZRdNE?=
 =?us-ascii?Q?3XoX7FyE9Foh12kuknM0owx4x8CifGplsrFJnl18ZLBouDWD2PxwPzeq7Gok?=
 =?us-ascii?Q?BUKjc2IZ/GmUDuHsNPxiczuDoG0g2ZmY8e+DkL3B0L/88VnkWo6xq525xvCa?=
 =?us-ascii?Q?TWFeVrH2wc7WyU5Eik1TOP4TxVlzqYEe0BTGvF8TmTxhmiKoTxtNBVOGICSe?=
 =?us-ascii?Q?9skAxIc1H/tY++jHOtU8p6CawiyYUzze0/YDJuNHKD84ERG3B8R7ySdX2kd8?=
 =?us-ascii?Q?vdgfWLLjX8tw8aaOdHFnd/ZQ8AtR22sVlCvxBQMQ1SToAdF64iNwSZVyJZ+0?=
 =?us-ascii?Q?gi4FvMVbDGhr5WlLnxFx4lgSPKBIPfqesT47JiKRv8XAFS2frSJqAAUoFEML?=
 =?us-ascii?Q?GYb6+aSpOWFHf4PUPEjJg0Xxm9NWGGO4D3ZpjaKybhAvNHKwlCEp04mNdkbo?=
 =?us-ascii?Q?PKOIqQOpbuxB9I6cBANlHyrfQo6GBgK7vn/RmVsHqsw9cHWRRw/Txkbsrdh6?=
 =?us-ascii?Q?ulmc/yk3wGKE7KRWR3T+JxSJdyeSji2B46Nz6oD4YsiFhydHkIR4kGMVAi2J?=
 =?us-ascii?Q?mONRBWTVU3Y2WeZwpq2lIn1VAmja5WGf6/lazX4CtLR2ROtLlXkwXgpfNVDs?=
 =?us-ascii?Q?ADKNdp1c974ubBaTbxRZdFX/IqvD5N7Gq8u/W4HKWolgUXFHzTu93foQ25mk?=
 =?us-ascii?Q?xPDyD7Wxgsi2mMUeE6Zc3y0WG0RtIoX8SqcSM841qKnD4h65SY/LZegS3t5p?=
 =?us-ascii?Q?lUvjnXBz7v5z2SooGEQnEiiIksk0mynbCfKAy8W9OgcILG+09PRxKhFENTPp?=
 =?us-ascii?Q?ejcG+tOYfgHR8HlnCCv0+Gw6UWQfzKNT2kLGeDuXIxQvnwNz/DT7n4mKBOAg?=
 =?us-ascii?Q?PSx5MVIVYnXmE6aKJGn9588nXgKM8OyWumE72ra0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfadeb3a-d09d-4f98-e5aa-08dc970db320
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:00:28.1162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wfpT1JnIeWv8q9vjT0Ndy4Yx3zffhySSomZbl5/92+2b9kJjRzbLvB13vh5R/jBoFXwVH57QsfYuxyS2cqaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
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

On Mon, Jun 24, 2024 at 10:10:48AM +0200, Michal Wajdeczko wrote:
> Hi Riana,
> 
> 
> On 24.06.2024 09:27, Riana Tauro wrote:
> > Currently GuC is reloaded for both runtime suspend
> > and system suspend. For D3hot <-> D0 transitions
> > no power is lost on suspend and GuC reload is not
> > necessary.
> 
> quite aggressive line wrap at ~50, try wrap a ~72
> (only commit titles should be around ~50)
> 
> > 
> > remove GuC reload from D3Hot path and only enable/disable
> > CTB communications
> 
> "Remove .... communication."
> 
> > 
> > v2: rebase
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c     | 19 ++++++++++---
> >  drivers/gpu/drm/xe/xe_gt.h     |  4 +--
> >  drivers/gpu/drm/xe/xe_guc.c    | 52 +++++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_guc_ct.h |  3 +-
> >  drivers/gpu/drm/xe/xe_pm.c     |  8 +++---
> >  drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> >  9 files changed, 136 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 759634cff1d8..5b48e4db9776 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -776,8 +776,9 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >  }
> >  
> > -int xe_gt_suspend(struct xe_gt *gt)
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> 
> as you are changing function signature, please add full kernel-doc for
> this public function
> 
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> >  	xe_gt_dbg(gt, "suspending\n");
> > @@ -787,7 +788,11 @@ int xe_gt_suspend(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_msg;
> >  
> > -	err = xe_uc_suspend(&gt->uc);
> > +	if (runtime && !xe->d3cold.allowed)
> 
> nit: maybe instead of just looking at some internal flag, it would be
> better to define helpers:
> 
> static inline bool xe_device_d3cold_allowed(xe) { .. }
> static inline bool xe_device_d3hot_allowed(xe) { .. }
> 
> > +		err = xe_uc_runtime_suspend(&gt->uc);
> > +	else
> > +		err = xe_uc_suspend(&gt->uc);
> > +
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > @@ -825,8 +830,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >  	return ret;
> >  }
> >  
> > -int xe_gt_resume(struct xe_gt *gt)
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime)
> 
> add kernel-doc
> 
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> >  	xe_gt_dbg(gt, "resuming\n");
> > @@ -834,7 +840,12 @@ int xe_gt_resume(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_msg;
> >  
> > -	err = do_gt_restart(gt);
> > +	/* Do not reload GuC at runtime resume from D3Hot to D0 */
> 
> maybe better to explain "why" than "what":
> 
> /* GuC is still alive at D3hot, no need to reload it */
> 
> > +	if (runtime && !xe->d3cold.allowed)
> > +		xe_uc_runtime_resume(&gt->uc);
> > +	else
> > +		err = do_gt_restart(gt);
> > +
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 1123fdfc4ebc..4c942e4716ad 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> >  void xe_gt_record_user_engines(struct xe_gt *gt);
> >  
> >  void xe_gt_suspend_prepare(struct xe_gt *gt);
> > -int xe_gt_suspend(struct xe_gt *gt);
> > -int xe_gt_resume(struct xe_gt *gt);
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime);
> >  void xe_gt_reset_async(struct xe_gt *gt);
> >  void xe_gt_sanitize(struct xe_gt *gt);
> >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 172b65a50e31..1ea1d00f93f3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -870,7 +870,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
> >  		guc_enable_irq(guc);
> >  	}
> >  
> > -	err = xe_guc_ct_enable(&guc->ct);
> > +	err = xe_guc_ct_register(&guc->ct);
> >  	if (err)
> >  		return err;
> >  
> > @@ -1101,6 +1101,56 @@ void xe_guc_sanitize(struct xe_guc *guc)
> >  	guc->submission_state.enabled = false;
> >  }
> >  
> > +/**
> > + * xe_guc_runtime_suspend - GuC runtime suspend
> > + * @guc: GuC object
> > + *
> > + * This function waits for any outstanding CTB
> > + * and disables CTB communication before entering
> > + * D3Hot
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_guc_runtime_suspend(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_ct *ct = &guc->ct;
> > +
> > +	/*
> > +	 * Wait for any outstanding CTB before tearing down communication
> > +	 * with GuC.
> > +	 */
> > +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
> > +		return -ETIMEDOUT;
> > +
> > +	/* Disable CTB */
> > +	xe_guc_ct_disable(&guc->ct);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_guc_runtime_resume - GuC runtime resume
> > + * @guc: GuC object
> > + *
> > + * This function enables CTB communication
> > + * and interrupts.
> > + */
> > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > +{
> > +	/*
> > +	 * Power is not lost when resuming from D3Hot,
> > +	 * hence it is not necessary to reload GuC
> > +	 * everytime. Only enable interrupts and
> > +	 * CTB communication during resume
> > +	 */
> > +	guc_enable_irq(guc);
> 
> this will break VFs
> 
> can't you just use xe_guc_enable_communication() as it was ?
> it did the same steps what you are trying in this function
> 
> > +
> > +	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
> > +		      ARAT_EXPIRED_INTRMSK, 0);
> 
> if power not lost we likely don't need this (as this is a default value
> and we already set it once as part of __xe_guc_upload()
> 
> > +
> > +	xe_guc_ct_enable(&guc->ct);
> > +}
> > +
> >  int xe_guc_reset_prepare(struct xe_guc *guc)
> >  {
> >  	return xe_guc_submit_reset_prepare(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index af59c9545753..a01999bb4a8e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
> >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >  int xe_guc_enable_communication(struct xe_guc *guc);
> >  int xe_guc_suspend(struct xe_guc *guc);
> > +int xe_guc_runtime_suspend(struct xe_guc *guc);
> > +void xe_guc_runtime_resume(struct xe_guc *guc);
> >  void xe_guc_notify(struct xe_guc *guc);
> >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> >  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index b4137fe195a4..400680c429fd 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -360,7 +360,16 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> >  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> >  }
> >  
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +/**
> > + * xe_guc_ct_register - register GuC CTB
> > + * @ct: GuC CT object
> > + *
> > + * register GuC CTB's and enable GuC CT
> > + * communication channel.
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_guc_ct_register(struct xe_guc_ct *ct)
> 
> hmm, can we have common naming convention across all driver components?
> 
> for the initialization there was pattern like:
> 
> 	- init_early
> 	- init
> 	- enable
> 	- disable
> 	- fini
> 
> and the "_register" suffix was mostly used by functions that registers
> the sysfs/debugfs attributes
> 
> now CTB is splitting 'enable' step into 'register' and 'enable' where
> the latter can't be used alone and be even more misleading
> 
> + Rodrigo

yeap, I fully agree with this and all the other points from Michal on
this review.

> 
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -383,11 +392,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	if (err)
> >  		goto err_out;
> >  
> > -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > -
> > -	smp_mb();
> > -	wake_up_all(&ct->wq);
> > -	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
> > +	xe_guc_ct_enable(ct);
> >  
> >  	if (ct_needs_safe_mode(ct))
> >  		ct_enter_safe_mode(ct);
> > @@ -396,10 +401,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  
> >  err_out:
> >  	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
> > -
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_enable - Set GuC CT to enabled state
> > + * @ct: GuC CT object
> > + *
> > + * Set GuC CT to enabled state
> > + */
> > +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +{
> > +	struct xe_gt *gt = ct_to_gt(ct);
> > +
> > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > +
> > +	smp_mb();
> > +	wake_up_all(&ct->wq);
> > +	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
> 
> this seems wrong, as CTB was enabled and fully functional once you
> called guc_ct_control_toggle(true), decoupling reporting of what have
> already happened in the previous steps is IMO just misleading
> 
> + Matt
> 
> > +}
> > +
> >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >  {
> >  	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 105bb8e99a8d..f786b3ec2b68 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -11,7 +11,8 @@
> >  struct drm_printer;
> >  
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > +int xe_guc_ct_register(struct xe_guc_ct *ct);
> > +void xe_guc_ct_enable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index de3b5df65e48..070d28d193c7 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >  	xe_display_pm_suspend(xe, false);
> >  
> >  	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, false);
> >  		if (err) {
> >  			xe_display_pm_resume(xe, false);
> >  			goto err;
> > @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
> >  	xe_display_pm_resume(xe, false);
> >  
> >  	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, false);
> >  
> >  	err = xe_bo_restore_user(xe);
> >  	if (err)
> > @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	}
> >  
> >  	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, true);
> >  		if (err)
> >  			goto out;
> >  	}
> > @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  	xe_irq_resume(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, true);
> >  
> >  	if (xe->d3cold.allowed) {
> >  		xe_display_pm_resume(xe, true);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0f240534fb72..997ab4e82931 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
> >  	return xe_guc_suspend(&uc->guc);
> >  }
> >  
> > +/**
> > + * xe_uc_runtime_suspend - uC runtime suspend
> > + * @uc: uC object
> > + *
> > + * Return: 0 on success, negative error code on error.
> > + */
> > +int xe_uc_runtime_suspend(struct xe_uc *uc)
> > +{
> > +	/* GuC submission not enabled, nothing to do */
> 
> nit: this comment doesn't bring too much new info and likely can be
> dropped without losing any clarity of the code
> 
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_runtime_suspend(&uc->guc);
> > +}
> > +
> > +/**
> > + * xe_uc_runtime_resume - uC runtime resume
> > + * @uc: uC object
> > + *
> > + * Called while resuming from D3Hot
> > + */
> > +void xe_uc_runtime_resume(struct xe_uc *uc)
> > +{
> > +	/* GuC submission not enabled, nothing to do */
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_runtime_resume(&uc->guc);
> > +}
> > +
> >  /**
> >   * xe_uc_remove() - Clean up the UC structures before driver removal
> >   * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 11856f24e6f9..dd483ea43b9b 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> >  int xe_uc_fini_hw(struct xe_uc *uc);
> >  void xe_uc_gucrc_disable(struct xe_uc *uc);
> >  int xe_uc_reset_prepare(struct xe_uc *uc);
> > +int xe_uc_runtime_suspend(struct xe_uc *uc);
> > +void xe_uc_runtime_resume(struct xe_uc *uc);
> >  void xe_uc_stop_prepare(struct xe_uc *uc);
> >  void xe_uc_stop(struct xe_uc *uc);
> >  int xe_uc_start(struct xe_uc *uc);
