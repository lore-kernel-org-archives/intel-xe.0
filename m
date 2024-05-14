Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC84C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 20:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E54910E441;
	Tue, 14 May 2024 20:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJ5ZeD1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6548110E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715718328; x=1747254328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K/Hg7Z6n+wOlw/XQExsYwVtrOZSCV0TCWuAGjMO7BwQ=;
 b=TJ5ZeD1YSzzTRD4prZkJlUuzDc0p1NzG5x/amJUn1X45DjZdph2xIQQJ
 LiFu9zqLfUMS5ROdq4opaIEryflSYafSrdeYoa9jOKZmHH9YZheG0MpJU
 JDTfPyJqOO6br99YO9wBS+FzpTifu4ZPXVGheBdzX2hue9Q15ljII1HTS
 e8O15Hr7Sib/fFPgj5f8AOc1vz9lVMxJInjrHAuQ2GF4F0sUTM7wjp9y7
 DI8dKOEkxPBwSMNHjqm9yv/SOv4SPnZZuw70PC0WIJ/1D5TKm1lzFgExF
 t10/eK0nvwRRqXpJSNsRBuHgZIqCCb8ck/MHjHOj6qoqDcBTlnWT/qqBn w==;
X-CSE-ConnectionGUID: gyL7GHHZTRO4b7UHpf9dZA==
X-CSE-MsgGUID: 209dH/8iSjGkJl3OoknFcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11674009"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11674009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 13:25:27 -0700
X-CSE-ConnectionGUID: 4M04kMvURfykPSD3cdCenA==
X-CSE-MsgGUID: Rek/KQ+lRXKOMYi85mPjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61626978"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 13:25:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 13:25:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 13:25:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 13:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuhVL3xXac1SS1BaUxVTCI59DCdbF2STOrAlPdZ5QyUfml5xKiDA+pkLr8KpS+UsBtQeq6dUAsExkUvNDFD+mJhxuGnNd9bKafI6eiN/0hweLaa0yeQJ9+7koS6h6a+rEna8yy0xhJzUzCTk0QyKtmnFDXCSEtgQH+m2Kxo2iXfZScaqUOnMwZI1ajf2byn7yr1d14Ub/gInLR+NcNQNJpl7h2cu2wBP9Av06I/5KIR0kd8+5N8dYuUs8D3zTGpn4wSb2fqvMTfayV7fW6ggpM5R2SsgJPENnOrBbvf0yG1HeADZlOL8xFMPgx9f4mcs00UJxHKVCViYtBKvVuWNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iShukmXIrf5+1+GJWnLL0ECD0yaGdyvW2j+MUhhSyc=;
 b=KRC58QoyhILqDmdOjCE8O0NOlJjbrkThOAkXbZ7D9R34MUv0mj9eq+SDrobWYM25F1vpZ7nxQnDX62iFzqYt8QR9EII5Z4XiR+wRt2lxE993qfxS8F1QZMa653W3ZpIqp1TUHBXG2tNIVadM+Va/qnAZ8a0oq4pYJoPEcZ3tmdRmraxhi59QCz+PVdJ/TNQTuNHqiaUvH3TvgMbhfeG/KSs/LtTFewQJGAxKSU04KpWm1k9WAcmXs/vCXqlXJnjCW5d3TK/ChPsKmgFzx8g0TSdcFp2VSXQEfQxcUg+EmUGM3hsW7Vo/6H6mzVh8DTTvijXKDyZxMLNTj/1AziKytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 20:25:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 20:25:25 +0000
Date: Tue, 14 May 2024 20:24:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/uc: Move GuC submission init to post hwconfig
 step
