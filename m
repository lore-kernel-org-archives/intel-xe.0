Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32932C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 04:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F3810E09F;
	Tue,  8 Jul 2025 04:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwSwxV5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B410E09F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 04:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751950782; x=1783486782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zH+dhMeVqERXGOUOzkDn/w5OY5SNBbd+5LispyFl4cw=;
 b=iwSwxV5LVW4PhKRRytCv1X+xjFu5m5TslFB6eOzFdTaqD3DoRB6/YIom
 N5A7UGPnvDif81pCJ1mkgP9Csjh8KiFzybKWRqyHeacTB3Xu21Mod/vuB
 vrVsItVpGwIRnsIWWHARaDB/JyhiLf1vJz6PLmufA06jkJ2k9OwF3yPo+
 cDJaAjL7ZyzEvFzkFxvjLWoXnM/VPzYmnW5KbsP8B59ZVBpZBWT+XpqK6
 32UM+HFh+wXVOPNd2+OfurLFOPonG5nDhTzvkYC98l9Vrx8pjRI/2F5Wf
 ib0aIWr6BT+/oJLu5nCayXGQ2PH/sVk5rl+Q0X/yG2dKkHryE+Wxks0sc A==;
X-CSE-ConnectionGUID: EMUMkP4KTWuUx/wSLzNYUA==
X-CSE-MsgGUID: JuZswu4lScu1LpiNn7/Aog==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53894656"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="53894656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 21:59:40 -0700
X-CSE-ConnectionGUID: cOSMYh9JS8K+46UCX5oMIw==
X-CSE-MsgGUID: PJNCWMNdQqCN5lZ4YxdBjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="160946414"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 21:59:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 21:59:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 21:59:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 21:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmJVAaEwm0r+FO/WvPn1EykNK178AjOj3FYmPH3ogko1jsa8V1G9+ycINZT+tb69QAFCiuN04ghmbR3e6e9LZLQDt0J9pbQK9CFvnEjI5czxez53ub1Jz0l5G3AUA7kOn7VmTVyjzIHeeKQqK1bKjD0oOWKfmrSRMj/X1bE2LYlNO+SFlsOsbWn/KheP4/29Wqzqt2JmvUyDVJhjFtpv7TLeqUZxQujZDwAo6/ppoDmhHPN83kcrbR3QpRROoQ+bNp8FCxRpcuiH6/Qil1sdZiKwb8BarfsdYlwQ4QWFnxJsmLN03kykwUK9nla3KFhCcjBTQUsjbPfuQmhiNYbuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIQhhpSlg8B6faS/r+Nji+1EHWWALfcX4zZQztSRvBk=;
 b=eUOn+tn/eoiuQ3HpdstRjH8iHP4GJw9HLQtywvBnOi2CBSiV8jFXDAWlo9l6rmvfd412/cubpvMjtAyPb/HdJzNCmiC7coF/8RzOIek+1I90nDKbg4b4hBOtv3czP6Tds6hwST/Wx1M5Kkb23cXhIU4DMH0ZnGj6IHYBULXzl5Jr7kzs03KlUK2RIi0gvdDTZfqmhLNb9oN8qwmRk00PwPnRw/RDlZunPlxWWLbhNR5n+r2RZHBLqHhJZ1+zT3e/YLkkKCpsMxkoDDerwIHT1iV9MYBdbct49WGhYSewB0SiQtjScAlrA94w7Yom/9kCCli8RAPHaukCSoQ1kR6U7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 8 Jul
 2025 04:59:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 04:59:30 +0000
