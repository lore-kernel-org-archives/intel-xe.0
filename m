Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD8BE7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900410ECA4;
	Thu, 12 Dec 2024 03:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqhVPlGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACA810ECA8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733973838; x=1765509838;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cxrm8Fqt3qvquJ4FHrMwjP0VPXyPvE1jgAF5CS8sL/A=;
 b=aqhVPlGdI5Of2L1oFrXgxZjm1B9Q5mVegrAXgqDKTMaR0xYVtO5yA0DP
 rION7lNYUXX4wIMED6URDFH4T3yM6FkqWN0X0E3lPJVyZOjR+QdTfwLfw
 n8azl0ggxXCsuJq4+1FD2sn0feLUyUHiY0RkCqF+TObFCUWRqxxzO6bML
 iRG3oDFcCSFzZde7Q4vthEBLKX489aZ2CuqCtm8VoKlwAqe0daqIwja2A
 2lXNOZTkMU5IElQf7lU8QPnjlLx/+Z6n6XaRQL8JXKJcvDGuZIFIB5+ij
 iKB27Qj6stVxCREcnGkObSWd/+r39bYOF8eoijSa4nOLkLdD9JrVFyRyl g==;
X-CSE-ConnectionGUID: FsMlQ296TIi34dEHE20Z0A==
X-CSE-MsgGUID: BlA6OIIjRkij3xIGurVAKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34297560"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34297560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:23:53 -0800
X-CSE-ConnectionGUID: 3A+DwZSiTvaXXD7U9QCGrg==
X-CSE-MsgGUID: PgLlSBbTTZumFT1JykJt0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96152427"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:23:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:23:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:23:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:23:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDE2w92ZSwuWJQpJRIKGONmOY2DfcIcCV+3q1cqVnMg2OI9fD8WgV4yCP95WYFtxNB4ApG6ICfqNCZJTsPT4NEnKvTf0mXzTc2G+1C5UzW78lfttesHWdTwAW8C0osVhGLbhkmSJY6q7819/ArQOS9PcJtGQTluk8z62ywr6SW6nPKCnNJ6XKBvyuYN13pnZJpuq8n6pqj5MwIrZ0LaAv3WeF8PhqiJG9uSlLAMMrZ/vYQwIToFDsFHTfw45RMnZgptsLFyFecSksd1/kvM7rJ5VyJ5YjO5BbL5lrrzpj1BDrouPjpFr52omiU53WwVQmV3p9OT0kTk3Qqm3rvp9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXyWSAghOboo92Uc21EgKwooYs2izT1XcU55xu30nn8=;
 b=ZGEoILN8YQxG0P9Fqp7h60WdvsPL44/VGeofuxVk4WmAmzZKuDAKkT9HEJ7vjIINc+S3V6jCu1d3/q52qApkPuSTZZl8togiL3nmJSOYYdYOmNIUFkL34NngGJfFEQmTa5QjZVKpGJxkyAucr6qUo1vmk7NI+OVOTxchTYAgPgDxfZKOdiraiiVCXMz21CH8zf+xRunUyfxPg0qHCGCZ3PMSYo8QNBgRxE2N8OMH7MRUPmpnfhmDzoM7aMO0vxs1muasdP21egDTOUoGZ2oKxOCWm6Z1aD5d+gesxr4YNkaZZ87Biu3Y+vRX2d7P/lznQsjs/o1cKflQGs3H8tPuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 03:23:08 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:23:08 +0000
Date: Wed, 11 Dec 2024 19:23:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/13] drm/xe/sa: Allow creating suballocator with custom
 guard size
