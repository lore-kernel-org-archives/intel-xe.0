Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E3C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 15:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E252F10E2ED;
	Wed, 30 Apr 2025 15:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1x0NmQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960F10E0D3
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746025373; x=1777561373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Myd0PElbPUJpDaI/PsbUFj96LTFGa8EYqnl26QndYIo=;
 b=i1x0NmQQXwEFnJnEcNMahWTQq+EgJwFOaGP6EzOCQo/HLFeFTQC7laVg
 MgwS0doHLALbItlfkelWDktdQGI18ndhIOQt4vgrcoLfQWBwJhRM7/K6r
 PpPgD4oIe8O1Z2JiuCRtI6zORQQofySc0JiOpzF47Ge2BqW3ivqqxyvfE
 S4Bo/Eqb/jgUW7QAqefdclUrXeAG7MLW3ZvPO64Q7GTRr1ExORMQ+rn4w
 etIKUNLXDNVdIjmJYax4Ey68OdAKE8IKqfOeZo6Tekgt3n1qz1E7c6/EI
 BgiY6EuXCe/yNmS7UbhSKxejUDB15TRKOOssQQqASZ25Y+ubg7dQsDtaB g==;
X-CSE-ConnectionGUID: qFoYOBCES4uSC7J9qklx8w==
X-CSE-MsgGUID: av1ibWI/Qym2AaEuwX+Big==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="35306853"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="35306853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 08:02:39 -0700
X-CSE-ConnectionGUID: sHSSn5/sS6q9M5mMh7Vh3A==
X-CSE-MsgGUID: +mIALM3IRAuhjPd+AteeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="135091864"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 08:02:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 08:02:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 08:02:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 08:02:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMH++0xG6aE5Opd4//c2TUENqXl6tWuRmSTZIDwQKdnBQdhTNVpPUTxr2CevGmxhoSagQF4NLGoDvQi/4RXfFxaRHMHv5aDiRAszU3wlU8Qn0uFoaBm+QUajuLxTTkna05zOPzZLspNpYL8LaaVkSUSXQqfKDYaRKefe8fRsGQO91JAydJuVJV+w75pqc4q92oI5bN75AcEVcShnOnKcnnvy1gMTK89FPSYVF3lGSZK3f3TBgHwMekSzKjbkQmyJnCO8JvYDFXKlytBYZKSlFNAfrNHyTYQCyqw+mxEN+7ZjmVP44dtuevzcW0aELx/H4FYcvL59POevNq0BH7COAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQj3E04pShu/wjxLP4a1pctDxbWpjltjiw6it+oI+Uk=;
 b=Q30eySbK7K3yh5Z08Z2YU1iqtog1ZOtQ5Bvtv5VkfPKc2XA4kd1IAmhMBTkAbXN9AZNeIE//VJxJ0q/Z57Onzw/x8+mV2iAKO82YQrrirSwgnMWZPF19o7Sq2SsjcJcI+4pECgWPPQC8cTPl+2A/N34xmg5D8VqvbDEhot1dLSZZ0cqNEvV6VHkx5exHQ+/7uL2Evc9DSYJQIlAGZsfU47Q1CIRu3dzrprA/q8ReUgSgjtTffpweHLxtffEoW53r/RtDJdIJVFKs9UtcnqnywO4eyHigkyNa8AkrCvd7uheGO7DO9acN5kTcK8pwgueOXlgO2OzAYgirwKovnRuclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 30 Apr
 2025 15:02:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 15:02:00 +0000
Date: Wed, 30 Apr 2025 08:03:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 17/20] drm/gpusvm: Introduce
 drm_gpusvm_find_vma_start() function
