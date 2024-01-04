Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D451C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 16:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61DB10E4D7;
	Thu,  4 Jan 2024 16:55:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ED310E4D7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704387350; x=1735923350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=heNF9JQOo1y1VzB4ZqWpYxAaGCOlpx7oyOsIEWm+3NM=;
 b=E7/CUco/7e6C9CsF06tC3jztjJ8kvR+c7RzgcQN9bFkWwxfc6Vdpdo5w
 kD50xjhEvc8bSWTLTYSEjH0zipoo9UixsBkwzTp/o/TpXG8l3tbPelyXP
 bJ2aXF5EiibC5njAJsklMtjlCjOWuirXKGa19sPP29fvQhsvvAqtf0KGO
 JsXd33AsswEOWPCRqdSDkrdy0uZLQa6tHjPKB4nKbvE6zChkD9/7cu+9i
 NUwz3M1/HeOFXES13UnO6Aa0AbxM6lB3bEhBRLcGzF1gY/SWeNWFR/D0s
 qB4yr2bRP+o5zMJ7HWunWgH+ja6WkLcZGdlcKDCNVlQcHaiJITEb4dquy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4075825"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4075825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="22229123"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 08:55:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 08:55:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 08:55:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 08:55:48 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 08:55:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOl0f/e/DUmmnAbX3wk6v1R5yCoNQ3cqjHexFtzgfAnbfeymAjYKLywHjChkFk+hN+BKn3m94qKr/QBr3tp115s/jw51BMUBW+m4/dBaXNtbdwVAKOSgvVfT1Pxey1WdTXUvXRiEFSL9qt0E8q1yCwaOBvvsIR/C2SwACUgJ5bQMuBpQ1g7VunDsCkcA8LLQk1xvHmCs5LQzLM8GRHJXxOTzS/FjibC0+i0+SRoGRYeMfR+vhA0b37cisW2cw5jzddBWsuUfDLYBYZ1Az8qBkjtDJAV0Edw0QQHgVcFdPOvTp31mMiHQzU9z7MI8uzAz8zfoJBgy1HFM7gXexDFlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NLqFMf6q4gZtYKpqV6ZNgLHNIXYc0udiEhvib8AHgw=;
 b=ZnTXqDkrX7YxInqV7DlP70fp/mDXz6AIJMmElJGFwm0FXSzwCWekRlo+h3CstN1hHBw0pwKJ0P8anaKCHpJPKoi/9m4QxrgAvCkT9iPiAwW7z2Xd7rHoq5xdmyvHfkvhGyd2G+o/HZe7Edxq4NuQTpGqMfU2ErzGRQ+p7R7LeX8On+gyXmrGT8A24Cqik2MmPqXOI02EcNIxaP4IudgDFDTvSx+aKezAQ8CgXvAMBYJfK+iHwuNBnLUPhLOA31MHMfUDIsXjx9STrzS9uNbY2mNXeK+E6ZaVQJ+vZ1RTNYE4zeXogykK55zjHchQweeQb+4V9tniPHORW2P0SNyE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Thu, 4 Jan
 2024 16:55:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:55:44 +0000
