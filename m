Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4722C3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 02:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9791810E08C;
	Sat,  6 Jan 2024 02:01:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B729310E08C
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jan 2024 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704506476; x=1736042476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DyICVyQdzHdy0QZ98AqJZzq+/V1lxnWGWnvZFDRQuXc=;
 b=Emw6YKRnHaLzFaJUeawxeLpjLp3Iy6v9A/VmyQ6JbUSjknR2kRrwe/8Z
 G5ECz/OC2GKFqXOkQC+QJ7ofVx6RRF0JGH5BJP11IAUT3vag+erQNe8jR
 83Q8tlb3w7AcWXCGc6wG2Tgc/v0oMSyxMA6X+/CqL+qR4FeGAqN0ww8aU
 lFd46CzmMr+7Ta1kZkabXRxn/dkhIFpS94BJdwJIJftOddP3g0Ntd9mdy
 +B3dyKQOSVGGITERvYHZpo+AaarJ/BY9iUXE6RyJ+7Glpdr0O3Vgedt0P
 maTbNKRlFzmgdO3DMJzhUuIoDvYjVhzfmt9/E6qgvDwhUnwjTMbjjaFAV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4396482"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="4396482"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 18:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; d="scan'208";a="23001686"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 18:01:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 18:01:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 18:01:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 18:01:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ukb6RjjpVg9zvzvDzRfgdaOw8FI+7+l2Elyw92j46AL3jOtI9JLKR1bq+8/+UMerME1WfR0eNi/WlLsi3Vanky96D3tn6PbTc4zpfCW/VeLymd2RzbZ0j3HqOgeOdLAE2HoYYfthiwCvkeFofVaCuTFPKzDvf3hpDhf1EDVTR8ahL/AwcOJ8xwoPkd6owiXj4+UdxdkMs+0gczNFwzY/S3pP4hM0Z5HLPtIF5qPufepIcoLPj14rcRgcZkru8e0XzMVEHM81cfHy1vgYSMjkh79bQybwemaHR+HOBaEmZ8WEuatbv5Pne/PMI/QwfZlKVQKqQ+jRw2JgmAPtHXhB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWMu+xZKtZJ7I7Z/Q//6yHmbnQYlt7OOSeE6bNtnHXw=;
 b=htuUMG7hE8zQ7VhwvSoQUyDojw7nCMB4ZakouPtVV42ppVPpuGCD2KDkSdNxZ+RsnppsaDYZsrzXihQbIg2kcf5/dljEvgOCgmQakfm0VSVh7iwEEwFcBhlvIB2oeFpt7FS9sf2SqAg22dPhDfPfQDXJLUY14/oKTryOutLU5GPQwcazkdU09ZRN5qTTUjEiNahcpuDdADTTVSrE0DoY33JY8qNCwn+8f6VyCSLAbpklfpD8Ka9GN4cpM/16h7qAUaGK5triGddstbmtPH0y2sQgn6JA73wvXqmpBo2y9JbjfBNDcuaddshVVjUmTAp/eXMDsMf6Kh4H2y4PUbknXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:01:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Sat, 6 Jan 2024
 02:01:06 +0000
Date: Sat, 6 Jan 2024 02:00:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Fix modifying exec_queue priority in
 xe_migrate_init
