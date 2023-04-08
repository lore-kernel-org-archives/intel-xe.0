Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3A8C77B6C
	for <intel-xe@archiver.kernel.org>; Sat,  8 Apr 2023 18:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F4810E00A;
	Sat,  8 Apr 2023 18:19:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D17210E00A
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Apr 2023 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680977979; x=1712513979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8DY/UY66q/4Y6xIAlfZvRfoXjMkn3p1ZRQqpHcHXfZE=;
 b=PlyM2nZOBnE2lnTgGUy2e/ukZjSfkjxVjYj+WzRf5IYM7ZT5Fbx2xoyM
 Cd+IcNnUIZ02o2YNIUD0+wy+94rdcQkwZhZ5+5FtAu7z0VOs1ombiy6gd
 bQddF54Q3nGspWhhvGXE+j1qIydz2tnY2Rq3lmDsq0lTzWMmdLE2CORwE
 EUEVlSfTyxUo1Wh+fnBCgrGFdrf73kxGUS4P+db81RobTGdGgU16/G3Rt
 nCOE89YgpojkelXwX/qnu0ojbHdawk/piqFz1N++TfZbWAu1MqDzkMtxr
 a9tB7CvkpN5JkU9POdYxnxleYXm6z8uaeAFl3V3du/7CpeCYacDVJfiAx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="340645772"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="340645772"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2023 11:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="862067407"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="862067407"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2023 11:19:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 8 Apr 2023 11:19:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 8 Apr 2023 11:19:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 8 Apr 2023 11:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U09vgmlUK/qnyig/PML/TN40N/kCU08PWuxjVqJP6OUoLpJzEVLQGFnmtQekCkAkVM8VBfjqcpfW8pX1I/KSeaGT0m7wtibRDvliv9uB0Ljg2Di5ra0JLkEs8RPeFHlTAeFoNmBWs3DS8fB9Pyir3kGWI2hZnCXXeexeQg6/495LK2KHgaWxy3UR79yT0aXCnjivFlZGi0Ty5Nje75VybWjhrCKsUXtBPt+c0QwgMQqucRMjNWYSSiuGatvIKtVz0VzYCTq6OY8IeskE6b/qZOFiXhmJIZixcuhnGbCgS70FB+U7UCCDLBt68tES1j64/UYbQIg0GLZODbZrcjc1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLDJLmiGWoHKyapzyTUPXOTDMqnHOZKqFa6GZimbGdc=;
 b=M+EB4UntrywVfEeqL8w7bFpg0LhZqB2ubdKkF8PVXahoOdIMKw8iX4CkHzmVu6TTnvaLojtif9z7tjE7p2uDlGnxYbYpBX3iv78onsMQZejG0bE1AuPxBOT72iuTedsLp/R9yVK+cWl7w4Is8XF2tW54+APlkhEDP+ZR+wXbe3Ok7X+71cF426mXLQVWiayA41faZzV04Q6ZN63CBOl9simk8/X6v5th828pQFHizgu7p57vhFR/Df5Czp51ofREzd4tN4RDwIlimRc4QhxJ7+APidPq+ZM63Sut+mq0hYQGUexAcyk4eFjHaXTfhXDx5PNfjONIXqDKy1QCBqzY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Sat, 8 Apr
 2023 18:19:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%8]) with mapi id 15.20.6277.033; Sat, 8 Apr 2023
 18:19:18 +0000
