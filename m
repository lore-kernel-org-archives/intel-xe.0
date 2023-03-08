Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD2AC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 21:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B1F89ECB;
	Wed,  8 Mar 2023 21:46:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549289ECB
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678311966; x=1709847966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6KRidy4LWkJsI+qub1GS51qX95kccrbR2F7VeO5SrQ=;
 b=D5s/3UKzQpYbworiJBdndOlWlI4M7PtjWg6ofm25CxldE1e8yU1NgcfB
 j/SZEY04TjmPX3FwnhUhRl4cAftj282NDU+wZ17TaCPtCgia7Te2wk2Pv
 V2vVdDT/gibrGEgsnPI8q0delCLAZsK6rHNh41mUEatq3IvU/VX6aRBbx
 Hw7ICa1iIhI9o4DWSpPJuNDK7nMSHZw5EcVSzhgJbHuVY8kEAIKfW08Nl
 4y5O8yhILh4M8z1853fHG0OBTBMhJsOeuMEqeOF+DOTYULct+EN+bfOZi
 zcW1rXW+TvuUCy2OCWhk4RokbwcuJlXby5UWB52Vv6paV8LYKkvp4/lAe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316675062"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="316675062"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851276531"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="851276531"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 08 Mar 2023 13:46:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 13:46:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 13:46:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCfe8QHi/npXt0Oo5YtRysaOdFmTEpzxLX48nx7qlT1Kw4jnhidcXgFRvZOmBmcjFifs2kGxDfcyR+n7HwVYJi1SpWIOna6PhxUNt2/pM8w7mbg0ymmNphiVSCp8ivc2X4HhrjUeBlGgAlv9vl1/LBir2Y/CsRecP9rCQA/igNmZ2f5rSdV/AmE+IdndMEVZJHusWtiNISOdG7IlStYaJ95SX1lLVrKw/zLnjm3jqADagWJVg0EWDwO39rbf0XlaD3ryTwt3/XCrrJRXpbxlc/we4cmP845XGlQ31c4Sb+tp/00pvSyh9QuagEeTjt/WAt6SmD3VxhVJCK48g9Nipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osNEV7oEqbeb8CEUA+HceKOKq2e9v17KJCteehsD9vg=;
 b=En+FIHwjQ+S4H8NloDcODnrcVVYp99EYRhu6DkeA9ODQ8fwZpQ0gfzFWIoholZVCpEywUuOfeWiiRNIuXIZBRQHMEyWttLVGMATTkHtxzqyX06Kj06GhPnKpluC7dc+k1dM/m7RV+/kkeSskxAsBtagjWHRSQ27IkdeG68As3LcHMpaFOf2fnYMobEONe8NG+DxRxQnMFA7HzdTiV9u8rJJ9wgvBw7zBuFHx8J+IB4juv7E7g7Py3Sto/llwsRn/eAR50iqGXHaiX6fyvW3Q+6oh7PMHhQr83liwLDkYwzwjAzaGh/WvPQj7KZucnEkWjPOaDYhY3nytYb7JhXsitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 21:45:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:45:59 +0000
