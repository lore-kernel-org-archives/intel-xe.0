Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C8BC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 08:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73010E26E;
	Wed,  3 Jan 2024 08:12:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4710E278
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704269522; x=1735805522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aQG0fBZBMOv9Ipl6zEcQX2nqlIknte6WR2AANMd/WT0=;
 b=QCn0FTwGSTmFN9s8o93HHf0hQ0zOVdGFG7JjwSJKZcrrW7mHqYcQ4+Ao
 77xI0l49+O9JpaWzXiMJNKiAzxsxm3yLP8m6noUJMzlQyCoGtuPF+bMr0
 oanfy2zNffgKjeEf9C0NWKTryFNCVJ7wxQHDhIh74qeOvToxdl+8NHKU7
 PQnwFvAZ0uIvtUzh7ky1w1tcObRQx1e1cfSDn9+15utp78uG8QjOEAf+d
 I3DuxTxu+WMAzbTWNl3pFkP6F+gSdbm+ysMzXLKPEdkt2wmhkRatSYw/0
 WcrX4Hoe7pgcddxmbib+rqXbzsjPiH5oe6jJ1435kM7QisMl04FzEu1kQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3780716"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3780716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 00:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1027006514"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="1027006514"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 00:12:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 00:12:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 00:12:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 00:12:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2PqikWhlbJGx8G6XdEAGzkvn4c8Bs4B/2DjJLXV5tAMQoFIe95djvNuYu0r4FxkEsKnj+Gdru0+Fm8gq5LptzPNVqyo7GVgEauKzQskI0AtRRnKKoZodS9eHdQHcGZ4aY7lDfZSGiKapo3c3gjq81zWGgxtxmGOz0KLJ/D3GPMocwWA+gnq3kFNrn5IRutErhy1CMjHKbi5CCLFUdPGMHKNe1MVWQa0kd/UZfuRzLGODZVwvFCu8kLrmp6nMdtr4JHoO925eRWgYkiO+XMi7+ZOU0Vdw2SVo6Z0ZjQ5J+SMg9J9zBwqMLHkTF2jhnqcXNaT8vhZ3KqSH+6/WztIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBgfImG1VlovCCGQn51MF2vHrSF5jdUSzq2ztRi/MqA=;
 b=G9pT3ZDqjT/fQJadUU2PslpHj1/DncmpwSoifYEj6D9+qIMR+pL30ci1Iq0UluQEnQcojeK/T4oypDxsRUnGOXLjq0K6wFKjFJk9+MzgPcGrALycR81kCJbZ2l6xC/LwuDtN0YYBT26f9KBb6hUy7rfnK/aNOl7+7Zi+kFv+qT+MY23zBB0Bl6u9As8dqTklPIzTlZ0bCP9m+nRKMq1hZtX0AklyNq914hJPGaqMTu4V8VMluZzQA+L2zEIXljK05OZpIfAcZf0LChAoz5Va29Sdgr329stCJgk9wtpaIsdSKxbW1sZ26YIj4MxkYNMAbYXJwA7aGkRc/TJlXt9YNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 08:11:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 08:11:53 +0000
