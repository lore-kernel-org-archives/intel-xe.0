Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC4EC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 22:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D073B10EAF1;
	Fri,  3 Nov 2023 22:48:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848E10EAF1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699051685; x=1730587685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jHyJwJRWcXKi9ETWQGO6fPbV9J4aEQb6P47RWErhVeY=;
 b=TvWvUK25wqZuLaey81wsPqGlq/t7Mcb4VEQL6uMbrHlNL9JXvNU0k9ly
 fZCVoG4Zti+ZWigBdLvveljR3oF2c086fKH58inxvo/KoFQ54H+Wt3dzt
 vgR6FjSPK9DYTHofWepN5NrT3MsV21C1J74HQtqrHm4KgIDirN17wMHZU
 gKGxBuO24u77KI1HTzWarhw9xZyt4RZYTWVOapcYIYx0/nboaAOKWyci6
 DCL+AKkcXIavSYCr+Rrs5uKtHVH4XydoDu7iRLI9UQ/QH0U5WMgPBWq66
 fny6LcWAVpbM5oRqzOciqgcYE3RJm1f5kZi0/8J7Shy0/Q4VW0XfEJrZg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388862031"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="388862031"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 15:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796753635"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="796753635"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 15:48:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 15:48:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 15:48:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 15:48:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 15:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP415Gc8E6REwjE6mTHrWSg+/4RhIyB5+CmROCVCnSAZUGsulE93JFI2cgRc98JqmYiJsCNp9AvhXNxzQh/SjQyP2WV1IjFL2Lpnck2NeFaKbOpevOLlJuxdEh6RQ+WCFb3m2ndrDrcqimqUDnhKztfmM8aGU22CSMrUyKGzCyWr5YEZgxZqTcfswhHzxU6BuXhktpPW8ZBEv9R5t0vPDTk/ztWv7kMYI56+/vPqWBPh2i2TTH4opmGcAp0Uazpw7bPnecI8+ozrh1yMTiJidLKUHV2iFQETaJUamUGfTs0jRoG+k2H3PWnoCFuREvZshynyYddkXZKJa2lYPqB4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPSQaVNJdYfwa5veM2KZJ9ZuawHkHWiy7M2sqyJ+bfM=;
 b=fMUraxM/b/dZeic6syJxV7LgzmAnhA2rLjNuBAJSLLZ9/fCklf5kcYxvjTEvIFiR50MBfVro9C1Wu0VJwRz9ppRX1DersJtidqIdWXml+JEnuBDHyhACQnjCX7RMh+KMWn4LDTNgR/Jc0GRECS3gTZxXZYQGLTWPD0sRL57QIOsoRSQGI5RQe5LT6Z062IWzpk3+OTstFmDWdY38UJxwf3oOS+EkSVK7Nzd7nRZcJZccruAouz8HGGyGfjjpprXeEnlymzPRxg+hfpzbTgLPumTjLyY9OPko/QEOa1W8InVXjF1759VklzpJF1djAYXisbsuXSqaO2PuShrT9d+XEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Fri, 3 Nov
 2023 22:47:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 22:47:54 +0000
