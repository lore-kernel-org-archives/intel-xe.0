Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448B8C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 16:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0110E6DE;
	Thu, 21 Dec 2023 16:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D7C10E388
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703176534; x=1734712534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RiPzNv4qk7xXtmVLaBpdDHxUYydo0RNjSsNFwz+RrNA=;
 b=C3XWmi/e4Zp297n1yjN6YrSr6BAzd87CQ5iB9gRmPeflN3HJR/d7WUcB
 j1QK+EFEfdq9c4PZlKuPsI17LNfbtiFPHTlUeAaGIIkZhyJvjLNDVYMCD
 5KattHLDvmzZr6fejC2426NBq4UXO/Z90nE6+/8tB+yTvwxN6kkuGUJ3a
 07cPlisPQnaGoJHugICGTA1xFae7+9LKDor4Q0gD/RJx7ERMBpT8KjHsV
 5ZAYIaYlHdl3gh9tOvkJyNpKPPZMJxTwcFZIBOeUTxAjOdGIkEZqv/u0b
 qbPzseKex8B3jkEaM7Aa7F5Qccaf0f11xi2jd5jDRvnH7fAxvz+ViDu59 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3240835"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="3240835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 08:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="842663056"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="842663056"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 08:35:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 08:35:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 08:35:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 08:35:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMCSzvErmdElOkt2q+g9C80qx9yB2CRHabQuzTO+fT3cIx6PEUtVI5FAhG1lKonA8eIEeX6YOFNO2xTujtKbNJBX6sjyPQSq9KVs1jSBXbzw1FixKHgjZR98xcJAyYlH4Gxw7EBP/yJAy8QzYQzlZtKLdNLQTtfWaCgjTg5M8qctMXiFLa+4ygUT2nsb0r9ddcf12wG8j5d/hZ9JZ+upHqZBS+k6esJI0c/uMi3p3I2Z05ANhgeWx29Kr/M9kfbx9sUbMMFFb9Z6PeDAifGa04QmWFn21myY/W9+IxJX2XgA8gEVWokbwuKLY4fuWbgDuzbj6yS8qPgmWkyThSg3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dw4L7ompRhmDx90u2xihRJvNh4TklPs6HFD81pTx4+g=;
 b=iqyK6d2HpLd7cdQU4Q/yHAgx3IiSFfQK40lvhMIvvwsyvF/2fwt08f5x6ufbHSlpKAQ1JZBEwvEE3dLRL/dXmDJ8e65EyxhpDkWY4KwBgJXs+g052RlAmwnlXMGyw/5ynmtAB+9qGDNa3l4ojRh1KUpcJ7b1q54hsWUCrvQoRAwb8MQdpaS8B583XiyrURndI031FS2ZDXNQoZ8LtOSjt+UGrEUpIIu6FnVmWOF3VWhZFcnWI5BXfRKMDNHYny9wRhWq+g79X74UNp0s2YI3lAmB/Mn6fzGPSI/SrIlXpou5fljUmwQIXh9iIdASV7Nb5V7HaxXYveBG92EpqZDpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 16:35:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::48d6:d63b:c2a0:e07]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::48d6:d63b:c2a0:e07%3]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 16:35:22 +0000