Message-ID: <aBI7u2iMvFJdcQcc@lstrano-desk.jf.intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250430121912.337601-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0551680a-6577-40f9-48a7-08dd87f7f5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F8SiFZl9HagEjGJmnT8tqsQk35pTu/PISI2e2zhnLVhknwG6snpXPrHgEXtS?=
 =?us-ascii?Q?Z5hUCeO/KjBJQzZXsYlTfdjmO6NBiYyYiTM6MZzk/knKpd5SZmiPBQh81Tzy?=
 =?us-ascii?Q?pxIJYBsJMK48V9ACnHDP4rEsSuUw22yVunP3DHUwsH3DrzzrRkV/O/FExGfq?=
 =?us-ascii?Q?RWCKbI0kanJOCiXp1FNw25XQ6qMS6NTbl4ta4ZBE3K9HhGqiDWlMKqb2RYul?=
 =?us-ascii?Q?hiMA4i5Hx/GOXepgxcDF8jfWMMA6Y0shfoA7dHwKxu57Q0ZmfhhTaI+d3sPy?=
 =?us-ascii?Q?+uXIXFwbdRTANuREtlmvSa5zIhWLiJDvylzpgT3gWGK5y8m4ElZLqQaYIWMO?=
 =?us-ascii?Q?tTRUkdwltsUiNT3nwiKiyzBUHdPckg8+FNR8gEopZDJswRqwE/RfXb2I8V92?=
 =?us-ascii?Q?dGoPhzm2fbWqauihFEPp2ZvV6rvIHp7YsEnpOXQelorcqhAq+Bljf4r6rex9?=
 =?us-ascii?Q?IbBW2C7GcoWnCu0WHlLCu8Qsluka5DEBkizUdpfLk/DIP6v9CHOSlkZRg8Ry?=
 =?us-ascii?Q?HtDLoacACABB9MU+jK3PFrQAQR7ZMNpvjDS7M/3NtbVfGGMuxOLRk/Xxyflz?=
 =?us-ascii?Q?8KWwYjjQRsV5gSy57SvtaZ690wIcYeLkb3/s1vI+oFUHdNrqk8qxjMJIYzAa?=
 =?us-ascii?Q?QK6HuGPeyQOucnEZA8cTCE6eTIJx5H9vZre9eoAIf7oba0eSficaqlyeh1RE?=
 =?us-ascii?Q?rji7zWrKYcrLqM18F9XX6cgWf+jeOGuIk0aA5eR6HodyLtJZ4bRNWDG+au8Z?=
 =?us-ascii?Q?JnAax3X8X++z6MpUo2vGbbrYEtsxz0kU5c2Adfcs1wOHB5C5tPn5ujutBc9x?=
 =?us-ascii?Q?M0QlpUgBNwWFAUkSQvekjhB4xdn212K+G5zTx3vBrtEs32NvhGAuzTjU2nTG?=
 =?us-ascii?Q?fRdNCow7kfcgN3tRa55YAkEwtcXiG1SMOtQOcPkJs9DUhtoLRZUVfOcaQvYf?=
 =?us-ascii?Q?PxyOkDTNrBIzqWd4VlrgAUcV8nbVz2ELEOLRL7ce83KMT4ipjWFxKGsuFVB6?=
 =?us-ascii?Q?sz+quPBYc3ajRlhB09QhnnaqX3Keh9TZevFWeuik/qII7ejAufUafO0/svhq?=
 =?us-ascii?Q?BEQFAl7sbiRW00tjlYv7oVtLIHHW2BDB/fa5HJ/CZCUHiu+L+PkmWj3kVI4G?=
 =?us-ascii?Q?OLNAu/DnCmcXPZo0dTfZaNkRf3NSZrPBF40vkUSlymCjCCB+ats9Ae6UF0lA?=
 =?us-ascii?Q?gUwSmgbH+3cDb9qZzDm6OBS6a5Ip7XaVuMJbb6XlpORTmpQmQrZSz1c8OAqG?=
 =?us-ascii?Q?/CUlBzR6VGuc6ZpLxMSKy1QB+LozSOdKGeXkcjzdsiFK80pBfLTeBMl+kN3S?=
 =?us-ascii?Q?auIKqOxPMfADsiRTyvZKA+c9bOC8xO9xo7SmvljtDAQOBb6tAc301Zch+Qhh?=
 =?us-ascii?Q?jwLfvPGgue7A+DdYXXJEEVwQGcMU53CmrouoF0hPAhXRomNRdRDoEuiBabZA?=
 =?us-ascii?Q?XSKohoGNpNY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5rIhBJQDVLNc8gXVSLYEtRA0XUXn42sokQuP7/rKy5hPIsITNf+YD2wBGRC9?=
 =?us-ascii?Q?XWXVuWiAyRCTZ4qwVaQxIV9UbRLUXJHM+lRGSKqucg7Sc+VhnsRz7NLYhofT?=
 =?us-ascii?Q?8IkbdFvZfU1kEtSTL0PPGR7Uu28+9DW+PfW5eloE0LlckVyqi9mIJKUKGU7Q?=
 =?us-ascii?Q?OwEZDJlKecBfedxfRhUzaCRfjyZZIg76eEHzSsqwJlJ551bKkrzjwO2ouaHR?=
 =?us-ascii?Q?Gm/rzZQBzkZT81+8IPAE2exDAs5svgwvUzwAhS1jr+i4XgyZWz8HYK+gb9IG?=
 =?us-ascii?Q?k6JHnge0j/JSwmgWzeo8HBThUkEJi7Z0ntAkRdEFG6+mv0KOMD2CTOoOwC+u?=
 =?us-ascii?Q?gs0v7IUiXaucQ3psB8KlMJB/jf2d7nOdygmVKk//nT9LRIILAMFrI1Hf6WwB?=
 =?us-ascii?Q?3uhQuc9l9n2oJZVC6gLUQLpBvQNsjc5TgjfMcFDqndeoSXGtgCQKLYpb041Z?=
 =?us-ascii?Q?ZIqafrQmb4MTUknsOumIdkOG7QqLmpnNl/syBmkI8888wEfOSuMX/ZIBCnLX?=
 =?us-ascii?Q?evOeJBCuRYPuvzY93oaXhIYs8gTN192pTMd/CxdaGus0G2QirrdvPKFPHuNK?=
 =?us-ascii?Q?RxNnlTd5r3KAqGmf9VJ/htmeutLIEYHPZsZnLKdt0c2Q0KAmFQyKB4vqMave?=
 =?us-ascii?Q?UT6g3g7bOH+DhVFwv7Th+jadjyy5lc17TRLF8r+scL/r1nCa7FyZrDCOP64t?=
 =?us-ascii?Q?faK/pnyx3AtghLsvDI3bq3x/dUPWp72hVxpywLUF9M//VdQnnbZ6EXugxKlT?=
 =?us-ascii?Q?z36bAVhol5K3lKd4Iuu3i3W6ZhtwAla2B2F+YWGoMobkIldChCEVFh5NjVTl?=
 =?us-ascii?Q?0gANsDcxlh9G+jot+fMSqe0eA5fKKMkrz+9YfHKpft7jF3mo9t40Smy6QXST?=
 =?us-ascii?Q?/h8EnZVZDxFi+gliUUMqwpFPAch0iDUSIvc3beOCHQkDe6r+VvBP+Lflx9Si?=
 =?us-ascii?Q?Kj78EFA/oNP7nxjhJyK6hAUTj2n+cqSOMIzpJd2S40L2vJOj+4q4cx13dcgI?=
 =?us-ascii?Q?GWcwVq9EYH+o/Q2KxBVjwfTnkBpPJbav5c0XEV6fRCnnNLrJ3oNWQ33cgBfq?=
 =?us-ascii?Q?g3BRLbVdtn1DNumNQhldSp31aXKJpAWqZB7orq60Pxh+jMuHOsUK3xgiwRh4?=
 =?us-ascii?Q?0eoDeRGc6bbBxK+okG2PHmGSpmHT8fuZA6RPbD9YoibNG4gmMs7Uf00liaJG?=
 =?us-ascii?Q?NywiNwYCQ9SBplb6T1QV6+qp1U3uIPpVblMiTT1y6SCFC4L6LojPOof5mxAT?=
 =?us-ascii?Q?5KXG7Ufw86ff40NjuBEH3T3FSHkusgZ9+gUx6Iz/B7JjkE5eqrQ6NS6ylPJn?=
 =?us-ascii?Q?Zdrsbm5p+slfAZzYy+0tSbHFnShn/ZFYqvzC+o+FbM0yluVnV4XHT808Xgyz?=
 =?us-ascii?Q?0ZEa+OgfyAa2pTuuOLetoCqwWxE5t1srNr0qTENn43BRC2TPmm6KGhBpfxWI?=
 =?us-ascii?Q?PhKzx33r/2zQiKZM5BkH0VIsSNxhgG4OpH7b434ksZWWAWRxIWLwZfNB/ynS?=
 =?us-ascii?Q?DBX2NPML37ClEctTUPxs14iTzY9UYm3g4PJonZaZfduB2HaT7kPJXwOqOleq?=
 =?us-ascii?Q?RjQAHtcI3JWKfc860RdrNiUccORpXGkI5H5mdkQzRw6PfFuw87OOF0Dr77gI?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0551680a-6577-40f9-48a7-08dd87f7f5a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:02:00.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxEyDW6D7oR261q1LVTaxGEh/OMmWLAA6dIazLts+1f1VSRmH8nXzM9/gmZW/4Q0E2T2MD88Yvd5jBXKZVMS0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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