Message-ID: <ZZi0K2oLRJrVDWXS@DUT025-TGLU.fm.intel.com>
References: <20240105190440.9908-1-brian.welty@intel.com>
 <20240105190440.9908-3-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240105190440.9908-3-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8ea51a-f0a6-4686-3429-08dc0e5b580c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooOCKIqP79RxZMKvh46XLyQrWCzwLuOtTOVvouWl1XOcsR8ulSFTeObuekGgb93Acl2tXKi+LdGPa33AHm/1I/RIdMeE4LLcYCNRBPbqxhdB8RCoCTX1iHNmoMxFBpgtQpnX5QAnF0FcC9o2bWL3VUoN7W0xOCEV/GLGlJsa27Xl1x/V6QZxRovklmlOQfrM4PnPHEj7MG+4Rp3/WFTyFfkDQxMf5yIl6pl+g3z7ztYpQyBGY9r08I08nMFPeyRDqH0R8siAvfIewNPkwcHOM8iq6B5uxfWQcjNiN3zoyPN+1uv0vOD7E9r8pchHC+lXAUtLhQGvs/gqGjzTPNSI5hNgrhMSlPiLIq7+SowSEKVimROxEFyFT0QR2MlkzztyT5+AISqFbDg7cShDCrPsPMSZmoGy57FZ+kTMyZ2HNe+dcAcaiBDaVN6JsyMD7yko0VNeAHtsEObSxIoF6/wFtPqstHbAM6KheGfuoeDW03uDrGa8lhQ9FZAVF5hGFei7J1l95jSdnzbxmP+QPziifnrnUX4Id3ckUPFrn7lEamZTinm/7lwj2iyxYVBVvu4v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(6862004)(6666004)(44832011)(6506007)(4326008)(478600001)(38100700002)(6486002)(26005)(6512007)(66476007)(316002)(82960400001)(8936002)(66946007)(66556008)(8676002)(6636002)(41300700001)(86362001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kWJDCws5F0H+C6qxpecHgX88KHpdJjDZdlAdxPVSWPVqky48Fd/NEy7F1K9?=
 =?us-ascii?Q?VPFSFM0PRq1MGgrFkfoTskA8W1Typl88+m6A/8s3AbYUMqJwVw6jIOVHbRPc?=
 =?us-ascii?Q?9xb7sFowDP6IBlG2zHnzm7lzdDCUqdrSXTVR9+XTlIsUpTuKOs/gyMQ39A/Z?=
 =?us-ascii?Q?djhm7Tdw20X4GSzh8QNK6bIbxp/ADaNaNMowHFKCGlRD4kjmOs5CIbm+zhaS?=
 =?us-ascii?Q?O1YetqthTlNEYb7JePABu3LmCqYzDaYB3RW1Nn3Q/S8c+jWukgyGDDEfQpdy?=
 =?us-ascii?Q?zoo3u78NvHZszF90tHDu/mz+w5Ge7IebjldyzHlsq5Mwhr27GC2s/2j7NagT?=
 =?us-ascii?Q?8jjQl2pLrY18rcWeAs29NpP2A/BHeVa7bRznH4p3x+gp3vmD0ZV0GhGvfZpY?=
 =?us-ascii?Q?4r2jdnUnZ/vclFlfQpIgOqHW+ltpiP2KExq2HK1VF1L1+O7oHU+lWGf6DMbS?=
 =?us-ascii?Q?C9XosqH/EJun7wGpjc99PSSSc4xZi5Fe2wzoxwGvYBNePTa1OKLT0lxpwlTr?=
 =?us-ascii?Q?PWTtEj/Pz6iGfew367ubRzcvFatUVGweb4DOTJOqiG2b6/ke0uSbDRDRorFz?=
 =?us-ascii?Q?UxrX0uQl/TsFabe5kRCgVcjPNyCu3Bfyj83TJjTPWRH2hb7nNbM1EVOnHp9o?=
 =?us-ascii?Q?hpraKoHrTTPUdd6zI35vEjw+YbN97Sjg7WkAk1srrwM+1HZJVs0e9i+EqCw5?=
 =?us-ascii?Q?CUl1eXUkyfPfeweTlmEtNv9skYvSKPeIGVUS+a3RweM85ooOFCcZvmDf3kSM?=
 =?us-ascii?Q?UG5oQZbbhfes/zMj3dK5ES2iYntuLlNz0K7Ms70ufqp1nQEFRDMPC9kYEvOT?=
 =?us-ascii?Q?xMIzvdz8qujhr8HDj7wVjr96I3hFMQkYVdmlPPwZljxAmnV01YPYziuNw5aG?=
 =?us-ascii?Q?hdZh/i5cbrPCn2nSOb5uZ5Atv2jb9BfkHM2Hd9T+Mlk/4ozfw5LV7iLcO3LQ?=
 =?us-ascii?Q?h3GzhKeU0+fAwGT6himRYFaBcEJCUrl66OFP0tQOWZ7QUD0Oje66yt3sdC7f?=
 =?us-ascii?Q?fRSHNVB1snqlU5GhNxaN6Cm3cjWBfRuPcqqU3uwbZ6AX5+COwbmV6CxEza8p?=
 =?us-ascii?Q?Nqg6Z4N1N17bqqKrdc4IJY/46N0gO6dcvf0Y1MUaWbgyxZxs6Ryvb2eHp4CB?=
 =?us-ascii?Q?ZTpZmWFGrktIrxsGi/J0Hx6bXd7LBee1R7k41/DEDTtIUNRI75yCFMPSRmI3?=
 =?us-ascii?Q?wdR1uHrW3NAZobHb06pZfrmOrGL18P5W9mRHI54DaN7F7EVqQs5gTAQF814+?=
 =?us-ascii?Q?g1oW9lpU3YzanXA6mSAIyjtuyXJF0bdo+0eI6ern7ravbBOEaAjgfENlSch4?=
 =?us-ascii?Q?5VYXL3zj9CQSaYk/7rq7jxoIKTmvv9l6g1fb9IFTVKRDN/v9BY80a3/ad7g9?=
 =?us-ascii?Q?1fUisNqr9uEnK3+v1hDqFCY8CQYv8nShrCBTbR/F1xhh/bjPpAJo/99yz5ND?=
 =?us-ascii?Q?25GkFSlaREHehAbHN0fpw1GM0V10V4CetE+exs4hJYYv1e11LZD0wr9+nh/1?=
 =?us-ascii?Q?7pPOnn0CD1dbRVdzBuzKrL4WyIkJVhqkovF1itp6dxmu3WSe1vYZU42JcW28?=
 =?us-ascii?Q?cRH1ehzHyHxQRzlN85GBOKlvs4GTlfVC+RH2qEYh83BvDrfz0wRgJfVrSj+S?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8ea51a-f0a6-4686-3429-08dc0e5b580c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:01:06.3046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UQNNtvB7HlDiYVJ4jRvQZzBkTnNtCSqKZ32Y1EoRx3bJgN6W9cwtxODBNWmhkossmnrm9VC2tG3uba8dCNp0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

On Fri, Jan 05, 2024 at 11:04:40AM -0800, Brian Welty wrote:
> After exec_queue has been created, we cannot simply modify q->priority.
> This needs to be done by the backend via q->ops.  However in this case,
> it would be more efficient to simply pass a flag when creating the
> exec_queue and set the desired priority upfront during queue creation.
> 
> To that end: new flag EXEC_QUEUE_FLAG_HIGH_PRIORITY is introduced.
> The priority field is moved to be with other scheduling properties and
> is now exec_queue.sched_props.priority. This is no longer set to initial
> value by the backend, but is now set within __xe_exec_queue_create().
> 
> Fixes: b4eecedc75c1 ("drm/xe: Fix potential deadlock handling page faults")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 6 ++++--
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_migrate.c          | 5 ++---
>  4 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 44fe8097b7cd..bcfc4127c7c5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -67,6 +67,11 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
>  				hwe->eclass->sched_props.preempt_timeout_us;
> +	if (q->flags & EXEC_QUEUE_FLAG_KERNEL &&
> +	    q->flags & EXEC_QUEUE_FLAG_HIGH_PRIORITY)
> +		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> +	else
> +		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3d7e704ec3d9..8d4b7feb8c30 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -52,8 +52,6 @@ struct xe_exec_queue {
>  	struct xe_vm *vm;
>  	/** @class: class of this exec queue */
>  	enum xe_engine_class class;
> -	/** @priority: priority of this exec queue */
> -	enum xe_exec_queue_priority priority;
>  	/**
>  	 * @logical_mask: logical mask of where job submitted to exec queue can run
>  	 */
> @@ -84,6 +82,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_VM			BIT(4)
>  /* child of VM queue for multi-tile VM jobs */
>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> +/* kernel exec_queue only, set priority to highest level */
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> @@ -142,6 +142,8 @@ struct xe_exec_queue {
>  		u32 timeslice_us;
>  		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>  		u32 preempt_timeout_us;
> +		/** @priority: priority of this exec queue */
> +		enum xe_exec_queue_priority priority;
>  	} sched_props;
>  
>  	/** @compute: compute exec queue state */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5de3ac47c462..54ffcfcdd41f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -421,7 +421,7 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	struct exec_queue_policy policy;
>  	struct xe_device *xe = guc_to_xe(guc);
> -	enum xe_exec_queue_priority prio = q->priority;
> +	enum xe_exec_queue_priority prio = q->sched_props.priority;
>  	u32 timeslice_us = q->sched_props.timeslice_us;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> @@ -1231,7 +1231,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	err = xe_sched_entity_init(&ge->entity, sched);
>  	if (err)
>  		goto err_sched;
> -	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
>  	if (xe_exec_queue_is_lr(q))
>  		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
> @@ -1301,14 +1300,14 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>  {
>  	struct xe_sched_msg *msg;
>  
> -	if (q->priority == priority || exec_queue_killed_or_banned(q))
> +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>  	if (!msg)
>  		return -ENOMEM;
>  
> -	q->priority = priority;
> +	q->sched_props.priority = priority;
>  	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index adf1dab5eba2..02fca8f9adc2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -344,7 +344,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>  					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT);
> +					    EXEC_QUEUE_FLAG_PERMANENT |
> +					    EXEC_QUEUE_FLAG_HIGH_PRIORITY);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
> @@ -355,8 +356,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		xe_vm_close_and_put(vm);
>  		return ERR_CAST(m->q);
>  	}
> -	if (xe->info.has_usm)
> -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
>  
>  	mutex_init(&m->job_mutex);
>  
> -- 
> 2.43.0
> 
