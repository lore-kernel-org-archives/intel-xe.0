Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A057CC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 16:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A14F89208;
	Thu, 16 Mar 2023 16:10:52 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0EC10E0E5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678983051; x=1710519051;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eoVCijyPtIhgMNMGGYfMG9WbR0RLEtLwSV6ovPTyrzk=;
 b=CuGbcsDvjzjrBv604DpUK1S+wJX7BWGbBTpZitDzrTUNq8DDRBPe3Jhn
 rKZ+BknE2THyxq21jq+V/oD78xm1w1Hv3/yZs7IPnHE+Mu32z+PZtxn2J
 6HF1YjL0MuHkfXTcZL2Sm6V5zJxsSC12dEK6fWAhKiABD4KjKBBikwlf0
 4OxbPDpT8cQ++MsMaF3K+S8ult9hgBCSEuPXTy4k9NdG9paG4e897chX9
 YwouM/qTE4aVR33QD5faBzu4GjMkpaV9+Lb5TiuSwi3YoKNI2R8TdSIe9
 cd2NPdbUqNia7beSl0rA1UQoRmmzJv9wYDPhLrwMxd1ASGP9tQvrm7Rkm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400628028"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="400628028"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 09:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769013670"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="769013670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 09:10:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 09:10:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 09:10:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 09:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKLj2AiougZChffUbnhMmypXy4Yw32gHei6Ir0AWt/t1V80fd0JToNoWTXa3z794UG/7ThJYuO4RDnyee9tl18fOl98gPoAc4CHZ30JqBQAOTRQ/EoGc38erH02FcPOgB+7nJCT/JMcseVcopUY4RIZVzRkFa5WI6ZcRVH9hIgSlitn6mBpcQqa1lMsEZdJfMU9KSS7QX9dTtisKWQwT64VblnOlZkKUPVGSLQXPQsgGsACEri4vSv8R6fxhs58wwkwGw0URGDR4sl96Pap/4A0YuDY4Io+2u/HSN0P/UdvfFrRDA/6YfuR69waisuXugAFmjhI2ubnLvv5KSjS+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlv7lAprxRkXUQ+P9jFOYSqQ5CZ6nl/8eU1o2bSod9U=;
 b=HKoBpQIB/qfGLuY0K/qQJyfxv/+AQ6svwxSYP92k1ZzHp4KNRYmoIw0/ezHQrvNQ6GKDG8RoKpESh8yOiSrqxWj+DSloSVE5jEhBFjOLZuvSUZ0culaoAazDYWfQs2lvLlbRxEqX/nKq5gaKiiu1G9tL7PMbkui3uitLHe/90DIpCgtC6K/A8FANyprcq6EEoc5eSIz17YAdjuOUAbOlo4H2CIaQA39hWkB6+F2K+tk8drXut29eqLHVYbB/4jYLuKB6xxRDW75Zqp6FxrhqqrPQW4TDLZACxPmpD8KEDijhxVoYXVOUZBCTZtVKx2gHG2Ak4mpuvPzhbo3HygXyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 16:10:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Thu, 16 Mar 2023
 16:10:06 +0000
