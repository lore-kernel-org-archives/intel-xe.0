Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC452C10F16
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 02:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FABE113001;
	Wed,  1 May 2024 02:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qg+jfqZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D59113001
 for <Intel-Xe@lists.freedesktop.org>; Wed,  1 May 2024 02:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714530384; x=1746066384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MOQQzHfwL8zBdccrNJyO0W2SYeW3Wo9SYPfIvAQ7EHY=;
 b=Qg+jfqZ3ke2Z6Ys1/or3zyrqCM5pt324XkFmiPHrBsSiPWQpW//lR8+o
 eB1qs9yIUxlCg1sEHBJvv909cpbwUWrEtrIJZ2W7gfgYgLsi9n4ZBYgxt
 EstSHMN94v3UJXZTJEEp8ynQWV1eQR5OopoDfuxAeb9YNWfO5oR7f/cg7
 /zpyJ5O/63A1nJkISL+mf7lZucauUYlqIJuv55udTFPENPl1tGOvgFs8P
 aSRWNcSjuj5xYa/y6qB0IJLGs0ZGWgOETMpHbb3jLMZpQgzJEuYvTgrMO
 1evAUAV3K4dZvMAd9EUsvhkoy8M/UezN2krNPgjGG23dQ9XL0ceL8sGrh Q==;
X-CSE-ConnectionGUID: 9jqQuo2jTZeFNkr5TL203w==
X-CSE-MsgGUID: lBHc6n5oTemK2Ln6DNm/WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10805460"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="10805460"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 19:26:23 -0700
X-CSE-ConnectionGUID: QxQt5j2qQ6Cwgo7wxZunsw==
X-CSE-MsgGUID: TCpuQreVSVCtFP06NHpa9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="26746411"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 19:26:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 19:26:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 19:26:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 19:26:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 19:26:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDJ0UeMN/8heR4QQpCUXcL+0qVEkbkXCjsXf1kVkAJFIesTx21BjTGQbKvstiae3tZHZvrNDZvuqTIMdAOXcq41BwkjgHmdzZV2kniJGlB5U9m57oIm6FpXr6Uc4ynMr9KR8dFbBUjNpLC5X9uuoJF2+pzY+0GL6RzrOa7Tjf79/NAbivAgQGjKg8o3pgNtm655VJuwVkCIvdBVPA5kRSmkqOCdmAQ2MCtZP2AEJ09mRGdETcF8uqeovKWpNrRGR9Mj5HJGUKFSydBEpMeRzGhQspsoQxheUMfB7MGie4G8jj4AgcOMTt1BPnh9ouOz9lnDG4tYpoy7Bh7+dpiVFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q7oD2iO0CG/dl90O5l/4/V7XWkFyAH2Qj2nbrdJT6Y=;
 b=FJB2fp6rK7DBIadGvAqB/bISFKxtuigvIRXluidD+B5b3SMCL/flte3Rw1YdCSjkFgjdH7YNfqJI26PEJafzp6HQK6INPHNdzFmZbGtZxo7bC/z8iANEkTPS2qFvCKHyfu+DxOQF8Ca9LKD3hWtqcT+8lBar0pFOHruG53XNgl99zxQwXI+RVLM4TfB81zLlEuwfvxa42KVQoE1OtOFs50pAZ40Cis8WTOSUkrbrCGfUbGJoKAXUy1OJCbKQcBXNKRfdXAyqFTGTYlktoI9Mh+c6+FBl+U/5w4JqUiulIl4DfPCeZalBq56Q1tWqgOsI1uKWTYWtXCWG7STtSFrD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.37; Wed, 1 May
 2024 02:26:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Wed, 1 May 2024
 02:26:19 +0000