Date: Mon, 7 Jul 2025 22:01:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/7] drm/xe/lrc: Reduce scope of empty lrc data
Message-ID: <aGymGU/Qia15jZET@lstrano-desk.jf.intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-1-6aa22f174041@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703-lrc-refactors-v1-1-6aa22f174041@intel.com>
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ac80b6-11c4-423b-7b3c-08ddbddc3908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vdZFnssYP0uGKVixtq3lx6YuV49oOjZe3FNeNMwSdmiztv6W28Sq0HeC1zV?=
 =?us-ascii?Q?+gFYER33fLLZqF1G/3hfPdKLsFGalG3Dz4oEUsLScYMhy7xgGhs6aTDedlvn?=
 =?us-ascii?Q?mO77MEVcCetxyIabND3uAfI77IAVC4yQCe2sOKy5rI7sa6SEDcyg1mohfqt4?=
 =?us-ascii?Q?3t84kOE6b2SQd/cBnqoh77B/LHcFbzy3hWE4dd2q22yTDNhyRNTHsiYgjm6h?=
 =?us-ascii?Q?yLxSOTrPcRcN7qojpj1Ut6HyY/L0qThT3obvSmKJh8mWLewdTl5OxTZTPop1?=
 =?us-ascii?Q?cMCMWZ8/U87rLlosldlhoKhNvWGhSyeAsXqM2nHaMEwFrVE5SZDVAgtXU2uE?=
 =?us-ascii?Q?mwLn9so4DwOx4J7hBhjE5FE5ls7a0hpoJNxoKAEiqGcfZ0/Gl/RUoGzhDVf7?=
 =?us-ascii?Q?j+YBvR6ijQBrd0J6O4J0tS2nKla7+WoR/JsdVcEDo2KhesbB5SDteZLvXBkz?=
 =?us-ascii?Q?DY+Pgrw0bOXa9HgUwHPAmA+/By3I8QLEHr55fE88cxjNOYW4G2srDQs7gxYV?=
 =?us-ascii?Q?y+7u9eU2hPwnW7nG9jeL1kE+fYu5lm8D7rOhJe1s50e3FmKw53DU1MGCe2dg?=
 =?us-ascii?Q?DfaAMKTTfNg0WTykE62vWF0s+VEnnslypzOkyXAatIs+c8auzJ8HajAFk91l?=
 =?us-ascii?Q?SrPmJgICJxhFyM8HJ4RHDUxavSC74wF9G8BX7plMpqfSKmy9OTdxUY9ivrDz?=
 =?us-ascii?Q?kjheWadNaT8cNRPcoeXRFJj81N1zCl3lHGQu9zhyd/mrOvpqCU487n7obTuC?=
 =?us-ascii?Q?cmdUoOgXzJRviI2+Ff5tiud0sXvDTNECo2osra189hmR8RhNadlc6fgcaoP7?=
 =?us-ascii?Q?YksTsiBLmdVnocHX8ToPJTLRKUSP5iUmQl9VA76vzpEB+3gznRtlsPjZ08YT?=
 =?us-ascii?Q?yFa1R77tmGVhP4kCHDf1AoqDv7llgyEHesxYRU5c1TTitiz0/1DUNaoRsESU?=
 =?us-ascii?Q?aXW5AK9BJBeitrLMnvUsXNKxcDNxQsYrATJoBlzy7k4P/Ys9Gytf6gIeheMx?=
 =?us-ascii?Q?4b7g0InfGdQU/515lh3G96xfW9AFiDwTSBuBMiDQa3Zn8wI8/kTgUr5CCu2a?=
 =?us-ascii?Q?B07vE3K+KzCzZFXVihin25DeqOv7X/LVSnm6FjoQvOf9xZdLQ9o8lHSGkwuV?=
 =?us-ascii?Q?VPJoHAWeftPDYTkMdcjCMtYITksRbVfIASxm/Bynt6843vEi2OX6FqF7If/x?=
 =?us-ascii?Q?xYj4Hp0NsviXErroEnB2R0AOSgeUU5K6mqys/UjNEgNaIfgtIBrw1b/4ozuK?=
 =?us-ascii?Q?yojAkeYaL8+8ImVc63azBCmF9bKwoiYyooMejnpXqDDgMV393CsytNNIfFac?=
 =?us-ascii?Q?Nu6egeZmPVT5acaYM0pBpjepSQqV3FXi5A1/l+zovllKQP6TDt1pEgaOYC2j?=
 =?us-ascii?Q?8nkSHS8j0tW6aYc62IaEDQUwiQKRUU8Nd6a1S8dUpem4XNWANf0250bV0xBu?=
 =?us-ascii?Q?bhJKGbaVRhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oW3iUnfKcAJ981UyQo1fh+JXpFWlNtcX3jAroR76HnPCh1mdvkIdm0owJSYQ?=
 =?us-ascii?Q?QXiCnHPDwvfZ9tKzfV948eCUGIdXnG5yOXKyGbFCdC4DWALzdGT2+DF+zvL2?=
 =?us-ascii?Q?IQvgBFZOPjTNKSnaeCEjjRnzedaoLBVDCxKr0N3iOBHfB1+oideQNwm2lhAk?=
 =?us-ascii?Q?4S2kxE9+uGWCPhF+SH7vQstCNxZ0AcR/Zk4u3CbbwJiUiG+71eVBdg91a9v9?=
 =?us-ascii?Q?o0pB6R7YqojsFBfI68l5VUpmfobH9dF/a83aTCou5HNFJB1q/BUsggv1cdEF?=
 =?us-ascii?Q?TmOSBPkz9GsLsS6QKxXmLToQB5Wdf4JRft1jcpnjTH4VkNhpHlNEsCKj+FBK?=
 =?us-ascii?Q?S3DHiMXJhF8xWleXK0meKGIkRl5ku9WaBWoXUvPwabeq77QremWQVCQvrsNQ?=
 =?us-ascii?Q?mZh4IuLRDxfjHAmx6QpyLPhH5mZM0XYg93MzNoUinm6xQrAnvpUBkIhHo64Z?=
 =?us-ascii?Q?KYGYy7pjNV9MGXBZ9RL7MBvhY8YT8iJDyDil3CbY5bqQYEddUwzkEdcmodNo?=
 =?us-ascii?Q?mS+mfVSzaCu3f23suXfLuUz6URFPFX3+7C1MMYFOrqYYPmXK055ziGfeu0KJ?=
 =?us-ascii?Q?FyCc7RcO/eZWQfQ5MgAq10aPYUa7H3zn6mXDf++pCYbsg9QaoLBNUOL/K9SG?=
 =?us-ascii?Q?t4PTrRWIb3vyP2lTNTZZorI9k1rfADVU5VOo6KlWrV/7HPO77U/yWebndlIL?=
 =?us-ascii?Q?lh79fCf2BGh7bhM/3LxVcpdVW3oQgJWpqfup0dWBYlmljGw54dTZymKzxQji?=
 =?us-ascii?Q?b/ZhMKgt7YP+2elp3xMZG3BMMWWEucs309kj2/PTrR9Y70jBQYy6m/HWnBTP?=
 =?us-ascii?Q?FY2PiKj5d1q9JHpXfWS/ZvT6UXZ8UQ6nqcBf6zmaoby827nY2alwzBuORbDT?=
 =?us-ascii?Q?k4Q9mSMDIdLFx5eiHYTlqoKqFhVXJXMOIkg2XrtKx5r9oV8gVKPDF6Fp0QPf?=
 =?us-ascii?Q?gzdUutjhYzRQn+KU2W2k7rpPrtMaJe5HgtwSRk3mnci6WG3yqwg0y+LEDle1?=
 =?us-ascii?Q?zaaRDeGopbLlh/HklreUH0IkKTy+y6UEaIA4FW8wOlWc1Om2I4sDTscAC6ao?=
 =?us-ascii?Q?HjM0EOKCAjGc35YkNN4LZn55atzmHRFBGf53hPIxDx9SWRWEIUIW20EUafI9?=
 =?us-ascii?Q?b0PYaL5kEV9+uKQOqm+DGurpQwAFny2Yn5rVwycZaV9VeeXcOB1MxZ/ppVzv?=
 =?us-ascii?Q?JHf0SQ+2egeqh0jF/l6pHiq8QMF+ZRObjnxf51374SCFbWr7fTnxsgM6Su6c?=
 =?us-ascii?Q?bx1Kp8WxEurQQQrIqH7DqCHWMMHkmWulwXabiiOzSqIGbkKhqYf5Mjcp/wg8?=
 =?us-ascii?Q?D7tBm37iyz+Onu2dt1/B8VbqDgVZwDxggC14SYI2v6WDyupYqNNO1hAbV/nc?=
 =?us-ascii?Q?XyUL+Rl2Wc5EmExi1akK++Tpy2RoI+0pFYn/QRpbtt+MvaOveXZzkODDwJCS?=
 =?us-ascii?Q?03WhsY0NNEidTot2yZtYs5yzCUUHb9fQT114UTWmgGANef+x1301jBlrnJHH?=
 =?us-ascii?Q?lQ8DntTKGyfD0/acokzngnH3BSylLlnQ8PuYt4ixYunATP9yirAGbYnZzjdf?=
 =?us-ascii?Q?MnB7wLHMkDbBY6fB1bqHAcyDrY+p21i7NZqkCTdgD9+EQNCACD0utG0qGRox?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ac80b6-11c4-423b-7b3c-08ddbddc3908
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 04:59:30.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO5wes6i76heQyopf04FiUvg6VpZFKKjPDIqgSTKW1ZeOPqKmC+CR3QaL32u7dGEx8RI0WpHQ8RQmJ2IsFPT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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

