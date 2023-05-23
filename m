Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7CC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 23:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D93B10E558;
	Tue, 23 May 2023 23:53:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEF410E558
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684886010; x=1716422010;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wSOcB2MU9tpjohQZIqg6f3DPPnW0hgybY9C4jyXb1zQ=;
 b=fTAvjQ4CTWo5Et68Y+yYYp19D/8kcFR2469VFKvqEsxBiTtDx5lyCI3b
 PU9bjluaDsmIDeBVgsNtn/0gJGGQlVJ/DG+sdfpqqDoVErCv1kJ7eJp3H
 g3yQKllvUx4uHS/L97/iTD/2fiuRcviCz79ACDf+jXTwpEAwb9diRmOvR
 +aD99eF1lmNWLwOilPRSk+GIYE9ZkmcDGYRVxMn0sY+ueQ+Y/a1CZ7Pud
 ZX+ZIgml93HzjpKctw41ZsFRWleJcfANnm470sVydvdT5YOr2W7MTsD+l
 wbePKHrarFGS+BpvnxZu2deZF+WxYPa+T3riCVzajo59NeofLxVjAC/Lv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="337981315"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="337981315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 16:53:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="828314148"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="828314148"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 23 May 2023 16:53:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 16:53:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 16:53:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 16:53:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 16:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2XtbpyB9C4rtamhGTwASj9nOeZPJXI4vynx2ADjTLYzSQRXf+KUR8qKJlNdy4RC4ANsWn8qQ3Ic54nkQXkyA/jOWSdO0WjASYAaSk3ghr1Bumo9TuXd2jZxOkKER9RQw5NvtobWHBXwSCaw+T2OrrI7o0CWeS3upWF/zI5cGZ5pDIfpvQfLest4xTdWoV5sLM2PTRQ5Uk9Am8C3IXaS04hPOi1Gs0FAgMScgvY22a1r51VzyrgOCdJRQpmUrcKY2qWb9p6Hj9Cw65vSLdXN/OsMwYnSQNUhg9YqAJMTGoq0aHrMXP43+UbFFOpSO6LbMICxKZj5MLp74O8WW2vU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mxzdfs2jnyNp6Hy0A7rvAOXNiai+BZwbPp5KJ4FVIw=;
 b=YUOP13j5iVq0ffcvpELzTM0Q02LfzjEb+0ZwOSGuUpjfW92ZxhI3sLdDXaUaiyEZ5x0H+Fq5cWh/bo8i3RYuwc8PtzzeeUVLisC09kyAzcnzi2N3RcVSJvWVV1w7MZHoTOnOkLoieNfC19wWLs0wtnB3ghKBbZiDWtl3MB9Cf3MDEHpMWcWrXCHczn/RvvjvQnSTkSQ3w8+80KSG5Z0XrbG6R56JMSpUOYfZQS4t5eLu4gwnjDuGUilEFgCEqXZVnb6H+bJEOrEUfkZAw/aB2n7Wl5ihcw3wmxmmA1a/SGdHz792J3TyNTA+qZahtED/D+K2lNNdhPkc5bnj+ziAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 23:53:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 23:53:27 +0000
