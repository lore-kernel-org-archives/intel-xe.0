Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B58C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 21:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4310E531;
	Thu,  4 May 2023 21:25:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1177A10E531
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683235512; x=1714771512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3RwwYlDIEv2ZL+4OaBeuukf9WM+OszOOlEMusVUhJHA=;
 b=dHyanRyWjoVebq1r2G6pVELRH8Bf1z9ofFu1g85uGA6B6oHMyW2Ad/j+
 yYqTH39e05yDWJV9RGbFO3CVnBQDjhziv5kkU7cdnOXW7AZ3ooht8PoTY
 pe8NCt9rB6rzW6EtSvQ4oTkYCKuag2lfEHe9zTlcfrC9xNPhgpy6b1wTO
 I7nWvm6RPmx3NotmiVU8j8KPDS/XTcDmyxEJwRnsoAVkUTRbPTE7QcfIW
 lKkHXG3qDm58URODHE9Dg9ofYgQJkOoSBiDvlN9nFE/KUCmBzo8x6451G
 orH2JwetmYIcZJ4BqwwdwQ6odwI+hPdeLPlajTfxt0V60MPZIyOOACfno A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="352087358"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="352087358"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 14:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786745745"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="786745745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 14:25:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 14:25:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 14:25:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 14:25:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 14:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0kGCA6o1TysRP8yiogci0fLKKxaAh/X9ABS2Vv/WRPCw2JdMlDQ9HysvRoC0nju26WJNx2qwSudDlCmrEd8W7ru+MBM6OlmkS1RlNICFqM3Zv1+7ZN39PTLaYZuIfO/Ho42+gAmNB6L6J4Bv5PNFb7KbfWI2hyZ90fLBUAGAckJodika7SbMOni3F11S+1amzn1GHQ9xQEmorIZWpMduxJNSNaOQGGt3X2jgQo79x1BgD8RB9MWEzciVocYJLo/DdDPchvauMoOchCH3QWO25yTvlwXHJkGn0QtDf3rOotmgxOrCiS5z9Q02S1qgEmXLBnPFkURY2S4QjFQER354g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhLh5y8nkr0mi4yNXHjHRc6mHSs3GC1+ae0yxV/qe88=;
 b=UUMQjQX1fJIuVXdqjNwmRogd5uznSdPDhSWK6gYfseUUpPNAZAH+BShiYBi3Eu/C09Z6oMDMia+eMPJIEINJc+jAIdR4bzQgVUWCFLAszUIrBFPXuRI3Jy3uI5EzypjZ0cwSjyxnTfttA5+PivgWCW+51cafbZQH/Ji/NSLLkR+UwB1uRDtCWTj+9Z/Z7ddfstFqKhEo97umhNCc2lscogrZtzSLItCW1awTx2gXZP5PAg7VGzG4mRvTV9O22UOy9yzC3HREltPgPOv6JwUR7YTJ9QEjIOJXI1aQ1iHR/8SpauDZF4YFPES1pU/ANdEGKwhgRO6r8aVTsmPbbilH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:25:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 21:25:08 +0000