Date: Fri, 3 Nov 2023 22:47:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZUV4k2mAMSFbkchc@DUT025-TGLU.fm.intel.com>
References: <20231103194638.26445-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103194638.26445-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: e7daf467-564e-47bd-3cb8-08dbdcbeeaab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2ibXUVv/BfaDLgWIkPxUG1G9a8j0HzdeRv8UiGjZsd1fUyT6QMnIPx0981SEwzuFEB9sr4LcU/TTVUpRIxobwxfitFV21kw4Xh+Y0rJ9dmH3HaCnM0d4vDKEnYXBw3BrpN712NUt26XizSKLqiNbXmCuAfU9Rfqf++CmeW2D+zOOr9WYMQwqNNRG2og3Zoj0PWbx6CXyGGm7axCRFGv82dHzc1ekWRLASbrp6ttoKMY0Ec56VABi3sK5aHC9zcoZmQVo0tMUAaX59tLX2ng9JqvOWt7lxCbMWJV1NGRlxrswlZuViwkVbvHS7b/iAAzZUIqUffPRH4CUkmWgptZrEXSXCm6gQ+LAg7q+tTZA5iLJv1iH65jslqn/NN9nksVNL1I/BFKz9QAaTA7DmiiG5KZam/A8rMq6db51Rmnohz/vvrg1y2BxSddnSY7gZqQJqrEQRWhyAfYfxRGVrvqatMG90n7gMaVMchVnkKM5fgzJKK7fE8CiGpZqkUoCI5eveUs3S45P0XF3e4KCYx5F7f11/UmK/8wSLwOHtcqESMWgx7fo9j1Sax4uvkdq6uy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(83380400001)(41300700001)(38100700002)(66476007)(6636002)(316002)(66946007)(66556008)(6512007)(6486002)(6506007)(44832011)(478600001)(26005)(6666004)(4326008)(8936002)(6862004)(8676002)(86362001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2ZuYKUPEc1ynA47viaAEsdQR8qmtnGjimlAGd2AhU9lDTpLvpSj6aOwfJC5?=
 =?us-ascii?Q?u1rc4M2hTuYHnvaPZzmyelNe6a+j2gGh8JjCHk+Cd6Dxg75OkqqlyyLVPhB3?=
 =?us-ascii?Q?tADnfM4/EeEeYSi9NCMLMV3i+cVvOR7Qr1e/ILUN9t7Ab3GO9uJiSyjxqlqL?=
 =?us-ascii?Q?xobdbhuDETUyUofmYDYgJe5laHBBfOtQjgo494FfvhbfAchb2cMvLERWTOlm?=
 =?us-ascii?Q?XxezjHIGD6VsM6W05wQEm/0zoP58ytPdVAvh7HtoID2BpqhQAUZ5frYPlG+n?=
 =?us-ascii?Q?ISREg1MqldY/Cdk7nsvBfxmplhnAwHYjwQiUr+ZPRUU1r37zQvt/wUW+tdU6?=
 =?us-ascii?Q?ADBAYOFIqNM//AePstDJQg3cgHxG1F71RX86sZZqEoyD0Dgk4yhBKs7+dXU3?=
 =?us-ascii?Q?uNSBlxUWd+v11Gcff0zFLvXz4FOWSPPV4Sf27IrkL2nJwan8Wr1V5OGZOHq2?=
 =?us-ascii?Q?J9qYcXCbg0kAA5LmoVfAie/kl3wrWTj0GsZ3WWDHQJVoOl47RfRMfmsgf6xL?=
 =?us-ascii?Q?sfZTIRavKlDljVbMQTBAy/aqYaiuOnt18hR87B49Rvpi+2WZ9nDwDE2ettXZ?=
 =?us-ascii?Q?amuUxOSf2Ms2FnNrOQ7wjwa2Rzc+8rSJP8s+uQ2BWbaXYrBeGekg48dOvQao?=
 =?us-ascii?Q?ora8wjoY7UwI8/iXil7MWjabAsW7A+OsSC0blrcLdOJQWuVo2mQ8QDQyvowe?=
 =?us-ascii?Q?FeUyTyn/8W/rzooOmhZvjRmhqiTTYsvfxwsaMXWozkXjS+cC6kWjdnWa8oQn?=
 =?us-ascii?Q?r9QGYB+h26+/JaKdJpeTzB2le5c4pbpXL2nUaaPrnsU+tCi/b1gxZVgyIXhW?=
 =?us-ascii?Q?ygFrkH9CTmZty56uqjnCz/jFDr9cBNmL62eTUK1poaxVT4jPb7m3I9jdzQrs?=
 =?us-ascii?Q?M7LM5Ck/sl9YTSOcD5Mw0YfeYHeJnya1+GLgP1FqbzOSKlcV8CgXVH7D2S61?=
 =?us-ascii?Q?L1slUbv2v3GuLZ9hgGfFTRHg8kuDBeZSD0auUfGJEUVoGO6fkeYXMVFRu9J2?=
 =?us-ascii?Q?0Ugs4Gn66PaOgs8AYkKG69ABY1ke/SLufqY111l2pg/zhjtWbUhXkh49Ttc1?=
 =?us-ascii?Q?SoKC32TJlW1GHpegz5vGHMgrtjFqdnHCoBmBhBw+ODji5TV65YFfnGfvCX0A?=
 =?us-ascii?Q?Rwo5hR0RR+UAzkHnXCZPs9mPaLqDcng5NXLkDGKap2LCOQwUTZmUVprvQLgK?=
 =?us-ascii?Q?/vFOiJNsoVG1IWmD07A63KDz+kAoT9BYNyHOPCeNjE9NOHxFNmDArt3/uPfl?=
 =?us-ascii?Q?hCpNl+2kIUrjwy2VfKTqA945bN08r5YkTrIVghqXODE1EMlky08U3DEV3q9F?=
 =?us-ascii?Q?CiOX/2SvVgU4oEsAhkFa6BzdKAO2c9aCabsundyAb4GbkomixCJsvRHUPcZL?=
 =?us-ascii?Q?/WlVAhBZrbTw2KWj2Rp29mN21gGd3msCNI2t989O2svhJ9I8O46xjZHbaMQP?=
 =?us-ascii?Q?JUGQWTbK6d23GPJoLz0VJ2y+1M1lbMjosYdfCIkMxiLxfgSuqnVDvuwlvR6f?=
 =?us-ascii?Q?GDcp1VqT5VnokYGIuX4I2+EykXF0X2Q8pXzwlKU6OhVgUmtdKYn/gzAYxa9T?=
 =?us-ascii?Q?GyUuwDB1CeYmjqIUVhJoirHr8URuExkPJmwUpq5JV1EWBYqfGcV4aNHi97XK?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7daf467-564e-47bd-3cb8-08dbdcbeeaab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 22:47:54.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCCBVv5qS/JD4ZOp/j00t/wNnBbM2JBJJv0Yt1x0iUx6b3BkqCI4w10yBvcGZJcKG6Odzbe1dUOhkxoC+58uEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: Fix pagefault and access counter
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

On Fri, Nov 03, 2023 at 12:46:38PM -0700, Brian Welty wrote:
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
> This seems reasonable framework and easy to tune this futher if needed.
> 
> This resolves issues seen with several igt@xe_exec_fault_mode subtests
> where the GPU will hang when KMD ignores a pending pagefault.
> 
> v2: requeue the worker instead of having an internal processing loop.
> v3: implement hybrid model of v1 and v2
>     now, run for 20 msec before we will requeue if still running
> v4: only requeue in worker if queue is non-empty (Matt B)
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

With CI results:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 82 ++++++++++++++++------------
>  1 file changed, 48 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ab6daebbd77c..5b3585e2c125 100644
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
> @@ -355,31 +356,38 @@ static void pf_queue_work_func(struct work_struct *w)
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
> +		if (time_after(jiffies, threshold) &&
> +		    pf_queue->head != pf_queue->tail) {
> +			queue_work(gt->usm.pf_wq, w);
> +			break;
> +		}
> +	}
>  }
>  
>  static void acc_queue_work_func(struct work_struct *w);
> @@ -544,10 +552,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
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
> @@ -567,8 +575,7 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
>  
>  		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
>  				  ACC_QUEUE_NUM_DW;
> -	} else {
> -		ret = -1;
> +		ret = true;
>  	}
>  	spin_unlock(&acc_queue->lock);
>  
> @@ -581,16 +588,23 @@ static void acc_queue_work_func(struct work_struct *w)
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
> +		if (time_after(jiffies, threshold) &&
> +		    acc_queue->head != acc_queue->tail) {
> +			queue_work(gt->usm.acc_wq, w);
> +			break;
> +		}
>  	}
>  }
>  
> -- 
> 2.38.0
> 
