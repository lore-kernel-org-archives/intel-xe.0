Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567AAE6F06C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 16:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A83610E2FB;
	Fri,  1 Nov 2024 16:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaNL7ow1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F11E10E9DF
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730478500; x=1762014500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4xj4U5yQybBq93jCK6EhmcV8YtHXwoy8LUBNvi7TdKY=;
 b=jaNL7ow1fEnRcJjEucqbxhXx+YamwEZVL8k1OOcawZOgpJMMm6pAksvn
 pZmZA/cLp7X4xKUlFTEvcb4CzfSVk5GFqeEXdTOBu+uRhzV2K5k8dVzgn
 9cKp054ViVP17EC/u23NI1naypGhjBjbJReQqwPbcNmPCvNVAwS9qPVAe
 YSWn4/xzTToZGQb/E9kEJLZ13j5wrCdBYmVfyzMhIz0Ptj6/es+8Y7hxG
 YYl2vVs8EYnWLdTEZ2f62DssDE1ix/qzFelhEQoyr8zZvUMxOS/Sy5cUX
 3XMikUljanRioN1uevpMBH5dstVZO4qqvmS0RwGjvjJ0BlDMeu+xFXSfO Q==;
X-CSE-ConnectionGUID: z82RjSwVQP2Rm5nHCutVrQ==
X-CSE-MsgGUID: ApMMxw+ARE+l5c5q6GPlgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41641300"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="41641300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 09:28:19 -0700
X-CSE-ConnectionGUID: LnEXdyfnTc6YGjpQw6i+xQ==
X-CSE-MsgGUID: lHcnwsHDQSOVn1Ca3jriFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="82538197"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 09:28:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 09:28:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 09:28:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 09:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+ttnaoWci4ggdNTLKmiHhhTS6akvdvEEciimQUBDo/HD34jdYFBYI+ANuYGyPVwis/uwg9GlaApqAi7C9jCKBJJT7gH0Z3HwSmB+rkUymfi+bJn8S/I0SIgpemLYeoPAqav7dfIUaPQU7koOpW7ewvdW8do3ODsHTzLtG2O8DHw/39nQixiZxpi8PjlbK5blFCA37JFOUIz7yJhtHOxpdHyZXip0YLS5yzw7pPX7mXmSFZp1oeRr2GwAl1e32fB+sgn8Ab5gGLMLzxWlLKj4ultDgi79KZxEHj4GD+YqFnANel7WPdwCkYTp7dGpv5Q+swh5Nw7PjF4YPJPhsk4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgiteAI3xTMOVOKdHNjgt03sYpzG16MzNvBC+TYF3lo=;
 b=PXURamGglBgLTcgvWi/zHE4IYenz/8CADAaSjSA1+lgA2GHWp1PAg4+nb0MXuDOiXQdGk5nJglZ/hhbCDzid2eYIvi3WYtWgpDQ1Dlfzq1aDD5/+h0M5VmqkdV5zsO84LvgyC5TEgPRzuQtF01RBxP/SlEeX49rP3IMGnXjdN4UhXFw5BjjvQCvcuPivbYOSuPoClNlwjxKdTkvQf+fcs5hCp+Gc8L6TChoYzTvBJVtxKuB3kODzIGFd+Mqeas6bkzvgVc0QDAa70mnOb0LU2GH5cc05ZnGBX257ugQkduR5d8Daml1NelVtLmYtSX1/P9fGloUGfp2WvxkAC/KxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 16:28:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 16:28:14 +0000