Date: Thu, 21 Dec 2023 08:35:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/kunit: Drop xe_wa tests for pre-production DG2
Message-ID: <20231221163520.GN1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231221163213.3849523-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231221163213.3849523-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: c21a37dd-9b94-42b1-bd67-08dc0242d3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxPDnVlwcwkwjhk/Xdp2vn2vayFlD53pdtYf940YSs+qkL6/mM7pUcVxbPHH1+bFNfkw/YohDUG6fM0HhnD1JQGbg12bGGXbqfBfZEw9mK5UI6mZktRIG2jt4tZnqQquouIUwM9UI8DHONdxQIveBjfnCuRrokPzeEGd9Xv4hFvsAOX1RnLOSeAbZSKwsKRRtmYEACbk7/111mfKjdZF/aFuGyxH7ynxgaJg2WtBBsQ4Vjt/nZwTAXL5CI8viL75Mxpw4vdD2Iw4MEKFtqwmDKQFyprTmo+ORFzzRI1YprXIj5lPbxfqB2KbJHpETuQfTeirpvSNEk1PpP2m0wXrgdASfheIsjubSVD1mNwjGOcrctcCrncCR0oHPx5Qf6L+DlM4BOTcH4PZIrYRyFo4uFyCsAyZ17t1mJF7ufMCuwQSOFe5aJ+Q26YOUEznPznxFEJ3QFMuqitT0leSbnz7Ck1KYjOFaFIp+xPsYR5yv5UKjrd0FE+40vhZKKdjfkXomQgomYBT+9tUZJ30P5W9tgWlN1nrkCdY1ngmuG/N10MxpzUh/q9KE1fIH5qEMCQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(136003)(346002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6636002)(6486002)(66556008)(66946007)(66476007)(6512007)(6506007)(478600001)(107886003)(83380400001)(1076003)(26005)(2906002)(5660300002)(316002)(8936002)(8676002)(6862004)(4326008)(86362001)(38100700002)(82960400001)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bu3dDx6nSB3NTtkb0KM8uTQMGkuhW/tzm/qbslFmbHjn6U0KC8XuZ5QFfQfh?=
 =?us-ascii?Q?dBXEZlj9UyGyVK4dX5xOKhUM6yLeFnTUlRkVbcjdZfyLdpmDacQ99548ojB0?=
 =?us-ascii?Q?YWYpnmoJhS+VGckUsiy6o9JJJ4xin7+wPyMZXsqI8sguoqDHz6G+QGLQGi59?=
 =?us-ascii?Q?Fy8qftFmcKyKxrzoSv41C1sySvkXOiVo6lO0ozyxyX/LoUBIFlVZGwHIpuqa?=
 =?us-ascii?Q?3hnx0JLY2wDM8nfTotliWJr5Q1voRe+tnKmF3+1NlF7jpO9E2jnEuVtwvT0b?=
 =?us-ascii?Q?pKQ4mIHdHN7uvFJT6ODflUd3PRmHGEFPNcgpQF0EgdXe7UVHJ5RWbaIhbvv5?=
 =?us-ascii?Q?Vg80cO2RGs3wclZAekmzvC3jQXB3Y9SSS1S+/oqeirKW63gGv/GSzfMyIMzM?=
 =?us-ascii?Q?h+UqkeKAdKT9vdB5ixqVLmxLBHyb5DnNBZ2Naz2ke06hvBj2oeogsBbyUpH0?=
 =?us-ascii?Q?mgtk4UZVZObLBYjbh8SG1XrRDotOqdiCGwrwrhRZE2wgWhgSPWSlrWcV3tW/?=
 =?us-ascii?Q?dqgQ99I8nkKxK2Q3SEAO2o5TR4K3IPLP76Eo/UTLuQgF1hcWWx9zhgm1qcV1?=
 =?us-ascii?Q?Xh1NuNNll4VZBJDipyh0uTotmX5jye64Es07VRrltVgRTg1rJSGL/VVou+BK?=
 =?us-ascii?Q?Osfu+X/ug6nunkO/v54KemoEJVqgMllJHlR/9pHn3IBtapnczGYwm+xQde+R?=
 =?us-ascii?Q?gVP4bjMDsUzcq8Oy3N9l+VfZtkJYC9WOKaMMBHFWOjHczd3Jz/o1YJPBHAxP?=
 =?us-ascii?Q?XEIDwHcp1m90GzT1NmHOsEPnScLClCMXUMKxGbfLNoJPOYep8z3Knvapjg+T?=
 =?us-ascii?Q?RWpf8J5ZLz9n0nxceVpBXgSrCwP8WEysa8w5XswYXVqGPU6FpG/Xk3FeE/43?=
 =?us-ascii?Q?1M38DKD17LIHG9sBN5lTqCgpSy8oKMWRZsufJyq5B0yKDF8IFEfRplOt+XIC?=
 =?us-ascii?Q?v8ezEfZON/ugei2TUFFtwqhxtlxk95z0xiD7nkgeFStZvuOL3ksEmHeMM4c4?=
 =?us-ascii?Q?sSOkYSEdIwVSz5ROzkPMnmWDPnAor3tun3Zob8DWAhY7gdc9PC93xDUygiw9?=
 =?us-ascii?Q?l2LoACu4+i3lgLrfQAqVU70eDcC92JwzXM6mtrtQEjLLlP1+iT/aSvuOUavy?=
 =?us-ascii?Q?vBPI9FUPNZVaucn2IaByAuSnJyYpNYDqLksC1mF1XxgGHwA7X8uMJK3r1DL5?=
 =?us-ascii?Q?4VLPL+A4lrWM4wS93ewjnbzqTRmT1R5a0CBdjIIpZDGqr3CoeTGniqg6uyYd?=
 =?us-ascii?Q?1VutodkZ27a5R5+FUrgqwIft+WTTS4aqr6D0wzKkq5EqwNsqHPNlRmGRY8YZ?=
 =?us-ascii?Q?AK2AyKoiYIko0+KkSDydKl2YNfFeQ/5xlU5S5CwxZ+wSnBIF4FEXBnO+2AP5?=
 =?us-ascii?Q?N1Szju3C4cyTQW3gvXTPPHsFe7eSIi813eCSJ1DAkcn73rZ2u0s/eUN4Q+xv?=
 =?us-ascii?Q?EY3Y591vbxZPbuDlLubzpFVeqq35EURcEF4vl4sNcrZc+Dsdco+t1Hx1lv71?=
 =?us-ascii?Q?H1vzuZXKyOngLfcfpDhV8ImSTeLwNzza8lr04nXSbpW6urRQmsz/s5I170+/?=
 =?us-ascii?Q?8uLlDzqRgXlIT9jjicGYV1EGncOcmaGihuZ1AX3p/ic/x3I+gOx2mGWKgl3R?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c21a37dd-9b94-42b1-bd67-08dc0242d3e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 16:35:22.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56l67ovVHgJ6gIKOEk1mMR1PBkz8kfm6yhA/hDMXFAe76DtvIYSwzz4Gh9wXGqCP+jjB+vPmIhUOEc0qozOiBLQrEPJPI2Atkf+vZXPxiDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 08:32:13AM -0800, Lucas De Marchi wrote:
> As workarounds for pre-production DG2 were dropped in
> commit 707d1b992cfe ("drm/xe/dg2: Drop pre-production workarounds"),
> there's no point running the kunit tests for them. Drop
> those steppings from kunit.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 2e39acebbba4..439477593faf 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -66,14 +66,8 @@ static const struct platform_test_case cases[] = {
>  	PLATFORM_CASE(ALDERLAKE_P, C0),
>  	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
>  	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
> -	SUBPLATFORM_CASE(DG2, G10, A0),
> -	SUBPLATFORM_CASE(DG2, G10, A1),
> -	SUBPLATFORM_CASE(DG2, G10, B0),
>  	SUBPLATFORM_CASE(DG2, G10, C0),
> -	SUBPLATFORM_CASE(DG2, G11, A0),
> -	SUBPLATFORM_CASE(DG2, G11, B0),
>  	SUBPLATFORM_CASE(DG2, G11, B1),
> -	SUBPLATFORM_CASE(DG2, G12, A0),
>  	SUBPLATFORM_CASE(DG2, G12, A1),
>  	PLATFORM_CASE(PVC, B0),
>  	PLATFORM_CASE(PVC, B1),
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
