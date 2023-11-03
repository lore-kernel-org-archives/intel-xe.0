Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3013C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB4A10E002;
	Fri,  3 Nov 2023 15:23:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEBF10E002
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025003; x=1730561003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=on19YdUnG0dBXjs7EHnYqdonOUJwFwREMmQsweV0sV4=;
 b=OQLpMuZlIeLJoIgXZN6Cqnqrgxuyq83UrlayUTtHCQUPIiTnpxaVKy6e
 1q4S98jp8tjBOV0gVav3zC5Ma1hBSGKlE7LZYSGB4f2s3VUGCM8OOE+LO
 xUc8nWTq/RalzldkDOM4zfaopLJWWs8ELvlJFTJ7GRQ3lwbzyC1mHpm1j
 NZoEsKf8odUzR4TIEQw1M5/joIn+oSiurbb5CLZPNT6lCwmowl1eCcHaj
 wuV2wA9VT3sSeSUBkmRdtxdgfdqahLfd8D81j+C2goTnDOZNMZLh6qwk2
 bPLgJkNUj26X8KWDMFHcgkvBFdj0AJawNNJQwX4Dk90qNPGarXJKX524X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392846229"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="392846229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9761835"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 08:23:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 08:23:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 08:23:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 08:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqpc8jXAONUEWqibD6+ReSlVUa+VksPuOlxaq4XU1IknfqCIVru4XoSSbAmZcmowYBsgO0Hh4FUpVGw0zuzJ/xPJihBEqZ6tbAAvga7v7Bh/X7eTGJOiPI6qQJLJGKG7y1tmdPR79mL4Cj3pojBhmBRTkkLrRJCgB9+LeO92PMgc7XfLY2amEwpqXBPVTK6WO97R+0fWu61Bbu4xCzta7TIHC6HhExb0YI2c6Pa0vSRi4wYlR8UuSV21uThUjgWaIhjuQEylotjw1EmBaehTjYsgGM/e4X5sMqe9R0Haqq+JP6bzYpqD3QG4IVs0uOZ/r9fObFdWayBEFELfCoSq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfYhybgQrUtHALdzS28Gtxq26H9CCUiW88/GIC1eM2c=;
 b=ofNEqYqWNNo/BOfrcPYEuW5Mko544AC4yNORzb1s+zd9dSsAZkmA4B0pxAUMpYqZtRoMYrPBqTWCTUrf7Jayb/qAG1TWpoZCaTJ6H7qvH3LuTIxTW5ZpSjdZiLyIid0gg8JEZW/QQfL5J/vT5bap1q9ufTneQpehxac5Vf2Edxa/XgNmnPj7Ux/OoRtO5JrfiO0j8eBIH9vlhMyr+IaE3TM1kY1ana6giDquPshiXNMryfVbNMXco1xFyyTN0lKYU8+OMXl9ZGpBCgv/yAdrq0r6XRAUZuDHh/oQezyTuyRI0RF7h5wucA2/4+JtQRIBrxjOMdabjVHl65OUZs9kXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 3 Nov
 2023 15:23:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 15:23:10 +0000
