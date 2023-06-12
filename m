Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9410DC7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 19:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2210E0E1;
	Mon, 12 Jun 2023 19:50:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBB410E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686599446; x=1718135446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kzeBb2qh2/cGOcrmHBBb9sgy5hq7xSrz4X6VP4Sxjm0=;
 b=EokaZnz6l9QqXmIqwNCHhorby1y4J+PtAncyTct+pCHiPQyEIFvX1R6C
 FH5eC/sLllh3JjqSCDenyfGYgD/J/dvwVPUeaU5NIF47qJNqlYF+i6rtB
 FPXyteDi5yN84bXf72/2asRLLguiQdUzHbErlxhtVgmSpYb++NZuuqDOC
 PpAXp/p8W/6Asnjry3HJvcl1+KFBpm72HMgVWAA0E2bCtVgMnwp67ZtdU
 2kFmocf5XkC0LBCj5+JYcau/9BLVUWlzmnIjgK77UQAddvZLlF6ws3uOY
 +7dBfVqRKlEuSza3+QL/7fw1qLqfxjr/sSLOQDbL3N8AeXuO7n/6sB0pu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361511286"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="361511286"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776513356"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="776513356"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2023 12:50:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 12:50:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 12:50:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 12:50:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMTX0mS9wy9WEuz9ablOGzuKFkro/uYAMSSzcP2TYrAOX8hp/TwIYLoYvmDnLv5jKuHrjMMJNF35umpUtehwFaqWJAAWzBn9Hin22u14mv7lzoGfhltHm8Rh85YJYyirbw16jmiVd38xiDiuyOzq20se8ynBKxdGbclg2HLjIrnCwTWHCOol+gXpoVywI8q8Ga+qyPpaR0qb7jf+nrrCFcBI8m1BuZ/dusw1iXHlgTLTB6l+xA6zSYq42beiqVQnZZAHPrWsV8MJRsHCyZyIdjZ9qDIdaFClGvkAE1Z5CtyZ2DGSTtjGhcCysZIwoOsx/36YxUdTO1wF65CgJP5MtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2c5g9y506k8GK6yoT7K5VsybKXxMJcxaeg+JtHmPmR4=;
 b=DothLxFcpYtZRtIZw/rJJ24Yz+3TaFyPOeRWMDRZF/yMD9q1BIIqdbAOLvExNs3i70gWbKbXDnOoEed7eH/vBVMQHLXa9lki2yyNjH3t4ahbjfcG8lfavjVXbsfzyqBy7uXt3umapLLGFVK7xzTVugyRwc5LXYPSXzqHUKJsutoTQccmE6SifLDfWUHULfSXTYpBQkP3urcI80eksHnrQlldpZo+fIalvlfMqYegYT/k7XHLSVAOr6Yj77t8YjzLAdIte2kNnFZhBCLXnV+xPmlol0bI8ajU9SBbtPyC4GTlXbDRyBChyrFXCbQK4zi7xtYJGfUcuZMIXc5osbH0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 12 Jun
 2023 19:50:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 19:50:40 +0000
