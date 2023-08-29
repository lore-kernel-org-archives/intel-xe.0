Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4B4C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 18:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9758810E052;
	Tue, 29 Aug 2023 18:10:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BD510E052
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693332611; x=1724868611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y3pnEtcGx0EpCx1Ib4N8SztjCn9rhvbw5CLYEynEVEk=;
 b=EnYk1iuCQxOOYUPTo+yaeaNQ6kqp76w8xw84nUoZz9WzqhfJ5ReGuw3e
 hKN9WMWxykhWvWJHPHXm+/tR1avglIhxTGQ5pWHiB5dDn1IT3ia2NrCmx
 kGhbLY5Ajw0qVbgmx7syO40p/ePFVMRO/4MY9P5uMCmsoRV7AfOvs7AeF
 qY9nKFeoK7yoDChGXgecPHG8qA87u1/oGufrUKlcIuARYX50VEoCB+A1+
 i2gJFgYc3sAYK145DEJv38i85oA3d+k9Xs/yE23ehzN3k7LJgZ5vM+flO
 Wr7QsJwZhvvOq6qq8K2SjZv6gqEJ4z4bk7hmhYj0ngrhtpz4t0LVI3mg+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378161353"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="378161353"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 11:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804219877"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="804219877"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 11:10:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 11:09:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 11:09:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 11:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVyQs2OdLsWp1O6GMWKWjTPlH7NM6QvyoWkM/U3EBlG9Nij2WVPAnoIDobA9+6eb3E6IwyCPZtloFYWe30G2AhQbQsfdQikC15t11E2P0WC0cn/y3YIVWHsv66oKv89aBOB2sYT4HhpW9TCw9bSTWy09dfek742NDJXJGMuxQtM8NKQbpwbfmXwc/tDck6XdrhgqTbgAFSbNltmoORTSWBJajVbuIks3/E2YdeVaYLJOwrN7dmiWfNB0FSuH1KCG4Gs7kf0K8NAZbj5qinwzQTzxhfsfGRMOGaSDD8TPaY+n5wulQensux4/YnY3a0/ihGnS9Gvz8XB6disLcHWlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN9B2mxtYuNnjgoHL2NjG+Nggq8YU8wXOy1wCfFnfvM=;
 b=LnyDaJ/arOUNFo2itKWEqVeHFVijlzvnNF8o6+O6Egu5FK6BxaLyxUuh1juwHpywNhyf1juIpszjHxgonJfV5xQ61wLE6ob8G2WbE70MUol+PcPFnBWw/MKWCB8zXmwEY3KrYAKU+GVOxuWVKG0KbspMrCm621xMft3O+OCrjWrSsz020Ul1NWfNZgsTNBDyMP4V6md2DMUodX3oDK6QDNlnLTI6AkjCnFH6a05JmWbZytbuEuF8InYna73+X5GEH5J1+Dvj8RXkkzhRc3iKf22Jl/pwRa7gc1v4DKZLfTo98S8BUy2ubBrbPA4H3Po0f1gup+S/uJYLQCXIrteSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Tue, 29 Aug 2023 18:09:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 18:09:52 +0000
