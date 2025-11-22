Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D7ECFC51D
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 06:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073D210E009;
	Sat, 22 Nov 2025 06:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6pwEO1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809B410E009
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 06:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763791844; x=1795327844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k9bcTr9WVvexESk8KknPZa3K65JGXYJ3xR+Pmq9GMGY=;
 b=h6pwEO1bP3sp8B4kkuP5s4qRSech3EtZheuAQniCeuHallNdYUnDKYTc
 r6m5+KoGVT36ZXF8crEOKmtObhXFItelQRijQivs/JvaGUbHuEYTV96UT
 bISILEH32bXMQvSgNdqVHg/rT61rlrl/E36Zc02Ij0Fm9bsVEhlQiKjW3
 kdozBvGbyboloh5v2ulFijbjpCjhxkTqb02pwutnghgvdjQgb/dP1ug4y
 tr3Px/zpK9YcridtRfGFTpIR4HHiOT63y7aUaBPhMuYjdp/QqAfqnrYqs
 qM6VbRcMXOlYanjEJvpmF72zwgMV8cUUtf/sooYAkVmdXKFR5Fke+en5j w==;
X-CSE-ConnectionGUID: UXHVT2lRSb+qSR4VLiZI0A==
X-CSE-MsgGUID: XAYZlXGeR8+cPxESqTrM4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65831967"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65831967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:10:43 -0800
X-CSE-ConnectionGUID: wAFEtQkgTKicIJ7zW7Bygw==
X-CSE-MsgGUID: IHD7oqalTTGl96Af3nmkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191543311"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:10:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:10:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 22:10:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:10:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5DrESf1cijGsAjWOEMOCCBOhP6aJRtDSFu5YoXyab/Lujz40mCkI5uIRw2zwtc2c3mvjpAC2eZLIhGiFTeidLEnrBQoyayq4N6xI/KVsYPmOjXqHsPtMxVP83rK+slw+sLZc3gdMKvCujMlWN5negyfGr9L2do0w78DnxpZbIki4AdQDurG6YyPK4G+/tQtBKq/9P24+2EyLPVVs1Ic3sYKCXZg3Z0bGMTR+zoTuMX6KpLdRBZAWnE8yXnru6le8uHTZ+x8YLNd8t0Bdmai4cA4BZsOjM0KY6RFIQDjK05KQ7JStHMf2LEJJIz+LkatWxsjobbAkj8APDHsFwg62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7ZLRbx41nflha7sMwUHt60TbVozzAjTakkkXBBU+cc=;
 b=UkoOY984tIQZ24eKsIIeLCAAwxcb0IINd7YGOzz/GJ2hZBqfIgG+SDe0kbt28tXVrVLmnhFgS3b9J/t9cSka3QYz5mpSjl/jBKxHBm4CHTRUxQ2SdtkoPQi/gT6Q5tjaFWapLlLUIb2y207cghechiQ99BSQvS3+F/GtxwhA3//6y3juJN6CxcCV3a6eGXUMajD9qEKtlBdnOTp2o+/WelHAFLM+Ksk/ggjtdUWmg0ku7S0RcJtC7G8ON5t5ZY6nfIXGf5kkG1gpgu3OP0YfKvKJ6qBc9SftrBYyk097fuuMFi0ms9DcLKMHlEMlxqZbsjZrevC1RZHrlc0yc9lmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 06:10:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 06:10:35 +0000
Date: Fri, 21 Nov 2025 22:10:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 17/18] drm/xe/doc: Add documentation for Multi Queue
 Group GuC interface