On Wed, Apr 30, 2025 at 05:49:09PM +0530, Himal Prasad Ghimiray wrote:
> The drm_gpusvm_find_vma_start() function is used to determine the starting
> address of a CPU VMA within a specified user range. If the range does not
> contain any VMA, the function returns ULONG_MAX.
> 
> v2
> - Rename function as drm_gpusvm_find_vma_start() (Matthew Brost)
> - mmget/mmput
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 32 ++++++++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h     |  5 +++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index c94a8d7a293d..48bb29b78b96 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -980,6 +980,38 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
>  }
>  #endif
>  
> +/**
> + * drm_gpusvm_find_vma_start() - Find start address for first VMA in range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @start: The inclusive start user address.
> + * @end: The exclusive end user address.
> + *
> + * Returns: The start address of first VMA within the provided range,
> + * ULONG_MAX otherwise. Assumes start_addr < end_addr.
> + */
> +unsigned long
> +drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
> +			  unsigned long start,
> +			  unsigned long end)
> +{
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vma;
> +	unsigned long addr = ULONG_MAX;
> +
> +	mmget(mm);

The MM could be closed here, so:

if (!mmget_not_zero(mm))
	return addr;

Matt

> +	mmap_read_lock(mm);
> +
> +	vma = find_vma_intersection(mm, start, end);
> +	if (vma)
> +		addr =  vma->vm_start;
> +
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return addr;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_find_vma_start);
> +
>  /**
>   * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index eaf704d3d05e..6a5156476bf4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -327,6 +327,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
>  
>  void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
>  
> +unsigned long
> +drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
> +			  unsigned long start,
> +			  unsigned long end);
> +
>  struct drm_gpusvm_range *
>  drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  				unsigned long fault_addr,
> -- 
> 2.34.1
> 
