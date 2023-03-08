Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBF1C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 21:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5831D10E721;
	Wed,  8 Mar 2023 21:53:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC91F10E721
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678312435; x=1709848435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tzG3kHTMQyzKuiF3Kc14lpyoIOOnBK9iCFGYCcNnASE=;
 b=KsFyL1Sp4Lx5CmZQUR5eofd4aMeDi4C3m0/br65ajIEdSBdOXHaayxMM
 FYIICzhgiDeVXAfWdlAafLQXvrOPAWXftlD/VIf+CwZpZ7pJP3eNjp2JY
 BNuImjVlgS/L0NGMlyO5yWzN6LHcuY37pPccDO1t87oIRgNBVxbN/UzkG
 X2htyR/JGhwTj9Q2xLOflxfhvLiH9yzkZUIqBks+yO7ANk0xjDTEWMuIW
 AOtzflAN9v/POvmFsllwic6FRoZohwRPxdwdTX8r7Vs4Rj7mjXMR3Mmzx
 kH3tGwfICfj77Ny/mQ4Mjls7VWZh/uIpu0b7wYl6Y3+KAOj0fuKiiU0MZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337806696"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337806696"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 13:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="922961661"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="922961661"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 13:53:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 13:53:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 13:53:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 13:53:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOF1VHa05JwnAkmJvFlcuUO2t3iE+k9O1eXmZ3RpS3qtaauWJtmIfep4CdmZ4TEdk9gLuHA2K9n3fVDff7elsQi0EJDsSP2tds+1YlChvs633cHIWpuwBwMOu3yJSLxdiZOOy61RKyb3ZBuQXN3gcsuusF8+yBT7z5Nt02OWcc4wrXEZ3qHWDurLu8/huaPEfVVBMygI+ozcVDsn58K6KIkn0f97uQ6bhz8B1LFQtRpFw2sxg3WZm/Bd9xDFws2JQssOf4HSagSWmGzspMx8ta3IsVTU63j7wV8O5ciT74rL7VtK3LVaUy6uNR9piO6qfmDxf2lB/kaCXOV4lceIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhA0x1RhcDzCZQObYHnbVinPmqAoM2ORwy07hLpTm/M=;
 b=hPSMAXAp2+XZXhMwmyVLlWCeG5gdb1HpUOpOUV6Pohnme1lCeqWbhqWGu/2IO2jr22Oyi2vwXPZDZuPe3xfOCI0cRh/qdIsO77nzrbbY3CWr5vkjBZ4+XOOK2YfwnnC96/3WFFa68kwNBtU9SocnD0HzlDIdKUx0TEbm7OrTEevYkWAlIqWrWvMzdDEioT911g/e/9tXH5GZLHW9cbZxOybcsu9FQIzW6w7BaS2AoDg6Q4OS6umUinoMK7lQTkr9XiwC+k56BhsjcwJXB1B73HiDUwIIaXudiJLrFNH0Cu5SeKQNx+jdTbY0fTp5yXHZyPb8yIs2y6tGXdrYaxBgPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 21:53:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 21:53:41 +0000
