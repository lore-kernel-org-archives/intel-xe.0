Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A417ACCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 15:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6982010E859;
	Wed, 15 Oct 2025 15:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4kupqYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7916A10E857
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760542488; x=1792078488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6dQb7vTfgwA6qNs8XBPVhutCzPsmeRULcdT7rgMofUc=;
 b=S4kupqYX1KFd5oe4SBBau9mC227x8ZMuIhE2ewVBNu8lXk0wgCnoSmDP
 Yj/Wk4+x8EsVbrAaV8Gn3WBAiGpupvFaCMDMlJa2V+OUh7aiFcjgpo2JP
 HTHmEkfDnhKeHFSBB4THzAdPbHOvDWFrz+FFQox5NDp0TL9KIXTOwvACJ
 A3RKP2sa2Ni4zVeNh67uYChTPtjt+524hFUBZgI+VNraP2DtIRLcQKPcj
 YLRDFaRFnA3+MZolifrSUJ4yGk65GOWjV4LFabD2MYX+R2VRX5cD2U8fW
 lC9GQOE8ET/3ulJcoUxvu/Fe2SPjSLJWtk4WrpHnyjIE44qUt7Qok+sCi w==;
X-CSE-ConnectionGUID: rRvjopptTiq4Om16XGO8Dw==
X-CSE-MsgGUID: kGFDPi+YRSSYamULM/Vgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62764107"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62764107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:34:47 -0700
X-CSE-ConnectionGUID: 9iADpY/4RuiLeHw5veX33Q==
X-CSE-MsgGUID: h5zliFJLS8SpqtG8CeIZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182604959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:34:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:34:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 08:34:46 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 08:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Idm9Gnspy3ywSQGsk/GBpf/e+odXE/cnff5jQLMjhsye+vM4IAU1XW7GK87hvgFcck0TEvZKzCvoxep4v+QuapfcjIp/vKlxk7otzOSmQNxP1cZ2r6oXlX2XHwakIQGuxh1xskX6QX/RjpOJxNctuWlN2kU4VcrUcnj/88UZSsENUvZmyKt/zYjQMCW95CqtIZWA3kVWRxIv/N628BNxlX0OrgvZrBIGZwxl7K3rlCiugUqDx4o7PNTAM/q80FlKOUjDVq0+8iyrklR/536vYMYfjftB9gvCMFqarXKsfRhJEmD27kYSsXrE1OVluJFd/v/F3LXo316LSxMupaIRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9GBC91anG63eV1MyrEK75gjG4wkhND4IRmc3U08Lls=;
 b=YIeZBwp+z/w6/CCKx7S8R2+2Fk2S0mCMUrnIRh4J+e3ccqQFymCQYUOY/si9TJlADux4nieCKjRP29AnNJmJK3OGY7u9m0GoZ+sgIm6mDxt+ojZ0oFz54TBr+O1thgHAjtxsr4dbVps6tXWp25JT9XMAOoh69jzExNIaPJTwi/vYZ25NLJbIpt4V/NMfQEl8lGW0iRB3HN1TqiRGN/E/9xZMtq1EDzvI3qdZ9QpD6cBhcONyrLyDkR12QyMKA+QPGkoSL68WZeOXh5xAnJGs4qbU6dy6RWqZnpczsgUEtk/Wc5clK4Vsus14dOvWkFZuLjcvEUpyhAXH95ksfUn3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8428.namprd11.prod.outlook.com (2603:10b6:806:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Wed, 15 Oct
 2025 15:34:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 15:34:43 +0000
Date: Wed, 15 Oct 2025 08:34:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc: Expand guc_g2g_alloc error hanlding for
 future change
Message-ID: <20251015153440.GK1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251015151053.66931-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015151053.66931-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f47596-dee3-4f8f-9777-08de0c005d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RzENqxYWcFOzDo0pHih/MTsWUi23BLZ7EXxNhyLFYK6W1jVYlfJzMaPzPwtA?=
 =?us-ascii?Q?5pww8MRoG5c3oJXJZNKQsKyTNym1I6f5c0dfmYyOgeyx/sZmM9UIrXg86lWz?=
 =?us-ascii?Q?dMevr0wzUUhU7k0TxdiOpF4//tC9WDMwby/bzRdgCbk2NsnfboAa+CY6/NBl?=
 =?us-ascii?Q?RXpVLRXH9+iMQubN6sVjgkOWYXu0c6ycT8rU4YNECc+d58S75Q9XYM9ThYbk?=
 =?us-ascii?Q?VaAPwWydpKLVXdxRtObl3VsSFSy/W5nNdBf/Z7bSLUswA67/aNhsqRMmk9sO?=
 =?us-ascii?Q?1IfLaNS6evFmc7fFfYvbbpWtF95v0m42NbK/FMim4GXBMELuLNyzpyFA/Sbv?=
 =?us-ascii?Q?Jph42j9r/0L9MMmMMklaJtKWKuEzzswwSzLz8kr++nt1PYWh0dUI3pXhtabt?=
 =?us-ascii?Q?6IMyip2qZVIuGICbw7r/pTPXIo7hRKyXPdZzxmoMFYm4RxTXlKZ7QQ5+dh8j?=
 =?us-ascii?Q?q61JUOEv0zYkvr8UOUdRXnnJZs2pdib0k87z3iDHnLk3jcgDnSE4BWpFEbHE?=
 =?us-ascii?Q?LMO0WvN5ZXSb8OlFmFrgzr59OM9bqWeRS1I8WrgGSAR3/3h1f4v8JPJB0TAD?=
 =?us-ascii?Q?1F0LsnnzXAUOYK5E+YIdckZjl797vJPTva1yaZ4hJyfNrl8QY0P11RhrQNU5?=
 =?us-ascii?Q?1AHG08HEfKpQyVGe4/6vFgl6E06V4hrZd49szrrP31wloJnIIeq1L2J2sV46?=
 =?us-ascii?Q?k7MmMrg2yllQIw+0go+QBKtp8e8j8BXJd5sXhOFmYqk2Po+g0WK1F+A/Dgnl?=
 =?us-ascii?Q?48O2U6i1YaGX0rIPZXnRSSISooJOfP9/m+WENqDrUGOoS+mpwDYCGC3Xghrd?=
 =?us-ascii?Q?6oiM53bOWW1YVYbudUICxNTReoX4gNJjc9TXF7fWxtQyIKH3mkrZMHLXhw1Y?=
 =?us-ascii?Q?EM5zo0d2jjGcBvsAjekywns9jNs4Ux8H0Kcxo9EYElTy79x8SecBukNdfg3x?=
 =?us-ascii?Q?5KrWD7psVheVgz1XIdolX2VfSWTwgCi4p8ARj60KO68tiD/b3fI2jS8ydyTY?=
 =?us-ascii?Q?q3nc8V7jmOfATilsftXBLLsp/YR8CWg0Q0XwYASzY05twZZ22NmNP8JwbPmU?=
 =?us-ascii?Q?yObcv7y8KAYKhwtajsyPcndp+N0Q0M+mKOL3D+QoAoeLyojpXKnbkr9hToOU?=
 =?us-ascii?Q?lERZq9+nDRon9AXHVIM0rMK+3VzXdLA+OzroVo7e0SPTeYNHzhbMFPtb3JKK?=
 =?us-ascii?Q?j4oTeQSWFwa3894XadI5SnXiXTYZq+Ylq5lpqG2dKPXq5V1nes+AR1dTqKtt?=
 =?us-ascii?Q?DKw4bbzYSnk7PS2oDiFatmj9NPnwguuTOpoaOS0Z57xACDdEqLVd4Fjr3pT7?=
 =?us-ascii?Q?IRsFxMZBAhEMAVWprww/U4nuwk5LvkMfzL4OQlxLTzy42QXU0Zb0bDGWYtbU?=
 =?us-ascii?Q?d5h8cvKnCWxJ72182Hpvy9wbKQQo0i+0+RuP7Ve6K/JxB6aJpvS6UQCxTp2x?=
 =?us-ascii?Q?rb3ES+KYND0nN9qxgl68gD31s23TnA+A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W6R08q+B5A3Pin1ntmSHHBni2eqnqevyI0d6sDW0pIwtvE6gt1KcqRCAQ4Pg?=
 =?us-ascii?Q?3zdKloi0R7/xOirq9C8Ys/QUwU2vFuXk1p10sslg+IJiPvEJDgocUNc6n3Lc?=
 =?us-ascii?Q?zNvVaeK14bovzOlEZF5L3CCUltr1a3IK7dyuuZTBjEjBGKkxQ2rhmhY7bvxz?=
 =?us-ascii?Q?ZNrtJj/gFVgoRJx0rXui1kK7c6DI2G/53yaT9Cv+bqvNiWTi1Lhdmlke/Tb3?=
 =?us-ascii?Q?dRv3Yilp4GVFe1s8MlLE8Acer8VdUeeyAPKO7E7cenf+k/wmbJJ6uQyaf2Xp?=
 =?us-ascii?Q?NAveALP2auSIUpsWHpO43ccYo3OhbYjwX6zVv9LdjM6WvSX3LQlgAQ9Bam2c?=
 =?us-ascii?Q?5E3SplQDw85p4Wo5l+ZKiTyrpahN6XI/DgZcscVj0hqakgDSVGPJQWO1QDYe?=
 =?us-ascii?Q?+oF6sH4FEupQ9Oas0eQmDttLCmNuv3CfS4RdaQGXQpe9Ai2S+i7xxc0D09kd?=
 =?us-ascii?Q?DUfRYtMjQ1NKKoo2PXmi75Mutus1OOJ5JJxvx8P9hbflQavH1SR3kgUIe/Mb?=
 =?us-ascii?Q?GfYTj/gtFK95o1Vres2JESNqFomz4AX1UI67DluHUs/QCe13vzCQ4zrZgOju?=
 =?us-ascii?Q?5dJ1A9DiiAO1i8FvD96Ce15RnppssLxKSVoRNFFFRYBnUqO0Ro0c6FLiflW1?=
 =?us-ascii?Q?dzMcXIAGVzDLE8FEdtWzivhc7j9cCbg9sW5MCysNfKluLWz8vXgsDKH2SwxY?=
 =?us-ascii?Q?PHRsSkozTk+80srcEVnq+nlfqiUt5/0A7VcohPLTZ4DnRHjG+DFF15vEsNz9?=
 =?us-ascii?Q?b5jMxEx6gnNxCbIhQoZyvSAs0VkxhnMvHi4LoLlVIlQCHtejnClBCNybH2Xe?=
 =?us-ascii?Q?bHhd/H1thoQVV8jQGlKZeY4J2FmIZgK39SFjGz7cRhzQ7bEweW5acUDiLgDe?=
 =?us-ascii?Q?bsDWKC0kuY6BZrOo8xYBnqhGkXV+SKqXrJZ5JOcaxxambD0GMWPUAfteObfE?=
 =?us-ascii?Q?+eeo3q2XyHwi2OqyAVyffFqCb+UveufDM7CHxnFywKs1qoze2jP2sSe7oZEg?=
 =?us-ascii?Q?TPwCH2yIwI1o/XFHwLYD//fREaeRbb8IoH58W48UMML9psc9qdUzgS/KARs3?=
 =?us-ascii?Q?/cmrzbjIjPR3Bt+AG/BO8G+QI2b/Bc4oy7J2QRQoZ1khooiN3T9Uyq3NgMeP?=
 =?us-ascii?Q?4WaOEC73MF/QIjVYYuz6/7GmR0Dh66h7Xgsysa756QIl9uHpJWshRqfXbksb?=
 =?us-ascii?Q?2PLiqF7tgLuEFmTNFRjMO7leIdIQRieEVpnWu86bN8mtlKxXEweoKmRlU1mv?=
 =?us-ascii?Q?LyhlNsmgUsV0W48feLCr26rC9QhcwIoRf62q7GWW2dgB9a+l0UB1/LE2jHDr?=
 =?us-ascii?Q?4UG3gOQqMou4PI7F1QAsCn/FUXlQDsWtBS7Kh4iL+vKIRnuo/3/qRlBgtHyc?=
 =?us-ascii?Q?0C/RPE/v2iNrrRt1LtV3KNxy3wt91xHWc62zzJkgxCL10orpmCYJoSGuDmI/?=
 =?us-ascii?Q?esKCAAi2xql+cntGrR3C11YYzjYAzGX64CWnfhvCm9mxAoTWTyvXxAuMaCVN?=
 =?us-ascii?Q?vUO+F19DPCXc1X3rY82X2F3UoxYHiYT8Lt1jDiskm+7AjoLvEld3UvaBva1m?=
 =?us-ascii?Q?cpgKq3lVxTiFgKxnQPzvdWNHiPXeTYk1TqHS+NxHDFJuNlPoygVJ/MW/U4CM?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f47596-dee3-4f8f-9777-08de0c005d21
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 15:34:43.6476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojzUhVNE+jwieGIQ/ED+NwJtKcAtjF+6Hrw4XJJ/YVsuNN/EoefJAY8ygZmcj3Bcrr1iYGZNEh23scw2kARoPHY5eNSOBJGjePLop0UR34k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8428
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

On Wed, Oct 15, 2025 at 03:10:54PM +0000, Jonathan Cavitt wrote:
> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
> Hardware-wise there's always at least one tile, and every tilie has a
> primary GT.  If something went wrong during init of tile or GT and we
> couldn't create/initialize the structures, then we already aborted the
> device probe immediately and we'll never get further on to places in the
> code that would be chasing a NULL pointer.
> 
> However, there's currently ongoing work to allow the primary GT to be
> disabled via configfs for debugging purposes.  Once that lands, it will
> be possible for this query to return a NULL pointer.  Expand the error
> handling code for guc_g2g_alloc to manage this in the future.

Rather than blindly adding checks to any low-level code that calls
xe_device_get_gt() (and then raising errors that we hope will do
something reasonable when propagated up the call stack), I think we
should be putting more thought into what these functions are and how
they get called.  Functions like guc_g2g_alloc() are something that get
called deep within the callstack of GuC-to-GuC communication.  We should
be thinking about what the purpose/use of this code is.  If GuC-to-GuC
always requires communication with the first tile's primary GT, then G2G
itself should just be disabled at the higher level so that we never call
down to this part of the code (e.g., in xe_guc_g2g_wanted that already
has other "is this possible?" checks).  Or if there's other feasible use
cases (e.g., a media GuC on one tile talking to a media GuC on another
tile), then we should be changing the code to remove the hardcoded use
of "gt0" so that those use cases work.


Matt

> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..fbe66722e852 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -467,9 +467,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  
>  	if (gt->info.id != 0) {
>  		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +		struct xe_guc *root_guc;
>  		struct xe_bo *bo;
>  
> +		if (!root_gt)
> +			return -ENODEV;
> +
> +		root_guc = &root_gt->uc.guc;
>  		bo = xe_bo_get(root_guc->g2g.bo);
>  		if (!bo)
>  			return -ENODEV;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