Date: Fri, 1 Nov 2024 09:28:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Restore system memory GGTT mappings
Message-ID: <ZyUBvdNYv/6Yrxx7@lstrano-desk.jf.intel.com>
References: <20241101154724.203525-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241101154724.203525-3-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: c160125b-7839-41f5-4813-08dcfa922f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u8kLtdSIUTwwbri/ozXjA0jwmALmAd5prFd+y7oSKBOohSwFDx8MX2EjtaEO?=
 =?us-ascii?Q?euO6G8kCp6YBRYr3EWDNeI5PIYGOYaRq9ICOwP2EyqfPT2MP66YV10s6s4EZ?=
 =?us-ascii?Q?+c4/U+HhBdFxLMIlSiZtInCddm3kAYgK7X4gJL/8qdUNOT0uO/ylPcqPNSPg?=
 =?us-ascii?Q?vCoAxJwycQq1YWoHgS5b003r6rQFaXmDESmTT1D9sd/W/tt94xBugJb7oVEZ?=
 =?us-ascii?Q?N8oBsQAJo3R3GIPUJvVVP462PGIR6zZ9fTcMBjlTUY8sHxuQyBzP+1DaDxBC?=
 =?us-ascii?Q?0tq1ZSFkvxjecfQp/ruhmd7H1xK1ZrEBjNQkTPWFvDTsbvD6qJmK0Nhc0YnI?=
 =?us-ascii?Q?8fkQg57CcRx3qaltAk+LEWdgjMGwaIEu30TD4I7orU7TxgT2VoRkA0o70McO?=
 =?us-ascii?Q?w+EHpcB+OzYJaU7fZVB4lT30uR3qk2ojY6Jw4qLOsDxOMxjFXygZ47WHvOFj?=
 =?us-ascii?Q?MYPoDWyesLGtR32c7xfpATP9wR3qdG3/aOkK7QStLHohiiUle/o/gho0gcZR?=
 =?us-ascii?Q?m9+hSnfEV53WrOl0vNoDMINUj0SAJu6I13OGrOp2rbI83E+CQPK8drjVLK6L?=
 =?us-ascii?Q?A2DoiJOu5gSDnkbKIqFEUQzgxtHHWSKww7rTYurrhuU9aT2ZDu6AWmgz8fGg?=
 =?us-ascii?Q?xP4S2tE9ey29c8o5tYSRKCElykLz6+T+NI4Wd6ej7lZMmBSU/1fitwf3Vdhi?=
 =?us-ascii?Q?rsrDjIoKhf1BJsGzDfwbX1Y+PTFNDHHFEkIuFbZGAwKWvgn7P4baOZc557SU?=
 =?us-ascii?Q?cHFSTiIuK8fQeAmnZJ50IhDEjUPjlJyJ90hvzE8KEq7bZrE89iX68VAstlEy?=
 =?us-ascii?Q?DkNxPFCqifH4UzO3LKpUO3LswOA5jpIYxcZFmvPwb5AZvHEql6wHxRdmQyWh?=
 =?us-ascii?Q?NTKDS4ExmW2smFMixxXEnHOjOM7IA21dhKkkk5naX/EAMqZn7IAwK5VuLjVE?=
 =?us-ascii?Q?kTzwz7tzElqzeDNdr2xwCPFiFCSwh0ps1jbplXQgEp3fAQBHcGZ/cxMeOA8V?=
 =?us-ascii?Q?zc9/nDq0eweDsUGZ84lgCr78LBrHwyy6eWQ1ku2c1ecOVT70i70oRRT5PX+l?=
 =?us-ascii?Q?YzaG/WXVKbqpRE+rKjdjMxB9JCdRVRYgy9cJQxeK+QaSQ3MIXHdi/k1sTXRm?=
 =?us-ascii?Q?Q7WldlcLu5bUYhU1O7ciEbMLlIZl0XbPRGZTv4vTBmhWzkFLdkm2WN+nCnq5?=
 =?us-ascii?Q?O2fdUynh0eK1ca+dDpDLfElzwRmOJZ6JGBDJCud4DAK36p2XxTBCnfnNCThh?=
 =?us-ascii?Q?P+zjxF0PPx2/vXS4f26sqSdbLoJmj82CKhKeT9Z4RfQ7LvwnwCvvHX3hw3vH?=
 =?us-ascii?Q?kYZTw5mXNVqyHee8x4iNfZfJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssOT9vdpxtIWIayCmDl1WQrMiUKUpNEMZqwpcufXLAscrNdr7WMDOiI0jH8b?=
 =?us-ascii?Q?Ra7XPJFX8/LRgkkXSy+28ILUxewBSbismhnPQZadTfZvVM/dLPEIToE5QP0d?=
 =?us-ascii?Q?HpQeztZk1Elk97bTJfkFAJJq5GMJuk/nM5/4G5fK0U8DiHHmGMlhn+8irVu4?=
 =?us-ascii?Q?P6UWGd3fBb11xczAOko/JjXvrt+f6JHvKTrII5nP43u7LfIVn8urxCBoKJB7?=
 =?us-ascii?Q?PQPsTkZZIVcAR5JFPSUBxgDwtOuBl8C96bEizZURCTffpokacXxm7nptglwc?=
 =?us-ascii?Q?xL1pOkg3SsTTdyJe5mFiT3LEzlXSbjB8193VF0JTcKHZmDv4M19eDp1wjj7C?=
 =?us-ascii?Q?UCvpFeG7LNnjASHYo6QdoJGs/mZO0jA9u3wZocTqEinBOADRL/HOXNWcCXvJ?=
 =?us-ascii?Q?eLlRfzqg4yhW23WgNjCkGnz7ADechefa856uNJjMVW6IHLX/yGf6x092QMXG?=
 =?us-ascii?Q?8T0EcCr6oW9r5AxjHEiV/8KLmKDabxJNEEBOG/VzH97F1E7lM9utW03BvLoW?=
 =?us-ascii?Q?XomfnDcnXkyolnKYLM0X+OBNG9A+IkQfXcFkgqkLH/X1Oxq3Cg/+KsqJ8whQ?=
 =?us-ascii?Q?j4+2g2ynCjh1hbH3ZvG293YeXA8JnbUzejWj+FiLT0eS/fxBA6rVDKnHp74l?=
 =?us-ascii?Q?X+CEGqf/5e2XgJTK+5byXSDUep/T27e8jvYi/ESSrVTDII6Bi/Dan45bRthl?=
 =?us-ascii?Q?VB0tYb3rtE0lRQEOs8SQQGzsZmDpfbCSpEiH3ri2y3nyAMistKm2AKt7qN5H?=
 =?us-ascii?Q?k3yN82v7ke4CFA8P0EovmHm8iYt6KnDgQ/wY697ZhkpNIbc+fetYdMTa3Ehs?=
 =?us-ascii?Q?uO1L0aNNHnkzHipOMtV7H/tbnRw6pHFjuxhIWHlJqZfsONLAxyfpFxjcIR4H?=
 =?us-ascii?Q?XRrwvWMMeDprFel73gqAYElJhhiauTEMT6ZkkIzwp91zBb7vck3vSDO66yuC?=
 =?us-ascii?Q?xb/U8wtybh/Z4pk5XHY4mN64UzAuT138SYVpWO/66yluQcDztk7VC+e10fgP?=
 =?us-ascii?Q?As9nLE89k5SXnzw9fsQjNxmdUjJ7pb1M15wS6mu72xEArnunXaFXtNiwVmwo?=
 =?us-ascii?Q?i63lrwRYPRnT0V33XvsahBqR1Q2SsjuZWGfXgrb9yKjfspllBlsWIlUpBQTK?=
 =?us-ascii?Q?Xrfo/2uoS+CTtxwKYGlJZKGQ6QpMc3lh8s8ydgwPTbEgV+745y2Io5FEU2Z/?=
 =?us-ascii?Q?rcRCFTi9Xqvfi0VeHb88dn82CQLISOTbKOVhNpGSla7D+/MvEu0+YNTkM2ID?=
 =?us-ascii?Q?zfIvDuSoI+pRMvWzei3y72dh4wB/TJT6XFSLGSd7ICBSrGZiLewjuHEF/6tI?=
 =?us-ascii?Q?dEqEKimhZLDcxviY/4g2xNhSQqZ5gSpBiqxs++Q0aKs3Hqm59cyc7naxzksI?=
 =?us-ascii?Q?7MPYTNSsn9a79TVXmeWguqzP+V/ex4KzJKeUK/LCDtpS0LLkQbVM0nKczUyg?=
 =?us-ascii?Q?9YgShWhQjWKsQ4OhjR0XYLpbJKfFuvy6HlupNf4J9NrblpiydltJaJ4X+riZ?=
 =?us-ascii?Q?KJZjBXCCZ3errDfcgDIquGj2/MtTFZFwvebh5Yj1CWoknxyDvhl7VEzkfGMR?=
 =?us-ascii?Q?z/0U7Wqa9JG9ofd2dxYgUadDqshK6D6PrLPf9ksks94ayNBL/AZbjTOOQZgL?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c160125b-7839-41f5-4813-08dcfa922f6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 16:28:14.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51PkxqYmAfZ3aEC6/nuq+Nd7L0xwk/Y2vBK5/h1A5uQD4h8uXbcU6nIZ6fTFSmPkCgmhD0Le5LSM5NAkjyuNpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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

