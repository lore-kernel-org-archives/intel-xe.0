Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD1CC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 16:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AAB10E499;
	Thu,  4 Jan 2024 16:48:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36410E499
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704386885; x=1735922885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cmaE6k1pNqEp8zOreSmYqPl8YVVbz2eapwcx96sYpWg=;
 b=e1jFkBS7NZLi2aAYLsD4XvSfxZ4fbt93adoCOfkEknlRhFXTwXEd7cou
 KbcSnar9FK4juEt/4izM3rd1+voU7oey10nLU6chsoDKRN1w8um/YsF4J
 ejM873Z9MyCg4gKPpbKveRn8HXchuUu5Vkpyo6N+8zy5Yd0DvQtPJfraO
 LiQLzn7qM4Trf3yNrPMsE+fLXcv1S1nUadHqy2brlZhOfJDvieGaYUTPy
 Bi4vSKDqiUUmy0kFNuBwK9RYmUjR2BimFSLnGzuSIZS460pr9B/+3zxp2
 s8uqPB3ZtDVs5oknu+gt0nExBHZkk52RhmJij26x3k+jYzXVToaJahKRz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="401082578"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="401082578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 08:47:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="22554907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 08:47:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 08:47:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 08:47:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 08:47:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 08:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiuOAxPm1zSfLbOpS5TORu9ARqR6vBSyAo+WWmdB7yO5YkanE+Q0JRqLAu1LTmsXqy4WixfxHxPOTxX4xmJLih8/cy9aHt5C6Ww5KXBbxr5oLbCnLPhP8ODalh1IotOzWDf2FFD36kjOuPGYKncuPcPFo+bqm7z6n65BjswfX3k9UnnN6NMM2t1w6Xq+ujRpHzeXFxdZrZUKupWBgEc//3KW8jDdgnsyK65UecQi5WF3XQmRTl3V2XSK455xeQ7jUAc4P9RQVQ/iB/ZLbqw7q8ROrBjKc7zmr9EH5ZA9MLXsepz5xmohoHBL/2T9ea/AIh2y2h/AU9xSPAPNssLtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RPS49XZFJ+9yzvF0bRWUjKu3EBa8QMo1E24jfr0ddE=;
 b=nS0hB3BLL8uvdAwGnEEPRc2bc2FtvuqVJJus6PMqSjqpTyRSFMMRRdYKLpdDb4sopX1Qs6xcADjPgdzKOTY7MM2DOjy7LQb8mD1l0ngRYVnQIB3qcT8/Ir8saiZr4Pc7LvKSrGAkUJJ7549mXPOZkS/eoTBn2d3mxzt8po6pA3MsRcYOdRq+9PhUnhFrpXzqPhiUypSt95XaJ6XwJj+seET9f2KfM1XWk8r980I/yX/K4ncPJbn/lIRdQThAA8WxiAn4lpj4fSo7mtn6NjhuNvAEyzVBZHd9sMi7ohv53k5Z3qaDKA+GMYsh1SpuBkoRYw0HlCeFRYQBRGCTq7GBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 16:47:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:47:40 +0000
