Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F6CC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3DA10E06E;
	Tue, 28 Nov 2023 21:25:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6878B10E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701206731; x=1732742731;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yjGSLDclFeodHb9B8MvkoUZc208FW4nll08VZMWVOtY=;
 b=eE31Z34fdftL1y8hgfERrfT6w234aLWIdZNuGufMsZfIGjn+P8yrkWxA
 hmKoqdULpo0UEi0nRfPuWuXHMzfISUK445P2L5w0QnsH9TRYl+txI9Iu5
 mTTAzvUT7cPJ43u//vZn1b5ZUO3RPoXhNlrblcYsyv60Sg6jcqQ4wRi2q
 SMrOeQf79NNJ2uRcuS4YGKYC3g1e8zQ7tUpFlFnZVJ14yGxX9N7b9RQ3W
 96lfXsdKFbkWugUEvJAb/+R8nRBogWGo0N0Tun7QK1//MOcDigYP0WT+w
 rl7THG/tO2zi2oozO9r1rNFEJOuhMkt5UnDseMWiBifz9xLfrrYugWUZf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11731781"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11731781"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762064500"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762064500"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 13:25:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:25:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 13:25:29 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 13:25:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIS6nLPnSdxEE7F2bMMlj/rLWy8VAdZePyeaRSt1DRdj4rQW2u+DE2QEebJF+Rn9ERRt6wpjsdXzFiQIDSaH/F3wkvS3y7fhSlhgwh7MmcYUdWTl1CZAW4ds9loGc4OaDoTe4qcErunp3LJ76BiDySpeLJjJQqDG9rU3tWiz/QKc6DkZQOMhA71ExbS3fq6UFinn9pp80os5TNcaLAFN2AArxNn+Llxm0tQHPs0CICQCiW40QwwGCQ3bPVTRxlZ2rp6EeUGobDsRCgmGC5AKSVfPtRkdRWFLbtRTDzuO8MesmFTqx1qWx/lJCW+/GOsvBxaS+v7AkCdW3fb41ujaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LAz4TPS+PSrTyLrT3YhW+4RcO4RZKq5BCEgHb3cNbk=;
 b=jabl+ydQ8dNEJAYxDa+Kj0myowfYmWsjxsyGhIWNO6T3OQ0LAnTi30W2puFFmgTAGXpBfoQM1yAI2L4LYpExnZ/aCtwXwySvj29e/7koUpieSzJbRxwYEX1sQvvVtEBcq9QjBmXtmHwXPHDwwmbisFBopxskxRGUi6JnTNKPcycEKlxIcxs0sZVLs2VQsdQ5hgC92yxbzzJmHF2W1lqvZXZhT/LmLYgHLIPDJD0j65MFF3Q2jPpLC93tGm/9yJGvSbS9YCyvByMAE2Mmg7JRbdis6+Cw8w8KqTAliaMc/GGmc7EyGiVpBhmNHvJMcY/MGnxQ+IPzt0730KsEG2njSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5510.namprd11.prod.outlook.com (2603:10b6:208:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 21:25:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 21:25:17 +0000
Date: Tue, 28 Nov 2023 16:25:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Oak
 Zeng" <oak.zeng@intel.com>
Message-ID: <ZWZaukdzs0chi5LK@intel.com>
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5510:EE_
X-MS-Office365-Filtering-Correlation-Id: bd81cd16-a44b-49d4-8232-08dbf0588465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+Jj2QC9phTcUg9cEFC08do8tZELFUwSDUFKmyaCeqz1TdGqvTx4T4000PjRWM8PvXknkHk+FayfngzE9qpHwVizJ3+2Eo+MTYbQjmAs1CKEYhvHbmLYh1SrN7XpuM1eSr+hcpB3aORsYW7+kMxTgjnmbIZDAzyv1mRzgljMv+2J2Vt+W1dZcfScft83xqxf49DH2/C3L9KLfMKXwTUg5huWx5PLjbmIaP+lkd9sEtAmrT9VZCUGEoJEy0AhdUKHklUParI5sk/1uFsx7usLdGvS8GnvB+d/EAoVe6mS9zUzKsS7CfOxd3mNoKgk6oUKLrHzcPE07IGBvG+2Yt+lM1j9qrlXLcEXuP3C6H53hxZoQNCdSF8THiattql2/il+U5JIPYmk/tKa7EApFZoPr6MgHotbrcuJ5AeCSf5aA8KheC0pwGMKxtMKpXkLMTa2rwGvyuxZTHIqwuuxuDnr7Jx3WvJfPAmbdbDoJgqIy08N22NcnxHGVIU0lUI3ZjRzi6OajFeuXQ6D5JEVacAFVGOMcnmLbA0qmK6zxxPqmCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2906002)(5660300002)(44832011)(6666004)(6512007)(41300700001)(36756003)(478600001)(4326008)(8936002)(6506007)(8676002)(38100700002)(966005)(6486002)(82960400001)(2616005)(83380400001)(6636002)(66476007)(66946007)(86362001)(66556008)(110136005)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y0AJXekGaNff6RndRO6E0T+BFVQjT5LVFQl+1mWgSdUVq6mWO/TFO8LplwSD?=
 =?us-ascii?Q?gs3erbJm3OJUe+ippLX5/lqIG9b1fBLQ4qn8UMJVaFcOCPqFIUX6I2nFtqxe?=
 =?us-ascii?Q?YKqJMTR3dnA9WInKtHRazajoF0hNNZl+PAZGxb86HDb8I4chTLen6aOOeRrW?=
 =?us-ascii?Q?rb6FSENORnbAazvl6O48bB3Gg+nBAepiTJj8qFFMyf+vb4TP7DZi0L93UD5A?=
 =?us-ascii?Q?UvzT9k0Y9+pjf0PY+MYMLzv6T+CJfrGWp9BMfuqPolNEq6DM4BIZ4okzlP9t?=
 =?us-ascii?Q?StmWEtaooXShUgFvAk8l7dXD44LPoowoLEL/V7gON3bMNs8jcwuyJfiZotkZ?=
 =?us-ascii?Q?qQp1a23yFvkC1T+mbnHgpkXqaHPlsvknv3t8DiaiQIq5rSZXpJIdCn0OWrE0?=
 =?us-ascii?Q?cyAtt9q7mMh74m/3MUfCtDI1G4Plp6mP5EtKEKHwH4PUr5XLOpo5wqcDYe/y?=
 =?us-ascii?Q?Ln9W5nRo2bTmdmP+T/BCJ3oZ69jpEsMFJIvlniTB2aPvkekojAobkPEgMKWN?=
 =?us-ascii?Q?o+A+mtI77D2wS1ATBYToWdtQ1seNZLceyTmeNwnrrlrfl4Qb6bv5U0dbe++N?=
 =?us-ascii?Q?8a/S3WxlldRbyvvlqqCSm0l7nQIlsYPJWFjHQxg34K+vq3aHNJPV21W571wK?=
 =?us-ascii?Q?tBDOeINlwU9NqZ6xqBQop1/c9tSmIN5YhggWUzbVJ46a5KbVx31MHZZ5LsJS?=
 =?us-ascii?Q?FR/8e2GAR9b9ZtXIvA0BQK2R8zVWXa81Fz5QRgrNN3V24vkE7VhRHjx6T6Qg?=
 =?us-ascii?Q?75NOAMGKlRjN93U5zsZt2tG6hfkulBVuwgyAUdjiXJxG7tQ2AfFQfeNsNm9N?=
 =?us-ascii?Q?YLGP+L8LJ6h9RTrHMkLok4RP3jpLTgtZw2gUi1Bt9TMdylcsAOJDntNkPDrE?=
 =?us-ascii?Q?9kGsbkuP3g93/sMCS8BBUweeKcz22YGMnTGO8vaol8+bXEhql+KMDZ3N9R/S?=
 =?us-ascii?Q?rk7eQMpYDG36FwF20z8J9dXV1cUOUvaCLcgYQgzjgVHZxKaRuQQrFBn1KKWo?=
 =?us-ascii?Q?GQabEojauKVtorwexoxrA3WcVO/mlYihk7P+SRRqVUId8bBDPiP4Mo9d/jzD?=
 =?us-ascii?Q?iruxCbR0RUSIVaqVxsI5YPis9LUgTlGnPK3do6LTIHEZFvyKOC0CwtwaaZTQ?=
 =?us-ascii?Q?D74/BXpoA/gjj+xk5SI6r3q63Sz4ieKO8qQ3+dH+4GkRVnLsCZ1EjmE2jgAM?=
 =?us-ascii?Q?E3p8pHqc/7qewdzoGIr8XTiZGq8gs7lVaXORX1dO6dwayqUO8SmFLS50W+HB?=
 =?us-ascii?Q?bAzt5E9+xS+262tqioOL7NEvmn7USpZCQXKFIzRSyd1TPh6/dPZAB93eAZuO?=
 =?us-ascii?Q?f7BuSHy1efJ0Cg2PdMU3geSRBd0Tb+NbxD26SYamfLmBR9rqJAUEZhHBLJa8?=
 =?us-ascii?Q?rYF6eJiqimPboktLUJSVdexeNRMe9gyFMsy1cLNgFlle9jS6P/NknVd1Vr87?=
 =?us-ascii?Q?A1oggkixySGE09RK7XaIVgSmYSY1x3mGJMKlwkfdf19omoXtOE0G9GGDH27g?=
 =?us-ascii?Q?CQgvK/IE54yu7b1UzGOQdU0pyKrb82TcyapF1d7LY1z7qgazmKC4qO8gbdA0?=
 =?us-ascii?Q?Y+Xr/v/ZEGKxj/231MS0Ry8Zdzx3cHeRbjjmw3KAR5Suh9Y3TCBHHfqiaMBG?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd81cd16-a44b-49d4-8232-08dbf0588465
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 21:25:17.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7X6KktYuEqtgLhT7yV4I5RoZ3cdbb36hhGhLSkJmOssUaDOgtd5hWG/D9MIdSSEL7xxzFq8JzPHMI5w50i3KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5510
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] RFC: drm/xe: Return correct error code
 for xe_wait_user_fence_ioctl
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

