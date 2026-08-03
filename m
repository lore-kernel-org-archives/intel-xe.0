Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B312C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 16:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384B910E050;
	Mon,  3 Aug 2026 16:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkwWQ/0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8710E050
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785776126; x=1817312126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aYdZ4edHMV7/G3jxfUVYh0v7D/4+yJKcyKZjZB7xcvE=;
 b=QkwWQ/0qzCDQ+tXRwzS+PZvEpHln2m0DOfTurqsUm7n6f4WZnZXZoFJn
 Su1lSEJwh5ylldfVPmECIlSBQz4jAlZygpK38Y7Af8X2VoQy6y0nL2zDc
 L8Xftd1MMhZfANjISnJ50oZCubQo6WiRNIkIBzQnZe4mLeepWrW6eQ7LG
 EvenUPsBfJX1NlMf8lIEzwpcvEc2QCM53od05smDMI0wetPhmWZrGU2j7
 kC6k6UJDsFtwBVdx5ZfE0Qf9wnmSENvOKy4EnqQ0jcWY8glKhrC2y4CS0
 jXIy1IDHIzT+pOm2v0Pg/Q5JDmCfUWjF+2nD8L0XuahKPpM2Hn2FohLuZ Q==;
X-CSE-ConnectionGUID: i2fgFznQRHqSPo3s5LsoQg==
X-CSE-MsgGUID: grw7NSETRtqoxx6HEoXAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111872959"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="111872959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 09:55:26 -0700
X-CSE-ConnectionGUID: I/brl3YCR8CdjRA8MeATjQ==
X-CSE-MsgGUID: TKZkXv7cTSGg12x6QV5JjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="261329439"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 09:55:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 09:55:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 09:55:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 09:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkSKlGJ9CEzslLH9skLV2PLWkNeTnNSdLerGUN8Rj4O8ng+jKwo4ofxjVEy/H64VvnQIJJgXKXeGYlvRcj2ocjH6p9a2GbWF3moicdP4AU+mjqN3HD7wHVoKFsNhqrOGf7sgMW8QAPP4DNSo/xfYN4NChVT/SGhBmEIJCxYjSxRNS+shVrHQg74VubNWjvH+ATokXvxntfVVifpB3k/prJKzWujaRrY1Ih1Z9HfYb/yYYc9tN8uxPnitZVZoE1httugWoLw4R1z7+daoTkJJbiWFq87BRzhLYXfAEtyGn+PIzaeynAn6vcek0+nQVVqI/P6QhWMsfeHo8DBigKAPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdvmVnVZEwJ+woq6N3DpOY7oBPR3p5YTvvSkLKJDt6Q=;
 b=atnwZStX+jilU42BnnBm+Q25tkSoP7jo962xXqMse9wUBaGGlqHYwvpUEbux7nb8SOnfoEUn/xygm9JG70EAGf+6NmgYjdw1bJmYO6u61aISpB7cUKx5Rme2bpBKARXF7Itglo50/k4AQLKrAgXS3aU89SlC5yjNtVUR1hGxU8jvm5UXRxO0ZhlpEfzfimg9hA/06NbjVbz40ZVsrKvu8OQs5k2h4MqAyi7n5aB4MaNuFrrEHIb92Kx521fckaI0tQ2cReyTyCya+8EDVErK5cAOmfaxgRzRZnE5zGc4pSQYU1iXzg8T2xxVOsqRfyOGuksdRhFymSgRBRxCyF5zqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 16:55:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 16:55:21 +0000
Date: Mon, 3 Aug 2026 09:55:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/4] drm/xe: split VF pause into prepare and revert
 phases
