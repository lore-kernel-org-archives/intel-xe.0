Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45664CFC51D
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 05:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D337410E009;
	Sat, 22 Nov 2025 05:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moY0g8Ub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FC310E009
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 05:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763791038; x=1795327038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oGSFi/NKOM8BmnTtbzWbqvBNdnzsG3kEyxWex8GO2Zk=;
 b=moY0g8Ub973zxnT8f/O0KgNXAFjxBfh1iTM8jlffqe+wCeGQPhfpVwzc
 N9oavOB6OO+rcLbrrHJI3aqAwnW8gQSNPg3m+klA3/kMIn/ZaGnHsM4ih
 puebCLNsl9vdgmWn/Ty/avPgG744ET8jP8CB5gUTFA1KffVofl38hOnPj
 uvw4gIOXtfeUGMPe4ZqHZgy2/Lin19GDuCS0hDVj43QZxcMRuIWsZ4ApF
 qJ2wWFt6bt5AB8Yl98OrjgckJWPsZXHzwnItX/H3oCeN9CWswbmJnyMK8
 ZdE5q2ljgUvlmjI8wcu0okxBIWwerYEW9DJ0XOcW7vU5KzzV65/P9W8w+ g==;
X-CSE-ConnectionGUID: wsyaFWpjQJia/4MyfApvMw==
X-CSE-MsgGUID: LiKhmfriTsyNLT/Pv0ewUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88533097"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="88533097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:57:18 -0800
X-CSE-ConnectionGUID: r+mj7q/KSwuZaGP8VsP5NA==
X-CSE-MsgGUID: OmX8RDMXQGyDCELS6y7LhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191166740"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:57:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:57:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 21:57:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:57:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBhxJgE+WREVvcEhTwmm+Ynia/Sq6gAPcYPWNbom7qepFsTssFkxOkVbj4EBsYBX1FBVxcoqaLQ2CMyDNzOqkb7Xt834cEnfPJMr+v6ZDlJA/QRT5Zjp0vT96fi7jlSsoWTpGSNn7wSfBjQG6NetpztsQ+pfCgD8kI7DfB/bsJp+gPK+XsxN2jnDM6m9jFrDXU/TQNnRb7j+Y7s9/yXoQdKi81aybbWdumblsGN6ampB3YVu6twx2muJruYpSczgSxlTDsVO1EH8smZa5X+K6EleMvGqACdpH6qLB1c/09kirJ01921rezSK4YuDsgc4Z6EeWsfDPG8v0dWPESjKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iEIf5G6N7kOIvps9p7pL5MAyGZ3EidfumUhErdrCmQ=;
 b=X1+Go7jG73ed5sTGkFmFAxp3Nr3X6LTJ4smZkhmm+8zNz+vz0TmwN1/GkmM1c6O4lqa/G43KWnucVLvMzSq1hynxmjQhO1mvuEATc7Hmd6nJGOkZZO9GvRlkKZOdjFSf4uH9ZeIRX34LORE+AQj9Xu96EoJSp2BQmQ8nb10Qf0IyzHtAmsoNAwqJ58OS/DNyhfn9YWAK+u7tSAh4kn2tZtv3vpL2E5NjFrpnt7bFaw9phH8c8FT3RARzVCYU3pRJfmruRveNNCFE8DW+JAiNmes9drbqmfIBk7+ZcdzewBK890z1u5BpKPUxfHoDQfKPAIZprTFUB0HsKKQWvE4xow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 05:57:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 05:57:14 +0000
