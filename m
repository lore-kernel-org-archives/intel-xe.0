Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99736CF34AE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 14:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A9A10E86B;
	Thu,  3 Oct 2024 14:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPEYz22P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5261C10E86B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727966239; x=1759502239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C55AKnaUzFfYQ3XAT7rV2mh+gieg8hG3CZe2KZQoplE=;
 b=QPEYz22PG3jGcLE07DvzS/JeICbg28xvx+EhudA4glIx3p1yO81tUf5D
 xIY99O8Dp4vSnM3RE/3Q40BTrLoJt1xYS49mwJND6jWJYXcXdivdmhxsC
 hmPEwwa9gF4kIxORNF3JUejPPiaEDO1K6V9nWTFVQ4wZ/ocTTPzH7GWMt
 A90Namhhvh/73KfgImsqrmbA+oV5xOCrwNYJ3CftxSK3UPVUwW5S3JI2Q
 A8XJRPEpnggbYcjB0vKwlVTg0HHxYx6iprFMUCOEMiF/VJ5pYtV4WTWRU
 YYeXvIAssnO2VnESIZNysz71SVrGpCN8Y/FOVq4PXEz7y+qoHNPpw4raM A==;
X-CSE-ConnectionGUID: KY8xaDoEQPGd1IquxQ8xKw==
X-CSE-MsgGUID: ZFYybGzzTRuQuSePzUXCzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52570082"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="52570082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 07:37:18 -0700
X-CSE-ConnectionGUID: IMbV+NIOSD+6XeQcc7J7rg==
X-CSE-MsgGUID: HPaLQ0grQL6HhVAR9y9l7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74687973"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 07:37:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:37:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:37:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 07:37:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 07:37:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0QpAE0sBn1FSNflIhNtnY1eUWF9joEEALWMra7nFsY8eKhqPBnE8mvgPbNk3FDeHBeuJTT7TMxPMhcxXZhy/f3GP/sp2ETZuSahdN+kCOtqAqv0urHG160J+SE4IE1mg6bSLm9+z8YbfVD4oYKEW+tIBHaSKN87d4A9hdXoxe1oOO/Sk2WwVZd5iHhSfMyegsfsnnxFnZsY2/QOfEsZ5jgdI3DT+QOsEPyjMEytqWdUZDGpQEphVcfXEJJ9jM+hJSaSUYY7BnHLHazFwP/3HZ0/mS4VFiIIUTdB4vL1WREa286ilNuS2C7LJs4GmSaU4nGMhFhBjdMPGp8L/VDbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VO/1ESfZQ6sgD2ty7e2+zPtd3D5lstCL0j2/CUEmVQ=;
 b=gECx/o49nt/4FGzWf0Aadej5Sh7vqCrzKjBWzF34vH3viO2E7q4CorgomW0jac3VzCNwS8txamVItPiMmrUJHA22p1KHP2Uing4P9N1ibtIBJf6kiv7M+rAa0d/UcMazf6A85rKfMkrTzWHIcCwySeyF+hmSUNwF07gyMsgPJT8qLR91zbU21VpPDPJU6Zt8cYhuTTIh+R1IKjspLad6Z+ptY+Drf21lMF+Csq9JDs69LkWmtC3uUxkq6gH7PHj85H2rxxsLhJI0B66E0dLpPfvbuYt/atWlRp+jCzLz1ounwoUkb8KiIGmGs++/lNK66qVkoHIGN4auclMb3r+bFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 14:37:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 14:37:15 +0000
