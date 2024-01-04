Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB5CC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 16:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994910E499;
	Thu,  4 Jan 2024 16:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17BB10E499
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704386734; x=1735922734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wL02/Cui26VSUmz9UcXqnGyIAOeMnKF1nrhQUiMI8Qs=;
 b=AUoC3tMs28K3trP9RZ5Hux+j0mmJzqRRkSzRsOlXcMYZfB8lsnO9hW/F
 IBo6AUWlADAsrmJndU7n0eFSLqyUk68/TPMVsComk2ZtXHdAMOnGh7+bL
 B+FM4F85Kg0mWUBkuNF7JN08CtWVmzhpGVthrlUkMHLapBo2yEd6DqsdJ
 ZCX9J7eoVHPFh63r0C+MSy3MZpO0hyrZDjY7d26QVt/6BhNAwJOgeM0S7
 GPQrsilXannupu1lBMBLiMy3q047rVJsWdxECdTgGsY3m0qgAnqCNHn/3
 YU0WJHwSJwN6CZwToxtUV5QRbU9pZZ/vlua18C8iuhaFBFTwFUJvMkEUB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4109983"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4109983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="903874627"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="903874627"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 08:45:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 08:45:32 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 08:45:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 08:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lM/enekrZC4DcVzpqWe2PfaPO2+oKkqC7dlsuP73pRLwIT6K8ZjfKv8kO62bVxs5wVbNK5mj8qmyKOWQzplj4oMUSLi9ognvsxLk7ioy6IHSg2eLBk6UpN6P2qmAvMc2RrIx+1UGSciBVwjev+Zm9yxvZgvoW0W95emYHQKbZduR3qtdMMdW9DxNVP9LKhzCwKNF7+QEvANVKxF4Jl9mATFAiKNXA3iOx1p1IDWo+7r3Y3c9R0Yffod5ypyBcn8L30jEXnXEJ26e6oiDH9QXdwHGJu1bwtWlAuSrKJetQvi7Ysb2Mo+wgVo27n6/HB2XAHdBcazoPKEzZW903+SAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhOKTvL5vyPcfrEfwEYHaduiiscKOrtCGoygrQbtBPo=;
 b=QYpXuwxDDuXaOeMyeU2VrHRrMLI5REDXXNtmmZ9EpUaIEfGey4FMqkt5pzLV7p/QePEphAD8QUjmYDfJoUqezgW14rnB5RJSNCMJmQUlzBff0NDU7/MJlUBMuSbzxGRpGYU02qruIDXx1CLOSy+TSHn66ppa3hVgVCeW5gvykohi/AgjJ+/dyGPGobTfJpllO2AsWn+T42SsdNqyh8PesFyq1zg5oBqpwpBUUmjhr8PxrndKgDGM8/HVh0wp8CEdwt1cl3he2mZ+r9Eb+y2uFTEZpD/EwzxvRlx2gQNS1ThV4bviau/I4XKcCqCKs2QQ32XgxYft0iaT0e4XKQUZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 16:45:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:45:29 +0000