Date: Thu, 4 Jan 2024 16:46:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe: Add exec_queue.sched_props.priority
Message-ID: <ZZbg+5FsDPhvGzn+@DUT025-TGLU.fm.intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-4-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240103184408.17844-4-brian.welty@intel.com>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 287d0a9a-6c3f-4d0f-d2c1-08dc0d44dd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DFRtdaVPUF3mlxRaKNH4G0bTavwiINpjVd7zEMvV2s2PAnpeDFIYxO4N/PPFQuixeJ81ua23YkzarR206ambNChEL8Cr6cxaWJD+D2iG/PUX0QEKiAFTpNYUIqY3Iz/DfRft8rlCTOx04BN4LELQvoglIhQ2o0QRkTNvPCk0sBXNwG/Xpoo1+qAn3Eg4pduo6/g22m7qe16DNEn0d0xNVluUOdqLEZSYgigpNsgFmywTvFeS4t/dZQSM4UhYAymuGFTpa709m6QntrIg9wId4v+uzl3QUbSjsecIIfEUJ12k3yA4bZxOveIeXFkAJmLrildN/UrSNPrcFraPlo/OwO3FmfcR2vJQbSNKHOkYQDK4FiUn8rM+sCTB+O+WuhItwWdX70l4e+fIIDoR1tmpReYKMiA8Wx0ystNyzfQI8TNMDlxmpXQkdYLZWMeZZlpqTDyCdxAgvW/Fip53VmU8gqZ97xNe4BYU0FYfgBADu456hosre4M9ccI3rdFzTmu/NdX5HKjQ1zzcd9IkA85lOrF1tQtrI4FPOdRXT8SqeKnhtsogP0lWxdu8VSc1S2gY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6512007)(6506007)(66946007)(6486002)(66556008)(66476007)(86362001)(6636002)(41300700001)(38100700002)(82960400001)(26005)(6666004)(44832011)(83380400001)(5660300002)(8936002)(2906002)(316002)(478600001)(6862004)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?janbweHkp+8NNyPAZkR9FUdl0Ua4Z2lMsylD6VCqw5hKONi+mbWKCxi+V/LW?=
 =?us-ascii?Q?vtv/cUmMtf6yOukHH4uSAhf9DKNaYQnsxcspVde/WbffYORaUy4y/RqmKtPQ?=
 =?us-ascii?Q?ArKOwHrdQkGB0Ev216FFfxk+G+GbSNv+XakDERDshGfNxwIeb8xitISjfXPo?=
 =?us-ascii?Q?UsDxzJvhwQ3npvgNzamp+AQFw9XQBOlW//fu0AF9eUbiCdmJmMhFbRBiHR8+?=
 =?us-ascii?Q?gnU4nomOYwzDysJQxKr6pS5WVr+r+yE9th1G84BNGbceHHZeRwk1wbB6tyjo?=
 =?us-ascii?Q?HSQO6O2Ac4GwZa1bQAa5t6Lgf/NF1sQyQbm4wZ1k69YY4I67kMxiR8HK00i1?=
 =?us-ascii?Q?/Ixwh9jt2MF5HlBU3CQYbT2yaesoIQAzN9GEmM0NfykeV0RF5LvOWchCGnDE?=
 =?us-ascii?Q?L+5GUCryjhqhhhU0OYSwOKO4gIfFPO5EGkhqlRODdDlMNEIBuBiCk9cad4pX?=
 =?us-ascii?Q?8k80dm7QmMGjsd/bvhPAB2TpdNoe0BsQUBrAs7S4m/aRwqhL4eveG4ZqauuK?=
 =?us-ascii?Q?mrnUz80BRhtBvOPPkvHGFABRhMbc+8D8OhYpnyc3zxN4rLRnlEBBCTqoBbya?=
 =?us-ascii?Q?NHVTC7SSQNw35g6qukj+/bqAW9hETSpB5GpS1LG+OCo3k7ML9WDNeGTCqtdG?=
 =?us-ascii?Q?b/t+sIMNZtHZ72XT1RVUUKH262IGRHWvqG9r/O+toul2aw8Rg6+vm4URHq38?=
 =?us-ascii?Q?kTl00FftxCbKTO18F8mmHQCcrv66kGjn1Lu0SPwqaXa4UKQ28av92F2gVoxt?=
 =?us-ascii?Q?rYUyUj2JPYDvW8SGZJ68UC0zpRJFmCQH3LzjWfzAn+O3nLN+l3stHMCo7t06?=
 =?us-ascii?Q?3w3B+EULqDjWqDoiXWI5+CfVuAZCsTwtBrBXpyhxAdca1jUUDg0U/p54ZbZ4?=
 =?us-ascii?Q?480BXCgcd+FHPI2js736RQDDbv59NsQquyoWA54GoC5/5KpJq/3iAIsnvyvQ?=
 =?us-ascii?Q?pO8yXn6gV59u0RfMJM39Qkp/oQp3GvKGNKdhgMBfCQ6Uh+J0Fm3XIIq35dKy?=
 =?us-ascii?Q?PrZ0TJI+P9nchdpwibqwJIViCbvf3Ehvft+NmfcoPJzvo/EuGB9qdyeUJmmQ?=
 =?us-ascii?Q?PIgLI68poJSkJqcEbiqgPfu6BDeTG1eeEJgStCyPkGZCto3P+4z+rPRP7YqO?=
 =?us-ascii?Q?JvByj9KPh049uPS1yL8v90ayGhmT2MTinVo9XYg5XXLf2rQH5ZDRCC4bMM6Q?=
 =?us-ascii?Q?YfYVcIj4ttYukZm2oYkaNzqP/iG1JAuZ0Lzypf09J0aa35yZCffUYdJD9Y3S?=
 =?us-ascii?Q?Yi82NQM3p9rVDKYsTrQwtjIKPZHDviQRZf6a8vnUaibJM1Sc7K3+g+j5jtgc?=
 =?us-ascii?Q?PTV47vBGMW5/MXFNhuzrYfD3hdbRAO+4LcFTFWNbme2bXPlmkkYKvCYU3PbG?=
 =?us-ascii?Q?/0WnUv+7iAzI47W4KKzV9vxDqY28LMLdKhG4FK+W4W7AjcTIgB12G9PwGoaO?=
 =?us-ascii?Q?LaMqmaH1mrfbNVv3j8E/OnTDJ4paK0Mdjp+rsq9yugaCWRmdli2d1fspiNQA?=
 =?us-ascii?Q?3l0BoPhzt0rF/saDQ6JWAVDuyOAh/xO1be5qdBao8MKDK2KInV0veIAzN3nB?=
 =?us-ascii?Q?W+fvsWqKYjAS25/aB0WhYmgFmWY7+CDBXJ/XZrVA0KKCynyx35zGl3s44fy6?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 287d0a9a-6c3f-4d0f-d2c1-08dc0d44dd94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:47:40.8348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLnSDX1K3fdP/kRxe4qwv3skaBOypdwyqS9hSdv0p+Fh/XVJ9BQPQH3M5pGErGZkqH4VvI4pconYcll/RjMtsQ==
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