Date: Tue, 23 May 2023 16:53:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230523235324.GM10045@mdroper-desk1.amr.corp.intel.com>
References: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
 <20230522193541.2537418-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230522193541.2537418-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: a1649c10-6733-42fd-6dac-08db5be8e713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NugoG3OmkIZjYu3JqeYg5BlozwA76lHASqxPwQo4Ad826jMhHU955LX2ipRSxJhXwdWZO7L/zVHi5/AS2C/9Cu/kFemeeftk5GgDvwNXN8xYrrxfZ1CM/2R2NfthuZ44j69PrUXGZOvxuuhkSZUdMl9mCl3cGnXWnOY4Q9RrLj0QvxSERXbjUpts53ce5pV5jVzK7EA1ZwKPQ1TLgq+koJiGfMagOK5K+2ds0rZkU8Wudj/Ykw5yC1VWjx3yMqWN1ZUpumIzun8PkWHs6uX5BuznbqX87IT5e6zPyC9pVD+jGtq2dbvfYwzoYCYuP9UZ7bosApGmi+2G1fbZFTfLy+S7z29BJ3QN5fx5SXrnwv3Lpe9i0F1yyHF81/Sx6ReFXdUWgJ/Jcc7dQuXw0+jivSmBdoxszMjipfmG5z/U58UvaU/yskfsz39Yp8cHf9UruAqxia6UiWi3em/WmcyQyKMj3HeEK4SZrenq+cOo7nme3jaUyeASasHTFNszUwrfaskQ8jT5rX1FbdGcuoU/N3LCjILu9tibZNi/pLAX8HL3fx4nPYxR4/cR0yiEookr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(6486002)(6666004)(478600001)(6512007)(316002)(6506007)(1076003)(26005)(2906002)(186003)(6636002)(4326008)(66946007)(8676002)(8936002)(6862004)(41300700001)(5660300002)(38100700002)(82960400001)(66476007)(66556008)(86362001)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gtHUFxMxLg+DqfRmGwb5/8UtE3Uf3f/6ErNZIPUi2HpnKvLII6qy1JLIOkFL?=
 =?us-ascii?Q?UColDrI1XzYbsVzcjr67brSlXw6OzBowzdgm4RA8rWhGOu1NddNN4MujILRR?=
 =?us-ascii?Q?7GfHpkO51pVFHZKHP0aQMgULkrsaVQq/FpCoQX9zLmHCXP6fhe5FuFtn5f+V?=
 =?us-ascii?Q?ZQRV+DGbH3dI64VSD2IyyRPni5yvem4IgMrPNTmhhnmriw5E6vmjYFJZAjsW?=
 =?us-ascii?Q?EzaCfc8jHRflZORNFWaom3Qe+HGxNSQZQ0p9IVEGPlkXdRuqPBI5/Ov8A8dN?=
 =?us-ascii?Q?DRpxNpRjmFeQ47ZKMFR+rWO0Z41ptjKmMKBdyKliLHNVOI4VCRLu/llcIyVW?=
 =?us-ascii?Q?d/7L/5EjK37ofjdZoaeBkCfBTe0dLihH9NmktKjKcx89/01TVCkb34keNfOi?=
 =?us-ascii?Q?/5E+Hrh/GDDDEMKJ4tOVq4SasdpXzwH5JLdOeJezcW8fBen7RbubiNGkBax4?=
 =?us-ascii?Q?q+QfyOMGUM4TX01PGKjr6klfAwxdDDqnPKkOopgDwgb6glIZPPmHYYXQVksk?=
 =?us-ascii?Q?mGC5U0ggTkPzrKmd3XUyMVDgJnqwi6wy5/Upcyh+8MJu4Ph6rqNEwRuZGbne?=
 =?us-ascii?Q?qBkf6MFfrCYA/uXMZjYT9rkDiPiJt6LEHw9gQm4eSzd3Be5QB8OdWYqm0GXD?=
 =?us-ascii?Q?C1Gb8l39cFAK9TGXnoxLMpyl9RAw8G5ltBMLr5o+6lGUEI/baMic1jqh6iZM?=
 =?us-ascii?Q?oRdhDD3hIN5JvqfhVObqYtCKOdCt/ryc1zivAUA+7huiI0cv5Zhf3p+IOUSB?=
 =?us-ascii?Q?JYkN9Shb6zkgtWSNOD9uxtWieWoWaxOmMF4DvJ4KGrjUwQwt5hSyJ/Fbk3O+?=
 =?us-ascii?Q?qhlLFBRk/dUDi98ID0dFDfmWBpJW/QwA3YPs9lhmsKWw34bnNDghq7/Hhrq1?=
 =?us-ascii?Q?6o8WgAcH5+YBFV/PRu2bSiZIsF19qixp1myHjh0shI7isSAVc6oF3b67gaaO?=
 =?us-ascii?Q?hv1Pqy3CPtoRFyNWDs2d1XIB+GZyQiCQ/5/gNO4l9Te+EmDyRzbBAMkVMK0D?=
 =?us-ascii?Q?4POeVn9NxqDmVIkoTemT3ODO1t6PE6MQ+09DJIa8MNRQ/myPwF7xfu8GahzF?=
 =?us-ascii?Q?nzcIkWQcraY9a5gRqczENOSQh8gNitk9/hZc9mE1aIHYqAsZG3TRDb/V83jn?=
 =?us-ascii?Q?7XzFcf7x9Ds8WEXoJ6sJ068Q7ueJM2wTAv+mxWy7buflZnleOtaPeinoNCcP?=
 =?us-ascii?Q?vb8eJKAbwj3bbfzzEdhmoobdJaCukyk4DH4ps8+E+e3UT8T6goD0lLkGpdsG?=
 =?us-ascii?Q?d8xJBsT33vBfYaDOZ5kexIRc3rLRn5Nsq2EMPKaaG4I6A48zTvjIFEhvaKzj?=
 =?us-ascii?Q?M+BJyCrxoJKg1ZGf5A+g+DT3EXh6grgrV/bxBGGah33jEjGo7I5/aduTFost?=
 =?us-ascii?Q?9iCsm1lMrgSpax/lxElTaKIUJXqnSotoL6pPoeYkhAZw5ttKfS7jjY7v+dbY?=
 =?us-ascii?Q?YSSVF0cF8NOV4tY6gcIcpc1luohisIQtflprtELKW+pja9gI08lGrHQdXEGk?=
 =?us-ascii?Q?h8LMZ/4sIf4ERWMheS7qr4qw2NrqVkPSQj8NdJik9sS3l4T0jJOiDSEIbNpy?=
 =?us-ascii?Q?vguewuodlHqaaV4PHxqMMR0NuWSlVslEL1YyBm6srIe59zsSfjgkG9YxZldm?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1649c10-6733-42fd-6dac-08db5be8e713
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 23:53:27.3115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCcrZ7kTuJ3wz2ro6ISwiBFxY8/ZlfNB6Q/MtrAcsE3H3LkDOm8OGx6qeyLOCtRFDcX1PYNdUgiiZkeqrF5NhTAvcuCty/LbL3DtN1vY1AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] xe/rpls: Add Stepping info for RPLS
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