Date: Fri, 21 Nov 2025 21:57:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 14/18] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aSFQt7V/R7yjVZhR@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-34-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-34-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a064096-527a-4fbb-7759-08de298bfc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cbR+vUnyr2bMHF4sVJ01hHwTf2p8xwqvs23tYxVW8EtD9LbpP5V7iScGCoWv?=
 =?us-ascii?Q?WudZ9yspG3QCSFVx/LTN10knI56Un2ShHRRlxrXHBLRS17dOwz0rWKRKrou5?=
 =?us-ascii?Q?2w20bqVSx5XC7xKzYpDhqzgSiqmvCtPerizIUYYwq9VQ/tj4InUvDx/7NPWe?=
 =?us-ascii?Q?YLsoMlevtbtfJ9MqFbdgFOnPgd20J8I/o8MDfiaNE8L5epzUtICjydOE8T9h?=
 =?us-ascii?Q?qR3rTxjhIOgrd6GE7mFC6RrnyzdYMBdW4z8pF2Oi8biLsAp/bK7ZSZX7Lu/t?=
 =?us-ascii?Q?4PNwRWd0ktYBv+vjcnmiDbB9FHUdrGtjjRm6NcGvAZ2i13WsKpcIgVeZlYhj?=
 =?us-ascii?Q?aCCIHmQtTHtrHPpRmosWb2zINSjSqxYPQu5alKExr6kPrO7ELJ7ja3WMTIn7?=
 =?us-ascii?Q?hzy4QG/YbU8STV+W7h9d9UM02CoW2SbszZ50yr5svrSmKbxKpe2MNnMRyMVq?=
 =?us-ascii?Q?aP6yjHvJvxxFEfYltMyzbd/PQhSL6rqw4SXdrC/cNG+3kLNZKn3B1bwuNr0s?=
 =?us-ascii?Q?l5uSj/v64FxMc+jtuRZliWRTQMznm1+091ROCvyZ6eJCin4LMuwuVUaNj8lu?=
 =?us-ascii?Q?aoiF2a2lp8ThSVWfZwBGqwKpwf7+DGNk4IYON9WqIthnt8xtjT1pkqV48e0F?=
 =?us-ascii?Q?LPr0Ul2+qVcqsfvLiM4kbiZv8G1wv0UiyOQy2yUWAN7b6ucRQHtZO8CCFsSF?=
 =?us-ascii?Q?Oy016AIatXSmBXM5sW2wry4T+4Guv0ks61mY8Jprr5lN06pU83CV4LhRSJTb?=
 =?us-ascii?Q?M/nAypJVhzVZZxjZvylmtu7kpgla/8UVfxlFuPubnLvz71tJzLiYglwPZ16W?=
 =?us-ascii?Q?i9QVZ9jZaOBfmcujH78xkL0X0DHuUgKLK9LErSACHEvjxVrIFKWiOrPgAQ0v?=
 =?us-ascii?Q?2LoOs/ZuNJBTEaqZ5E/aSpda2nt77DDC83GbD88B5weDKfAbQWTgJ9R+N41I?=
 =?us-ascii?Q?IfVKwNeYTGcBxFDGOJPQxjVjDGIcdAX91+D9OzRA040SnqIP5n4i5n601LQK?=
 =?us-ascii?Q?54Xla+vpZFCd1bB3SqR5peAZJm9P8jplSCyiUihlgvBxhMlXAilTWnUFt5h9?=
 =?us-ascii?Q?fsPWc5dzkhhSU/6leOnteaPnQ0q1tr9G47fxqQ6AJlvAhWCtoczfGX44o2vS?=
 =?us-ascii?Q?Cvb+jXbOM1SwDLq7/a489l+fZC9/Cjbynxb+ol0IGEDsBeJ+pHTzCLWeDqlC?=
 =?us-ascii?Q?USwJt8ukGhBPpVADYFPYGDlAbWvzUSh0UkOdy7S/4cdR3rlQDWSSAHmVHNvq?=
 =?us-ascii?Q?ekDRTI3s22S/x39v7o6lNewtcnBnv8ZIXuQRuqGakZtH2ih9p8e06FWphExP?=
 =?us-ascii?Q?ZItxI39mCYEnTsQRI4RaLrxvr3IhHkPr+7wEQtN1fVM3/7JMInUZo0hzH1/a?=
 =?us-ascii?Q?CdhS8ihXdY7ti6D5yUSAq7DGK5/9LnKB54GfPWfEl5RclJ+OoKaXh3I8FMUg?=
 =?us-ascii?Q?iKMIDbR8r457Cl4mrm89aWMNNGfktgX5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZXYNhQc2D/k//3EJiQzwSCqvbAdHoAQFHm9Y4x3SdKhMMpKD8UOKSHh91Wt?=
 =?us-ascii?Q?Le6KySuyssJLhY3cApqOh/GBOSAH6QmkRmeUp4vsVBXrgOQ3QolarSEvi4OL?=
 =?us-ascii?Q?RpjxGNYuHWsq9Ee6FXfermWBY2r0IpnNxVh6g1crML69t80Y+DVwCcLi22WA?=
 =?us-ascii?Q?suiijDg+DrSbhgQOfIGvh4Ftpzus1cF7+UOQl/2y5Hl2Q7/s0YzRZN7698ln?=
 =?us-ascii?Q?LdIby5j1wD3tYcHunCb/Hu2Dgw/nj5Sxnb2gyoOZbjxCFyB8QCPRfZBKgxYH?=
 =?us-ascii?Q?+BtKIHC7Yg+gMq3bOsjwPws5UFTLkuq5XfUT2o6Uby4sen84HxxDKUw/ftPY?=
 =?us-ascii?Q?xvFPacAo50yAD5FiUrmuwdTZ51IwjmX/RN3CKUVmk4ZPd2jZP8KAYSZzzfNg?=
 =?us-ascii?Q?O58faSHe0F9yvROaMHfoqKOz1GjelSYrZhKmp/leu/LyeV1rxiYhVhQsWILa?=
 =?us-ascii?Q?7GONj7YtdiP4j/mIDGR/39xmiY232KmLOjxY5f5a+1Fd9pTXCM85M4EZQXtQ?=
 =?us-ascii?Q?+SkTDQiKZFxkK1CP8iWkPbtbRtk0G5LCHsbQnP1F4LSfrtrRDGFW6bjT5Fp8?=
 =?us-ascii?Q?ab5VxDZxByaIXXael3Gv8RVzXVIW/iChQbkq4ZE/IRRmrqNF7XdytWMldDHK?=
 =?us-ascii?Q?7oSzye4XwJ5F8iqmBADas+iMUDnPeUs7MbbMtZ7cy01ES/5ypsC+CQ7jur1q?=
 =?us-ascii?Q?6fUNhHByrjiVQh2VpYDCBJk6QFYyNu09n+C1YQ3mMug/Kw/qPHfrIQNcdhEk?=
 =?us-ascii?Q?gsMrxstxnL2+YdAm6lfwXmD87Rk1izY72x1pGauZYsCSfhu36omN2ZWNNu8c?=
 =?us-ascii?Q?+7sjnHXqE+X2sgOkvNCD8xeasffg7FEgF52Iq0G1VntyvLmanhFKrzRmZY5V?=
 =?us-ascii?Q?XSGipDJFeiEEj9pyHY+wKrg//w01MFj7gF9gYy1ESxcWpV18kKg1X8US4Fpn?=
 =?us-ascii?Q?NLywc8FU+9keAexS7UyPhOTa6hD1ZPMoR8RRgUZEe5LJM6MjfEP05yI/J9SL?=
 =?us-ascii?Q?yTEl3wEVoZCn/QwVBfd77Gq0IMlxelE3aIAdzrlzSIPQH3VeZZrtyktuJxem?=
 =?us-ascii?Q?OoN6uKo6TokuWDp8R0THR0WzZlyC1m6QXtdFJsXnV4wGOd1Ck3dEqxR7ZJnU?=
 =?us-ascii?Q?rAciHCJQZmBMjZkMBp9ZEM2DjC7v3qsY50+5lh8xR2THEsGi2E9x0fpH1hlE?=
 =?us-ascii?Q?1CNXTOi1lkpzY5ILwMV773pHbkFwdKoVkhymFSuNqxIbMTzK8mN5G8vtbcRU?=
 =?us-ascii?Q?M86/Y5VdYPJ1QGYITNesFjWs/8gNIfD7xvYGxN0wLtB2cu7ufyKMA7o7DoeN?=
 =?us-ascii?Q?TCD6cmtag6uWQONiEHPhdvbbn1zU4PZRotQoGbdf+dlMCPGu9suosDs7M18p?=
 =?us-ascii?Q?8Z9mDknw+drHh9rLlnKuCTu76iCMnjNwCBun+jjQA5NlfNcOhtEeYK6Qox+v?=
 =?us-ascii?Q?3qsgpTN180F9wzeoyZgJQ3sDsnMYs3XVs087kk9m3tmc5noUx6PbJKMLRkyw?=
 =?us-ascii?Q?dpwobzmTcX7EPsc+sohFBIMOb8i50jHVMTqpnGxSXoYwoJeU7j9QkpIzAaZz?=
 =?us-ascii?Q?X5raJMyg0BTBobGUoLtnuM8JkQzEgQmkD2B6QdjtuVifjWTOcUQaeY/gA87n?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a064096-527a-4fbb-7759-08de298bfc51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 05:57:14.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjPusFNjprJRmBVawoB3KlGIhUnIPisJWwfcm9pvb9AxbUpw9SEHt12BaWfyasO2nC04JdUpAj9W+rHOvmMo7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
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