Date: Wed, 1 May 2024 02:26:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Improve robustness of GuC log dumping to dmesg
Message-ID: <ZjGoQ/B7abA9v93/@DUT025-TGLU.fm.intel.com>
References: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
 <ZjGCYRp7J0/b1MiW@DUT025-TGLU.fm.intel.com>
 <5c8854a4-24f6-4106-9ccf-8764e1041580@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c8854a4-24f6-4106-9ccf-8764e1041580@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: f49c1c91-0032-4dc9-c341-08dc6986161f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fh66KzVDbwf4WgV6zyzcZewY1iE8rc/E/oy1hcxFAIkcMs7BPlBTLRxihPMm?=
 =?us-ascii?Q?Bmg/FfeABBcgiBGErWMVsoOAMxiwUrbZES4toJ7+PRaUxRndY8TXyJJHpeTq?=
 =?us-ascii?Q?87UK0EIa6ZbL+zyfMs3oEuBdRJ9FkmhoIGKkZOjP51fOO6HrBtFTi1mwrF7c?=
 =?us-ascii?Q?flBQp6PJpANEGChctyaJzYHYOFmMntTDS+kA7e50lZnEbx1LVUcV9lVsjIYM?=
 =?us-ascii?Q?WH2yO+TUuxtRLYcbjhMXmrbl/z5BehafuYZYmD5o37qXQHLmMSmv1h6GL/5W?=
 =?us-ascii?Q?/IzH7+3Vy1iPMuhv4I1Bq/xHBr8+piPb1VXVs138skBGC0Rj17UxD+CMI7QF?=
 =?us-ascii?Q?lXz9laECvaikWvyIGg6+A2884pyUMXfKVXq1l+I+y1jc8i98KxGp6qL9q3XU?=
 =?us-ascii?Q?1TU73gTFhcEY7U4PxAhHFiOAAwDcQEf1jwKGOvPlcU7AYzlteYkhT2iniNwe?=
 =?us-ascii?Q?n2DKoOc0crhjCeix0ntsRXoRvSjb3ryQ5vBWDHGTeFWqs3nw4HGu0Dvo8m88?=
 =?us-ascii?Q?Z46jdZNjRurGmZhlppfS6qJXjTjZ0+XYcojiOanWWIHFSbGsf1Wzo1OMe/j1?=
 =?us-ascii?Q?PqUAJAlkl/7zX6AIxiOJ91j7t2nW2xlJ2gHHU+Id5RFH/Q2pqVgSWnHY6gwO?=
 =?us-ascii?Q?EGe3EyzL08K4IyBlNw8Fm+/Lz+Nwg3EkHuWKuNLCQ55mnfo+gOWEU5+kkSrd?=
 =?us-ascii?Q?C6Y4+YztBmnzBS03+yZBDfu3gFVdQORW0kQZDzIcjP8y4bk3boDDNiqDYauf?=
 =?us-ascii?Q?J0fSU/kfUq9d/3yXTMnGF9bPiwZ8TlaC7NvQiCMvuAV5S3qvJHN9OjIuYEcM?=
 =?us-ascii?Q?sRt/QTWkmSmIBB/Eo8LmEGPccL2dqROJcp69FU0nRJ5ozNunIfKHQ/Dp7DPM?=
 =?us-ascii?Q?GxREBwdm+pt9KwROIIcXkzm8PBv59ENQ5XyXPoYorzNDotO3HPUWfNwsNdFj?=
 =?us-ascii?Q?0OtnlsX8jV1lKC3oqj07M03+JzBQjW8k+68TtDfQ4FSs2UeJorbZEzYYDrB6?=
 =?us-ascii?Q?knJvkiVtvbkkhNEQhJOL2n/fRLA/veH6ZxAp69fvORBkcKL6KFS1L8xwcyyo?=
 =?us-ascii?Q?Bm7+Zqer+xqX9TUbvGy0GymXf93K5egzqhPbYTADzJRqgLzivWrpXpwXNXpO?=
 =?us-ascii?Q?Q3Ku+5nwp/U7gLjXK/IphQ8Tv1RK2CGpdprPSn47mVfNJ1yLh8e/41UZ04aR?=
 =?us-ascii?Q?bE9zU0fhH+kcLwxLuMwAd6dOkmJwZh3A1Q8mwnajl8mb5Lwj7SgUTT5TLRA2?=
 =?us-ascii?Q?D5UqEWFnLOshQrGnjUjuRLIzeF13GiWNs4ue6fzP6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8S+8o/zQm3oCABleVDGWK8GlZwW3fnz20GXBeiFgC6ltwcoqL13OEnm+W0Yq?=
 =?us-ascii?Q?E94TA7F33afP1c1OPnsscWMUbNR+X8tY1BqB/6uamWBwvOxwQbugUTNKyq/S?=
 =?us-ascii?Q?doGZeLif4D0Pou7ZcQ7GCAIT1faMFpwqBqyWzjsDo+vH1zxlH6jjVYyjfUxx?=
 =?us-ascii?Q?euBb/dCGvPJ4TpxvWGV6T3NGAQQQm5KBLaYlEttmMJhx9tPkvbpLdx91VN7Y?=
 =?us-ascii?Q?2Ca/yhnKF8nfzDBMbEc4OrRZBQtOdtpyU7TRtSihMmA/nQy4la0PA0WYV2za?=
 =?us-ascii?Q?Vf7lZ86v3IYBODdXPs5K5ze9z3HL3YdkgdHOTRxsU0vieE8xzmH079UHsfsl?=
 =?us-ascii?Q?Iwbd2W1O77oVxjeihBI2P/FL5+qW8RWxzNBqZzxQClDn2Bx704GuI+BvMgh9?=
 =?us-ascii?Q?fASy2l91oKGLCxQxXlPxnwhkDu1EZwMiossJFy7odoQkjlsn0CBZW2dzSYk/?=
 =?us-ascii?Q?2Gsj2ntYUGuoJWFjWMBQ4w/+GsfknnW72uv7SVHlhQKrXa1AU0h0Y3YxJxqi?=
 =?us-ascii?Q?9PMlrjeeLjS/YeK1PGE7DGGNFtmB1R2mnKUZVg/TmhvkqgG7sBHk0TwR2HfP?=
 =?us-ascii?Q?k/hXzgmXCESyBsZglPwbeR7aPjwZP0Pb865vSd94t4F0ouVuuM+KTNKazZFs?=
 =?us-ascii?Q?/r+L1gZMi4UC7K2LNc/pxuWaB4Y/8vRfxcq6aZoZzblKUcCwSFktLTDtK6LZ?=
 =?us-ascii?Q?+pLznoaFThfLXhmgn/7lT1qtg/e8yegMh/YR9Vo8M+LNa98SsFzL4y1dohGR?=
 =?us-ascii?Q?rBxhAsV1F3t7KuXYwuquO5MoBN4SZBwVjGu5rf22BOZZ92wkZ1JalmZyWRf2?=
 =?us-ascii?Q?sIuYuhUd51Vr2/6ULxhTjc1qEkkoBT92pfeqXBOUFu/hIzJsQcUb47uBl0em?=
 =?us-ascii?Q?Zp/5SlxcdsGTb+UjNNdmGBoFr3uMP6J156HuZpW4ygg0HfplI4y77NhHJbhK?=
 =?us-ascii?Q?QORLTAEmfcqm8/lCm2rbiUswq0H/KID5WzAW1X2Y8IeJtIGykPUxy5dEkqIq?=
 =?us-ascii?Q?AR+x4rHOzJWgIIQdNG6zslDH/Zk/39A9senNU8ML2XwO1W3kSiBAAS8dzGqR?=
 =?us-ascii?Q?4kT+qOJqcziufZiJ9cGQfFHDZ4Hs5zfUjRBzN5I1DDBwMdwK86RuhowUtn+D?=
 =?us-ascii?Q?QA57+LSQMHE3YPWE8szs4aS8ca2qHkhmaLeGa/x+tTXAqjKtNaA7Aur2PiNF?=
 =?us-ascii?Q?eY5p1xwdgVXt9+5XOyzqWwhfFYa1fQOeUcZSAO1fRLwzO9eRzHGDUtfd/oLQ?=
 =?us-ascii?Q?EAxWXZSGSQOlSqW9v3LJrs/kTt3ECZQlRPg9AEEq1iv/zEhn//tRomkSkIng?=
 =?us-ascii?Q?YxaQxgJfrf3XBZd8F46wW8cRNG2KSEjHdzlTK4tFI/1M7qVkHgj1B9gPHnmS?=
 =?us-ascii?Q?ooXlh+sq9cK3SNA/3Pm5Hng88xqXVilDVh1aG+WO8sorXJTCaI0WB8Y6HNKP?=
 =?us-ascii?Q?DFh+F84eO/njUCmq9SYBkWJmBCA4RcVhK2ikMdn9BkprNZHQnIBJS+4S0fA3?=
 =?us-ascii?Q?B3wN8ob38ywZbxYNoTCE45LruZDR4SBItVf7VsXiA1kTFuPDSSsjb8CmfyZK?=
 =?us-ascii?Q?9atn8BxrmJ0obsHKkabQtuGm7G1cTKEzwsWtXcIeIDn4Qcv9o978TelWccwB?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f49c1c91-0032-4dc9-c341-08dc6986161f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 02:26:19.8642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UrFgQZ+G1/vY/t1+UVqnTHwySwpJRlUn7223cXdzRil5XtnZcegEar5QJiMHY9hd8VUYTtSpjYwR/3pqpOXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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