Date: Fri, 3 Nov 2023 15:23:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZUUQWdiJSNjtkfmE@DUT025-TGLU.fm.intel.com>
References: <20231103014309.13927-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103014309.13927-1-brian.welty@intel.com>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 19066642-3d4e-4062-1f97-08dbdc80c9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDovraaT/tpeXAHOg6SywOKZH2iYI1iQ/wDaOYO67fu5f/uEXeZF5vrZGl8g2o3DOR0/QhWZCYbvEPafxSPc/o4M9VvV4YxNxBWxDaosabcW4V96OIRogQubXYuZskzjmGEcUq3bthhQdE4HHbGD++Bmq7uSpTvOJ1mmxsujyfU8HpeIJCFIO/yM+2WX26HUdPHijC5TGU0Xeo3NR+sf5P0sdiF7GOCPInQZFqks55kii4BJXwpURaWUBsM8RLzZCshqIE/c+vrupe+qR0briNcMQVq5fC1lxKlRWoVcSoIpaCneg1LGqqgozacDSSeJbdxgiyzAPx2euJNGSnZJQeoHI2Vz4c2c99nqxgG2qKhD49+LXxEeBFTbwztdGo3VlQpvQYsuhhyCoZJ1i0XiRJsmWFJjujLx2C7u37yxXz8PA/Dz/Dds+yH2SIuxlsrQ1eP/l5agCVKL2Sn26AQg1AC6eDWrulm6IdBkFHLWsHWdwT875vRn8A5nhfUe4gxb2HPX2qRN88GdKTFPZZKqfTcAz8nYLcmccJkguBd14myH2K93jxfOds0dRbh4AhKv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6636002)(83380400001)(316002)(8936002)(66556008)(6862004)(107886003)(6512007)(66946007)(66476007)(86362001)(38100700002)(5660300002)(2906002)(6506007)(44832011)(8676002)(6486002)(6666004)(478600001)(4326008)(41300700001)(26005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?or9O6m1h7nIbG357QWJZcauiYsc2L97urPtlJbjrsn6Lm2t0AbxmwIMq+uMK?=
 =?us-ascii?Q?0eWfNL1XcRpqglxHn0xWW/NS4Cg0NNdaZ3g63ULvBJQOpIfIiuGXi7pu+PzN?=
 =?us-ascii?Q?OKGaa7acUeAH8bWYElfCODXgg0fq1drVTTg3yqunkMCdA6Hn0W8iaN43kClz?=
 =?us-ascii?Q?Ho9LLEHcWldyw4GzjLaSBwHAMGeGruCp5MUZygPENOB3zhQ+dOzvfowgsKz2?=
 =?us-ascii?Q?XD6y5t2ptTiVgEzUiks5HMm3NEVMAhYPxA1JcLu2wvAovQSDmh+gE1sl3UKw?=
 =?us-ascii?Q?v9fJEeDVBjbA81pMTBLa7LLBoezq2oJWBEEQP0MHQT2WfAd6lBaRPpDWV9ic?=
 =?us-ascii?Q?+s1zUWsrChtiSnnQDl2Zbtl7jU4bfV0NnMSPo0Y6uq/2BX0pwRLEXSUzlsXe?=
 =?us-ascii?Q?gWg7fE54NT/N4CkzyuBgaYozGp1QCRlzVzzqMwo20JAOBWehZvMSj2/QDt+G?=
 =?us-ascii?Q?0m7tYwv6Rx8dvFshIiJ9YbdSa7uiyp6LoiWlVdKcrs3jmuD96nRuqKAKh3Ld?=
 =?us-ascii?Q?Q6aIdWAgDk87vfHLef9TubNk0GoEyB/ArI9L0MofoUwapmE1KC0U9q234aok?=
 =?us-ascii?Q?AOKA8FcgicMEh9m6sfvhxsOvEI32Tg85vgxhKFwP3dirdbObxaFhkYuLqLTB?=
 =?us-ascii?Q?5Dp8FgKmSMcageLHU7VhOUiVkDHVXEjhCU0+u522YCO3hf5e76/aCSClip7Y?=
 =?us-ascii?Q?NYzBQM1gf/hCHR3iwB7ZIp+Fn4UNw56I0Au3hwDQ1K1iIAE5XalDmcOrqL2W?=
 =?us-ascii?Q?SKclZcnXIMOabsDPo3+NRQ6mIRYTERdA5SysXysKIQQ5eDIXhQSkSMZHG7pd?=
 =?us-ascii?Q?f6oc9CGeCLLE01dBQ024XUEd4ccvQK9bTDbXiCdbc5Kou/tQoq62869OIuJB?=
 =?us-ascii?Q?+xdajoO07JvQFzD3RO6jy8OSAizFkR/WTS3ReTmff+t9gtju/K4fpIOpidkG?=
 =?us-ascii?Q?iOGnNWLbY48B5LWoPl1z7s5v8r410dhLyHacAFPMJOag1iHdfxtM07V6v+em?=
 =?us-ascii?Q?Aj25Xqmb/fZP7yNFnyle5sKvgplY8AfQ2s32bGwAq6Pgd8aTi4TWVAZ1mtOJ?=
 =?us-ascii?Q?cD/OuuNJVZ2XAQW8R+MOl5VyLzRjNPcNvx0lVOa/OaaJRtIuHmXCzQHvayVa?=
 =?us-ascii?Q?GbRWQkbFC0ZyPGfU4T6bm556vEl+OESc/2poWSxsMC1CWaiUT+hNYQg99n4z?=
 =?us-ascii?Q?uSU7/fsx3zbKpFQBJkIklY0KXNX8fF2m/UpyaLN6uW70o6rfDsZaux8AC9zY?=
 =?us-ascii?Q?Ytg+JE/TFpzk+g8rivibnBIIMsZHNrUNx3VZmZr/WjaRvYZyjLRQdDfl1Y6Q?=
 =?us-ascii?Q?GHZv2qXT2m3o0kCuzrcOTFcVm0Xt2NCbNY8MNfts7Q8sPXEU854PoAWe6fqH?=
 =?us-ascii?Q?isxiN5pb0yOI5pX/JOXwPTWPhCVa/KWnXeEYBY17G6nAaHmLlXhYUSnoR9t7?=
 =?us-ascii?Q?jKx4sxT64WGoGD9BgvtQ0JXl9HEEj9q2GCDPDteLyLV/aD61oShODVF7GYPV?=
 =?us-ascii?Q?fCUzsUaDn5aoVYgPjGJEBZeOUKM45/z3X3gJGExzC7KkShqdd5iNyn45CAFh?=
 =?us-ascii?Q?H++5yHzMvDtJubfs1TRUjRFFUJw4wZP03FuoUsBR9akvsTYCzT856giKfVEj?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19066642-3d4e-4062-1f97-08dbdc80c9ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:23:10.6953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LE7Ol7+QRVNO7b4gUfigo8KLfm2f048BOzh+qzsYsGyQaSrovwZXkfJKEvfLc3ZtSAgcDnCDO2oBgUSdDs5kaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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

On Thu, Nov 02, 2023 at 06:43:09PM -0700, Brian Welty wrote:
> When processing G2H messages for pagefault or access counters, we queue a
> work item and call queue_work(). This fails if the worker thread is already
> queued to run.
> The expectation is that the worker function will do more than process a
> single item and return. It needs to either process all pending items or
> requeue itself if items are pending. But requeuing will add latency and
> potential context switch can occur.
> 
> We don't want to add unnecessary latency and so the worker should process
> as many faults as it can within a reasonable duration of time.
> We also do not want to hog the cpu core, so here we execute in a loop
> and requeue if still running after more than 20 ms.
> This seems reasonable framework and easy to tune this further if needed.
> 
> This resolves issues seen with several igt@xe_exec_fault_mode subtests
> where the GPU will hang when KMD ignores a pending pagefault.
> 
> v2: requeue the worker instead of having an internal processing loop.
> v3: implement hybrid model of v1 and v2
>     now, run for 20 msec before we will requeue if still running
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++------------
>  1 file changed, 46 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ab6daebbd77c..c99af751d1fb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  
>  #define PF_MSG_LEN_DW	4
>  
> -static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> +static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  {
>  	const struct xe_guc_pagefault_desc *desc;
> -	int ret = 0;
> +	bool ret = false;
>  
>  	spin_lock_irq(&pf_queue->lock);
>  	if (pf_queue->head != pf_queue->tail) {
> @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>  
>  		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
>  			PF_QUEUE_NUM_DW;
> -	} else {
> -		ret = -1;
> +		ret = true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
>  
> @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>  
> +#define USM_QUEUE_MAX_RUNTIME_MS	20
> +
>  static void pf_queue_work_func(struct work_struct *w)
>  {
>  	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
> @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct work_struct *w)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc_pagefault_reply reply = {};
>  	struct pagefault pf = {};
> +	unsigned long threshold;
>  	int ret;
>  
> -	ret = get_pagefault(pf_queue, &pf);
> -	if (ret)
> -		return;
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
> -	ret = handle_pagefault(gt, &pf);
> -	if (unlikely(ret)) {
> -		print_pagefault(xe, &pf);
> -		pf.fault_unsuccessful = 1;
> -		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> -	}
> +	while (get_pagefault(pf_queue, &pf)) {
> +		ret = handle_pagefault(gt, &pf);
> +		if (unlikely(ret)) {
> +			print_pagefault(xe, &pf);
> +			pf.fault_unsuccessful = 1;
> +			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> +		}
> +
> +		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> +			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> +			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> +			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> +			FIELD_PREP(PFR_ASID, pf.asid);
>  
> -	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
> -		FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> -		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> -		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> -		FIELD_PREP(PFR_ASID, pf.asid);
> +		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
> +			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
> +			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> +			FIELD_PREP(PFR_PDATA, pf.pdata);
>  
> -	reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
> -		FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
> -		FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> -		FIELD_PREP(PFR_PDATA, pf.pdata);
> +		send_pagefault_reply(&gt->uc.guc, &reply);
>  
> -	send_pagefault_reply(&gt->uc.guc, &reply);
> +		if (time_after(jiffies, threshold)) {

Maybe check if PF queue is empty here too. If empty do not queue the worker.

> +			queue_work(gt->usm.pf_wq, w);
> +			break;
> +		}
> +	}
>  }
>  
>  static void acc_queue_work_func(struct work_struct *w);
> @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  
>  #define ACC_MSG_LEN_DW        4
>  
> -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
> +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>  {
>  	const struct xe_guc_acc_desc *desc;
> -	int ret = 0;
> +	bool ret = false;
>  
>  	spin_lock(&acc_queue->lock);
>  	if (acc_queue->head != acc_queue->tail) {
> @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
>  
>  		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
>  				  ACC_QUEUE_NUM_DW;
> -	} else {
> -		ret = -1;
> +		ret = true;
>  	}
>  	spin_unlock(&acc_queue->lock);
>  
> @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct work_struct *w)
>  	struct xe_gt *gt = acc_queue->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct acc acc = {};
> +	unsigned long threshold;
>  	int ret;
>  
> -	ret = get_acc(acc_queue, &acc);
> -	if (ret)
> -		return;
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
> -	ret = handle_acc(gt, &acc);
> -	if (unlikely(ret)) {
> -		print_acc(xe, &acc);
> -		drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> +	while (get_acc(acc_queue, &acc)) {
> +		ret = handle_acc(gt, &acc);
> +		if (unlikely(ret)) {
> +			print_acc(xe, &acc);
> +			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> +		}
> +
> +		if (time_after(jiffies, threshold)) {
> +			queue_work(gt->usm.acc_wq, w);

Same as above, check for empty.

Matt

> +			break;
> +		}
>  	}
>  }
>  
> -- 
> 2.38.0
> 