Date: Thu, 16 Mar 2023 16:09:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBM/O1K/IHXwdziO@DUT025-TGLU.fm.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
 <20230315155507.43933-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315155507.43933-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e77db9-0565-4b52-9fde-08db2638e863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJZ55NcUIspQ+qoz14YAkOD1AnRtdoLFi6Ezjs9oe1k/OPQp8RQHPA+uIF54i9chj33BEE0mZdy62x70zE2/IkOqS4vP+qRIVzIFPXMt1cgYr8C+6C5bBxCvdysg996uJ+XEOgRO+rue9zqwHU5QLBV6ydrtbvsbs5tJGg/i5MPVnwzFOdyFcAL2KZUuI+Enu731y6V18MH7OorwJQe38mR51JoiEiYgaEort89yg8lNlkTve208iK4IjNa/GhfX0rX9H2tugAiASPKptf42NbaBZCUPl9bq2jHozQ+tBSyJz0deXnBj8M9CwQ9VZizf+II0yG2bD4GddG1qlOzDIRBzplnz90K+HZiJ7vOpMAXzUvyO02IfdbXqvlQun+KBq4/jTWpteJ5Ur28q1RFkHAnC+7H2/J7ZUgkEpGTgHYXqBshH5cK4DeikKZcIPPK8HcGy4Ez+ty3k3xrP8lE+r5MIOsFRiG0w8b0cmpyNpq/6mIbv4WP1X92Bk2sgRXfBnW+gwgGeLwmmuO1+5aIcZ8HyPSgxfBR9FKyyN1Zt77TRFoTgzJfPeV1RaEMCL1invGixBFwulQDJCHGkM3AnviRAz9BHOHMk0J3PTC72+xzaJhHrpvE2DrC6yl/ojkEaajv+8TPWzyAmfYuW7uOl4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199018)(38100700002)(41300700001)(5660300002)(8936002)(2906002)(44832011)(82960400001)(86362001)(6486002)(66946007)(66476007)(66556008)(8676002)(478600001)(6916009)(6666004)(4326008)(316002)(186003)(26005)(83380400001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lIMJM54X1As6aBs3zujSPN1MauvUxSOHJK/6mfqaE3PDVbmUYwDKfF5acm?=
 =?iso-8859-1?Q?MJbpXhBgi5DoLLL1lQdsuVQAfFTaShOaNZNYFztOK6BYJSn9TQL4pZhfkj?=
 =?iso-8859-1?Q?PB6vwntkHbweUAbUHwlUT7DkgEMEf/H4uUGtmZ8I6p/JstZuDlr3jEvid+?=
 =?iso-8859-1?Q?Njt1QE6iuZEv5sw95N7h6JQwd4uj7gSkzA2L05wBNLfFg87E2k50d3iuYP?=
 =?iso-8859-1?Q?d5zqAzvi6SLlaYnqki8mLxO7vSzfqem77qt24qZZmAEKpCKBlqpAVZ7sBf?=
 =?iso-8859-1?Q?Owlq2zIxPZUufIPhog9XUtmuebMeG2wLyJ4nssR+a55QomeHOK3XRNibS3?=
 =?iso-8859-1?Q?wgvXZGhPW8fFtq4pUZtw77pvrwdmHdLSYsKjF58UbJ+f6KOuUss/iTQ5cy?=
 =?iso-8859-1?Q?jYXByk7BZaYepMVUPnWZfBrMN69tkKTEzIv/qpdAbaz7PJdtih2CgPixdJ?=
 =?iso-8859-1?Q?fG0HICY740bEA+FGpElfkzuZ0fLuwnXFI+M+NZ08hhb/qrdIjEjc56JUu6?=
 =?iso-8859-1?Q?UimbUi9oSIm4KTkVSpOnCZtXTEjlODDZzFxDKY1KVKkLaIaZZO+JRg202C?=
 =?iso-8859-1?Q?c6NiRRgRz9ANWd6JQ+J45mwuEH7/mQb2QU5RUtRMfSi0xElsZccB/ZGKZh?=
 =?iso-8859-1?Q?Uj3CXj1BnxJ1q7vvQOWER4XED5E5coiyVC+u8pxEYFl5dVTm4UUmwpPlel?=
 =?iso-8859-1?Q?xuAlHPOUIlKATQeiZE6aINr/9NpjHmty5JdA47mAC+Vccchl5Dv2Knqmxx?=
 =?iso-8859-1?Q?bU4xlhjJTwWc7GTJdmikJ3P4r3rnJmdXYZ0Qbo7lbem9U1ZCrHyuesxY1n?=
 =?iso-8859-1?Q?qg3zduhODR2Y2H5KmEvrvSnDF5rjgH/G6mT23Bb5ZpSnwMcEzTbwU0HbAv?=
 =?iso-8859-1?Q?idfdyW9+fnMUuKdiS2stjt6hOj+JZZJ5pnsREwA1n3xI0sYORK6LuUzHUd?=
 =?iso-8859-1?Q?k0SRM6JhkLJBGzP780bEIyMRntztQVUsEGAYyldG/a9zjWp6Mr5yevfxgq?=
 =?iso-8859-1?Q?Dn27Ngzu+AJDuzN5XTlOih8bEogt3G3IROFzPBp8YoXc/ldT0nbfLOwBZ/?=
 =?iso-8859-1?Q?fcQo0DPCk1/vUPTzQW49RaHBVCFclamzJu3ro9hogZ9dHb0WKShOuf7H+M?=
 =?iso-8859-1?Q?6pSM0cOHc7pPGprWIHDw+p0Q2as3xT5QsUqagwKZJhXo2DPPcfTXmFdERR?=
 =?iso-8859-1?Q?i3M8nxZHm3RRlyVRd5fqYj6JEtZQi0XwTsJy9pefm2tzskh+kzV2b8arHh?=
 =?iso-8859-1?Q?OiKI/ZOOHgAXwNReMdrxMi2NlrWgpyjk9YAD8BkMKsdEzw2HJwozFRjqKN?=
 =?iso-8859-1?Q?1i1TilLJGGtmGcaL057r91KjrzaKDAuFLga5YH8/HBv+uswZWVaPkSkLyf?=
 =?iso-8859-1?Q?3SCmQvmwo0LNtnLX4k0TbLsWyx+jIrURhZS9vuW19WF6znb5p+gnujXGBp?=
 =?iso-8859-1?Q?qnHl0rft22yZTXWgNMMN8AT7KwP1mEAjy69/acwdxGCshS0HqhMK4clMCS?=
 =?iso-8859-1?Q?4sosVMRStie0fBoOAau+iGvE51wpCXDsXCfYmByGCs0LKhl8uanl6dp5Fi?=
 =?iso-8859-1?Q?GcpbiZlBtSm5+3Lx/jKrKb1xW/I+YXl1x230AbCtMd5wpXT5KcEuinhyHs?=
 =?iso-8859-1?Q?nfj8bRcx76nJmYXrIEAmIr7I3uB+ibVl6Yj6PEHwW+LXqlL8XIMgUE/A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e77db9-0565-4b52-9fde-08db2638e863
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:10:06.8812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBHRByu/qvRGlo8n/OQKqsQ5xXflpphphnyDVVofpWLXOkuwQYSD2cYe9mmXrNiQavZdXXfoBKElBxx7iS5+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/7] drm/xe: Use a define to set initial
 seqno for fences
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 04:55:01PM +0100, Thomas Hellström wrote:
> Also for HW fences, write the initial seqno - 1 to the HW completed
> seqno to initialize.
> 
> v2:
> - Use __dma_fence_is_later() to compare hw fence seqnos. (Matthew Auld)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_engine.c   | 5 +++--
>  drivers/gpu/drm/xe/xe_hw_fence.c | 4 ++--
>  drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
>  drivers/gpu/drm/xe/xe_lrc.c      | 3 +++
>  4 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 3b6f8a25112a..7e6367a84f1f 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -13,6 +13,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_migrate.h"
> @@ -57,11 +58,11 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  
>  	if (xe_engine_is_parallel(e)) {
>  		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> -		e->parallel.composite_fence_seqno = 1;
> +		e->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
>  	}
>  	if (e->flags & ENGINE_FLAG_VM) {
>  		e->bind.fence_ctx = dma_fence_context_alloc(1);
> -		e->bind.fence_seqno = 1;
> +		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>  	}
>  
>  	for (i = 0; i < width; ++i) {
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index e56ca2867545..ffe1a3992ef5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -129,7 +129,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>  	ctx->gt = gt;
>  	ctx->irq = irq;
>  	ctx->dma_fence_ctx = dma_fence_context_alloc(1);
> -	ctx->next_seqno = 1;
> +	ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
>  	sprintf(ctx->name, "%s", name);
>  }
>  
> @@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
>  	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
>  
>  	return dma_fence->error ||
> -		(s32)fence->dma.seqno <= (s32)seqno;
> +		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
>  }
>  
>  static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> index 07f202db6526..523c2611ef5d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> @@ -8,6 +8,8 @@
>  
>  #include "xe_hw_fence_types.h"
>  
> +#define XE_FENCE_INITIAL_SEQNO 1
> +
>  int xe_hw_fence_module_init(void);
>  void xe_hw_fence_module_exit(void);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9140b057a5ba..fb8c6f7d6528 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -697,6 +697,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	map = __xe_lrc_seqno_map(lrc);
> +	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> +
>  	return 0;
>  
>  err_lrc_finish:
> -- 
> 2.39.2
> 