On Tue, Apr 30, 2024 at 04:56:49PM -0700, John Harrison wrote:
> On 4/30/2024 16:44, Matthew Brost wrote:
> > On Tue, Apr 30, 2024 at 04:34:36PM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > There is a debug mechanism for dumping the GuC log as an ASCII hex
> > > stream via dmesg. This is extremely useful for situations where it is
> > > not possibe to query the log from debugfs (self tests, bugs that cause
> > > the driver to fail to load, system hangs, etc.). However, dumping via
> > > dmesg is not the most reliable. The dmesg buffer is limited in size,
> > > can be rate limited and a simple hex stream is hard to parse by tools.
> > > 
> > > So add extra information to the dump to make it more robust and
> > > parsable. This includes adding start and end tags to delimit the dump,
> > > using longer lines to reduce the per line overhead, adding a rolling
> > > count to check for missing lines and interleaved concurrent dumps and
> > > adding other important information such as the GuC version number and
> > > timestamp offset.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
> > >   drivers/gpu/drm/xe/xe_guc_log.c       | 78 ++++++++++++++++++++++-----
> > >   2 files changed, 66 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > > index 11682e675e0f..45fb3707fabe 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> > > @@ -82,6 +82,7 @@
> > >   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
> > >   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> > >   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> > > +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
> > >   #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
> > >   #define   GUC_SEND_TRIGGER			REG_BIT(0)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index a37ee3419428..ea269efd9c21 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -7,10 +7,19 @@
> > >   #include <drm/drm_managed.h>
> > > +#include "regs/xe_guc_regs.h"
> > >   #include "xe_bo.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_map.h"
> > > +#include "xe_mmio.h"
> > >   #include "xe_module.h"
> > > +#include "xe_pm.h"
> > > +
> > > +static struct xe_guc *
> > > +log_to_guc(struct xe_guc_log *log)
> > > +{
> > > +	return container_of(log, struct xe_guc, log);
> > > +}
> > >   static struct xe_gt *
> > >   log_to_gt(struct xe_guc_log *log)
> > > @@ -49,32 +58,75 @@ static size_t guc_log_size(void)
> > >   		CAPTURE_BUFFER_SIZE;
> > >   }
> > > +#define BYTES_PER_WORD		sizeof(u32)
> > > +#define WORDS_PER_DUMP		8
> > > +#define DUMPS_PER_LINE		4
> > > +#define LINES_PER_READ		4
> > > +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
> > > +
> > >   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> > >   {
> > > +	static int g_count;
> > > +	struct xe_uc_fw_version *ver = &log_to_guc(log)->fw.versions.found[XE_UC_FW_VER_RELEASE];
> > >   	struct xe_device *xe = log_to_xe(log);
> > >   	size_t size;
> > > -	int i, j;
> > > +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
> > > +	int l_count = g_count++;
> > > +	int line = 0;
> > > +	int i, j, k;
> > > +	u64 ktime;
> > > +	u32 stamp;
> > >   	xe_assert(xe, log->bo);
> > >   	size = log->bo->size;
> > > -#define DW_PER_READ		128
> > > -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
> > > -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
> > > -		u32 read[DW_PER_READ];
> > > +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
> > > +		   l_count, line++, __builtin_return_address(0));
> > > +
> > > +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u\n",
> > > +		   l_count, line++, ver->major, ver->minor, ver->patch);
> > > +
> > > +	ktime = ktime_get_boottime_ns();
> > > +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
> > > +		   l_count, line++, ktime, ktime);
> > > -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
> > > -				   DW_PER_READ * sizeof(u32));
> > > -#define DW_PER_PRINT		4
> > > -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
> > > -			u32 *print = read + j * DW_PER_PRINT;
> > > +	xe_pm_runtime_get(xe);
> > > +	stamp = xe_mmio_read32(log_to_gt(log), GUC_PMTIMESTAMP);
> > > +	xe_pm_runtime_put(xe);
> > Just a quick drive by comment, fine grained PM control like this frowned
> > upon in Xe or maybe even not allowed. Rodrigo / Matt Auld would would be
> > the experts here.
> > 
> > Presumbly all the callers should already have a PM ref.
> It wasn't clear that this would be the case.
> 
> And the whole pm_runtime interface is exceedingly confusing. _get calls
> get_noresume then does a task ownership test and calls resume,
> _resume_and_get does exactly the same but in a different order, plus there
> is _get_if_active and _get_if_in_use. Plus _get_ioctl which is for calling
> *before* making an IOCTL (where an IOCTL is a call from the user into the
> kernel!). And none of these have any documentation beyond a single sentence
> that is simply re-writing the function name with with prepositions added.
> 
> So I am unsurprised if this is not the correct way to do it but I have no
> idea what would be the correct method.
> 

