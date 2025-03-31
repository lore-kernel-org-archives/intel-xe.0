Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F527C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 18:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BAC10E478;
	Mon, 31 Mar 2025 18:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKFMlT06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ED010E478
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 18:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743444718; x=1774980718;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5xTMpe2DIrWCDFFRSLiEv1FhLkBw0XiLz2UrIXb0vsE=;
 b=CKFMlT06MdUnArEws+rLhGuALLOfsXhEdEUfV/lHxnps5iA3+ppxrS5A
 0siotsPOn4x9ywZc/NoY9qaRaGQdopgItn22WIe/jAH1YgKXVpv24hwAT
 G+sot2gt/nZlifv9GhB13AV5JqLsbtcfJI4yJDqylCA/Qcd3xeMEf5igo
 adywlaOUG4RgEd0kn/ba8ZSjZBNptO5z6GH9Ob+TE/gGGKXHbMoYabwvH
 iTnjI/1kylT7SThSoo+o6Id2TpNxtE9Wcjj42iGY0bvFljVVTsQe0/Gxj
 daDQ7T0VpjUt0xmqFpHUyAdSOAdOUxm9pFVCy2vHGh5LNVEAUxNi5svRX Q==;
X-CSE-ConnectionGUID: PBzvPqpNQFGJ+hEUnbYcwg==
X-CSE-MsgGUID: 67zNVxbiSHa/dz4C7cs4HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48408658"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="48408658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:11:58 -0700
X-CSE-ConnectionGUID: +OXL/4BDSWycclJSnFn1dA==
X-CSE-MsgGUID: M1U/dY+JSMCa9q6ok3vfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="125978747"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:11:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 11:11:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 11:11:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 11:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUWh+7CVQAlnBONNTdQxH0NT9AFazbO0x81m1xPynATzqUHmGe8aJonNcHm6JuiQp812HQXY78FfTglqg54UNNF9TcJiwr1eQyMAieLcjted5bHZ8PuqAsqz5l7WwURCD+Y8Hpa9fVnp9BIS4L1L8kpwJp83usltIPl2MRCsYsmiNBDkacnikb6ZO+c3I5zqeWxqu9ckQYwBbRivfmY46au9pBEIjWj1RU6XJnJAr1gAGA+ixKDZBHyj4eChTqilYOWnTWUuUBdoNxOf1zD7QiEUkZyxdyHKLvaFMrobwoX/Rvi75r7zU4mk0W6F8/mUyb3hR/V2d7L2Mugo6zop8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cudN9pa9Ac73mAd1KzQyZgio5yQyX8pe0kmt6AxJKg=;
 b=pBJhnZGjTwjHQuo5ijoD2JIM74+/GIJ9XOVPUo8ffKG/3Zi/3dU3UNqNsvbMYdsBouC0AVzFtBsO8Lvopep5p3vqQPH9ZomCUeuAp9yK7kqTHnv9S58LTD3vSLDEVpMkSuIBF+nhULhgKL3OmRyGcKAd+/6hQXg2SNRo34OFrb28npF0qrNAQytjo4d5yZ6LHtcFhpdzA0/a0puUe7jpD7rts7EgDhweXFePtIQe8jh5l2VNhaPRoVxpjqIMHwjvWkzwjM+D/TyW9zIAveHbPKmfUQEhvTwGfwzbh3c2BF+XZXthBy8TmKyTlYrYfdD9cj7tvTNsaPrNhfHm6VJ2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 18:11:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 18:11:53 +0000
