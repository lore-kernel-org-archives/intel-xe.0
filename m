Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A90C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 18:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E42E10E816;
	Fri, 22 Dec 2023 18:13:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C7D10E7EC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703268834; x=1734804834;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zadCl8UoyueKn3tD4TvpPg0S1M8FHuGm/d4F1TguJh0=;
 b=GszEfFc4ZebkVv4EE2SgWGMaGQLAo2LknTh/kx30wDNpmooCyjuBzeoY
 p3h4U8/EeakJP2vATq+jQ3MVLcXF1adETuHouvbOwykgWK2gg66mJPhvs
 2OKD5SFLv5rxQIWBkq1vgiSeg4o8gi6hWJkrPCSr+dj838upzCktGSbZK
 5KuQfC+8igQhlmhkUUZH1LMeEnwkt5ebGw+pGQszM0qIJ2AKAfdnFsaGf
 Wm2lACBFAg27KJVxkFINeRcG6yjpZAQK0hPfHdQ7P5zpOSteFzUcRlU0v
 OcXF3QVYDqMJT9wa/FtXmkw7B93fMDgLyqXiIQTN0IUSGkJmptJw9c8ma w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="375633822"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="375633822"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 10:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="753330407"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="753330407"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 10:13:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 10:13:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 10:13:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 10:13:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 10:13:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI0GvV/SgI29Rfz4GxAZor+NZkHC6WvBzuRHGNZwG7o9l29oK+Kc46jV3bAChDqqQVDUkuBvl1E34S/868dgUe74YJ4Y37S+my1Y83qFBy8DhiLlvTVHUZ5nufdTxX+WUESFpyeQegV2ipGkcBMnWHXxcbsMMYlppUO/XHN1GqSAOJ+0PYWwQrwxxnN78gy5jtmpT72FvlE1V4ldHs+uBswL/AsF61wtNkJYQQ/Jkb+zF7jVM7iMyxUixD5/RHSCDNc2sc5Gt7nBuABW8xJ0SWKJHAs4B6wRwcvuKx2RlNV4ekRLB2/cWYHCTo0g8xVUxP1omw+O0T1CG+DtNQYkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TbL47zfHqFmxM+jVOm7C7o8NoSJxJcIdYEUpFTOUFE=;
 b=D+PwMvuKfRtq6314/3Pk3eRjmmef80k9DPDeeMcEysmX6PbKW4qxEjkZLntZfa6A/WZEUBS251OG/MbWnQGJPg9ALRfLaMACPShMEBlmqrY4Q/cMS6XyyXdgT4mLOtGLLDW+wlHOJxCw180XVudpkgLDb1EFz10vnAGx4wsYj+xproYVDrVWh5ZKRXVQcfX2w0PXqs2X4BhfZYiDgjlQqhAvX8Q7cYsGmSO/1ydUTSpr/D7Cyr85kNHE1dUUBQglBtn0zVq9VM9pk/QwJdnYp2aqDq+BYoS9ls57xt5Fb/+GDmU21xzDmMaGy+IkBiMwuGJsUOguj4UnrS2xpc1uHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 18:13:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::48d6:d63b:c2a0:e07]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::48d6:d63b:c2a0:e07%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 18:13:51 +0000