Date: Sat, 8 Apr 2023 18:19:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZDGwGYf0jgZpkmOq@DUT025-TGLU.fm.intel.com>
References: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230407211231.10137-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6dd686-6cbf-4abe-f498-08db385dc418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bw9nfbTopR0IVq9hrA/btnMXs4Wy67I2USKguqBMbKVTMGejoe5JJSN55sgybqk6XhmgliJ4kwtGpfjHigDEwy7PMGiK1fjtAc8QAsWOi/Ulg+/n4g9r/4iw523rIcSLiCi2CU62/Kwp/u5XIw4LjaSnCiug3krfD9IDanuAhyWKANyjPbdbEIB0GayP9n8FAUNgWxtnPWRpnjZQdyeXwTQzSE8GKL6ux5k2k7bsBqRdj2U2Rfgab9qeZCbVgR95Lb+0NEB+7/NtIkQyYHlRwUOaoML9WU+Rvd4f3NouTY9vQOpkkzmTVRdM8Td6kdMKk+cQzM7yK9ERP7FERAuX/nSd0bRz4MOWwtnoCO9RJoQqr6ghub2Wo8h3FTuKVcccdigRuejg6Zr8Gxj6m/8nVvuZQBQl4I6huLsp5y2Vlh+BVkcRSk0glaJXKDJzaUaUB/dkDjE+SXEzzJqUlugBG1m9BUnWgFg7thGU2b7KQwXRLnD9R8WcUWIPWu7hkaVbyn+WpTOqaunRnPxIjTT+ZYezQDvXg9IVuWpqp4cOT4emrP6bJPqvlSjz4xeZQzw1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(83380400001)(66556008)(6486002)(478600001)(4326008)(6636002)(66476007)(8676002)(41300700001)(316002)(66946007)(86362001)(6512007)(107886003)(6506007)(6666004)(26005)(6862004)(8936002)(44832011)(5660300002)(2906002)(82960400001)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2nZeU3700aLR8PyT8fDY8GmqnJyLyiWrkvqwGQW3sOmVHb8F+ovqQM2hHZy5?=
 =?us-ascii?Q?PJ6W4B1ThZalbU0zkXW4vo8CkP3pHpFagEwJQces02U1i+FE9DiL+koXqC7S?=
 =?us-ascii?Q?SCwdW/EW1kQWpKie+l8m+UIb+Af4kSTv22/KsBHsSsuZeT7M9ufSGCe6EE/q?=
 =?us-ascii?Q?5ujW7lig9tH/p3u+YMmTGQlPTfyY0jrvGUgIReMwEUsh2wqY56f2Ed8tB8EO?=
 =?us-ascii?Q?vDpQh387lr5dG5oUwN6BhQkPA7YAPYeGRUlk//7YuYDRiZNaa/Vea5inCXKb?=
 =?us-ascii?Q?p4yV5kl4FEmRFXCoDD6b7WWMWDMur6OR2k90iy6jDKQiZrL39DTbbDQOnCG9?=
 =?us-ascii?Q?tCItesb7h/HZ/6N6l1ZIWX8ptcFTAFak/kCQfm3ucbFROrMzq+rvkxY1jC2E?=
 =?us-ascii?Q?tUzK70vfvMdsc/75VLKeN9T/j/X+uHBzApup58X32QjPKB9VSGewEu+hAjZQ?=
 =?us-ascii?Q?q87MRSACGeuw5jrkP2vD9wH4yNFFYmm+lJnxQyrojry7Bc5lVyGNh4YjH7/+?=
 =?us-ascii?Q?HcxBx/UXfBJ98CWJjPzIRJQwytHc0R+BPWerSiVrPFQQr4o2h5KC+QWx73hw?=
 =?us-ascii?Q?C6xLOem663NmFaB1jGRugAdpWy5zqE3JLWuc6yRQk+mZTk2EBBa2fAZ4ybL3?=
 =?us-ascii?Q?vn9IDiCNpXjISyckZ+BKwMhRQsZc09r5upayIw4CBHEXodYa1BM1vRn/loX5?=
 =?us-ascii?Q?ht1XHACFYKYoLdw0Kt/neAdxNN3THwqiQB3bls67JPd7CuKZEVXvhwa/P6FX?=
 =?us-ascii?Q?R3wFvOIsxfANj7q7e7cfCWOP3bHtAbOl8nehzVbWV4hfIstaMRszWE09msC3?=
 =?us-ascii?Q?ZJNILICYrMfzgzHIauZRmS2SzmmnjR364lPv9LdwYZCBB5ZXebjlgxMYMQen?=
 =?us-ascii?Q?D7G35T0I88oJt13lIDiwCOnNdW4lwCHwl5NWqUWaRU9kX/SVPqJUHKQiDvgT?=
 =?us-ascii?Q?iPz4ucddwtWk+iBMMyVMPiLailRhNgbLSXtPATyMkW8+B1osPcfBQfiJoKI2?=
 =?us-ascii?Q?daBoB3+ehHjVLjtnAKSK+W3pi5cmJJgKpJUYaMrwOIXsNSdTpHZ5vwDTxybD?=
 =?us-ascii?Q?RHEUnER8vP7O5RLnqoN8CLTtN+vQoUriYWwc4kTABcZ6Q5P0YvxMhRdOf3IS?=
 =?us-ascii?Q?w3zfrlHUKSG+7/g72zjubGv8uIQc0apSjeAb5uNy923V7FovHuhvMWqCCpmW?=
 =?us-ascii?Q?ivqc+yUUuZI5nI7P5kIK5tFT0biaR6QsYZFDBX0hzxHxfuSLGboE5QGlg74T?=
 =?us-ascii?Q?UVEhIRd7LmOJHdCyouH9FR3Dr5cWPJM3RctEjb/osaT/FDpXWUzeOVEHjEJa?=
 =?us-ascii?Q?kbZKXyDjXoXHjnvOHXYy9gssokn5jDiu0NLdUl1aXqf4Ed7V9DpHdRPYyhlz?=
 =?us-ascii?Q?uNEj5FTtPfq7u48wO9ICkFwOSubU8cGO3AoXjkaKmI/MFicYpuxoMP46WF2l?=
 =?us-ascii?Q?yftT1P2dWYB9bk1Cra+zV56q9Xi9saTKOCBxx/RQT82slfCtD29fDztsh0dm?=
 =?us-ascii?Q?cTQrV9h0sCiX0AU52Pfcw8VDPKGRmreC4zOP4M15rbF9HjffI9F7M2q1oy5G?=
 =?us-ascii?Q?tDnKjrqlD6O2lRzeoccRHxDiKO4KHYACWTkaKqS+7zuT4pLQ3IOzqWuKmbrO?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6dd686-6cbf-4abe-f498-08db385dc418
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2023 18:19:17.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xXYW5ebrqf+BhKnT5Nbmz9oRoY9Fs2KxLybCcR6bBW9Ql6cGoVU6mZfBZteffKzazUcKXXPonfSwqX8FItanA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix memory use after free
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 07, 2023 at 02:12:31PM -0700, Niranjana Vishwanathapura wrote:
> The wait_event_timeout() on g2h_fence.wq which is declared on
> stack can return before the wake_up() gets called, resulting in a
> stack out of bound access when wake_up() accesses the g2h_fene.wq.
> 
> Do not declare g2h_fence related wait_queue_head_t on stack.
> 
> Fixes the below KASAN BUG and associated kernel crashes.
> 
> BUG: KASAN: stack-out-of-bounds in do_raw_spin_lock+0x6f/0x1e0
> Read of size 4 at addr ffff88826252f4ac by task kworker/u128:5/467
> 
> CPU: 25 PID: 467 Comm: kworker/u128:5 Tainted: G  U 6.3.0-rc4-xe #1
> Workqueue: events_unbound g2h_worker_func [xe]
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x64/0xb0
>  print_report+0xc2/0x600
>  kasan_report+0x96/0xc0
>  do_raw_spin_lock+0x6f/0x1e0
>  _raw_spin_lock_irqsave+0x47/0x60
>  __wake_up_common_lock+0xc0/0x150
>  dequeue_one_g2h+0x20f/0x6a0 [xe]
>  g2h_worker_func+0xa9/0x180 [xe]
>  process_one_work+0x527/0x990
>  worker_thread+0x2d1/0x640
>  kthread+0x174/0x1b0
>  ret_from_fork+0x29/0x50
>  </TASK>
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Good catch. LGTM.

