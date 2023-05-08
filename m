Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43CC77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1C10E309;
	Mon,  8 May 2023 21:42:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBDA10E309
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683582135; x=1715118135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7jhzzCpEAeqcOWMzIfuvstZ4sWwudsLag9jAGnkUeSQ=;
 b=TERrt7Ld3uwK/XVMNMspzMsXg9xXAOZuTPYdNb2KnLP1Qkf0LE/Sg4Eb
 5037tmUVtfogekLHMT2Z4SZ1Lk4nfyQ/+MTZ4i9KZwHsi6Pyw18K/s/a4
 aSaE/+7YCNi3vmzQU++9DDyhu3Pt7/K5JrXOz2v7pFt5sbTk+H5zRM5G9
 Ps8L/1iGIPGU/n196mD2r9JJO98AmaLJT2VfdxAkvGPZRF5/RWUbJL1Cg
 7S0ZuljDKvSxMq/pQsWJg/DmrNV5KaRbubjOGUnZKfrHpXCqMZFKJJHf1
 OM7is/ij7uwab+8VEDSi32tQM2FeyDggiXMRUVRC+hxifofXYM25OkQU/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334211824"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="334211824"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028565304"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028565304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 14:42:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:42:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:42:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2NZAN2B1/XVd6FkmaHosEGRmOtLaEev7s/Tznlnj6N+ZHT0rMLAXjmqE6HYBJTqu/znOrpbFAFZYmEOIKhXCDTqq+q8/3nKvcOQUiQrvFwqYvoqWZEiuSjQQCaM3dLsJmxo9ZCaEH5aXvSPmtzyvkGKHOCvwl5AHlhbIgmhQqyCBCjyoTXJaFjl25UaFO8Wnxk/SgCZYzBKIPZ+fr1PjKvCBEyzPBahkp3HmMeYPz/WvQJukKYGGgbwP8ClKiaM3Bf6xMQlhWRJlaJY77KZp25VxmhaO9kP+Z66iBgMIaDGh5wvi9yBZ9RIoYmGIkQn5obz6Z9QHHyfanFA5kJ0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWkmM08t+4+H+YHnhCP/87o//vvlmEsb+lR1t5Hlvq8=;
 b=R4huVu/ZQYYX/XR7wNG8H3JlZ+a94Cf+9FdaMCdUgIIoW53p5PHa758VYpw3k57QAblXDjmAbiZi6BlEPbnro47lwKKAYujuKOUX8+91WicYe0B62wKiYgPe+AT+DO1IOn2qD7tfiCRiG/GiUQ7MKy8/Rp0ElhPFVV6vwa451/SCt8IyRUwzF/n95ba80hN7yJa5PCa8BQY4964VX55YVEOBKbaK2irDLKBPsDVRSClNSBaJtPuQJ42pxcmWlh4b5XaB1hH5lHoyJ5KesXA4gRZD0cq7f23xnUE1IjhwEglnouDOXM41tMuixlE8UVjBffXyyy2ckHoLi+0Aoy1Mmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 21:42:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:42:09 +0000