There is a little documentation, from a xe_pm.c:

 60  * Also, Xe PM provides get and put functions that Xe driver will use to
 61  * indicate activity. In order to avoid locking complications with the memory
 62  * management, whenever possible, these get and put functions needs to be called
 63  * from the higher/outer levels.
 64  * The main cases that need to be protected from the outer levels are: IOCTL,
 65  * sysfs, debugfs, dma-buf sharing, GPU execution.

Also the functions appear to have kernel doc too. Agree it could use a
little improvement.

I don't think the work on PM is completely done either, but the general
rule is PM refs are taken at outer most functions per the doc above.

So if this function could be called during driver load, a GT reset,
debugfs, or a self test those are the places where PM ref would be
taken. With this, most parts of driver should never have to take a PM
ref a fined grained level like this. Again Rodrigo is the expert here
if you want more details. Or he can correct me if I'm wrong about
something :)

> > 
> > > +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
> > > +		   l_count, line++, stamp, stamp);
> > > -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> > > -				   *(print + 0), *(print + 1),
> > > -				   *(print + 2), *(print + 3));
> > > +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
> > > +		   l_count, line++, log_to_gt(log)->info.reference_clock);
> > > +
> > > +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
> > > +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
> > > +		u32 read[WORDS_PER_READ];
> > > +
> > > +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
> > > +				   WORDS_PER_READ * BYTES_PER_WORD);
> > > +
> > Also I think the above pukes without a PM ref too.
> If that is the case, should there not have been an assert about having a PM
> reference at the start of the function?
> 