Date: Wed, 8 Mar 2023 13:53:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eab6ec6-366c-4738-69ca-08db201f9496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuPSUvPUGwo70RragZXQUKX1Wjxuwv1w8oVhcD/d8PoVhqlzjXWtp23DXM4iJYdbk3oihNyZzyK4EWQSSgXrZIb9zIcIg6jCt3R6iWcjxlSMWX8JvuwCehPWEQnUwGN/2ae2F27HsqdjhOCquFCdo7JNvMeHPZwhX0+StllFw9vMgbp/0vyvmzunentdTdGXfqgJXxAKs2z2oR/L6AVOoRjjAwQqzXsiAKRlKDTG78S1iCDJGsHH7U8JucaVhi6PI/sDV9VhnwrcvXM4o5IiOPCZoBRY7vHwoocyUnueP9R+w/noOPd2MPguGrRmug8Og3ZAEE06xYHXnbiFH2lIvggnX+PMkk185XSms99kYfOuEPNaSsCbXBxtS9CyQseD0YGnJQpyyYet4WdMcTMVGFSMrrGL3lnUVdr+y5nyW3mD5ubSwaeGGbijHliop4/GiyCk9qW41qJypbGR/Js+2WDF2YkhAL16XqgkG9dgpjUw60bbs3E7VzJoSaq8dj4G9Egv5fl1T0c4w9YW4kjhWE6+gSxCtGLf805amfE4XOludfHz6Cw9FZ6wvNBc4QmLIq9Y92IXnlg0xRynG2DSCBY1MfG2XK/6JFlhq6fzHjSyOfI5hM1yhj1EvhQTjlo1M7teobJ3uotPTj2UPlG+KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199018)(6862004)(6666004)(41300700001)(6636002)(83380400001)(86362001)(316002)(4326008)(33656002)(66476007)(478600001)(8676002)(66556008)(8936002)(66946007)(6486002)(5660300002)(38100700002)(2906002)(82960400001)(186003)(6512007)(6506007)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wclq5wCaY1lxExyvo3zM+6SXFrT/nixa2K6f3rO664GpqsVYaH0PosuN6XaQ?=
 =?us-ascii?Q?qTCMSb7iw3cXAg2bag2h+iMiCHCYXNd4/VyUV013TJj9nDZTmjKFMgkmyQVY?=
 =?us-ascii?Q?IbhazHs81RB9RMSGcOxd9KwlQD/24z3mLIyZxHT5e0We476xQOGfQKklkc39?=
 =?us-ascii?Q?lVY8jICrxx8ne252LeEkVT5rbdz/B91xnsmJeryrYi1G7C58NfY85tUfSnLz?=
 =?us-ascii?Q?kNfkRxgFzFns54zp0D52VGJwKIj41ZxmGLOCH9rLRuMMWpN1VpULXHILEB0b?=
 =?us-ascii?Q?mcf9Cq+f1a2eiHxzCt+8QOdoOOho3qpKgRJJpeJApN6JdvRjDVkJ0OtippBB?=
 =?us-ascii?Q?cBuRiOpi5Y2NgOnnWNJ4diWF/fV3xaB9b7q+W76z4becyoXS/Zyq0ZnZtACp?=
 =?us-ascii?Q?ks2z598/A+ByzXKKgque6IValVmMkHX1jENdYgh1sqpdC74rqkwl0YufnWDS?=
 =?us-ascii?Q?9srEGVQQxm2901J8knZFEm4oQ7rS94LZ3KUfzxrfrxTUK/oGnBVW65/yZwoD?=
 =?us-ascii?Q?39K08Nt9ARGfN/XZEuRUPkFDCMiAVTw3R5Iab5ozurp2dHwKoL3a9vWrK1+q?=
 =?us-ascii?Q?YMcMGDcI3xhFEDa4VGema70Ig6yrAyxiN2Ak5BgoLEjoMuKapk46ZwSjSKZd?=
 =?us-ascii?Q?4YptXbReInRxwpJZy4KH+MOVs1BRmY7ID1qK8mCprKYPkn+rZqIsuQL5WIwI?=
 =?us-ascii?Q?N+G1lzbZ74ek7igrPrWyPiBEw5fkxxNt6+4ftR6h1FoDOYt5fXBKPPX/U5Xm?=
 =?us-ascii?Q?MW7GPnQ9NdPS32UYzh1gV9UpiiQ1BLWCJKlVvNk9O6bNe+gP0BfHAR2O3tQ1?=
 =?us-ascii?Q?Dmawv4gy03VQIpfmS2hLOGQp/mXVAu7TTlad5oaUTwhkytPtIxq3eTimaZ3W?=
 =?us-ascii?Q?dqkf5axiQ9k06Ol2meG89OyAd3cxaZKTUneGuMvTsE5/ag83LZCbfeAW+44v?=
 =?us-ascii?Q?g8qrP0exb0NMfNI5FVKdmucp9vFBH+2adZGlTmYxcTDU0ribHrEI7IdLX7Hc?=
 =?us-ascii?Q?qHZLswleUvB7/P9a9KtRv4sBEsGlCiIlF7zaSodUAMfonRtbMH2HMhLn5PTK?=
 =?us-ascii?Q?QaopyHMZRGlOi4tIT0aBd9HqICgW55ZGAc4qnQnKkh0vvvIQQBNCoIDvtqzH?=
 =?us-ascii?Q?5V3ZKQcQPaBkQdmxXVmxp4VKCWR2iEM4faKJp62SfKM/H6EK+1HeDIIt0R9U?=
 =?us-ascii?Q?cgldizOw4aLVvvUK0fLBhnzzJEtUBjFnxndT8wlwmK/fZBu4rAOSCO70Hbv9?=
 =?us-ascii?Q?hkckGYn9oIosEW30i778+Tov2d4uumR0CwS3+3tXjOjeKL1JxAy6KrMCvR98?=
 =?us-ascii?Q?gjZHI/ajJMq1bcat3wRyZi9V54DAYavIne4FzPBunUjQQ2UWSt1w4ISByU1j?=
 =?us-ascii?Q?Hvm+IvsXDkwSz+lpmEs81TgrXVqBkzUvvqij0IIAV35/wz2v68XRsvkboZdG?=
 =?us-ascii?Q?+5ZXYMgk6s8zulYfmXX/mnuRBnsZQKf+HDTAo25/Fp3N4BxMSFOOrH7dxgiQ?=
 =?us-ascii?Q?E8G/JRxI7z37IZXeom2l1giyWMxbfpXgNX8ghj1OaLRNtb9FvOyCKyt4kZIs?=
 =?us-ascii?Q?lab+ILHfukyoukmsoQAFdNyJnx+yj4EMv9K24Ryz3jkNRrkUH5JupoaBEtDs?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eab6ec6-366c-4738-69ca-08db201f9496
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 21:53:41.4205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPxuBY+DV0GqL894Ke6vKv4vsaNsbkFskMHVEZ+OQodRhBB3aow/ojchxeXvHD18Sa71+oBsIhh0K6lfOa2MRbgA7nvZqqmBdtFkjqBooCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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

On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
> This is already used in intel_gt_mcr and will be used in workarounds.
> Add helpers so the platform-dependency is in a single place.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
>  drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a42061c4b9d2..694a79b40ec0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 967f2349c67a..9fe06a46a400 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  
>  }
>  
> +unsigned int
> +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)

When this shows up as a general interface, it leaves me wondering what a
"group" is.  The rules for DSS steering happen to use gslices on Xe_HP
platforms and cslices on Xe_HPC platforms, but that's just the
platform-specific rules of steering and doesn't automatically translate
into which type of slice would be appropriate to use as a grouping
elsewhere in the driver.

I don't see this new function being used yet in the other patches of
this series, so I'm not sure exactly which workaround(s) plan to re-use
it.  But likely we at least need some kind of clarifying rename for this
function, otherwise it's probably going to get re-used incorrectly
elsewhere in the driver.


Matt

> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
>  /*
>   * Used to obtain the index of the first DSS.  Can start searching from the
>   * beginning of a specific dss group (e.g., gslice, cslice, etc.) if
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 2375f005e0c8..cf8f75a4c7dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -14,6 +14,9 @@ void xe_gt_topology_init(struct xe_gt *gt);
>  
>  void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> +unsigned int
> +xe_gt_topology_get_dss_per_group(struct xe_gt *gt);
> +
>  unsigned int
>  xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