Date: Mon, 8 May 2023 17:42:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFlsre4FzNsSM7ws@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-12-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: a0add7ee-7948-4fec-5857-08db500d130a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ga7MzFx/kxdE/Q7cxgL7pok7owz5d6Oo+H+/oM9oS6CW3OUMatowojLgHSsDw/XoyKqc+upEWsFbSITNRxBr2nHZjncEgvV4Cm2yDY4F5cw9O5G8VGqTM3JUgXLGZ6sGNJPbshdEQqJc+3ETJAX38nI2YSkW20kQyqTx2DORbBVVvnfp1wolW8RqRfRrzWzNiJ7zlFno8gZSaZjmt1U7duXqYyd1o2StcsaGvSb4KnJJTiBf8d/6RnAnRMqlLGSvRkYp2LcEICeg61Efpy5MmiXMcvLV3sbrNgnKGfZ8rLWsBTyFJ0OjdIbnL0bc3JZS2WruJRDtT2vP6lhXZ0lbT/HBn6miLCF5gBZYRhEyXrttexRqVqPc1HEE/pB3zkoFjM2tNPCbnAFI2YBKO2JuaWg1hgSD5xdzrNjxDufkHug5vFupUYXL0rGCJk9C1ky/vdomzGF8itIHQDuLTAkFEQyL99dra/yNigEoiC46QHbL1seJfZkIlK36OEcpknbVIJ//m79nPnxla7oyDNizOKICJd2VMtFhyrsrZfZucQzSkcjeEJmuXxRkz4meLmF4VBf8ge9SN2bPiSltGrihYV5ePmD54Vpy2zsmUAcmkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(30864003)(478600001)(2906002)(8936002)(8676002)(316002)(6636002)(66556008)(4326008)(5660300002)(66476007)(6862004)(37006003)(41300700001)(66899021)(6666004)(44832011)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f1Qf5XfH/mC5UfAJNQcDYFnncf1G0ufDAZrnOYeQwUly05CnIoJYuZxVklfs?=
 =?us-ascii?Q?NPjY+a0kfUflN9cddwnToHctzpeYcfzke7b9dWGbtz1nGBqE9dzRqo+1iSl3?=
 =?us-ascii?Q?vQEkCh7T1ITM/x5uPkx9YaprUvnoH60wZeUFYAUjFTu0G2pes/66E4DzWfiR?=
 =?us-ascii?Q?jR6quno2bELZvQT1WWVVU4gkosaLrkIzeN9qTMLFGzXGUoRstG31Wwz0+FdR?=
 =?us-ascii?Q?HZjOvZDOu2d5E2Zdl2FCEexAnaoXEvZ5HuPTGVlOYDDi4m37reclsCEf/ql6?=
 =?us-ascii?Q?Ovv6gOTTDK8/7ptz6qYrpg9VGWgSZwPz5tohqXBIxmr5QlVyxx+oDaMJSUYh?=
 =?us-ascii?Q?ajhzyu7hinc7GxLoUtSYRJltqdjfFoo1BHuhlKcx9y0u9wlXMSMSQMNrJGtd?=
 =?us-ascii?Q?YRPj/jlYDmBfehYkHZPeQEpgjCAihelWrvjV8loySV7YUHktufjMts7YFsGk?=
 =?us-ascii?Q?AUzqplgwZuXuCLJW0vibAch8Isz2OzQ3hHpgLJES79tbgIpfwDv5C15QLtUN?=
 =?us-ascii?Q?ZF4MKL6UAnj00JqZLoAwSNUrlCwfvev8dV+hNTPC5ggdy87Zo4X3iH/l14FX?=
 =?us-ascii?Q?Ja+WmOpONAIYcHaC5J6eOLWV6h+10UsDKVvxOL9WXL15ib0Lgsk2CDCnnbnf?=
 =?us-ascii?Q?dRIR5tpLukuInrpsmBItxXjuLqanlyfU7aCqXkJbf1DcBr+GC1CPeRqZ3eiV?=
 =?us-ascii?Q?ROLl8sI65aDQT3y6LZbjheBpVEiMueN4JUZ6odsW5SoPEhuPSTrelIH24yak?=
 =?us-ascii?Q?ZXY0/yD3dClMIv8YzvkqLT6iYCpu3S9+NZopxAOlHf3PGYr/n7wOxBgdGp6y?=
 =?us-ascii?Q?KQU2GVapV+0Hjzk3S5NWVMtzi95j8/asvyRNPVHQIf4SeHhqfjxi00n6bVHK?=
 =?us-ascii?Q?Gc+qeP5Z6h0d6bdqKgMVeVLCHggjtysKs6is4KM4lsMtxXsCmRwL8jr+oAAv?=
 =?us-ascii?Q?daZ8toXYPKxraRavZ+bI27xK5gHEYL8H9laSQ/PZFfM7DUeww5OOOYcPe75M?=
 =?us-ascii?Q?IO8EipAzruCl8Sw7UKqFK9U3qCVG5AcvI+VpzVDSgn/HXGep1/ETn5faZj2E?=
 =?us-ascii?Q?jmVIoPoWCmFBA9fGhM75rshrCq46ZxlOltPXZygZLThXXFTFISWtQKYgclAx?=
 =?us-ascii?Q?2GF0VM7jUdJ5O2j2q9zaadeh2CDHc+W7lfdzx7s9soKLl0lZXEkynej4OdRd?=
 =?us-ascii?Q?iVQCHX4AVQlYqE7l6GSgw9hu13V6UDSfqdSbRyl0aFgIlcZeE/zVjSwzvuLm?=
 =?us-ascii?Q?4Wr5lBtx1BHAtlg9x+11ykK4CEP6YzyJiVpi40ZV4RGHRJ1en5gnifq1fidR?=
 =?us-ascii?Q?1OZizavOwgCMdzV6WFMgIQCd+0OfkRHmAj5JIITwHNAB1z9ef+9Urzl+8FSW?=
 =?us-ascii?Q?sLwiWZYuff6ZsOgQl//J/bpzkIlPCdCbEpy/rNyVwD8+SRtKKT3hMhhz7aL0?=
 =?us-ascii?Q?EvLKMGqK4XY1/sIzV/1h+B+IXND2iKbVGR9HTRsNwMwJId4X98uvu2PWX2QC?=
 =?us-ascii?Q?ATOQjFgaZ/iND61eYKsjGttpqg7XLYuk1pAFfK6hnPbkKXMIgEH57IqntuE4?=
 =?us-ascii?Q?IsDhqMZxOLrHH54nLrqpYm6qAzxCD5yxDvQMCMtNTSfTAvcs9pAUfMQtx/je?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0add7ee-7948-4fec-5857-08db500d130a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:42:09.0994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65WKmbX+orrPLHmnXVrPB2h5RNIQeMVnMmOH4REqKqkDwxDk/RJnlg53OJ5fyti9mpR/4bJD8WWfx/0WpeLD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/31] drm/xe/guc: Use doorbells for
 submission if possible
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
Cc: intel-xe@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 05:17:07PM -0700, Matthew Brost wrote:
> We have 256 doorbells (on most platforms) that we can allocate to bypass
> using the H2G channel for submission. This will avoid contention on the
> CT mutex.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c              |   6 +
>  drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 295 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_trace.h            |   5 +
>  7 files changed, 315 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 37e0ac550931..11b117293a62 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -109,6 +109,7 @@ struct guc_doorbell_info {
>  
>  #define DIST_DBS_POPULATED			XE_REG(0xd08)
>  #define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
> +#define	  DOORBELLS_PER_SQIDI_SHIFT		16
>  #define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
>  
>  #define GUC_BCS_RCS_IER				XE_REG(0xC550)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 89d20faced19..0c87f78a868b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -297,6 +297,12 @@ int xe_guc_init(struct xe_guc *guc)
>   */
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
> +	int ret;
> +
> +	ret = xe_guc_submit_init_post_hwconfig(guc);
> +	if (ret)
> +		return ret;
> +
>  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> index 5d83132034a6..420b7f53e649 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> @@ -12,6 +12,7 @@
>  #include <drm/gpu_scheduler.h>
>  
>  struct dma_fence;
> +struct xe_bo;
>  struct xe_engine;
>  
>  /**
> @@ -37,6 +38,10 @@ struct xe_guc_engine {
>  	struct work_struct fini_async;
>  	/** @resume_time: time of last resume */
>  	u64 resume_time;
> +	/** @doorbell_bo: BO for memory doorbell */
> +	struct xe_bo *doorbell_bo;
> +	/** @doorbell_offset: MMIO doorbell offset */
> +	u32 doorbell_offset;
>  	/** @state: GuC specific state for this xe_engine */
>  	atomic_t state;
>  	/** @wqi_head: work queue item tail */
> @@ -45,6 +50,8 @@ struct xe_guc_engine {
>  	u32 wqi_tail;
>  	/** @id: GuC id for this xe_engine */
>  	u16 id;
> +	/** @doorbell_id: doorbell id */
> +	u16 doorbell_id;
>  	/** @suspend_wait: wait queue used to wait on pending suspends */
>  	wait_queue_head_t suspend_wait;
>  	/** @suspend_pending: a suspend of the engine is pending */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0a41f5d04f6d..1b6f36b04cd1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,7 +13,10 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
>  #include "regs/xe_lrc_layout.h"
> +
> +#include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -26,12 +29,22 @@
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> +#include "xe_mmio.h"
>  #include "xe_mocs.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> +#define HAS_GUC_MMIO_DB(xe) (IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1250)
> +#define HAS_GUC_DIST_DB(xe) \
> +	(GRAPHICS_VERx100(xe) >= 1200 && !HAS_GUC_MMIO_DB(xe))
> +
> +#define GUC_NUM_HW_DOORBELLS 256
> +
> +#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
> +#define GUC_MMIO_DB_BAR_SIZE SZ_4M
> +
>  static struct xe_gt *
>  guc_to_gt(struct xe_guc *guc)
>  {
> @@ -63,6 +76,7 @@ engine_to_guc(struct xe_engine *e)
>  #define ENGINE_STATE_SUSPENDED		(1 << 5)
>  #define ENGINE_STATE_RESET		(1 << 6)
>  #define ENGINE_STATE_KILLED		(1 << 7)
> +#define ENGINE_STATE_DB_REGISTERED	(1 << 8)
>  
>  static bool engine_registered(struct xe_engine *e)
>  {
> @@ -179,6 +193,16 @@ static void set_engine_killed(struct xe_engine *e)
>  	atomic_or(ENGINE_STATE_KILLED, &e->guc->state);
>  }
>  
> +static bool engine_doorbell_registered(struct xe_engine *e)
> +{
> +	return atomic_read(&e->guc->state) & ENGINE_STATE_DB_REGISTERED;
> +}
> +
> +static void set_engine_doorbell_registered(struct xe_engine *e)
> +{
> +	atomic_or(ENGINE_STATE_DB_REGISTERED, &e->guc->state);
> +}
> +
>  static bool engine_killed_or_banned(struct xe_engine *e)
>  {
>  	return engine_killed(e) || engine_banned(e);
> @@ -190,6 +214,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  
>  	xa_destroy(&guc->submission_state.engine_lookup);
>  	ida_destroy(&guc->submission_state.guc_ids);
> +	ida_destroy(&guc->submission_state.doorbell_ids);
>  	bitmap_free(guc->submission_state.guc_ids_bitmap);
>  }
>  
> @@ -230,6 +255,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	mutex_init(&guc->submission_state.lock);
>  	xa_init(&guc->submission_state.engine_lookup);
>  	ida_init(&guc->submission_state.guc_ids);
> +	ida_init(&guc->submission_state.doorbell_ids);
>  
>  	spin_lock_init(&guc->submission_state.suspend.lock);
>  	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
> @@ -243,6 +269,237 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc)
> +{
> +	if (HAS_GUC_DIST_DB(guc_to_xe(guc))) {
> +		u32 distdbreg = xe_mmio_read32(guc_to_gt(guc),
> +					       DIST_DBS_POPULATED.reg);
> +		u32 num_sqidi =
> +			hweight32(distdbreg & SQIDIS_DOORBELL_EXIST_MASK);
> +		u32 doorbells_per_sqidi =
> +			((distdbreg >> DOORBELLS_PER_SQIDI_SHIFT) &
> +			 DOORBELLS_PER_SQIDI_MASK) + 1;
> +
> +		guc->submission_state.num_doorbells =
> +			num_sqidi * doorbells_per_sqidi;
> +	} else {
> +		guc->submission_state.num_doorbells = GUC_NUM_HW_DOORBELLS;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool alloc_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> +	ret = ida_simple_get(&guc->submission_state.doorbell_ids, 0,
> +			     guc->submission_state.num_doorbells, GFP_NOWAIT);
> +	if (ret < 0)
> +		return false;
> +
> +	e->guc->doorbell_id = ret;
> +
> +	return true;
> +}
> +
> +static void release_doorbell_id(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	mutex_lock(&guc->submission_state.lock);
> +	ida_simple_remove(&guc->submission_state.doorbell_ids,
> +			  e->guc->doorbell_id);
> +	mutex_unlock(&guc->submission_state.lock);
> +
> +	e->guc->doorbell_id = GUC_NUM_HW_DOORBELLS;
> +}
> +
> +static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, u16 doorbell_id,
> +			     u64 gpa, u32 gtt_addr)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_ALLOCATE_DOORBELL,
> +		guc_id,
> +		doorbell_id,
> +		lower_32_bits(gpa),
> +		upper_32_bits(gpa),
> +		gtt_addr
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEALLOCATE_DOORBELL,
> +		guc_id
> +	};
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static bool has_doorbell(struct xe_engine *e)
> +{
> +	return e->guc->doorbell_id != GUC_NUM_HW_DOORBELLS;
> +}
> +
> +#define doorbell_read(guc_, e_, field_) ({			\
> +	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
> +	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
> +	xe_map_rd_field(guc_to_xe((guc_)), &_vmap, 0,		\
> +				  struct guc_doorbell_info, field_); \
> +	})
> +#define doorbell_write(guc_, e_, field_, val_) ({		\
> +	struct iosys_map _vmap = (e_)->guc->doorbell_bo->vmap;	\
> +	iosys_map_incr(&_vmap, (e_)->guc->doorbell_offset);	\
> +	xe_map_wr_field(guc_to_xe((guc_)), &_vmap, 0,		\
> +				  struct guc_doorbell_info, field_, val_); \
> +	})
> +
> +static void init_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/* GuC does the initialization with distributed and MMIO doorbells */
> +	if (!HAS_GUC_DIST_DB(xe) && !HAS_GUC_MMIO_DB(xe)) {
> +		doorbell_write(guc, e, db_status, GUC_DOORBELL_ENABLED);
> +		doorbell_write(guc, e, cookie, 0);
> +	}
> +}
> +
> +static void fini_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	if (!HAS_GUC_MMIO_DB(guc_to_xe(guc)) &&
> +	    xe_device_mem_access_ongoing(guc_to_xe(guc)))
> +		doorbell_write(guc, e, db_status, GUC_DOORBELL_DISABLED);
> +}
> +
> +static void destroy_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	if (has_doorbell(e)) {
> +		release_doorbell_id(guc, e);
> +		xe_bo_unpin_map_no_vm(e->guc->doorbell_bo);
> +	}
> +}
> +
> +static void ring_memory_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	u32 cookie;
> +
> +	cookie = doorbell_read(guc, e, cookie);
> +	doorbell_write(guc, e, cookie, cookie + 1 ?: cookie + 2);
> +
> +	XE_WARN_ON(doorbell_read(guc, e, db_status) != GUC_DOORBELL_ENABLED);
> +}
> +
> +#define GUC_MMIO_DOORBELL_RING_ACK	0xACEDBEEF
> +#define GUC_MMIO_DOORBELL_RING_NACK	0xDEADBEEF