Message-ID: <Z1pXRtHk5S8Fazd2@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbd023a-370d-419e-f6dd-08dd1a5c4cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+PLGeT8yrcvjTH/gh40clS2mdV2a4irZJcF8S30Mc2fXoTMGWzug7dY90gLH?=
 =?us-ascii?Q?DlQIQGNRs7gTGz9ZaltLSG7F7avGsJA5+x3aL5faRzAZ40+xJrMukMyWO7Pw?=
 =?us-ascii?Q?Bj3DRXctSA9ENLIMQONvzLUXW5tf4hzhWJGAa78qKwVwLmIKFyPz2+fPpEtH?=
 =?us-ascii?Q?WAHIhwhei2yvYWsF+du7IpZ+KGy8d5x5ae5uglXObl+NUpNqy72hfqIW/l4Q?=
 =?us-ascii?Q?Sa/yGYim0opOwf5hIBmcATB+huJKxNLzJTdMBn73/SRaRVsN8QFcD1/s4Egp?=
 =?us-ascii?Q?K3QfQNQ6fGabGosSZezXbY6frsXuYlL0hIiKMKvvvfD9FZbWKp6uSCruSw5T?=
 =?us-ascii?Q?5z1lvk+4wJu1krUTiiSm9AWC6V70jijB8UjHEogRs3UQkbuVG10J7e502Ikz?=
 =?us-ascii?Q?iRLH2KkUmnBRmWg6CYaVfXaaKDlbpbW687CKEyoo5tqfRiaQqZeRKh0avKV7?=
 =?us-ascii?Q?CLA7tKRhXrnuN1qxZLKO1VhTHH/FaJfnUvluFkrlNA/Iyl5OhfgTYuqvxyMD?=
 =?us-ascii?Q?w0BnTRfUXT2xDp7yBVdIKTqFehoY1lbHBmDqFkFlVMx032eslG4xqFroSxDl?=
 =?us-ascii?Q?HXTrrZTnw+XfrO7pTDh/tKo9Ku8JkSsNFORowxDPWQluR+9119DBfC+vwXPf?=
 =?us-ascii?Q?UuAr8hLu5ZFk4QTKYDw1Mt7nHKBpjGOlvZpHSD3BIH5Ng12FnNvfb5zz3zt0?=
 =?us-ascii?Q?u+6qpwVvZ55PacwOZ8Snl6nq5dsOHWF2RrV5xX73xPagkiap8EHvAC/rMH6k?=
 =?us-ascii?Q?iVyKuprNQJQzbFl38CXeM/8gryDL/kUBIAi+6Zam6PitPyM+egdyxfa23o1D?=
 =?us-ascii?Q?pIL7M6j0JA9h5U0ciuafnBob94LXRZl5KedI4wm7ISFHHxBq2LwAWT2gqmAx?=
 =?us-ascii?Q?xL8PAfrO+0fZtYrbd6cH2wjYc/93yQAF6JNYzcrbUEYmC9SpYOBCltgk5U8+?=
 =?us-ascii?Q?8Lh28MxoZAiUqaWGx6WADh++4TPTRMPiIG6e7wc3wLo4RZd3NG+/pmWCQfr4?=
 =?us-ascii?Q?U1rjiABOSzuWyAD1ytNkTVBKg66HzR6qt7NrmK/FAO69JGfDfAb1cgN7kZq9?=
 =?us-ascii?Q?AhfQ9EoyCklWBwW8VCt9Ow7fgBOLPazBU8DJ/vXr8q93kS9XwxrY5PAGNn6E?=
 =?us-ascii?Q?sl/Dj2F/xEn7St0eG+aaLaWsPxOpVEZHvtDUYNcExcnRyZz4OvQ9ZRRTVR5F?=
 =?us-ascii?Q?xuJeWN1f6m0ck2/cSLO24apb/ueOfSQm7U/oVSHopRJmiLtsXnYaQy+REAyH?=
 =?us-ascii?Q?LE/mqgHCT/FMvi/UzNq33a/n3lMCz2jO9pZzSMEMA8Nu2hcgALYdl8RmPjZg?=
 =?us-ascii?Q?7wvJY8xsocUMqBJWWf1SLnmaXS4yaqTPqJ3lBRwxGNQwsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?69azty+vUH7pqnXrjhPc8VvIw7AfsKSrV3zyzAGzImlC5h2HFCME9saFvXI3?=
 =?us-ascii?Q?IeeR8lJb6Z2fYs5dGhodh9lEQOnsN/C3G5CNj0tpnrz1Xmgrn7brzQibyL+h?=
 =?us-ascii?Q?YgOEatWZihthH/lwXCF5ucYEY8VyHPKa0yHyXJ1/dAlnrOHmpEeq8dsuDk9E?=
 =?us-ascii?Q?1iIyM7mgKhaGTkNCJDhgviWVsiBrve+PSBg6Oo8ECyggDMx11tS3xzoJ4phH?=
 =?us-ascii?Q?utPhV9t5Z5dURpF9jo1MqFq/lUWi8+IkhuKLahcn4nhfM/ZawPKo7CA/9vNl?=
 =?us-ascii?Q?PPi2fvnCY7x/h0pqd4W+nSZCX+dDshsCex9D15uGRl06Ur05JymEvYqh6Av7?=
 =?us-ascii?Q?gfwg42d6RPc/oPVW//QrD0AsvTtEbl0FxGyRjylwXTsy3HwnBU4j7Y/bE9lG?=
 =?us-ascii?Q?Mva90ci24W5o2akqhwZ5mVM5K4H0bzPAEZI8r7JwKI3AUMnOqapQRpKFPoja?=
 =?us-ascii?Q?ZA0q8nfSM1qx7MkX/AWYtdv7Boy5PS04WnJ7gJuSOB32VbLRnGzSD718Ap3j?=
 =?us-ascii?Q?RLoaoPiryJrPwfg4ZVvzq+WUD96cRzBIoRV6GNG1mE/AWGp+/kpF3rTi6jOE?=
 =?us-ascii?Q?g4lQXpsRsl2CHiVPk9Mc50wW3bV3D2GFejl9N03KutRUumSl3UcbTdPQ08WT?=
 =?us-ascii?Q?67YgbdK8hurlY8Lm7wf6wusB/Hits/GPHp1MlRJN4SzAn1Tikzse4364uctZ?=
 =?us-ascii?Q?8LKE+GwUk2VVz1b0ndBfAGnWel9tqmw0nDRfsdX9aNVo3tnudWyLN727SFai?=
 =?us-ascii?Q?Z+2t2nnbyJhamT+RU1CUPyw9tJ7Dtuu33/DY3GUmOwJkxckpK12z1sPLJe/j?=
 =?us-ascii?Q?RbQkIRKPEpRAR/5pre7xzaf24vusWEu0FpSRvj6ZsaGdB+jCEtNOQNlZGnEi?=
 =?us-ascii?Q?+PY/qQGDS19HZY8IPynyMhYlRUvh9dUtRJvI9a1lGcjCOQCm3fAEBykEXGep?=
 =?us-ascii?Q?dEmaGTELq35d6WvknUDzO/H9OZADd2pOhFTLwfST5a8QYo5z4KDGzl4BeDlw?=
 =?us-ascii?Q?qR1llwQ/5me7//sLZ69tWgo1ImkddF6x6SjMlJaFEW64T6nBbnXtrig65sv5?=
 =?us-ascii?Q?z9/QK58tTi/+5xqoeumCuLSKPDGoyugNF9jHN39HJrXp2VNVezChvzx6HiNc?=
 =?us-ascii?Q?ospW/uY5jwbVpnu/mfP+HAYehj8OIkOwDA7Ndx3M16iSxm16YUfcRwwyuZkp?=
 =?us-ascii?Q?ZGGpF5auZloD2gqcnFa/wczARdS/d/8GHqyutc317TPk2ZhiCoKtmGy6lu8g?=
 =?us-ascii?Q?9RCJDkGA8F+ya7/2WsreygvK+e2qusB/M5ZpkTy9EB/Zc8MEECVdqQv1tCES?=
 =?us-ascii?Q?QqHZ/PFpvp93+EJoZjVkS8oxuUoGVQbwyz5KwRlMhTItGY471bualx9/19WA?=
 =?us-ascii?Q?CFDZH1C6IzlQ7KgrlGRxwxf4A0COg6gmjMtYJuAUPbuq/yJDg9laO3aDmweh?=
 =?us-ascii?Q?VJsTbV7ahwLSz+xYFaq9El5wS5gX0bDQyx+cCNpkGno6JzlViqAHEYUDWDR1?=
 =?us-ascii?Q?248AleNM6DhpZDo7h7aJ1au3HymN7Mo8Xg8OGJ1dZTRxMtfDh6+r3RwtnR2f?=
 =?us-ascii?Q?OxgLxbF6TrYNuen4u9P8jPYZ7PMIeJelA1MGz1Z54EOGnI4GWKIafMpBGXFF?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbd023a-370d-419e-f6dd-08dd1a5c4cbe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:23:08.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2Z1xlHLAKQrmns7sJ786SDojA5x4WpewHPfxmrMqLpsvRj8/Kgznsr73tbhHF8p7sisrXhwYlp+t+f6kfvWYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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

