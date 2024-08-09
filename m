Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF7C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 03:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D9D10E0B4;
	Fri,  9 Aug 2024 03:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5YZl0Aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E967F10E848
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 03:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723174765; x=1754710765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6XzsbomF/CEOu9r5fXI4gNlzQOyMWDNyxZNYbbMkp+0=;
 b=Q5YZl0AafOkmXwUfZrIxoY0R2M9aCFoH+4lULyWJ2bUhlMkQkZ0R5GIU
 fXGdAzHL3EdaUlQGYIqcWkQbtRsg7ONbuumdpuQYF9y/Iq6bsAmGv+GZE
 onTGfHG5GpcnoYjp5JU58rmijpWQFFi6YI54McA1Ip67zXxeDc63MF55N
 MLJtBbXmIy7tNduCbQhoAshoIP8D4bjOkvXH0ipPOaRuKCpJmIYy96KZH
 vXczFAMU4qYhoo+UUVJA2/I1NIW5Yzs4EDfQCVjQ0NLRGLseICiR7YvlL
 ponLmQpw4j8v8hUrQ8L9rceVOPUaHR0ErdH1flcFGdZe4ra1I8htQtepX Q==;
X-CSE-ConnectionGUID: 55GbvHmgTiKFlB1Vz0OCNw==
X-CSE-MsgGUID: UXFMlFKFS8CQPSyw6OppDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32743580"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="32743580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 20:39:25 -0700
X-CSE-ConnectionGUID: bz56918bQgi2IuDwymFLYg==
X-CSE-MsgGUID: noE30thVQ8abCEh/r3ParA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57096087"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 20:39:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 20:39:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 20:39:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 20:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQTG8M/3q1UZC99f3PamzYEPbFnc30wlzSQbhL8rAihdFe909vj4IRwHT33uvs7cIIM86zWqWsm0jhmKRwW4eXsn8GmoOUKAvKcyAJB/hhFrkqf1Rq1o5SLuBoCb4ic7A5Rc0gkSTjY94I1zwmlaO9WZv+eEsVhUrXgzR4aTsk3rodaa082vWzJ9jEcWZDirok9swKnZJwywXZ0LLnoXSsLq5ROfxFRZbZCgK/YGf2BvQd0QpSLWhPEKFP9DCu/RhYmtssccK+Aq3Ac+JRbs+Y6FwFH/SmeZJ5RtJFTIzz0RMUqf97BjjI1OvgyZq2hY/REWLsLObLTYjMoEb4DaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qiBXQdRZ18EcP+OovYmFV4YbhyQFG2KBsWrBP1DISE=;
 b=u4Xbr3mLI7DzfPFCtjWKIr3ylGzoQsrXJ4fa7h9MM1DO3/of4LS5wrbZV80QDdpR/KfyV/Ar4vduxL86sIyp2k1xGPlzVZv6s3NJ9ylxy0lETgGvxDJGr9POANLBqV/NVIsjd7qbOfr9jNerzt484RDvue4eB3OdYwFmaaaEy966BSC14Mw0tP1MCSEVebyFx1lEx0syv6u4nwMG7JMTaMU0x6ka1Ppam3/956xGYkA88sxaCske11eNlOzIMUI9o5TYvGHmuC5f/4yKaL2Sh58aRE0eiqlK5UxXGFv+Ptak/j1SEi/RVYh9++7o2mWYqPrypYHqbFY+Uj2Br67KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 03:39:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 03:39:21 +0000
Date: Fri, 9 Aug 2024 03:37:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 06/11] drm/xe/exec_queue: Prepare last fence for hw
 engine group resume context