Any MMIO or memory access has that assert. Adding it in every function
that touches MMIO or memory is a bit redunant.

> Although I don't see why a PM reference would be required to read from
> system memory on an integrated part? Maybe for a discrete part. But I would

It might not be... but in Xe we enforce that all MMIO and memory access
(at least memory access through xe_map.h) has a PM ref. That design
makes sense to me rather than special casing sram vs. vram. This also
aligns with coarser grainer PM control.

> assume that having a vmap in existence would mean the memory is locked and
> accessible. Either that, or a vmap is only allowed to be used by accessor
> functions which themselves do whatever is required to make the access work.
> 

We pin memory that has a vmap so it is not moving. A vmap ultimately just
resolves to pointer too. On PM suspend / resume we restore to same
physical location too so I don't think we ever unmap / remap it either.
I could be mistaken about this, haven't look at that in a while.

Matt

> John.
> 
> > 
> > Matt
> > 
> > > +		for (j = 0; j < WORDS_PER_READ; ) {
> > > +			u32 done = 0;
> > > +
> > > +			for (k = 0; k < DUMPS_PER_LINE; k++) {
> > > +				line_buff[done++] = ' ';
> > > +				done += hex_dump_to_buffer(read + j,
> > > +							   sizeof(*read) * (WORDS_PER_READ - j),
> > > +							   WORDS_PER_DUMP * BYTES_PER_WORD,
> > > +							   BYTES_PER_WORD,
> > > +							   line_buff + done,
> > > +							   sizeof(line_buff) - done,
> > > +							   false);
> > > +				j += WORDS_PER_DUMP;
> > > +			}
> > > +
> > > +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
> > >   		}
> > >   	}
> > > +
> > > +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
> > >   }
> > >   int xe_guc_log_init(struct xe_guc_log *log)
> > > -- 
> > > 2.43.2
> > > 
> 