Date: Mon, 31 Mar 2025 13:11:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5] drm/xe/pmu: Add GT frequency events
Message-ID: <5tpl4h3jdhyevkzpp7e2xnb66wgmce7zvfrzfkrajql6kax2bf@clrwl2d2e6bb>
References: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 26be133e-6e11-451d-68a2-08dd707f83e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sG6iSMqMri1jZ3QwRxTZ2JM8q/M7u0xo4Dg/ofp2x3pBPfjFErXGAqkZ1gXG?=
 =?us-ascii?Q?wVfywCOvkK+8VOehSY5Yhg1jxY36nUu/o0KOh2619J5TByp+lsWTQmKZOmvP?=
 =?us-ascii?Q?zQVhmPuZlsxKfrO6rS/iNMnZdIRry5vpYefTl0Z5Vzj0EXvsw63yM1eLQooE?=
 =?us-ascii?Q?MwZqxIQRTUJewLbHTTpt7T1VJx1SL2DRqEQhg8wqGnA1HtO18Q2Vt1NYrBwc?=
 =?us-ascii?Q?LwLyRjiC2ugepcEYMmRxqw+J0+hjIifl4k7vf/RqpyQOLlyJHjCTuxbtm8qi?=
 =?us-ascii?Q?oH7o5WXaebUvuS0sydPb/tN+klaqDK5RDhPzHQFkHZlITdadaDqjfG01Z9H2?=
 =?us-ascii?Q?6cLhqsfyjZi1cxP2CH49OunbtsBTuMu2HPnHRBAdWq7dEZ8EmRL8D+X+70Fm?=
 =?us-ascii?Q?/rIPc7iLc2TO1n5j8jVnP4LKriKaTdnwdnnD1QI/YIrSWUCOsD8JkBZTHGj4?=
 =?us-ascii?Q?s/5BX/PCKqriYc2BOL7V+pex6MuyF+fwsZY4KIIju8lmwLAoIsl5Gj2zqv1Y?=
 =?us-ascii?Q?UUsMrTYZkW4fS5ot9whbXQE/eW8wgmmj9g58GpqSYeQOI8hH4AueZ/B1+Yrc?=
 =?us-ascii?Q?hYZZqd5Xfp8+NjkDOl4IBUirZsRq2LBw7OdqaVEmAonWwgr3G5wtqChe5XwV?=
 =?us-ascii?Q?HoYGS7UF9UIXynaHN6jDt0FJqFMi8ehl9CooVFG4nFEvEenYv2zv+ZUU448q?=
 =?us-ascii?Q?BAIA2DVn3dVXFvWfwaXzYOblvd31i0kVsbBoR6RVdi/46H3fzqyXqGhaoLbc?=
 =?us-ascii?Q?KCusJ8HKQPGCjORkvu3e3Bal7sV45xFMWfOJI+SZ7lyVxfojvC1u2+2wDWd2?=
 =?us-ascii?Q?MaQMYkfnhl7lVtef41fX/wvFW6f06n4HxBPq8go8KB2Asxgvy497SN2aLpwC?=
 =?us-ascii?Q?gBnEOJqUQJVmVdn80nZvwmPNhHP4oxwoy3XRtNS5Si8vsx9AAhswMrSYo7kH?=
 =?us-ascii?Q?+7CAB2+dxSky6jj4IKUxycviMN0ngnnYl4KZxiyrLH11EJMTO3TfrNVaQNo8?=
 =?us-ascii?Q?2TWz6FcgmfvFglWxyromdONWxuqv8B1//U3p5T0Kwauu3/F8pzJyzJzuqIWF?=
 =?us-ascii?Q?5Twpc9RDHA/9hmKksQLe56vDqw7M/9cGT2nsM6hF/d9SU8JrDlU9LZl+j1RK?=
 =?us-ascii?Q?+fYP58JoLubTy+ZEXyTs022jBNLMhUZLd9Jz06aA+MVhjmJDq4a/dhdDtzni?=
 =?us-ascii?Q?yWRUm30MPS9RB/gLfJywUV/foE8jMxUHp6qwBysFZB9kWxISLxdjprBWx2Of?=
 =?us-ascii?Q?SpG9X8Tuoh/oHS2B2/n0hTuARAGsY4IUOeiIGaNhE0Q14FXTqSTjqeKevefH?=
 =?us-ascii?Q?XKTA0PxkXlK5EvhtFvcoSYKrMpIrJKB7l6F4BvxQvTxwyWXzItfIw3EhXzEm?=
 =?us-ascii?Q?vkJfUb0OSW6faCKTNWx6KkqKuRRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?400HvDGP1LigmVxbTv3P2SdbeP8Dhdwgo6Nx22/LNBkzuNscaY8H9gp2axw5?=
 =?us-ascii?Q?Pzda+61mKJRHdC7RcvoI7teC9hJgV9ZKe0BrmkLslwJNEDiTwXVBCOXNz6WG?=
 =?us-ascii?Q?wAu/ju/ozawLuTUdmQkdr4R2vleW5m6QsZdux02Df0p8zNSpkFPhIMAcW96M?=
 =?us-ascii?Q?DclBuUvQx2k7o7xwkrpenRr7cxLc5Mb2EVEZWV1ovbno9oOx2+Rxa8jU+vj9?=
 =?us-ascii?Q?la7UWgpe35W9J3GN6+9b0ODq6cVnmqjC+wdYCrUCHwvbctRbp+2xJR7OZwkQ?=
 =?us-ascii?Q?FmjL3Ls5A+L/3Hpy9ueECg+Gf4NT6lNBQjpPq3/sFkF1bFrboVZgiK3QcfOv?=
 =?us-ascii?Q?T9J3ze7RZevEU5idNYNDGp6VgAbxXjrEAdFfRBq/B3/YsX0f63LWBU5aupu1?=
 =?us-ascii?Q?lwiPkpG+USmpcWeyRGIoTck296bHFuBR6aRauP7Fi9MDbhMjKtVqPz/Ihn4u?=
 =?us-ascii?Q?qXleo2hatNnDI75OWuEhS5d43kCM75TcTZLzqpSJc493BjaMgXISlMJe44cM?=
 =?us-ascii?Q?bZSL3FBvN1LODn5kI3QT7PEMCa+J9GMRMrXkghopXlH8cwcMtTNy5S9jg29b?=
 =?us-ascii?Q?BDUtsgMOHuAv7wHZWLN80iD7yYJcgCWVvjPaWS7fPuegsOBfocgLg7wKIZ5t?=
 =?us-ascii?Q?04+bPHFMcNqu5N8+9dODIyAnK35cbZQw9iWespCcoFuNilMRjLaulf1m9Hjy?=
 =?us-ascii?Q?+m0H4SjC9+SmvG7jhznMk5V1hKoApQazHc2h5PjyE6CBjkURKLYoAG7BxzpM?=
 =?us-ascii?Q?a0ae0m9uALnB4OWtZM+PUwdk4Heog+6RxTk8V52OB/dh2XT+Il/V+NpLNBGf?=
 =?us-ascii?Q?ZDUu+/8Rod8tDyxVyU/4uEO+/0pOo6lhZCtW+b2jOgaiNfmSbrnt4KdQZQ1j?=
 =?us-ascii?Q?S5RDJIwAkcBaPiceTXWZjUrJ1m6Femi7FI+F47dGms/fEfzCIVJkf9zWU/Rb?=
 =?us-ascii?Q?O9/8F9gBH27msrt6COMZAGbfKfYj/Q2bV6yXP0/CMn0pvZaIYGKh8zM5Mbo2?=
 =?us-ascii?Q?1wnwStmBEi3piiRdbJ8nHRpl+Whrg8GR43+vvtMXOw6GUTIbGEweVMXarLWM?=
 =?us-ascii?Q?2rx0wN3HwVeULtxFbVq0F2N90/86rc2j7c4K/LQUy8pNvxxMUSu5ShkZZEAl?=
 =?us-ascii?Q?10+JjF7r30kPtBUOWy8bvlu/JXhgjtpMn71vskPrKizj3kW69QstdXZGnDIp?=
 =?us-ascii?Q?2MNPV4zwLwqIrKkPnyIX8jPdxYK8G7eSbfGFph3P+k+x/t1pO7RCwx2mm12c?=
 =?us-ascii?Q?4hmJRy//dESWHPrILVK6Te/hiMtK+C49n/mdVXb056RBUdGjiP81Ja8kO+9V?=
 =?us-ascii?Q?jcEx0jIN5r+PzSxTHgF4CdYKxukumtnuEOa9L+B/eXQdjJ1XyWBHD4Q40Mv+?=
 =?us-ascii?Q?t7e4D+fAsca7JumHbG7BDQLlFN5YSrrYGlBlBrmZfZ0PETePfxEPxV9Au1Gz?=
 =?us-ascii?Q?hu77frzRDDcpot5uu9Yvd1NGSekC9vZP42BblGFElFJjYcxkD5oc7L8J7/np?=
 =?us-ascii?Q?p11/XuKa5pMvTttpym5eB4fTF2y2K34Ni2n+Ld2ME1aHwG17Lsit57ZyA8Eq?=
 =?us-ascii?Q?NVaHp1CxJ/MPKBzlxhhLh8kgq3hp16swUmSEF7Kda2cAxvsznstI1nBsm/1c?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be133e-6e11-451d-68a2-08dd707f83e2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 18:11:53.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eN3RN8cUIaYv/yZ3EfScFFLB8HxUs0FDzWgOduBw/9U74kmDjxNuUPFydZJKUd6tnlmhLm8ZWQ/XBSt4SehslynymP8WOt9B7lln/Shl254=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
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

