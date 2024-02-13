Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536AAC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0081A10E0EC;
	Tue, 13 Feb 2024 15:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCCCvBPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7246810E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707837405; x=1739373405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ozlpFBU/GFzDadYpna6V9ynPEUc7UKnHHkmUQrD+qgk=;
 b=kCCCvBPwHfnFSuUN8BPGuH0iNN7k+SrauLqSdTD75QrguZqNFtN6nh46
 c8BbjTtr3jCkDX26FJMlKvf7OVB4qtTKc+YLEZDOqGlFXJhzQYZZyAwl+
 EmL6tt5BFE9U7Fjgkn5eHlSuXcwQB6BSnAkCZGYcsZmPbhOXdDukm89ZX
 m9pNFwCRzE086Pt6DZ0lMrWQKH17y5705GwWIKPk7pbxS7Cx/YL63r9H6
 A5rFtL9Oa36l6lAliZGa/7LfzF0p2xWPxoWo+mW2i4Eu8F2DAg0LM7jaw
 GL5/txIDp2b2L5/r15YNtQTDfDpjRrEzfLSN2Q9bXc9G7MOYkdTRx+91o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1986245"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1986245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7555982"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 07:16:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:16:43 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:16:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 07:16:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 07:16:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgrExbtm1VYovGz5Iz4BKs3Y6xUdgxa0O7QvlX02+InVnR6znquAjKHcgFzCGxGyQOKMzVeR559smIHQcOY5H6HVG6X8Hqpa1IxV01LFZi08wfkNN6fqy6rBAMGoDSuyb91mx6U0IWbRz8/4RVI5wDl5eTswrMC0IPmfw+fmActiEUPbWMJEOVP5WP8ru+7Npq+0JB5jGUnUDPsfZsLkGLuBBFQn5YTeWpa2xz0OfjDg1d4zOi2xslNXDbd2L+l3oB+llIvVHu9GDP/aeBDz+zcJzbSl+5zFbkyUhm8tlSkaB0iOZ6y4uOEGuzsT+LFPQIf8gASSIFJSRbLIr+J40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHX3DspzkB3JO5Sin8t5aMzWTrFQS80Kr7qejju2c1s=;
 b=PxM2xTSFmrs0WisELBemRF/fialjyKigoIHgavJlGmquvJYo1SS7L6dBc5U1yO/5qH9QLGdWhqo5MLDPviigUptfM+ceDnj+dN1M/o+RBVqzSO+HI5oEXbRDEC4f1fucch5JT3lf8N41rGcTX2VM4McUGem1LhHEQ7gKrW+47284wXrObkSZxGDZl3k1PBXsmN/HcAoiv55Ol8KQrtsETvU5ziS8lympNAHn2J+X4uvR7RK1jDB/u3BpHrRbpcp+scj6Ys/sXlQD6ImtdaoY5yZrM2UovrjUSj3FHxgT8O1K1DqY0yKnXtlftA8KdYdAmykPbebKXNkO2cQmwHYaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 15:16:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:16:41 +0000
