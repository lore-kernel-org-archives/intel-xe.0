Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E45C4707B
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 17:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C710E4C6;
	Thu,  4 Jan 2024 17:08:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDCB10E4C6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704388092; x=1735924092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V7hA/1gexmmZAsD/Kvc6B/ARDlA526xVwI3YwgC/qrs=;
 b=Jgh6KWnPAJybQ2h4bMAloT247sbz1YyzJCWW06F2z/ghlmASkoNb+7ZX
 CwZu9mcgO3sLr5xMgbfOY+F7K1OQCaohtB2R/vxNkM1mNkzb1lFdUJDq8
 iEIXRtD9X24EAF7rgW4GpaJs+/XqHeluTK56uqCyXLAGj6N12PE9eowE9
 xppAqLIBXnqSU0dUFsSAQwiU/WxVvN3gC1h1juG+6txnrijgWCRrpePzj
 UgRUCrnwdbB9IOuH14GQTEDT2NuCBN39RvX+cLYStlzfl5+VFYFkd9Vya
 0i7COF0deZd5DOhD929pITWioqos8Q/ab1cd3jr0xk6XdEmH8JnOFd0wU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="397026761"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="397026761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 09:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="1111823013"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="1111823013"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 09:08:10 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 09:08:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 09:08:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 09:08:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMCgOpU9YMy01VLSUeCfep+OOdMd+9DDZNWR9FhhmY4r5RDizCcbHTosXkTluhE4Hw3TTZNZds8uP3wBlprbX0i1xzyOytI60JnZWrNDXfjtUaGrVbKeopLTIJvX6m5O3OrGhqFweLz9ViaG1p4jPWaYhGl/y6jtTysAueBn9hKCt7r0MixRC7UgGCOPnta4fA26Sz8O+GfQOgFRhXTn6Z5Vgxm/5s2dA6rL5f1V6450DP741v92vKTJbNMlT5THcnqGf4wjG00T5nBZXwPhaSNfgZjsdDdd1LkhrOmzVP1P+7C2OtFES8bQuEc1xRCnCIu7v3fadytcVc206/M5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7w4kpZR6NIGuLVmrMmxUgEaSf9OOZ2jinxU1edy5+A=;
 b=aDsMaOW4gY4LSyw8TdBBkcPkzLI7RlbRYZlSh8wO0B/f4PULP2lSZfJE3iICt3VyLrBbc9ABuhFNQ12cHnDL2jHKlYrJTyuxGMuouMvxlmG/+jTpHL3O7N1BCF/EoLGUGkr7zHalX3sGfrl4Wt5nMnlnHjvaoPjTGBoy77KxUQ0EJLvM6B0W43T2SlRKlnAhyEDXGIhskJl/Ct9QX7rT9df1unHt5vvhUDRLaY+ck8P0IpN4fjRd+HhTkuxC7gaw+SjpS9R+70HyrHMMH9IsxCkYtHUB89csYxLv+DsbXW8STEkjOehnztQjALnrVWwgzGeMhGpWALtMpr0IxAy2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5485.namprd11.prod.outlook.com (2603:10b6:5:388::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 17:08:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 17:08:08 +0000
Date: Thu, 4 Jan 2024 17:07:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe: Remove set_job_timeout_ms() from
 exec_queue_ops
Message-ID: <ZZblx9xVhmU9Zo2L@DUT025-TGLU.fm.intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-6-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240103184408.17844-6-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d029a90-1545-42a9-6aa0-08dc0d47b97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nd9gWS5+9sOsxRgcydCVF8qBGTsJqeiYCALnzfiFCARlecs5BNvV2okI8gioy0MZ72EIPw2sTecldmGigN1t8mFIaJRdMwhHz2WKHnIBu1lLBdCPDlOOWz3zCj2HKB5YtSyIDnK11RTcv7jH3xFEo5aLMa+dPd6tQdZk5+FoDhb912Ni9PngulMJTs2OgJwHYltBSjavmVGmSvPC3050OuSpnATvg+7O6fqaLBiwNdWisluN4MeTNQy3cxN+XvzWfUcwRYAhi3Ju04++OrzRQzifqJfNpSKy9ZLOFFoCj6p+b7ez6ekmpR/Z0XhGSB8p9FOtjctQz42ROECI1g1AhCwwvTn1ykGELYl1LRF/+Bfs8T3Ovnqb8qW7c1dl8rN1SR6qtuzJRLWfbG/Vt8BNd4yXbyoDb7ISNbQqcta1LcFDkrNNDzH9pg2KwBYdSbab/3EAKhrOg75hznXBHtIuU++g6fQpIvCEWzNGHZsRg1NRnpGzSWumk6yXW9Yhd0qIYj0y5GEPSyYdNHVuc6ViO1uTE4IIBNZxbksmDkR/62dhhj4grSm/Gd1yLHDngq2f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(86362001)(82960400001)(6506007)(6486002)(478600001)(6666004)(6636002)(66556008)(66946007)(66476007)(6512007)(26005)(44832011)(5660300002)(2906002)(8676002)(316002)(8936002)(6862004)(4326008)(38100700002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Np/7pBbW1D5Su0traka6/g9A7hirzwrH58pwuS0nKZ37v443KKiCTp6YFAKI?=
 =?us-ascii?Q?nFqvjjTNxqSjP4TKdto0i2yBcV9tMtuXHEHpJQLBlRndKWqzzxX6aMREgD20?=
 =?us-ascii?Q?w/9fZyYYnENOCEXfHNY0+CasCWJvIBb0N2afQtWapOLrf+MjfsekYbvVVBHI?=
 =?us-ascii?Q?JeAAy0d9Xf7BeWCpJtPnD8fUVQsc6Qk/Cbs29pl2xnu7Sft559CDLAbvBVqy?=
 =?us-ascii?Q?97r+ynJ5lB8fmby4dV3ffEiHjyChqf6+uM/a/xSuYxDBrQF8BtPEjAij0920?=
 =?us-ascii?Q?7HpzIquSMjpoU1RqTNDH0IA6nMkQLY6Wj1GRELHD8brx/YTbvIl6WTFG8VUc?=
 =?us-ascii?Q?twsmAwcfoMYrG5YWfkbBkoMkk3kC2GrBgjj2W3rEaGLl69ufAr0KllRKLTdG?=
 =?us-ascii?Q?icLUByj0sLPYOZPCqK15iBq9V95xWZlEQEJudV+bft/Zj9oQTCmqSfm8CYAZ?=
 =?us-ascii?Q?yzFFOeoByot3NXNN4FDLQSokCJfu7jAgqsz+eXon7lZeUjAHOGJ5qK2M+TXd?=
 =?us-ascii?Q?fKVm/qsqMVZzzotIkGoI4wNae1ryNCA1h7B5lARfFYnK4sR/19SfoYKdozls?=
 =?us-ascii?Q?PCa7FJhE9qyHvEZgrO7ZMRiuV4xy90KcngUwsTtQwIYfk9zhwFOk9+j+KVgL?=
 =?us-ascii?Q?HC6vVqhWCDrw+0N4aWj1+6+yA279e9ADmHy6fcrrJ1HUAuBTD281IRC73fig?=
 =?us-ascii?Q?/tEGeZ7m6C+fnu4CBneCRYnxHJZDby+go27wadOMCwCtcKkCbxmYLhXzhw97?=
 =?us-ascii?Q?/JmUrQ9kwUi0DEYyCWpgB+vARX3chH0inS5+3n6qpfGgw6LhAJyX/sVmrQg0?=
 =?us-ascii?Q?f2s24E+kgrlvxRV797wnyFc7rl8S2iVSOrVWJeSi9LvwSIPLzcpXJsovalDc?=
 =?us-ascii?Q?dExeTdM4cuRor/7VqAovm8HoHEInhCrbLX7+fF2LmqTBpLAOiJqOrrl1Q+YE?=
 =?us-ascii?Q?/fgh1PFWbdJrow+tRKwiIpUf/vSw8+39HXHjIp4eX3HVFMqYzo3UzuB/uqFT?=
 =?us-ascii?Q?rM7j5qsMkWiw0Jo8ybSpsvcpvlLJw87GQajiwdBT3b6G50xnbEVeVcTvsAop?=
 =?us-ascii?Q?OQcZQ5zA+ySsKW0yT2sIDHUZRbNBhkcHbbPHaAOM6JeFbFOW3WwQtYVenlyg?=
 =?us-ascii?Q?/jOkILhz2GQX7biAhrgvuLNHGZDD4x1b1ynHWbEED1RnfcNWJ0qvNKNV9Bc7?=
 =?us-ascii?Q?WGOmfehch2NPdb/oFXyGyB1UEI/ZTv/VWzaym9HUVKFedJzCKAcfNaG+iSMh?=
 =?us-ascii?Q?7COej5jhHn2SF7UxggILKBdGNVVI2UbKDZYiILcF+YUQFqCv/yaSEbA7vKWz?=
 =?us-ascii?Q?jjWEXQH1Nclt2qxwGlPA0/edRWDHIeFiJTxtO2fTTggx811siaXoo2xPShHO?=
 =?us-ascii?Q?Lk5W6DXO4heBp2KjzFG3Eg+CIPPT0RNDhXyRv/dl0aYgSBTQAHyVSjS3pQrY?=
 =?us-ascii?Q?qxwnFn3C9bc0087HBE9Y/4OBRFu6mOfYn2pADkAbQiojjuI0S0UEmZ/q6C7k?=
 =?us-ascii?Q?/2uT5+muNHLlmA5wkOG040Gc116QeDAWvHtRrGiRHZ4LdhokCRQREnRKv3Iv?=
 =?us-ascii?Q?Q+1AgBaa2vmG9ysgsk4EiG23H5MYYjc047uJ/1pjw++VXDnpPso4yfnsB/Ml?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d029a90-1545-42a9-6aa0-08dc0d47b97a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 17:08:08.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guEDQdNFPAkxEExjuWeM2zYYUY7/L5waqP6fUckYPX+7l22EMOPu56iu5SqeaAlMMi79jlLaUn85LU+eSmInwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5485
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

On Wed, Jan 03, 2024 at 10:44:08AM -0800, Brian Welty wrote:
> This function is no longer used as the job_timeout is now
> updated prior to calling queue_ops.init().
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 --
>  drivers/gpu/drm/xe/xe_execlist.c         |  8 --------
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ----------------
>  3 files changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 6ae4f4e2ddca..aed66295bfc4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -198,8 +198,6 @@ struct xe_exec_queue_ops {
>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> -	/** @set_job_timeout: Set job timeout for exec queue */
> -	int (*set_job_timeout)(struct xe_exec_queue *q, u32 job_timeout_ms);
>  	/**
>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>  	 * multiple times in a row before resume with the caveat that
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 96b5224eb478..58dfe6a78ffe 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -418,13 +418,6 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> -static int execlist_exec_queue_set_job_timeout(struct xe_exec_queue *q,
> -					       u32 job_timeout_ms)
> -{
> -	/* NIY */
> -	return 0;
> -}
> -
>  static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	/* NIY */
> @@ -455,7 +448,6 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.set_priority = execlist_exec_queue_set_priority,
>  	.set_timeslice = execlist_exec_queue_set_timeslice,
>  	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
> -	.set_job_timeout = execlist_exec_queue_set_job_timeout,
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 392cbde62957..7c29b8333c71 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1350,21 +1350,6 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> -static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
> -{
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
> -	xe_assert(xe, !exec_queue_registered(q));
> -	xe_assert(xe, !exec_queue_banned(q));
> -	xe_assert(xe, !exec_queue_killed(q));
> -
> -	sched->base.timeout = job_timeout_ms;
> -
> -	return 0;
> -}
> -
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> @@ -1415,7 +1400,6 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.set_priority = guc_exec_queue_set_priority,
>  	.set_timeslice = guc_exec_queue_set_timeslice,
>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> -	.set_job_timeout = guc_exec_queue_set_job_timeout,
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> -- 
> 2.43.0
> 