Message-ID: <ZkPIijI9aaLrdVlx@DUT025-TGLU.fm.intel.com>
References: <20240510203810.1952-1-michal.wajdeczko@intel.com>
 <20240510203810.1952-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240510203810.1952-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 893ff4c6-e448-4f5e-1920-08dc7453fced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0ZTKyNSTqTXFKHEOI2GE7EZM5oEkV0frYlfustBR8h+VUfxdj5P8Y6Y06/yW?=
 =?us-ascii?Q?JUBu1Sw+mGdbNlMx/aRtc0MorcRtU2W8W3gdM5/LF30z7ScMwiH0zgqRd38K?=
 =?us-ascii?Q?Nei3C9fCpYnUERSrX296tqL2cYWDAgnOk7o0ab+ftoR6mpxT2M22SjDseubp?=
 =?us-ascii?Q?pOdkH4FlLmXHl5t47m0+f0GjD8oVt3NNeDjK4KsOtHUzWAEVA8DnpLcAkjxd?=
 =?us-ascii?Q?Z5b0wKH2EIgiDzRKFNnN4qVki45I10Ns9rBfhElKz+RWNakq0vU2W5zM27+w?=
 =?us-ascii?Q?EqDptjGE5mlo5CIAQNbPCtjeplj08106V1XAKuW9AHeZMa8WCK0yNCvbOVUe?=
 =?us-ascii?Q?7UPFt+mYjMBipgFhYYlFVjvRVveRx0tQTlEaoGoBQD1fq0OTHIsR4zGTrHBe?=
 =?us-ascii?Q?Zv6Esi/+BX0DoY3IRQQyoztgcJx+TFV59BwEE7C4mu7gDb1nEb/2gnCvXU69?=
 =?us-ascii?Q?LYBMcPoCYtgPJhBg1YiSG698nYyMnDM+MPBC8/AjHrh7UlcAT5ZLwD6rehMk?=
 =?us-ascii?Q?82cL7bfebBYtNLKZ9QLehzp01cQ00z2x7qHyIKOqvqcOXk8EFHMytZutoelm?=
 =?us-ascii?Q?BXXBosh+y1JtHjdk+1X6OH+9djrGStGS2zo8wZ1JOOuVWo9xDZ/dSHvJFAQM?=
 =?us-ascii?Q?+wP2c4iqQ4kLmG+5GWBql4owOhwk/J6AElpn7OVgwWFYPDR+J8gYbWxXMcwU?=
 =?us-ascii?Q?wBY2v93UiYt4xkzVfy5+hCgZiVYI5zFTcyC7etA65/v5B85pX4sf9iUyhwjo?=
 =?us-ascii?Q?GYk1Xs/UxsDGYWgH8VHHYYSqVBUiFQaQiyEoBq9eICGGDsmnDWiTRfJBBbDh?=
 =?us-ascii?Q?0vppEfZRYZGSynAinPf7Ex7v26XR13hwDhLhZSAVjygMb1daKFJYhPQmokuj?=
 =?us-ascii?Q?j5NHrb25qEpWIQMmxNgpZ+Db+PQM69q24PyEnOyUDC/VOmGIBxNiWLHYr2VC?=
 =?us-ascii?Q?JHGY42PtdKYd9/rtn/d/yskOyucgR6TqnRAEsMR0zxPzMhLqm8sQhk7hqKJH?=
 =?us-ascii?Q?Jsi0OKL/WkgoaV9otEXJ5a1mdSY1dHaOJ+znIvKq54Up6YMTruxvNmv2oF3u?=
 =?us-ascii?Q?sL4Npp+smiiuJ/HWZFc2frBg9Kfi1Tpqikm9DmzLRrb4zZSAzxo/ujLfcYRE?=
 =?us-ascii?Q?wu7cViSNUkLdHCjErWoul/cHSAwECf1B8df6AIG6rgYnWZwzd/3+jtO1T5Cm?=
 =?us-ascii?Q?7svIzfza0wRzVfbiO3v54cn439Z9VvE5aSLn+qiWJmbbwU8THu11onLph/st?=
 =?us-ascii?Q?GgZidK8upXXscibOfWt+uZIN+E14lP+ma723rRvwHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ek8YcrPJKqid9biaL0anho5FtRZDSy5LH86gG7TtB5og+ZpMVrPSY6hg+e7o?=
 =?us-ascii?Q?F8LUEoBSWIVUMNRL/fLSUvKlv65chPGxgMIm23tKwK49dXoOwBcL5dF2swX7?=
 =?us-ascii?Q?A41baLxbLiKAn6q7kZe/rt8XZTe4aPlClNRlwUzw6EyyqspWHIOnO1+Zo4iC?=
 =?us-ascii?Q?jgPYlbQGYXSgnXJpy2Av50NSd2PmxqgSQRSfgp2XHaUTZVJ3DQninAMQvbLX?=
 =?us-ascii?Q?sLjIcL1MEIHopFhck0PYNApZFZyTQn4SGTCdm6b9ufQLSJrXKpUNHBcZU5+u?=
 =?us-ascii?Q?9v0luaAWwLn/4qQfrkJVJ0JiPDaLbY63opUS8xalEB4UH9/kDBqccP8n98vX?=
 =?us-ascii?Q?hkosXkNKEbsH3I2EEdqYudu7D+eazhCe0Xu6V60tnuUi7KgWtp6xHznhjjVG?=
 =?us-ascii?Q?2PgS63CH7xkDKA4TWRiaVj8f1FFondXwIylddKeZH/ZZwh7XY96CrlR43Dzk?=
 =?us-ascii?Q?W8Jx7Flv7gt2njHq+b9bkmHxlAXb5DZ29T+L214GLG4Yr6ya2/06P+ggH5P9?=
 =?us-ascii?Q?t5LJqm7sOz5NSzg23O34sxk9KN9fLDeQMtqycdB7NriNbhw1t5/+zndkUqwo?=
 =?us-ascii?Q?lHIMuc3hebQlQnHdN/sy5ERXJ677fM+bVKJ3s+H02c74RDJaJH506jT/X9iV?=
 =?us-ascii?Q?Ih4gRLJWGkJVprdVTUnEgWuuZia8mJYnKGF9EIbd4cOCuNqVRpdwqK0N3gTl?=
 =?us-ascii?Q?xEKY6UOm+p6L8hsarD1niKCgIK6YG/ifIMxn0tFGBTopEj+VofyflJR0EuSm?=
 =?us-ascii?Q?/vT19pbnhZKPo/TwM7fT0BBiQH3rzBiRPQFd93y2Rb6EK3bnnwPQGNn3f7oY?=
 =?us-ascii?Q?SmtVlLxoMM5N+f7Qvbvoew0s7mlyDGYREa6bOc9gfd9R+vePCbFqOBpGCWbJ?=
 =?us-ascii?Q?xxwupyibtV12ygQo9v8lAhjNKBvCPpYoQEoxA5RLR1Rm7mRJ+gOUkEeLtN+O?=
 =?us-ascii?Q?cIe+8YwIMBJJ1frXAUJ6xrGQ5bfGpMi6m23jNVDEzhRJJEcn4krrsjmAnXS7?=
 =?us-ascii?Q?N6etnaehdC7EnNkbsEbuY8aKXa/j4U/by6j9CjCG7K2OrHtTocalpP80c932?=
 =?us-ascii?Q?goTwqa/3/t3q9lbSQkMCktyBLJDaqMhO/TQLABC3eK4KwK9BrAceuxibTSVf?=
 =?us-ascii?Q?sSFdazJk7/S+87wXAxWq8IKJEw7eCZ+UHa37aBD9TCLJr0Xy3h4xjIjgnAtn?=
 =?us-ascii?Q?qAJs6R+5gEcC4cg+hXiL0LtqFxUx0R1wS04OvMW6vkAzUYdswYctz8ldnLu2?=
 =?us-ascii?Q?FUXOmIcuWvRkXxjVEyrpaqecHSe8ZPOOr27x7Yy6+jyWHO5SIKkB4YlNfram?=
 =?us-ascii?Q?xCkAM2hM713dJlu6CpPas75PTFpQelzJXYLW9YlCyohzsl8jAK9HT8JccIPl?=
 =?us-ascii?Q?ZpT6SfuXVntzeq7ApR/b36OiQIgn8wTSKid2V6WnBsQy4rXuAEyBKzinsmd7?=
 =?us-ascii?Q?gyPNEwSscWMvyjkmIPAZQUuAlEK/s0V0jWQG6WefRHwohXgmBQEt92RHyl1N?=
 =?us-ascii?Q?vwbRtbY7frYYyKpG1erFqwg7k63tOVVbsf36DlosMXXMamt6E0OIg93q7wm0?=
 =?us-ascii?Q?qZJzOa/OFsTY0xy4bufyX/R4oU1ZE/1EMDMEWybb0iXdcBPDM/rwYKFieHpK?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 893ff4c6-e448-4f5e-1920-08dc7453fced
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 20:25:25.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cj4jAxUej7YCV66BZjmcyPmbYfsJ0vsb6aCbMgMJ7OQjBajfQ83SdHgwc7ofnGIbJXHK0NiEQ+xHnLyovYwpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
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