Date: Tue, 29 Aug 2023 11:09:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230829180942.GJ1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829162840.73444-8-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 178c4a64-bc96-4709-48af-08dba8bb23dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08SnbrisIZc7s6LcWm5c2SGrdDAlTs3o/g/3ZVtLY4sRFfOD9m49ozpUMoRGD0Y7BZ9IV4MxkNmxDzqZ4Kfgupcqs1fi6neBo9wgJYDiI0MjVYRSGSTc5L+B9E6ySJeRT4YzcXQYjXuLRSvWSBjbx3hp3wXBLxIOeoc6wYUusNMRGIYlnIn8FenjymhQgTMbiGyOnlO7fdn8y6Zo0WhauHNRWP5hi0V+9L1YxOPBeDMc71KH6xrdQ5FOMvlnmTV5Cq1Uhu7iDrKtjPhHaPib5WNleYzq2YQpCaokY68Tsl6Smg5D3+g1TtJ2bJ8MUdiXj11e04k5ZQyJ6D56QiBuhgMlKYk/Oji36ZeBmQWAAc895xqhbNrrftCUXckej2PITWMZ8/RsB10pgbDMQEWMgxNeOYg2WiNmW4bR2XC9nAxBSo8P9r+pOgI/mgN9xul8uZmWEI26+ZvPJ7ouZFW3j5PldcT+OJQxqbKixW5yE0PIe5dkzRgYCMvXnIs/4qsf9+awZrrhyZRRG7rKj4Zb98H6tQL203Fn8EmouGHw3QlowxIKp9IxAbSqGqiOxZ+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66556008)(66476007)(54906003)(6486002)(6636002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(26005)(8676002)(5660300002)(1076003)(83380400001)(2906002)(30864003)(86362001)(66574015)(33656002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iNUUhEG+rSTMc/aQ6k2q1XTlpY6b7ITi1xbF0v67vdnqwGsKLnUCXm25gG?=
 =?iso-8859-1?Q?S+Ln3NnySK78A28R8jpbs0ONOW64WSiFKU+DogmizIozqPrP+XNGVWI4Y9?=
 =?iso-8859-1?Q?Y6jzVztKNsUiyz62HWx3y720ohsNXHZv+MKuaJhHFAfb9gv7au0uwtzIQE?=
 =?iso-8859-1?Q?+ZcKpBMV5ZLWYh/NRTAuHhLmNsUehTARnkbfX3CyjIXPf00DaFaUC3di0D?=
 =?iso-8859-1?Q?rMTvg90vsaFU3LWO5SUfy7ynvEJceX/1ZrNkTtGRvX552q9Q8jTlvwOvle?=
 =?iso-8859-1?Q?yH72ZuaQEjrpBzGs+DvUNC9jUJE+htCdl6PlR4vlBwjMkvUfxpqTjMjg2v?=
 =?iso-8859-1?Q?hRw1Ogj1dbQxRGjT1gigq6w9WX0gcObYnrpAZIG8kMo3cz7DEow93CvKxP?=
 =?iso-8859-1?Q?52xndv4SfgixVEWppSIkWPIbsv/BwQEBvXZebCuepspYV/6Y18komvMFaC?=
 =?iso-8859-1?Q?ulmBIsfakfAxMds/hbWaT58B8Q2zBS4aRVCd2kV8Ol69yRmbJ/CCErBbM0?=
 =?iso-8859-1?Q?H1MhH3q/KFDgu+DeuothBP/nRSUAd9VVByo7jd4yAUsXoS6PrKYCqaCo2z?=
 =?iso-8859-1?Q?E5ScTJjDEgMqYzvcThqTLv48CvoemyieTKjk//XmUnCb+1gUxxOioGsnWi?=
 =?iso-8859-1?Q?YNcc9CtpWMBkuz+lweJXQTMb5Ro24HJhQmcrn+1RaZwX4QCKWzgeE6WVzW?=
 =?iso-8859-1?Q?FhQqAh/stfI1If+hLOLUDsvNEgPEOI5a5iO+Nk8Rt7meIz6qg9Aw5VzEPl?=
 =?iso-8859-1?Q?VmInT1me/pMO9mT3n/gJxybx0dE3/LI7IGMTMj0o2HCb+qM9hu+CSnrJbK?=
 =?iso-8859-1?Q?dvlhLIiHbwyFi1vwwF06eU0NPlN9+OjO7h86O3Xme3adblhnwtNhoxm3wb?=
 =?iso-8859-1?Q?zBdBTGwdA8gPFD80I76M8Ew+HILsIN7s3sUfoUA3C05MtCw9SGPAe+E0jj?=
 =?iso-8859-1?Q?JSh0sYlzTuKANj1Cnei0Vsf/s1dyo8Af1u4z20Gi3tiAdinVVIwwiofMCE?=
 =?iso-8859-1?Q?98kFEvZaqUh/dC9oRtlb71xFG5wgaGc4lcZ/2brrkENIZMDu7pIrxTJNLy?=
 =?iso-8859-1?Q?j0DSVaD+zrv4gfT9pCZ0Cs8gXAnXGdgnLmbe9PvkZV0LYqxjcycKv0YT65?=
 =?iso-8859-1?Q?D0JQAqiTeg3N10Oh1ztq1YNZ9VPu0vpwqsOa1Q6su8k3wwmeZ6sCVS+ZLg?=
 =?iso-8859-1?Q?/sEwP2GcxaS+544UeaHSnlFmCQnGwF98SEh9MJH4hFXsMfZv0JemC3enwJ?=
 =?iso-8859-1?Q?fD0G/xSHmipB6LsRgh7iRrD9uBj8/aQgyzZBOhsehpMSrMKMKAnVjzyoyf?=
 =?iso-8859-1?Q?QfiBZPhhibdub92X4wO1kAKkrJfryokqkUMDULa4B/s1/5KEaZFOEi8jZE?=
 =?iso-8859-1?Q?uEcxu+AXjFTv9o3neIZdAg0koHhYScD4o0e96OEcK4qyAjahHFHpT6i2Tx?=
 =?iso-8859-1?Q?uEoQyPusMXeEC2e5tftvuuWHVpDy4b+LTf5SvfFWRRNyD26Z/zJQcAxwa0?=
 =?iso-8859-1?Q?7QnpOUHQQAbt4gMFtdF8mTsmMaZoSwXN84ymrzp2EYdCqihUolId1RrdH2?=
 =?iso-8859-1?Q?OiMvUD2Plx5BvGksWhfyr8XxDW3anhJl/G7qBuffIWFJD2Ueiu3EUGsJFB?=
 =?iso-8859-1?Q?2RO5wyTamXfGFHYKyue8l2R7Ue1pMJot4AXpS0Znl2TiBhkxsKkHPu5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 178c4a64-bc96-4709-48af-08dba8bb23dd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 18:09:51.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adwV+rP2eLs8ICMPLtS0qdW46dsxbHZ5SPXdF8i85bQqfkCvmlNTbDAdAqwGKg3uv3eItMs5jDWoZ0RVVUjx8kSjNrjDo5sRhw6Z4B+IUhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/5] drm/xe/uapi: Add support for cache and
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:42PM +0100, Matthew Auld wrote:
> From: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Allow userspace to specify the CPU caching mode to use for system memory
> in addition to coherency modes during object creation. Modify gem create
> handler and introduce xe_bo_create_user to replace xe_bo_create. In a
> later patch we will support setting the pat_index as part of vm_bind,
> where expectation is that the coherency mode extracted from the
> pat_index must match the one set at object creation.

Minor request:  can we add the word "cpu" to some of the fields and
definitions?  Terms like WB and UC and such get used all over the place
and it can get confusing when exactly we're talking about the the CPU
cache behavior and when we're talking about the GPU cache behavior.
Since this gets exposed via the uapi, it's best to be as explicit as
possible.  E.g.,  "smem_cpu_caching" and "XE_GEM_CPU_CACHING_WB."


It might be good to explain why we're defining coherency mode at object
creation time instead of solely at vm_bind.  My understanding is that
it's mainly so that we know whether it will be possible for userspace to
pick a PAT that will bypass the CPU cache.  If they're able to do that,
we need to clflush after clearing the buffer contents so that they can't
potentially read old, stale data from memory.

> 
> Co-authored-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

Nitpick:  As original author, Pallavi's s-o-b should come first, then
your C-a-b, and then your s-o-b (which seems to be missing) right after
it.

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 95 +++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h       |  3 +-
>  drivers/gpu/drm/xe/xe_bo_types.h | 10 ++++
>  drivers/gpu/drm/xe/xe_dma_buf.c  |  5 +-
>  include/uapi/drm/xe_drm.h        | 47 +++++++++++++++-
>  5 files changed, 140 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1ab682d61e3c..f60090fe8cd2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -339,6 +339,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>  					   PAGE_SIZE);
>  
> +	if (bo->smem_caching) {
> +		if (bo->smem_caching == XE_GEM_CACHING_WB)
> +			caching = ttm_cached;
> +		else if (bo->smem_caching == XE_GEM_CACHING_WC)
> +			caching = ttm_write_combined;
> +		else if (bo->smem_caching == XE_GEM_CACHING_UC)
> +			caching = ttm_uncached;
> +	}
> +
>  	/*
>  	 * Display scanout is always non-coherent with the CPU cache.
>  	 *
> @@ -1183,9 +1192,10 @@ void xe_bo_free(struct xe_bo *bo)
>  	kfree(bo);
>  }
>  
> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_tile *tile, struct dma_resv *resv,
>  				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    u16 smem_caching, u16 coh_mode,
>  				    enum ttm_bo_type type, u32 flags)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -1223,6 +1233,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	bo->tile = tile;
>  	bo->size = size;
>  	bo->flags = flags;
> +	bo->smem_caching = smem_caching;
> +	bo->coh_mode = coh_mode;
>  	bo->ttm.base.funcs = &xe_gem_object_funcs;
>  	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>  	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
> @@ -1306,10 +1318,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>  }
>  
>  struct xe_bo *
> -xe_bo_create_locked_range(struct xe_device *xe,
> -			  struct xe_tile *tile, struct xe_vm *vm,
> -			  size_t size, u64 start, u64 end,
> -			  enum ttm_bo_type type, u32 flags)
> +__xe_bo_create_locked(struct xe_device *xe,
> +		      struct xe_tile *tile, struct xe_vm *vm,
> +		      size_t size, u64 start, u64 end,
> +		      u16 smem_caching, u16 coh_mode,
> +		      enum ttm_bo_type type, u32 flags)
>  {
>  	struct xe_bo *bo = NULL;
>  	int err;
> @@ -1330,10 +1343,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>  				   vm && !xe_vm_in_fault_mode(vm) &&
>  				   flags & XE_BO_CREATE_USER_BIT ?
>  				   &vm->lru_bulk_move : NULL, size,
> +				   smem_caching, coh_mode,
>  				   type, flags);
>  	if (IS_ERR(bo))
>  		return bo;
> @@ -1367,11 +1381,31 @@ xe_bo_create_locked_range(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bo *
> +xe_bo_create_locked_range(struct xe_device *xe,
> +			  struct xe_tile *tile, struct xe_vm *vm,
> +			  size_t size, u64 start, u64 end,
> +			  enum ttm_bo_type type, u32 flags)
> +{
> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
> +}
> +
>  struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  				  struct xe_vm *vm, size_t size,
>  				  enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);

It looks like xe_bo_create_locked() is only called from two tests now,
right?  It's not obvious to me why caching=0, coh=0 is what we want for
those tests?

> +}
> +
> +struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
> +				struct xe_vm *vm, size_t size,
> +				enum ttm_bo_type type,
> +				u16 smem_caching, u16 coh_mode,
> +				u32 flags)
> +{
> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
> +				     smem_caching, coh_mode, type,
> +				     flags | XE_BO_CREATE_USER_BIT);
>  }
>  
>  struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
> @@ -1754,11 +1788,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct ww_acquire_ctx ww;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
> -	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
> +	unsigned int bo_flags;
>  	u32 handle;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> @@ -1811,8 +1845,38 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>  	}
>  
> -	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
> -			  bo_flags);
> +	if (XE_IOCTL_DBG(xe, args->coh_mode > 2))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, args->smem_caching > 2))
> +		return -EINVAL;
> +
> +        if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {

Indentation whitespace looks wrong here (spaces where it should be
tabs).


Matt

> +		if (XE_IOCTL_DBG(xe, !args->coh_mode))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, !args->smem_caching))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) &&
> +				 bo_flags & XE_BO_SCANOUT_BIT &&
> +				 args->smem_caching == XE_GEM_CACHING_WB))
> +			return -EINVAL;
> +
> +		if (args->coh_mode == XE_GEM_COHERENCY_NONE) {
> +			if (XE_IOCTL_DBG(xe, args->smem_caching == XE_GEM_CACHING_WB))
> +				return -EINVAL;
> +		} else if (args->coh_mode == XE_GEM_COHERENCY_2WAY) {
> +			if (XE_IOCTL_DBG(xe, args->smem_caching != XE_GEM_CACHING_WB))
> +				return -EINVAL;
> +		}
> +	} else if (XE_IOCTL_DBG(xe, args->smem_caching)) {
> +		return -EINVAL;
> +	}
> +
> +	bo = xe_bo_create_user(xe, NULL, vm, args->size,
> +			       args->smem_caching, args->coh_mode,
> +			       ttm_bo_type_device, bo_flags);
>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
>  		goto out_vm;
> @@ -2093,10 +2157,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>  			   page_size);
>  
> -	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
> -			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
> -			  XE_BO_NEEDS_CPU_ACCESS);
> +	bo = xe_bo_create_user(xe, NULL, NULL, args->size, ttm_bo_type_device,
> +			       XE_GEM_CACHING_WC, XE_GEM_COHERENCY_NONE,
> +			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> +			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
> +			       XE_BO_NEEDS_CPU_ACCESS);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..2311ef3ffaf1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -81,9 +81,10 @@ struct sg_table;
>  struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
>  
> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  				    struct xe_tile *tile, struct dma_resv *resv,
>  				    struct ttm_lru_bulk_move *bulk, size_t size,
> +				    u16 smem_caching, u16 coh_mode,
>  				    enum ttm_bo_type type, u32 flags);
>  struct xe_bo *
>  xe_bo_create_locked_range(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..a98ba5bed499 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,6 +68,16 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +	/**
> +	 * @coh_mode: Coherency setting. Currently only used for userspace
> +	 * objects.
> +	 */
> +	u16 coh_mode;
> +	/**
> +	 * @smem_caching: Caching mode for smem. Currently only used for
> +	 * userspace objects.
> +	 */
> +	u16 smem_caching;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 975dee1f770f..8ba7daf011bc 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -199,8 +199,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  	int ret;
>  
>  	dma_resv_lock(resv, NULL);
> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> +	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +				    0, 0, /* Will require 1way or 2way for vm_bind */
> +				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>  	if (IS_ERR(bo)) {
>  		ret = PTR_ERR(bo);
>  		goto error;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..64bc66d4b550 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -461,8 +461,51 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> +	/**
> +	 * @coh_mode: The coherency mode for this object. This will limit the
> +	 * possible @smem_caching values.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * XE_GEM_COHERENCY_NONE: GPU access is assumed to be not coherent with
> +	 * CPU. CPU caches are not snooped.
> +	 *
> +	 * XE_GEM_COHERENCY_1WAY: GPU access is coherent with CPU (CPU caches
> +	 * are snooped) until GPU acquires. The acquire by the GPU is not
> +	 * tracked by CPU caches.
> +	 *
> +	 * XE_GEM_COHERENCY_2WAY: Fully coherent between GPU and CPU. Fully
> +	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
> +	 */
> +#define XE_GEM_COHERENCY_NONE                  1
> +#define XE_GEM_COHERENCY_1WAY                  2
> +#define XE_GEM_COHERENCY_2WAY                  3
> +	__u16 coh_mode;
> +
> +	/**
> +	 * @smem_caching: The CPU caching mode to select for system memory.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * XE_GEM_CACHING_WB: Allocate the pages with write-back caching.  On
> +	 * iGPU this can't be used for scanout surfaces. The @coh_mode must
> +	 * either be XE_GEM_COHERENCY_1WAY or XE_GEM_COHERENCY_2WAY.
> +	 *
> +	 * XE_GEM_CACHING_WC: Allocate the pages as write-combined. This is
> +	 * uncached. The @coh_mode must be XE_GEM_COHERENCY_NONE or
> +	 * XE_GEM_COHERENCY_1WAY. Scanout surfaces should likely use this on
> +	 * igpu.
> +	 *
> +	 * XE_GEM_CACHING_UC: Allocate the pages as uncached. The @coh_mode must
> +	 * be XE_GEM_COHERENCY_NONE or XE_GEM_COHERENCY_1WAY. Scanout surfaces
> +	 * are permitted to use this.
> +	 *
> +	 * MUST be left as zero for VRAM-only objects.
> +	 */
> +#define XE_GEM_CACHING_WB                      1
> +#define XE_GEM_CACHING_WC                      2
> +#define XE_GEM_CACHING_UC                      3
> +	__u16 smem_caching;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