Date: Fri, 22 Dec 2023 10:13:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: Re: [PATCH] drm/xe: Add mocs reset kunit
Message-ID: <20231222181348.GP1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231222015223.815147-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231222015223.815147-1-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 05442fc1-657a-4747-d096-08dc0319bfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGtpvSfyXvRG4cBKEB4MeZil4olqd/XciXTXfhFJSySsDr5Qj5cnpHALNEFUA/AS4V7fGhrIdPzQXCv38FPsypKZosH1pKYlVVafwfvkmy6ko86YCd4vbgV8A5s+Vh5UaqAp82RXrKRVrqKKnNqhYh72560iyirHv9fOvPc7MmeokdSD38+9yTvKKIddyfQC7dFoKACRo9asA7c4thRAcljE4ONhZGz8c0RTUP1EV5UuRrVzmkcuGEYTF4Www2Gk6MRXxkDbX1KULm64SgOWZ6LVFuEC4tb+Sr8FRlgT8Q9ev62hlcr9bYqRYn9PtgzFPPuS6IIQRNOou1wZZR3zxr3cIZfFmfp6ODEtPTs8W5bMwICnGxC0R+D+aoWZDJoX79V5EOo1HOvOgY1x7NSuNasFlUvR/stnJyLW0cm71geIt0Nvdy7aIZ4JbduVoyq00sh5gwrXacejBWypSqVBZGhdhfl4Q4T4DaJkmDWxhr/3BddlV7pgWDZuQuoX8bIx0oypTX10v5qoc8+476m04DG04gk8tHLiYQxpv2z0vNV/cS1AwKPkwiGiL+k6nYCh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(107886003)(6486002)(33656002)(38100700002)(41300700001)(82960400001)(86362001)(5660300002)(6666004)(66476007)(66556008)(8936002)(6636002)(66946007)(8676002)(6862004)(6512007)(316002)(4326008)(478600001)(6506007)(2906002)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKupZAEQcO9W1Uaewk4m9ozdnIYaAsnR54vJS+gGHnkN1uEh9GxlhhuZLROt?=
 =?us-ascii?Q?qcwJyr11JBOfD5L1fTqwWdvA05BP3U3w62HmPOoSmqGNw44PrLNCMN5mEcMu?=
 =?us-ascii?Q?syKB3UypMTINkAcKRn28Ke2Ppp+nyFFGE9h94x+pp2lEF3uqiGZB1YIJXfAF?=
 =?us-ascii?Q?8NpdG6XWa7+Co4uoUPfuxy2CrkAN0nvo3YWLS80p+Ofot5FTwpDNVk1/vv2S?=
 =?us-ascii?Q?Pd7tcyW6IjBfa0s4q7fP360Y37WSr+DoPgD6Wao53TXSSO3vky0wxvHafWU0?=
 =?us-ascii?Q?xkxHi4sAnDgXiku2vQjYyVYBFWyR+hsSyEMuyBneWjVIPliBliZu9BKIcTIq?=
 =?us-ascii?Q?XaBGCZmPq+y4Ijgr+HTaMihF0UrYxwihJ9DLv0Wrthufp4Oo8JWzYYLKQPzH?=
 =?us-ascii?Q?s/koNxlCHcLpoztzhaiFvl3VBJHTzHaaCV0Wp5dxz0uCE8ORBRzy5NyTMLYo?=
 =?us-ascii?Q?+SHhWkJSj6yN3HtvNr46198RCKc/8cm3netFMn3mlYX8HjGgi4w3aI+nf8oC?=
 =?us-ascii?Q?cBUN+kDDEaqnAHSzrTuoSnBeoZ72x0CAYwlM8psHtZkU4ljYltL+xniCEEoi?=
 =?us-ascii?Q?bA2ZyOr0V0HMTK7lsSpC0UHIlQR2uuTzn8tzh/LxfG04bQjlnVkoW2Uxpg0e?=
 =?us-ascii?Q?i6XTBfc3kt3lnlgDOHRMWPw1URLqlzdWMai3qNP+L4hDMGDU+5dT640YOnsj?=
 =?us-ascii?Q?8Bpd4ekbUgCLQ3UtTiApCB+IpHrIKfKq51c3C9L4BsEwcME9UwZhmuO+Y+0i?=
 =?us-ascii?Q?hlccc7PoIfZrr0apBhFzSHgsEyCV6iYZxdBjyULAeevxYvrmzi2iWZ0w3cGT?=
 =?us-ascii?Q?VoAeS68w66quUJsF1H5eMdz1WqBSThGWkI4hBP0fZO1/H5V0acHAir2WPyYP?=
 =?us-ascii?Q?pHBryY8RVR/vC/bjDwWOVCdImKhi7LDipre9YRtLu4cH/K97iUsRnejHcT0q?=
 =?us-ascii?Q?t3SKbLBH4jl4CzwhSUTM0zjiOK7IZuC3q9Iiz7MEfeNtzNpziQwVEPIWfHUa?=
 =?us-ascii?Q?0ZRmE+uESqga1jNOusiYzi/DHwVSYLWu5tznGtSybRUyphPkmi1RUi/GIavF?=
 =?us-ascii?Q?dFFU87bCIh/BrjJ3zwafX6PkOTWgkKZFTw7Wmld+kp/lEd4YdOAxZmX8TTlT?=
 =?us-ascii?Q?l2xBOO6f+yNZXFURvo3HeKS2Y7ZBKuj0R582soWecteyYsWgraprrIPKGSLo?=
 =?us-ascii?Q?3IrVIY2aJQEYqKVejDGBrzR6XAIjiJJ9U7BOzz0lnFPuijVN59j9kJj4+CYV?=
 =?us-ascii?Q?mfYvazAEMlbz/ZltRwhEH4ECiLyAJQdQ1ZAEsGfIs8arwh/h0eJ1tlz7B3RS?=
 =?us-ascii?Q?pUErttJlBoXA1fdGn1qRvd1owQXO0f2VawpwO7B5LnpZtMvzo0doog29gwtb?=
 =?us-ascii?Q?HEVgskwSPuieiSscMoVRtRGzHBWecstWW8ahjd4WdoouUHyzGy4av/nzYjBT?=
 =?us-ascii?Q?e/mvRYnJBd3u+lj4Bs5Q0/2zWzCQDaN82F47IlLjWRhtkgj5uYtF+7S3JH4m?=
 =?us-ascii?Q?kLMa/6348EbTjxgf/0Vsy9hawoBRdznODRlV3uLq55e2/7EOQzlUC0mHkXDX?=
 =?us-ascii?Q?sHYEdSRwxxkuHZrv02TLA0KRxLIjw+0DoKuH04cVAqjD76+UC0NJm0fLs/3a?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05442fc1-657a-4747-d096-08dc0319bfb1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 18:13:51.0016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5aBZyqYlVjtuzWxgWnAA5Mlus8T7TnW/GO1BKmGdj05/IHmnOo2dBy2sbWlV51AQ3QCLQ5P0q6Y3uXGVHLMDnBTNrgnlctCQJLIIP6YnkNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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