Date: Mon, 12 Jun 2023 19:49:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZId25CLnbhvWPyxo@DUT025-TGLU.fm.intel.com>
References: <20230611222447.2837573-1-lucas.demarchi@intel.com>
 <20230611222447.2837573-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230611222447.2837573-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: d31883d0-bcfe-44f2-6153-08db6b7e4d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYxNciOzFGM6hmWsTUZ2DD6WQWgHohwMDJvKMdWnwO8NW67zGgMWi8aKEuib0B0gdC70W9Ua92sb9YrD0xklIuzrLhh8UZcpB9SvZhsHKJaSAE9bqGX0xGkVM6N67Co/+rZUeLDKiJdOoyILEIoNq7buu3Rbko7/tlv2jaDsoDdA31KAwLB6kI98cGtpbmJRYXF4udo2t/ShiHJl1FgY+LLFaftuGlORM/zLk+DIT38+8+/NTbkJ76lxo2moUK2S8u3YlU/kz2qY+N9zjtyB76KGXEoyqVzC/oZxgNtYHE7eGdvlVPUpKJBVks9IHVPG637tGil9+pQYp0zH2zidOy26Ugf6SjapgAsNc875Msq+tn1StyW/luSoZ1QdDYgJiPt1YHEHeQRmgRrUVFcn6hDMVQXq+26meHL9AAIExrCGGhvwipqQTzqt34XyDZTV9bVU81rPVcyet/mhgIhj2dJ8lVQsLYm+hZdENOTbUkEArzbeHJDZ0uKaJht8mT/OCaZvjPfOk4TB9KXVTaf7zXBp+QvGFnfiV7E1i20TZkpokAaHw3n5a//89LzSiz1F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(82960400001)(316002)(38100700002)(41300700001)(6486002)(26005)(66556008)(478600001)(2906002)(86362001)(6512007)(186003)(44832011)(5660300002)(83380400001)(6666004)(6506007)(4326008)(4744005)(6636002)(66476007)(8936002)(66946007)(8676002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sHm8rRsur3nopgrzB7pe16AtLGRQtV2Jt6HhoTYEv6FDN9ArgmYxMpqk8mG7?=
 =?us-ascii?Q?ap83E5sX2ekS5+4abN/c0IUeQp57m2QUUHI8Wgwb08LFc+LKd4Bybab+N42O?=
 =?us-ascii?Q?h0inFdC+06U2ouIxOiAWQZuzGIDtZCx0pS2YkjiUSDayqq/uz+oNrY0T3O3R?=
 =?us-ascii?Q?n2uLZlbHFDkILg7iGPrPDJ1xNNR6VDEboxYEtTWwCdyEQ/VzydGOaaaiWChG?=
 =?us-ascii?Q?MyquXg+EB+cnzedg06htwubwDrXWJiV75gx/U/8lWF6AhsqpDGnbcsEgNeQV?=
 =?us-ascii?Q?zakImsHseNE2hFolOZlAKe9NfeQHWO5NTprvSaDbavqIsxbyrOaaEax4ogCt?=
 =?us-ascii?Q?QfJt333t3LDgICP/ONaMnBMiFFe9u8mO2e1UEQaVSqzUnRKRFZYUaD+cU8kf?=
 =?us-ascii?Q?zPhpwbo1DsmppZCSjzAlYlkyg5Jvq73opqgMJEPVO8fghJRZrmLEnRwNiezN?=
 =?us-ascii?Q?o6aL0hiElFMPXd0rvdkLLcjeaApPY4lqRDc6j28yxKgoWGWRevakZC/k7+b0?=
 =?us-ascii?Q?4O7bc5J1Cbu7lNiICeyyRFXwLq+HdTClwbazwjQXehraz7SQu0TxGfoXcEnR?=
 =?us-ascii?Q?kvWq9pEiN2UdO/8nh1JKRjmGkK3uZcfraxn4lxw01g0eEalAr9lTmTM2//s8?=
 =?us-ascii?Q?ownEyZ995EdTTv9ArfhzQIlTbTBg4ZUKi/0w0M5cPHb8Tw18+A3UsITqwErp?=
 =?us-ascii?Q?NrAxz1WerZhFhC2zfoTDm/j49DLSOW/yxO4+zloyOn+xxbue1PuoUJCbeEna?=
 =?us-ascii?Q?ZvsuvZyB2EU21VG/IXb5UDNqWmuWPcbOQ5TzpFMvLkOMQhgxUrZF5u9Xd6gV?=
 =?us-ascii?Q?F5NNqVyc2BFabI0IsoO1kNYGc73/5vTQN8//sO6uP7Df1phRFbm3fM51JV5Y?=
 =?us-ascii?Q?yY9865jDgm9Gy71LZi1SSL3ngtvurfsof4494xWxzPwx5vuSy8U4SKQD4e3Z?=
 =?us-ascii?Q?A++F9ok85J9Fk214Z1IN/uQ/XG9da8ZBNzm2W2y1p0gXuL1Y7NuNzrjdL4fn?=
 =?us-ascii?Q?YrNWrU6n2h3Ciw8B48enL6/hdkyZ0vZg5Io7Hi62vpjj8XnI73Hy7SbORmZb?=
 =?us-ascii?Q?Y8MlAi1UNWVKcLNKKMXLd7ySHpUklTgU/Qeg1LC8rYs1HRByb9b6bgIXzbcU?=
 =?us-ascii?Q?iKCt/OmlYP9fxs054sOFYs4ZYcyHRKUzwr2JpjAOdXxAkmg1PNK7BXuQaiZ9?=
 =?us-ascii?Q?oNB5t0GkzB6G3tloB2c4qcfc896CvoAwwcdiwVbpXKnNsnlLeLVa0/ByXeXq?=
 =?us-ascii?Q?o47siR8nDmSyy0e1NyKtPr5Y9ME+x/YIDLyDMkeKaq/xhNgKFYlJnvvm5yeG?=
 =?us-ascii?Q?XgAzcOFN/73aq5nhCbG9oKjLkuNqmJoa2ujdP94rK8APyTZsoh8eAEIkKC56?=
 =?us-ascii?Q?q8KILKu7S4gWE9adRAI6fFlkOwNQtgLs0yaxZcCHlhdjjKbWslg4Bq/tTBiD?=
 =?us-ascii?Q?kkYEXfVf5yMDdYCBugixZsEW6+qtcPKRhABRS/+Aiga58emsmBYaSvgcDlmt?=
 =?us-ascii?Q?+wZWpIiRQyPo8wxhR7ZzuDPXmJc2BSuMpOFteEN6YmyEz+2/IZ7428jXKqKw?=
 =?us-ascii?Q?GhPmz600Yu9QIs0wt5LuN9yHVPljdqDUKB+6//lA+HBvkGX8RFOyy9u0soaQ?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d31883d0-bcfe-44f2-6153-08db6b7e4d10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 19:50:40.7408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGv9cxThOCIM3LnwQTAYKvEObG6sY4fvTAGVbNEiLmmSe+j9WusIVvURO8HZB/p4lU+/m/AczOU/bsR2IzUquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe/guc: Fix typo s/enabled/enable/
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

On Sun, Jun 11, 2023 at 03:24:44PM -0700, Lucas De Marchi wrote:
> Fix the log message when it fails to enable CT.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 615cc4d4ad69..22bc9ce846db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -312,7 +312,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return 0;
>  
>  err_out:
> -	drm_err(&xe->drm, "Failed to enabled CT (%d)\n", err);
> +	drm_err(&xe->drm, "Failed to enable CT (%d)\n", err);
>  
>  	return err;
>  }
> -- 
> 2.40.1
> 