Reviewd-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 ++
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..9055ff133a7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -23,7 +23,6 @@
>  
>  /* Used when a CT send wants to block and / or receive data */
>  struct g2h_fence {
> -	wait_queue_head_t wq;
>  	u32 *response_buffer;
>  	u32 seqno;
>  	u16 response_len;
> @@ -142,6 +141,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	ct->fence_context = dma_fence_context_alloc(1);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>  	init_waitqueue_head(&ct->wq);
> +	init_waitqueue_head(&ct->g2h_fence_wq);
>  
>  	primelockdep(ct);
>  
> @@ -484,7 +484,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  			void *ptr;
>  
>  			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> -			init_waitqueue_head(&g2h_fence->wq);
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -709,7 +708,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		return ret;
>  	}
>  
> -	ret = wait_event_timeout(g2h_fence.wq, g2h_fence.done, HZ);
> +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
>  		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
>  			g2h_fence.seqno, action[0]);
> @@ -801,7 +800,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	g2h_fence->done = true;
>  	smp_mb();
>  
> -	wake_up(&g2h_fence->wq);
> +	wake_up_all(&ct->g2h_fence_wq);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index e0f9063e9b65..fd27dacf00c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -74,6 +74,8 @@ struct xe_guc_ct {
>  	struct xarray fence_lookup;
>  	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
>  	wait_queue_head_t wq;
> +	/** @g2h_fence_wq: wait queue used for G2H fencing */
> +	wait_queue_head_t g2h_fence_wq;
>  #ifdef XE_GUC_CT_SELFTEST
>  	/** @suppress_irq_handler: force flow control to sender */
>  	bool suppress_irq_handler;
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