Date: Thu, 4 May 2023 21:24:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZFQinwHATXElUzNJ@DUT025-TGLU.fm.intel.com>
References: <20230504205320.3869491-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230504205320.3869491-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 976ce543-5c9b-49c2-f3f5-08db4ce6095c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xf83zrIxXuwZwVj74vGo6xbVhbk9PIxsX9TymMHImf1I0M7hFp/e6ksqxyfUFKLt8jnZT+/vAgO1Pc1ZFODl0SX5vC9DdklgiwjwuMXqQuQ8Iw5iILkgRuXc85SdEI2OTnQFbX2K/mOxfgGnjMqdCQI9UYot+u7mVXGnvvZ2iJlqItqEmj4FsbsJ0grIO+9HrS+AAp696aqxUcMovXatp9Od/HHzJylrD8EWJ8/2qBt7AU7gK+4bJeYSaSGNmpSvIyXrQlPG2K+Wrw/QlJFARJlxnbG30A5n0aj0uxmWHGQg/kbo1ybbkdA7qG5VqEoviYlovM38F2fumoLxLtVv9suUH1g9mw1LfJD9vpG0elNEx5Zsn0xj5+83SHYqqRGAbWn47pk9Q4EWIMZquNXstJFCNDxK3O5d8oEWo/Q/WO7lC3q4n6hGfLd9gMJmcwBcVwbrOMhNunuxxx3d7t0ldCLkiO15Ci8bY5Rv0QpLRkhU3CGlhDczl87luFvpSwgI30pPtENySC3yQohyepll+n71BiOGY+dgEwEktzSSpzQW9W5P4pc0jLrPlOydJ8iF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199021)(478600001)(44832011)(38100700002)(5660300002)(6862004)(8936002)(82960400001)(8676002)(6506007)(6666004)(86362001)(66556008)(66946007)(66476007)(6486002)(6636002)(26005)(83380400001)(4326008)(6512007)(41300700001)(186003)(2906002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YluhalkOuSxHqqDVBlrBEwA2AuhxvnyCAbUuqpGgpwSThgmvqxfcx3zD28XD?=
 =?us-ascii?Q?ejyAymqb8zSIY8pyHzD0UGz35GbPaKwc9vnQpUC9A+MidR9JTLC17doQQj49?=
 =?us-ascii?Q?nqF1V3pWIvuY7njo7VjJZHbbholhdFVYnXa8mQe6KEofsOUnVt+hXwv812Hc?=
 =?us-ascii?Q?WdsPsv4lhZN5e4UD8xQgOPcz7WPtfiCna9LUl06f4G8VjVnGS+57hBxG6+hQ?=
 =?us-ascii?Q?VmvAjqJOs/9e/Nn3trskzxBEpi+2jCM3bE9z98lTp69RUwCjUDCDEVxNis2x?=
 =?us-ascii?Q?WcF+I9LNGzPS3AR7czwiTqLcwXBGvX+1zD8QPVd9igno8mljI33MPvd4Q668?=
 =?us-ascii?Q?BYwikDURSIAgsyBr0NmZTcb70hYdhn61uue/rJDGGNW9CIG7+K/wP55PmEeT?=
 =?us-ascii?Q?qDmzwxnfJu6jFPBAAxsmUbyM1r0UC0mMQ06l7jnETtHHx710aqHT0Jl11TV+?=
 =?us-ascii?Q?ZYv90MZChJMLw2050KUIKVTuBh/p0P5H9rYtn6fl3TQzPFbZlVVEJOw8lWPs?=
 =?us-ascii?Q?p283sMUaXa2Mf9xK+aoOi6t6dBGS9iCqtCvImI6YYPsBocxsq82+UfXaK9QN?=
 =?us-ascii?Q?MQbnpodx6pGqHnHRj6Z3UQ05/OGgAuMJrEd1BzUiKrD12AWbrU4xx4HvwKHe?=
 =?us-ascii?Q?vXC7kvQSofY1MSIN84ueG+UPuJkVHsJrarQlB/MZMwTC647TGLG7hzjEpVA4?=
 =?us-ascii?Q?LsmlwNktM/s1Jt2ffIFygnKbAXVuOAqPYQ/zBcS/pLM/ZYQjlXv7segUxRhX?=
 =?us-ascii?Q?geFykEfktmr7yWWWprFyd4ub6XjxFeLFf4gEH7aNjBGkvwAiQgQPusKA4ImS?=
 =?us-ascii?Q?sKcAVI6bYZlWR1jHDuyCnNmEAJyq5nShF/38oXpA5QGmv4RkmFtTGA2ijJD/?=
 =?us-ascii?Q?ptycbhAvAtdC1DhlKnQnHNTbFkEZUE3dBY7/EVJxsa4t3MWDZTFNKCErHtrv?=
 =?us-ascii?Q?Nb6r9fD1zgdxQyucSRVdb8yKNvGcrYmE4gMN1RbKoq6KRiuP6XPNklFGkRw4?=
 =?us-ascii?Q?NYec66QPLmDCVIOs5S0qVboYFhDg3kw/K7oOJl9zR2/hLPuPFaBqs/nvcMp1?=
 =?us-ascii?Q?aYYuO0vfK6BY/fg6SM2zSW8z5TzfCobzWcPM+Mnnbe+MLKWsUYeJzUvdGVPG?=
 =?us-ascii?Q?iiqogf5KrNAxlsXU9zOLxfsbXOi48FSt+e6x0wMouPm2wVWP2UxdNRsi3GNj?=
 =?us-ascii?Q?00Z/Zfy88qNvwgdw7JERSalJaHEsKaoTG63UASTu3srb8EYscLIPmsODZV65?=
 =?us-ascii?Q?yaNEpmbbLSVL+rKySee24wKb2XsZpKjNj4G7x8tZOlBeSCw8We7H07PQENfS?=
 =?us-ascii?Q?04sV83qoyhcRkbHaTVYSe8cg6nrBxzNZDYNyjphaaFz0gqC2IgtRA7wz3nKf?=
 =?us-ascii?Q?yXxqqsukiqcKKEiViFxkE2YYOk4Gk2X+Y0WBZqVJLOsJ4t2ssOJm3LCMRDsc?=
 =?us-ascii?Q?L+ltwcZraCvwM6doueHIlDnQEicuJ21fMWTMHAbQ9SJ2NGZZHkm+UP95lqjR?=
 =?us-ascii?Q?YzuzV5+XkEXbtj/RFpzPXiBJs5Oj1UJDrRBPQ5KdHESHSb0+95/GAVLlvUd8?=
 =?us-ascii?Q?fdj6N4Lrdq0p4QyjP3ftInsqebOTI+lVub6M9sLKdLqS6/2rI8GP+W/pL2gv?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 976ce543-5c9b-49c2-f3f5-08db4ce6095c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:25:08.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WDDbRKdvTkZ+n1o5omwJ11eugakUHJtVXubTTGsvjfWSkqiXKb4acRbauw9zGozs+SZXxmJRmdHOXDRj1aXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix splat during error dump
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 04, 2023 at 10:53:20PM +0200, Francois Dugast wrote:
> Allow xe_bo_addr without lock to print debug information, such
> as from xe_analyze_vm.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 19 +++++++++++++++----
>  drivers/gpu/drm/xe/xe_bo.h |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c |  2 +-
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..c82e995df779 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1545,15 +1545,18 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>  	return false;
>  }
>  
> -dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> +/*
> + * Resolve a BO address. There is no assert to check if the proper lock is held
> + * so it should only be used in cases where it is not fatal to get the wrong
> + * address, such as printing debug information, but not in cases where memory is
> + * written based on this result.
> + */
> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>  		      size_t page_size, bool *is_vram)
>  {
>  	struct xe_res_cursor cur;
>  	u64 page;
>  
> -	if (!READ_ONCE(bo->ttm.pin_count))
> -		xe_bo_assert_held(bo);
> -
>  	XE_BUG_ON(page_size > PAGE_SIZE);
>  	page = offset >> PAGE_SHIFT;
>  	offset &= (PAGE_SIZE - 1);
> @@ -1575,6 +1578,14 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
>  	}
>  }
>  
> +dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
> +		      size_t page_size, bool *is_vram)
> +{
> +	if (!READ_ONCE(bo->ttm.pin_count))
> +		xe_bo_assert_held(bo);
> +	return __xe_bo_addr(bo, offset, page_size, is_vram);
> +}
> +
>  int xe_bo_vmap(struct xe_bo *bo)
>  {
>  	void *virtual;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8354d05ccdf3..7e111332c35a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -199,6 +199,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  }
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
> +		      size_t page_size, bool *is_vram);
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
>  		      size_t page_size, bool *is_vram);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 272f0f7f24fe..91576cec000d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3397,7 +3397,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  					&cur);
>  			addr = xe_res_dma(&cur);
>  		} else {
> -			addr = xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
> +			addr = __xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
>  		}
>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>  			   vma->start, vma->end, vma->end - vma->start + 1ull,
> -- 
> 2.25.1
> 
