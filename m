Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E3C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1CC10E731;
	Wed,  8 Mar 2023 22:03:48 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF5710E731
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678313025; x=1709849025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RvduR7ZmTqdlbCH/jRhdccrw8sDRK8YZH1dYOiigxDU=;
 b=BECTyMtSkVtvjg6F2RcTyfMvvjevbzsGl9LJ3jEdyuLOvf/bJZodbwvI
 o00eqRemTMmZ4msR8fiYdcs4dCUkNmcm/GYUMOj6sUYC2AJut7xyfgtRp
 /LeUHjpOQGn/ahaHrwopwHb4KYy/A2VLzabbB69uijZkCGcUACyzXYqSI
 tPgPG0hql2p/nZ2yt3YYclP+DphsW99pR7IKVOSKb8UUKfcTumoByjoVN
 I4O1AyL3X0TVTccXoGu1BjzF1DBrXduUg1SE7dDiamkBCvR6DncVXmdaE
 IEQgkfTWJL1AjfnXLLt3q/OkV06vWYGtC6RZp1bJiq1kEj9vd3WRFoXrd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398867481"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="398867481"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766160583"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="766160583"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 14:03:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:03:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:03:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:03:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fqi76FCXJxtZUpM1Y6yD3MJJd4GjDRqNEMx8GpnkeJzhCw/kZ+w7MM+QGPUpSuu9DTArG5dcb1spSHcAka7RAWb8LBkNojmmT6ecDJFNPKxs2zn7gRRa8uZeFNCb3JfUK3AFqWZQ+3kl6S2ZZynKhf5RmSyjXCzhUAxSpwSFwIxQcsPYRpTwLdoCLDmDcor3p/XBKS56KhLeA3hl7179Gmaf2tLoyQAUv/Qbgc9h4iU3uLCiQGA+fYpo4d3I+sRqnQR7dYrhopyGh1Ky5Jn9K1wpYkBLPXVSGdZwiSWUT9dIflEy94Pezs4WzmeoPNfRwzbMse3xVT9EriPEI2qN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPijU8GeDzVEMQDHAXboxcsgvR9hJituJ+iziBtf0UY=;
 b=TisJWO/ztuSh8RqwQUI8InnXYWHu/cqt6uFfzLKuZZQbKJ5mdSJQYXNGQeYqZr38yNySIhmnrQ2hoHdM9S+ZX0ghpgkGCGn1j0KOO3jBswrbMqblkd7cvMMqBhbJA8+nHwS11/aUZRa7+nWrj9tm+8calSrdJyUlgsPxL+n0511F36r1wvan3Dn1CWqRVbbTccE5cJrQy2QOUXXkSe3CRjoQktTXZL9z9mPhi0FQyOrdDl9BPhMzEnU5fEtQcHMQsNjNO6WruXFWIiwFORAbWYHgpJe9ZQeiKMS+a8ctAaIhzgz8fB3A6qfXFVzrBF51x2uknuBsAcKkhLSjCOKEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Wed, 8 Mar 2023 22:03:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:03:15 +0000
