Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AB3C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 08:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B3F10E261;
	Wed,  3 Jan 2024 08:15:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1B710E261
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 08:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704269706; x=1735805706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NiothXE5+aduqFIhNHauDJrP3evFjdnyKTn5g4XBzWA=;
 b=AGicl7D10tQySF3IjV4V6R2ij9s/xls7wZko9713rkQ/tpbyTeET1z7e
 MvSnaVOT1/eKNumYXOnqbxtwrcWTBpyvATTCxvpUwNf3odXJn899ZALP1
 +QuLDQgFWWBlG4SsiXHCG5RprHSsKzHGpwtAgEvcdfhywuWL2CmytjgYq
 mfpx1l8qmK5xB69vCDA/krLcPvUJ+TykvqrWAt6s4zbPQhT1e7AnzaV8l
 5vpMw/aH+jb+qMG9COwFCoFVR5G8VKe6e6NhmetN2gQv5UGchNWnifTWO
 aw0zeEevZeuz84/wD7czMwOVtFkzmaDKqeIXxlTwk06fEnmOy1x/i1FD5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3801489"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3801489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 00:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="808766015"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="808766015"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 00:15:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 00:15:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 00:15:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 00:15:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO7lja8NORfGfMq3TEQxzpfZH/NC6h0+OsDhnpo59BrGv6Y1qTzEybgVTyTaSEW4fvvnjn7kmYm6M8AiWYbXlACFS9YMeSnCO5XFv10McTGk/1uWC0CVmLPH9gBBUQacR2lUOi2d8rd5PXBvPXSlEuj0LniV5M6WGW2oQwwCKdCWHE2brfvBdi2QkyU63WTohmbffoVyTPmnzw5sJ09iCOe9shbhC+kq7mHPvUgDoW8jlUBcML88lViNPPFWPgy4GynivbXjVX9HfT9Hhan7R4g7+G4JxxHbAcMiHRrJXekWTTwgpmGjUIzOCdXuNl2tO0PFehag0FWSHODkVZiLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIHYnopgJJzQi8iqWMI55ksikqTx8sSeX+kDVIAwdPM=;
 b=YzwB2DFgs0/TaKtHYJFMNHTt+s1JtDl5wnF+uWsWTCiQm23b5mQ6zXTVAGbVK60HReeyHm3upj4QCITmhovuraCP3aQN3hI3Yn6hcoestUUbqihjf6qAAafXnDy5Nzbhd0wZH6Ae5Hkt3YI8qHF6PndFc6BHcqCGBYfzKFTUBvn/be03kwHHemazoGSafCtfPYcek0xCnPArgRmMZFAPtqh90npReVJrT42e4lhYj8j/GC+d4800WRXJF/h/+5f2DMDck3O+LM8tNzJaM0R9BXy32yh8Yec7dgIy7mTZxQS53PJlrdFujHa/FJ4W7LJ13aFX86jOY/x6nDQ3hcpAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 08:15:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 08:15:02 +0000
