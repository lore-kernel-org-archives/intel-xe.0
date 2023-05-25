Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1686C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A599710E784;
	Thu, 25 May 2023 22:39:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E9410E784
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685054384; x=1716590384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xqPbjmxRz+Y6wg4YscEpJYVnedFDLF4L4wCdXF598As=;
 b=L7y7kRi75G43NJ/Cfcqael+BNnKEfUtLYtSetAzG7iq8oOz5unRuO8oA
 fXXj2zdj7OlcngyPbPgFLye671XU8ODtIUZaXmH1p+PpiOOi062tju/K4
 JZqrh0rDu4wf6xEyI4kbjuMuegxSdC8PEAFNb/FC06cIE6OuXf+zu6l22
 cCNlMDcZpTk+jQ6ZyOdHM1QAWHWEVLVK5hHx5BgPgw3R0uwQAY15+9Rxn
 r0x6rksBuDANk4IyZedeKmQe6aBEoNEGZxVMT6YT6kBZXKNhdx4UUO5nz
 8c31XnShXCpsSQ+Vph2wJZPbK1VAtcSea3psMSTPmCjNQGWlSZ/cJV79z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334393723"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334393723"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="829278133"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="829278133"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 25 May 2023 15:39:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:39:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:39:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYjLHrIJOvTgedCfBrogV8a7Y4sQ8benqg0etoS5d7snRaDwhof88301gan8C/uqOdTb4LhyZSS6vj/asA30MtptF/uUrwhMEHbg+nIryrARDmnb4SIIizFcQ7plEKXMm2xiFhpxRwE4YG28Me7pRoKbnJ2fdrGCDiOSKfoKtK6zOY5u9DpdXOvnvUHySo++s4tKo/ZmWPyWTzmQFVNbDNvevQT349R41D4Dy3Fk8fECD99CWnkB5gHgmmjm31+JJeXyzcsEAMIAyDBrGWE02d+GY7/KdnUtzZLtLdoPO19ue8JQ2GULqEmquOL7QOfC9X+D1ubxnFPaZ+mjPFnr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqnL14Km6ab9OZWr0cgXR5ieUVJIBEoqWCW6n8tkxR8=;
 b=Apbv1+427qWczqxSdTz35ckGuEfAMA1IqbnNhqh29DVmo3uLCcodmBwsa2NNDyreeg45CwgcnEmjjQUiD7IgCQ6BpFLpqTduXk1Luj4rtnNjedVHwtPA6YByDsWJvdOwGtsLPZEcag7qUN095rBU9sFWlkgtOM8w0CwR1hYTnGLMjsWB/I/2MmyK1SDSirCfhzyXplwLrDWc9Jg5JNdiq8GEUaoNt1vtj7K+Sau10SUoa7FiG1yJhm678nX/FU8oo2I0pV3rh78jez9cV5IAYpDY6Qi6d0xjC5YZZr/2vpMG79sD2fT6I1mqaC5AGyIUKnFLYm9+GD96tlGn1Fqnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 22:39:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:39:40 +0000