On Thu, Jul 03, 2025 at 03:41:10PM -0700, Lucas De Marchi wrote:
> The only case in which new lrc data is created from scratch is when it's
> called prior to recording the default lrc. There's no need to check for
> NULL init_data since in that case the function already failed: just move
> the allocation where it's needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index d2ad8fe737eb3..7cde827ddbec9 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1044,7 +1044,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
> -	void *init_data = NULL;
>  	u32 arb_enable;
>  	u32 bo_flags;
>  	int err;
> @@ -1076,25 +1075,26 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
>  
> -	if (!gt->default_lrc[hwe->class]) {
> -		init_data = empty_lrc_data(hwe);
> -		if (!init_data) {
> -			err = -ENOMEM;
> -			goto err_lrc_finish;
> -		}
> -	}
> -
>  	/*
>  	 * Init Per-Process of HW status Page, LRC / context state to known
> -	 * values
> +	 * values. If there's already a primed default_lrc, just copy it, otherwise
> +	 * it's the early submission to record the lrc: build a new empty one from
> +	 * scratch.
>  	 */
>  	map = __xe_lrc_pphwsp_map(lrc);
> -	if (!init_data) {
> +	if (gt->default_lrc[hwe->class]) {
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
>  				 lrc_size - LRC_PPHWSP_SIZE);
>  	} else {
> +		void *init_data = empty_lrc_data(hwe);
> +
> +		if (!init_data) {
> +			err = -ENOMEM;
> +			goto err_lrc_finish;
> +		}
> +
>  		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
>  		kfree(init_data);
>  	}
> 
> -- 
> 2.49.0
> 