Date: Wed, 8 Mar 2023 14:03:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308220312.GA1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: cb15296c-dbb0-4b46-d319-08db2020eace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbhnqQ8YAPiyr1bKvHacWpNXnzNsX3VmWz2shoNmgubpnybX7fE93zTP+F3SmrwJ5lMAR6QiptE3mOmczX34x8DYEPmv1XzMUZhgswX1U1yUf0N83etyPR2DwgtsSCX7LzynuQ0Vi32qJlblSzRBHv5/ADrTZddcwzHlWN0Mc67puivcAu1MbmpJFGR/Boom/XnCsiXnGjbCUTjQ4GJUkaCrkoX52reLYWOY93WF1xal4DwMzBsX1ju6bq6bsc8jBj5YSBmzWq4knP15y5H0bmM4jQ4iFUWcFOpMMlYrhJvIiVHIfPxRt8Vn9ChDKvyMC1WiWJaZTZFK5UPBYwJsmUL/sntMiDYJH0Hty9D+9G2z+jLDGW1FX9pJVUSaNpRtGSdNQ9TDGBt5VayuauPlo3LwqGmYXgS/m/a9Tj8MaAVhYD/IjXYvT1Or0iveZrUFI/jzZuFfPdvv8SSMzS5TBJC3uXmjkDREulbvtfWhKsBeON1g+spvQa9LR7xyTos+/KD9HePsnOlC+roE3Qjh92KLbG7Xx1dlxmvQmON1s8XAfaCZSPXpHnYtaktUKTUXzHVzbyzZMXYJy1/7TsxP37eU63rC9jJrN0tGkNs5w+LY8D5ujlNYpNYj6ZrLvBpkv1ZplVirakLm3ulrScqARw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199018)(316002)(6636002)(66556008)(8676002)(4326008)(66946007)(66476007)(38100700002)(186003)(26005)(82960400001)(1076003)(86362001)(6666004)(6486002)(33656002)(478600001)(6512007)(6506007)(5660300002)(8936002)(6862004)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmV/UM3Y/l3leeBFCaV4+4RN9trQ2mDTh7oK9EZkTHucdtvepeuC+vDn7Ql/?=
 =?us-ascii?Q?kO/+7gTAbDj6qSbb62txSyPbEffmnTgbG+43iOoIiCIFQfMGu1pm2jb1ML2R?=
 =?us-ascii?Q?eIK3sXqoKkYBM915Xn6bAUIPU2+5dux1xfoENtUGwSODFMq1dlY2LKvyOAWH?=
 =?us-ascii?Q?h1UqORAiJz2ev4eU1dIFQIJcNJh2zVMrhnr9yCAUukCSYe37NEj0G9wvUWjQ?=
 =?us-ascii?Q?Mc8+idsPYGdWwA/NY4PwTtCkV4ednzEU70bw675XRavfFMYgd00EsOwnnJ7X?=
 =?us-ascii?Q?jm5+NckPmmP1nRcYxGQh7uWs63fV6ecauMPJ17Aio9vrtkUUD1dqEaPJt6+e?=
 =?us-ascii?Q?sgNrpVUYiuTTgzwTFoumI5MvHyvGCWuKnQ/ub6Yu7sbdRM1JsSXuGlzlrnfN?=
 =?us-ascii?Q?Y+7Zyk6cPDeVKfhGCfMdnJlJyWYEJxFT/KHiSQ+Bzoi3rqZ1vheSLQKP8DSp?=
 =?us-ascii?Q?MAa61b/YHiLBqbw5kMWsvQ4WRQCISp9FKD+FfkJcR/bf0xpH8IKx+KNUPrtx?=
 =?us-ascii?Q?JIA5q9qERi7769NjH7HWhdD05nZlvoJ61iTIZqcnl3KjQE847nMMk6PKm2aF?=
 =?us-ascii?Q?93zin/wlrUI11u3OnP6LPpF0FjMUDr1jTHSHxeZ3XjAQdYC3B0G7x+YavjvQ?=
 =?us-ascii?Q?kkdU05vpLEupfsAERui5U5Baci+0vDPei1p1cTwTl3zckoCvwc+h+qXlTmqQ?=
 =?us-ascii?Q?+c+YNpFhmamIm1OOH1+RwzlFCOYnZ09nSygQ1XGsro9rvLkOm4pEYxlMIgoG?=
 =?us-ascii?Q?1PlxGqFVN+qQhUR8FAifxebiUP01Nt28KBrux9ilnQz8g9Jf7IR7RVIeuLNF?=
 =?us-ascii?Q?aePWTrSwNShcwVhbnqfsH1HRECYmpVucbqQyMLt60OvjXqakEpqdICwu5oei?=
 =?us-ascii?Q?zulohAUrr+yZJAxetk4I4JfwuLAGqy7zORBzHjVhkEfPMPYFr8BvKH2ri7AE?=
 =?us-ascii?Q?9/wfAqoP2KCD5ld7fy42bDr6dOoJk11LaMTQcNZKq+inHgrkVos7J4CB3hVQ?=
 =?us-ascii?Q?x1fEs6rUZb8yEz9K6Fqwb3pRDgUHtrEb1w6lFQCAPAr6CVaXHGagamO+WEkA?=
 =?us-ascii?Q?z1j/sFBValMY7HJyX7JH9Az0hnl6aIIQ+SKzadBex8jqTumDyIIPlL1eOhgT?=
 =?us-ascii?Q?0PePoCsey/YVDN+rPrneNRwRUTMtox8E4CWSX6uwnTW2EVJHBb6o0CjNJeBi?=
 =?us-ascii?Q?Z7PVLfDNJl1KSEmC4Yov+zPHsU2ootI1QxQDyUyAgDxyykwZmzSGWFVoIgVU?=
 =?us-ascii?Q?hbM2QWIRbopW/oMgymErFOG7bkUE+RPM9A47PUP+mBVZNRfmbKKANBGvkTFM?=
 =?us-ascii?Q?ViSaAAkaCelsMUJntn0sKn3nWLTj+ZrlSLNcsoatF5YiESLBp7P3+XTiB4fA?=
 =?us-ascii?Q?eaeHgbe9lOZ5yLyzTAkqPCtYdwZQUnazNqinr6hnZMBgGuqD50iwM1yNSgP+?=
 =?us-ascii?Q?VLDoWC6M5dvJlGKpVyUbGfDsBnwdVGDmJyP9sGuxEtHudt6yKvdyTf2jt/aJ?=
 =?us-ascii?Q?c8qWgIUzZXddSq95yXgiUIV/hFfUe/D02shWccqekSOLSHlznQjO69PwCsrr?=
 =?us-ascii?Q?En20u7JRzP/NKPRSx5HGbSvy1hcRMgUPQvnXDS2POGljuOA5FOMYpNs6yhG+?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb15296c-dbb0-4b46-d319-08db2020eace
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:03:15.5241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKfDyTQuJIE6iz2soEwZMDWm94JZ0iWR/ngmNg9t+J2QPWP6igcFRKJHFqE6P3XspWfeQQlYqU/5YZpHQ51JUTiRNEaqIDPeonLSj/EfFNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 06/19] drm/xe/rtp: Add match for render reset
 domain
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