On Fri, Mar 28, 2025 at 03:53:30PM -0700, Vinay Belgaumkar wrote:
>Define PMU events for GT frequency (actual and requested). The
>instantaneous values for these frequencies will be displayed.
>
>Following PMU events are being added:
>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>
>Standard perf commands can be used to monitor GT frequency:
>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>
>  1.001229762       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
>  2.006175406       1483 Mhz  xe_0000_00_02.0/gt-requested-frequency,gt=0/
>
>v2: Use locks while storing/reading samples, keep track of multiple
>clients (Lucas) and other general cleanup.
>v3: Review comments (Lucas) and use event counts instead of mask for
>active events.
>v4: Add freq events to event_param_valid method (Riana)
>v5: Use instantaneous values instead of aggregating (Lucas)
>v6: Obtain fwake at init for freq events as well and use non fwake
>variant method for reading requested freq to avoid lockdep issues (Lucas)
>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++
> drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
> drivers/gpu/drm/xe/xe_pmu.c    | 40 +++++++++++++++++++++++++++++++---
> 3 files changed, 53 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 85215313976c..f70762917aed 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -461,6 +461,21 @@ static u32 get_cur_freq(struct xe_gt *gt)
> 	return decode_freq(freq);
> }
>
>+/**
>+ * xe_guc_pc_get_cur_freq_fw - With fw held, get requested frequency
>+ * @pc: The GuC PC
>+ *
>+ * Returns: the requested frequency for that GT instance
>+ */
>+u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
>+{
>+	struct xe_gt *gt = pc_to_gt(pc);
>+
>+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>+
>+	return get_cur_freq(gt);
>+}
>+
> /**
>  * xe_guc_pc_get_cur_freq - Get Current requested frequency
>  * @pc: The GuC PC
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index 39102b79602f..0a2664d5c811 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -22,6 +22,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>
> u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
> int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>+u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc);
> u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
> u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
> u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index fde4222675fd..835d21429b58 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -10,6 +10,7 @@
> #include "xe_force_wake.h"
> #include "xe_gt_idle.h"
> #include "xe_guc_engine_activity.h"
>+#include "xe_guc_pc.h"
> #include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>@@ -84,6 +85,8 @@ static unsigned int config_to_gt_id(u64 config)
> #define XE_PMU_EVENT_GT_C6_RESIDENCY		0x01
> #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS	0x02
> #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS		0x03
>+#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY	0x04
>+#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY	0x05
>
> static struct xe_gt *event_to_gt(struct perf_event *event)
> {
>@@ -119,6 +122,14 @@ static bool is_engine_event(u64 config)
> 		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> }
>
>+static bool is_gt_frequency_event(struct perf_event *event)
>+{
>+	uint32_t id = config_to_event_id(event->attr.config);
>+
>+	return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>+	       (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);

nit: the parenthesis doesn't make it easier to read.

>+}
>+
> static bool event_gt_forcewake(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>@@ -126,7 +137,7 @@ static bool event_gt_forcewake(struct perf_event *event)
> 	struct xe_gt *gt;
> 	unsigned int *fw_ref;
>
>-	if (!is_engine_event(config))
>+	if (!is_engine_event(config) && !is_gt_frequency_event(event))
> 		return true;
>
> 	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>@@ -173,6 +184,8 @@ static bool event_param_valid(struct perf_event *event)
>
> 	switch (config_to_event_id(config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
> 		if (engine_class || engine_instance || function_id)
> 			return false;
> 		break;
>@@ -190,6 +203,8 @@ static bool event_param_valid(struct perf_event *event)
> 		}
>
> 		break;
>+	default:
>+		return false;
> 	}
>
> 	return true;
>@@ -288,6 +303,10 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> 		return read_engine_events(gt, event);
>+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>+		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>+	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>+		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
> 	}
>
> 	return 0;
>@@ -303,7 +322,13 @@ static void xe_pmu_event_update(struct perf_event *event)
> 		new = __xe_pmu_event_read(event);
> 	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>
>-	local64_add(new - prev, &event->count);
>+	/* GT frequency is not a monotonically increasing counter, so record the

/*
  * GT frequency is not a monotonically increasing counter, so add the

is the preferred coding style and s/record/add/ would be more accurate

>+	 * instantaneous value instead.
>+	 */
>+	if (is_gt_frequency_event(event))
>+		local64_add(new, &event->count);
>+	else
>+		local64_add(new - prev, &event->count);
> }
>
> static void xe_pmu_event_read(struct perf_event *event)
>@@ -443,6 +468,10 @@ static ssize_t event_attr_show(struct device *dev,
> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
> XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>+XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>+		     XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");

I was in doubt if the unit was still correct after we stopped the
msec/usec conversions from previous versions. bspec 62718 confirms it's
in MHz indeed. Nit: Please fix the capitalization.

other than that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>+		     XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>
> static struct attribute *pmu_empty_event_attrs[] = {
> 	/* Empty - all events are added as groups with .attr_update() */
>@@ -458,6 +487,8 @@ static const struct attribute_group *pmu_events_attr_update[] = {
> 	&pmu_group_gt_c6_residency,
> 	&pmu_group_engine_active_ticks,
> 	&pmu_group_engine_total_ticks,
>+	&pmu_group_gt_actual_frequency,
>+	&pmu_group_gt_requested_frequency,
> 	NULL,
> };
>
>@@ -466,8 +497,11 @@ static void set_supported_events(struct xe_pmu *pmu)
> 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>
>-	if (!xe->info.skip_guc_pc)
>+	if (!xe->info.skip_guc_pc) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>+	}
>
> 	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
> 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>-- 
>2.38.1
>