Date: Tue, 13 Feb 2024 10:16:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove exec queue bind.fence_*
Message-ID: <ZcuH1V4YYtpAkcHH@intel.com>
References: <20240213043251.3482928-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213043251.3482928-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: a212d500-65d6-455e-ee11-08dc2ca6c7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV3LDUYtlGB3AGvrjBAHU+A3ECS4tDxo/xyhfREPL9w3ppxihbOG3e19YDu5SpWS1B9r2tYqNLWac4STYEpsMMTDKyWNeP0K9m24wEvQLstHQqEQ8XeUscwO2Vhb50D1Ask5OCdmUybd1bOuSOHztTDPMrCFlfG/p7/Ajh6bCJQeg1twaeQZa7agn7U8PjdfpJ8+u2qf5b23U2a+cfg4/Br9GxrNuO2oBhk02A6rkpUYWrUOhOGCwjTKZCtMZQJ/D7dzbneARWCmsaLqQhnTv4f5qhex+jmS7F9uVsr6TEs8hAabZSiT7CjylkXROxoQNjP3oYFp/RYvpd34LRQ9PtDj47uG7Cl7YqcCyURvhc75FSYPyFhgzVvfs1tn7kVFZNivI6xC1uKf/s7Dqwka4yCytnKa/DWqGIn1c6vNWIbcwOKnVBBZD7YCCf9d1dvM3fVnmtSGrogmEZy3BLY/d23Gt4SFdcnsHnANmLQwstFzia6dHhIS58PXkJh+v0haolfFY+3ephbLBBl4OaVOQPOhnqL55Q3dvalLJuLQGNGn/W1MUWBL1lYyggelwEj5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(86362001)(66476007)(6636002)(66556008)(316002)(2616005)(66946007)(37006003)(6666004)(6506007)(6512007)(6486002)(478600001)(44832011)(5660300002)(2906002)(38100700002)(8676002)(6862004)(4326008)(26005)(8936002)(36756003)(41300700001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCmC12yc1dj8JVlsiRla36TRqZZM7QBWjd0RMk0RAmGQh+V5lMTEO1M821q6?=
 =?us-ascii?Q?OeX8jn7ZX6Kz04wC5FhMhSppW/z//eMpsfQw/x86H00L0kPny6h+WAmRs0cN?=
 =?us-ascii?Q?7wYMgQU3Cl56pHCByKiUMR7ZXJuGs9z9xCSJiDE4A18Y1WvigM/t8V02LKfJ?=
 =?us-ascii?Q?4q9qkb1BcNvTUokyyRIVtBpdD1fOtACvaRapxLNsKDNOuEcyiWXVi3ilJ0T3?=
 =?us-ascii?Q?lNjkNzFNg7vB882AEvvnPUuEdv8HdElaJ6xsI134mE8Nmp+xugzfNbE5+mp1?=
 =?us-ascii?Q?OeMH2qhJYOsVLiAwdTyrEmqXcf7nhG1qnKXAR+Zkvi3pyMejai3/jiYbnowS?=
 =?us-ascii?Q?TNT/BiF++aRqaGA5ywKgLC+9Tj9201TqIgvaw5O9eQtzHegSq0ct0mzX3gGm?=
 =?us-ascii?Q?NDuE36RWWeC+Z+Yvnr7+pFl2pVcQVofupEw7h0IW3Q2FhM/F7SHiuslMqS+T?=
 =?us-ascii?Q?2VQhCAF1gYvfx+e5wgrNLhJo8AuqX4w7j0no63Sc+4f05KV1FdmG+fccumCn?=
 =?us-ascii?Q?0Yi5NtCGl9ZS/y15Qkco18W72PEaAhUufB6FYw24PH9NPT9UTDJtn4es0v+s?=
 =?us-ascii?Q?6x0S+QWEH1gDAG5utfXB4ufsFyPQMiIlEPvMxSbrfRraJ/VzhHGnemZkcg8j?=
 =?us-ascii?Q?ue7srLLgAMN3s3bsyX8P2m6ZUMM+gDY4nWQl0ZzSKvKyOSw+OGb20b2qKzgu?=
 =?us-ascii?Q?oYU8iMwUWqsp50fjyY11aEsYaLiXu/RJIFAP1EnALuimZv3SkGleIkH1W+9e?=
 =?us-ascii?Q?idWUWWclzeyabVcydZWdH+JpmgEGnLJzdrasPRfV6A+AyYx+KNhsayBsyhrq?=
 =?us-ascii?Q?RzUafr2VfVXWla30N6rcbDBoLJoBP6fulWjpTFL3Rs1l6SToX+3/M3YKG79I?=
 =?us-ascii?Q?kIXfSi3flSY7lrVNJfyPq+P3itgF8OlJV8+ohGpMESwFGNOVgyul1G/P0I7r?=
 =?us-ascii?Q?KEsEr/SLEWfStvHCyx34/UIn5IgLyVfPRnaZn/vFD8t4dNaeT0aH54SnJvzd?=
 =?us-ascii?Q?OF4X7/PTES4GkRKRjqUEwUTkqArHq0OdkKUUph1yIeTPZBAbUanaRBr81qiY?=
 =?us-ascii?Q?VDOfBe6LylHmeqMP9BDMLFkfBuLUWh2PYL63pQQPQFdSI2r0TVKMek5a92HD?=
 =?us-ascii?Q?Nj7R9jvERWtG2ibRmGcNz+pSXGOu/7MEKStl6G0xJiyEKHAsUzBxu5aJTBwO?=
 =?us-ascii?Q?hqRU+uRkvCZ0mUPIpp4JXpWB7LgtvyCJBgO3yuLrxTv707lgVdy0NFq9zSP6?=
 =?us-ascii?Q?2dCm9wHvMlAtORxjir5MZpP3PSAviw9PZI4SP7LqQ3XYqDORnErJE4yAmOtL?=
 =?us-ascii?Q?VXOJdMhgH+isZi/5SiT3+EmZSHankG+4El+0kViey3xB4iC/FcjCYgSLY6m6?=
 =?us-ascii?Q?NXu4Uq4hrCl10W+wAtxif+Zs9JahC13f18TPd8vl4kKSYX84pDaJAzpjUMEV?=
 =?us-ascii?Q?4NdQL6Tw01ErbgdCnIIJBs5Y+JNXkchiPfQr1xCP++l1snniGHKGmDcGdaXR?=
 =?us-ascii?Q?tJybG26E1u2ZOrgQ3ULjSFt7TuRw5PBT3wbkkvxk9P+tmz5ywyCBArrXwZbs?=
 =?us-ascii?Q?3nNn3kUe7cEUbGjL2PEvydfIngo9yiXXJisQcEiM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a212d500-65d6-455e-ee11-08dc2ca6c7fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:16:41.3465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIQLNOE1lKwZ8rFEaX7mfjBvgADakp1VGM9LmAJ7Kv4AS70y37+A6ACo5GZ96fV1J6DWhlG7QHAnCNsY2WJEOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
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

On Mon, Feb 12, 2024 at 08:32:51PM -0800, Matthew Brost wrote:
> struct xe_exec_queue bind.fence_* members are unused. Remove these.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

trusting more your compiler then my greps:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  4 ----
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 29 ++++++++----------------
>  2 files changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2976635be4d3..da84ac93a559 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -94,10 +94,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>  		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
>  	}
> -	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> -		q->bind.fence_ctx = dma_fence_context_alloc(1);
> -		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
> -	}
>  
>  	return q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 648391961fc4..3df8571e4a07 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -115,26 +115,15 @@ struct xe_exec_queue {
>  		struct list_head link;
>  	} persistent;
>  
> -	union {
> -		/**
> -		 * @parallel: parallel submission state
> -		 */
> -		struct {
> -			/** @parallel.composite_fence_ctx: context composite fence */
> -			u64 composite_fence_ctx;
> -			/** @parallel.composite_fence_seqno: seqno for composite fence */
> -			u32 composite_fence_seqno;
> -		} parallel;
> -		/**
> -		 * @bind: bind submission state
> -		 */
> -		struct {
> -			/** @bind.fence_ctx: context bind fence */
> -			u64 fence_ctx;
> -			/** @bind.fence_seqno: seqno for bind fence */
> -			u32 fence_seqno;
> -		} bind;
> -	};
> +	/**
> +	 * @parallel: parallel submission state
> +	 */
> +	struct {
> +		/** @parallel.composite_fence_ctx: context composite fence */
> +		u64 composite_fence_ctx;
> +		/** @parallel.composite_fence_seqno: seqno for composite fence */
> +		u32 composite_fence_seqno;
> +	} parallel;
>  
>  	/** @sched_props: scheduling properties */
>  	struct {
> -- 
> 2.34.1
> 