Date: Thu, 25 May 2023 15:39:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525223936.GX10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 903266bb-4d93-4d70-b1db-08db5d70ecd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhQoKsci0xSDxgVoFzF0fBxNAYHAz6FjRdatsBIKBQuNpKVqXytrceFbP6cuc2ZB6qkpATUqCfQ/+asqCYkJ7vzOMCc0E/tsCRaVsH2+/E9P9BRgZbh5c/kj+TRXkvhU3iqitXO/jXBf3w0LFMvLV9Kqsy+sQLwqOZozwW63IfUJuuM8wSI/nVSBIHJ6u7YSQEkQCkllEH774Bej/hgaQpKioRQergelvqWxqoICKATErpBJyUC46vsnyVGr3W20pQz6vsUFCOZvEVjtLakMatYsQUqSUE9PGHmmqA6gJ48+rSZR+VATn+EVDqrUSkUeUc0KlYQ2L5Rk3vjcq8nsjzpRJfhF6HcWjmbCi6OMviwjECvb2tkXt7fvUQBSnVAHN2+t72iYP3aghBJ0koJCaVDh/USgR8dMp3eFtfUCrLTjnKlDnobJl5xbdK3C8zQFB2KXCFz0WCof4dZ6wzoiKPPGYBVTJXbPaPE7ZltSh7OzS8i3BQiv9pAE+xFLy21/4AiY+91fznccbYvvnXnefIJbZCBpq3jSLTGJeZVyZoQKOlUse4wwbMSGjh8jL6vy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(66476007)(4326008)(66946007)(66556008)(2906002)(5660300002)(41300700001)(6636002)(316002)(8936002)(8676002)(6862004)(6666004)(6486002)(478600001)(26005)(6512007)(1076003)(186003)(83380400001)(33656002)(6506007)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75kCB2EXjSTSCAerv/ujUBx9u6nPN6qBEjz0HmRD5xLvP7zcRc5EVk+A7oWM?=
 =?us-ascii?Q?ZNu7CcIdPyIlPtthsJFkURNz9s+rEE9Qdx1JYaloUyhKl+id13i3Ted83lDB?=
 =?us-ascii?Q?EWebPBWROCxqd8Eq5C0MYWutqYMllb5ZabQvXajdxJh8I1CAd2o3QOIex2CD?=
 =?us-ascii?Q?fCLpzaUl9fgBAtLlH31m9dRNSa/UyPMXamha+robexVEuE/ok7RUthWpRir5?=
 =?us-ascii?Q?UnQz8t8zTFzac0DMCTsor3zuiR5muEumsVV49dy/hTUr8Yzp1HhtN7Ry6Bum?=
 =?us-ascii?Q?XXDJ4qH8dFAagei2SfJbD37rtBVt1FtJut5y8tUZN5mvhoTQHTtKfTq1tr9D?=
 =?us-ascii?Q?HKZ1rxo9jzh6qh+kbA84dgihpCDomqyo5XGz+ii8KVBdLv5Ryv/y4CL6ZpQv?=
 =?us-ascii?Q?IrLSKD8EPkkbBOiVB3FUx+KuysiVSucd1thsyRwnU2h6rEX8Ii1VNfg5h+Hm?=
 =?us-ascii?Q?LS3Ya6I8mWjg5QcSGKuxTLi3j5ZKUzoqkB7HR1ttFWITStGdiAdB8vmCEabf?=
 =?us-ascii?Q?ftrx2t4aSDtE0smqYri3AnVtTLPKyZjz/noslC+EmQRgi3wk43mOrhnn91Z3?=
 =?us-ascii?Q?gJIh59+eK47BUuGaRGQWbECi1hS1BlK4mehTqWH7TYb4V7QPXwohG91tJ1Fp?=
 =?us-ascii?Q?Q7QucPqq63ZB8pNt+vdb1UJ3++elEcWCsAqdv4OdTXpeeikzwk9bTD5bd8Km?=
 =?us-ascii?Q?yVwnX6KibQYyQs4HlgYlQXJVbX5nw0DU6lR7aDq1CDHvLqlg6xCunn0V3aB8?=
 =?us-ascii?Q?NAUC8CiSpewFchmMs0MSIjg867U9AddHzo9oy/c0WT+5d9SBq7u01H55CCzl?=
 =?us-ascii?Q?MYUL26uHJHvbilwBCNBbZaDAqaXOBH1/tryeCO/bOSz1j55RUZy0TFZm0vrg?=
 =?us-ascii?Q?AVW14KKkNSOer9xU9aafolXyKVDNG/wp8VyO8lG6x5kRTxdEigvPqyTkyuk8?=
 =?us-ascii?Q?/vmCFkNu0+TNuUXgIIqXGIWIiH4G5O3glL1HtvL8/u9lxKSxS/k63lGIfr0/?=
 =?us-ascii?Q?nfcJBSaCQimWNEVM9IjCuvkNwxMuIhZuovIFiE9l26tXJsnIGINAZSco/0E3?=
 =?us-ascii?Q?5jrlMAONgd9XRw/p6SMpk1oRkY00BpUTYciy3v6Wzk2ws5sBvlQhWMeIxvjp?=
 =?us-ascii?Q?lNCx68B6vFjWSwf3gXIj9YLTAWt9i+/v1VWASPd93DYOvkZVy028U++f+sbu?=
 =?us-ascii?Q?B5jiGlAhZsLfNsmyHfhDvmZPFHPhkdm/q3qYCP2Q8oCz9pGXkrda464GC/9q?=
 =?us-ascii?Q?BN8p04ZAJ3xzJmP+M3sxkPpNZ9lJeYd6c9xNS/UaKNhFZcZAsB9SoWqtlUIU?=
 =?us-ascii?Q?nr9F7B37jbqKyh2NonlfPcFP/p3yDxcSZWutXsso6A3fyJI/mDggYjzncP3I?=
 =?us-ascii?Q?bdOPZoPFVm2tAgaAl6vpAYUot7CsSM72TXpWd8pkiTsq+9Ekjhpisn5CguxL?=
 =?us-ascii?Q?ybnhbSnyt39SH55Nux24Q9/Xe4FE0XpgWVwgnIhWgw+tiB9PautAaRAi9eMn?=
 =?us-ascii?Q?e9yFZVxg7PLuyZDPDbzjOTClUrSnBDbKmZ1/MNhYmsMK2+84yTWOZEEZnaiR?=
 =?us-ascii?Q?4XCja04U2F/gH7jrkzymh3P2wuDyC7emw5NLkWbETQVm1LMhFayqLvmk1IaD?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 903266bb-4d93-4d70-b1db-08db5d70ecd0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:39:39.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYkwYQpNBrLLD0sxaUfHiKTi/tgykOiTNoP0tUy9jzAemzP0TGVnSuH0LGkKhTBvRraYctPuBL7TQeESK3j+mUpcck+wtlhQQ1a9wJDEjZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 09/21] drm/xe/rtp: Add check for media
 stepping
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