On Mon, May 22, 2023 at 12:35:41PM -0700, Anusha Srivatsa wrote:
> Add stepping-substepping info.
> Though it looks weird, the revision ID
> for the newer stepping is indeed backwards
> and is in accordance to the spec.

You may want to re-wrap this commit message; it's super narrow.  Also,
the same issue as patch #1 with the subject prefix.  Aside from those
minor issues,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_step.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index a443d9bd7bbb..08c3ccb7d537 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -60,6 +60,11 @@ static const struct xe_step_info adls_revids[] = {
>  	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
>  };
>  
> +static const struct xe_step_info adls_rpls_revids[] = {
> +	[0x4] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_D0 },
> +	[0xC] = { COMMON_GT_MEDIA_STEP(D0), .display = STEP_C0 },
> +};
> +
>  static const struct xe_step_info adlp_revids[] = {
>  	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display = STEP_A0 },
>  	[0x4] = { COMMON_GT_MEDIA_STEP(B0), .display = STEP_B0 },
> @@ -136,6 +141,9 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
>  	} else if (xe->info.platform == XE_ALDERLAKE_N) {
>  		revids = adln_revids;
>  		size = ARRAY_SIZE(adln_revids);
> +	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLS_RPLS) {
> +		revids = adls_rpls_revids;
> +		size = ARRAY_SIZE(adls_rpls_revids);
>  	} else if (xe->info.subplatform == XE_SUBPLATFORM_ADLP_RPLU) {
>  		revids = adlp_rpl_revids;
>  		size = ARRAY_SIZE(adlp_rpl_revids);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