On Thu, Nov 20, 2025 at 07:51:48PM -0800, Niranjana Vishwanathapura wrote:
> Add support to keep the group active after the primary queue is
> destroyed. Instead of killing the primary queue during exec_queue
> destroy ioctl, kill it when all the secondary queues of the group
> are killed.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>  include/uapi/drm/xe_drm.h                |  4 ++
>  5 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 037206c8b543..e72294a7d4b1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> -		xe_exec_queue_kill(q);
> +
> +		if (xe_exec_queue_is_multi_queue_primary(q))
> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		else
> +			xe_exec_queue_kill(q);
> +
>  		xe_exec_queue_put(q);
>  	}
>  	xa_for_each(&xef->vm.xa, idx, vm)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ab161b74fef0..839fb08f09e7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -417,6 +417,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
> +static void xe_exec_queue_group_kill(struct kref *ref)
> +{
> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
> +							 kill_refcount);
> +	xe_exec_queue_kill(group->primary);
> +}
> +
> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
> +{
> +	kref_get(&group->kill_refcount);
> +}
> +
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
> +{
> +	if (!group)
> +		return;
> +
> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
> +}
> +
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> @@ -629,6 +649,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> +	kref_init(&group->kill_refcount);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
> @@ -704,6 +725,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>  
>  	q->multi_queue.pos = pos;
>  
> +	if (group->primary->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_get(group);
> +		q->multi_queue.keep_active = true;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -717,6 +743,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>  	xe_assert(xe, lrc);
>  	xe_lrc_put(lrc);
> +
> +	if (q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(group);
> +		q->multi_queue.keep_active = false;
> +	}
>  }
>  
>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -735,12 +766,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  		return -EINVAL;
>  
>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
> +			return -EINVAL;
> +
> +		/*
> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
> +		 */