On Wed, Nov 22, 2023 at 09:51:42AM +0530, Bommu Krishnaiah wrote:
> return correct error code if exec_queue is reset/engine is hung
> remove the num_engines/instances members from drm_xe_wait_user_fence structure
> and add a exec_queue_id member
> 
> v2: Addressed the review comments
> 
> Need to validated the changes
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Cc: Francois Dugast <francois.dugast@intel.com>

This patch here needs to replace my patch in Francois' series:
https://lore.kernel.org/all/20231122143833.7-12-francois.dugast@intel.com/

I finally saw some sense in some engine information in there.

Brost, thoughts?

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
>  include/uapi/drm/xe_drm.h                | 13 +----
>  5 files changed, 37 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..3b390f047108 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	 /* NIY */
> +	 return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> +	.reset_status = execlist_exec_queue_reset_status,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e9e925c7353..e13792e49a67 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>  
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	if (exec_queue_registered(q))
> +		return exec_queue_reset(q);

probably just rename the original function and use that directly.

> +
> +	return false;
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of XE can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> +	.reset_status = guc_exec_queue_reset_status,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..97af879ee923 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -58,27 +59,6 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>  };
>  
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >= xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> @@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =
> -		u64_to_user_ptr(args->instances);
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
>  	int err;
> -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err = copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
>  
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	/*
>  	 * FIXME: Very simple implementation at the moment, single wait queue
>  	 * for everything. Could be optimized to have a wait queue for every
> @@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			break;
>  		}
>  
> +		if (q->ops->reset_status(q)) {
> +			drm_info(&xe->drm, "exec gueue reset detected\n");
> +			err = -EIO;
> +			break;
> +		}
> +
>  		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
>  	}
>  	remove_wait_queue(&xe->ufence_wq, &w_wait);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 88f3aca02b08..ae2457dc30ad 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__s64 timeout;
>  
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 instances;
> +	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
> +	__u32 exec_queue_id;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.25.1
> 