On Thu, May 25, 2023 at 02:33:55PM -0700, Lucas De Marchi wrote:
> Start differentiating the media and graphics stepping as it will be
> important for MTL. Note that RTP is still not prepared to handle the
> different types of GT, i.e. checking for graphics version/range/stepping
> on a media gt or vice versa still matches regardless of the gt being
> passed as parameter. Changing it to accommodate MTL is left for a future
> patch.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

As you noted, we can check that the current GT is of the proper type in
a future patch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c       | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_rtp.h       | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
>  3 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 2ac7b47942fe..70769852a93d 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -43,13 +43,16 @@ static bool rule_matches(const struct xe_device *xe,
>  				xe->info.subplatform == r->subplatform;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
> -			/* TODO: match display */
>  			match = xe->info.graphics_verx100 == r->ver_start;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>  			match = xe->info.graphics_verx100 >= r->ver_start &&
>  				xe->info.graphics_verx100 <= r->ver_end;
>  			break;
> +		case XE_RTP_MATCH_GRAPHICS_STEP:
> +			match = xe->info.step.graphics >= r->step_start &&
> +				xe->info.step.graphics < r->step_end;
> +			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION:
>  			match = xe->info.media_verx100 == r->ver_start;
>  			break;
> @@ -57,10 +60,9 @@ static bool rule_matches(const struct xe_device *xe,
>  			match = xe->info.media_verx100 >= r->ver_start &&
>  				xe->info.media_verx100 <= r->ver_end;
>  			break;
> -		case XE_RTP_MATCH_GRAPHICS_STEP:
> -			/* TODO: match media/display */
> -			match = xe->info.step.graphics >= r->step_start &&
> -				xe->info.step.graphics < r->step_end;
> +		case XE_RTP_MATCH_MEDIA_STEP:
> +			match = xe->info.step.media >= r->step_start &&
> +				xe->info.step.media < r->step_end;
>  			break;
>  		case XE_RTP_MATCH_INTEGRATED:
>  			match = !xe->info.is_dgfx;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 7ba9d2ecab92..d55701d2f39b 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -39,6 +39,10 @@ struct xe_reg_sr;
>  	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
>  	  .step_start = start__, .step_end = end__ }
>  
> +#define _XE_RTP_RULE_MEDIA_STEP(start__, end__)					\
> +	{ .match_type = XE_RTP_MATCH_MEDIA_STEP,				\
> +	  .step_start = start__, .step_end = end__ }
> +
>  #define _XE_RTP_RULE_ENGINE_CLASS(cls__)					\
>  	{ .match_type = XE_RTP_MATCH_ENGINE_CLASS,				\
>  	  .engine_class = (cls__) }
> @@ -75,6 +79,19 @@ struct xe_reg_sr;
>  #define XE_RTP_RULE_GRAPHICS_STEP(start_, end_)					\
>  	_XE_RTP_RULE_GRAPHICS_STEP(STEP_##start_, STEP_##end_)
>  
> +/**
> + * XE_RTP_RULE_MEDIA_STEP - Create rule matching media stepping
> + * @start_: First stepping matching the rule
> + * @end_: First stepping that does not match the rule
> + *
> + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
> + * on the left, exclusive on the right.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_MEDIA_STEP(start_, end_)					\
> +	_XE_RTP_RULE_MEDIA_STEP(STEP_##start_, STEP_##end_)
> +
>  /**
>   * XE_RTP_RULE_ENGINE_CLASS - Create rule matching an engine class
>   * @cls_: Engine class to match
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 52adbf7de752..af49cbf98407 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -42,6 +42,7 @@ enum {
>  	XE_RTP_MATCH_GRAPHICS_STEP,
>  	XE_RTP_MATCH_MEDIA_VERSION,
>  	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
> +	XE_RTP_MATCH_MEDIA_STEP,
>  	XE_RTP_MATCH_INTEGRATED,
>  	XE_RTP_MATCH_DISCRETE,
>  	XE_RTP_MATCH_ENGINE_CLASS,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