Date: Thu, 4 Jan 2024 16:44:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe: Add exec_queue.sched_props.job_timeout_ms
Message-ID: <ZZbgdyOLpCaaVTh9@DUT025-TGLU.fm.intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-3-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240103184408.17844-3-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 279a1efc-89f8-479f-ba35-08dc0d448f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UNGS+is9vcACho2cQX4yB3gtfL/8Q96RpcNSjocBIgRnucAobCQnClSY4+VTjnvWxyMIzGxCwzx9pEgvJMBzXirIDcZPMPDyEJTNbYXDAEvhHfmAjODG5OnwH39DdDfigJ16BUWlphet5uo2vjN3erLmQCmbGM3q/8W+Cwoz+ccxEYtup2gOkEQPeFS/7exiq0A/okld//Q7o/g5tVfkSkAaUXQcfhwUcq1eBXzw2xTjC/IGSmuL7P2wia1Jcb08CzyNad15lYUhgKRx54vjUB1E0RB2HtbRNaxIGW2gH3EIGXCOgpQkoahOt2RnfiFdwvR5cU9W4psZ6N9advpEpqgE71JQK32ZKxnnK6avArmS5xDKEpwxy8lZFpH/I0T47730Eq9gI084A2V95yR6oSNvoAsRiDwRWme444OlAWRPoJVrkM0TAd9si3R/Wm/QfV+ObuWem/fdAvFC9Rvbtfd/5nG3WWHus46988QcU2q3t9LVKe+J4pD169R/8TfmJGYf6J/D/9+FoqNxD6dMp3S5LrRZjEsFIcZbGq5g71z/dzY2OHakjMDqfrmzHVx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6512007)(6506007)(66946007)(6486002)(66556008)(66476007)(86362001)(6636002)(41300700001)(38100700002)(82960400001)(26005)(6666004)(44832011)(83380400001)(5660300002)(8936002)(2906002)(316002)(478600001)(6862004)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vj/c83MKVjw9tYFye2pDZHDhc9jPa2YnJ68Pj/DrIP/2lT3na/ttmPOaso6M?=
 =?us-ascii?Q?jcdFwNDtMJuHTydvag6Wx/NOZLE45quP7SpaoZbYyeGAI+0XPugRlt6pLQjj?=
 =?us-ascii?Q?wz/LMaUXOhTUD/8hMU6dpslawB0baF8UEeq720/oPrGiv6mxkjKDtHWwdbTd?=
 =?us-ascii?Q?zFwmAP9pJFzBnHk498Peo63J7V6GNupfCJHjEAfSvdvTrLhNUZi0t6Wk6exP?=
 =?us-ascii?Q?NCuclfWR+6RnqrFm+cuL9rkp4Rk9T2yaZbO8b2HnONXi5TPlnd8G0g5MJQkb?=
 =?us-ascii?Q?c8Sa0bwLWXeUmWwCIfJh8mzV2bvsinDcoBU4ftTkguCChDDG2S3eaEbq2NRf?=
 =?us-ascii?Q?zY46ZRjfb1531jUIcpN1AtQG9/uFwkTELWysGDUSA5bbONhxKNXyHx9qTGrt?=
 =?us-ascii?Q?u/+R/JIGA/R81a8X7gXkh0WLjF1aEm7ieTePemr4PfGoosJLLwAaiHVOM/p5?=
 =?us-ascii?Q?VN462vPRdaFxERPpNKAo5rrEbRCEFXGFhMtsHqF04y0vxkbvhLL30QsvdKg4?=
 =?us-ascii?Q?NkavBLxFP6OQwCq0bfdSYn897o0lO37pVd3WakIGEGOQeVwdh2ZUqzo+BqtF?=
 =?us-ascii?Q?CwE4Mg//RVy2qguf4I8G/eSG9SdwLGt+Msd5L+2e7s88iYXx+3ZCE/2gj1x1?=
 =?us-ascii?Q?lsc0fCdTkZa15FJs5pg8S2RmCC+2yKdm7oxqvmWuEqiVIMtnEyNY26Ef6pdy?=
 =?us-ascii?Q?XZjyvvPSkALhxLVF5Ggovj6AhYfHXQ7jt8LSwYQfyM9tOw+TpN/zcoGlBjmg?=
 =?us-ascii?Q?eio1zXE92woDcgsqn2U7Ur3YxjDNhxdTcyb+cy+x9SlvzlMckRz98NwGiqXy?=
 =?us-ascii?Q?Im2eZmy9ZWdXGjTC3WbuDqnnAukNzGQu1iN8YSi5r6w7gIGev3mA8ZJqJ76D?=
 =?us-ascii?Q?jkDCzZpD4yfCZCsj17m6rxSBDbC4vAX/0S9Ils3wYqEHkbK9K55pttawr2F8?=
 =?us-ascii?Q?NyvN4CEsrihQVhU4/wm6cLHaTzdRDTSVdL6Lf099ZEQI81D188Tjr4k4oi2j?=
 =?us-ascii?Q?gLESsSsPDlaE/SKz32D9Hh7GKawGWR0KcZHP1waiawn1/76QDiMqlcBVVVdA?=
 =?us-ascii?Q?nr8V+SVbXSmlYINFXhmH98azKXNaSCP4RPZx6RkmOL3D0QcHz8JEPjPQWbDj?=
 =?us-ascii?Q?cNH2w52jevEN7NFM/PkPgSH+tNP/EOxueSqpr9o6JCJTWytq2ewaXj2xGboJ?=
 =?us-ascii?Q?QLFMsepGwLFqBMzHOV8Il232hbtRCLjA6PjQmlR9HHQ60+uahFMNvAsx9VLq?=
 =?us-ascii?Q?2M9uHDKaoYdAVkZ1aptN8sT37ValEW7peioIi0YhvRsrmTsMWuDpf/3oNodP?=
 =?us-ascii?Q?I3WPoOmeMiBDCZs7qLfhCPyXFXVlW5L+h0029G24+fMfW6JYZwU6uI+4H+D2?=
 =?us-ascii?Q?RD7pv6ArnF0nlavIvPP2xfIXLtP8gAd627TjCxa5utdmyhkoKf0JRd42y8cd?=
 =?us-ascii?Q?LlZ6X2tAxjVxKRQycDkBg7ndHu+3q0eVa/Vlow2vcX1+TBPQD2DD/kuDr4yc?=
 =?us-ascii?Q?aGixWYeEzb2+oTxMc3Jx6j7qQBuPIH0BrP1kef6vJPSwZr9P25nxdQJZYIB/?=
 =?us-ascii?Q?d2O1ucuA1bnin+EubzTzunx1j8HXO9t9HS4DZ3OZJ/zjljwbRxN3sEkDjfhg?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a1efc-89f8-479f-ba35-08dc0d448f60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:45:29.6081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSbA319UAY6qLHLopeqDh8lAr9P83rGDO3AFb9kA9xGlJEpfM2ZrW3XnX8D0x8rFW+lClXCNMp80sDhioE4BxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
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

On Wed, Jan 03, 2024 at 10:44:05AM -0800, Brian Welty wrote:
> The purpose here is to allow to optimize exec_queue_set_job_timeout()
> in follow-on patch.  Currently it does q->ops->set_job_timeout(...).
> But we'd like to apply exec_queue_user_extensions much earlier and
> q->ops cannot be called before __xe_exec_queue_init().
> 
> It will be much more efficient to instead only have to set
> q->sched_props.job_timeout_ms when applying user extensions. That value
> will then be used during q->ops->init().
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 2 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 94ae87540854..e78b13845417 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -65,6 +65,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
>  				hwe->eclass->sched_props.preempt_timeout_us;
> +	q->sched_props.job_timeout_ms =
> +				hwe->eclass->sched_props.job_timeout_ms;
>  
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3d7e704ec3d9..882eb5373980 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  		u32 timeslice_us;
>  		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>  		u32 preempt_timeout_us;
> +		/** @job_timeout_ms: job timeout in milliseconds */
> +		u32 job_timeout_ms;
>  	} sched_props;
>  
>  	/** @compute: compute exec queue state */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21ac68e3246f..56c0a7bf554f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1218,7 +1218,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	init_waitqueue_head(&ge->suspend_wait);
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> -		  q->hwe->eclass->sched_props.job_timeout_ms;
> +		  q->sched_props.job_timeout_ms;
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>  			    get_submit_wq(guc),
>  			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
> -- 
> 2.43.0
> 
