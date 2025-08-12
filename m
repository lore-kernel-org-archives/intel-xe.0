Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFED1CA0EDB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 20:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B1610E606;
	Tue, 12 Aug 2025 20:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPZHEvVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA59E10E606
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755029260; x=1786565260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CfqUvvTMj1hUQuoc7MvSWgqAEz2Rai7U8Kb9sB/J51k=;
 b=GPZHEvVHrNguOkYoyThak3o2JYacW1YLNPfIapvcH4UKOePPzg/Z8M+J
 XFuiKKrOvILJYbLcyUgXp/UcR/SnLq+WItlGesAORaFd2pBs6AmreULCd
 FBrkgEdubJyRJj6RQRIHB0lOXwJ30pXf5c4EYd1cy43DL/3U+oBFe1uQ9
 G2n284t5K7pjY5Aq+cFhpRkIckZrJrwQ+kpzjs5+s9y8e7JartQBnIRUH
 y+llNBWC2xQcbNVE4iamwiHvxFITEHOYiPN97542Y2pWL6vby8l6aQxrz
 fH38GRXZ9juasbAR894Y/ogvy5oMOaRl73cp/wOwADg7JQACJSFMLFK8p w==;
X-CSE-ConnectionGUID: 1prr0zf6Rk60gSVbGo5giQ==
X-CSE-MsgGUID: dIHbK39mT8Gtii2AleT7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57273836"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57273836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 13:07:40 -0700
X-CSE-ConnectionGUID: PDJyzxkQQ9KL9mzRyW4rjg==
X-CSE-MsgGUID: LWTxa5NORmqgf4Vzl7uMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170497406"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 13:07:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 13:07:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 13:07:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.76) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 13:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzCJYNjFvlkP46qoyA1kIz+2QYN/iuYL1ejAQ0vTtP7noofppIk1qHN3yyIOz1ycgcA+qMAu45TmdH61xnxw8v25QW6eDLufgZf4DC9qOhWCGiWpIUz8zTuWGqGWkOXTWaa8v4f1e/ZZRZbxsmNQHKmVJ30VVL7nEPlsLyDswdqU65tQ7TdD8yOtTUUd/9vqpUCTpT3VYTAWDOo62/B4OUb6WcvJRIB/E97P9oBxMBJrGQRiHLJZ4FJzWvfnItxWqn/RzN+dKivN1vjagYwoVoLnFoMSPeishl50ytCMO1CUlV79VrBhO63cken5sHvtJSwckePP1++3tgKg51g0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygnCHWGNth1ruUzpWAMTvJwqfiC+yYks5xUWTR+uLZw=;
 b=gaI1BYQ9Qhn8Ep6vZXwaW62M45UO8QPEFzq166mddbw1ZIE2VCtZno31W8ymLKp05RqTpn5kGd7+oV1Sda1SL8Sm72V8bHMVQ0+5PMemiS7LCGzHbfSejoDuvkxEH+X3yrkS2gJYsx0JnYj17lGQiNuppWDjHJBYvyazfH9+rZgIpwLaKq32zN1hE1VXRBKCxWO9tNRYLzUc618Pm4FWeWzHq4In/tYgwG27NJAS79i9jf02xMbF5u83opqr95WIwxqMO3MU5ZlVhadzjnCFUAic9QA+dWhiEL1QMo12sBFfd/x+YgLgFWxM+RwpugcG6WRgnrlM++p9WpDDx5AXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7989.namprd11.prod.outlook.com (2603:10b6:510:258::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 20:07:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 20:07:31 +0000
Date: Tue, 12 Aug 2025 13:07:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Message-ID: <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
 <20250812182846.1608209-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812182846.1608209-2-fei.yang@intel.com>
X-ClientProxiedBy: BY5PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:180::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a40c9a7-7e02-4634-73d9-08ddd9dbdea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bnWcIper/7IcfxnXU+ACJ+EtsTDW1N8LZ5F4natKinpLw9UvY9dl5KIBlc/f?=
 =?us-ascii?Q?mEPwTzzODRXG+al83Uspdee0lzYLtK/x+8mxDnqXhr+M2GVvGolt9vmwj+yN?=
 =?us-ascii?Q?Xn3AJsNCcBzrhmaO92mJ3cDRx+c1sfVmyfvd+K6sO3fYc6CAWowuAYuNSXVI?=
 =?us-ascii?Q?1HgTviGFlXikrjuYOkJ4qXrqGRu/DkKEaL/Xp+yG5elgKDpmdT+fyoVIvsxT?=
 =?us-ascii?Q?bPOqa4dVAvrL+tLqsepIUVBrhS2Btg8jhp1sI+ZHdQq5VbDBE0wUcnjJ4EJo?=
 =?us-ascii?Q?YJz81IxiEGLB7GsXNiWEWbCoI+oXrNyxRE2m6sL4UhcLh+YALManvGs+Ry4a?=
 =?us-ascii?Q?07YY7iBosmW6vl5wuo0PEcv65r7JY0Lqss+cFjwnaboZxYeENLmvBah7PmUk?=
 =?us-ascii?Q?15jWyGKjY8E0HT0m52f9d2yhN70+95GeFMlGOAiIEr2RhGVCt4UC9YNthNLV?=
 =?us-ascii?Q?2fNLFs3ICmMihNoBxyZCvNXSQ0GaZZX6rGMAgYysWel3rg0FzEnve+BrlRiT?=
 =?us-ascii?Q?8o91/6t4yE0YsrOeYKw2aNf4kuUIt3yYNJBgpa2hfFf7nfrOg3X0DyLHVDMT?=
 =?us-ascii?Q?AAPYyn7sHf2O3q5BtKEsIkdadEgSNGW3ucZKdth8g7KxlmaFslbgCxy59NVf?=
 =?us-ascii?Q?S5ETgLB8/YhU9BDr9bvHxO3Xx+UBVF0G3IyLzOPu56xnrek28cZLiI5Noxqa?=
 =?us-ascii?Q?0hSoM5sr8LTaw2aWqMlhEzgciN973UJ2r4PcOznEFCCTHhVVwOf/TqLBNtg6?=
 =?us-ascii?Q?xeMLdixETlusjaFjwC8QN58e/BfOgm0Zi3pQJXGxAYM7vaGxmWQvt5D3uQz6?=
 =?us-ascii?Q?tePFSn62d7TV+TA/FV2kDJJYTUobaK+CYRIFiGr5mR16bblGfBPK7MTqfkvH?=
 =?us-ascii?Q?EcCAlNIqY+McNnfDPjByT971QKWoGLe5zgiiRvHnCq8IzxNItsp1yv+XZohy?=
 =?us-ascii?Q?36muKVOXPlHvIxHRCHe5Rn02saPO//0gSmSy72QiQL+k9MAKgMYGsSYzg+Ip?=
 =?us-ascii?Q?WDzIEw4m+8nviYPn4DpLwgsQwqJPDzH9zrVPYlrWZdeRMdIG9cK2WMZgAxTs?=
 =?us-ascii?Q?22zDF0njHM2kbqjNlHw64MvB2PwBMJr7WMHx3xVeRijmsTjzm5pG9ahycjH4?=
 =?us-ascii?Q?HjeXNvdNr51yeCCblteQMsXdSO0HwAmsmUc4vh7P0kX6tl4IXL4cHP1EUAnB?=
 =?us-ascii?Q?hKfOP+mMUIri691iHcNRBJI+BZu/LtPxl5+9UDtWBzGkE3FiLHiTzstbX65h?=
 =?us-ascii?Q?YD/8bVAzablTIm1DHz5xIOq2EqxLqTWbAv42sXLrfU2N/kJt2kaxdwgrIoKa?=
 =?us-ascii?Q?NtvKGjWhYqcAiHwRzzNyKyTRrx7omFIVtW6ANIlkkqChTt1zto2rY+1DmXiF?=
 =?us-ascii?Q?E6e7O7smAIEcz6gkWUnrSEOqUAAxJN7N+nI54QYt7a2hkeyPJMZb850aAg3I?=
 =?us-ascii?Q?pDPf8/FIavQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jpbh17t5hDxAvZFMLcJOgyJf2NqDSMJMKwVe8bz8nhDcFigxPlzJCozrGaS3?=
 =?us-ascii?Q?c4xD2bOGwVMq6i1jJaZcHhe5eI8m1/Xbm7URcwa0ao2t7o6abMQoXhMcp5f5?=
 =?us-ascii?Q?ajvWMmWPgkU6Fc+3SaHR3kKAjzHReoxkwHToZeO8Vp/TXPpQcqPMQQ12B7XX?=
 =?us-ascii?Q?B9ZaxZOJz9Y5SU3ruykZd3bzHKwSs6tUF7zUIdqgeGPYyW51unm28LIwpgML?=
 =?us-ascii?Q?7OF1+1rxCCQEJ2VsC6aLMx2UCxSFjjyQY4kiVlkunsILBhuEJn/+q/MRJ95y?=
 =?us-ascii?Q?JFDIAxWpktmi3x5unLyYqbZ/8SFSS0p3r2WabEnnZrBpfHT58sCiDODrAMz2?=
 =?us-ascii?Q?VjFlwd3FKGMPBc8EgEQoaXXzocB7QsmtDRfgYIOFdudxhKBSz2nsKZ7Ynjw+?=
 =?us-ascii?Q?Lr8mtz1WtVtew7OBuyhzRdqv7QK6RxcmES6a0pebmLSFgMvbAJClHSwqZ1Yx?=
 =?us-ascii?Q?VWrTnuJvKc3wA8Qf54Ab4DBimt18c/AOrdsVa2gw2Oen93awbhGKzd+kuneS?=
 =?us-ascii?Q?ld/4jWXagb6V+zENcVzykGl8doGskFshHS2C1WfqEhWXSkSzxVYIOChSkOCk?=
 =?us-ascii?Q?SEffcPQI+ZAV1SYaUIbtKUdC/kDR7+bDumWHbgWqUgl2QsSbtxDuZdWSXIrz?=
 =?us-ascii?Q?BPf1nbdSjGLWMH08JarU5bYZsqohqaA/vxJElcHFriCRy3jed9dk9OOIfPo7?=
 =?us-ascii?Q?A6NUrPEhyTg9p1vyiNcyxY9GdewXRC5KsvuMm3n5PkE2038Af3884k58JaJx?=
 =?us-ascii?Q?y54OCd+uFoDV8/RlLie8qLZOmIFsWmDD7c8bjlz5u4e1qUsStD5cKjGYmwZF?=
 =?us-ascii?Q?Vak7f+onTaQGWCuQHFK1UpZUhrrL0ALijiak8hZ8LUtSJJiKHJfu6t9SvTrh?=
 =?us-ascii?Q?jNKRAEFq9G688XGz4sVP2tGfGfdz8105XSAoOfg/5nsDjGFI9D66U6fKd+jY?=
 =?us-ascii?Q?ULZwXBYdbwotl3peR++4aual71rvDo202xip891e5GboACN2HTbrBtA653I8?=
 =?us-ascii?Q?WrokZLTBoK5pq+51V2WtIbp4wPC+lEkltMPX6VshWmyKZ9zV5I75EYQBj336?=
 =?us-ascii?Q?Fn6kEt6LdGm/bw8gipfVcRlWPZe+xl8gNPEZ3Xt8yiStHmHM/7K3qcaCpmKe?=
 =?us-ascii?Q?DiQXOSDBA5BV5gGBAIhiLdi5gH3xFfmWl/t6wShiMBn+LD9LL3BUh/TX5Afp?=
 =?us-ascii?Q?VAsN8TKLBS441juG54v2w4dauKcTC6W4kW+l3T+RS7p8ZeTiKjYtcfDpcNZW?=
 =?us-ascii?Q?jK2NlVvNaDmhsi7Q8fr56RK/p/823zYLXrUV1ftv/sVik6cXNG7Fn6kI3KOM?=
 =?us-ascii?Q?O/zDarBQPr3fIC/ZNoR9/ISi9vOqRnk4OJaDSQO6NGMpdsNeEil5OvEcp1Dn?=
 =?us-ascii?Q?jYIyYuiCCMkEJIw+/YuWPdIFrtlEC17AYU1SlR+xmogQ0e/uC8IHpcCuHBUQ?=
 =?us-ascii?Q?9T4nAeZwU6vQA3cO8Dp94TO4CnfR4EnZfINd59SqeCPBswo+DtWZj4UggXmh?=
 =?us-ascii?Q?RlvoRvz9KKVfb9pMP30MusmRAhSFTg5i6dseM0t5wbTUnHCJaOJCL+GBiEBY?=
 =?us-ascii?Q?Zf6AfgMNOGjRDSexCx6JGGGzFM7nB90WZK7DwcIEI/T5x0oPy2OPxHEmBbDj?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a40c9a7-7e02-4634-73d9-08ddd9dbdea2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 20:07:31.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV/f5mpLNXFM4Qyif8pZ3TkIrkDvKE62eyy6SIW5qwuWK5qDqlRBPA2RcYpTbrEYIMeMNu4aLccYamWGq22+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7989
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

On Tue, Aug 12, 2025 at 11:28:46AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation with
> command execution proceeding normally. Although the write operation is
> guaranteed to complete eventually, there is no mechanism to synchronize
> command execution with the completion (or even initiation) of these
> operations."

Can we not just use update emit_store_imm_ppgtt_posted to use
MI_FLUSH_IMM + a PPGTT address? I think we can get rid of prior flush
added in 3ad7d18c5dad7?

According to bspec 45725 for MI_FLUSH_IMM:

'Usage note: After this command is completed with a Store DWord enabled,
CPU access to graphics memory willbe coherent (assuming the Render Cache
flush is not inhibited).'

Matt

> The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT consecutively
> to implement user fence. However, according to the BSpec, the data write
> operation is not guaranteed to be completed when triggering the interrupt,
> that would cause the xe_wait_user_fence_ioctl to wait until the full user
> specified timeout is reached before checking the fence value again. Great
> performance degradation has been observed in IGT xe_exec_fault_mode test
> cases due to this unnecessary wait. The worst case is that if user set the
> timeout to MAX_INT32, the wait could end up being a hang until some other
> random program triggers a user interrupt to wake it up.
> A semaphore wait is added right after the data write to avoid the unexpected
> wait.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index c47b290e0e9f..1c9e7b35c665 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -34,6 +34,17 @@
>  #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
>  #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
>  
> +#define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
> +#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
> +#define   MI_SEMAPHORE_POLL		REG_BIT(15)
> +#define   MI_SEMAPHORE_COMP_OP		GENMASK(14, 12)
> +#define   MI_SEMAPHORE_SAD_GT_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 0)
> +#define   MI_SEMAPHORE_SAD_GTE_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 1)
> +#define   MI_SEMAPHORE_SAD_LT_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 2)
> +#define   MI_SEMAPHORE_SAD_LTE_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 3)
> +#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 4)
> +#define   MI_SEMAPHORE_SAD_NEQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 5)
> +
>  #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>  #define   MI_SDI_GGTT			REG_BIT(22)
>  #define   MI_SDI_LEN_DW			GENMASK(9, 0)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5f15360d14bf..189e764e3914 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  	dw[i++] = upper_32_bits(addr);
>  	dw[i++] = lower_32_bits(value);
>  	dw[i++] = upper_32_bits(value);
> +	dw[i++] = MI_SEMAPHORE_WAIT |
> +		  MI_SEMAPHORE_POLL |
> +		  MI_SEMAPHORE_SAD_EQ_SDD;
> +	dw[i++] = lower_32_bits(value);
> +	dw[i++] = lower_32_bits(addr);
> +	dw[i++] = upper_32_bits(addr);
> +	dw[i++] = 0;
> +	dw[i++] = MI_SEMAPHORE_WAIT |
> +		  MI_SEMAPHORE_POLL |
> +		  MI_SEMAPHORE_SAD_EQ_SDD;
> +	dw[i++] = upper_32_bits(value);
> +	dw[i++] = lower_32_bits(addr + 4);
> +	dw[i++] = upper_32_bits(addr);
> +	dw[i++] = 0;
>  
>  	return i;
>  }
> -- 
> 2.43.0
> 