Date: Thu, 4 Jan 2024 16:54:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Finish refactoring of exec_queue_create
Message-ID: <ZZbi3iPEGsVoZjKk@DUT025-TGLU.fm.intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-5-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240103184408.17844-5-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6fdde4-b419-47b3-592b-08dc0d45fd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ouAav5ybpaeelw970qKfGb2JSO/tHkUFHOVQ6K2n50iXejzVOmpfxXhAtOMu6mgJhODcs8v67gbUqeKLxGK0Ixfjf9FgI765XjHDoB7KFU8bqeHNNWMNbD/SNWqcU336CwWA/fb8aWlRkSOzYLz+wTRViYx0ys4w2AMaELWC96mBBdiZ52NHYnMOVGZg5kBMTZ3rQKnug7PHcO3V5kZ5wug8ZpoY9Pj+RxGE/hGBEEhtzSV5x3GiEgFdJwuXPxzF7HpBs7UirEHaEOQD/09Kmsh0SbTO17gJOVBQYW7UFiG/w/4BM5XeX7OmtOnJYnmdjzEUnVZuhV6QmxnOolBSfg6uU1Cdm6Jqe7wavpxQZY3IND5LywR6Fg1il4JsYFsWiRct0NZ4kbcuTLhiYmdOJMo3t4ErbSSQf1KvHWaaUjxkv3DiNt0Bl0nyhDuoUEnDD/v5+Elm2COlTJ8EMP/4YxbfdpXqOZkItsbsSx7dODe0YeoY0KfUoOSx05+lTHH0RQ24ihXavZgESSj/koWNyRo3TFGStHANgnVfIEx3TQ6Zou/JahO22AggkAalHtL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6486002)(26005)(478600001)(6506007)(6666004)(6512007)(83380400001)(2906002)(41300700001)(66476007)(66556008)(66946007)(6862004)(6636002)(316002)(44832011)(8676002)(8936002)(4326008)(5660300002)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8cbfjnm3dNYStJd96acUxUdY/LkRjFAPKX2n7OzY+ys5AgvOiSG5xjgAKu37?=
 =?us-ascii?Q?q18Ywwt95wntaA3VZs9ry9CzMbllXeJO6vCjEyi/CfqcYmQffGN5spXswf/J?=
 =?us-ascii?Q?mQwAruIKV+ySdDhWRBDLSB5Q32MX123xuLYOvFQoSSHk3+ffv2bfJmM/ci1I?=
 =?us-ascii?Q?I/AHbz5ljNzyIo21BFTjoIWvwxAcJ3K4CQN4dcdG9E++wrFlbgvop+Z5SIQo?=
 =?us-ascii?Q?QP3Tt4t5ojPtQnmM3NYw25/M3Prgo56AU7jjizBGEVB8cvNCyOf2MqoX/EN0?=
 =?us-ascii?Q?6dMJAwRjYPl4qRouuQfYZ/H4sCsq8w0JzFgKlROSPrybOMhevwhHqJHbTMIb?=
 =?us-ascii?Q?ecSFwNt12nqiMXNaQ6Jms/xKp24/pIpu6CNipy4ECRJG0FFq5NWQ8sWwLFxD?=
 =?us-ascii?Q?RmcDdu59SHBP3GwmYmheI/yGvIXH6Gt7ODyqvLHg29SoCKhu8HyiZDDuzBIj?=
 =?us-ascii?Q?fmO/zNJYdCb+icTT+aaPNh4kstCCOhP5ZItMWw6ATPdhHsQDITR8subWF/I2?=
 =?us-ascii?Q?/Fl67zvUnHGUn3acnJnLsvwZbXP89cu0FgF7hIk26oWaPKEfF60vbSgcknEF?=
 =?us-ascii?Q?gnt1vFQbvFc1LQxaDa5+dKB4TiGWBgTEPQi9W/S+sxNRQd8j3P54RXZWqzxj?=
 =?us-ascii?Q?6LnfhsK+OL34Dr26fZfOqfbjWPF+uUljt4CCLBnCQlaoPWj0xNN6FcKWWJep?=
 =?us-ascii?Q?n+A5tOX+WVB/J++ERZHGS8KCiNp9bvuAURqbiD2/MZDTkHtbMXwE74+GGwew?=
 =?us-ascii?Q?rEx5P/KgNvJl+/DoTqyFBDHujI7iMxwv0yJAAQKBFIG3qMIYfXj4i5VFAuoL?=
 =?us-ascii?Q?CmXK2t4o2uXyo7ReX+59EwjrIsps+geDC41ZRLxLo+ZHtxdXKJkeJ8Klj7ij?=
 =?us-ascii?Q?stMR8xHXAy261vjs8tIuF/Hvfo7Nrpktzk6diERumAMLfms3ph2FUhucT2ix?=
 =?us-ascii?Q?xZ+V7d0XALwG1x/PZjiCSND5pM6wGgqHdq7NsfVKG9sDskOgoppuez46Gnfu?=
 =?us-ascii?Q?JpISaZx+Et84KkvCSTRXAjm33gj2Uvw7RGjpNnKIXVAFsXEBu4NaC7b6cD1n?=
 =?us-ascii?Q?/h5JkecVD1yuk84uHitPRO3NxC9XN/1oONXYQYDFPyruGjDmj+XNy6szwz9S?=
 =?us-ascii?Q?4G76LLrU3qGbVZF5ZqkSJV7ApwlQl3Ta1zXWG0j+z1x+UWTk28JjB2OSsbt6?=
 =?us-ascii?Q?K0O+6y7sfFlENOAMqTACi9VND5iOKXmKKOev6x0GhIqiu1em0xHBC/N0Wvtd?=
 =?us-ascii?Q?JgPYo/OgHYJaoXEcgkHJ/YlRTkFWhPaAvXbpwX7CPVOQwkk0PyyU65NIL+Hl?=
 =?us-ascii?Q?UwbNi8UMbYd1wGXxQRxZ99XiIFXbSb9KQoTR/ai9oIaOJK/oAryUb1r0H+Ld?=
 =?us-ascii?Q?TBEk0XDIFYp5pjRVIn0JAPUkenImVVhEgEdRWabiJowRoPqVgoMdoYinbJTy?=
 =?us-ascii?Q?8H5vuTFGXsAo1/Ane4tILt3vblbLJ+yXb9dFuAOuObUkeS+NSl/8om0GuNhn?=
 =?us-ascii?Q?MpHqTdbuUQtPRWuhHEX5Rviwta8C4xOIzJQnI4wN74kVHMqZ6fIyio8RmzB1?=
 =?us-ascii?Q?KmMx/7ODMlzz7CURXoU8wnQGcRt6Ax6598iADw1OvGW3PgW4EqChVedLJRb5?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6fdde4-b419-47b3-592b-08dc0d45fd8a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:55:43.8705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw7w66Hy6laDeRchlEejVmH3ijk+AqNr2T3EnuaTH/i5XwT/MG8Quq6DgW6zi7l49aQ7DEuz73MRxsSh//GmXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 03, 2024 at 10:44:07AM -0800, Brian Welty wrote:
> Setting of exec_queue user extensions is moved from the end of the ioctl
> function earlier, into __xe_exec_queue_alloc().
> This fixes bug in that the USM attributes for access counters were being
> applied too late, and effectively were ignored.
> 
> However, in order to apply user extensions this early, we can no longer
> call q->ops functions.  Instead, make it more efficient. The user extension
> functions can simply update the q->sched_props values and they will be
> applied by the backend during q->ops->init().
> 
> v2: minor changes for readability (Matt)
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 74 ++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_exec_queue.h |  3 +-
>  drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c         |  4 +-
>  drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>  5 files changed, 57 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9891cddba71c..3cdad8a736e4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -30,14 +30,18 @@ enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
>  };
>  
> +static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 extensions, int ext_number, bool create);
> +
>  static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  						   struct xe_vm *vm,
>  						   u32 logical_mask,
>  						   u16 width, struct xe_hw_engine *hwe,
> -						   u32 flags)
> +						   u32 flags, u64 extensions)
>  {
>  	struct xe_exec_queue *q;
>  	struct xe_gt *gt = hwe->gt;
> +	int err;
>  
>  	/* only kernel queues can be permanent */
>  	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> @@ -50,8 +54,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->flags = flags;
>  	q->hwe = hwe;
>  	q->gt = gt;
> -	if (vm)
> -		q->vm = xe_vm_get(vm);
>  	q->class = hwe->class;
>  	q->width = width;
>  	q->logical_mask = logical_mask;
> @@ -69,6 +71,21 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  				hwe->eclass->sched_props.job_timeout_ms;
>  	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
> +	if (extensions) {
> +		/*
> +		 * may set q->usm, must come before xe_lrc_init(),
> +		 * may overwrite q->sched_props, must come before q->ops->init()
> +		 */
> +		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
> +		if (err) {
> +			kfree(q);
> +			return ERR_PTR(err);
> +		}
> +	}
> +
> +	if (vm)
> +		q->vm = xe_vm_get(vm);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>  		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
> @@ -124,12 +141,14 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>  					   u32 logical_mask, u16 width,
> -					   struct xe_hw_engine *hwe, u32 flags)
> +					   struct xe_hw_engine *hwe, u32 flags,
> +					   u64 extensions)
>  {
>  	struct xe_exec_queue *q;
>  	int err;
>  
> -	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
> +	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
> +				  extensions);
>  	if (IS_ERR(q))
>  		return q;
>  
> @@ -174,7 +193,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>  	if (!logical_mask)
>  		return ERR_PTR(-ENODEV);
>  
> -	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags);
> +	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
>  }
>  
>  void xe_exec_queue_destroy(struct kref *ref)
> @@ -258,7 +277,11 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
>  	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
>  		return -EPERM;
>  
> -	return q->ops->set_priority(q, value);
> +	if (!create)
> +		return q->ops->set_priority(q, value);
> +
> +	q->sched_props.priority = value;
> +	return 0;
>  }
>  
>  static bool xe_exec_queue_enforce_schedule_limit(void)
> @@ -325,7 +348,11 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_timeslice(q, value);
> +	if (!create)
> +		return q->ops->set_timeslice(q, value);
> +
> +	q->sched_props.timeslice_us = value;
> +	return 0;
>  }
>  
>  static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> @@ -341,7 +368,11 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_preempt_timeout(q, value);
> +	if (!create)
> +		return q->ops->set_preempt_timeout(q, value);
> +
> +	q->sched_props.preempt_timeout_us = value;
> +	return 0;
>  }
>  
>  static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -376,7 +407,9 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_job_timeout(q, value);
> +	q->sched_props.job_timeout_ms = value;
> +
> +	return 0;
>  }
>  
>  static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -651,6 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		for_each_gt(gt, xe, id) {
>  			struct xe_exec_queue *new;
> +			u32 flags;
>  
>  			if (xe_gt_is_media_type(gt))
>  				continue;
> @@ -669,14 +703,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			/* The migration vm doesn't hold rpm ref */
>  			xe_device_mem_access_get(xe);
>  
> +			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
> +				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
> +
>  			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>  			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> -						   args->width, hwe,
> -						   EXEC_QUEUE_FLAG_PERSISTENT |
> -						   EXEC_QUEUE_FLAG_VM |
> -						   (id ?
> -						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> -						    0));
> +						   args->width, hwe, flags,
> +						   args->extensions);
>  
>  			xe_device_mem_access_put(xe); /* now held by engine */
>  
> @@ -724,7 +757,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe,
>  					 xe_vm_in_lr_mode(vm) ? 0 :
> -					 EXEC_QUEUE_FLAG_PERSISTENT);
> +					 EXEC_QUEUE_FLAG_PERSISTENT,
> +					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
>  		if (IS_ERR(q))
> @@ -740,12 +774,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	if (args->extensions) {
> -		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> -		if (XE_IOCTL_DBG(xe, err))
> -			goto kill_exec_queue;
> -	}
> -
>  	q->persistent.xef = xef;
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index d959cc4a1a82..02ce8d204622 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -16,7 +16,8 @@ struct xe_file;
>  
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>  					   u32 logical_mask, u16 width,
> -					   struct xe_hw_engine *hw_engine, u32 flags);
> +					   struct xe_hw_engine *hw_engine, u32 flags,
> +					   u64 extensions);
>  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
>  						 struct xe_vm *vm,
>  						 enum xe_engine_class class, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index a8a895cf4b44..5b84fc9ab8ad 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -356,7 +356,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>  	q = xe_exec_queue_create(xe, NULL,
>  				 BIT(hwe->logical_instance), 1, hwe,
>  				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT);
> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
>  	if (IS_ERR(q)) {
>  		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>  		err = PTR_ERR(q);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..0f2258dc4a00 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -235,7 +235,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  			return -ENOMEM;
>  
>  		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
> -					 hwe, EXEC_QUEUE_FLAG_KERNEL);
> +					 hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>  		if (IS_ERR(q)) {
>  			err = PTR_ERR(q);
>  			xe_gt_err(gt, "hwe %s: xe_exec_queue_create failed (%pe)\n",
> @@ -252,7 +252,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		}
>  
>  		nop_q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance),
> -					     1, hwe, EXEC_QUEUE_FLAG_KERNEL);
> +					     1, hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>  		if (IS_ERR(nop_q)) {
>  			err = PTR_ERR(nop_q);
>  			xe_gt_err(gt, "hwe %s: nop xe_exec_queue_create failed (%pe)\n",
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f967fa69769e..1f26154aee84 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -344,7 +344,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>  					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT);
> +					    EXEC_QUEUE_FLAG_PERMANENT, 0);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
> -- 
> 2.43.0
> 
