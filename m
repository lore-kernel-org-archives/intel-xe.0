Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE59BC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 15:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6535F10E075;
	Tue, 25 Jun 2024 15:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJzdhefZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65B610E075
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719330433; x=1750866433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T9o46puQPxEb0GbxmGin37YaIm5o/r1TcFdhg5IElaY=;
 b=ZJzdhefZ6WTwIOrJEngTeVzuFIWN+Hhh0FSveTrijTeHjcS8rz+tP/SO
 rWSDPEw1+46sxPJXdkRDP8Wyv4cqxr1qBpZToYfy6QIZRVO0EsDYcDR+c
 B0TlcgmNi+tdMrLZDGsxD58kBoq0F7c6LwkaD/ccxgu6/L8iQdFrst/Sx
 xklcSycUZSnJM8OW+lD67t6AymmG1Ag/zAH+NNH0PYraCqndxoUzKH2aO
 tAr6550j8DDR1ZFYS1DlWBXkEl44KoF9/PTW48zVfaYmlq5XgoUj8ealW
 sygk36vybBJ5/D7x9K7+GtXIdJAO7AMejiwlbIJHhjU50EU6oW5RsBCak g==;
X-CSE-ConnectionGUID: yVaZRfqQRq6Rn2PCkM1kHw==
X-CSE-MsgGUID: 1QuwL2hzQa24gTT2wlNpDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16584664"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16584664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 08:47:08 -0700
X-CSE-ConnectionGUID: 3EAcJYI9Qu+2rkPTiR5u7g==
X-CSE-MsgGUID: k0K844WPTVODUWht5cFJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="74903974"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 08:47:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 08:47:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 08:47:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 08:47:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 08:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmxMJ0x/sdVeIMgBNFJLEsqIAPw0Z0BSN8sNXb9Peot02URZbLk5c/GMqfVqFqXz1HpQjsecGYr6BxPNMcn5Sn9DphYI+C7ywN7f1GQTLNrvGLo4hGRKqBF1joHkr79SvqY5/UQlf/rx11ExBl1zWvlPks8qWU4qLdYasR17YS75C4b/pYid84eSFKMoVcUl3HqsxPvxTV5fL2SLmg2KNHoUdEFoMnsG9h6j9Djj1c01ZYzUnh0mV4jrRN57e2GPioD0tX4d6XPVsjPZBmZMkFFSPU9r9uzwMDqt3uRo3SgWs1FHQIWAR8vXjUImyS+6BUTTHq/r8b6gfrhdLTgM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAqGSG9jAazq+sCUiZXyKSqwvm+QGsN4cGyNIRJQIhg=;
 b=GLyMyjX5tT8v9m++mO3HP2j8MlGOkDrS5IHSuKxM6SqgQyRQ5oCW8TA2zXFycUXgRIwGfB7yRgwJvp+RfZEAWCn914IpLRFUmOhM2cLGo9d6yqYJyq4eCQ8owQzU+F5WRS4Tefr4J1LZMdw0CLZCFPTcRZ3cF8FnXXTk30BrUAXUn6mvxbQMh+pP9X+o7yqatx0SBw1Es6pAGYVA5jKbNgnreFPYqGsaf/WQRfYIWtZGFrrvHOSKy7pQovP+nhBD3u9fPuuoJjP4sdiihH0YoM73y2cEnGU6OCw3hRVk+vFzy7BVmg139KS1qkU5wOVHEAu8YK7R2+XrRiSkgJWShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Tue, 25 Jun 2024 15:46:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 15:46:55 +0000