On Wed, Jan 03, 2024 at 10:44:06AM -0800, Brian Welty wrote:
> The purpose here is to allow to optimize exec_queue_set_priority()
> in follow-on patch.  Currently it does q->ops->set_priority(...).
> But we'd like to apply exec_queue_user_extensions much earlier and
> q->ops cannot be called before __xe_exec_queue_init().
> 
> It will be much more efficient to instead only have to set
> q->sched_props.priority when applying user extensions. That value will
> then already be set to the user requested value. So the setting of
> default value is moved from q->ops->init() to __xe_exec_queue_alloc.
> 
> v2: fix existing bug such that q->sched_props.priority is now set
>     before guc_exec_queue_add_msg() (Matt)
>     fix existing bug in that xe_migrate_init() should use exec_queue's
>     vfunc for updating priority.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_migrate.c          | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e78b13845417..9891cddba71c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -67,6 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  				hwe->eclass->sched_props.preempt_timeout_us;
>  	q->sched_props.job_timeout_ms =
>  				hwe->eclass->sched_props.job_timeout_ms;
> +	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 882eb5373980..6ae4f4e2ddca 100644
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
> @@ -144,6 +142,8 @@ struct xe_exec_queue {
>  		u32 preempt_timeout_us;
>  		/** @job_timeout_ms: job timeout in milliseconds */
>  		u32 job_timeout_ms;
> +		/** @priority: priority of this exec queue */
> +		enum xe_exec_queue_priority priority;
>  	} sched_props;
>  
>  	/** @compute: compute exec queue state */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 56c0a7bf554f..392cbde62957 100644
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
> @@ -1301,15 +1300,15 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
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
> +	q->sched_props.priority = priority;
>  	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> -	q->priority = priority;

This probably should be its own patch and maybe with a Fixes tag too.

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index adf1dab5eba2..f967fa69769e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		return ERR_CAST(m->q);
>  	}
>  	if (xe->info.has_usm)
> -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> +		m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);

Same here.

Otherwise LGTM.

Matt

>  
>  	mutex_init(&m->job_mutex);
>  
> -- 
> 2.43.0
> 