Cc: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 07:22:23AM +0530, Janga Rahul Kumar wrote:
> From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> 
> This kunit verifies the mocs registers content
> with the KMD programmed values before and after
> GT reset.
> 
> Cc: Mathew D Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c      | 38 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
>  drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 7dd34f94e809..98dd63031c5c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -128,3 +128,41 @@ void xe_live_mocs_kernel_kunit(struct kunit *test)
>  	xe_call_for_each_device(mocs_kernel_test_run_device);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> +
> +static int mocs_reset_test_run_device(struct xe_device *xe)
> +{
> +	/* Check the mocs setup is retained over GT reset */
> +
> +	struct live_mocs mocs;
> +	struct xe_gt *gt;
> +
> +	unsigned int flags;
> +	int id;
> +

Minor nitpick:  there probably shouldn't be extra blank lines between
the various local variables definitions here.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	struct kunit *test = xe_cur_kunit();
> +
> +	for_each_gt(gt, xe, id) {
> +		flags = live_mocs_init(&mocs, gt);
> +		kunit_info(test, "mocs_reset_test before reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +
> +		xe_gt_reset_async(gt);
> +		flush_work(&gt->reset.worker);
> +
> +		kunit_info(test, "mocs_reset_test after reset\n");
> +		if (flags & HAS_GLOBAL_MOCS)
> +			read_mocs_table(gt, &mocs.table);
> +		if (flags & HAS_LNCF_MOCS)
> +			read_l3cc_table(gt, &mocs.table);
> +	}
> +	return 0;
> +}
> +
> +void xe_live_mocs_reset_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(mocs_reset_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> index ef56bd517b28..4f62e7a4270b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> @@ -9,6 +9,7 @@
>  
>  static struct kunit_case xe_mocs_tests[] = {
>  	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> +	KUNIT_CASE(xe_live_mocs_reset_kunit),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> index 7faa3575e6c3..e7699d495411 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> @@ -9,5 +9,6 @@
>  struct kunit;
>  
>  void xe_live_mocs_kernel_kunit(struct kunit *test);
> +void xe_live_mocs_reset_kunit(struct kunit *test);
>  
>  #endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