On Tue, Mar 07, 2023 at 01:24:33AM -0800, Lucas De Marchi wrote:
> This allows to create WA/tuning rules that match the first engine that
> is either of compute or render class. This matters for platforms that
> don't have a render engine and that may have arbitrary compute engines
> fused off: some register programming need to be added to one of those
> engines.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  5 +++++
>  drivers/gpu/drm/xe/xe_rtp.c             | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_rtp.h             | 18 ++++++++++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 05a2fdc381d7..2c40384957da 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -23,6 +23,7 @@ enum xe_engine_class {
>  
>  enum xe_hw_engine_id {
>  	XE_HW_ENGINE_RCS0,
> +#define XE_HW_ENGINE_RCS_MASK	GENMASK_ULL(XE_HW_ENGINE_RCS0, XE_HW_ENGINE_RCS0)
>  	XE_HW_ENGINE_BCS0,
>  	XE_HW_ENGINE_BCS1,
>  	XE_HW_ENGINE_BCS2,
> @@ -32,6 +33,7 @@ enum xe_hw_engine_id {
>  	XE_HW_ENGINE_BCS6,
>  	XE_HW_ENGINE_BCS7,
>  	XE_HW_ENGINE_BCS8,
> +#define XE_HW_ENGINE_BCS_MASK	GENMASK_ULL(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS0)
>  	XE_HW_ENGINE_VCS0,
>  	XE_HW_ENGINE_VCS1,
>  	XE_HW_ENGINE_VCS2,
> @@ -40,14 +42,17 @@ enum xe_hw_engine_id {
>  	XE_HW_ENGINE_VCS5,
>  	XE_HW_ENGINE_VCS6,
>  	XE_HW_ENGINE_VCS7,
> +#define XE_HW_ENGINE_VCS_MASK	GENMASK_ULL(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0)
>  	XE_HW_ENGINE_VECS0,
>  	XE_HW_ENGINE_VECS1,
>  	XE_HW_ENGINE_VECS2,
>  	XE_HW_ENGINE_VECS3,
> +#define XE_HW_ENGINE_VECS_MASK	GENMASK_ULL(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0)
>  	XE_HW_ENGINE_CCS0,
>  	XE_HW_ENGINE_CCS1,
>  	XE_HW_ENGINE_CCS2,
>  	XE_HW_ENGINE_CCS3,
> +#define XE_HW_ENGINE_CCS_MASK	GENMASK_ULL(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>  	XE_NUM_HW_ENGINES,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index c04eca290ef0..0d2f51bb06e8 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -160,3 +160,13 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  {
>  	return hwe->instance % 2 == 0;
>  }
> +
> +bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> +					  const struct xe_hw_engine *hwe)
> +{
> +	u64 render_compute_mask = gt->info.engine_mask &
> +		(XE_HW_ENGINE_CCS_MASK | XE_HW_ENGINE_RCS_MASK);
> +
> +	return render_compute_mask &&
> +		hwe->engine_id == __ffs(render_compute_mask);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 9bd2532442ed..433f0cbff57f 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -409,4 +409,22 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
>  bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  				const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_first_render_or_compute - Match if it's first render or compute
> + * engine in the GT
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Registers on the render reset domain need to have their values re-applied
> + * when any of those engines are reset. Since the engines reset together, a
> + * programming can be set to just one of them. For simplicity the first engine
> + * of either render or compute class can be chosen.
> + *
> + * Returns: true if engine id is the first to match the render reset domain,
> + * false otherwise.
> + */
> +bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
> +					  const struct xe_hw_engine *hwe);
> +
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