Date: Wed, 8 Mar 2023 13:45:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308214556.GW1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: e45e83c6-85bb-4d3f-d998-08db201e80f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RPjfWlEyadIisbYypSwiuo1MJ5WtZetLpun3Gt5NXJ1l+B9od3HHULxOjE8VMiBT9qxsMNM66Rj7pn4n2IyjDqQyWMVQFA29YRw41nqRy1gsRqXNdBp89L+OtnWsLCK/LyDnr1zrNsHljGowizsbqlyGdijLTBGcK96mcSFUE6k2zb71eb/F4eavpdcMGHNTbo30DOvEgGgdQv25Bep0ozBdIUJMj0cYHy+ONQ9ArlnxA0IkBFAFlEIsnB8TMhTFuv/yQJmOo2yf8ZBl8ZFH/jfkPVs4dR1GBWPyG5J04VhFohmNqNnmVwasXJISWAogwyWPU4Diis7bur4CBVwqjy9u4iYVo0L2b/kikBOpg821guua7Yr76OXTXoXJZ22pCOYvGD5lQjJC/27XULJ6Y7cuRhySr6lDnxV0hqM0wFGdzgB9qj+LiKQ2Lb/hTpU2nG26mWrtnPeycuR4nLl9x4zO8wMby1l09HXaDLP8FzkjP7lAMorYJHC7DglNntjj29Zb0lmka3qvPUIWLN9k8DWSSb/N4RL/jJ1fm9A1JgrGLbEGT02sNurscUzgJlTp7mpI4wWNSJ3ONTZURJwwzVYDFwFffsXto9WcPB3qr64+Sj4pYSV8nFach0YsCwsGMURO17nv8o3dlf2tbT3jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199018)(33656002)(6636002)(316002)(8936002)(478600001)(6862004)(6486002)(5660300002)(66556008)(4326008)(8676002)(66476007)(66946007)(2906002)(41300700001)(82960400001)(38100700002)(6506007)(1076003)(86362001)(26005)(186003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlLEMItJE4X/26CwUwb0ng5QcBKF3ckuE1WuP6SGMJiMNa/In2RAxTBaEJ9m?=
 =?us-ascii?Q?iy19l+eZINTPh5sW9R3rHvjpvIAA3asVFtUxvSBwuDjHI+IXUboQuX/VJxp4?=
 =?us-ascii?Q?m4MASpMvwBni7DZynFqzMXWGa5GStQaFvsnnOyqRNO8VV391DZVqvGOC5Toq?=
 =?us-ascii?Q?sXb4S9DCi3jRHqwn/DMPpp1zPmIkZw2Q+K+tHfSrtEVyxtQW6A/nF1Ea0O6l?=
 =?us-ascii?Q?Ua7QyiQBAU9HXnHNVaOveMJxWa/vqPJTRR5viARdfnxCPtMHu2T6L7dO/ZMY?=
 =?us-ascii?Q?i03c3cy95huU8YOu8eP+uckm4vxfqif1+Qkk+BWkHGdBucFI9gEml7/oRJLI?=
 =?us-ascii?Q?0fIOdb5KLS58E1uCb8xqmo30oGnbtkPdRwQLGkTs1/3lRAYdAiMX4flTgliI?=
 =?us-ascii?Q?CemBc9jbmo4gbEhjqNS3E16HA5jTo6YPFCVhyZKLo6LoeQyItIrRvWIRLy7u?=
 =?us-ascii?Q?e/+nYoNtJEV75DQzgmotF813Xe4Feu0gZIvAZCB5Wa86sYAQJ3L1/OGX+xZl?=
 =?us-ascii?Q?1poRw3rKjyQ/FlkvscrxLaJoeTaQDeO4RU5WhPiqWi8QeRz75Fw1hlF+xv/K?=
 =?us-ascii?Q?4zvHY+iBAInqUuZnNQ4nYQYt3Uqr+CPM+IVTxA/YZuzmz7JDbkBxSWZ9IFre?=
 =?us-ascii?Q?uQWOtGEHFBbptfZrVGHVl/9RLIoojbbIfzpjh9UXXklLXfm02Lsf/VUuhzg3?=
 =?us-ascii?Q?vioQ2KlZJVQS4USdK/TuY+nJlzXU4llBQa3gVDy9+9dR28lI71qS8IwRXPu+?=
 =?us-ascii?Q?z7IHBsVSOn+XxdcyzG+hmqmnbaRak5LPTOf1MvsbYbT1DY7mjoy1U5+NklLb?=
 =?us-ascii?Q?dHlU3LWgW+iBouJ5/DiUpLGsMpV8ngxH7iy3z1NKWBelBdLJRkcp6LimrK9K?=
 =?us-ascii?Q?2GSvMh+QDJB5y8J5YZKC36dushj47ulRfuwrnizUe2G9bcKxGApMecLeGLWX?=
 =?us-ascii?Q?fovRxXV1No3htDrVGJQbdvAkIfoEiCD0jKK9MafmYnwSOfEL+6aJRE8GpkMs?=
 =?us-ascii?Q?pWRl9XUk+knEbGdAKNuZ1cU47506VCdSPTctMUQLJIArmFrTAFQGA5PKy2Ih?=
 =?us-ascii?Q?5LI/jaRPt0OPuvZ//a5zyTEnAFFchz1fjPl1bu2eSA8cxdmWQMQ02dYBjzjz?=
 =?us-ascii?Q?CLujZasBJCMwhorkYCzogK4nDKaWqkb+T0NqO8o8F7enHFsEAp8YMPBNLu5L?=
 =?us-ascii?Q?inTaxlYzB7mIR87Jl0xtNkeCXKwxXdt5LpdXbiCi1jlbQcFsM1wiJ4R508Rf?=
 =?us-ascii?Q?ERqgDnXcZ3vL3Nl0zevplJbJboeal14rlFIXusNgiO/W1MzRwWQBUS7EKjev?=
 =?us-ascii?Q?0K2ViPodeiVUITpd3OVPbxUs4fHA7zybhYCk2RulQ+lTzolF4fac7rpldwsd?=
 =?us-ascii?Q?S/SzW0vdk9GRHMaG3xPHbim4hKwohb6FJkXy5aV0NKjK/TOn4olSV4RUd4eR?=
 =?us-ascii?Q?zIPIbz/0kgaY7KnVYHe/MIoRA8RXprhK3COs6pZxroqd6Y7cLrs122/4Tr1K?=
 =?us-ascii?Q?mqZu60YvSdGCaiBl2wL0z04jluJVEuYS/l5SEYfsLlNgdTrT+FQ4wH1ekoW7?=
 =?us-ascii?Q?WHXL4exlzuLk/Uh9ZbnLIolE/Hk0ywdCCuh3cREQsIn8oEfEszsdaz8yDjzA?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e45e83c6-85bb-4d3f-d998-08db201e80f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 21:45:58.9959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZrXTTXCCXXiIo8IJNM4hVaCP+BbSdGo56q32FsWrG7HPYRoWXI6mB46OR4PeG4ZMI+kOM+ZbQCD+tEMvLiwnB78TC4jFkPDYifXU/EtZZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/19] drm/xe: Allow const propagation in
 gt_to_xe()
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

On Tue, Mar 07, 2023 at 01:24:29AM -0800, Lucas De Marchi wrote:
> Replace the inline function with a _Generic() so gt_to_xe() can work
> with a const struct xe_gt*, which leads to a const struct xe *.
> This allows a const gt being passed around and when the xe device is
> needed, compiler won't issue a warning that calling gt_to_xe() would
> discard the const. Rather, just propagate the const to the xe pointer
> being returned.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5635f2803170..086369f7ee6d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -49,10 +49,10 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
>  	return gt->info.type == XE_GT_TYPE_MEDIA;
>  }
>  
> -static inline struct xe_device * gt_to_xe(struct xe_gt *gt)
> -{
> -	return gt->xe;
> -}
> +#define gt_to_xe(gt__)								\
> +	_Generic(gt__,								\
> +		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
> +		 struct xe_gt *: (gt__)->xe)
>  
>  static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  {
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