On Fri, Nov 01, 2024 at 03:47:25PM +0000, Matthew Auld wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> GGTT mappings reside on the device and this state is lost during suspend
> / d3cold thus this state must be restored resume regardless if the BO is
> in system memory or VRAM.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

I just merged this one...

Matt

> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5b232f2951b1..d79d8ef5c7d5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -888,8 +888,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  	if (WARN_ON(!xe_bo_is_pinned(bo)))
>  		return -EINVAL;
>  
> -	if (WARN_ON(!xe_bo_is_vram(bo)))
> -		return -EINVAL;
> +	if (!xe_bo_is_vram(bo))
> +		return 0;
>  
>  	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
>  	if (ret)
> @@ -939,6 +939,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  		.interruptible = false,
>  	};
>  	struct ttm_resource *new_mem;
> +	struct ttm_place *place = &(bo->placements[0]);
>  	int ret;
>  
>  	xe_bo_assert_held(bo);
> @@ -952,6 +953,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>  	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
>  		return -EINVAL;
>  
> +	if (!mem_type_is_vram(place->mem_type))
> +		return 0;
> +
>  	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
>  	if (ret)
>  		return ret;
> @@ -1804,7 +1808,10 @@ int xe_bo_pin(struct xe_bo *bo)
>  			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>  				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
>  			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
> +		}
>  
> +		if (mem_type_is_vram(place->mem_type) ||
> +		    bo->flags & XE_BO_FLAG_GGTT) {
>  			spin_lock(&xe->pinned.lock);
>  			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>  			spin_unlock(&xe->pinned.lock);
> @@ -1865,7 +1872,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>  	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
>  		struct ttm_place *place = &(bo->placements[0]);
>  
> -		if (mem_type_is_vram(place->mem_type)) {
> +		if (mem_type_is_vram(place->mem_type) ||
> +		    bo->flags & XE_BO_FLAG_GGTT) {
>  			spin_lock(&xe->pinned.lock);
>  			xe_assert(xe, !list_empty(&bo->pinned_link));
>  			list_del_init(&bo->pinned_link);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 541b49007d73..32043e1e5a86 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		 * should setup the iosys map.
>  		 */
>  		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> -		xe_assert(xe, xe_bo_is_vram(bo));
>  
>  		xe_bo_put(bo);
>  
> -- 
> 2.47.0
> 