Date: Wed, 3 Jan 2024 08:11:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Add exec_queue.sched_props.priority
Message-ID: <ZZUWuCOF5TedDHV2@DUT025-TGLU.fm.intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-4-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102211731.6720-4-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR05CA0113.namprd05.prod.outlook.com
 (2603:10b6:a03:334::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 263b6280-0831-438e-e92d-08dc0c33a537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3liMweW5BG2NK2pDsqnBcK5UX60QZzz5mJZZLsQQ7LlmtIyTnIFRC/AlN8rLEgQWgAOLU6Idl9cpPv24KjQjrkHThz5DW//Uf/O+OwpY2dGgJ15cvBHn6Pt6YRF2Zq72VKGb/xMHA5Y4hwbEQ3QFxCDjWOaB8rDGLc9+d8TAik7w7TBj1ts4gQw5GRDNWnWGTrFPywDCgacHwy0Qc5leJh7044ai2tER6reYX4GayY3bafip4ogCl7VGOJoeghw80160tQbnKUVxmSj/C9lICG6vzBh8G1QMeLAaIJkTWu4pD/XOPcJoKysonG8TGtm73b156/Z958UlzbNcRIh57HndVsVLG9ZpbdfUOlz1G5+YIhEe3oKEG6xeB3w2mGE8j4fP7pZcpS052GELfS3fcL1IoAqorIBEhEAjgaMgKDiz9Q4oFxizVwlGMu8HGUIBoSeBxnv/0BkI/Ykh9yJMZ4MppRq6ndhslq2Gm09UszDXxGLZ2XV/9NxRvqDLMwiJ7Rm8OtgCceaItD53oIlik7o3kIwvqrUr6cVOPsRE73ZRnODq9Ul/tG/wcdhgiv9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(82960400001)(66556008)(38100700002)(66946007)(83380400001)(66476007)(316002)(6636002)(478600001)(86362001)(6486002)(5660300002)(2906002)(44832011)(8676002)(8936002)(6862004)(4326008)(6506007)(6666004)(6512007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TqdC/QiGBS3YZJxQYZLllvnHSBKw2dGnONHfShs1H83RoWbIi7pq7ea2BHZ7?=
 =?us-ascii?Q?xufi1ms5b0osZOCoFYWLoTcnvVYSi3bMCSjgAuPy1uYx3QdVYzYFlWMNX6/A?=
 =?us-ascii?Q?HcPHNvrK0QrMQ+IIB0KGdBRph7DxO+TH/3Fj84V7nF4IYj0zOonSEp3qSEkv?=
 =?us-ascii?Q?/PX7ewntLpYnnRA6V984lU8OV3bCmhrNTaWGHfrTWwCSj3vTqsxfH/Y8QZDm?=
 =?us-ascii?Q?hQWjSRLIFmb6WOzmwWMsRNwJ8XedIQdM6mDelu93oMiNGUGyCovckFXZ/HMj?=
 =?us-ascii?Q?btrJP7yTNttP8pLSQjD0ur2isayQIraOR9S4BtP06arA7gApuwv+mIrLAxme?=
 =?us-ascii?Q?034iw+KPYBc4Bey67geOElWBBCIqQyVegzeEwhhY6BnZb2V2ainM35MV7tWM?=
 =?us-ascii?Q?Yt1l2EpqV25IZSM/aWbyAqJhkHijJm1RxEdCaP8urXa0fvxEfyq/ygdctyFv?=
 =?us-ascii?Q?Jr5g8y1gRdUNRsQU+dmw8I94UOPpZ4LRU+uz3BCeapVhvGVzU48l9Qwgmh1M?=
 =?us-ascii?Q?SvuuXqnWdQ7Sr/ZO50Z5/CcDxaYGPu1tCjj8ZG7V0h52y9RjLx/KrGje4ERv?=
 =?us-ascii?Q?vIZhhNjxfs+wjP0kc1W78WJwnh/J71KRhUEvaOT8wEwj0gn2ZDTCnV5mAQcn?=
 =?us-ascii?Q?Bx/iXYN6v88DtxUxFawzybHV/wbGscWRcfp36KdIut1YcUZy32Alo5gLuqfz?=
 =?us-ascii?Q?hhq16x5vpgrCeeGK6jd3apCZ6/4yljtdFbdbHJrc6SzQ8eVmXRTXRFgD94IE?=
 =?us-ascii?Q?0ICC3gdTh+QEjvSMLCGksqH122d4KHrCqlamHgRlJdLTNnDvWrWVFvSnepC6?=
 =?us-ascii?Q?xTPcyt6YbJi8oSjQ3fFuDNzXdFJW2yMBfh9kdLvV1/qNyiAqie3iXcyT2IAI?=
 =?us-ascii?Q?R5S54cf6op/cBv9FDh+rZ2lmAwQwf51nBI0yBh0hwE0u4tb+L32nLjXRctfs?=
 =?us-ascii?Q?2UHaN94sk+C0gc805p7IesB4OHeo2ErZ16mGxsTMMOlzcau+IM2IUYAEQk1+?=
 =?us-ascii?Q?ke7GBv2Zy5Gb/CZ+Oh8dWHTe70LtSfl/iVssbeKDdsWbIrSPbHARPpD64+J3?=
 =?us-ascii?Q?gi8T0BZ5SkOw/Ehrrx6al1zWS3yH+1h7y/yG67ijUae72NenlaGWc6LrHWls?=
 =?us-ascii?Q?YGNecbzu+KmhqYKloUpW8bsVhz2/vmgQumlPlG9LUqnJnXZnn9cQnZ11zBnQ?=
 =?us-ascii?Q?kbJB654IcOo+epgX1KP0jiVvThsiG7k5Gelf04hwB2I5kR4KlnApKRnJtq68?=
 =?us-ascii?Q?W+sPt7Mykdf62XZAT0ARqRevLdKuoAQ3tsywGRqdkpzgJHo9QahoJTsWeOXo?=
 =?us-ascii?Q?HFq7J0rlKjfb0U+DzXCQqEHrDyfaktXZuEyRozqtU0x33iBDjh1l1OKXB64O?=
 =?us-ascii?Q?VhYxgmvOvGfz+ad+4j4CRFumbrPp9W5xpY/KrQnjN2WtTDO1741oqOi6zADA?=
 =?us-ascii?Q?3nWkRxol4AvyO75NbfHFWYTPoXMWK86sxEYNUPkNMLK+uIuHgYrLGSVC7tCZ?=
 =?us-ascii?Q?lrhgdu/CuvTCNPFfdUXOguQ8z8unE3bZliVswAJU9VJsm/WANbkdHn0VGy4P?=
 =?us-ascii?Q?jwbiL4Xbu60qKgoWNxTWF5Er0gi1k8a0dCZDSCPDjiE+fCTYKoqSahsgM2wP?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 263b6280-0831-438e-e92d-08dc0c33a537
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 08:11:53.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZVvqGwmGGaMar/3wD2fj6G7yTdqVfhB1jkOstgScL0KI3WGWCYrXavYlWj5W2aE7hL6UXdGXaGvEH1/7IA3Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

On Tue, Jan 02, 2024 at 01:17:30PM -0800, Brian Welty wrote:
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
> index 6cbf41ad9c8c..0bd79089b633 100644
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
> @@ -1301,7 +1300,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>  {
>  	struct xe_sched_msg *msg;
>  
> -	if (q->priority == priority || exec_queue_killed_or_banned(q))
> +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1309,7 +1308,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>  		return -ENOMEM;
>  
>  	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> -	q->priority = priority;
> +	q->sched_props.priority = priority;

Patch LGTM but noticed this is an existing bug - priority should be
changed before calling guc_exec_queue_add_msg. Can you fix that in this
series too?

Will give an RB on this patch in next rev.

Matt

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index adf1dab5eba2..6567abcb3c6d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		return ERR_CAST(m->q);
>  	}
>  	if (xe->info.has_usm)
> -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
> +		m->q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
>  
>  	mutex_init(&m->job_mutex);
>  
> -- 
> 2.43.0
> 