On Fri, May 10, 2024 at 10:38:10PM +0200, Michal Wajdeczko wrote:
> We shouldn't need anything from the GuC submission code until we
> finish GuC initialization in post hwconfig step.
> 
> While around add diagnostic message if we fail uC init.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c |  9 +++++++++
>  drivers/gpu/drm/xe/xe_uc.c  | 10 +++-------
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0c9938e0ab8c..b1bb94914028 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_db_mgr.h"
>  #include "xe_guc_hwconfig.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> @@ -356,6 +357,14 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  
>  	guc_init_params_post_hwconfig(guc);
>  
> +	ret = xe_guc_submit_init(guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_guc_pc_init(&guc->pc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 45035e38388b..0186eafc947d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -10,10 +10,9 @@
>  #include "xe_gsc.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc.h"
> -#include "xe_guc_db_mgr.h"
>  #include "xe_guc_pc.h"
> -#include "xe_guc_submit.h"
>  #include "xe_huc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
> @@ -58,13 +57,10 @@ int xe_uc_init(struct xe_uc *uc)
>  	if (ret)
>  		goto err;
>  
> -	ret = xe_guc_submit_init(&uc->guc);
> -	if (ret)
> -		goto err;
> -
> -	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
> +	return 0;
>  
>  err:
> +	xe_gt_err(uc_to_gt(uc), "Failed to initialize uC (%pe)\n", ERR_PTR(ret));
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