Date: Tue, 25 Jun 2024 15:46:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Add timeout to preempt fences
Message-ID: <ZnrmScq8KqFtN3eL@DUT025-TGLU.fm.intel.com>
References: <20240625055120.3997338-1-matthew.brost@intel.com>
 <d7193933-69c2-42b6-86cc-3938c1b00624@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d7193933-69c2-42b6-86cc-3938c1b00624@intel.com>
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c338e6-5846-43ac-b8be-08dc952e0a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JudZHxftGS6O7dpG0Nt4G3GTHMs2q8C5ynhW37Ww29JSIXRQyk912kGl+yby?=
 =?us-ascii?Q?z6QZOyTl6ubMM43GREWW0mCsUWtTlsmTjU5JUWfsfBu2ZSeyNY/fzv9s1E8x?=
 =?us-ascii?Q?ZYvoN4Mr+IxTopgNaAiYmMsRWUS+kGXUX20mGnwDW++bYrtQ5SuGrwGzPedM?=
 =?us-ascii?Q?YIOfFk6gL1zUBETIPKA8DZdzK1HNQJ2aI5zdVkQ0Q/C5V2t+7DLZDoY59X/5?=
 =?us-ascii?Q?mRf90vD+YMZF6f1iYpvvsbLE00TGZaSdjsQC/EvcuEOAYABfSp7qnJFCaRSC?=
 =?us-ascii?Q?s/3mVMWn+gI+UoU7gQEHzhbx8RhFlPe7y92IJ+mVymr82G3nonnCUQdGskf6?=
 =?us-ascii?Q?+bLfcm2aRkLzIvdY/rPc40ti2/GPXvWHuG+DFDJOj3QVt200Wx1WEmeXsILh?=
 =?us-ascii?Q?Uu8tjmh9OYhwwpUe5NoqtPV/y/2L523FunHQJirK1bQDEaO3K2XSpV4QPan+?=
 =?us-ascii?Q?XCWMnYINIkQjSp7xLSOpAvaB4KCXJCB+MNfNeyBwI4CxsKraRZapS6b/aTug?=
 =?us-ascii?Q?GRFsY5CyanxvaBH9s1b/wjsbmOhU5ZOs6RwWiOmF+WKxpVishwbMHhPwp+kk?=
 =?us-ascii?Q?Tda0MRz3RoO18c5K0Rig4bwuGbDPQ1/H+6lOGEIIuGvqImvBPx7lPIGfbQSc?=
 =?us-ascii?Q?XTC6CqDp658Cnddn+DXnMMNTcvSbgPfly/qytuRvJ1BtmQe30L0908z59GfL?=
 =?us-ascii?Q?8H0kt2QYDb4Dv/E4rvcZdcwmrp2Wmec5iVc6YZKgviavzGDm5KF0J/zdpvqZ?=
 =?us-ascii?Q?3hwExKq1gxH1ZbOqmW9PInjXSdimOJMJb17qReFPcA1CdLQYQYFwLtsHR5GO?=
 =?us-ascii?Q?+gY6WWgJ4BcZNQEDeWKAu8OoWI2E7SeR2/PRBpa1S5WR9/liDPh/QFYCoHc8?=
 =?us-ascii?Q?0zQw6yRBhgTcyCj0q9AkgqktUb5IRWuLspAeTZH37hpx1xbjNromwoN763po?=
 =?us-ascii?Q?46WG3eUiAxC1nwlBvCqxo5MmxVORQFdiCdxD6o5gddCJxq/HbCc6zaEprqFw?=
 =?us-ascii?Q?kh+gTBsyEpn037Na4cNt4LkfHo20EpcCKTaXiYJZC1/YSA8sDvxlm/ppgFO9?=
 =?us-ascii?Q?av3UzZtH9gjRQ42HqvqFjKeun81JJA/m6joyouFVgne/5bQayRwI6VldtT9H?=
 =?us-ascii?Q?bZm8cqg3O3I91I6lNBOmHhKi1qpVXKhddkYBQX29/DE52xaoTTxN5rnKhCmR?=
 =?us-ascii?Q?i7aW+qGgWXTGuD6RJsIDWkYGrTiIRb2uToOtNjTNUis93bJEn4ClVwdyIiP0?=
 =?us-ascii?Q?v8RNY2vvaYiKFy72A4/SflPpdip6jJBBWLaEgzlki1SSYlHEj2LOiPydq0jR?=
 =?us-ascii?Q?R+LKzTvB2cPvEioM1CRHhvbb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1IY3k4ail5lE4HYR21I+1bMBm6+SDYCMTzvGvOnmJtCXRNAlYCplf5m6g2FS?=
 =?us-ascii?Q?q6T027DO+fbSiXXGd6+r1aB0AO65DPWJLS3cS2y9oBKj7125bVhHOXOOxpxs?=
 =?us-ascii?Q?tE2GOZwi9LHRPp1YwyYqMaoxdzA9AfK+x7o76aIsq48W0yM8VWw4EMUopcl1?=
 =?us-ascii?Q?iVHx5KzudoemhbJmBEY0p78dRUih1Mot35NLP/NZrRBL80+JRLy75IGElSgy?=
 =?us-ascii?Q?c+LaLdOldL6piMO8ApsOiDefHLAJsnzDOeV1+dprBjNInXTtz/PUThZfr8+9?=
 =?us-ascii?Q?anIUdbsKSdM0c/u/SwEsVnCeBec/eiBXaEf0SofF7KCHks0QRh+s4Xdaagdd?=
 =?us-ascii?Q?9T/LfZ9PcEIGMaJcutPrthHtUL+HQ4rQ+Q+pOCIk4ZIpK+nzeuegpSIt1EmD?=
 =?us-ascii?Q?PoPC6bU5GKIWdIu3cv8m6xGLguydZs6Fn2j5zL46R619t03YCOmH78HbPqNq?=
 =?us-ascii?Q?aTCVtUz7rRvtYuj/pqKaHcnBeQPO4AQo7qo3PYUNfXoIcYOZcgyvMF9kZUc6?=
 =?us-ascii?Q?2gEWR3L486GkLdzYt/7o7hJkx1ZdEdmoHQlOCmFBr3HpQ0+716NImS/aNN7p?=
 =?us-ascii?Q?ahhcfOfFE4p4sHyrL9poAjgR45iZKfIPeAaHrTaR2FVRJE877cTt9MCFMLwv?=
 =?us-ascii?Q?s3qGyLOYmsrDpGCv62B63IxaCvux+bm0OdmJLfjLKmV1bFyGcN27w7XO4gc6?=
 =?us-ascii?Q?wL/RjNNAxAT80X97BKgfjqQRYnA4f4JfZl2Wpiv05zcT2oRYRR5Pgi+4uvAI?=
 =?us-ascii?Q?2izFmWvQG9YRXcXtcWDpOdT917X++k5QI+DVRafoGVYeVT19HB5x1FOZwu8u?=
 =?us-ascii?Q?7qu/SneFnU5QI838GibrQeByWIMKYsIxqEGh7DHhmmO4Zhmf2WfOvdwmYIYP?=
 =?us-ascii?Q?r4ruh+Gnq5yJb4Lp0oEevxKI46d953vrdr1qtKcOXjonHe8Lnv4n49sEC1+S?=
 =?us-ascii?Q?0vmUWRsaTjS0PKM9Iwdbg2V7W2X/LQwj5Smpv19iOogHzaFV/7UY+kj76nop?=
 =?us-ascii?Q?GWYiMPyONWvJzNDbGECHOYaeAInNmHuycarPP5qsWpbGAcXyDx3BBZPVw21Q?=
 =?us-ascii?Q?sjLp0/4UbGNkFD7W0jSvQ8hchhZHa90pRGsfkzNr5Dr/koxb94zA16CaGC/c?=
 =?us-ascii?Q?kxp3gaIqSA/q4x8dPdzu4HJ2dHrop8VkJBQBSAr5N9VGlJJGmqP1lpfYRZrG?=
 =?us-ascii?Q?gWUbbWB7dAVn+iKAWBxE4p0yADCIq10J8VWt0fOcDaNeAGPOK20OJXzaRroz?=
 =?us-ascii?Q?+1kIvWRXEc8SYPJQuFWkcP0S8dgb4PXhjQfEw0mKzoECop3er0HMyOcomk8l?=
 =?us-ascii?Q?dgUFod8kFNrHtoi9CUiVMrLEMcMj2f6jm+dF8y6XgDzOVNsggDOGaa2PGiH8?=
 =?us-ascii?Q?fPqt+ApoifxD6W43aYGtBSdaCntqVI2MWpYc8HhAPu19JHVbwd8004NLyzad?=
 =?us-ascii?Q?EBmAlev/NAE9IBakB8U4BmXtxy+DPuZaBmo684zfBtwGgBgzvo0hiEGbzh84?=
 =?us-ascii?Q?idXs/86oUEwSr/JWzTzAFnnnKTkuMeNnWiZKYGKG2UEtADeVElSxseypXG2T?=
 =?us-ascii?Q?NL8cUy4iyeWfSJDmTKc5N5fx514zSqE2sfuFMX6n9wyy7/foGhp02RfEPuzC?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c338e6-5846-43ac-b8be-08dc952e0a4f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 15:46:55.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCUxaqs6CHNYTUmCEHbguWiPsN8uymZWwcEV0Lz1oOe5KjPQr+D0aNq1wVIwYu2DMoSF2sKqag8YjXMDUbckMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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

