Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AD7CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 19:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3B110EB04;
	Thu,  9 Oct 2025 19:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BktDvq+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C8910E23F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760039817; x=1791575817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yH01gv0quI3N634ra1Hz1eB3Uc29GsGtQBy/bttJJqQ=;
 b=BktDvq+uCUJXx7T4snyj4tU2y0rxuaCO2MIxmQyo9wUCli8DgMWtzaUp
 8R68d0xuipyqkJadp/zluTBB77jg4mtcewESKO2ELSPssKgU2G8LqHzcx
 YaVTo+aj+oBsb8apdjApRiAawysb86Psui6kOH/LWahZgAbr/feV3dIl/
 kSnAlUpG9Rp0YOsfCc0bgL8ibbFfLKq7Q4MTtB00S6NSCqyH48K7qJL8/
 Jl2bQalPuhpyFCDEiKgXAtNXptfxuCC8DqQZXZaAzqhEc4D/hZErRl3Ww
 GbcUJ13Jtq3kZKdd5I6F2ERT1HAqBD1OiZpDNJjgoSxeyoQI9lzPb2os2 Q==;
X-CSE-ConnectionGUID: DjSBG24tRKurfDSxRaSQIA==
X-CSE-MsgGUID: 2d3GjVSyQFi3vZ1g6IC3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62418753"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62418753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:56:57 -0700
X-CSE-ConnectionGUID: RHyz3SBZS4KBI7uOq0Jicw==
X-CSE-MsgGUID: cDnnHaARSAqxUlNB4WLpaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180043473"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 12:56:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:56:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 12:56:56 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 12:56:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0h7md0AHkaHSwpt4hJIDOV224XyyDO0DsuWnPaRKqPjchIbwQflM/mUBHo8M/YVtnvjiiYkReZfiR9mbir9xoSFqecaGZshTTslB3Z5Z+rIhoXiqaRc4eAhygfqLX/0o+dZkX65oc5UEdRKa04GZ47FZtzfh1gjP0opsRYMW6xBJuEWbTRhQ5DmGka8jaAYJSzepe/wgvlS31Hr8TrgaHxx6oaKIIEeHosjNoMvgD4e8V1vulOUkJDWtYCarA7a8cxEzq4iMJvZ7yT+gOs2Ihu0HI9eHLDjILrJcbq7HozENpZCMObsMPAEHwuFQsmGP1oAwf+yJmf+jGylOkZsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8FHCSmHYjiROBnVpHawXMVONN8AmWndqY7KHwJQkqs=;
 b=DazmenAKV6mptZMrTSMCI3+0ASJ15PDLQ/5Y6K9FUjsxcJLijx519XXehdooCGFpOpadN48ilf/+Wny3d3HuPRK34Pkg024694Ovbz+gb+3dA/Ye8nUU8gN+/sKRPYcuz14/T3SyQUaOC3frGLxPZPLURcsFJvj8muOapSMTpv7lhxa4kRHKC8ilQNGXHsUkw/xEu5CGbWkke3SP1LC73azkzeZZUJ7/CpBEi8LBZ1RVPsPpdfVzJiJbwqqwftKvVUx1E2cRTX87eobdAtJTCMphoK2uu4Zal9rKc0gYnwez2rgp79S6AIg3SMBjXG2Md5s23wUN3OIa2LnXw6DBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8367.namprd11.prod.outlook.com (2603:10b6:303:249::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 19:56:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 19:56:54 +0000
Date: Thu, 9 Oct 2025 15:56:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
Message-ID: <aOgTgFc_-FgrV9wJ@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009180853.578184-2-sk.anirban@intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c6ac38-0144-4399-8dec-08de076dfe88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VEOfFjiiI/YjTbbpJeKjp6FmkUuCeXpFR837PIhAUOmv+RSwoNLVh8jS++5v?=
 =?us-ascii?Q?HOE2ma3KK3JjJLxldS6HQhF5QHZ3oIRXVxClUw8zgLBxmXYwMHllcBHtML9V?=
 =?us-ascii?Q?iKLMH44rI5cUW/sXQ84vd7qZSXjTtQEiyVzQWBFEOkhfGAqyIcMzJTzsj2QN?=
 =?us-ascii?Q?JJ+ldcs5a24rA/D7647mW4alegUXnf6Fx+ZJWd3B3HXewndbLySegNV4LR99?=
 =?us-ascii?Q?39ou05OTrfD1NM7c+uf19yvdptroLLZl3TCGq2GiP15O8uLdke698lxIyjA2?=
 =?us-ascii?Q?rlqRrqog8kO8Yh+NsVLqqbcKyCw7yEdOoeW/gLV7UmLc5aI+bnOBuFiyp/ld?=
 =?us-ascii?Q?hH4gruX6lPQK7ZuOu1hx3esnCdL0hgOORqaPzpdXYOYv56eXRVJKtRv2aoKy?=
 =?us-ascii?Q?uZe6RktaS+Mbm+cNMjoeoiRXoJ26PHxzg8KwBjhS/wwM6/4IyPo3bHJ5jShQ?=
 =?us-ascii?Q?+cFkZUzRBpaD5SDGhhiOUG34LlxTDoM6hnVU05amcFA6Qpt1z8/QjRyWYLXw?=
 =?us-ascii?Q?+uN9YYleTC30WS53BFOuDOWJm1DjqApDR8dK9CwW7jREC6s6AUnYfudCyBh2?=
 =?us-ascii?Q?kOOvEXyX3m6hmn4+boUnUGhwhN3gcxL2GbsIzwuit5nN3IUM9bzTJrV2uL2/?=
 =?us-ascii?Q?LRQq1G+B9M2CWLadUq9RZaMMds2yh7aD6zsKvfOrNTiWHWZB4nobXltr3KyP?=
 =?us-ascii?Q?1wCg9LgdzpTYfL28II43I8fil0KDx8OjMOryw85XTE+FFUXU9iRXnkKEfcL3?=
 =?us-ascii?Q?topvWjUBhM0taeT/3ln4HFBY+e2Ma92cLFnkCeGAB70REvACDK892Tuw1Ebf?=
 =?us-ascii?Q?i7SHa9pAOVmeOHi6LnP003l6qDDCLLNkiN4wNPpDQLH/9cQjZvDUeKYbfk1B?=
 =?us-ascii?Q?e2zWf6zfacirxdx+eB2eMtebqJQlcHIhN5sRPh6PGvjeLVrua9R/ZxvXe9Qs?=
 =?us-ascii?Q?XIR17Xy8XR09QZrukmAgEv69vSB2P7f/p89vrmNI6fxkOt4cg1PJvBd3FBFg?=
 =?us-ascii?Q?eE55auNqEXFnoztKq5QJ5MuGzXUqklWWiE9qSyyRRb0JhgjFng4/JOBN9cL0?=
 =?us-ascii?Q?B+ppgH/+TBJ1tX/Oheba1OiSbvs850ZuKtgvNHPUKpriq1in17B2AGOJOhDJ?=
 =?us-ascii?Q?S4nd2Hgubi+tH3o4W0kLRXMWL0NlYBqXK6393H78cJfSveOFgimryD3Jx9r1?=
 =?us-ascii?Q?Lff0cVG8d04WpzyFchAothAn9vevWZ48C6xxzgLLMClaLhE9bcNwPb1MBNiq?=
 =?us-ascii?Q?62xEC+YJZRpR5LWjT5+3/Fitc4L6QGh9PC/+VhuzQJyCIG7i42l0EjoudMOJ?=
 =?us-ascii?Q?BwOlZxdR/bpAfnadET/T24ae13OxgLN5R//4fMrA3mJ5wpTEe6K/ta3xn72Z?=
 =?us-ascii?Q?HtNlBSLUttb7lggZVHpUuPi1B3wxISSWBqW9yPYoN4u67q1Uew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxI4lEYCzKy1lre8bWyr5Fxmmzy9EWyIJyAQuTveI+uRJeek/8ulIu0avMEW?=
 =?us-ascii?Q?qeYPY8DANn3whJDDEVc43QpjsJebLivc+xKjv6WiDQpm9sc7L4BmhHN610ij?=
 =?us-ascii?Q?gpXWxSSfeFr5yvMsvSJdq4NVPhoOA+CQKUpaNJCFnuMX9x86p214j8Z7TecP?=
 =?us-ascii?Q?95uKFMtfMTOG2C3wBJR4n9/nTSTbCoqT86gpsXTQABsJNmUlBuXEZoltfJE9?=
 =?us-ascii?Q?fBW18kee101XPLhkMety2WIPVF7xIplOG4YMMA3bRxCvBjNNlmp/PDc57cx8?=
 =?us-ascii?Q?8Ow39VmT7XcLf26TkMqiLU/Cgba3S1ECEBu1JHCffa7ivaUFRmr9GajfU5FG?=
 =?us-ascii?Q?1dYKHXBmtbtYId0El6DOC0m3u3PbCZ7QPjpydIMjWeUkRTdExHcQaU1lgGT7?=
 =?us-ascii?Q?Kql9FQB9CDixNXqBB+kcEhuhBGRPjOXGLfWEO4hjzD6M+58OV9CLuQLT2m6d?=
 =?us-ascii?Q?42o3YcQfBD08LbSf8tJCu/5z5KIfc+cwq/7I+yMfw+5P9e4MoOLq7mSiM7li?=
 =?us-ascii?Q?SYiqueTE7Q40Toibdq50pLHdiBNsEaXrE47I8tT1+Wkup1/CgAHbm2Y9nIjd?=
 =?us-ascii?Q?wpUFtMVn9gqckKSYwnK08qRP1mUO56LiZrM9oXyGaZiF46kfBd4VC2RpwSik?=
 =?us-ascii?Q?N75aSoqtzZkRm/j204QXEK4XElR43CJQ6Lv+bb907kU0CFPUVzI6ATtE4lx4?=
 =?us-ascii?Q?L1zWJt9k0UdZsO7MZfxM7R2uWG55Be2WDCZxVs2a7TaI7Z3DMnnPCrPSTAtP?=
 =?us-ascii?Q?cMz6KGmH2CJ3hpdN63qmphn4aupE1p6Bx7sBmGIVi1n8z1fwmqQbA5Izlris?=
 =?us-ascii?Q?NKLVnLSwxEadshScTp2n+UnKfypObfl+f0OVy9DvayRan3qCH7XNhfuF5Utb?=
 =?us-ascii?Q?b3D1DUltAi2QufMhbc+YY87HgavGR67e29TRpBqqJsaNJbv58539fGmnm1oQ?=
 =?us-ascii?Q?AekrDCdrNXQpWWEj+u7rFy/2Hz6rRcMeHKPkOwtV5jRve4CdFX0ccUveB/ZF?=
 =?us-ascii?Q?UHXR6ElFxIB3t7wj7jqczAdFs/0tBMd/qopV9nX5MneFevLEtzDe1gSbKcbT?=
 =?us-ascii?Q?N6QbudDMvbeU6VVkQH35Kdczk2TIwPoO2QKeTZg+aLdjUtK1KdGvSypndCYx?=
 =?us-ascii?Q?zSuV4wcDEGN+nCSVDTFJcFu25BGdjSAzLbmrYH+ZiApOHHofh6R8d9hH0hc4?=
 =?us-ascii?Q?88hKJeQsmIlSdr77txas/V81M5IGSI1jHZ8Uz8pEcgwd9bZWo2ipHw30ut+u?=
 =?us-ascii?Q?NNQujPZsIV5XqhRvAoSeNMZdYCv60fY8ddUUM8JDN4ep1OWLVcq4zk6OvGSF?=
 =?us-ascii?Q?JTI3823+9sMQ1Gm3PWnR5XjtGO36tgCSR7CrKq0ovD9Jc7/lrLfAykCB8DpW?=
 =?us-ascii?Q?wJENB1FGPDRY1+7UwThsKCivncCkfivDezWwJFkDOXdWurtoz9OfddGNnOGd?=
 =?us-ascii?Q?SDwNkx08XCcxe6QD5t3Yq7Px+BnOpwOSy0S5dBantm3xYVOkHj+222Mt/6lF?=
 =?us-ascii?Q?xk6RIS7YG8YIl0B8aKkj7ah/1RH5X1qvVgtBZfQP2w7dWKaHW+Vb+Sm7S6CE?=
 =?us-ascii?Q?ecjq5aMTGIDR3Weo4SOIlCeneTYuhMt34IItwYIJt8tu8YvINDZCUHVyiMTB?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c6ac38-0144-4399-8dec-08de076dfe88
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 19:56:53.9902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8H0YPSt2CtFUc1oP3KciYLCyfbKk7UyCUWDdSaeY88GDwWQHh679eK5Zq/QarZOR6egYhztvS47yAz/WdPOZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8367
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

On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call to ensure
> current RPe values are used when setting
> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..ea1ff96bec32 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  	 * Our goal is to have the admin choices respected.
>  	 */
>  	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));

I believe this is correct... But wondering if we should entirely kill the
pc->rpe_freq ?!

Vinay, thoughts?

>  
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> -- 
> 2.43.0
> 