Message-ID: <aSFT2AXzPg2yM7/o@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-37-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-37-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eaad256-8bbb-494b-4936-08de298dd991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iz8BXayG7T0SBpqiubipdymmWfw7mGWQA1bZB6aZnZ9j5krCPGddYsp7uvmh?=
 =?us-ascii?Q?y8tbD1IpfU4/6DHa2R4PzVx8sNDTtOXsXXbzqnuqoi/iV6HdqcSKcE/V/ijv?=
 =?us-ascii?Q?Zz/Ub7nCmvbYgH0dyo4ReWuVEnw6WduTryI2lqJRJz0OpR/ygWglB7yha8/I?=
 =?us-ascii?Q?BAzzu0whuvWiE50IeySlw95B7aTmhToSclLfdX2Vh1FcM2DcKMCzZwmPlYog?=
 =?us-ascii?Q?TlHFspfTAk7DmvJBx992l3+i+n5uvL5gL2ti7X8FEGf95Phaz5ktzv4J5UMA?=
 =?us-ascii?Q?9vkcTRYnjqweoNo6HBfQf7evbm4tvdeSFTA0t+y/QAkfmJTCG6/aHgCNCy+5?=
 =?us-ascii?Q?UIpdQ4VYNNP92ZUlGcu02mFj2FzjSDLfY/RiTfAZe10YoML86pSRgalmCw56?=
 =?us-ascii?Q?e9G3MXXUiXES7gm7qe1U6A7ePFN+v5x3j2dFZOfnmMPAkwyIp5PdTWrot9sW?=
 =?us-ascii?Q?+pFPZCi2CFJ7C8i+GHFl3uRX39EioDnE4E4zR7kJFrSb34J8M4DhEyBX7wm7?=
 =?us-ascii?Q?ORAIWmUeUmP+V/eEC/6LGa+xkdz3AHDXigbaT3trfTOA0A0Gi9RayLILzMvm?=
 =?us-ascii?Q?bzQmfIf1jBTKRDKJJmYZNogcUvt8rpLGgpJbNGS4jXuPKPMHJJ9kr2KfnzQz?=
 =?us-ascii?Q?KVLGb7SuXnSKekxesmihRJAaOdjl9Fmj/NfBnHu4/0yfNuZEGJKIBMKl0Gkq?=
 =?us-ascii?Q?N0t7UlWP555Gc+RsoGkbSr+AB1xP2hEP3dTcSxk7BmfaYVknCDxSbkrYom2f?=
 =?us-ascii?Q?GBNf1yM9D2N515jQH69U48ZJQUWYs8iY2HiEoACzrTSCuo5/dTlPZmBDLI9f?=
 =?us-ascii?Q?eEYiaZv6igW8HN0e0E2tC3kGywOVYi113aIbD3twfrdtW/DR1qy2UOgn5Jlo?=
 =?us-ascii?Q?DzFC71mnNrE7QLdJ4wv5zy8eUO91/BdCvmLfrTxLWZ0vPsDfgRS/W381bWDo?=
 =?us-ascii?Q?l5lvy52pGfg187mY1bFhIRg558q65D2L1Rbbn2tmxYHO2tt09z8RaaotIWwD?=
 =?us-ascii?Q?6yQ63HVjMJuhLMbGB7ttsiX+5LRNwnzrahIEykhAmme5sv18/il840v9WlEX?=
 =?us-ascii?Q?qi7nZk9j9ttkUeqDV9sN2DNzXAjJQUlXOUagwsahu9XsH+v8ZJdPSFakMLc8?=
 =?us-ascii?Q?biCMd7SPzFFeXN1on7cbV3IU55F/lp1EZ933yc97bffBeOTaShPBfuDuJCfG?=
 =?us-ascii?Q?76m5TLG8mtVr4Xxl259/kc7Zt5QYxfxlI/qwqYH/KI1v0vX3QqYc+Iv5ezOZ?=
 =?us-ascii?Q?5vgCcesjtgGxujpLGaBoo1MXOhBL6H8MqsOp1mgshY9cRaNsyF/kYy1G6gT6?=
 =?us-ascii?Q?edth0uqlppwHlCg1+01FG/jW/S21yN2hHxtVGl8EytIkCYw2lvu9yCRTOF0X?=
 =?us-ascii?Q?BvFi6Qfa19si4pMnxTjuDz65TkG2GIWzbqZGz5YoFcvZt9v1z8gza1VEkyBK?=
 =?us-ascii?Q?7YSPu7Hldl+pMTxBkWumnaohrwSajY6S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1H6Frp/7gLwupyiRIrIl4VryL00dHJxlKmeA8Yt9qODg17U6yKY4qVid9Jr5?=
 =?us-ascii?Q?HiunXfyAIo1qnfbWKJi/7kuKNU3ltKMT/w6nl/8KinX+M3SDpEkaSIydGrGA?=
 =?us-ascii?Q?Uf39WDSLfUATn+cN3qzDzRoepO1aigg1v3x3rTNPozmMbyXAReWVjvaTGecZ?=
 =?us-ascii?Q?DlVTysjbzCpMrQSSQ2A7ubexAE+m2y+l5GmiP+E4qvll2Af7QLZbK2RRNgAL?=
 =?us-ascii?Q?xjbl3eBSKw7xeIkgF8mMw7SD2jKoTkY52ZKfW5iUmOFF4vBgWe41GPnYofOL?=
 =?us-ascii?Q?ZvyTC3YbGYS2hikKMeqAr1E+/3JJJQb7PPcwvlB8uxFbg2FfiL/vqJ0rnrBn?=
 =?us-ascii?Q?9cCIeRSPzLJYFDZdtv1K1ogqOljzCCPAFJSQKZ3bIThOWzGQymWD8eVk2P+F?=
 =?us-ascii?Q?0FD5f44G/+69uOG8BN4PTCoxMfD4ekX4aEU4+rmgLACOcJwtNOTkUDOne9uo?=
 =?us-ascii?Q?oQF01zKZBZB8DyMg+fjoPsmgh6NE6T7tld3HcpWgu0Jno5OqT6AZd9mrR5T9?=
 =?us-ascii?Q?0lVYimMGF7PtOOteKPtLry5ZIkg5JzCGqe01HjtJyJooLyrlDZpyJcpTDk/T?=
 =?us-ascii?Q?HzCJ46jxjaezHc2Bust0OK4oYrTBsVYWe9DmvpSvb+ff0xXVDQ+6Uj545aIy?=
 =?us-ascii?Q?HTo7dxOnFCjZiWMwxFDIUxJDGXY29kavZ7xRq89QjwyPbIXX6JWVVM+lPAxa?=
 =?us-ascii?Q?dkqTCNf1g251F5QmxjYgneaidZqVxh3eQKFBjZ1q7Kr7MtRzynEo/TYUwUF5?=
 =?us-ascii?Q?C3STfCllDGNpk717Jgooeb7hoA+VqseOt7rnubGslKgmaoECCnaSJKyBm2o8?=
 =?us-ascii?Q?0TOBTqVQkcSR2yEaTegWZxUfws2symnHPbvYv9025UIY4iPI+VfAe99vCxr8?=
 =?us-ascii?Q?q+uPB3mqsFhKci5ClMhNg3zYD0JDr1kcM7Uc3Sxh3BKSr9IOz5Dl2JmQdg2U?=
 =?us-ascii?Q?RNw8u/wGVKWdOSVwhgQWadJyz9CQOsrJCQWzdG0mgaDDwWwYtLy+65aRl55G?=
 =?us-ascii?Q?p/6DyBZlraGyf7vmSxzWGpuxyJb93AmK5J4TyQP+c45ntILJbnNtdYoRua75?=
 =?us-ascii?Q?+rc1Xn/44Ygl/h9m4/YXENTANQG8xJHfq3zmBmAw7OKxtXitKWxEAGU8+MaO?=
 =?us-ascii?Q?+0edDUKz48KgR3I5iS4ic9r1XOlrak0WiK+t5q1NC73d3uxJdPzJHkCp9QwR?=
 =?us-ascii?Q?7fgKvLqaNDWamFTeVeYrExSA31pwglul1U/L+wsvRkfit1PiNvWZBzMGHZoa?=
 =?us-ascii?Q?IKwJlTAOZpogglD6/HI2+Ge0kXXbTIm31By9d17yHWfgbDw0dUCUiO51qeuK?=
 =?us-ascii?Q?8edl4wAG5jA7mJExyKfFXNmxsOFBt6BPjQkWFvXqyQOIBiLJxomFk4ml43w9?=
 =?us-ascii?Q?IgFC9BxyNVOFOp/vMg6D5t3w4drOhCo2mIFqqF8JyUjsFYBhS+RyD27FX4/z?=
 =?us-ascii?Q?En0DRUp5AZEEE+uk0nl6eKZKk38uC+0CMm0zEt4PDaD28zGosABmP9rxtSBq?=
 =?us-ascii?Q?j3dvDHI8ZFwUlzkiw8LQ+raPV9LAbGtzQtKjN1BsykN7SDfNsvHmV9PoseVS?=
 =?us-ascii?Q?z1u5Tb/cgeZE8n1r88AGmkSY2aDDJEie1eKcvizXLqqeSZyiYbE1uiXCbfGv?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaad256-8bbb-494b-4936-08de298dd991
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 06:10:35.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hYWHtqFBvd2mtHyhLYmyHBUrEv/wgYoowpiW1RXLlToxFcp3sA4n+zXQuOP8TS/iXmchACrKoCSdvmPO5MiEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
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

