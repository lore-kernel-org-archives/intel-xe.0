Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55732C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1352410E826;
	Fri, 26 May 2023 16:55:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850410E826
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685120103; x=1716656103;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RgGewnFzb3Lg0EVp+o8g53tqqZm4MBxMow6r6e5xboY=;
 b=OwSZ8Wz/aPcpLr659UHFjSua9JQE1JjY7rhHqLfS5KEoNqq0hSHjWf/m
 XzVeY6GYFvP09A+w4qGRUyFHHgI+0ZzceUPONxMghcasVT0MmhZD3NtTU
 wF3484x8/3C609geCUVqQGkUIS9jSQVK/NSfBh1FiajYZeyiuMG2oeKPl
 eF0Bq73z2UErTIgf+j6AbuXvEj94rsDRgJsT8s8S1gYB5Ufi9V0d5bon0
 UneHebdD2ctkMRdDd/ppfGL3mZ5zUEmM1f/QQH/1EHviTgqQuoK/tBfoJ
 +z4iCGTXRXKPdRTFOAsSmGXb2VXQYRRuYhMqPRL/jJ30pGUyUjMD0aGcP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353090345"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353090345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829558920"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="829558920"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 09:55:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:55:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:55:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 09:55:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 09:55:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IASSmKqj6Ef+DbPd0wRtlYb0jDJZN027qgNoqWYPuUqnKUVFSxzCxXsbT1K+sFTCrwXMB12xBNxNocBNiD1IZjWM//2IyUwn6sbAp91m4NnxIQfjnpmrim6J8HGnk+hFVLO29If7w/cKRgvCTD1aMXACqocVbchBT/veW0lMw3I55HY/95wmYhGfR3TW26X3ReIZRh8XCHJ0f1a/Tq+2UbwChP8+tNHHwgLai7sGK0xcBWckalH8lcspKfyge2p9JIqD29KnNcOTJq7HHBk5j61wPdbH6jvKzKCmmr54hT68W/QqjGwcCJdwgYg0fRgTMUJgmB+UEhvmNzljAu3Ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2WqDlEmhtkBuVjNDFJkzxeZ8O/fLvtlRq311sMC7ZA=;
 b=KulQzX0qwjTK9Ao1A7JHBtN9b4ZRZONUdIt6W+HLAEc7IBHiD97WzhxmriCdazOXobhyi0vpyxmif85p1w56UuiIrIpWDVbNaQEZSriwh9JegXsZ4NnOfLZOVuJiAkZMVh3md0ifEJ1o7CT+cxGAyCqs7SwhwdqTOLJ4qGGUz+ANGwinirDfWv4Ud6Mz4xhOArdKJeaEQ3YuBHlMGf81I6S2YnOR5JfVV+usTC7CEqTKuBTGN4Yv2l4YBbQZGcORVZysTOuD4Nyr8cou/2AQPitcAD8HznbZkWsEdE9xTn89Gx++t61MQ8LkhT5y6/bCuO/OKkmNb+UlnP/tp1obmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Fri, 26 May 2023 16:54:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 16:54:56 +0000