On Thu, Dec 12, 2024 at 02:01:36AM +0100, Michal Wajdeczko wrote:
> Actual xe_sa_manager implementation uses hardcoded 4K to exclude
> it from making suballocations but in upcoming patch we want to
> reuse the xe_sa_manager where such 4K guard is not needed. Add
> another variant of the xe_sa_bo_manager_init() function that
> accepts arbitrary guard size.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sa.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_sa.h |  9 +++++++--
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index d92d9836fa91..94f05e704a43 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -32,14 +32,28 @@ static void sa_bo_manager_fini_bo(void *arg)
>  	sa_manager->bo = NULL;
>  }
>  
> -struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
> +/**
> + * __xe_sa_bo_manager_init() - Create and initialize the suballocator
> + * @tile: the &xe_tile where allocate
> + * @size: number of bytes to allocate
> + * @guard: number of bytes to exclude from suballocations
> + * @align: alignment for each suballocated chunk
> + *
> + * Prepares the suballocation manager for suballocations.
> + *
> + * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
> + */
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_sa_manager *sa_manager;
> -	u32 managed_size = size - SZ_4K;
> +	u32 managed_size;
>  	struct xe_bo *bo;
>  	int ret;
>  
> +	xe_tile_assert(tile, size > guard);
> +	managed_size = size - guard;
> +
>  	sa_manager = drmm_kzalloc(&xe->drm, sizeof(*sa_manager), GFP_KERNEL);
>  	if (!sa_manager)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index bf55d8c3b5eb..9328b38eff6a 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -5,6 +5,7 @@
>  #ifndef _XE_SA_H_
>  #define _XE_SA_H_
>  
> +#include <linux/sizes.h>
>  #include <linux/types.h>
>  #include "xe_sa_types.h"
>  
> @@ -12,10 +13,14 @@ struct dma_fence;
>  struct xe_bo;
>  struct xe_tile;
>  
> -struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
> -
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
>  struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>  
> +static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
> +{
> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);

So why is this guard needed? I'm reasoning this was for CS prefetches
but all current uses of the SA (xe_bb.c) do suballocations with CS
prefetch padding. We likely don't need to do this in both places.

I'd say drop prefetch padding from xe_bb.c and move the prefetch
calculation size to here.

Can be done in a follow up but before RBing let's make sure we
understand exactly why this is needed and develop a follow up plan as
the code as is doesn't look right / necessary.

Matt

> +}
> +
>  static inline struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size)
>  {
>  	return __xe_sa_bo_new(sa_manager, size, GFP_KERNEL);
> -- 
> 2.47.1
> 