Date: Thu, 3 Oct 2024 14:37:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Don't free job in TDR
Message-ID: <Zv6sE5PJYwkB8k+A@DUT025-TGLU.fm.intel.com>
References: <20241003001657.3517883-1-matthew.brost@intel.com>
 <20241003001657.3517883-3-matthew.brost@intel.com>
 <45633fc3-b1d8-4a64-b8db-0fda93ca79a5@intel.com>
 <Zv6ksODQwzVvfOw3@DUT025-TGLU.fm.intel.com>
 <abf18240-7105-491a-962b-3db2d84dc897@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abf18240-7105-491a-962b-3db2d84dc897@intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c010cf1-3480-4afc-5ab1-08dce3b8dfd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AfoOfW0Ilhgz5I9JER3OT5ny0LK4tqg1kx1J6HyqAWuaNmoDG9ACO/bR6t/T?=
 =?us-ascii?Q?ERyJP6kkr8Dm8zKznZh9+8K6OMuuivjOcx2Q080FVhWKm5BceDXkWzg00q0t?=
 =?us-ascii?Q?TT8p/8OI75JoT+cnf8rybhgNo0Kw4JkACrHjnWPuRsD7u7LMxP/KRQPTW7cm?=
 =?us-ascii?Q?kxCbtOVGNy9bV7/vGI5z5Y2wgLeAzWctC1RaejGLJef76utmtRzKA+zbw3fR?=
 =?us-ascii?Q?051EZnArOljuHMVT5QoDdKd4u+Y6XTW5uf4/kZK8SJ+Lr8l1jyOgGK9Bo1h4?=
 =?us-ascii?Q?PmvjMtB20jqUrXq0XiAo+VRT/HhzgF8tuDXFd4T4CiUOHcB0SqBMBBNA/TjX?=
 =?us-ascii?Q?rtn0WhVnCveEAOxGnYaXEdzKcG84GdSgCGu3GlMAMtz+0/OVENyMeZY5Tn6+?=
 =?us-ascii?Q?azHt6jzvtYUOUTmGg/783Juj2mLIdz/TzxZVWQTtiy681m4fdZLsTj453C8M?=
 =?us-ascii?Q?3MKehga+C1T0ZSRnCXZoxNy5UojFM7ADqkg+jRwGS+VeO9Xz6uUhK+C1AXiF?=
 =?us-ascii?Q?GpAl6O0NTiBE2PBfzyH6aABJDnIiDWZjwixJDBAP3isq2hvW1SZNwNVLof3i?=
 =?us-ascii?Q?ZmsT8FEEzc6g6++o1Xm56tkXmSFKTivDjlZMFPLyT1RvN5L1vJQA67kwNKau?=
 =?us-ascii?Q?8TeDtYLLy/8j1EI//Z/8uwY43aQQgSLH6vSXLJaDSRvcQK1b2QPORpACyj1W?=
 =?us-ascii?Q?9wf7SN+5OIxFYCihMjY4GGcc76CiwLB3Ko28nG4/i1wu/PtOJpqDRGU53RNe?=
 =?us-ascii?Q?gSWNipEQlnOdwzWoqjbRg4iS2dBKCD/95VNYBlC4+AWvMBu9Kl8QMLMx3KLX?=
 =?us-ascii?Q?bCqA1VqxosjtBji4vpNKUV62LAW3Rx3j/uCoA3P4ayPAbuuquMXkKjWuRiOC?=
 =?us-ascii?Q?7e6CCfffuBAhdugZqcjeiBRA68LSAZAlumkWSZEUCHXiV1KX0IGVWLkwyrS1?=
 =?us-ascii?Q?T5wxrB/Ry6W7i1WwFREqvRZD9v1jqHOzdXNgZK4+doIqD8uBHKXb9FnxGyr0?=
 =?us-ascii?Q?TOPwkoPSY3acU0j7UIvYUNlAU/IeqQW1eNeoQJz4/WUw7/2fGbsGoJe5gw7m?=
 =?us-ascii?Q?S5rdQqgy1ZxNfXtYwjtkX7PWqIVCmSn72HwWrcStZ8xSwMWYCZSDxiKkHWbl?=
 =?us-ascii?Q?dAN5rtFRAEHeTMLEUl8AXVtu/kiEeKrdW1d6NCi3UUfF/KdFaH3Sk4/wTA7U?=
 =?us-ascii?Q?DaM22YcQ2dx6cV/nPyyWnFJIuzC45QmnEaM/RpfsBmaCGsUr6vOpcGkzVmY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oRIeStowRzmPyvFebws/XSR20WkRfqNOJBSzAg+MOvznBa38oiVVLF0LK+oQ?=
 =?us-ascii?Q?TwdJbDewhsY4TmGvJbSxfNBE8hEHixk2k7xRIc9FTGGbUAGiCDImVDMkr6c6?=
 =?us-ascii?Q?ntgDFr9hJcqyuk2XGKMjrJx84QZj8NIBO5AQMbEPTrl3YqmsZ/Rtv/Y5ccPC?=
 =?us-ascii?Q?wcdj1LOsxrhPNLRO8PjYdts5e4Tw6ueou5BVi//UVxBuiGfgvkCBmSraELcL?=
 =?us-ascii?Q?8lO0G20zuT8+Z/Td+BHj6Cdxl1GClJDDw8O4FjF4Vwtr3W3o1lUtY2Yq8n7s?=
 =?us-ascii?Q?r9GMZK32KPdHKXdJce4IzLqUb9LMFYoJBktz46TNyoF/WCpmkfjb/RrUdPw+?=
 =?us-ascii?Q?8s5B5VW4qnp8KVMfVmtGN6hkW2fY1QOb6qK8BtTqmHyCXl3PMQbqhd7L9GW8?=
 =?us-ascii?Q?L3qUHwkuURsjLnXoQXDzbKORZr84R+nsYexVXmTmKTGcksyoYDMx8z/SWRjc?=
 =?us-ascii?Q?amnM/JHOovgyTQ2FS4GQrCA2IaawqXGwdzpVmz03AxTAN+7kGasoTQN98RoN?=
 =?us-ascii?Q?ytTGu+isLfy1/+Sg2uqDxnT3rUDyxYHugKLqmM8Pc8dwUGXQC2uGthf4qno3?=
 =?us-ascii?Q?xw/7YotKWLYJhKclaDOmsLk7l/cgsamTJCsMy7bJY9suozbcYAJnkl/Feyz3?=
 =?us-ascii?Q?3tOTrwoTghfopzwLduUKJ+lLdMN0qSNLcfcQckcvGQfJMgdkGC5v16CjdSbi?=
 =?us-ascii?Q?lTkBHiWS7K7J/grs/ZoewFyfrg2EFST4leFG5SMnVA7HK5mIvaBM3BMNRheZ?=
 =?us-ascii?Q?xf/sS2UR67Fc1ACaINQX79G3g8CVcrAULCE9G4xW5wp8ICeZ3BsAY6e+Y6fB?=
 =?us-ascii?Q?5D67iJxl2JNA1Qh4W4Z5okssm2G4uHwF3bkdQ4cX0Gf5bd0SxaJbMsSRDl/V?=
 =?us-ascii?Q?HcsSw2HE2MTF9x+oOxThOqKLx3TZoCQeYq6nrTnlX0ZptSTDMunEITvHtaWi?=
 =?us-ascii?Q?+WEJ01AW5qXsF25PIw8GR9lksEHqdcyFVA18VOIpfMhPfWSxY1orVHlvFwl6?=
 =?us-ascii?Q?JiXnRSDOp8rN6Vpl3PZ+HX9qm5BL1x66YHKaFucZRBWktO9GBHyPbOuJjzlG?=
 =?us-ascii?Q?zXaOwyeLeqdoG+jS1O0ydVd16meSBm/OvXHixuSQtjSLTSn7hl9+G7pmonM2?=
 =?us-ascii?Q?WVWFrLbVA7qtMydLR84MEN2lxuk7Pd8EoG9TpAPutxQN8ZRq8rpUjOLdxfM6?=
 =?us-ascii?Q?D1qQgErB0tbvycLQ0nYvB12i7k6tTOXWV6rsjbNf7KyJfy3ZmxF/zgmiIvvd?=
 =?us-ascii?Q?9vZw/0Et/2JNOIPHHWRC0gUD+LE8hOCFBkVNpRQ0mWu4tAzVct/1+TvsEu7H?=
 =?us-ascii?Q?zliax0Hh8eOwfuPLW5O1yyi3uJi+E05W3xz4YIaP7V/Bdl9ZPGpD8p7Hw6cd?=
 =?us-ascii?Q?9laBKQDBXfvzlpAXRWXILV55snLoMXtRDyvP7Wnyny5JtoNWTRgM2OcJ924C?=
 =?us-ascii?Q?IUc5SMXZnUSGYaDBu2Yg+TUwouoxVRSIF4r9JzxRU45rm78Sfy3RxIT7qf2G?=
 =?us-ascii?Q?mRA/3KvqEtV9G0/tPc7NnXfDlAa4yUtzWXmweApG9kPOJU7NlNRCMmHs0Vtb?=
 =?us-ascii?Q?euaVqcjDyfHIDDxoYexehf2HZW/52qBunIIkH2xfIK+PiLVuXtdtB1Y3Qsup?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c010cf1-3480-4afc-5ab1-08dce3b8dfd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 14:37:14.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18tt6t31AWZuCr5Izecu/OmLiPx4Yo/aTvXrt1iBcHV4RdoruiwqktNmzdsnLB9ZAML+pu6U2+rPql/UspaLsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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