On Thu, Nov 20, 2025 at 07:51:51PM -0800, Niranjana Vishwanathapura wrote:
> Add kernel documentation for Multi Queue group GuC interface.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  Documentation/gpu/xe/xe_exec_queue.rst |  8 ++++
>  drivers/gpu/drm/xe/xe_exec_queue.c     |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c     | 57 ++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
> index 732af4741df4..8707806211c9 100644
> --- a/Documentation/gpu/xe/xe_exec_queue.rst
> +++ b/Documentation/gpu/xe/xe_exec_queue.rst
> @@ -13,6 +13,14 @@ Multi Queue Group
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
>     :doc: Multi Queue Group
>  
> +.. _multi-queue-group-guc-interface:
> +
> +Multi Queue Group GuC interface
> +===============================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
> +   :doc: Multi Queue Group GuC interface
> +
>  Internal API
>  ============
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 50326b4431e0..387497dfd5b1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -97,6 +97,9 @@
>   * When GuC reports an error on any of the queues of a multi queue group,
>   * the queue cleanup mechanism is invoked for all the queues of the group
>   * as hardware cannot make progress on the multi queue context.
> + *
> + * Refer :ref:`multi-queue-group-guc-interface` for multi queue group GuC
> + * interface.
>   */
>  
>  enum xe_exec_queue_sched_prop {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbe3de30af60..86946760ad0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -659,6 +659,63 @@ static void set_exec_queue_group_banned(struct xe_exec_queue *q)
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_, val_)
>  
> +/**
> + * DOC: Multi Queue Group GuC interface
> + *
> + * The multi queue group coordination between KMD and GuC is through a software
> + * construct called Context Group Page (CGP). The CGP is a KMD managed 4KB page
> + * allocated in the global GTT.
> + *
> + * CGP format:
> + *
> + * +-----------+---------------------------+---------------------------------------------+
> + * | DWORD     | Name                      | Description                                 |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 0         | Version                   | Bits [15:8]=Major ver, [7:0]=Minor ver      |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 1..15     | RESERVED                  | MBZ                                         |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 16        | KMD_QUEUE_UPDATE_MASK_DW0 | KMD queue mask for queues 31..0             |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 17        | KMD_QUEUE_UPDATE_MASK_DW1 | KMD queue mask for queues 63..32            |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 18..31    | RESERVED                  | MBZ                                         |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 32        | Q0CD_DW0                  | Queue 0 context LRC descriptor lower DWORD  |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 33        | Q0ContextIndex            | Context ID for Queue 0                      |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 34        | Q1CD_DW0                  | Queue 1 context LRC descriptor lower DWORD  |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 35        | Q1ContextIndex            | Context ID for Queue 1                      |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | ...       |...                        | ...                                         |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 158       | Q63CD_DW0                 | Queue 63 context LRC descriptor lower DWORD |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 159       | Q63ContextIndex           | Context ID for Queue 63                     |
> + * +-----------+---------------------------+---------------------------------------------+
> + * | 160..1024 | RESERVED                  | MBZ                                         |
> + * +-----------+---------------------------+---------------------------------------------+
> + *
> + * While registering Q0 with GuC, CGP is updated with Q0 entry and GuC is notified
> + * through XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE H2G message which specifies
> + * the CGP address. When the secondary queues are added to the group, the CGP is
> + * updated with entry for that queue and GuC is notified through the H2G interface
> + * XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC. GuC responds to these H2G messages
> + * with a XE_GUC_ACTION_NOTIFY_MULTIQ_CONTEXT_CGP_SYNC_DONE G2H message. GuC also
> + * sends a XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR notification for any
> + * error in the CGP. Only one of these CGP update messages can be outstanding
> + * (waiting for GuC response) at any time. The bits in KMD_QUEUE_UPDATE_MASK_DW*
> + * fields indicate which queue entry is being updated in the CGP.
> + *
> + * The primary queue (Q0) represents the multi queue group context in GuC and
> + * submission on any queue of the group must be through Q0 GuC interface only.
> + *
> + * As it is not required to register secondary queues with GuC, the secondary queue
> + * context ids in the CGP are populated with Q0 context id.
> + */
> +
>  #define CGP_VERSION_MAJOR_SHIFT	8
>  
>  static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> -- 
> 2.43.0
> 