Message-ID: <anDH917vEbbhdwQD@gsse-cloud1.jf.intel.com>
References: <20260731232625.3313657-6-niranjana.vishwanathapura@intel.com>
 <20260731232625.3313657-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260731232625.3313657-7-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0180.namprd04.prod.outlook.com
 (2603:10b6:303:85::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 127addcf-3906-47ea-c33a-08def180018f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: uK0ezrqWipfOW6SNzPJUUmZHr+ITNzlFyKQL1SGjDNHA+3x8hiHbcxUChNqoP8bm+1vrNN+Azt8h5auBh290TZGvGtKdtTOuL/9WdYUGyBQ74sGuIU9fanBTkPrMF0CFWwzZ9JH3i2p5vHwfk7KOe/0Tv4jWZmCqynDpNhULSeXAgXf0ggi/mA262WlfxdPxsKne9Yc/NXVqRd/mcoF3nZbPQKx3aV5BEq3BuSg2Ah0EvMN/8VrfC3kcLvukrVKm1Ct1tP3Biz97DYolnLWTzY6d7iHOGXpQDBgaaqFwxTDt+zKijiIH/Up6A34iwBAJkCXt5L1ILve/bXcoFKsEO22W5rr8xC5p2Z8DNx/wzUZETu6Ed56R/yxsAqb1ZDEBj8/4oI/nn/M0PAzw/o+LJU5EwrZhBQnh0cf0150toMHw89PzdQ9kEBsTJbrbjbF010i5bqv9RKkw/PiqjoGthITQNjgU0jRGaOIc6EyVY6DXaeGHvMyYAEiq++S8RMVM+HbAyLlVFN2RUHSG1it/L7bHEsWBcOwQuAwwVf8jydMC4Sj/3S80h6ZrVZeibp2CfklqxlsHZcVbekzAUPwHmwEYCmoWbCtld2kw0eMp1OH4NeP0z+2fAvQ5j7qp0mQ47u/sJ7LtFbSqJVUdA0uNQJu6Syd/MUMZ4TFTHbCTcyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atVPUg+QfIzcwQHg8P0nAzB5nBmI6MCaZnyeMLoamjC1YTA8n8L5TBBtYH1c?=
 =?us-ascii?Q?MQz0X5vZEhjMsHeOGnwWfbhtsgT//Y0oANBEJ5yux5mosqwMVIoTRrd48eVe?=
 =?us-ascii?Q?5OzmaMjBSew3GYiY7kAuhIL3bGC4f1kRZA0aD7YaD0aNyunO4pGANYp18lLE?=
 =?us-ascii?Q?jt/yVoLcFtisyL7nx+PkzfenQIgZCnhZoJmFg/7MKShy2MXvNk5TxPwzAwU3?=
 =?us-ascii?Q?iW76weht0R0yuMhdJK/+bfzvumHwHxWgMpzYaNpI7M6NzEYh80Lu+uswLtHy?=
 =?us-ascii?Q?hIzten4HpwLc+GxMoycoaHNRLXhhADeo6vtg+gL3NjqgHiRfx9sb0fmxtCci?=
 =?us-ascii?Q?yA3Hzssbh/AJAvGcwBYvfQbCjMDDBftx47RBo2Gsm/K57B3ckd7sMCm+PnK8?=
 =?us-ascii?Q?7uhzFg7hSb448P2PdtDNHeEQRse80kGgOEKCtzHCaK07reKSpguBf+lTBodh?=
 =?us-ascii?Q?HIBkmF2qaysnVCJVbLot5YhbruMlMhJrNsqOsD8XVWXloVL1J36Badla1R4b?=
 =?us-ascii?Q?MuPn1ujRrQuVwbqwlarmElHsvH7IxVrb+A2NqeFB2Yu9hNJYw0dOvKwSkXjY?=
 =?us-ascii?Q?kyKsTBUPVa955QKvcxaC5bLHGazRCS5g80uwQI+kiLBWY13YYFzZ/1OtxT/h?=
 =?us-ascii?Q?wrsyFI7kDPHo1mpAG5vXvKYyg8/jqA0mpPBuWTRPMX6METCQRcsIrvfUwWw8?=
 =?us-ascii?Q?5sip3pgeWvEsSgRfCL/HWfjo2ncP/a9RL0RxqkIRss8EHmO+QzFj76gzpSw9?=
 =?us-ascii?Q?YoXu+be38UP4cvL/PQx5L6GMHcfP+ND2j/A7jBZ2SmjoTVZzzZhYaqRRcnu4?=
 =?us-ascii?Q?uhWFBJ12X760+ohrs5h0slnA8q/J4pm66AcXdHhfGLZGydr0VF11ZfDQYAzz?=
 =?us-ascii?Q?bac8IHbDfPys0MlaxEpZ91isAqocG7TSssG4XuX49QGG/4tX2/HfnXbEC8b2?=
 =?us-ascii?Q?4o3O6wkWhY8cqJv1oPotCrPBbWmurOjwFnRk4LATNQoZT/744vLjuAfpFSr4?=
 =?us-ascii?Q?rhuiyZCXw/jYumHf4GB4h+hjEvEQbeupmVbrhuP4OpiROK9UA7k/GVpPU6iu?=
 =?us-ascii?Q?2XPU5tJAyzjw4V338HYo9YWRVjgtnHV4yS5VsBMA5EmP2PjyyHnHU75DC8bi?=
 =?us-ascii?Q?5pCxxJ4ZXt7sJfNiWoYMtef7TFA/KEZPMFCvdGHsOeDouE2TKYkvadrvTaqy?=
 =?us-ascii?Q?puYGP2ttpFLA2+eRR88nA+jnNV3UMSC73uPsVOCpetzk00cybF1YzfKyBFtW?=
 =?us-ascii?Q?nY/DaOQDma9J4zpk7FJIIJ+Tr5zx2SmbV7cLAEfhYKT6RAtw9Gq3w/FHxkCZ?=
 =?us-ascii?Q?8/6P6hOBAVNAmVBAnl+ataVN5dDSJMzY8dhPLCL7ZGxNAtUDLUEO/J6FSMbW?=
 =?us-ascii?Q?TpYM2PXuSHYmeaI3xM9ndeKYGUN0qtgYknaU1E51btW4X2ZoAiGYZxBDZJ4j?=
 =?us-ascii?Q?/YAqQMf4xet96xV3Smh2A+2SxOLjxaOliAUiO6SQV6mdl/venPQfu957kbfz?=
 =?us-ascii?Q?pDmwA4K/81k/xr9J76hc39q/Xl1cE5nGK/t5rNJcWG4ObYiN6ctMI4qhSKOG?=
 =?us-ascii?Q?v8HYf5z75HHIrsfxCc2RPcW8M18kzs9yB+gy2LB1t49bP3pbsqwaC7/JZpa1?=
 =?us-ascii?Q?FVyhcMs+v+ewzyUyoiNR0zUxgY0l5FaeKlCV96qpM9qPwde8Ge5v0/keItEZ?=
 =?us-ascii?Q?Ed5t8dF9IpnFGOY/4JzIGNImtbkNvREHgAmGrvtd/82HnN9f6qIwEQgNFcpS?=
 =?us-ascii?Q?RmEdb2Ct1Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: PE9JNPzEJBSowA2cjYwryvOQrtPFvNkUek8tED/IZ6AZRKGiVv3KAHvlOHKz3uF13hsHg1Hlma951ZGd8cLsf6JK4AJ97ozs9hY4kgFD3DBxq9nNdMrKzNnp9aG4hWgWUiU6csnhh37yuJBRs2pUe9TnUXngV/Uqju/ck016yXOeLR3kZS9dvId/j0YW/WKTIIOrXYnQEgL1fX6NJ4aaab/00jFrOsZg2cpioB/B6aSyrj+1SSjTOLB4XBomt1uTsH/OlFFlIl8RIxCEVU1b1zBQzUEz4f748CdvoNDCE5feMarbjx8G6Fzq43d+oj11Y0zEJAzPQ71PE9eeg3AAeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 127addcf-3906-47ea-c33a-08def180018f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 16:55:21.9409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WaaBWuS9WUbBs3bI0FLajBT71GYmzJt9io4sdJeVXid/wtq6P1I6qWvKMBIBlxrkw41N4QPzftlytKkQAGGxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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

On Fri, Jul 31, 2026 at 04:26:24PM -0700, Niranjana Vishwanathapura wrote:
> Extract xe_sched_submission_stop() + cancel_delayed_work_sync() into a
> new guc_exec_queue_pause_prepare() helper, then call it in a first pass
> over all queues before the existing revert loop in
> xe_guc_submit_pause_vf().
> 
> In a multi-queue group a secondary's run_job() can register the primary
> queue, which must not race an in-progress revert of a sibling queue.
> Stopping every scheduler before reverting any queue prevents that race.
> 
> No functional change outside the VF migration path.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8aaed4fd13ea..314747336fb9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2737,17 +2737,24 @@ static void lrc_parallel_clear(struct xe_lrc *lrc)
>   * during VF resume flows. The function scans the queue state, make adjustments
>   * as needed, and queues jobs / messages which replayed upon unpause.
>   */
> -static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> +static void guc_exec_queue_pause_prepare(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_job *job;
> -	int i;
>  
>  	lockdep_assert_held(&guc->submission_state.lock);
>  
>  	/* Stop scheduling + flush any DRM scheduler operations */
>  	xe_sched_submission_stop(sched);
>  	cancel_delayed_work_sync(&sched->base.work_tdr);
> +}
> +
> +static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_job *job;
> +	int i;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
>  
>  	guc_exec_queue_revert_pending_state_change(guc, q);
>  
> @@ -2806,6 +2813,19 @@ void xe_guc_submit_pause_vf(struct xe_guc *guc)
>  	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
>  
>  	mutex_lock(&guc->submission_state.lock);
> +	/*
> +	 * Stop all schedulers before reverting any queue: in a multi-queue
> +	 * group a secondary's run_job() can register the primary, which must
> +	 * not race an in-progress revert.
> +	 */
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Prevent redundant attempts to stop parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
> +		guc_exec_queue_pause_prepare(guc, q);
> +	}
> +
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		/* Prevent redundant attempts to stop parallel queues */
>  		if (q->guc->id != index)
> -- 
> 2.43.0
> 