Message-ID: <ZrWPFapYEsSC6VTh@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc392d9-6410-422c-bac5-08dcb824db0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yZ2NVdpV0vCT6Sn700JVINOyHh2EgQsu8iGT6lw8fFfpsVqGdbsFmvslR5/w?=
 =?us-ascii?Q?n/I9flXWFM4cmk5nEzRXdfG2rc1Ubd/gnX5ORbQkJBfNGmdc1KxeOem4kRla?=
 =?us-ascii?Q?JwYvFu0EuqiFL/UlDsNeD71aC5yTNCiLYEcPxa72hYBVjBY2knKmJSxkX5R6?=
 =?us-ascii?Q?IBA2ETfy300m9ptZ1hPRpK3wM/sS90H6k6PkaXDrSPWCR1md1Cz8lg2wF1aC?=
 =?us-ascii?Q?R/aUWhSjFpvBOOA7D1z3CAOVB0NZn3eCe/pV2UyeNUf7G6bRWZdvAcvGVXyD?=
 =?us-ascii?Q?6fdipUcsPn0sxrqEzv9itqGkwbjmCZgrmzl10Jh3hbkHJpkhXQAGF8JgMA2H?=
 =?us-ascii?Q?ZWYaIqFr6KfjYVTOjAAk/8hRORyDD8ybLpapJg3UyU1iysjh375R7woD2Q1z?=
 =?us-ascii?Q?1jYPPOzhCw8qn5dn/SEFLG/OyAPQrbPpo7bQgiIgcCkW5diZYQSE7U59XvvL?=
 =?us-ascii?Q?7YPdI6SNCBrxPQh4JnXnwWQH72JuqiJ7PVZdd0uBHNj74QDKZWtfOdtpNZHl?=
 =?us-ascii?Q?61ntwbbGbi8O4ylbN7MZ1F/Mhy+kC7RXn1BDg5NtgY732FZEUtOifM8SLcJY?=
 =?us-ascii?Q?peVAjeIM6UHmPJjleIryj5N2eAq2UPvknyAP9nyHXO1fnCYHdKnu0fIR/ORr?=
 =?us-ascii?Q?3GyO/i1w1XDgug+B6iLlNT+BbPshPc/TmkRpZvq2KIjUzBGc2L0oedNfzQnZ?=
 =?us-ascii?Q?IIl5X2xGwOSep+mJUtPKE7BSu/UqZECTzhc8YFG4ezp94Mpv3P2PTxp6HCdo?=
 =?us-ascii?Q?8NKI5SYXFre/z7nKSe7W8xGpEojw2BX9JoudwLEJtAAvZb1cSpttZ/mSy8zd?=
 =?us-ascii?Q?VCxMR26P8uoBGc29OHguVApxQ229c9COztMQCVjGbhqm1GdOkv0EDvKadIep?=
 =?us-ascii?Q?icsFn91vu0kFd32g5j3Z+IDPNjnopSdqNV4/K6Qz1a+WtMDbPv/Qq2TgJrVb?=
 =?us-ascii?Q?vP2T4+0/sLTY6Fzat8Xnkd0fZeqyqjOErenrccQ/1JW9Ae+sonDbKvRKXgae?=
 =?us-ascii?Q?1aW3xcRNiVKzpW6zDmzwZEoCmateO5B08euN4VHNdYla4W4RN5GbEN5pLXIi?=
 =?us-ascii?Q?vB1vSaU8biSxiKcfpeeMd/Znm9cGaxYtr9X4QWKSgsNUhytT8nfxmS6uNqB5?=
 =?us-ascii?Q?ycc4/J3bSZLRRzSuNS6l7ayf6HplbUfJ8GxXPcPexln6YbSIrckgb5Px2i2W?=
 =?us-ascii?Q?cR/X+NFZcszhz+wa6zBcrqXFmZUnEnCdiH83nCMkSUmDGWjpBjxMVukd7jFT?=
 =?us-ascii?Q?Kjszcf3jJMIlabYWxAAVXFynZjaOwR35DisXYNCBZy2SN0L1scHOdT0TWI1U?=
 =?us-ascii?Q?bSuRmsD8bDAZTT23k20x3NDPLeQsGMjb2eZdzajgq5BFtw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZrJrIu1Imj/Q7tBCdWR/xbHiyzAzvzOvd7qIqCIO17CZY85a4BmfeU0wuW2C?=
 =?us-ascii?Q?5bdvFDrMD1g50fg/xI1KbbW4aSJTcCh1jt/s0Gyxmlmz7DqfWY99XOe8FbDQ?=
 =?us-ascii?Q?zPPyqj11S2g1ea/76a4tKTvcAXzJ+AGBEgnyNiYUjFqTX6yPt6WbzZQhBdAS?=
 =?us-ascii?Q?jF0Yhc+inb5l3WqZvwxY5zZbrC9HHgYccMHp4ZeHUGse8TjMhDwyIzNSiCz8?=
 =?us-ascii?Q?hoLUuhzXZCDDkyZ0eK2FIfa4104GHprN8vdVGCZLfuwHKDQb9KTOdDSx6MPW?=
 =?us-ascii?Q?iRxvLARaVkIBGJkCAVXdv43sV6NonuSAC4XUEAbeDRwXoZbi1kyGSFM/4ToE?=
 =?us-ascii?Q?r39Ex8+LUmyE5E41kIb3UVUp5S4KuU+TG1jJJXe98AaRho7r9ZYH6iNwVWAs?=
 =?us-ascii?Q?uoDl2uCYyLz/xS/ngkPfbYsPsNCL4zNKXMXt9OHiO4acxFfGYE5WK+yddt8m?=
 =?us-ascii?Q?VBiYyS9012g4DvfkELMzX5oFKLE8Oipe2fhnqr+kgrnaUH8j8P9rBTtqfKro?=
 =?us-ascii?Q?vB9ZHN5JFbgGnAgJtnH4PXKipxf6Z47+8XzjQL8GvYWeQKsT2cFoyvYliTFL?=
 =?us-ascii?Q?zdWAZHWM63P4F7ZNq1c4WCiBXdf9/jBh3lHMXNATz6UXbJNe6IJm3sIFT8Pz?=
 =?us-ascii?Q?qhyCdXR4T48DvIaX32uQhKZ+agH0aM/isrocj5gyATeNN+n9eWJ47V3Pl171?=
 =?us-ascii?Q?Xh1yqLX43HSrf+MgwJ8K39SYp7GrmGp2mNI+5KGfdwDd8wQDZZiiSv2MCDgA?=
 =?us-ascii?Q?OaOExZJTo5nRi8wMzdUeOAalFaOJE0yxaY1yToiCS+aiNt4VlGsDuWnykvHq?=
 =?us-ascii?Q?Tgz7EKj8ughgDQUVE5MEEnJ61JK1RZyy/poorYHdbpmDWe0x0It1bcXE2qfZ?=
 =?us-ascii?Q?rIW/LA4A8Y3+R8dV1gfqfjB6Gg5MtDXjh2G8NEJjovspFqAWwd5yiKZUnIM7?=
 =?us-ascii?Q?IGZJYf6gGq3Zbv2pgoWnJK3Borrr7kdMUi3mmAUb8A1RkkNmQ9SCSnsiqKKo?=
 =?us-ascii?Q?at14yFlktM92TgBu71ylnLLk7mUzZK6CYsTIWP0NL9WNpCLvWoQV3PFN+fTR?=
 =?us-ascii?Q?4vWu+IUY+rYTER3Eimk8ufpGe3e8UaticocFaW2ifGHz7qLHkl63fV4jHhiq?=
 =?us-ascii?Q?v3/cZSVBcAezUzJV4NBH4WBXGoGLy6YmuXoi/q6KC5JOyhSfkg/xRZmqohjr?=
 =?us-ascii?Q?n/PIxHllDI+IUIhEbEiWatEhsf7WiqsL3DijosL1nmt+5j6Ou98ULeUdjuE+?=
 =?us-ascii?Q?X5iRoKCyGImpBfvcOtt3IzP0kj5kU20CIrZbm4R6nDXb4NG33t72vhexDo/U?=
 =?us-ascii?Q?ifSP2iFdj710evDt2x3B1iPKJ3aFasJMwpCpk4hSciogPF30Z+svHgMWLjPp?=
 =?us-ascii?Q?B75XFiUdSOF3mABAwj4/spNz+gpMeevyHdOr48dzNUSiSoRVgiE8ykMwXLA7?=
 =?us-ascii?Q?DLJb4IvTKMb9TS2xRlf2UomR1TpG8VeANcRUsfWWov/80FFjRjBal/fYhWUc?=
 =?us-ascii?Q?POp3KjdXlQXNV7XbK9MqWY10HJrd46cbvkuCI/RX85HplA5MeFvm084gXWzp?=
 =?us-ascii?Q?lwvBuWHOc/KHBL6NtDv1pGRseoP6z6KkB9tEWmOS1Bb8YSDKh0pUFflEtI3A?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc392d9-6410-422c-bac5-08dcb824db0f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 03:39:21.4091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfLQJGgzkUNBeWYQ7/ZszABfZRQ0ZKVcgvWMgeHsBWgm64SNTSiR3yFZZS1X+MZFG6djW6NkRwoYkCKjdaykog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Thu, Aug 08, 2024 at 08:40:24PM +0200, Francois Dugast wrote:
> Ensure we can safely take a ref of the exec queue's last fence from the
> context of resuming jobs from the hw engine group. The locking requirements
> differ from the general case, hence the introduction of this new function.
> 
> v2: Add kernel doc, rework the code to prevent code duplication
> 
> v3: Fix kernel doc, remove now unnecessary lockdep variants (Matt Brost)
> 
> v4: Remove new put function (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 33 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 588cf5836798..abb2dfe7b1fd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -819,10 +819,12 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
>  						    struct xe_vm *vm)
>  {
> -	if (q->flags & EXEC_QUEUE_FLAG_VM)
> +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
>  		lockdep_assert_held(&vm->lock);
> -	else
> +	} else {
>  		xe_vm_assert_held(vm);
> +		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
> +	}
>  }
>  
>  /**
> @@ -876,6 +878,33 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  	return fence;
>  }
>  
> +/**
> + * xe_exec_queue_last_fence_get_for_resume() - Get last fence
> + * @q: The exec queue
> + * @vm: The VM the engine does a bind or exec for
> + *
> + * Get last fence, takes a ref. Only safe to be called in the context of
> + * resuming the hw engine group's long-running exec queue, when the group
> + * semaphore is held.
> + *
> + * Returns: last fence if not signaled, dma fence stub if signaled
> + */
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
> +							  struct xe_vm *vm)
> +{
> +	struct dma_fence *fence;
> +
> +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> +
> +	if (q->last_fence &&
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +		xe_exec_queue_last_fence_put_unlocked(q);
> +
> +	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> +	dma_fence_get(fence);
> +	return fence;
> +}
> +
>  /**
>   * xe_exec_queue_last_fence_set() - Set last fence
>   * @q: The exec queue
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ded77b0f3b90..5dcc1a65e5cf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -73,6 +73,8 @@ void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
>  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
>  struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
> +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
> +							  struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
>  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -- 
> 2.43.0
> 