On Thu, Oct 03, 2024 at 03:15:02PM +0100, Matthew Auld wrote:
> On 03/10/2024 15:05, Matthew Brost wrote:
> > On Thu, Oct 03, 2024 at 08:06:24AM +0100, Matthew Auld wrote:
> > > On 03/10/2024 01:16, Matthew Brost wrote:
> > > > Freeing job in TDR is not safe as TDR can pass the run_job thread
> > > > resulting in UAF. It is only safe for free job to naturally be called by
> > > > the scheduler. Rather free job in TDR, add to pending list.
> > > 
> > > s/Rather free/Rather than free/
> > > ?
> > > 
> > 
> > Yes, will fix.
> > 
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > I think we still have the other issue with fence signalling in run_job.
> > > 
> > 
> > I think this actually ok given free_job as owns a ref to job->fence and
> > free_job now must run after run_job - that is why I didn't include this
> > change in this patch. But I also agree a better design would be move the
> > dma_fence_get from run_job to arm - I will do that in a follow up.
> 
> Here I mean the race in run_job() itself, before we hand over the fence to
> the scheduler. i.e do the dma_fence_get() before the submission part like
> in: https://patchwork.freedesktop.org/patch/615249/?series=138921&rev=1.
> 

Yes, we ae talking about the same thing. I think this as is safe because
in run_job we know at least 1 ref is still held by free_job which cannot
be run until after run_job completes.

Your patch is similar to what I suggest, but I think the cleanest
implementation of this is move the dma_fence_get from run_job to
xe_sched_job_arm which I'd like to do in a follow up.

Matt

> > 
> > Matt
> > 
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
> > > >    1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 80062e1d3f66..9ecd1661c1b5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1106,10 +1106,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    	/*
> > > >    	 * TDR has fired before free job worker. Common if exec queue
> > > > -	 * immediately closed after last fence signaled.
> > > > +	 * immediately closed after last fence signaled. Add back to pending
> > > > +	 * list so job can be freed and kick scheduler ensuring free job is not
> > > > +	 * lost.
> > > >    	 */
> > > >    	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> > > > -		guc_exec_queue_free_job(drm_job);
> > > > +		xe_sched_add_pending_job(sched, job);
> > > > +		xe_sched_submission_start(sched);
> > > >    		return DRM_GPU_SCHED_STAT_NOMINAL;
> > > >    	}