On Tue, Jun 25, 2024 at 02:03:38PM +0100, Matthew Auld wrote:
> Hi,
> 
> On 25/06/2024 06:51, Matthew Brost wrote:
> > To adhere to dma fencing rules that fences must signal within a
> > reasonable amount of time, add a 5 second timeout to preempt fences. If
> > this timeout occurs, kill the associated VM as this fatal to the VM.
> > 
> > v2:
> >   - Add comment for smp_wmb (Checkpatch)
> >   - Fix kernel doc typo (Inspection)
> >   - Add comment for killed check (Niranjana)
> > 
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> >   drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> >   drivers/gpu/drm/xe/xe_guc_submit.c       | 41 ++++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++-
> >   drivers/gpu/drm/xe/xe_vm.c               | 10 +++++-
> >   drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> >   6 files changed, 65 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 201588ec33c3..1e51c978db7a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> >   	int (*suspend)(struct xe_exec_queue *q);
> >   	/**
> >   	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> > -	 * call after suspend.
> > +	 * call after suspend. In dma-fencing path thus must return within a
> > +	 * reasonable amount of time. A non-zero return shall indicate an error
> > +	 * waiting for suspend.
> >   	 */
> > -	void (*suspend_wait)(struct xe_exec_queue *q);
> > +	int (*suspend_wait)(struct xe_exec_queue *q);
> >   	/**
> >   	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> >   	 * state and dma fence returned from most recent suspend call must be
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index db906117db6d..7502e3486eaf 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> >   	return 0;
> >   }
> > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >   {
> >   	/* NIY */
> > +	return 0;
> >   }
> >   static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 373447758a60..9df97ee94fca 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1301,6 +1301,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> >   	kfree(msg);
> >   }
> > +static void __suspend_fence_signal(struct xe_exec_queue *q)
> > +{
> > +	if (!q->guc->suspend_pending)
> > +		return;
> > +
> > +	q->guc->suspend_pending = false;
> > +	smp_wmb();	/* Ensure suspend_pending change is visible */
> 
> I guess it was already like that, but where is the matching smp_rmb()? If
> adding smp_wmb() there should usually always be a barrier on the reader
> side.
> 
> If this is just simple wake_up() / wait_event() pattern with single
> dependant store/load vs wait/wakeup then I don't think we need explicit
> barrier, it should be handled already by the api IIRC.
>

Yea, I knew some smp_* barrier usage was wrong. Let me drop this.
 
> > +
> > +	wake_up(&q->guc->suspend_wait);
> > +}
> > +
> >   static void suspend_fence_signal(struct xe_exec_queue *q)
> >   {
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -1310,9 +1321,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> >   		  guc_read_stopped(guc));
> >   	xe_assert(xe, q->guc->suspend_pending);
> > -	q->guc->suspend_pending = false;
> > -	smp_wmb();
> > -	wake_up(&q->guc->suspend_wait);
> > +	__suspend_fence_signal(q);
> >   }
> >   static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > @@ -1465,6 +1474,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >   {
> >   	trace_xe_exec_queue_kill(q);
> >   	set_exec_queue_killed(q);
> > +	__suspend_fence_signal(q);
> >   	xe_guc_exec_queue_trigger_cleanup(q);
> >   }
> > @@ -1561,12 +1571,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> >   	return 0;
> >   }
> > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >   {
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	/*
> > +	 * Likely don't need to check exec_queue_killed() as we clear
> > +	 * suspend_pending upon kill but to be paranoid but races in which
> > +	 * suspend_pending is set after kill also check kill here.
> > +	 */
> > +	ret = wait_event_timeout(q->guc->suspend_wait,
> > +				 !q->guc->suspend_pending ||
> > +				 exec_queue_killed(q) ||
> > +				 guc_read_stopped(guc),
> > +				 HZ * 5);
> > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> > -		   guc_read_stopped(guc));
> > +	if (!ret) {
> > +		xe_gt_warn(guc_to_gt(guc),
> > +			   "Suspend fence, guc_id=%d, failed to respond",
> > +			   q->guc->id);
> > +		/* XXX: Trigger GT reset? */
> > +		return -ETIME;
> > +	}
> > +
> > +	return 0;
> >   }
> >   static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index e8b8ae5c6485..8356d9798206 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
> >   	struct xe_preempt_fence *pfence =
> >   		container_of(w, typeof(*pfence), preempt_work);
> >   	struct xe_exec_queue *q = pfence->q;
> > +	int err = 0;
> >   	if (pfence->error)
> >   		dma_fence_set_error(&pfence->base, pfence->error);
> > +	else if (!q->ops->reset_status(q))
> > +		err = q->ops->suspend_wait(q);
> >   	else
> > -		q->ops->suspend_wait(q);
> > +		dma_fence_set_error(&pfence->base, -ENOENT);
> > +
> > +	if (err) {
> > +		dma_fence_set_error(&pfence->base, err);
> > +
> > +		down_write(&q->vm->lock);
> > +		xe_vm_kill(q->vm, false);
> > +		up_write(&q->vm->lock);
> 
> I think grabbing vm->lock will deadlock here, right? Calling vm_kill might
> also be scary? lockdep will not see it unless we have some way of triggering
> the error path here. For reference: 3cd1585e57908b6efcd967465ef7685f40b2a294
> 

Yea I think you are right. I was thinking we could grab this here as I
thought having a dedicated ordered work queue here allowed the vm->lock
to be safely taken about that thinking is wrong. Hmm, I need to rethink
this design. I might be able to refactor xe_vm_kill to not require the
vm->lock... Let me play around with this.

Matt

> > +	}
> > +
> >   	dma_fence_signal(&pfence->base);
> >   	/*
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5b166fa03684..e7c15b7877b1 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> >   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > +/**
> > + * xe_vm_kill() - VM Kill
> > + * @vm: The VM.
> > + * @unlocked: Flag indicates the VM's dma-resv is not held
> > + *
> > + * Kill the VM by setting banned flag indicated VM is no longer available for
> > + * use. If in preempt fence mode, also kill all exec queue attached to the VM.
> > + */
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> >   {
> >   	struct xe_exec_queue *q;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index b481608b12f1..c864dba35e1d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> >   	return drm_gpuvm_resv(&vm->gpuvm);
> >   }
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> > +
> >   /**
> >    * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> >    * @vm: The vm