Date: Wed, 3 Jan 2024 08:14:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Add exec_queue.sched_props.job_timeout_ms
Message-ID: <ZZUXdW+dXWnXaw93@DUT025-TGLU.fm.intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-3-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102211731.6720-3-brian.welty@intel.com>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 44431421-38ae-479b-8df0-08dc0c3415f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fW29zNHmO4oVketrV2HsG0D7zvPWnkgx79tM6KZ3D5g67TPHzoItgjn3l0u3CH7t8XIddZdlYoMRFUTT1FXJcIeZylUs4uPPiSIxamUUzXs4y5HLMjRd77sZidIJfxpQTHmw5BopwIpmcfoD0YLd8U8AGBSaUKZgNzMzFlKjfQAHDcNIA0thXFCEPZ66Eh1NsiZIoMNP5zsPthlr+pqDMP3j+YXThSTbKF3qcNJzB0BfashgE0WmxIxqRYvF3oFtqKr3O753noXO0uaO70tIlOerwhFTsHm0IC1bt+aF7+KvCOraCJrqfSAOjoWRMXHdWmUF98/CY0KGGetybP5a/9KxAxCfPTS94TUjbKDECsXwchwHOrxBnB1LuK5/udLE/s7qOghvRCAVzOdRqoq9XiSQnpbcr/hYfUNSnZzSNadMSRmoDF9fuofH+7d1FzfLbVgsdsa/gPkw1MiHewCZT7BWd6eKJa4d9HSnd3TC0Vh/XYWzqazbGLXcxEOmooXJ8mcJU5CoSAwQwszN5/0wTzZNkwaMcnJkcjnPCDBYs2/agsW671laqfPbm5X0yhLVExv+alXwksCaqNCZe90cuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(26005)(38100700002)(82960400001)(8676002)(8936002)(316002)(5660300002)(2906002)(4326008)(6862004)(44832011)(6636002)(6666004)(478600001)(966005)(6512007)(6506007)(66476007)(66556008)(66946007)(6486002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5UAeqmcP45fsnLs0acWLMfjZVwWmqJOoFCZLfs/EulxXyfip9/8VQXSbxw9p?=
 =?us-ascii?Q?4erMYtxhy12NC8UA2xRmp+CH7nKe1RHKN/V/UGPDu4Mxn7Wac7orucZ6nkeC?=
 =?us-ascii?Q?JyEAGsCNa67IPHLUbrW2s4Ls39aG+3iU6eh9cTgyqIogQVb/RCszcx9RX36P?=
 =?us-ascii?Q?JxbyYdIH/0PP+K54zZX7Y9g/IBSPJur2gaYuutxPl2qMHZuCic3TqoWLolar?=
 =?us-ascii?Q?dak97kAQu8fFVFvcU3cn5CUBvUPSx+KlFhDo84vGb+hfF2ZlupJ0eGTHynq0?=
 =?us-ascii?Q?/zd4cTuHY6o0beEpLSXbr+RRyQJvx5cH+u2LQor8+fqLxNFeI8IhFleuJ3wO?=
 =?us-ascii?Q?5e+6J34r2EWiKOwv44yui/rzYq/JDW+UHMrYZEQ1MVQwKksq66G1tCYgFy40?=
 =?us-ascii?Q?MoJlJgV3ORF1fbLz8p7JKNsOFbhRyX0w7HhTW8jsPXdgmfgu1ucdHIzdVRge?=
 =?us-ascii?Q?mbiLWLc/0r0j+Z88Gqez6aPjy1gIuRLCIEpr+ieDD4YQUjdtUja1gCFSvXhR?=
 =?us-ascii?Q?qF/c4qK+Nd6BE0oYGkR3M3w+E11iZISWxV8se5DjXh4cMcfA8rlKgGxezaB/?=
 =?us-ascii?Q?CUXBMunsN+4Qjycfeev0nQrVlh87pNIXWc451mnWD3crNVyv3bBeDwUNAFy/?=
 =?us-ascii?Q?NPRTBNyolUPUStsW670TJnve90iTSVFqp4UJlX93V0qzcyYniJLd7WLpI31s?=
 =?us-ascii?Q?CeRE4hrMUyvMw2y9W3qMyTAQbeMMqmGwg4Sw/z0kd5MnksFrqsFVS4l0zraI?=
 =?us-ascii?Q?APxEo29nWYSSSdNDWzK1nkin1Yl9AdZuhJjsPHZkOqU8mUW022+lYp2SeZ8t?=
 =?us-ascii?Q?VnSTPvMCHrXsBZsya3gMDRcGJcax93z6W0OJqw2dxGLr22qO0sCskuAlWRJB?=
 =?us-ascii?Q?HOv+1f0sZk9LSI7Qp4DL/YfHXn/lEpGGBr3kUR24G6mFzSoMuSY64EkyRNCn?=
 =?us-ascii?Q?jKPoSqntAos8sGMyD9J08TKoTTtAWiiPqTAwri45hJ5dCqZaVfCOD3kjfEw+?=
 =?us-ascii?Q?gEn8t5auXy0HzoIBmUKjZ0QpVSs5QsgWlvgn/VIgRj04VgMP9phr6BsncPw8?=
 =?us-ascii?Q?AuIjxoGxVZHEZPuQTGxH4Ve6IBSjv8dD9zRYtZDHuAy4n4BkH4OfJj7mY2kr?=
 =?us-ascii?Q?M/oYmDiH2BzGK6w/GJ3+QrSPxA9F7hfyAx5omZoQvENWhL/uqIQdctOrN/9Y?=
 =?us-ascii?Q?sAxYX8a8XY6Xh/dMSwCoiqG+pZxEeYl5oayEv61ftl2B9drF4mWxRIVFYFwy?=
 =?us-ascii?Q?9IxO/1fA5wiE2irV4/TSRb47Q9u0m+ngHZEMmkYAsJgUCuKeUVSJnt2QemxV?=
 =?us-ascii?Q?jvAGu3QdtWItzqwCuBuKdVCbeMWl4idxpSMOhyF0P1rW0bY0ey6ZoLuJLcmU?=
 =?us-ascii?Q?M0FgMjw5vrG5G3f3gCAp/RGDjExsVb0PlmaKm3AJgFUWMuKkgNkxyQHSVnxR?=
 =?us-ascii?Q?ygAlyH9R1PwLPVGdwOAAimiI7Fubv56GDhG7RclW/Z0LC4Bi4Aa4MxdjwGlG?=
 =?us-ascii?Q?icHqaGF+DLB8h7Zu7vh+EM7BedXW4amH8XQRT169GAfaoYHzAFl7RJGlaXK1?=
 =?us-ascii?Q?231gvnKB3FEJbRRbAp1j9R8E55JqIUvjb+2jyUktSF3U55rIW7rkagn244Lt?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44431421-38ae-479b-8df0-08dc0c3415f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 08:15:02.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR11fjyvBWceYCArQywn+3dwE2VFzYeqKDOo60GeDDoCu+libT2iXWHoc77aqvgoN1uWf7FG+ZdaFYDPUl89Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

On Tue, Jan 02, 2024 at 01:17:29PM -0800, Brian Welty wrote:
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
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 2 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 3 ++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
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
> index 21ac68e3246f..6cbf41ad9c8c 100644
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
> @@ -1361,6 +1361,7 @@ static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeo
>  	xe_assert(xe, !exec_queue_banned(q));
>  	xe_assert(xe, !exec_queue_killed(q));
>  
> +	q->sched_props.job_timeout_ms = job_timeout_ms;

Patch LGTM but per my comment in [1] I think this vfunc can be deleted.
If we agree it can be, then no use adding this change in.

Matt

[1] https://patchwork.freedesktop.org/patch/573052/?series=128128&rev=1

>  	sched->base.timeout = job_timeout_ms;
>  
>  	return 0;
> -- 
> 2.43.0
> 