Is this a guc abi? should it be in the guc abi files?

I feel that we need someone with deeper guc knowledge on this review
although based on what I followed on the discussion with Faith and others
it looks like a good move in general.

> +static void ring_mmio_doorbell(struct xe_guc *guc, u32 doorbell_offset)
> +{
> +	u32 db_value;
> +
> +	db_value = xe_mmio_read32(guc_to_gt(guc), GUC_MMIO_DB_BAR_OFFSET +
> +				  doorbell_offset);
> +
> +	/*
> +	 * The read from the doorbell page will return ack/nack. We don't remove
> +	 * doorbells from active clients so we don't expect to ever get a nack.
> +	 * XXX: if doorbell is lost, re-acquire it?
> +	 */
> +	XE_WARN_ON(db_value == GUC_MMIO_DOORBELL_RING_NACK);
> +	XE_WARN_ON(db_value != GUC_MMIO_DOORBELL_RING_ACK);
> +}
> +
> +static void ring_doorbell(struct xe_guc *guc, struct xe_engine *e)
> +{
> +	XE_BUG_ON(!has_doorbell(e));
> +
> +	if (HAS_GUC_MMIO_DB(guc_to_xe(guc)))
> +		ring_mmio_doorbell(guc, e->guc->doorbell_offset);
> +	else
> +		ring_memory_doorbell(guc, e);
> +
> +	trace_xe_engine_ring_db(e);
> +}
> +
> +static void register_engine(struct xe_engine *e);
> +
> +static int create_doorbell(struct xe_guc *guc, struct xe_engine *e, bool init)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 gpa;
> +	u32 gtt_addr;
> +	int ret;
> +
> +	XE_BUG_ON(!has_doorbell(e));
> +
> +	if (HAS_GUC_MMIO_DB(xe)) {
> +		e->guc->doorbell_offset = PAGE_SIZE * e->guc->doorbell_id;
> +		gpa = GUC_MMIO_DB_BAR_OFFSET + e->guc->doorbell_offset;
> +		gtt_addr = 0;
> +	} else {
> +		struct xe_bo *bo;
> +
> +		if (!e->guc->doorbell_bo) {
> +			bo = xe_bo_create_pin_map(xe, gt, NULL, PAGE_SIZE,
> +						  ttm_bo_type_kernel,
> +						  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
> +						  XE_BO_CREATE_GGTT_BIT);
> +			if (IS_ERR(bo))
> +				return PTR_ERR(bo);
> +
> +			e->guc->doorbell_bo = bo;
> +		} else {
> +			bo = e->guc->doorbell_bo;
> +		}
> +
> +		init_doorbell(guc, e);
> +		gpa = xe_bo_main_addr(bo, PAGE_SIZE);
> +		gtt_addr = xe_bo_ggtt_addr(bo);
> +	}
> +
> +	if (init && e->flags & ENGINE_FLAG_KERNEL)
> +		return 0;
> +
> +	register_engine(e);
> +	ret = allocate_doorbell(guc, e->guc->id, e->guc->doorbell_id, gpa,
> +				gtt_addr);
> +	if (ret < 0) {
> +		fini_doorbell(guc, e);
> +		return ret;
> +	}
> +
> +	/*
> +	 * In distributed doorbells, guc is returning the cacheline selected
> +	 * by HW as part of the 7bit data from the allocate doorbell command:
> +	 *  bit [22]   - Cacheline allocated
> +	 *  bit [21:16] - Cacheline offset address
> +	 * (bit 21 must be zero, or our assumption of only using half a page is
> +	 * no longer correct).
> +	 */
> +	if (HAS_GUC_DIST_DB(xe)) {
> +		u32 dd_cacheline_info;
> +
> +		XE_WARN_ON(!(ret & BIT(22)));
> +		XE_WARN_ON(ret & BIT(21));
> +
> +		dd_cacheline_info = FIELD_GET(GENMASK(21, 16), ret);
> +		e->guc->doorbell_offset = dd_cacheline_info * cache_line_size();
> +
> +		/* and verify db status was updated correctly by the guc fw */
> +		XE_WARN_ON(doorbell_read(guc, e, db_status) !=
> +			   GUC_DOORBELL_ENABLED);
> +	}
> +
> +	set_engine_doorbell_registered(e);
> +
> +	return 0;
> +}
> +
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_engine *e)
>  {
>  	int ret;
> @@ -623,6 +880,7 @@ static void submit_engine(struct xe_engine *e)
>  	u32 num_g2h = 0;
>  	int len = 0;
>  	bool extra_submit = false;
> +	bool enable = false;
>  
>  	XE_BUG_ON(!engine_registered(e));
>  
> @@ -642,6 +900,7 @@ static void submit_engine(struct xe_engine *e)
>  		num_g2h = 1;
>  		if (xe_engine_is_parallel(e))
>  			extra_submit = true;
> +		enable = true;
>  
>  		e->guc->resume_time = RESUME_PENDING;
>  		set_engine_pending_enable(e);
> @@ -653,7 +912,10 @@ static void submit_engine(struct xe_engine *e)
>  		trace_xe_engine_submit(e);
>  	}
>  
> -	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	if (enable || !engine_doorbell_registered(e))
> +		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
> +	else
> +		ring_doorbell(guc, e);
>  
>  	if (extra_submit) {
>  		len = 0;
> @@ -678,8 +940,17 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_run(job);
>  
>  	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> -		if (!engine_registered(e))
> -			register_engine(e);
> +		if (!engine_registered(e)) {
> +			if (has_doorbell(e)) {
> +				int err = create_doorbell(engine_to_guc(e), e,
> +							  false);
> +
> +				/* Not fatal, but let's warn */
> +				XE_WARN_ON(err);
> +			} else {
> +				register_engine(e);
> +			}
> +		}
>  		if (!lr)	/* Written in IOCTL */
>  			e->ring_ops->emit_job(job);
>  		submit_engine(e);
> @@ -722,6 +993,11 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	MAKE_SCHED_CONTEXT_ACTION(e, DISABLE);
>  	int ret;
>  
> +	if (has_doorbell(e)) {
> +		fini_doorbell(guc, e);
> +		deallocate_doorbell(guc, e->guc->id);
> +	}
> +
>  	set_min_preemption_timeout(guc, e);
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
> @@ -958,6 +1234,7 @@ static void __guc_engine_fini_async(struct work_struct *w)
>  		cancel_work_sync(&ge->lr_tdr);
>  	if (e->flags & ENGINE_FLAG_PERSISTENT)
>  		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> +	destroy_doorbell(guc, e);
>  	release_guc_id(guc, e);
>  	drm_sched_entity_fini(&ge->entity);
>  	drm_sched_fini(&ge->sched);
> @@ -1136,6 +1413,7 @@ static int guc_engine_init(struct xe_engine *e)
>  	struct xe_guc_engine *ge;
>  	long timeout;
>  	int err;
> +	bool create_db = false;
>  
>  	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
>  
> @@ -1177,8 +1455,17 @@ static int guc_engine_init(struct xe_engine *e)
>  	if (guc_read_stopped(guc))
>  		drm_sched_stop(sched, NULL);
>  
> +	create_db = alloc_doorbell_id(guc, e);
> +
>  	mutex_unlock(&guc->submission_state.lock);
>  
> +	if (create_db) {
> +		/* Error isn't fatal as we don't need a doorbell */
> +		err = create_doorbell(guc, e, true);
> +		if (err)
> +			release_doorbell_id(guc, e);
> +	}
> +
>  	switch (e->class) {
>  	case XE_ENGINE_CLASS_RENDER:
>  		sprintf(e->name, "rcs%d", e->guc->id);
> @@ -1302,7 +1589,7 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
>  {
>  	struct drm_gpu_scheduler *sched = &e->guc->sched;
>  
> -	XE_BUG_ON(engine_registered(e));
> +	XE_BUG_ON(engine_registered(e) && !has_doorbell(e));
>  	XE_BUG_ON(engine_banned(e));
>  	XE_BUG_ON(engine_killed(e));
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 8002734d6f24..bada6c02d6aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,7 @@ struct xe_engine;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
> +int xe_guc_submit_init_post_hwconfig(struct xe_guc *guc);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index ac7eec28934d..9ee4d572f4e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -36,10 +36,14 @@ struct xe_guc {
>  		struct xarray engine_lookup;
>  		/** @guc_ids: used to allocate new guc_ids, single-lrc */
>  		struct ida guc_ids;
> +		/** @doorbell_ids: use to allocate new doorbells */
> +		struct ida doorbell_ids;
>  		/** @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
>  		unsigned long *guc_ids_bitmap;
>  		/** @stopped: submissions are stopped */
>  		atomic_t stopped;
> +		/** @num_doorbells: number of doorbels */
> +		int num_doorbells;
>  		/** @lock: protects submission state */
>  		struct mutex lock;
>  		/** @suspend: suspend fence state */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 02861c26e145..38e9d7c6197b 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -149,6 +149,11 @@ DEFINE_EVENT(xe_engine, xe_engine_submit,
>  	     TP_ARGS(e)
>  );
>  
> +DEFINE_EVENT(xe_engine, xe_engine_ring_db,
> +	     TP_PROTO(struct xe_engine *e),
> +	     TP_ARGS(e)
> +);
> +
>  DEFINE_EVENT(xe_engine, xe_engine_scheduling_enable,
>  	     TP_PROTO(struct xe_engine *e),
>  	     TP_ARGS(e)
> -- 
> 2.34.1
> 