Date: Fri, 26 May 2023 09:54:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230526165452.GC1217712@mdroper-desk1.amr.corp.intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
 <20230526164358.86393-18-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230526164358.86393-18-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: e18a0a27-23bc-45c3-d01c-08db5e09eeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqIIDe6W6kHJO5NGhYEWbevwrjlICfmb8vObuFKsY87heFAN2LmxGoBsOgdz7zxgOMGrqHKvl72VihjKIOBxdKsVmfi8W5a53M9RjY2Lj9CNgvrhjzjJPO2VYT4uSrrWB+s1+qcqB2DpHfuaevhNYtrAwILyArRWGcHARrSMICG8ymYxCKCqddRjq2UAhF09FnoSjVOUs9ph1sgKITVRHaTNYJl5XMScjzDRKNayLW7/wUhU4FgHz9/g10Rr0pJlFHfq4VISMdwqt5TMp9eDKNOjQGiqwCzIcl4n9+ani3bH8k7a+HkU2gbnf7U23lO/JloQQHcIQMCU1MYFsWnWKXsQvmh5oBSDC84a0kQUT63IIPZnDjb0hsuVIeHxKKFyqd+JzB3kAKRX6NETcBa2BYtrOtNuhKYwOwicRMivGt/atC62ikpi9CB1bJQ++73IHQOuixVx7ss4sKaoCkptXZVjazkP4gzm5MAGig6enWYvHv92ye+Dd3AbX79ldjebRaU4qHSz4EnWUE/bK+JDyMylB/NRKOcgCkfM4KIrw6/66C/iq6S2yBMCRjMV2/vO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(83380400001)(2906002)(33656002)(86362001)(82960400001)(38100700002)(186003)(6666004)(8936002)(316002)(8676002)(41300700001)(6862004)(5660300002)(478600001)(6486002)(4326008)(6636002)(1076003)(66556008)(26005)(66946007)(6506007)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JiJJzQsJs28OjmMd/wPhuk+5oM1NWYq8ccySnM3E1ChdvbkmFgZZQETuIwN8?=
 =?us-ascii?Q?JSN+ZmL/XqLmjzrDg/B6roBT08ccPCqU/DVaW/2DbWFk7ciqoUvBCFu69SAj?=
 =?us-ascii?Q?KrQZANBWgPKUHuN2RpQm2g5CfhLGq5oGcBJzj1Op5xBX3c1o6OaGApLXEhQH?=
 =?us-ascii?Q?TPYN897+VKoUBBA2ZlX2pKpCKK6ItbLKHcUAvFylQBaawn0Krw1QomFiWVs3?=
 =?us-ascii?Q?8gaonClE6MltgUnvUkyulua7IrG8bQdp8LgIHnrhSV5fFJJCel+O6capHI+n?=
 =?us-ascii?Q?APcZ8Ybo4lpvFiAGCfXvMFZJJHkfOlO53qEzJ9OeeMV96EVIIOVViqRM/AOT?=
 =?us-ascii?Q?qMrPCu0RoyPKEODe9770erLZ6fTKqxKy0+2ZR76M+kZU7WC31PYbXam/Q+7O?=
 =?us-ascii?Q?Jqmv3ZeF7hwKgscbxEiIuTGCExSJ8JOs6BrgLrMqo7ZNgjdhKqxdkojNV8iX?=
 =?us-ascii?Q?h9eBVUODzS7mvBtanQP7aUxHg0yP4UD/yJd6xtskI0ZPlr9Qd5uTKeTRBo1x?=
 =?us-ascii?Q?Wflt5nCSUq61PZOn/6fbPFt9j9HvG4riKO09RZaimglyV45MdpHSNZfVFzLv?=
 =?us-ascii?Q?Cz9vIjR4xnAz5//7CwiVIWSO6N3vOizlBjqhFOrozdFEopLOZZ2gKKdfxQAK?=
 =?us-ascii?Q?Fi7ycSy1jrjEnoiFxdoYy5gjNLIVbirhjkAiEeOGLG8AH96HgNh5JTs3k6l/?=
 =?us-ascii?Q?9lNV0S6c4ZeJlEJ2d5Eu9wpL3FHT5e/iCPdNvDNCZq+MhWyaXOvPSz5ptz4j?=
 =?us-ascii?Q?aLpQGhCP5zpZJOlbbqXP2SineKbzHlqPsqefRJLDdeGoS3/kmxwVFz2Mo2s3?=
 =?us-ascii?Q?V/3w3jj8yj9IBEpvGI50txj3q4lY2CJt2aijcaEMD4AYp/LgcXXK5Hv1G/aH?=
 =?us-ascii?Q?EacVnvUW+orgmRbjE0nN6U7gF7g4IvC1dv86MSst/TVziilOx+IPrggYls21?=
 =?us-ascii?Q?GptCCXkjedwf23PTkGKJ1fciYhtY5u9r1VdYvRgaIuU7Ux2ramgUuGkrzLM+?=
 =?us-ascii?Q?DZ3gcUBOn/WV3tEco4oNR8Fq+N4Tg+RtGzJxvDsWOqzFwclPuprEP8r0fs8d?=
 =?us-ascii?Q?DYFck3oLh8o30+FpCBHZ/BXhqhu4NPFIwlm85HnZUmnB4e840h82ajI2IsU2?=
 =?us-ascii?Q?6qrn55/HatYsuMuqva64pprNM9d5q6Vfi2yqbvgle7ibejMlZluj5CbrBHWR?=
 =?us-ascii?Q?s4LevqSAQb7YGJ3C2bRrQoeAVuOEsn052xRE3Df/lWXw1OEgwhvDFaWYTrK1?=
 =?us-ascii?Q?YIvbjZNjAwbls98o6I6SGKQSAuOXAeZyz9M07zfXMybn+8Uvykz37b7WQEtG?=
 =?us-ascii?Q?wGmo6fcgfGd3Vw5QMBkwyaIwfk5BXnShk1PRE1U/omte6fjQkunBUAlrPQip?=
 =?us-ascii?Q?e2yUl0hFKijGFRt6O8XzpcQ4pGFFf/hwyjP5wKtgNYax7d2nPFgZGIAu71bx?=
 =?us-ascii?Q?vRI1Cb9N1pHxO4U8Nh+W5YphAWBoMgCQ1R0gQX08ldxYQQFNNnX1j9mBTXYp?=
 =?us-ascii?Q?8oKBV8/d+NFKico8qeyYj5XLa8cdTkcWCcHtcvexDdYTYMsRia14qVtQqFKJ?=
 =?us-ascii?Q?Dbq97XXZGyUeyI5E8G1XA4Wl8+zdtp/n817Yx/7GTajPhelxhCI74+rR1ImP?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18a0a27-23bc-45c3-d01c-08db5e09eeed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:54:56.1811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAzGM+jbmOLKZDYUzVU1HQ3jqcnHR9jPSe05dths80NHgESlYr0pVJbsJlVp8yZKAmWunBbEis+OkAVobQexGwqnbd53nie1b82gNmtFz7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 17/21] drm/xe/guc: Port
 Wa_22012727170/Wa_22012727685 to xe_wa
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

On Fri, May 26, 2023 at 09:43:54AM -0700, Lucas De Marchi wrote:
> Wa_22012727170 and Wa_22012727685 apply to DG2 using the same action and
> conditions. Add both to the oob rules so they are both reported as
> active.
> 
> Do not Wa_22012727170 to PVC and MTL since only early A* steppings are
> affected.
> 
> v2: Remove DG2_G10 from Wa_22012727685 to match current WA database
>     (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 8 +-------
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +++
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5eccc4b67381..1291f71348db 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -161,13 +161,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 16011777198))
>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>  
> -	/*
> -	 * Wa_22012727170
> -	 * Wa_22012727685
> -	 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> -				STEP_FOREVER))
> +	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
>  	/* Wa_16015675438, Wa_18020744125 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 3d4304b7111e..ac3715e215f2 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -4,3 +4,6 @@
>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>  16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
> +22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)

Can we leave off the GRAPHICS_STEP here?  A0..forever is everything.

> +22012727685	SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)

Ditto.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