Is the compute UMD ok with this? I really hope by the time multi-queue
is enabled in the KMD the compute UMD is only using faulting VMs. Not
blocker, we likely could actually fix preempt fence mode to avoid this
restriction, more something we need communicate to the UMDs teams / keep
an on eye if this becomes an issue.

Anyways patch LGTM:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>  			return -EINVAL;
>  
>  		q->multi_queue.valid = true;
>  		q->multi_queue.is_primary = true;
>  		q->multi_queue.pos = 0;
> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> +			q->multi_queue.keep_active = true;
> +
>  		return 0;
>  	}
>  
> @@ -1286,6 +1329,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  
>  	q->ops->kill(q);
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		q->multi_queue.keep_active = false;
> +	}
>  }
>  
>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> @@ -1312,7 +1360,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (q->vm && q->hwe->hw_engine_group)
>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  
> -	xe_exec_queue_kill(q);
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +	else
> +		xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index ffcc1feb879e..10abed98fb6b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>  }
>  
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5721fb4bad1a..c6b80977ff4f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @kill_refcount: ref count to kill primary queue */
> +	struct kref kill_refcount;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  };
> @@ -159,6 +161,8 @@ struct xe_exec_queue {
>  		u8 valid:1;
>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>  		u8 is_primary:1;
> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
> +		u8 keep_active:1;
>  	} multi_queue;
>  
>  	/** @sched_props: scheduling properties */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 71a851615876..74cbebb24aa5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1260,6 +1260,9 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> + *    set, then the multi-queue group is kept active after the primary queue is
> + *    destroyed.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> @@ -1307,6 +1310,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.43.0
> 
